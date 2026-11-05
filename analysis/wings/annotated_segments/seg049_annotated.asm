seg049		segment	para public 'CODE' use16
		assume cs:seg049
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 29h, 8Bh, 44h, 29h, 40h, 89h, 44h, 33h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_AcquireOwnership_B3610 (sub_B3610 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_AcquireOwnership_A1240 (sub_A1240 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; verrou d'exclusion mutuelle pour ce module d'écran : si aucun propriétaire (word_6FE72==0),
; prend possession (dx) et désactive l'animation de défilement de texte (byte_72E70=0,
; TextScrollDisplayB_ApplyHelperD_67F60, seg209). Appelée par la quasi-totalité des fonctions
; de dessin de ce segment.
; ==============================================================================================
PaletteScreen_AcquireOwnership_2197B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_5BEFE, 0
		jnz	short loc_21996
		mov	word_5BEFE, dx
		mov	byte_6065A, 0
		call	TextScrollDisplayB_ApplyHelperD_571DE

loc_21996:
		pop	bp
		retf
PaletteScreen_AcquireOwnership_2197B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseOwnership_B362D (sub_B362D de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_ReleaseOwnership_A125D (sub_A125D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; symétrique de PaletteScreen_AcquireOwnership_A1240 : libère si possédant (dx), réactive
; l'animation de défilement (TextScrollDisplayB_ApplyHelperC_67F26, byte_72E70=1).
; ==============================================================================================
PaletteScreen_ReleaseOwnership_21998		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_5BEFE, dx
		jnz	short loc_219B4
		mov	word_5BEFE, 0
		call	TextScrollDisplayB_ApplyHelperC_571A4
		mov	byte_6065A, 1

loc_219B4:
		pop	bp
		retf
PaletteScreen_ReleaseOwnership_21998		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_SetFlagBit0_B364B (sub_B364B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_SetFlagBit0_F898 (sub_F898 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_SetFlagBit0_A127B (sub_A127B de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, pose le bit 0
; du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_219B6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 1
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_219B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_ClearFlagBit0_B3659 (sub_B3659 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_ClearFlagBit0_F8A6 (sub_F8A6 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_ClearFlagBit0_A1289 (sub_A1289 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; efface le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_ClearFlagBit0_219C4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		and	byte ptr [si+10h], 0FEh
		pop	si
		pop	bp
		retf
Widget_ClearFlagBit0_219C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_TranslateBounds_B3667 (sub_B3667 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_TranslateBounds_F8B4 (sub_F8B4 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_TranslateBounds_A1297 (sub_A1297 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; translate les 2 coins d'un rectangle de widget (+4/+6/+8/+0xA) par un décalage (dx,cx).
; ==============================================================================================
Widget_TranslateBounds_219D2		proc far

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
Widget_TranslateBounds_219D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_219EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_219EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_219F8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_219F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21A00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_21A00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch18_B369D (sub_B369D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_Method_Dispatch18_A12CD (sub_A12CD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x18] (champ
; +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_21A08		proc far

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
Widget_Method_Dispatch18_21A08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21A1A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_21A1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21A24		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_21A24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21A2E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_21A2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ComputeCurvePointA_B36CB (sub_B36CB de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ComputeCurvePointA_A12FB (sub_A12FB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 61 lignes, NON DÉTAILLÉE — appelle un ensemble de points de contrôle pour l'interpolation de
; courbe (motif partagé avec PaletteScreen_ComputeCurvePoint_A1430).
; ==============================================================================================
PaletteScreen_ComputeCurvePointA_21A36		proc far

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

loc_21A54:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_21A84
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21A84
		lea	ax, [bp+var_10]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_21A84

loc_21A84:
		mov	eax, dword_5E7D3
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		add	[bp+var_C], 2
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_21A54
		mov	eax, [bp+var_C]
		shld	edx, eax, 10h
		leave
		retf
PaletteScreen_ComputeCurvePointA_21A36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawCurveShape_B3745 (sub_B3745 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à PaletteScreen_DrawCurveShape_F9A4 (sub_F9A4 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à PaletteScreen_DrawCurveShape_A1375
; (sub_A1375 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, trace une forme courbe en 4 segments via Render_ClipAndDrawLineVariant_62EC8
; (seg183) — probable dessin d'un graphe/jauge en arc.
; ==============================================================================================
PaletteScreen_DrawCurveShape_21AB0		proc far

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
		push	word_5DD44
		call	sub_4AF06
		add	sp, 0Ch
		push	0FFh
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]
		push	word_5DD44
		call	sub_4AF06
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	si
		mov	ax, di
		inc	ax
		push	ax
		push	si
		push	word_5DD44
		call	sub_4AF06
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, si
		inc	ax
		push	ax
		push	word_5DD44
		call	sub_4AF06
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveShape_21AB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_SetDACRegister_B37CF (sub_B37CF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_SetDACRegister_A13FF (sub_A13FF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit un registre DAC de palette
; VGA (int 10h, fonction 1010h — SET INDIVIDUAL DAC REGISTER).
; ==============================================================================================
Palette_SetDACRegister_21B3A		proc far

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
Palette_SetDACRegister_21B3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_GetDACRegister_B37E5 (sub_B37E5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_GetDACRegister_A1415 (sub_A1415 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lit un registre DAC de palette
; VGA (int 10h, fonction 1015h — READ INDIVIDUAL DAC REGISTER).
; ==============================================================================================
Palette_GetDACRegister_21B50		proc far

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
Palette_GetDACRegister_21B50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21B6B		proc far

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
		jmp	short loc_21BEF

loc_21B8C:
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
		jge	short loc_21BEA
		mov	si, cx
		mov	di, bx

loc_21BEA:
		inc	cx
		add	[bp+arg_0], 3

loc_21BEF:
		mov	ax, [bp+arg_0]
		cmp	ax, [bp+var_4]
		jb	short loc_21B8C
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_21B6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_ReadAllDACRegisters_B3892 (sub_B3892 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Palette_ReadAllDACRegisters_FB0A (sub_FB0A de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Palette_ReadAllDACRegisters_A14C2 (sub_A14C2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lit les 256 registres DAC par blocs de 16 (int 10h, fonction 1017h — READ BLOCK OF DAC
; REGISTERS) dans un tampon fourni.
; ==============================================================================================
Palette_ReadAllDACRegisters_21BFD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	dx, [bp+arg_0]
		xor	bx, bx
		mov	cx, 10h

loc_21C08:
		mov	ax, 1017h
		int	10h
		add	dx, 30h
		add	bx, cx
		cmp	bx, 100h
		jl	short loc_21C08
		pop	bp
		retf
Palette_ReadAllDACRegisters_21BFD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_WriteAllDACRegisters_B38AF (sub_B38AF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à Palette_WriteAllDACRegisters_FB27 (sub_FB27 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Palette_WriteAllDACRegisters_A14DF
; (sub_A14DF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, écrit les 256 registres DAC en un seul appel (int 10h, fonction 1012h — SET
; BLOCK OF DAC REGISTERS).
; ==============================================================================================
Palette_WriteAllDACRegisters_21C1A		proc far

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
Palette_WriteAllDACRegisters_21C1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_WriteSingleEntry_B38C1 (sub_B38C1 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 4 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Palette_WriteSingleEntry_A14F1 (sub_A14F1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit une entrée RGB (3 octets) à un index
; donné dans le tampon de palette de travail. Fonction très référencée (22 appels) pour
; construire un dégradé personnalisé.
; ==============================================================================================
Palette_WriteSingleEntry_21C2C		proc far

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
Palette_WriteSingleEntry_21C2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_ConvertPercentToDAC_B398B (sub_B398B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_ConvertPercentToDAC_A15BB (sub_A15BB de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, convertit 3 composantes de
; couleur (échelle 0-100) vers l'échelle DAC VGA (0-63, ×64/100) et appelle
; Palette_WriteSingleEntry_A15F9.
; ==============================================================================================
Palette_ConvertPercentToDAC_21C5B		proc far

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
		call	near ptr sub_21C99
		add	sp, 6
		leave
		retf
Palette_ConvertPercentToDAC_21C5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21C99		proc far

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
		call	near ptr Palette_ReadAllDACRegisters_21BFD
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	ss
		lea	ax, [bp+var_302]
		push	ax
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	[bp+var_2], ax
		leave
		retf
sub_21C99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21CC8		proc far

var_304		= word ptr -304h
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 304h
		mov	[bp+var_4], 0
		cmp	[bp+arg_2], 0
		jz	short loc_21CE8
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		jmp	short loc_21CFB

loc_21CE8:
		lea	ax, [bp+var_304]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		push	ss
		push	ax
		push	cs
		call	near ptr Palette_ReadAllDACRegisters_21BFD
		add	sp, 4

loc_21CFB:
		cmp	[bp+arg_0], 0
		jnz	short loc_21D04
		jmp	loc_21EFA

loc_21D04:
		push	large 0
		push	0
		push	word_5BF20
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 0
		push	0
		push	word_5BF22
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 250025h
		push	25h
		push	word_5BF24
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 29002Ch
		push	29h
		push	word_5BF26
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 310031h
		push	31h
		push	word_5BF28
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 3F003Fh
		push	3Fh
		push	word_5BF2A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 0
		push	0
		push	word_5BF00
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 2A0000h
		push	0
		push	word_5BF02
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 2Ah
		push	0
		push	word_5BF04
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 2A002Ah
		push	0
		push	word_5BF06
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 0
		push	2Ah
		push	word_5BF08
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 2A0000h
		push	2Ah
		push	word_5BF0A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 15h
		push	2Ah
		push	word_5BF0C
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 2A002Ah
		push	2Ah
		push	word_5BF0E
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 150015h
		push	15h
		push	word_5BF10
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 3F0015h
		push	15h
		push	word_5BF12
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 15003Fh
		push	15h
		push	word_5BF14
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 3F003Fh
		push	15h
		push	word_5BF16
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 150015h
		push	3Fh
		push	word_5BF18
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 3F0015h
		push	3Fh
		push	word_5BF1A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 15003Fh
		push	3Fh
		push	word_5BF1C
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large 3F003Fh
		push	3Fh
		push	word_5BF1E
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_21C2C
		add	sp, 0Ch
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteAllDACRegisters_21C1A
		add	sp, 4
		jmp	loc_21F9A

loc_21EFA:
		push	large 0
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF00, ax
		mov	word_5BF22, ax
		mov	word_5BF20, ax
		push	large 250025h
		push	25h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF24, ax
		push	large 150015h
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF10, ax
		push	large 29002Ch
		push	29h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF26, ax
		push	large 310031h
		push	31h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF28, ax
		push	large 2A002Ah
		push	2Ah
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF0E, ax
		push	large 3F003Fh
		push	3Fh
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_21B6B
		add	sp, 0Ah
		mov	word_5BF1E, ax
		mov	word_5BF2A, ax

loc_21F9A:
		leave
		retf
sub_21CC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_FormatValueDisplay_B3DF4 (sub_B3DF4 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_FormatValueDisplay_A1A24 (sub_A1A24 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 112 lignes, NON DÉTAILLÉE — alloue (sub_658) et applique un style de texte
; (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
PaletteScreen_FormatValueDisplay_21F9C		proc far

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
		jnz	short loc_21FBB
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_21FBB
		jmp	loc_22044

loc_21FBB:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		mov	word ptr [si+0Eh], 220Ch
		push	word_5DD44
		push	si
		call	TextFormat_ApplyStyleAttribute_47877
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

loc_22044:
		mov	ax, si
		pop	si
		leave
		retf
PaletteScreen_FormatValueDisplay_21F9C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_SetFlagBit0_B3EA1 (sub_B3EA1 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Widget_SetFlagBit0_F898 (sub_F898 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Widget_SetFlagBit0_A127B (sub_A127B de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, pose le bit 0 du champ de flags
; (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_22049		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 8
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_22049		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_SetFlagBit4AndOffsets_B3EAF (sub_B3EAF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à Widget_SetFlagBit4AndOffsets_FF96 (sub_FF96 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Widget_SetFlagBit4AndOffsets_A1ADF
; (sub_A1ADF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, pose le bit 4 du champ de flags (+0x10) et écrit deux champs d'offset
; (+0x11/+0x13).
; ==============================================================================================
Widget_SetFlagBit4AndOffsets_22057		proc far

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
Widget_SetFlagBit4AndOffsets_22057		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBackground_B3EC9 (sub_B3EC9 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetBackground_A1AF9 (sub_A1AF9
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 239 lignes, NON DÉTAILLÉE — dessine le fond d'un widget selon ses flags
; (Render_FillClippedRect_61960, seg170), encadré par
; PaletteScreen_AcquireOwnership_A1240/ReleaseOwnership_A125D. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBackground_22071		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
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
		jnz	short loc_220A2
		jmp	loc_22125

loc_220A2:
		mov	ax, [bp+arg_8]
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_8], ax
		cwd
		idiv	di
		mov	[bp+var_A], ax
		mov	[bp+var_C], 0
		jmp	short loc_2211D

loc_220BB:
		test	[bp+arg_A], 2
		jz	short loc_220CA
		mov	cx, [bp+arg_2]
		add	cx, [bp+var_C]
		jmp	short loc_220D0

loc_220CA:
		mov	cx, [bp+var_2]
		sub	cx, [bp+var_C]

loc_220D0:
		mov	ax, [bp+var_A]
		sub	[bp+var_8], ax
		cmp	[bp+var_8], 10h
		jge	short loc_220E6
		xor	bx, bx
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		jmp	short loc_220F8

loc_220E6:
		mov	bx, [bp+var_8]
		sar	bx, 4
		mov	ax, bx
		shl	ax, 1
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_220F8:
		mov	al, byte ptr word_5BF22
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
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	[bp+var_C]

loc_2211D:
		cmp	[bp+var_C], di
		jl	short loc_220BB
		jmp	loc_221A4

loc_22125:
		mov	ax, di
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_8], ax
		cwd
		idiv	[bp+arg_8]
		mov	[bp+var_A], ax
		mov	[bp+var_C], 0
		jmp	short loc_2219C

loc_2213E:
		test	[bp+arg_A], 2
		jz	short loc_2214D
		mov	cx, [bp+var_4]
		sub	cx, [bp+var_C]
		jmp	short loc_22153

loc_2214D:
		mov	cx, [bp+arg_4]
		add	cx, [bp+var_C]

loc_22153:
		mov	ax, [bp+var_A]
		sub	[bp+var_8], ax
		cmp	[bp+var_8], 10h
		jge	short loc_22166
		xor	bx, bx
		mov	[bp+var_6], di
		jmp	short loc_22177

loc_22166:
		mov	bx, [bp+var_8]
		sar	bx, 4
		mov	ax, bx
		shl	ax, 1
		mov	dx, di
		sub	dx, ax
		mov	[bp+var_6], dx

loc_22177:
		mov	al, byte ptr word_5BF22
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
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	[bp+var_C]

loc_2219C:
		mov	ax, [bp+var_C]
		cmp	ax, [bp+arg_8]
		jl	short loc_2213E

loc_221A4:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBackground_22071		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetVariantA_B4006 (sub_B4006 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetVariantA_A1C36 (sub_A1C36 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PaletteScreen_DrawWidgetBackground_A1AF9 (variante d'appel).
; ==============================================================================================
PaletteScreen_DrawWidgetVariantA_221AE		proc far

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
		call	near ptr PaletteScreen_DrawWidgetBackground_22071
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetVariantA_221AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetVariantB_B4036 (sub_B4036 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetVariantB_A1C66 (sub_A1C66 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PaletteScreen_DrawWidgetBackground_A1AF9 (autre variante d'appel).
; ==============================================================================================
PaletteScreen_DrawWidgetVariantB_221DE		proc far

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
		call	near ptr PaletteScreen_DrawWidgetBackground_22071
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetVariantB_221DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBorderA_B40B1 (sub_B40B1 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetBorderA_A1CE1 (sub_A1CE1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 273 lignes, NON DÉTAILLÉE — dessine les bordures d'un widget
; (Render_DrawHorizontalLineClipped_61B8E, Rect_ComputeIntersection_60F02,
; Render_FillClippedRect_61960 ×6), encadré par le verrou d'ownership. Candidat pour session
; dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderA_22259		proc far

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
		jnz	short loc_2226D
		jmp	loc_223E1

loc_2226D:
		cmp	word ptr [si+1Ch], 0
		jnz	short loc_22276
		jmp	loc_223E1

loc_22276:
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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+16h]
		mov	[bp+var_8], ax
		jmp	short loc_222C2

loc_2229E:
		mov	al, byte ptr word_5BF20
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49DD0
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_222C2:
		mov	ax, [bp+var_8]
		dec	[bp+var_8]
		or	ax, ax
		jnz	short loc_2229E
		mov	al, byte ptr word_5BF28
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_22350
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_22350
		mov	[bp+var_A], 0
		jmp	short loc_22345

loc_22306:
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_22345:
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jg	short loc_22306
		jmp	loc_223DB

loc_22350:
		mov	[bp+var_A], 0
		jmp	short loc_223D0

loc_22357:
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_223D0:
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jle	short loc_223DB
		jmp	loc_22357

loc_223DB:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_223E1:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBorderA_22259		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBorderB_B423D (sub_B423D de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetBorderB_A1E6D (sub_A1E6D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 268 lignes, NON DÉTAILLÉE — variante de PaletteScreen_DrawWidgetBorderA_A1CE1 (mêmes
; appels), probable style de bordure différent. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderB_223E5		proc far

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
		jnz	short loc_223FD
		jmp	loc_22559

loc_223FD:
		or	cx, cx
		jnz	short loc_22404
		jmp	loc_22559

loc_22404:
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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		jmp	short loc_2244D

loc_22429:
		mov	al, byte ptr word_5BF20
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49DD0
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_2244D:
		mov	ax, [bp+arg_C]
		dec	[bp+arg_C]
		or	ax, ax
		jnz	short loc_22429
		mov	al, byte ptr word_5BF28
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		cmp	[bp+arg_A], 0
		jz	short loc_224C8
		mov	[bp+var_8], 0
		jmp	short loc_224BD

loc_2247E:
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_224BD:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jl	short loc_2247E
		jmp	loc_22553

loc_224C8:
		mov	[bp+var_8], 0
		jmp	short loc_22548

loc_224CF:
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_22548:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jge	short loc_22553
		jmp	loc_224CF

loc_22553:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_22559:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBorderB_223E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2255D		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_5DD44
		call	sub_49DD0
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		leave
		retf
sub_2255D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_225AC		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		leave
		retf
sub_225AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_225FB		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_49DD0
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_225FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2264F		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_2264F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetPixel_B44FB (sub_B44FB de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à PaletteScreen_DrawWidgetPixel_A212B (sub_A212B de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, trace un pixel
; (Render_SetPixelClipped_61B58, seg171), encadré par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetPixel_226A3		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [bp+arg_6]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		push	word_5DD44
		call	Render_SetPixelClipped_49D9A
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetPixel_226A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetFillC_B452F (sub_B452F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à PaletteScreen_DrawWidgetFillC_A215F (sub_A215F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, remplit une
; zone (Render_FillClippedRect_61960), encadrée par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetFillC_226D7		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
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
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetFillC_226D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBorderWrapper_B4571 (sub_B4571 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetBorderWrapper_A21A1
; (sub_A21A1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, enveloppe appelant PaletteScreen_DrawWidgetBorderA_A1CE1.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderWrapper_22719		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_22259
		pop	cx
		pop	bp
		retf
PaletteScreen_DrawWidgetBorderWrapper_22719		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_UpdateWidgetMain_B457F (sub_B457F de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_UpdateWidgetMain_A21AF (sub_A21AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 419 lignes, NON DÉTAILLÉE — la plus grosse fonction de logique métier du segment : dispatch
; vtable ([bx+0x18], [bx+0x2C] ×2), application de style de texte
; (TextScroll_FormatAndApply_67204, seg204, sub_28A63/sub_288A6 externes), encadrée par le
; verrou d'ownership. Probable point d'entrée principal de mise à jour/rendu du widget.
; Candidat prioritaire pour session dédiée.
; ==============================================================================================
PaletteScreen_UpdateWidgetMain_22727		proc far

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
		jnz	short loc_22752
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_22752
		jmp	loc_2295B

loc_22752:
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_2278C
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jz	short loc_22786
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		xor	ax, 1
		and	ax, 1
		and	byte ptr [si+10h], 0DFh
		shl	al, 5
		or	[si+10h], al
		jmp	short loc_22790

loc_22786:
		or	byte ptr [si+10h], 20h
		jmp	short loc_22790

loc_2278C:
		and	byte ptr [si+10h], 0DFh

loc_22790:
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_227AE
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_227AE:
		mov	al, [si+10h]
		shr	ax, 4
		and	ax, 1
		or	ax, ax
		jnz	short loc_227BE
		jmp	loc_228AE

loc_227BE:
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		movsx	eax, word ptr [si+11h]
		mov	[bp+var_12], eax
		mov	[bp+var_A], eax
		mov	eax, dword_5E7D3
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
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		or	di, di
		jnz	short loc_227FF
		jmp	loc_22912

loc_227FF:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_2282F
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2282F
		lea	ax, [bp+var_16]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_2282F

loc_2282F:
		mov	al, byte_5FE4C
		mov	[bp+var_18], al
		test	[bp+var_18], 3
		jnz	short loc_2283E
		jmp	loc_22912

loc_2283E:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 3
		jnz	short loc_2285C
		mov	ax, word_5FE48
		sar	ax, 1
		sub	ax, [si+4]
		mov	[bp+arg_2], ax
		mov	ax, word_5FE4A
		sub	ax, [si+6]
		mov	[bp+arg_4], ax

loc_2285C:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_5E7D3
		ja	short loc_22870
		mov	ax, 1
		jmp	short loc_22872

loc_22870:
		xor	ax, ax

loc_22872:
		or	al, al
		jz	short loc_2289F
		movsx	eax, word ptr [si+13h]
		mov	[bp+var_1C], eax
		mov	[bp+var_A], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_E], eax
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_2289F:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_228AC
		jmp	loc_227FF

loc_228AC:
		jmp	short loc_22912

loc_228AE:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		or	di, di
		jz	short loc_228FE

loc_228B8:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_228E8
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_228E8
		lea	ax, [bp+var_4]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_228E8

loc_228E8:
		mov	al, byte_5FE4C
		mov	[bp+var_6], al
		test	[bp+var_6], 0
		jnz	short loc_228FE
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_228B8

loc_228FE:
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_22912:
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_22955
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_22955
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jz	short loc_22955
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jnz	short loc_22947
		and	byte ptr [si+10h], 0DFh

loc_22947:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_22955:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_2295B:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_UpdateWidgetMain_22727		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetVariantC_B47B7 (sub_B47B7 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DrawWidgetVariantC_A23E7 (sub_A23E7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_6C875 (stub voisin), encadré par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetVariantC_2295F		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word_5BF74
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetVariantC_2295F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ApplyTextStyle_B47ED (sub_B47ED de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ApplyTextStyle_A241D (sub_A241D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; applique un style de texte (TextScroll_FormatAndApply_67204, sub_28A63/sub_288A6 externes).
; ==============================================================================================
PaletteScreen_ApplyTextStyle_22995		proc far

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]

loc_2299E:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_229CE
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_229CE
		lea	ax, [bp+var_4]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_229CE

loc_229CE:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_2299E
		leave
		retf
PaletteScreen_ApplyTextStyle_22995		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ApplyTextStyleB_B4832 (sub_B4832 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ApplyTextStyleB_A2462 (sub_A2462 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de PaletteScreen_ApplyTextStyle_A241D.
; ==============================================================================================
PaletteScreen_ApplyTextStyleB_229DA		proc far

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

loc_229EB:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_22A1B
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22A1B
		lea	ax, [bp+var_4]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_22A1B

loc_22A1B:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_22A31
		mov	ax, word_5FE48
		sar	ax, 1
		mov	[si], ax
		mov	ax, word_5FE4A
		mov	[di], ax

loc_22A31:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_229EB
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ApplyTextStyleB_229DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_DrawCurveWithLabel_B4897 (sub_B4897 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_DrawCurveWithLabel_A24C7 (sub_A24C7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 294 lignes, NON DÉTAILLÉE — combine PaletteScreen_DrawCurveShape_A1375 (×4),
; PaletteScreen_ApplyTextStyle_A241D, TextScroll_FormatAndApply_67204 — dessin d'une forme
; courbe avec étiquette de texte. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawCurveWithLabel_22A3F		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ApplyTextStyle_22995
		pop	cx
		mov	[bp+var_C], 0

loc_22A93:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_22AC3
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22AC3
		lea	ax, [bp+var_10]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_22AC3

loc_22AC3:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_22AD8
		mov	al, byte_5FE47
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_C], ax

loc_22AD8:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_22AE5
		jmp	loc_22B96

loc_22AE5:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		mov	bx, word_5FE48
		sar	bx, 1
		mov	cx, word_5FE4A
		mov	ax, bx
		sub	ax, [bp+arg_6]
		cmp	ax, [bp+var_8]
		jge	short loc_22B1E
		mov	ax, bx
		sub	ax, [bp+arg_6]
		mov	[bp+var_8], ax

loc_22B1E:
		mov	ax, cx
		sub	ax, [bp+arg_8]
		cmp	ax, [bp+var_A]
		jge	short loc_22B30
		mov	ax, cx
		sub	ax, [bp+arg_8]
		mov	[bp+var_A], ax

loc_22B30:
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, bx
		mov	dx, [bp+var_4]
		sub	dx, [bp+var_8]
		cmp	ax, dx
		jge	short loc_22B4E
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, bx
		mov	dx, [bp+var_4]
		sub	dx, ax
		mov	[bp+var_8], dx

loc_22B4E:
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, cx
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		cmp	ax, dx
		jge	short loc_22B6C
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, cx
		mov	dx, [bp+var_6]
		sub	dx, ax
		mov	[bp+var_A], dx

loc_22B6C:
		mov	di, bx
		sub	di, [bp+var_8]
		mov	ax, cx
		sub	ax, [bp+var_A]
		mov	[bp+var_2], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_22B96:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_22BA3
		jmp	loc_22A93

loc_22BA3:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_22BDD
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

loc_22BDD:
		mov	ax, [bp+var_C]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveWithLabel_22A3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_DrawCurveWithLabelB_B4A41 (sub_B4A41 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_DrawCurveWithLabelB_A2671 (sub_A2671 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 298 lignes, NON DÉTAILLÉE — variante de PaletteScreen_DrawCurveWithLabel_A24C7 (mêmes
; appels). Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawCurveWithLabelB_22BE9		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ApplyTextStyle_22995
		pop	cx
		mov	[bp+var_C], 0

loc_22C31:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_22C61
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22C61
		lea	ax, [bp+var_10]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_22C61

loc_22C61:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_22C76
		mov	al, byte_5FE47
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_C], ax

loc_22C76:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_22C83
		jmp	loc_22D06

loc_22C83:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		mov	ax, word_5FE48
		sar	ax, 1
		mov	[bp+var_8], ax
		mov	ax, word_5FE4A
		mov	[bp+var_A], ax
		mov	di, [bp+var_8]
		sub	di, [bp+var_2]
		inc	di
		cmp	di, [bp+arg_2]
		jge	short loc_22CBF
		mov	di, [bp+arg_2]
		jmp	short loc_22CC7

loc_22CBF:
		cmp	di, [bp+arg_6]
		jle	short loc_22CC7
		mov	di, [bp+arg_6]

loc_22CC7:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_4]
		inc	ax
		mov	[bp+var_6], ax
		cmp	ax, [bp+arg_4]
		jge	short loc_22CDB
		mov	ax, [bp+arg_4]
		jmp	short loc_22CE6

loc_22CDB:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+arg_8]
		jle	short loc_22CE9
		mov	ax, [bp+arg_8]

loc_22CE6:
		mov	[bp+var_6], ax

loc_22CE9:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_22D06:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_22D13
		jmp	loc_22C31

loc_22D13:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_21AB0
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_22D77
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

loc_22D77:
		mov	ax, [bp+var_C]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveWithLabelB_22BE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_HelperC_B4F61 (sub_B4F61 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_HelperC_A2B1F (sub_A2B1F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_6C875 (stub voisin).
; ==============================================================================================
PaletteScreen_HelperC_22D83		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+24h]
		call	sub_23243
		pop	cx
		mov	cx, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	di, [si+1Ah]
		sub	di, ax
		mov	word ptr [si+1Eh], 0
		cmp	cx, di
		jge	short loc_22DB8
		mov	ax, di
		sub	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+1Eh], ax

loc_22DB8:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_HelperC_22D83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_HelperD_B4F9A (sub_B4F9A de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_HelperD_A2B58 (sub_A2B58 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_6C875 et sub_6C87A (stubs
; voisins).
; ==============================================================================================
PaletteScreen_HelperD_22DBC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+24h]
		call	sub_23243
		pop	cx
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+20h], 0
		jmp	short loc_22E02

loc_22DE9:
		mov	ax, [si+20h]
		inc	word ptr [si+20h]
		mov	bx, [si+24h]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	PaletteScreen_LookupByteTable_23279
		pop	cx
		add	ax, 2
		sub	di, ax

loc_22E02:
		cmp	di, [bp+var_2]
		jg	short loc_22DE9
		pop	di
		pop	si
		leave
		retf
PaletteScreen_HelperD_22DBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawBorderAndText_A2893 (sub_A2893 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 125 lignes, NON DÉTAILLÉE — combine
; PaletteScreen_DrawWidgetBorderWrapper_A21A1, PaletteScreen_ComputeAndClipRegion_A2034,
; TextFormat_ApplyStyleAttribute_5E2D0 (×2), TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
PaletteScreen_DrawBorderAndText_22E0B		proc far

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
		jnz	short loc_22E24
		push	si
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_22259
		pop	cx
		jmp	short loc_22E2F

loc_22E24:
		push	word ptr [si+22h]
		push	si
		push	cs
		call	near ptr sub_225AC
		add	sp, 4

loc_22E2F:
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
		jz	short loc_22E6D
		mov	di, [si+26h]

loc_22E6D:
		mov	ax, word_5BF74
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word_5BF74
		push	di
		mov	ax, [si+24h]
		add	ax, [si+20h]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawBorderAndText_22E0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseResources_A296C (sub_A296C de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_338, sub_2B1C, sub_658,
; sub_2A82 — libération de ressources associées au widget.
; ==============================================================================================
PaletteScreen_ReleaseResources_22EE4		proc far

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
		jz	short loc_22F01
		push	word ptr [si+24h]
		call	sub_33B
		pop	cx

loc_22F01:
		push	di
		call	CRT_Strlen
		pop	cx
		inc	ax
		mov	[bp+var_2], ax
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+24h], ax
		cmp	word ptr [si+24h], 0
		jz	short loc_22F28
		push	di
		push	word ptr [si+24h]
		call	CRT_Strcpy
		add	sp, 4

loc_22F28:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ReleaseResources_22EE4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22F2C		proc far

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
		call	near ptr PaletteScreen_DrawWidgetBorderA_22259
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
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word ptr [si+28h]
		cmp	byte ptr [si+22h], 3
		jnz	short loc_22F85
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_22F8B

loc_22F85:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_22F8B:
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		leave
		retf
sub_22F2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22FA8		proc far

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
		mov	ax, word_5BF74
		add	ax, 2
		mov	[bp+var_A], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+28h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		push	ax
		cmp	byte ptr [si+22h], 3
		jnz	short loc_23057
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_2305D

loc_23057:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_2305D:
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	word_5BF74
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_21998
		pop	cx
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	si
		leave
		retf
sub_22FA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_HelperC_B4F61 (sub_B4F61 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à PaletteScreen_HelperC_A2B1F (sub_A2B1F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_6C875 (stub voisin).
; ==============================================================================================
PaletteScreen_HelperC_230B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_23243
		pop	cx
		mov	cx, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	di, [si+1Ah]
		sub	di, ax
		mov	word ptr [si+2Ah], 0
		cmp	cx, di
		jge	short loc_230E8
		mov	ax, di
		sub	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+2Ah], ax

loc_230E8:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_HelperC_230B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_HelperD_B4F9A (sub_B4F9A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à PaletteScreen_HelperD_A2B58 (sub_A2B58 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_6C875 et sub_6C87A
; (stubs voisins).
; ==============================================================================================
PaletteScreen_HelperD_230EC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_23243
		pop	cx
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+2Ch], 0
		jmp	short loc_23132

loc_23119:
		mov	ax, [si+2Ch]
		inc	word ptr [si+2Ch]
		mov	bx, [si+2Eh]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	PaletteScreen_LookupByteTable_23279
		pop	cx
		add	ax, 2
		sub	di, ax

loc_23132:
		cmp	di, [bp+var_2]
		jg	short loc_23119
		pop	di
		pop	si
		leave
		retf
PaletteScreen_HelperD_230EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseResourcesB_B4FE9 (sub_B4FE9 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_ReleaseResourcesB_A2BA7 (sub_A2BA7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_338, sub_2B1C, sub_658, sub_2A82, PaletteScreen_HelperC_A2B1F.
; ==============================================================================================
PaletteScreen_ReleaseResourcesB_2313B		proc far

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
		jz	short loc_23158
		push	word ptr [si+2Eh]
		call	sub_33B
		pop	cx

loc_23158:
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
		jz	short loc_2317F
		push	di
		push	word ptr [si+2Eh]
		call	CRT_Strcpy
		add	sp, 4

loc_2317F:
		push	si
		push	cs
		call	near ptr PaletteScreen_HelperC_230B3
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ReleaseResourcesB_2313B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_ResetGlobalFlag_B5037 (sub_B5037 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à PaletteScreen_ResetGlobalFlag_A2BF5 (sub_A2BF5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, réinitialise un
; indicateur global (byte_728FE).
; ==============================================================================================
PaletteScreen_ResetGlobalFlag_23189		proc far
		push	bp
		mov	bp, sp
		mov	byte_5FE46, 0
		pop	bp
		retf
PaletteScreen_ResetGlobalFlag_23189		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23193		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_231B8
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_231B8
		push	si
sub_23193		endp
seg049		ends
