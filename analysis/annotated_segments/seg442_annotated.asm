seg442		segment	para public 'OVERLAY' use16
		assume cs:seg442
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, verrou d'exclusion mutuelle pour ce module d'écran : si aucun propriétaire
; (word_6FE72==0), prend possession (dx) et désactive l'animation de défilement de texte
; (byte_72E70=0, TextScrollDisplayB_ApplyHelperD_67F60, seg209). Appelée par la quasi-totalité
; des fonctions de dessin de ce segment.
; ==============================================================================================
PaletteScreen_AcquireOwnership_A1240	proc far		; CODE XREF: VROOMM_StubThunk_6C7B7J PaletteScreen_DrawWidgetBackground_A1AF9+10p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_6FE72, 0
		jnz	short loc_A125B
		mov	word_6FE72, dx
		mov	byte_72E70, 0
		call	TextScrollDisplayB_ApplyHelperD_67F60

loc_A125B:				; CODE XREF: PaletteScreen_AcquireOwnership_A1240+Bj
		pop	bp
		retf
PaletteScreen_AcquireOwnership_A1240	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, symétrique de PaletteScreen_AcquireOwnership_A1240 : libère si possédant (dx), réactive
; l'animation de défilement (TextScrollDisplayB_ApplyHelperC_67F26, byte_72E70=1).
; ==============================================================================================
PaletteScreen_ReleaseOwnership_A125D	proc far		; CODE XREF: VROOMM_StubThunk_6C7BCJ PaletteScreen_DrawWidgetBackground_A1AF9+135p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_6FE72, dx

loc_A1267:
		jnz	short loc_A1279
		mov	word_6FE72, 0

loc_A126F:
		call	TextScrollDisplayB_ApplyHelperC_67F26
		mov	byte_72E70, 1

loc_A1279:				; CODE XREF: PaletteScreen_ReleaseOwnership_A125D:loc_A1267j
		pop	bp
		retf
PaletteScreen_ReleaseOwnership_A125D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_A127B	proc far		; CODE XREF: VROOMM_StubThunk_6C73FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_A1282:
		or	byte ptr [si+10h], 1
		pop	si
		pop	bp

locret_A1288:
		retf
Widget_SetFlagBit0_A127B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, efface le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_ClearFlagBit0_A1289	proc far		; CODE XREF: VROOMM_StubThunk_6C744J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_A128D:
		mov	si, [bp+arg_0]
		and	byte ptr [si+10h], 0FEh
		pop	si
		pop	bp
		retf
Widget_ClearFlagBit0_A1289	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, translate les 2 coins d'un rectangle de widget (+4/+6/+8/+0xA) par un décalage (dx,cx).
; ==============================================================================================
Widget_TranslateBounds_A1297	proc far		; CODE XREF: VROOMM_StubThunk_6C749J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		add	[si+4],	dx
		add	[si+6],	cx
		add	[si+8],	dx
		add	[si+0Ah], cx
		pop	si
		pop	bp
		retf
Widget_TranslateBounds_A1297	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub retournant 0.
; ==============================================================================================
Widget_Method_ReturnZeroA_A12B3	proc far		; CODE XREF: VROOMM_StubThunk_6C771J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
Widget_Method_ReturnZeroA_A12B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub transmettant simplement son argument.
; ==============================================================================================
Widget_Method_PassThroughA_A12BD	proc far		; CODE XREF: VROOMM_StubThunk_6C7CBJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Widget_Method_PassThroughA_A12BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub transmettant simplement son argument.
; ==============================================================================================
Widget_Method_PassThroughB_A12C5	proc far		; CODE XREF: VROOMM_StubThunk_6C7D0J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Widget_Method_PassThroughB_A12C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_A12CD	proc far		; CODE XREF: VROOMM_StubThunk_6C7DAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]

loc_A12D8:
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_A12CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub transmettant simplement son argument.
; ==============================================================================================
Widget_Method_PassThroughC_A12DF	proc far		; CODE XREF: VROOMM_StubThunk_6C7E4J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_A12E2:
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp

locret_A12E8:
		retf
Widget_Method_PassThroughC_A12DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub transmettant simplement son argument.
; ==============================================================================================
Widget_Method_PassThroughD_A12E9	proc far		; CODE XREF: VROOMM_StubThunk_6C7E9J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_A12EC:
		mov	dx, [bp+arg_0]
		mov	ax, dx

loc_A12F1:
		pop	bp
		retf
Widget_Method_PassThroughD_A12E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub transmettant simplement son argument.
; ==============================================================================================
Widget_Method_PassThroughE_A12F3	proc far		; CODE XREF: VROOMM_StubThunk_6C7F3J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Widget_Method_PassThroughE_A12F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 61 lignes, NON DÉTAILLÉE — appelle un ensemble de points de contrôle pour
; l'interpolation de courbe (motif partagé avec PaletteScreen_ComputeCurvePoint_A1430).
; ==============================================================================================
PaletteScreen_ComputeCurvePointA_A12FB	proc far		; CODE XREF: VROOMM_StubThunk_6C758J

var_10		= word ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 10h

loc_A1301:
		mov	[bp+var_8], 0

loc_A1309:
		mov	[bp+var_4], 2
		mov	[bp+var_C], 0

loc_A1319:				; CODE XREF: PaletteScreen_ComputeCurvePointA_A12FB+6Dj
		push	584Eh
		call	TextScroll_FormatAndApply_67204

loc_A1321:
		pop	cx
		cmp	byte_728FE, 0
		jnz	short loc_A1349
		push	584Eh
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A1349
		lea	ax, [bp+var_10]
		push	ax
		push	584Eh
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short $+2

loc_A1349:				; CODE XREF: PaletteScreen_ComputeCurvePointA_A12FB+2Cj
					; PaletteScreen_ComputeCurvePointA_A12FB+3Bj
		mov	eax, dword_711CD
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		call	Stopwatch_Reset_677FF
		pop	cx
		add	[bp+var_C], 2
		mov	al, byte_728FE

loc_A1363:
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_A1319

loc_A136A:
		mov	eax, [bp+var_C]
		shld	edx, eax, 10h
		leave
		retf
PaletteScreen_ComputeCurvePointA_A12FB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, trace une forme courbe en 4 segments via Render_ClipAndDrawLineVariant_62EC8 (seg183) —
; probable dessin d'un graphe/jauge en arc.
; ==============================================================================================
PaletteScreen_DrawCurveShape_A1375	proc far		; CODE XREF: VROOMM_StubThunk_6C735J PaletteScreen_DrawCurveWithLabel_A24C7+3Dp	...

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
		push	word_70E62
		call	Render_ClipAndDrawLineVariant_62EC8
		add	sp, 0Ch
		push	0FFh
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]
		push	word_70E62
		call	Render_ClipAndDrawLineVariant_62EC8
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	si
		mov	ax, di
		inc	ax
		push	ax
		push	si

loc_A13D3:
		push	word_70E62

loc_A13D7:
		call	Render_ClipAndDrawLineVariant_62EC8
		add	sp, 0Ch
		push	0FFh

loc_A13E2:
		push	[bp+var_4]

loc_A13E5:
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, si
		inc	ax
		push	ax

loc_A13EF:
		push	word_70E62
		call	Render_ClipAndDrawLineVariant_62EC8
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveShape_A1375	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit un registre DAC de palette VGA (int 10h, fonction 1010h — SET INDIVIDUAL DAC
; REGISTER).
; ==============================================================================================
Palette_SetDACRegister_A13FF	proc far		; CODE XREF: VROOMM_StubThunk_6C825J

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp

loc_A1402:
		mov	bx, [bp+arg_0]
		mov	dh, [bp+arg_2]
		mov	ch, [bp+arg_4]

loc_A140B:
		mov	cl, [bp+arg_6]
		mov	ax, 1010h
		int	10h		; - VIDEO - SET	INDIVIDUAL DAC REGISTER	(EGA, VGA/MCGA)
					; BX = register	number,	CH = new value for green (0-63)
					; CL = new value for blue (0-63), DH = new value for red (0-63)
		pop	bp
		retf
Palette_SetDACRegister_A13FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un registre DAC de palette VGA (int 10h, fonction 1015h — READ INDIVIDUAL DAC
; REGISTER).
; ==============================================================================================
Palette_GetDACRegister_A1415	proc far		; CODE XREF: VROOMM_StubThunk_6C82AJ

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 1015h
		int	10h		; - VIDEO - READ INDIVIDUAL DAC	REGISTER (EGA, VGA/MCGA)
					; BL = palette register	number
					; Return: DH = red value, CH = green value, CL = blue value
		les	bx, [bp+arg_2]

loc_A1423:
		mov	es:[bx], dh
		mov	es:[bx+1], ch
		mov	es:[bx+2], cl
		pop	bp
		retf
Palette_GetDACRegister_A1415	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 93 lignes, NON DÉTAILLÉE — algorithme de recherche du point de contrôle le plus
; proche (distance minimale) dans un tableau de points, cœur de l'interpolation de courbe
; utilisée par les fonctions de dessin de ce module. Fonction la plus référencée du segment
; (23 appelants).
; ==============================================================================================
PaletteScreen_ComputeCurvePoint_A1430	proc far		; CODE XREF: VROOMM_StubThunk_6C82FJ Palette_WriteEntryAndCommit_A15F9+22p	...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp

loc_A1433:
		sub	sp, 10h
		push	si
		push	di
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 300h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	si, si
		mov	di, 7FFFh
		xor	cx, cx
		jmp	short loc_A14B4
; ���������������������������������������������������������������������������

loc_A1451:				; CODE XREF: PaletteScreen_ComputeCurvePoint_A1430+8Aj
		les	bx, [bp+arg_0]

loc_A1454:
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, [bp+arg_4]
		sub	dx, ax
		mov	[bp+var_6], dx
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, [bp+arg_6]

loc_A146A:
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
		jge	short loc_A14AF
		mov	si, cx
		mov	di, bx

loc_A14AF:				; CODE XREF: PaletteScreen_ComputeCurvePoint_A1430+79j
		inc	cx
		add	word ptr [bp+arg_0], 3

loc_A14B4:				; CODE XREF: PaletteScreen_ComputeCurvePoint_A1430+1Fj
		mov	ax, word ptr [bp+arg_0]
		cmp	ax, [bp+var_4]
		jb	short loc_A1451
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ComputeCurvePoint_A1430	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit les 256 registres DAC par blocs de 16 (int 10h, fonction 1017h — READ BLOCK OF DAC
; REGISTERS) dans un tampon fourni.
; ==============================================================================================
Palette_ReadAllDACRegisters_A14C2	proc far		; CODE XREF: VROOMM_StubThunk_6C73AJ Palette_GetOrLoadWorkingBuffer_A1550+5Cp

arg_0		= dword	ptr  6

		push	bp

loc_A14C3:
		mov	bp, sp

loc_A14C5:
		les	dx, [bp+arg_0]
		xor	bx, bx

loc_A14CA:
		mov	cx, 10h

loc_A14CD:				; CODE XREF: Palette_ReadAllDACRegisters_A14C2+19j
		mov	ax, 1017h

loc_A14D0:				; - VIDEO - READ BLOCK OF DAC REGISTERS	(EGA, VGA/MCGA)
		int	10h		; BX = starting	palette	register, CX = number of palette registers to read
					; ES:DX	-> buffer (3 * CX bytes	in size)
					; Return: CX number of red, green and blue triples in buffer

loc_A14D2:
		add	dx, 30h	; '0'
		add	bx, cx

loc_A14D7:
		cmp	bx, 100h
		jl	short loc_A14CD
		pop	bp
		retf
Palette_ReadAllDACRegisters_A14C2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit les 256 registres DAC en un seul appel (int 10h, fonction 1012h — SET BLOCK OF
; DAC REGISTERS).
; ==============================================================================================
Palette_WriteAllDACRegisters_A14DF	proc far		; CODE XREF: VROOMM_StubThunk_6C834J PaletteScreen_BuildCustomGradient_A1626+221p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	dx, [bp+arg_0]
		xor	bx, bx
		mov	cx, 100h
		mov	ax, 1012h
		int	10h		; - VIDEO - SET	BLOCK OF DAC REGISTERS (EGA, VGA/MCGA)
					; BX = starting	color register,	CX = number of registers to set
					; ES:DX	-> table of 3*CX bytes where each 3 byte group represents one
					; byte each of red, green and blue (0-63)
		pop	bp
		retf
Palette_WriteAllDACRegisters_A14DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit une entrée RGB (3 octets) à un index donné dans le tampon de palette de travail.
; Fonction très référencée (22 appels) pour construire un dégradé personnalisé.
; ==============================================================================================
Palette_WriteSingleEntry_A14F1	proc far		; CODE XREF: VROOMM_StubThunk_6C839J PaletteScreen_BuildCustomGradient_A1626+42p	...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp

loc_A14F4:
		mov	ax, [bp+arg_4]

loc_A14F7:
		imul	ax, 3
		add	word ptr [bp+arg_0], ax

loc_A14FD:
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_6]

loc_A1503:
		mov	es:[bx], al
		inc	word ptr [bp+arg_0]

loc_A1509:
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_8]
		mov	es:[bx], al
		inc	word ptr [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_A]
		mov	es:[bx], al
		pop	bp
		retf
Palette_WriteSingleEntry_A14F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère le tampon de palette global (dword_6FEA2, sub_346) et réinitialise son état.
; ==============================================================================================
Palette_ReleaseBuffer_A1520	proc far		; CODE XREF: VROOMM_StubThunk_6C83EJ
					; Palette_GetOrLoadWorkingBuffer_A1550:loc_A1566p
		push	bp
		mov	bp, sp

loc_A1523:
		cmp	dword_6FEA2, 0
		jz	short loc_A154E

loc_A152B:
		cmp	word_6FEA0, 0
		jz	short loc_A154E
		mov	word_6FEA0, 0
		push	large [dword_6FEA2]
		call	CRT_Free_NearOrFar
		add	sp, 4
		mov	dword_6FEA2, 0

loc_A154E:				; CODE XREF: Palette_ReleaseBuffer_A1520+9j
					; Palette_ReleaseBuffer_A1520+10j
		pop	bp
		retf
Palette_ReleaseBuffer_A1520	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialisation paresseuse du tampon de palette de travail (768 octets) : alloue si
; besoin (sub_658), charge la palette matérielle courante (Palette_ReadAllDACRegisters_A14C2).
; ==============================================================================================
Palette_GetOrLoadWorkingBuffer_A1550	proc far		; CODE XREF: VROOMM_StubThunk_6C843J
					; Palette_WriteEntryAndCommit_A15F9:loc_A1603p	...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jz	short loc_A1569
		mov	eax, [bp+arg_0]

loc_A155E:
		cmp	eax, dword_6FEA2

loc_A1563:
		jz	short loc_A1569
		push	cs

loc_A1566:
		call	near ptr Palette_ReleaseBuffer_A1520

loc_A1569:				; CODE XREF: Palette_GetOrLoadWorkingBuffer_A1550+8j
					; Palette_GetOrLoadWorkingBuffer_A1550:loc_A1563j
		cmp	dword_6FEA2, 0
		jnz	short loc_A15B2

loc_A1571:
		cmp	[bp+arg_0], 0

loc_A1576:
		jz	short loc_A1588
		mov	eax, [bp+arg_0]
		mov	dword_6FEA2, eax

loc_A1580:
		mov	word_6FEA0, 0

loc_A1586:
		jmp	short loc_A15B2
; ���������������������������������������������������������������������������

loc_A1588:				; CODE XREF: Palette_GetOrLoadWorkingBuffer_A1550:loc_A1576j
		push	300h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr dword_6FEA2+2,	ds
		mov	word ptr dword_6FEA2, ax
		cmp	dword_6FEA2, 0
		jz	short loc_A15B2
		mov	word_6FEA0, 1
		push	word ptr dword_6FEA2+2
		push	ax
		push	cs
		call	near ptr Palette_ReadAllDACRegisters_A14C2
		add	sp, 4

loc_A15B2:				; CODE XREF: Palette_GetOrLoadWorkingBuffer_A1550+1Fj
					; Palette_GetOrLoadWorkingBuffer_A1550:loc_A1586j	...
		mov	dx, word ptr dword_6FEA2+2
		mov	ax, word ptr dword_6FEA2
		pop	bp
		retf
Palette_GetOrLoadWorkingBuffer_A1550	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, convertit 3 composantes de couleur (échelle 0-100) vers l'échelle DAC VGA (0-63,
; ×64/100) et appelle Palette_WriteSingleEntry_A15F9.
; ==============================================================================================
Palette_ConvertPercentToDAC_A15BB	proc far		; CODE XREF: VROOMM_StubThunk_6C75DJ

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

loc_A15C7:
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx

loc_A15CD:
		mov	[bp+var_2], ax

loc_A15D0:
		mov	ax, [bp+arg_2]

loc_A15D3:
		shl	ax, 6

loc_A15D6:
		cwd
		idiv	bx
		mov	[bp+var_4], ax

loc_A15DC:
		mov	ax, [bp+arg_4]

loc_A15DF:
		shl	ax, 6

loc_A15E2:
		cwd

loc_A15E3:
		idiv	bx

loc_A15E5:
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr Palette_WriteEntryAndCommit_A15F9
		add	sp, 6
		leave
		retf
Palette_ConvertPercentToDAC_A15BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Palette_GetOrLoadWorkingBuffer_A1550 et PaletteScreen_ComputeCurvePoint_A1430 —
; écrit une entrée de palette calculée et l'applique.
; ==============================================================================================
Palette_WriteEntryAndCommit_A15F9	proc far		; CODE XREF: VROOMM_StubThunk_6C762J Palette_ConvertPercentToDAC_A15BB+36p

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

loc_A1603:
		call	near ptr Palette_GetOrLoadWorkingBuffer_A1550

loc_A1606:
		add	sp, 4

loc_A1609:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	[bp+arg_4]

loc_A1612:
		push	[bp+arg_2]

loc_A1615:
		push	[bp+arg_0]
		push	dx
		push	ax
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	[bp+var_6], ax
		leave
		retf
Palette_WriteEntryAndCommit_A15F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 537 lignes, NON DÉTAILLÉE — la plus grosse fonction du segment : charge la palette
; de travail (Palette_GetOrLoadWorkingBuffer_A1550), écrit 22 entrées de couleur explicites
; (Palette_WriteSingleEntry_A14F1) puis calcule 23 points de courbe
; (PaletteScreen_ComputeCurvePoint_A1430) et applique le tout
; (Palette_WriteAllDACRegisters_A14DF) — construction d'un dégradé de couleur personnalisé
; (jauge, effet de fondu). Candidat prioritaire pour session dédiée si le motif exact du
; dégradé doit être confirmé.
; ==============================================================================================
PaletteScreen_BuildCustomGradient_A1626	proc far		; CODE XREF: VROOMM_StubThunk_6C767J

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_A162C:
		mov	[bp+var_4], 0

loc_A1634:
		cmp	[bp+arg_2], 0
		jz	short loc_A1641

loc_A163B:
		push	large [bp+arg_2]

loc_A163F:
		jmp	short loc_A1644
; ���������������������������������������������������������������������������

loc_A1641:				; CODE XREF: PaletteScreen_BuildCustomGradient_A1626+13j
		push	large 0

loc_A1644:				; CODE XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A163Fj
		push	cs

loc_A1645:
		call	near ptr Palette_GetOrLoadWorkingBuffer_A1550
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+arg_0], 0
		jnz	short loc_A165A

loc_A1657:
		jmp	loc_A1850
; ���������������������������������������������������������������������������

loc_A165A:				; CODE XREF: PaletteScreen_BuildCustomGradient_A1626+2Fj
		push	large 0
		push	0

loc_A165F:
		push	word_6FE94
		push	large [bp+var_4]

loc_A1667:
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 0
		push	0
		push	word_6FE96
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 250025h
		push	25h ; '%'
		push	word_6FE98

loc_A168E:
		push	large [bp+var_4]
		push	cs

loc_A1693:
		call	near ptr Palette_WriteSingleEntry_A14F1

loc_A1696:
		add	sp, 0Ch
		push	large 29002Ch
		push	29h ; ')'
		push	word_6FE9A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 310031h
		push	31h ; '1'
		push	word_6FE9C
		push	large [bp+var_4]
		push	cs

loc_A16C1:
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch

loc_A16C7:
		push	large 3F003Fh
		push	3Fh ; '?'
		push	word_6FE9E

loc_A16D3:
		push	large [bp+var_4]

loc_A16D7:
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch

loc_A16DE:
		push	large 0
		push	0

loc_A16E3:
		push	word_6FE74
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1

loc_A16EF:
		add	sp, 0Ch

loc_A16F2:
		push	large 2A0000h

loc_A16F8:
		push	0
		push	word_6FE76

loc_A16FE:
		push	large [bp+var_4]
		push	cs

loc_A1703:
		call	near ptr Palette_WriteSingleEntry_A14F1

loc_A1706:
		add	sp, 0Ch
		push	large 2Ah ; '*'
		push	0
		push	word_6FE78
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 2A002Ah
		push	0
		push	word_6FE7A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 0

loc_A1737:
		push	2Ah ; '*'
		push	word_6FE7C

loc_A173D:
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 2A0000h
		push	2Ah ; '*'

loc_A1750:
		push	word_6FE7E

loc_A1754:
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1

loc_A175C:
		add	sp, 0Ch

loc_A175F:
		push	large 15h

loc_A1762:
		push	2Ah ; '*'

loc_A1764:
		push	word_6FE80
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 2A002Ah
		push	2Ah ; '*'
		push	word_6FE82
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1

loc_A1787:
		add	sp, 0Ch

loc_A178A:
		push	large 150015h
		push	15h

loc_A1792:
		push	word_6FE84
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 3F0015h
		push	15h
		push	word_6FE86
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 15003Fh
		push	15h
		push	word_6FE88
		push	large [bp+var_4]
		push	cs

loc_A17C9:
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch

loc_A17CF:
		push	large 3F003Fh
		push	15h

loc_A17D7:
		push	word_6FE8A

loc_A17DB:
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch

loc_A17E6:
		push	large 150015h

loc_A17EC:
		push	3Fh ; '?'
		push	word_6FE8C

loc_A17F2:
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch

loc_A17FD:
		push	large 3F0015h
		push	3Fh ; '?'
		push	word_6FE8E
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 15003Fh
		push	3Fh ; '?'
		push	word_6FE90

loc_A1820:
		push	large [bp+var_4]
		push	cs

loc_A1825:
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large 3F003Fh
		push	3Fh ; '?'

loc_A1833:
		push	word_6FE92
		push	large [bp+var_4]
		push	cs

loc_A183C:
		call	near ptr Palette_WriteSingleEntry_A14F1
		add	sp, 0Ch
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteAllDACRegisters_A14DF
		add	sp, 4
		jmp	locret_A1A22
; ���������������������������������������������������������������������������

loc_A1850:				; CODE XREF: PaletteScreen_BuildCustomGradient_A1626:loc_A1657j
		push	large 0
		push	0

loc_A1855:
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A185D:
		add	sp, 0Ah
		mov	word_6FE94, ax

loc_A1863:
		push	large 0
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah

loc_A1873:
		mov	word_6FE96, ax
		push	large 250025h
		push	25h ; '%'
		push	large [bp+var_4]

loc_A1882:
		push	cs

loc_A1883:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE98, ax

loc_A188C:
		push	large 29002Ch
		push	29h ; ')'

loc_A1894:
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE9A, ax
		push	large 310031h
		push	31h ; '1'
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A18B2:
		add	sp, 0Ah

loc_A18B5:
		mov	word_6FE9C, ax

loc_A18B8:
		push	large 3F003Fh
		push	3Fh ; '?'

loc_A18C0:
		push	large [bp+var_4]

loc_A18C4:
		push	cs

loc_A18C5:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A18C8:
		add	sp, 0Ah
		mov	word_6FE9E, ax
		push	large 0

loc_A18D1:
		push	0

loc_A18D3:
		push	large [bp+var_4]

loc_A18D7:
		push	cs

loc_A18D8:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE74, ax

loc_A18E1:
		push	large 2A0000h
		push	0
		push	large [bp+var_4]

loc_A18ED:
		push	cs

loc_A18EE:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah

loc_A18F4:
		mov	word_6FE76, ax
		push	large 2Ah ; '*'
		push	0
		push	large [bp+var_4]
		push	cs

loc_A1901:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE78, ax
		push	large 2A002Ah
		push	0

loc_A1912:
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE7A, ax
		push	large 0
		push	2Ah ; '*'
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A192D:
		add	sp, 0Ah
		mov	word_6FE7C, ax

loc_A1933:
		push	large 2A0000h

loc_A1939:
		push	2Ah ; '*'
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE7E, ax
		push	large 15h
		push	2Ah ; '*'
		push	large [bp+var_4]
		push	cs

loc_A1953:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE80, ax

loc_A195C:
		push	large 2A002Ah

loc_A1962:
		push	2Ah ; '*'
		push	large [bp+var_4]

loc_A1968:
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A196C:
		add	sp, 0Ah
		mov	word_6FE82, ax
		push	large 150015h
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE84, ax
		push	large 3F0015h
		push	15h

loc_A1990:
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE86, ax
		push	large 15003Fh
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE88, ax

loc_A19B4:
		push	large 3F003Fh
		push	15h

loc_A19BC:
		push	large [bp+var_4]
		push	cs

loc_A19C1:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah

loc_A19C7:
		mov	word_6FE8A, ax
		push	large 150015h
		push	3Fh ; '?'

loc_A19D2:
		push	large [bp+var_4]
		push	cs

loc_A19D7:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A19DA:
		add	sp, 0Ah
		mov	word_6FE8C, ax

loc_A19E0:
		push	large 3F0015h

loc_A19E6:
		push	3Fh ; '?'
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah

loc_A19F3:
		mov	word_6FE8E, ax
		push	large 15003Fh
		push	3Fh ; '?'
		push	large [bp+var_4]
		push	cs

loc_A1A03:
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430

loc_A1A06:
		add	sp, 0Ah
		mov	word_6FE90, ax

loc_A1A0C:
		push	large 3F003Fh
		push	3Fh ; '?'
		push	large [bp+var_4]
		push	cs
		call	near ptr PaletteScreen_ComputeCurvePoint_A1430
		add	sp, 0Ah
		mov	word_6FE92, ax

locret_A1A22:				; CODE XREF: PaletteScreen_BuildCustomGradient_A1626+227j
		leave
		retf
PaletteScreen_BuildCustomGradient_A1626	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 112 lignes, NON DÉTAILLÉE — alloue (sub_658) et applique un style de texte
; (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
PaletteScreen_FormatValueDisplay_A1A24	proc far		; CODE XREF: VROOMM_StubThunk_6C76CJ

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

loc_A1A27:
		sub	sp, 8
		push	si

loc_A1A2B:
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A1A43

loc_A1A32:
		push	1Eh

loc_A1A34:
		call	CRT_Malloc16_Retry
		pop	cx

loc_A1A3A:
		mov	si, ax
		or	ax, ax
		jnz	short loc_A1A43

loc_A1A40:
		jmp	loc_A1ACC
; ���������������������������������������������������������������������������

loc_A1A43:				; CODE XREF: PaletteScreen_FormatValueDisplay_A1A24+Cj
					; PaletteScreen_FormatValueDisplay_A1A24+1Aj
		mov	word ptr [si], 0

loc_A1A47:
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0

loc_A1A50:
		mov	word ptr [si+0Eh], 2DF6h

loc_A1A55:
		push	word_70E62

loc_A1A59:
		push	si

loc_A1A5A:
		call	TextFormat_ApplyStyleAttribute_5E2D0

loc_A1A5F:
		add	sp, 4

loc_A1A62:
		mov	ax, [bp+arg_2]

loc_A1A65:
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+4],	ax
		mov	ax, [bp+var_4]
		mov	[si+6],	ax
		mov	ax, [bp+var_6]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8],	ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax
		and	byte ptr [si+10h], 0DFh
		or	byte ptr [si+10h], 2
		or	byte ptr [si+10h], 4

loc_A1AB2:
		and	byte ptr [si+10h], 0EFh
		and	byte ptr [si+10h], 0FEh

loc_A1ABA:
		and	byte ptr [si+10h], 0F7h

loc_A1ABE:
		and	byte ptr [si+15h], 0F0h
		mov	word ptr [si+16h], 1
		mov	word ptr [si+18h], 1

loc_A1ACC:				; CODE XREF: PaletteScreen_FormatValueDisplay_A1A24:loc_A1A40j
		mov	ax, si
		pop	si
		leave
		retf
PaletteScreen_FormatValueDisplay_A1A24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, pose le bit 3 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit3_A1AD1	proc far		; CODE XREF: VROOMM_StubThunk_6C776J

arg_0		= word ptr  6

		push	bp

loc_A1AD2:
		mov	bp, sp
		push	si

loc_A1AD5:
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 8
		pop	si
		pop	bp
		retf
Widget_SetFlagBit3_A1AD1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, pose le bit 4 du champ de flags (+0x10) et écrit deux champs d'offset (+0x11/+0x13).
; ==============================================================================================
Widget_SetFlagBit4AndOffsets_A1ADF	proc far		; CODE XREF: VROOMM_StubThunk_6C77BJ

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
Widget_SetFlagBit4AndOffsets_A1ADF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 239 lignes, NON DÉTAILLÉE — dessine le fond d'un widget selon ses flags
; (Render_FillClippedRect_61960, seg170), encadré par
; PaletteScreen_AcquireOwnership_A1240/ReleaseOwnership_A125D. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBackground_A1AF9	proc far		; CODE XREF: VROOMM_StubThunk_6C794J PaletteScreen_DrawWidgetVariantA_A1C36+27p	...

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
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		mov	ax, [bp+arg_2]
		add	ax, di
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_4], ax

loc_A1B20:
		test	[bp+arg_A], 1
		jnz	short loc_A1B2A
		jmp	loc_A1BAD
; ���������������������������������������������������������������������������

loc_A1B2A:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+2Cj
		mov	ax, [bp+arg_8]

loc_A1B2D:
		inc	ax

loc_A1B2E:
		shl	ax, 4

loc_A1B31:
		sar	ax, 1

loc_A1B33:
		mov	[bp+var_8], ax
		cwd

loc_A1B37:
		idiv	di
		mov	[bp+var_A], ax
		mov	[bp+var_C], 0
		jmp	short loc_A1BA5
; ���������������������������������������������������������������������������

loc_A1B43:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+AFj
		test	[bp+arg_A], 2
		jz	short loc_A1B52
		mov	cx, [bp+arg_2]
		add	cx, [bp+var_C]

loc_A1B50:
		jmp	short loc_A1B58
; ���������������������������������������������������������������������������

loc_A1B52:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+4Fj
		mov	cx, [bp+var_2]

loc_A1B55:
		sub	cx, [bp+var_C]

loc_A1B58:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9:loc_A1B50j
		mov	ax, [bp+var_A]
		sub	[bp+var_8], ax

loc_A1B5E:
		cmp	[bp+var_8], 10h

loc_A1B62:
		jge	short loc_A1B6E
		xor	bx, bx

loc_A1B66:
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		jmp	short loc_A1B80
; ���������������������������������������������������������������������������

loc_A1B6E:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9:loc_A1B62j
		mov	bx, [bp+var_8]
		sar	bx, 4
		mov	ax, bx
		shl	ax, 1
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_A1B80:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+73j
		mov	al, byte ptr word_6FE96

loc_A1B83:
		push	ax
		mov	ax, [bp+arg_4]

loc_A1B87:
		add	ax, bx

loc_A1B89:
		add	ax, [bp+var_6]
		dec	ax
		push	ax
		push	cx

loc_A1B8F:
		mov	ax, [bp+arg_4]
		add	ax, bx

loc_A1B94:
		push	ax
		push	cx
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		inc	[bp+var_C]

loc_A1BA5:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+48j
		cmp	[bp+var_C], di
		jl	short loc_A1B43
		jmp	loc_A1C2C
; ���������������������������������������������������������������������������

loc_A1BAD:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+2Ej
		mov	ax, di
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_8], ax
		cwd

loc_A1BB9:
		idiv	[bp+arg_8]
		mov	[bp+var_A], ax

loc_A1BBF:
		mov	[bp+var_C], 0
		jmp	short loc_A1C24
; ���������������������������������������������������������������������������

loc_A1BC6:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+131j
		test	[bp+arg_A], 2
		jz	short loc_A1BD5
		mov	cx, [bp+var_4]

loc_A1BD0:
		sub	cx, [bp+var_C]

loc_A1BD3:
		jmp	short loc_A1BDB
; ���������������������������������������������������������������������������

loc_A1BD5:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+D2j
		mov	cx, [bp+arg_4]
		add	cx, [bp+var_C]

loc_A1BDB:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9:loc_A1BD3j
		mov	ax, [bp+var_A]

loc_A1BDE:
		sub	[bp+var_8], ax

loc_A1BE1:
		cmp	[bp+var_8], 10h
		jge	short loc_A1BEE

loc_A1BE7:
		xor	bx, bx

loc_A1BE9:
		mov	[bp+var_6], di
		jmp	short loc_A1BFF
; ���������������������������������������������������������������������������

loc_A1BEE:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+ECj
		mov	bx, [bp+var_8]
		sar	bx, 4

loc_A1BF4:
		mov	ax, bx
		shl	ax, 1
		mov	dx, di
		sub	dx, ax
		mov	[bp+var_6], dx

loc_A1BFF:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+F3j
		mov	al, byte ptr word_6FE96
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
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		inc	[bp+var_C]

loc_A1C24:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+CBj
		mov	ax, [bp+var_C]
		cmp	ax, [bp+arg_8]
		jl	short loc_A1BC6

loc_A1C2C:				; CODE XREF: PaletteScreen_DrawWidgetBackground_A1AF9+B1j
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D

loc_A1C31:
		pop	cx
		pop	di

loc_A1C33:
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBackground_A1AF9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PaletteScreen_DrawWidgetBackground_A1AF9 (variante d'appel).
; ==============================================================================================
PaletteScreen_DrawWidgetVariantA_A1C36	proc far		; CODE XREF: VROOMM_StubThunk_6C78FJ

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

loc_A1C51:
		push	ax

loc_A1C52:
		mov	ax, [si+4]

loc_A1C55:
		add	ax, [bp+arg_2]
		add	ax, dx
		push	ax
		push	si

loc_A1C5C:
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBackground_A1AF9

loc_A1C60:
		add	sp, 0Ch

loc_A1C63:
		pop	si

loc_A1C64:
		pop	bp
		retf
PaletteScreen_DrawWidgetVariantA_A1C36	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PaletteScreen_DrawWidgetBackground_A1AF9 (autre variante d'appel).
; ==============================================================================================
PaletteScreen_DrawWidgetVariantB_A1C66	proc far		; CODE XREF: VROOMM_StubThunk_6C78AJ

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

loc_A1C7F:
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

loc_A1CB3:
		mov	dl, [si+10h]

loc_A1CB6:
		shr	dx, 5

loc_A1CB9:
		and	dx, 1
		add	ax, dx
		dec	ax
		mov	[bp+var_6], ax

loc_A1CC2:
		push	[bp+arg_2]

loc_A1CC5:
		sub	ax, [bp+var_2]

loc_A1CC8:
		inc	ax
		push	ax
		mov	ax, [bp+var_4]

loc_A1CCD:
		sub	ax, di
		inc	ax
		push	ax

loc_A1CD1:
		push	[bp+var_2]
		push	di
		push	si
		push	cs

loc_A1CD7:
		call	near ptr PaletteScreen_DrawWidgetBackground_A1AF9

loc_A1CDA:
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetVariantB_A1C66	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 273 lignes, NON DÉTAILLÉE — dessine les bordures d'un widget
; (Render_DrawHorizontalLineClipped_61B8E, Rect_ComputeIntersection_60F02,
; Render_FillClippedRect_61960 ×6), encadré par le verrou d'ownership. Candidat pour session
; dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderA_A1CE1	proc far		; CODE XREF: VROOMM_StubThunk_6C785J PaletteScreen_DrawWidgetBorderWrapper_A21A1+8p ...

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_A1CE2:
		mov	bp, sp

loc_A1CE4:
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Ah], 0
		jnz	short loc_A1CF5
		jmp	loc_A1E69
; ���������������������������������������������������������������������������

loc_A1CF5:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+Fj
		cmp	word ptr [si+1Ch], 0
		jnz	short loc_A1CFE
		jmp	loc_A1E69
; ���������������������������������������������������������������������������

loc_A1CFE:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+18j
		mov	di, [si+4]

loc_A1D01:
		mov	ax, [si+4]

loc_A1D04:
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
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		mov	ax, [si+16h]
		mov	[bp+var_8], ax
		jmp	short loc_A1D4A
; ���������������������������������������������������������������������������

loc_A1D26:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+71j
		mov	al, byte ptr word_6FE94
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]

loc_A1D33:
		push	di
		push	word_70E62
		call	Render_DrawHorizontalLineClipped_61B8E
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]

loc_A1D44:
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_A1D4A:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+43j
		mov	ax, [bp+var_8]
		dec	[bp+var_8]

loc_A1D50:
		or	ax, ax
		jnz	short loc_A1D26

loc_A1D54:
		mov	al, byte ptr word_6FE9C

loc_A1D57:
		push	ax

loc_A1D58:
		push	[bp+var_6]
		push	[bp+var_2]

loc_A1D5E:
		push	[bp+var_4]
		push	di

loc_A1D62:
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch

loc_A1D6E:
		mov	al, [si+10h]
		shr	ax, 1

loc_A1D73:
		and	ax, 1
		or	ax, ax

loc_A1D78:
		jz	short loc_A1DD8
		mov	al, [si+10h]
		shr	ax, 5

loc_A1D80:
		and	ax, 1
		or	ax, ax
		jz	short loc_A1DD8
		mov	[bp+var_A], 0
		jmp	short loc_A1DCD
; ���������������������������������������������������������������������������

loc_A1D8E:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1:loc_A1DD3j
		mov	al, byte ptr word_6FE98
		push	ax

loc_A1D92:
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr word_6FE98
		push	ax
		push	[bp+var_6]
		push	di

loc_A1DB0:
		push	[bp+var_4]
		push	di

loc_A1DB4:
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_A1DCD:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+ABj
		mov	ax, [si+18h]

loc_A1DD0:
		cmp	ax, [bp+var_A]

loc_A1DD3:
		jg	short loc_A1D8E
		jmp	loc_A1E63
; ���������������������������������������������������������������������������

loc_A1DD8:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1:loc_A1D78j
					; PaletteScreen_DrawWidgetBorderA_A1CE1+A4j
		mov	[bp+var_A], 0

loc_A1DDD:
		jmp	short loc_A1E58
; ���������������������������������������������������������������������������

loc_A1DDF:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1:loc_A1E60j
		mov	al, byte ptr word_6FE98
		push	ax

loc_A1DE3:
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]

loc_A1DF1:
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr word_6FE98
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_70E62

loc_A1E0F:
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

loc_A1E17:
		mov	al, byte ptr word_6FE9E
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]

loc_A1E21:
		push	[bp+var_4]
		push	di

loc_A1E25:
		push	word_70E62

loc_A1E29:
		call	Render_FillClippedRect_61960

loc_A1E2E:
		add	sp, 0Ch

loc_A1E31:
		mov	al, byte ptr word_6FE9E

loc_A1E34:
		push	ax
		mov	ax, [bp+var_6]

loc_A1E38:
		dec	ax
		push	ax
		push	di

loc_A1E3B:
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]

loc_A1E52:
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_A1E58:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1:loc_A1DDDj
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jle	short loc_A1E63

loc_A1E60:
		jmp	loc_A1DDF
; ���������������������������������������������������������������������������

loc_A1E63:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+F4j
					; PaletteScreen_DrawWidgetBorderA_A1CE1+17Dj
		push	si

loc_A1E64:
		push	cs

loc_A1E65:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A1E69:				; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+11j
					; PaletteScreen_DrawWidgetBorderA_A1CE1+1Aj
		pop	di
		pop	si
		leave

locret_A1E6C:
		retf
PaletteScreen_DrawWidgetBorderA_A1CE1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 268 lignes, NON DÉTAILLÉE — variante de PaletteScreen_DrawWidgetBorderA_A1CE1 (mêmes
; appels), probable style de bordure différent. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderB_A1E6D	proc far		; CODE XREF: VROOMM_StubThunk_6C780J

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

loc_A1E70:
		sub	sp, 8

loc_A1E73:
		push	si
		push	di

loc_A1E75:
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_6]

loc_A1E7B:
		mov	cx, [bp+arg_8]
		or	dx, dx

loc_A1E80:
		jnz	short loc_A1E85

loc_A1E82:
		jmp	loc_A1FE1
; ���������������������������������������������������������������������������

loc_A1E85:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D:loc_A1E80j
		or	cx, cx

loc_A1E87:
		jnz	short loc_A1E8C
		jmp	loc_A1FE1
; ���������������������������������������������������������������������������

loc_A1E8C:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D:loc_A1E87j
		mov	di, [si+4]
		add	di, [bp+arg_2]

loc_A1E92:
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
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		jmp	short loc_A1ED5
; ���������������������������������������������������������������������������

loc_A1EB1:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+70j
		mov	al, byte ptr word_6FE94
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Render_DrawHorizontalLineClipped_61B8E
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_A1ED5:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+42j
		mov	ax, [bp+arg_C]
		dec	[bp+arg_C]
		or	ax, ax
		jnz	short loc_A1EB1
		mov	al, byte ptr word_6FE9C
		push	ax

loc_A1EE3:
		push	[bp+var_6]

loc_A1EE6:
		push	[bp+var_2]
		push	[bp+var_4]
		push	di

loc_A1EED:
		push	word_70E62

loc_A1EF1:
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		cmp	[bp+arg_A], 0
		jz	short loc_A1F50
		mov	[bp+var_8], 0
		jmp	short loc_A1F45
; ���������������������������������������������������������������������������

loc_A1F06:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+DEj
		mov	al, byte ptr word_6FE98

loc_A1F09:
		push	ax

loc_A1F0A:
		push	[bp+var_4]
		push	[bp+var_2]

loc_A1F10:
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

loc_A1F20:
		mov	al, byte ptr word_6FE98
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_A1F45:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+97j
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jl	short loc_A1F06
		jmp	loc_A1FDB
; ���������������������������������������������������������������������������

loc_A1F50:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+90j
		mov	[bp+var_8], 0
		jmp	short loc_A1FD0
; ���������������������������������������������������������������������������

loc_A1F57:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+16Bj
		mov	al, byte ptr word_6FE98
		push	ax

loc_A1F5B:
		push	[bp+var_6]
		push	[bp+var_2]

loc_A1F61:
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_70E62

loc_A1F6D:
		call	Render_FillClippedRect_61960

loc_A1F72:
		add	sp, 0Ch

loc_A1F75:
		mov	al, byte ptr word_6FE98
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]

loc_A1F7F:
		push	[bp+var_6]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr word_6FE9E
		push	ax

loc_A1F93:
		push	[bp+var_4]

loc_A1F96:
		push	[bp+var_2]
		push	[bp+var_4]

loc_A1F9C:
		push	di

loc_A1F9D:
		push	word_70E62

loc_A1FA1:
		call	Render_FillClippedRect_61960

loc_A1FA6:
		add	sp, 0Ch
		mov	al, byte ptr word_6FE9E

loc_A1FAC:
		push	ax

loc_A1FAD:
		mov	ax, [bp+var_6]

loc_A1FB0:
		dec	ax
		push	ax

loc_A1FB2:
		push	di

loc_A1FB3:
		push	[bp+var_4]
		push	di

loc_A1FB7:
		push	word_70E62
		call	Render_FillClippedRect_61960

loc_A1FC0:
		add	sp, 0Ch

loc_A1FC3:
		inc	di

loc_A1FC4:
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_A1FD0:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+E8j
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jge	short loc_A1FDB
		jmp	loc_A1F57
; ���������������������������������������������������������������������������

loc_A1FDB:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D+E0j
					; PaletteScreen_DrawWidgetBorderB_A1E6D+169j
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A1FE1:				; CODE XREF: PaletteScreen_DrawWidgetBorderB_A1E6D:loc_A1E82j
					; PaletteScreen_DrawWidgetBorderB_A1E6D+1Cj
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBorderB_A1E6D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dessine une ligne de bordure (Render_DrawHorizontalLineClipped_61B8E), encadrée par le
; verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetLineA_A1FE5	proc far		; CODE XREF: VROOMM_StubThunk_6C799J

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

loc_A2002:
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_8], ax
		push	si
		push	cs

loc_A200B:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx

loc_A200F:
		mov	al, [bp+arg_2]
		push	ax

loc_A2013:
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]

loc_A201F:
		push	word_70E62
		call	Render_DrawHorizontalLineClipped_61B8E
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		pop	si
		leave

locret_A2033:
		retf
PaletteScreen_DrawWidgetLineA_A1FE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule/clippe une région (Rect_ComputeIntersection_60F02), encadré par le verrou
; d'ownership.
; ==============================================================================================
PaletteScreen_ComputeAndClipRegion_A2034	proc far		; CODE XREF: VROOMM_StubThunk_6C79EJ PaletteScreen_DrawBorderAndText_A2893+1Ep

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

loc_A2051:
		add	ax, [si+1Ch]
		dec	ax

loc_A2055:
		mov	[bp+var_8], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_70E62

loc_A2072:
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	si
		push	cs

loc_A207C:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		pop	si
		leave
		retf
PaletteScreen_ComputeAndClipRegion_A2034	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dessine une ligne de bordure (Render_DrawHorizontalLineClipped_61B8E), encadrée par le
; verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetLineB_A2083	proc far		; CODE XREF: VROOMM_StubThunk_6C7A3J

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

loc_A2091:
		add	di, [bp+arg_2]
		mov	ax, di

loc_A2096:
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax

loc_A209D:
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax

loc_A20A6:
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs

loc_A20AF:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx

loc_A20B3:
		mov	al, [bp+arg_A]
		push	ax

loc_A20B7:
		push	[bp+var_6]
		push	[bp+var_2]

loc_A20BD:
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Render_DrawHorizontalLineClipped_61B8E
		add	sp, 0Ch
		push	si
		push	cs

loc_A20CF:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A20D3:
		pop	di
		pop	si
		leave

locret_A20D6:
		retf
PaletteScreen_DrawWidgetLineB_A2083	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule/clippe une région (Rect_ComputeIntersection_60F02), encadré par le verrou
; d'ownership.
; ==============================================================================================
PaletteScreen_ComputeAndClipRegionB_A20D7	proc far		; CODE XREF: VROOMM_StubThunk_6C7A8J

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

loc_A20D8:
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di

loc_A20DF:
		mov	si, [bp+arg_0]

loc_A20E2:
		mov	di, [si+4]
		add	di, [bp+arg_2]
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax

loc_A20F1:
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]

loc_A2111:
		push	[bp+var_4]
		push	di
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	si
		push	cs

loc_A2123:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D

loc_A2126:
		pop	cx

loc_A2127:
		pop	di

loc_A2128:
		pop	si
		leave
		retf
PaletteScreen_ComputeAndClipRegionB_A20D7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, trace un pixel (Render_SetPixelClipped_61B58, seg171), encadré par le verrou
; d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetPixel_A212B	proc far		; CODE XREF: VROOMM_StubThunk_6C7ADJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp

loc_A212E:
		push	si

loc_A212F:
		mov	si, [bp+arg_0]
		push	si

loc_A2133:
		push	cs

loc_A2134:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		mov	al, [bp+arg_6]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		push	word_70E62
		call	Render_SetPixelClipped_61B58

loc_A2153:
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetPixel_A212B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, remplit une zone (Render_FillClippedRect_61960), encadrée par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetFillC_A215F	proc far		; CODE XREF: VROOMM_StubThunk_6C7B2J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si

loc_A2163:
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		mov	al, [bp+arg_A]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [si+4]

loc_A217A:
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax

loc_A2185:
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		push	word_70E62

loc_A2190:
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		push	si
		push	cs

loc_A219A:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetFillC_A215F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe appelant PaletteScreen_DrawWidgetBorderA_A1CE1.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderWrapper_A21A1	proc far		; CODE XREF: VROOMM_StubThunk_6C7D5J

arg_0		= word ptr  6

		push	bp

loc_A21A2:
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_A1CE1

loc_A21AC:
		pop	cx
		pop	bp
		retf
PaletteScreen_DrawWidgetBorderWrapper_A21A1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 419 lignes, NON DÉTAILLÉE — la plus grosse fonction de logique métier du segment :
; dispatch vtable ([bx+0x18], [bx+0x2C] ×2), application de style de texte
; (TextScroll_FormatAndApply_67204, seg204, sub_28A63/sub_288A6 externes), encadrée par le
; verrou d'ownership. Probable point d'entrée principal de mise à jour/rendu du widget.
; Candidat prioritaire pour session dédiée.
; ==============================================================================================
PaletteScreen_UpdateWidgetMain_A21AF	proc far		; CODE XREF: VROOMM_StubThunk_6C7EEJ

var_1C		= dword	ptr -1Ch
var_18		= byte ptr -18h
var_16		= word ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
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

loc_A21C8:
		jnz	short loc_A21DA

loc_A21CA:
		mov	al, [si+10h]
		shr	ax, 5

loc_A21D0:
		and	ax, 1
		or	ax, ax
		jz	short loc_A21DA
		jmp	loc_A23E3
; ���������������������������������������������������������������������������

loc_A21DA:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A21C8j
					; PaletteScreen_UpdateWidgetMain_A21AF+26j
		mov	al, [si+10h]
		shr	ax, 1

loc_A21DF:
		and	ax, 1

loc_A21E2:
		or	ax, ax

loc_A21E4:
		jz	short loc_A2214

loc_A21E6:
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jz	short loc_A220E
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		xor	ax, 1
		and	ax, 1
		and	byte ptr [si+10h], 0DFh
		shl	al, 5
		or	[si+10h], al
		jmp	short loc_A2218
; ���������������������������������������������������������������������������

loc_A220E:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+42j
		or	byte ptr [si+10h], 20h
		jmp	short loc_A2218
; ���������������������������������������������������������������������������

loc_A2214:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A21E4j
		and	byte ptr [si+10h], 0DFh

loc_A2218:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+5Dj
					; PaletteScreen_UpdateWidgetMain_A21AF+63j
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_A2236
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A2236:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+71j
		mov	al, [si+10h]
		shr	ax, 4
		and	ax, 1

loc_A223F:
		or	ax, ax
		jnz	short loc_A2246

loc_A2243:
		jmp	loc_A2336
; ���������������������������������������������������������������������������

loc_A2246:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+92j
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax

loc_A2251:
		movsx	eax, word ptr [si+11h]

loc_A2256:
		mov	[bp+var_12], eax

loc_A225A:
		mov	[bp+var_A], eax

loc_A225E:
		mov	eax, dword_711CD

loc_A2262:
		mov	[bp+var_E], eax

loc_A2266:
		push	[bp+arg_8]

loc_A2269:
		push	di
		push	[bp+arg_4]

loc_A226D:
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]

loc_A2274:
		call	dword ptr [bx+2Ch]

loc_A2277:
		add	sp, 0Ah

loc_A227A:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		or	di, di

loc_A2282:
		jnz	short loc_A2287

loc_A2284:
		jmp	loc_A239A
; ���������������������������������������������������������������������������

loc_A2287:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A2282j
					; PaletteScreen_UpdateWidgetMain_A21AF:loc_A2331j
		push	584Eh
		call	TextScroll_FormatAndApply_67204
		pop	cx
		cmp	byte_728FE, 0
		jnz	short loc_A22B7
		push	584Eh

loc_A229A:
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A22B7
		lea	ax, [bp+var_16]
		push	ax

loc_A22AA:
		push	584Eh
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short $+2

loc_A22B7:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+E6j
					; PaletteScreen_UpdateWidgetMain_A21AF+F5j
		mov	al, byte_72904
		mov	[bp+var_18], al
		test	[bp+var_18], 3

loc_A22C1:
		jnz	short loc_A22C6

loc_A22C3:
		jmp	loc_A239A
; ���������������������������������������������������������������������������

loc_A22C6:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A22C1j
		mov	al, byte_728FE
		mov	ah, 0

loc_A22CB:
		cmp	ax, 3
		jnz	short loc_A22E4

loc_A22D0:
		mov	ax, word_72900

loc_A22D3:
		sar	ax, 1
		sub	ax, [si+4]

loc_A22D8:
		mov	[bp+arg_2], ax

loc_A22DB:
		mov	ax, word_72902
		sub	ax, [si+6]

loc_A22E1:
		mov	[bp+arg_4], ax

loc_A22E4:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+11Fj
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_711CD
		ja	short loc_A22F8
		mov	ax, 1
		jmp	short loc_A22FA
; ���������������������������������������������������������������������������

loc_A22F8:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+142j
		xor	ax, ax

loc_A22FA:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+147j
		or	al, al
		jz	short loc_A2327

loc_A22FE:
		movsx	eax, word ptr [si+13h]

loc_A2303:
		mov	[bp+var_1C], eax

loc_A2307:
		mov	[bp+var_A], eax
		mov	eax, dword_711CD

loc_A230F:
		mov	[bp+var_E], eax

loc_A2313:
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_A2327:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+14Dj
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_A2334

loc_A2331:
		jmp	loc_A2287
; ���������������������������������������������������������������������������

loc_A2334:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+180j
		jmp	short loc_A239A
; ���������������������������������������������������������������������������

loc_A2336:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A2243j
		push	si
		push	cs

loc_A2338:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A233C:
		or	di, di
		jz	short loc_A2386

loc_A2340:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+1D5j
		push	584Eh
		call	TextScroll_FormatAndApply_67204
		pop	cx
		cmp	byte_728FE, 0
		jnz	short loc_A2370
		push	584Eh
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A2370

loc_A235F:
		lea	ax, [bp+var_4]
		push	ax

loc_A2363:
		push	584Eh

loc_A2366:
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short $+2

loc_A2370:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+19Fj
					; PaletteScreen_UpdateWidgetMain_A21AF+1AEj
		mov	al, byte_72904
		mov	[bp+var_6], al

loc_A2376:
		test	[bp+var_6], 0
		jnz	short loc_A2386
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_A2340

loc_A2386:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+18Fj
					; PaletteScreen_UpdateWidgetMain_A21AF+1CBj
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]

loc_A2394:
		call	dword ptr [bx+2Ch]

loc_A2397:
		add	sp, 0Ah

loc_A239A:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A2284j
					; PaletteScreen_UpdateWidgetMain_A21AF:loc_A22C3j	...
		mov	al, [si+10h]
		shr	ax, 5

loc_A23A0:
		and	ax, 1

loc_A23A3:
		or	ax, ax

loc_A23A5:
		jz	short loc_A23DD

loc_A23A7:
		mov	al, [si+10h]

loc_A23AA:
		and	ax, 1
		or	ax, ax
		jz	short loc_A23DD

loc_A23B1:
		mov	al, [si+10h]

loc_A23B4:
		shr	ax, 2

loc_A23B7:
		and	ax, 1
		or	ax, ax
		jz	short loc_A23DD
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jnz	short loc_A23CF
		and	byte ptr [si+10h], 0DFh

loc_A23CF:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+21Aj
		push	si
		push	cs

loc_A23D1:
		call	near ptr PaletteScreen_AcquireOwnership_A1240

loc_A23D4:
		pop	cx
		push	si

loc_A23D6:
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_A23DD:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF:loc_A23A5j
					; PaletteScreen_UpdateWidgetMain_A21AF+200j ...
		push	si

loc_A23DE:
		push	cs

loc_A23DF:
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A23E3:				; CODE XREF: PaletteScreen_UpdateWidgetMain_A21AF+28j
		pop	di

loc_A23E4:
		pop	si
		leave
		retf
PaletteScreen_UpdateWidgetMain_A21AF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_6C875 (stub voisin), encadré par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetVariantC_A23E7	proc far		; CODE XREF: VROOMM_StubThunk_6C7DFJ

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
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	word_6FEDC
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [si+6]

loc_A2401:
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		call	VROOMM_StubThunk_6C884
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetVariantC_A23E7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique un style de texte (TextScroll_FormatAndApply_67204, sub_28A63/sub_288A6
; externes).
; ==============================================================================================
PaletteScreen_ApplyTextStyle_A241D	proc far		; CODE XREF: VROOMM_StubThunk_6C7C1J
					; PaletteScreen_DrawCurveWithLabel_A24C7:loc_A2512p	...

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_A2423:
		mov	ax, [bp+arg_0]

loc_A2426:				; CODE XREF: PaletteScreen_ApplyTextStyle_A241D+41j
		push	584Eh
		call	TextScroll_FormatAndApply_67204
		pop	cx

loc_A242F:
		cmp	byte_728FE, 0
		jnz	short loc_A2456
		push	584Eh

loc_A2439:
		call	Input_ReadCombinedAxes
		pop	cx

loc_A243F:
		mov	ah, 0
		or	ax, ax

loc_A2443:
		jnz	short loc_A2456
		lea	ax, [bp+var_4]
		push	ax
		push	584Eh
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short $+2

loc_A2456:				; CODE XREF: PaletteScreen_ApplyTextStyle_A241D+17j
					; PaletteScreen_ApplyTextStyle_A241D:loc_A2443j
		mov	al, byte_728FE

loc_A2459:
		mov	ah, 0

loc_A245B:
		cmp	ax, 2
		jnz	short loc_A2426
		leave

locret_A2461:
		retf
PaletteScreen_ApplyTextStyle_A241D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de PaletteScreen_ApplyTextStyle_A241D.
; ==============================================================================================
PaletteScreen_ApplyTextStyleB_A2462	proc far		; CODE XREF: VROOMM_StubThunk_6C7C6J

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

loc_A2470:
		mov	di, [bp+arg_4]

loc_A2473:				; CODE XREF: PaletteScreen_ApplyTextStyleB_A2462+5Fj
		push	584Eh
		call	TextScroll_FormatAndApply_67204
		pop	cx
		cmp	byte_728FE, 0
		jnz	short loc_A24A3
		push	584Eh
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax

loc_A2490:
		jnz	short loc_A24A3
		lea	ax, [bp+var_4]
		push	ax

loc_A2496:
		push	584Eh
		call	Input_ReadAxis2Deadzone
		add	sp, 4

loc_A24A1:
		jmp	short $+2

loc_A24A3:				; CODE XREF: PaletteScreen_ApplyTextStyleB_A2462+1Fj
					; PaletteScreen_ApplyTextStyleB_A2462:loc_A2490j
		mov	al, byte_728FE

loc_A24A6:
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_A24B9
		mov	ax, word_72900
		sar	ax, 1
		mov	[si], ax
		mov	ax, word_72902
		mov	[di], ax

loc_A24B9:				; CODE XREF: PaletteScreen_ApplyTextStyleB_A2462+49j
		mov	al, byte_728FE
		mov	ah, 0

loc_A24BE:
		cmp	ax, 2
		jnz	short loc_A2473

loc_A24C3:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ApplyTextStyleB_A2462	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 294 lignes, NON DÉTAILLÉE — combine PaletteScreen_DrawCurveShape_A1375 (×4),
; PaletteScreen_ApplyTextStyle_A241D, TextScroll_FormatAndApply_67204 — dessin d'une forme
; courbe avec étiquette de texte. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawCurveWithLabel_A24C7	proc far		; CODE XREF: VROOMM_StubThunk_6C74EJ

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

loc_A24C8:
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

loc_A24E1:
		mov	ax, [si+1Ch]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]

loc_A24FF:
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		push	si
		push	cs

loc_A2512:
		call	near ptr PaletteScreen_ApplyTextStyle_A241D
		pop	cx
		mov	[bp+var_C], 0

loc_A251B:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+161j
		push	584Eh
		call	TextScroll_FormatAndApply_67204
		pop	cx

loc_A2524:
		cmp	byte_728FE, 0
		jnz	short loc_A254B
		push	584Eh
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A254B
		lea	ax, [bp+var_10]
		push	ax
		push	584Eh

loc_A2541:
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short $+2

loc_A254B:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+62j
					; PaletteScreen_DrawCurveWithLabel_A24C7+71j
		mov	al, byte_728FE
		mov	ah, 0

loc_A2550:
		cmp	ax, 1

loc_A2553:
		jnz	short loc_A2560

loc_A2555:
		mov	al, byte_728FF
		mov	ah, 0
		and	ax, 2

loc_A255D:
		mov	[bp+var_C], ax

loc_A2560:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7:loc_A2553j
		mov	al, byte_728FE

loc_A2563:
		mov	ah, 0

loc_A2565:
		cmp	ax, 3

loc_A2568:
		jz	short loc_A256D
		jmp	loc_A261E
; ���������������������������������������������������������������������������

loc_A256D:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7:loc_A2568j
		push	si

loc_A256E:
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx

loc_A2573:
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8

loc_A2584:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		mov	bx, word_72900
		sar	bx, 1

loc_A2590:
		mov	cx, word_72902
		mov	ax, bx
		sub	ax, [bp+arg_6]
		cmp	ax, [bp+var_8]
		jge	short loc_A25A6
		mov	ax, bx

loc_A25A0:
		sub	ax, [bp+arg_6]
		mov	[bp+var_8], ax

loc_A25A6:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+D5j
		mov	ax, cx
		sub	ax, [bp+arg_8]
		cmp	ax, [bp+var_A]
		jge	short loc_A25B8
		mov	ax, cx
		sub	ax, [bp+arg_8]
		mov	[bp+var_A], ax

loc_A25B8:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+E7j
		mov	ax, [bp+arg_A]
		inc	ax

loc_A25BC:
		sub	ax, bx
		mov	dx, [bp+var_4]

loc_A25C1:
		sub	dx, [bp+var_8]
		cmp	ax, dx

loc_A25C6:
		jge	short loc_A25D6

loc_A25C8:
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, bx

loc_A25CE:
		mov	dx, [bp+var_4]
		sub	dx, ax

loc_A25D3:
		mov	[bp+var_8], dx

loc_A25D6:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7:loc_A25C6j
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, cx
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]

loc_A25E2:
		cmp	ax, dx
		jge	short loc_A25F4
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, cx
		mov	dx, [bp+var_6]
		sub	dx, ax
		mov	[bp+var_A], dx

loc_A25F4:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+11Dj
		mov	di, bx
		sub	di, [bp+var_8]
		mov	ax, cx
		sub	ax, [bp+var_A]
		mov	[bp+var_2], ax
		push	si
		push	cs

loc_A2603:
		call	near ptr PaletteScreen_AcquireOwnership_A1240

loc_A2606:
		pop	cx

loc_A2607:
		push	[bp+var_6]
		push	[bp+var_4]

loc_A260D:
		push	[bp+var_2]
		push	di
		push	cs

loc_A2612:
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A261E:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+A3j
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_A262B
		jmp	loc_A251B
; ���������������������������������������������������������������������������

loc_A262B:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+15Fj
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_A2665
		mov	ax, [bp+var_2]
		sub	ax, [si+6]
		push	ax
		mov	ax, di
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]

loc_A265F:
		call	dword ptr [bx+8]

loc_A2662:
		add	sp, 6

loc_A2665:				; CODE XREF: PaletteScreen_DrawCurveWithLabel_A24C7+185j
		mov	ax, [bp+var_C]

loc_A2668:
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveWithLabel_A24C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 298 lignes, NON DÉTAILLÉE — variante de PaletteScreen_DrawCurveWithLabel_A24C7
; (mêmes appels). Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawCurveWithLabelB_A2671	proc far		; CODE XREF: VROOMM_StubThunk_6C753J

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

loc_A2672:
		mov	bp, sp
		sub	sp, 18h
		push	si

loc_A2678:
		push	di
		mov	si, [bp+arg_0]

loc_A267C:
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	di, [si+1Ah]
		mov	ax, [si+1Ch]
		mov	[bp+var_6], ax
		push	si
		push	cs

loc_A2693:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs

loc_A26A2:
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		push	si
		push	cs

loc_A26B0:
		call	near ptr PaletteScreen_ApplyTextStyle_A241D

loc_A26B3:
		pop	cx

loc_A26B4:
		mov	[bp+var_C], 0

loc_A26B9:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671:loc_A2798j
		push	584Eh

loc_A26BC:
		call	TextScroll_FormatAndApply_67204

loc_A26C1:
		pop	cx

loc_A26C2:
		cmp	byte_728FE, 0
		jnz	short loc_A26E9
		push	584Eh
		call	Input_ReadCombinedAxes

loc_A26D1:
		pop	cx

loc_A26D2:
		mov	ah, 0

loc_A26D4:
		or	ax, ax

loc_A26D6:
		jnz	short loc_A26E9

loc_A26D8:
		lea	ax, [bp+var_10]
		push	ax
		push	584Eh

loc_A26DF:
		call	Input_ReadAxis2Deadzone

loc_A26E4:
		add	sp, 4
		jmp	short $+2

loc_A26E9:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+56j
					; PaletteScreen_DrawCurveWithLabelB_A2671:loc_A26D6j
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_A26FE
		mov	al, byte_728FF
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_C], ax

loc_A26FE:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+80j
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_A270B
		jmp	loc_A278E
; ���������������������������������������������������������������������������

loc_A270B:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+95j
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		mov	ax, word_72900
		sar	ax, 1
		mov	[bp+var_8], ax

loc_A2730:
		mov	ax, word_72902

loc_A2733:
		mov	[bp+var_A], ax

loc_A2736:
		mov	di, [bp+var_8]

loc_A2739:
		sub	di, [bp+var_2]
		inc	di

loc_A273D:
		cmp	di, [bp+arg_2]
		jge	short loc_A2747

loc_A2742:
		mov	di, [bp+arg_2]
		jmp	short loc_A274F
; ���������������������������������������������������������������������������

loc_A2747:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+CFj
		cmp	di, [bp+arg_6]
		jle	short loc_A274F
		mov	di, [bp+arg_6]

loc_A274F:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+D4j
					; PaletteScreen_DrawCurveWithLabelB_A2671+D9j
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_4]
		inc	ax
		mov	[bp+var_6], ax

loc_A2759:
		cmp	ax, [bp+arg_4]

loc_A275C:
		jge	short loc_A2763
		mov	ax, [bp+arg_4]

loc_A2761:
		jmp	short loc_A276E
; ���������������������������������������������������������������������������

loc_A2763:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671:loc_A275Cj
		mov	ax, [bp+var_6]
		cmp	ax, [bp+arg_8]
		jle	short loc_A2771
		mov	ax, [bp+arg_8]

loc_A276E:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671:loc_A2761j
		mov	[bp+var_6], ax

loc_A2771:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+F8j
		push	si
		push	cs

loc_A2773:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx

loc_A278E:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+97j
		mov	al, byte_728FE
		mov	ah, 0

loc_A2793:
		cmp	ax, 2
		jz	short loc_A279B

loc_A2798:
		jmp	loc_A26B9
; ���������������������������������������������������������������������������

loc_A279B:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+125j
		push	si
		push	cs

loc_A279D:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx

loc_A27A1:
		push	[bp+var_6]
		push	di
		push	[bp+var_4]

loc_A27A8:
		push	[bp+var_2]
		push	cs

loc_A27AC:
		call	near ptr PaletteScreen_DrawCurveShape_A1375
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_A27FF
		mov	ax, [si+4]

loc_A27C1:
		mov	[bp+var_12], ax
		mov	ax, [si+6]
		mov	[bp+var_14], ax
		mov	[bp+var_16], di
		mov	ax, [bp+var_6]

loc_A27D0:
		mov	[bp+var_18], ax

loc_A27D3:
		mov	ax, [bp+var_12]
		mov	[si+4],	ax
		mov	ax, [bp+var_14]
		mov	[si+6],	ax
		mov	ax, [bp+var_16]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_18]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8],	ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax

loc_A27FF:				; CODE XREF: PaletteScreen_DrawCurveWithLabelB_A2671+14Bj
		mov	ax, [bp+var_C]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveWithLabelB_A2671	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_6C875 (stub voisin).
; ==============================================================================================
PaletteScreen_Helper_A280B	proc far		; CODE XREF: VROOMM_StubThunk_6C7FDJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A2813:
		push	word ptr [si+24h]
		call	VROOMM_StubThunk_6C875
		pop	cx
		mov	cx, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	di, [si+1Ah]
		sub	di, ax
		mov	word ptr [si+1Eh], 0

loc_A2830:
		cmp	cx, di
		jge	short loc_A2840
		mov	ax, di
		sub	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+1Eh], ax

loc_A2840:				; CODE XREF: PaletteScreen_Helper_A280B+27j
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_Helper_A280B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6C875 et sub_6C87A (stubs voisins).
; ==============================================================================================
PaletteScreen_HelperB_A2844	proc far		; CODE XREF: VROOMM_StubThunk_6C802J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A284F:
		push	word ptr [si+24h]

loc_A2852:
		call	VROOMM_StubThunk_6C875

loc_A2857:
		pop	cx

loc_A2858:
		mov	di, ax
		mov	ax, [si+16h]

loc_A285D:
		add	ax, [si+18h]

loc_A2860:
		shl	ax, 1

loc_A2862:
		mov	dx, [si+1Ah]

loc_A2865:
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+20h], 0
		jmp	short loc_A288A
; ���������������������������������������������������������������������������

loc_A2871:				; CODE XREF: PaletteScreen_HelperB_A2844+49j
		mov	ax, [si+20h]
		inc	word ptr [si+20h]
		mov	bx, [si+24h]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	VROOMM_StubThunk_6C87A
		pop	cx
		add	ax, 2
		sub	di, ax

loc_A288A:				; CODE XREF: PaletteScreen_HelperB_A2844+2Bj
		cmp	di, [bp+var_2]
		jg	short loc_A2871
		pop	di
		pop	si
		leave
		retf
PaletteScreen_HelperB_A2844	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 125 lignes, NON DÉTAILLÉE — combine PaletteScreen_DrawWidgetBorderWrapper_A21A1,
; PaletteScreen_ComputeAndClipRegion_A2034, TextFormat_ApplyStyleAttribute_5E2D0 (×2),
; TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
PaletteScreen_DrawBorderAndText_A2893	proc far		; CODE XREF: VROOMM_StubThunk_6C807J

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
		jnz	short loc_A28AC
		push	si
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_A1CE1
		pop	cx
		jmp	short loc_A28B7
; ���������������������������������������������������������������������������

loc_A28AC:				; CODE XREF: PaletteScreen_DrawBorderAndText_A2893+Fj
		push	word ptr [si+22h]
		push	si
		push	cs
		call	near ptr PaletteScreen_ComputeAndClipRegion_A2034
		add	sp, 4

loc_A28B7:				; CODE XREF: PaletteScreen_DrawBorderAndText_A2893+17j
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+1Eh]
		mov	dl, [si+10h]

loc_A28C3:
		shr	dx, 5

loc_A28C6:
		and	dx, 1
		add	ax, dx
		mov	[bp+var_2], ax

loc_A28CE:
		mov	ax, [si+16h]

loc_A28D1:
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_4], ax

loc_A28E2:
		mov	di, [si+28h]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_A28F5
		mov	di, [si+26h]

loc_A28F5:				; CODE XREF: PaletteScreen_DrawBorderAndText_A2893+5Dj
		mov	ax, word_6FEDC
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_14], 0

loc_A2903:
		mov	[bp+var_12], 0
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	si
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	word_6FEDC
		push	di

loc_A2930:
		mov	ax, [si+24h]
		add	ax, [si+20h]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	VROOMM_StubThunk_6C884

loc_A2942:
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		lea	ax, [bp+var_14]
		push	ax

loc_A294F:
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax

loc_A2962:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawBorderAndText_A2893	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_338, sub_2B1C, sub_658, sub_2A82 — libération de ressources associées au
; widget.
; ==============================================================================================
PaletteScreen_ReleaseResources_A296C	proc far		; CODE XREF: VROOMM_StubThunk_6C7F8J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A296F:
		sub	sp, 2
		push	si

loc_A2973:
		push	di

loc_A2974:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+24h], 0
		jz	short loc_A2989
		push	word ptr [si+24h]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A2989:				; CODE XREF: PaletteScreen_ReleaseResources_A296C+12j
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
		jz	short loc_A29B0
		push	di
		push	word ptr [si+24h]
		call	CRT_Strcpy
		add	sp, 4

loc_A29B0:				; CODE XREF: PaletteScreen_ReleaseResources_A296C+36j
		pop	di

loc_A29B1:
		pop	si
		leave

locret_A29B3:
		retf
PaletteScreen_ReleaseResources_A296C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine PaletteScreen_DrawWidgetBorderWrapper_A21A1, Memory_TypedAllocDispatchB_5C832,
; Render_MeasureOrDrawTextString_61F52 (seg174).
; ==============================================================================================
PaletteScreen_MeasureAndDrawBorder_A29B4	proc far		; CODE XREF: VROOMM_StubThunk_6C80CJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_A29B7:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si

loc_A29BF:
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_A1CE1
		pop	cx

loc_A29C4:
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	ax, [si+6]

loc_A29D3:
		add	ax, [si+16h]

loc_A29D6:
		add	ax, [si+18h]
		mov	dl, [si+10h]

loc_A29DC:
		shr	dx, 5
		and	dx, 1

loc_A29E2:
		add	ax, dx
		mov	[bp+var_4], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_A2A02:
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		pop	si
		leave
		retf
PaletteScreen_MeasureAndDrawBorder_A29B4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 143 lignes, NON DÉTAILLÉE — variante de PaletteScreen_MeasureAndDrawBorder_A29B4,
; ajoute TextFormat_ApplyStyleAttribute_5E2D0 (×2), TextFormat_ReleaseStyleList_5E526.
; ==============================================================================================
PaletteScreen_MeasureAndDrawBorderB_A2A22	proc far		; CODE XREF: VROOMM_StubThunk_6C820J

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

loc_A2A32:
		add	ax, [si+18h]

loc_A2A35:
		mov	[bp+var_2], ax

loc_A2A38:
		mov	ax, [si+6]
		add	ax, [si+16h]

loc_A2A3E:
		add	ax, [si+18h]

loc_A2A41:
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]

loc_A2A50:
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_6], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]

loc_A2A61:
		mov	dl, [si+10h]

loc_A2A64:
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_8], ax
		mov	ax, word_6FEDC
		add	ax, 2
		mov	[bp+var_A], ax
		mov	[bp+var_18], 0

loc_A2A7D:
		mov	[bp+var_16], 0
		push	ax

loc_A2A83:
		lea	ax, [bp+var_18]
		push	ax

loc_A2A87:
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	si

loc_A2A90:
		mov	ax, word_6FEDC

loc_A2A93:
		add	ax, 2

loc_A2A96:
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	si
		push	cs

loc_A2AA1:
		call	near ptr PaletteScreen_AcquireOwnership_A1240
		pop	cx

loc_A2AA5:
		mov	ax, [si+28h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1

loc_A2AB1:
		add	ax, dx
		push	ax
		push	0
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]

loc_A2AD1:
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	word_6FEDC
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		call	VROOMM_StubThunk_6C884
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_A125D
		pop	cx
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	si
		leave
		retf
PaletteScreen_MeasureAndDrawBorderB_A2A22	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_6C875 (stub voisin).
; ==============================================================================================
PaletteScreen_HelperC_A2B1F	proc far		; CODE XREF: VROOMM_StubThunk_6C816J PaletteScreen_ReleaseResourcesB_A2BA7+46p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	VROOMM_StubThunk_6C875
		pop	cx
		mov	cx, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	di, [si+1Ah]
		sub	di, ax
		mov	word ptr [si+2Ah], 0
		cmp	cx, di
		jge	short loc_A2B54
		mov	ax, di
		sub	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1

loc_A2B51:
		mov	[si+2Ah], ax

loc_A2B54:				; CODE XREF: PaletteScreen_HelperC_A2B1F+27j
		pop	di
		pop	si

loc_A2B56:
		pop	bp

locret_A2B57:
		retf
PaletteScreen_HelperC_A2B1F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6C875 et sub_6C87A (stubs voisins).
; ==============================================================================================
PaletteScreen_HelperD_A2B58	proc far		; CODE XREF: VROOMM_StubThunk_6C81BJ

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_A2B59:
		mov	bp, sp
		sub	sp, 2

loc_A2B5E:
		push	si

loc_A2B5F:
		push	di
		mov	si, [bp+arg_0]

loc_A2B63:
		push	word ptr [si+2Eh]
		call	VROOMM_StubThunk_6C875
		pop	cx
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]

loc_A2B79:
		sub	dx, ax

loc_A2B7B:
		mov	[bp+var_2], dx

loc_A2B7E:
		mov	word ptr [si+2Ch], 0
		jmp	short loc_A2B9E
; ���������������������������������������������������������������������������

loc_A2B85:				; CODE XREF: PaletteScreen_HelperD_A2B58+49j
		mov	ax, [si+2Ch]
		inc	word ptr [si+2Ch]
		mov	bx, [si+2Eh]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	VROOMM_StubThunk_6C87A
		pop	cx
		add	ax, 2
		sub	di, ax

loc_A2B9E:				; CODE XREF: PaletteScreen_HelperD_A2B58+2Bj
		cmp	di, [bp+var_2]
		jg	short loc_A2B85

loc_A2BA3:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_HelperD_A2B58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_338, sub_2B1C, sub_658, sub_2A82, PaletteScreen_HelperC_A2B1F.
; ==============================================================================================
PaletteScreen_ReleaseResourcesB_A2BA7	proc far		; CODE XREF: VROOMM_StubThunk_6C811J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A2BA8:
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di

loc_A2BAF:
		mov	si, [bp+arg_0]

loc_A2BB2:
		mov	di, [bp+arg_2]

loc_A2BB5:
		cmp	word ptr [si+2Eh], 0
		jz	short loc_A2BC4
		push	word ptr [si+2Eh]
		call	CRT_FreeNear_Wrap

loc_A2BC3:
		pop	cx

loc_A2BC4:				; CODE XREF: PaletteScreen_ReleaseResourcesB_A2BA7+12j
		push	di

loc_A2BC5:
		call	CRT_Strlen
		pop	cx
		inc	ax
		mov	[bp+var_2], ax
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+2Eh], ax
		cmp	word ptr [si+2Eh], 0
		jz	short loc_A2BEB
		push	di
		push	word ptr [si+2Eh]

loc_A2BE3:
		call	CRT_Strcpy
		add	sp, 4

loc_A2BEB:				; CODE XREF: PaletteScreen_ReleaseResourcesB_A2BA7+36j
		push	si
		push	cs
		call	near ptr PaletteScreen_HelperC_A2B1F
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ReleaseResourcesB_A2BA7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réinitialise un indicateur global (byte_728FE).
; ==============================================================================================
PaletteScreen_ResetGlobalFlag_A2BF5	proc far		; CODE XREF: VROOMM_StubThunk_6C848J
		push	bp
		mov	bp, sp
		mov	byte_728FE, 0
		pop	bp
		retf
PaletteScreen_ResetGlobalFlag_A2BF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_A2BFF	proc far		; CODE XREF: VROOMM_StubThunk_6C730J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A2C24
		push	si
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_A2C24
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_A2C24:				; CODE XREF: PaletteScreen_ReleaseStyleAndObject_A2BFF+Dj
					; PaletteScreen_ReleaseStyleAndObject_A2BFF+1Aj
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_A2BFF	endp

seg442		ends
