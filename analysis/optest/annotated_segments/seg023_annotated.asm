seg023		segment	byte public 'CODE' use16
		assume cs:seg023
		;org 9
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_F859	proc far		; CODE XREF: sub_D998+9P seg021:0A99P	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_F85C:				; DATA XREF: seg170:0176o
		push	si
		mov	si, [bp+arg_0]
		cmp	word_45ADE, 0
		jnz	short loc_F875
		mov	word_45ADE, si
		mov	byte_497C0, 0
		call	TextScrollDisplayB_ApplyHelperD_3F784

loc_F875:				; CODE XREF: sub_F859+Cj
		pop	si
		pop	bp
		retf
sub_F859	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_F878	proc far		; CODE XREF: sub_D998+2BP seg021:0B13P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_45ADE, si
		jnz	short loc_F895
		mov	word_45ADE, 0
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		mov	byte_497C0, 1

loc_F895:				; CODE XREF: sub_F878+Bj
		pop	si
		pop	bp
		retf
sub_F878	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_SetFlagBit0_A127B (sub_A127B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_F898	proc far		; CODE XREF: seg021:04D6P
					; DATA XREF: dseg:0740o ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 1
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_F898	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_ClearFlagBit0_A1289 (sub_A1289 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, efface le bit 0 du champ de flags (+0x10)
; d'un widget.
; ==============================================================================================
Widget_ClearFlagBit0_F8A6	proc far		; CODE XREF: seg021:0504P
					; DATA XREF: dseg:0744o ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		and	byte ptr [si+10h], 0FEh
		pop	si
		pop	bp
		retf
Widget_ClearFlagBit0_F8A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_TranslateBounds_A1297 (sub_A1297 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, translate les 2 coins d'un rectangle de
; widget (+4/+6/+8/+0xA) par un décalage (dx,cx).
; ==============================================================================================
Widget_TranslateBounds_F8B4	proc far		; CODE XREF: seg021:04A9P seg022:01DFP
					; DATA XREF: ...

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
Widget_TranslateBounds_F8B4	endp

; ���������������������������������������������������������������������������

loc_F8D0:				; DATA XREF: dseg:0710o dseg:074Co ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_F8DC:				; DATA XREF: dseg:0750o dseg:0784o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_F8E4:				; DATA XREF: dseg:0718o dseg:0754o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_F8EC:				; DATA XREF: dseg:0720o dseg:075Co ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_F900:				; DATA XREF: dseg:0760o dseg:0794o ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_F90C:				; DATA XREF: dseg:0764o dseg:0798o ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_F918:				; DATA XREF: dseg:0730o dseg:07D4o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	dword ptr [bp-8], 0
		mov	dword ptr [bp-4], 2
		mov	dword ptr [bp-0Ch], 0

loc_F93E:				; CODE XREF: seg023:0145j
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_F974
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_F972
		lea	ax, [bp-10h]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_F972:				; CODE XREF: seg023:010Fj
		jmp	short $+2

loc_F974:				; CODE XREF: seg023:00FEj
		mov	eax, dword_47ABB
		mov	[bp-8],	eax
		lea	ax, [bp-8]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2
		add	dword ptr [bp-0Ch], 2
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_F93E
		mov	eax, [bp-0Ch]
		shld	edx, eax, 10h
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawCurveShape_A1375 (sub_A1375 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, trace une forme courbe en 4 segments via
; Render_ClipAndDrawLineVariant_62EC8 (seg183) — probable dessin d'un graphe/jauge en arc.
; ==============================================================================================
PaletteScreen_DrawCurveShape_F9A4	proc far		; CODE XREF: seg023:121Bp seg023:12A3p ...

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
		push	word_46F46
		call	Render_ClipAndDrawLineVariant_33E78
		add	sp, 0Ch
		push	0FFh
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]
		push	word_46F46
		call	Render_ClipAndDrawLineVariant_33E78
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	si
		mov	ax, di
		inc	ax
		push	ax
		push	si
		push	word_46F46
		call	Render_ClipAndDrawLineVariant_33E78
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, si
		inc	ax
		push	ax
		push	word_46F46
		call	Render_ClipAndDrawLineVariant_33E78
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveShape_F9A4	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		mov	dh, [bp+8]
		mov	ch, [bp+0Ah]
		mov	cl, [bp+0Ch]
		mov	ax, 1010h
		int	10h		; - VIDEO - SET	INDIVIDUAL DAC REGISTER	(EGA, VGA/MCGA)
					; BX = register	number,	CH = new value for green (0-63)
					; CL = new value for blue (0-63), DH = new value for red (0-63)
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		mov	ax, 1015h
		int	10h		; - VIDEO - READ INDIVIDUAL DAC	REGISTER (EGA, VGA/MCGA)
					; BL = palette register	number
					; Return: DH = red value, CH = green value, CL = blue value
		les	bx, [bp+8]
		mov	es:[bx], dh
		mov	es:[bx+1], ch
		mov	es:[bx+2], cl
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FA5F	proc far		; CODE XREF: sub_CE2C+35P sub_FBB3+24p ...

var_12		= word ptr -12h
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
		sub	sp, 12h
		push	si
		push	di
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 300h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	[bp+var_6], 0
		mov	di, 7FFFh
		xor	cx, cx
		jmp	short loc_FAF7
; ���������������������������������������������������������������������������

loc_FA83:				; CODE XREF: sub_FA5F+9Ej
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
		jge	short loc_FAF2
		mov	[bp+var_6], cx
		mov	di, si

loc_FAF2:				; CODE XREF: sub_FA5F+8Cj
		inc	cx
		add	word ptr [bp+arg_0], 3

loc_FAF7:				; CODE XREF: sub_FA5F+22j
		mov	ax, word ptr [bp+arg_0]
		cmp	ax, [bp+var_4]
		jb	short loc_FA83
		mov	ax, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
sub_FA5F	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_ReadAllDACRegisters_A14C2 (sub_A14C2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit les 256 registres DAC par blocs de 16
; (int 10h, fonction 1017h — READ BLOCK OF DAC REGISTERS) dans un tampon fourni.
; ==============================================================================================
Palette_ReadAllDACRegisters_FB0A	proc far		; CODE XREF: sub_FBB3+Ep sub_FBE7+31p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	dx, [bp+arg_0]
		xor	bx, bx
		mov	cx, 10h

loc_FB15:				; CODE XREF: Palette_ReadAllDACRegisters_FB0A+19j
		mov	ax, 1017h
		int	10h		; - VIDEO - READ BLOCK OF DAC REGISTERS	(EGA, VGA/MCGA)
					; BX = starting	palette	register, CX = number of palette registers to read
					; ES:DX	-> buffer (3 * CX bytes	in size)
					; Return: CX number of red, green and blue triples in buffer
		add	dx, 30h	; '0'
		add	bx, cx
		cmp	bx, 100h
		jl	short loc_FB15
		pop	bp
		retf
Palette_ReadAllDACRegisters_FB0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_WriteAllDACRegisters_A14DF (sub_A14DF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit les 256 registres DAC en un seul appel
; (int 10h, fonction 1012h — SET BLOCK OF DAC REGISTERS).
; ==============================================================================================
Palette_WriteAllDACRegisters_FB27	proc far		; CODE XREF: sub_FBE7+241p

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
Palette_WriteAllDACRegisters_FB27	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FB39	proc far		; CODE XREF: sub_FBE7+51p sub_FBE7+68p ...

arg_0		= dword	ptr  6
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
		add	word ptr [bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_6]
		mov	es:[bx], al
		inc	word ptr [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_8]
		mov	es:[bx], al
		inc	word ptr [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_A]
		mov	es:[bx], al
		pop	bp
		retf
sub_FB39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FB6B	proc far		; CODE XREF: seg021:0B4EP

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
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		shl	ax, 6
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		shl	ax, 6
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr sub_FBB3
		add	sp, 6
		leave
		retf
sub_FB6B	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FBB3	proc far		; CODE XREF: sub_FB6B+3Ep

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
		call	near ptr Palette_ReadAllDACRegisters_FB0A
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	ss
		lea	ax, [bp+var_302]
		push	ax
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		leave
		retf
sub_FBB3	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FBE7	proc far		; CODE XREF: sub_5DD30+156P

var_304		= word ptr -304h
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 304h
		mov	[bp+var_4], 0
		cmp	[bp+arg_2], 0
		jz	short loc_FC07
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		jmp	short loc_FC1E
; ���������������������������������������������������������������������������

loc_FC07:				; CODE XREF: sub_FBE7+14j
		lea	ax, [bp+var_304]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		push	ss
		lea	ax, [bp+var_304]
		push	ax
		push	cs
		call	near ptr Palette_ReadAllDACRegisters_FB0A
		add	sp, 4

loc_FC1E:				; CODE XREF: sub_FBE7+1Ej
		cmp	[bp+arg_0], 0
		jnz	short loc_FC27
		jmp	loc_FE31
; ���������������������������������������������������������������������������

loc_FC27:				; CODE XREF: sub_FBE7+3Bj
		push	0
		push	0
		push	0
		push	word_45B00
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	0
		push	0
		push	0
		push	word_45B02
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	25h ; '%'
		push	25h ; '%'
		push	25h ; '%'
		push	word_45B04
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	29h ; ')'
		push	2Ch ; ','
		push	29h ; ')'
		push	word_45B06
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	31h ; '1'
		push	31h ; '1'
		push	31h ; '1'
		push	word_45B08
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	word_45B0A
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	0
		push	0
		push	0
		push	word_45AE0
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	2Ah ; '*'
		push	0
		push	0
		push	word_45AE2
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	0
		push	2Ah ; '*'
		push	0
		push	word_45AE4
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	2Ah ; '*'
		push	2Ah ; '*'
		push	0
		push	word_45AE6
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	0
		push	0
		push	2Ah ; '*'
		push	word_45AE8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	2Ah ; '*'
		push	0
		push	2Ah ; '*'
		push	word_45AEA
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	0
		push	15h
		push	2Ah ; '*'
		push	word_45AEC
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	2Ah ; '*'
		push	2Ah ; '*'
		push	2Ah ; '*'
		push	word_45AEE
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	15h
		push	15h
		push	15h
		push	word_45AF0
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	3Fh ; '?'
		push	15h
		push	15h
		push	word_45AF2
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	15h
		push	3Fh ; '?'
		push	15h
		push	word_45AF4
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	15h
		push	word_45AF6
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	15h
		push	15h
		push	3Fh ; '?'
		push	word_45AF8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	3Fh ; '?'
		push	15h
		push	3Fh ; '?'
		push	word_45AFA
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	15h
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	word_45AFC
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	word_45AFE
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FB39
		add	sp, 0Ch
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr Palette_WriteAllDACRegisters_FB27
		add	sp, 4
		jmp	locret_FED4
; ���������������������������������������������������������������������������

loc_FE31:				; CODE XREF: sub_FBE7+3Dj
		push	0
		push	0
		push	0
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45AE0, ax
		mov	word_45B02, ax
		mov	word_45B00, ax
		push	25h ; '%'
		push	25h ; '%'
		push	25h ; '%'
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45B04, ax
		push	15h
		push	15h
		push	15h
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45AF0, ax
		push	29h ; ')'
		push	2Ch ; ','
		push	29h ; ')'
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45B06, ax
		push	31h ; '1'
		push	31h ; '1'
		push	31h ; '1'
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45B08, ax
		push	2Ah ; '*'
		push	2Ah ; '*'
		push	2Ah ; '*'
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45AEE, ax
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_FA5F
		add	sp, 0Ah
		mov	word_45AFE, ax
		mov	word_45B0A, ax

locret_FED4:				; CODE XREF: sub_FBE7+247j
		leave
		retf
sub_FBE7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FED6	proc far		; CODE XREF: sub_D2CC+28P seg025:06ADP ...

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
		jnz	short loc_FEF7
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_FEF7
		jmp	loc_FF80
; ���������������������������������������������������������������������������

loc_FEF7:				; CODE XREF: sub_FED6+Cj sub_FED6+1Cj
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		mov	word ptr [si+0Eh], 2AECh
		push	word_46F46
		push	si
		call	TextFormat_ApplyStyleAttribute_2E9A4
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
		and	byte ptr [si+10h], 0EFh
		and	byte ptr [si+10h], 0FEh
		and	byte ptr [si+10h], 0F7h
		and	byte ptr [si+15h], 0F0h
		mov	word ptr [si+16h], 1
		mov	word ptr [si+18h], 1

loc_FF80:				; CODE XREF: sub_FED6+1Ej
		mov	ax, si
		pop	si
		leave
		retf
sub_FED6	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	byte ptr [si+10h], 8
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_SetFlagBit4AndOffsets_A1ADF (sub_A1ADF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, pose le bit 4 du champ de flags (+0x10) et
; écrit deux champs d'offset (+0x11/+0x13).
; ==============================================================================================
Widget_SetFlagBit4AndOffsets_FF96	proc far		; CODE XREF: sub_1220C+5C1P
					; sub_1220C+6CCP ...

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
Widget_SetFlagBit4AndOffsets_FF96	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_FFB0	proc far		; CODE XREF: sub_10110+28p
					; sub_10142+7Cp

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
		call	near ptr sub_F859
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
		jnz	short loc_FFE1
		jmp	loc_10074
; ���������������������������������������������������������������������������

loc_FFE1:				; CODE XREF: sub_FFB0+2Cj
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
		jmp	short loc_1006C
; ���������������������������������������������������������������������������

loc_FFFB:				; CODE XREF: sub_FFB0+BFj
		test	[bp+arg_A], 2
		jz	short loc_1000C
		mov	ax, [bp+arg_2]
		add	ax, di
		mov	[bp+var_E], ax
		jmp	short loc_10014
; ���������������������������������������������������������������������������

loc_1000C:				; CODE XREF: sub_FFB0+50j
		mov	ax, [bp+var_2]
		sub	ax, di
		mov	[bp+var_E], ax

loc_10014:				; CODE XREF: sub_FFB0+5Aj
		mov	ax, [bp+var_C]
		sub	[bp+var_A], ax
		cmp	[bp+var_A], 10h
		jge	short loc_1002D
		mov	[bp+var_8], 0
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		jmp	short loc_10043
; ���������������������������������������������������������������������������

loc_1002D:				; CODE XREF: sub_FFB0+6Ej
		mov	ax, [bp+var_A]
		sar	ax, 4
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_10043:				; CODE XREF: sub_FFB0+7Bj
		mov	al, byte ptr word_45B02
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
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di

loc_1006C:				; CODE XREF: sub_FFB0+49j
		cmp	di, [bp+arg_6]
		jl	short loc_FFFB
		jmp	loc_10104
; ���������������������������������������������������������������������������

loc_10074:				; CODE XREF: sub_FFB0+2Ej
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
		jmp	short loc_100FF
; ���������������������������������������������������������������������������

loc_1008E:				; CODE XREF: sub_FFB0+152j
		test	[bp+arg_A], 2
		jz	short loc_1009F
		mov	ax, [bp+var_4]
		sub	ax, di
		mov	[bp+var_E], ax
		jmp	short loc_100A7
; ���������������������������������������������������������������������������

loc_1009F:				; CODE XREF: sub_FFB0+E3j
		mov	ax, [bp+arg_4]
		add	ax, di
		mov	[bp+var_E], ax

loc_100A7:				; CODE XREF: sub_FFB0+EDj
		mov	ax, [bp+var_C]
		sub	[bp+var_A], ax
		cmp	[bp+var_A], 10h
		jge	short loc_100C0
		mov	[bp+var_8], 0
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		jmp	short loc_100D6
; ���������������������������������������������������������������������������

loc_100C0:				; CODE XREF: sub_FFB0+101j
		mov	ax, [bp+var_A]
		sar	ax, 4
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+arg_6]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_100D6:				; CODE XREF: sub_FFB0+10Ej
		mov	al, byte ptr word_45B02
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
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di

loc_100FF:				; CODE XREF: sub_FFB0+DCj
		cmp	di, [bp+arg_8]
		jl	short loc_1008E

loc_10104:				; CODE XREF: sub_FFB0+C1j
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_FFB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_10110	proc far		; CODE XREF: sub_EEF0+46P

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
		call	near ptr sub_FFB0
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_10110	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_10142	proc far		; CODE XREF: sub_C8576+14P

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
		call	near ptr sub_FFB0
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_10142	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_101C8	proc far		; CODE XREF: seg023:0E7Bp seg023:161Bp ...

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
		jz	short loc_101DF
		cmp	word ptr [si+1Ch], 0
		jnz	short loc_101E3

loc_101DF:				; CODE XREF: sub_101C8+Fj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_101E3:				; CODE XREF: sub_101C8+15j
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
		call	near ptr sub_F859
		add	sp, 2
		mov	ax, [si+16h]
		mov	[bp+var_8], ax
		jmp	short loc_10234
; ���������������������������������������������������������������������������

loc_10210:				; CODE XREF: sub_101C8+74j
		mov	al, byte ptr word_45B00
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_10234:				; CODE XREF: sub_101C8+46j
		mov	ax, [bp+var_8]
		dec	[bp+var_8]
		or	ax, ax
		jnz	short loc_10210
		mov	al, byte ptr word_45B08
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_102C2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_102C2
		mov	[bp+var_A], 0
		jmp	short loc_102B7
; ���������������������������������������������������������������������������

loc_10278:				; CODE XREF: sub_101C8+F5j
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_102B7:				; CODE XREF: sub_101C8+AEj
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jg	short loc_10278
		jmp	loc_1034D
; ���������������������������������������������������������������������������

loc_102C2:				; CODE XREF: sub_101C8+9Aj
					; sub_101C8+A7j
		mov	[bp+var_A], 0
		jmp	short loc_10342
; ���������������������������������������������������������������������������

loc_102C9:				; CODE XREF: sub_101C8+182j
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_10342:				; CODE XREF: sub_101C8+FFj
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jle	short loc_1034D
		jmp	loc_102C9
; ���������������������������������������������������������������������������

loc_1034D:				; CODE XREF: sub_101C8+F7j
					; sub_101C8+180j
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_101C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_10359	proc far		; CODE XREF: sub_EEF0+1CP

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
		jz	short loc_10370
		cmp	[bp+arg_8], 0
		jnz	short loc_10374

loc_10370:				; CODE XREF: sub_10359+Fj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_10374:				; CODE XREF: sub_10359+15j
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
		call	near ptr sub_F859
		add	sp, 2
		jmp	short loc_103C6
; ���������������������������������������������������������������������������

loc_103A2:				; CODE XREF: sub_10359+75j
		mov	al, byte ptr word_45B00
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_103C6:				; CODE XREF: sub_10359+47j
		mov	ax, [bp+arg_C]
		dec	[bp+arg_C]
		or	ax, ax
		jnz	short loc_103A2
		mov	al, byte ptr word_45B08
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		cmp	[bp+arg_A], 0
		jz	short loc_10441
		mov	[bp+var_8], 0
		jmp	short loc_10436
; ���������������������������������������������������������������������������

loc_103F7:				; CODE XREF: sub_10359+E3j
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_10436:				; CODE XREF: sub_10359+9Cj
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jl	short loc_103F7
		jmp	loc_104CC
; ���������������������������������������������������������������������������

loc_10441:				; CODE XREF: sub_10359+95j
		mov	[bp+var_8], 0
		jmp	short loc_104C1
; ���������������������������������������������������������������������������

loc_10448:				; CODE XREF: sub_10359+170j
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_104C1:				; CODE XREF: sub_10359+EDj
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jge	short loc_104CC
		jmp	loc_10448
; ���������������������������������������������������������������������������

loc_104CC:				; CODE XREF: sub_10359+E5j
					; sub_10359+16Ej
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_10359	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_104D8	proc far		; CODE XREF: sub_C861A+1AP

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
		call	near ptr sub_F859
		add	sp, 2
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	si
		leave
		retf
sub_104D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_10531	proc far		; CODE XREF: seg021:0CCBP seg021:167CP ...

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
		call	near ptr sub_F859
		add	sp, 2
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	si
		leave
		retf
sub_10531	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1058A	proc far		; CODE XREF: sub_C861A+34P

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
		call	near ptr sub_F859
		add	sp, 2
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_1058A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+4]
		add	ax, [bp+8]
		mov	di, ax
		mov	ax, di
		add	ax, [bp+0Ch]
		dec	ax
		mov	[bp-2],	ax
		mov	ax, [si+6]
		add	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-4]
		add	ax, [bp+0Eh]
		dec	ax
		mov	[bp-6],	ax
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		mov	al, [bp+10h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	di
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		mov	al, [bp+0Ch]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+0Ah]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+8]
		push	ax
		push	word_46F46
		call	Render_SetPixelClipped_328DE
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1067C	proc far		; CODE XREF: sub_C861A+5EP
					; sub_C861A+78P ...

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
		call	near ptr sub_F859
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
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_1067C	endp

; ���������������������������������������������������������������������������

loc_106C2:				; DATA XREF: dseg:2B04o dseg:2BBAo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		push	cs
		call	near ptr sub_101C8
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_106D4:				; DATA XREF: dseg:0768o dseg:079Co ...
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jnz	short loc_10700
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_10700
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_10700:				; CODE XREF: seg023:0E9Dj seg023:0EAAj
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_1073A
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jz	short loc_10734
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		xor	ax, 1
		and	ax, 1
		and	byte ptr [si+10h], 0DFh
		shl	al, 5
		or	[si+10h], al
		jmp	short loc_10738
; ���������������������������������������������������������������������������

loc_10734:				; CODE XREF: seg023:0EC7j
		or	byte ptr [si+10h], 20h

loc_10738:				; CODE XREF: seg023:0EE2j
		jmp	short loc_1073E
; ���������������������������������������������������������������������������

loc_1073A:				; CODE XREF: seg023:0EBAj
		and	byte ptr [si+10h], 0DFh

loc_1073E:				; CODE XREF: seg023:loc_10738j
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_10762
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2

loc_10762:				; CODE XREF: seg023:0EF6j
		mov	al, [si+10h]
		shr	ax, 4
		and	ax, 1
		or	ax, ax
		jnz	short loc_10772
		jmp	loc_10872
; ���������������������������������������������������������������������������

loc_10772:				; CODE XREF: seg023:0F1Dj
		xor	eax, eax
		mov	[bp-0Ah], eax
		mov	[bp-0Eh], eax
		movsx	eax, word ptr [si+11h]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	[bp-0Ah], eax
		mov	eax, dword_47ABB
		mov	[bp-0Eh], eax
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		cmp	word ptr [bp+0Ch], 0
		jnz	short loc_107BB
		jmp	loc_10870
; ���������������������������������������������������������������������������

loc_107BB:				; CODE XREF: seg023:0F66j seg023:101Dj
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_107F1
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_107EF
		lea	ax, [bp-16h]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_107EF:				; CODE XREF: seg023:0F8Cj
		jmp	short $+2

loc_107F1:				; CODE XREF: seg023:0F7Bj
		mov	al, byte_48F7E
		mov	[bp-18h], al
		test	byte ptr [bp-18h], 3
		jnz	short loc_107FF
		jmp	short loc_10870
; ���������������������������������������������������������������������������

loc_107FF:				; CODE XREF: seg023:0FABj
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 3
		jnz	short loc_1081C
		mov	ax, word_48F7A
		sar	ax, 1
		sub	ax, [si+4]
		mov	di, ax
		mov	ax, word_48F7C
		sub	ax, [si+6]
		mov	[bp+0Ah], ax

loc_1081C:				; CODE XREF: seg023:0FB7j
		mov	eax, [bp-0Eh]
		add	eax, [bp-0Ah]
		cmp	eax, dword_47ABB
		ja	short loc_10830
		mov	ax, 1
		jmp	short loc_10832
; ���������������������������������������������������������������������������

loc_10830:				; CODE XREF: seg023:0FD9j
		xor	ax, ax

loc_10832:				; CODE XREF: seg023:0FDEj
		or	al, al
		jz	short loc_10863
		movsx	eax, word ptr [si+13h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	[bp-0Ah], eax
		mov	eax, dword_47ABB
		mov	[bp-0Eh], eax
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_10863:				; CODE XREF: seg023:0FE4j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_10870
		jmp	loc_107BB
; ���������������������������������������������������������������������������

loc_10870:				; CODE XREF: seg023:0F68j seg023:0FADj ...
		jmp	short loc_108E2
; ���������������������������������������������������������������������������

loc_10872:				; CODE XREF: seg023:0F1Fj
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		cmp	word ptr [bp+0Ch], 0
		jz	short loc_108CE

loc_10880:				; CODE XREF: seg023:107Cj
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_108B6
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_108B4
		lea	ax, [bp-4]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_108B4:				; CODE XREF: seg023:1051j
		jmp	short $+2

loc_108B6:				; CODE XREF: seg023:1040j
		mov	al, byte_48F7E
		mov	[bp-6],	al
		test	byte ptr [bp-6], 0
		jz	short loc_108C4
		jmp	short loc_108CE
; ���������������������������������������������������������������������������

loc_108C4:				; CODE XREF: seg023:1070j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_10880

loc_108CE:				; CODE XREF: seg023:102Ej seg023:1072j
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_108E2:				; CODE XREF: seg023:loc_10870j
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_10929
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_10929
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jz	short loc_10929
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jnz	short loc_10917
		and	byte ptr [si+10h], 0DFh

loc_10917:				; CODE XREF: seg023:10C1j
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_10929:				; CODE XREF: seg023:109Dj seg023:10A7j ...
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word_45B54
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		mov	ax, [si+6]
		add	ax, [bp+0Ah]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+8]
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1096F	proc far		; CODE XREF: seg023:122Bp seg023:13F7p

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]

loc_10979:				; CODE XREF: sub_1096F+48j
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_109AF
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_109AD
		lea	ax, [bp+var_4]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_109AD:				; CODE XREF: sub_1096F+2Bj
		jmp	short $+2

loc_109AF:				; CODE XREF: sub_1096F+1Aj
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_10979
		pop	si
		leave
		retf
sub_1096F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]

loc_109CA:				; CODE XREF: seg023:11D1j
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_10A00
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_109FE
		lea	ax, [bp-4]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_109FE:				; CODE XREF: seg023:119Bj
		jmp	short $+2

loc_10A00:				; CODE XREF: seg023:118Aj
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_10A19
		mov	ax, word_48F7A
		sar	ax, 1
		mov	[di], ax
		mov	bx, [bp+0Ah]
		mov	ax, word_48F7C
		mov	[bx], ax

loc_10A19:				; CODE XREF: seg023:11B8j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_109CA
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [si+6]
		mov	[bp-4],	ax
		mov	ax, [si+1Ah]
		mov	[bp-6],	ax
		mov	ax, [si+1Ch]
		mov	[bp-8],	ax
		mov	ax, [bp+8]
		mov	[bp-0Ch], ax
		mov	ax, [bp+0Ah]
		mov	[bp-0Eh], ax
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_1096F
		add	sp, 2
		mov	word ptr [bp-10h], 0

loc_10A86:				; CODE XREF: seg023:1360j
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_10ABC
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10ABA
		lea	ax, [bp-14h]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_10ABA:				; CODE XREF: seg023:1257j
		jmp	short $+2

loc_10ABC:				; CODE XREF: seg023:1246j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_10AD1
		mov	al, byte_48F79
		mov	ah, 0
		and	ax, 2
		mov	[bp-10h], ax

loc_10AD1:				; CODE XREF: seg023:1274j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_10ADE
		jmp	loc_10BA6
; ���������������������������������������������������������������������������

loc_10ADE:				; CODE XREF: seg023:1289j
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		mov	ax, word_48F7A
		sar	ax, 1
		mov	di, ax
		mov	ax, word_48F7C
		mov	[bp-0Ah], ax
		mov	ax, di
		sub	ax, [bp+0Ch]
		cmp	ax, [bp-0Ch]
		jge	short loc_10B20
		mov	ax, di
		sub	ax, [bp+0Ch]
		mov	[bp-0Ch], ax

loc_10B20:				; CODE XREF: seg023:12C6j
		mov	ax, [bp-0Ah]
		sub	ax, [bp+0Eh]
		cmp	ax, [bp-0Eh]
		jge	short loc_10B34
		mov	ax, [bp-0Ah]
		sub	ax, [bp+0Eh]
		mov	[bp-0Eh], ax

loc_10B34:				; CODE XREF: seg023:12D9j
		mov	ax, [bp+10h]
		inc	ax
		sub	ax, di
		mov	dx, [bp-6]
		sub	dx, [bp-0Ch]
		cmp	ax, dx
		jge	short loc_10B52
		mov	ax, [bp+10h]
		inc	ax
		sub	ax, di
		mov	dx, [bp-6]
		sub	dx, ax
		mov	[bp-0Ch], dx

loc_10B52:				; CODE XREF: seg023:12F2j
		mov	ax, [bp+12h]
		inc	ax
		sub	ax, [bp-0Ah]
		mov	dx, [bp-8]
		sub	dx, [bp-0Eh]
		cmp	ax, dx
		jge	short loc_10B72
		mov	ax, [bp+12h]
		inc	ax
		sub	ax, [bp-0Ah]
		mov	dx, [bp-8]
		sub	dx, ax
		mov	[bp-0Eh], dx

loc_10B72:				; CODE XREF: seg023:1311j
		mov	ax, di
		sub	ax, [bp-0Ch]
		mov	[bp-2],	ax
		mov	ax, [bp-0Ah]
		sub	ax, [bp-0Eh]
		mov	[bp-4],	ax
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2

loc_10BA6:				; CODE XREF: seg023:128Bj
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_10BB3
		jmp	loc_10A86
; ���������������������������������������������������������������������������

loc_10BB3:				; CODE XREF: seg023:135Ej
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		cmp	word ptr [bp-10h], 0
		jnz	short loc_10BF4
		mov	ax, [bp-4]
		sub	ax, [si+6]
		push	ax
		mov	ax, [bp-2]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6

loc_10BF4:				; CODE XREF: seg023:138Aj
		mov	ax, [bp-10h]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [si+6]
		mov	[bp-4],	ax
		mov	di, [si+1Ah]
		mov	ax, [si+1Ch]
		mov	[bp-6],	ax
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_1096F
		add	sp, 2
		mov	word ptr [bp-0Ch], 0

loc_10C52:				; CODE XREF: seg023:14F7j
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_10C88
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10C86
		lea	ax, [bp-10h]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_10C86:				; CODE XREF: seg023:1423j
		jmp	short $+2

loc_10C88:				; CODE XREF: seg023:1412j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_10C9D
		mov	al, byte_48F79
		mov	ah, 0
		and	ax, 2
		mov	[bp-0Ch], ax

loc_10C9D:				; CODE XREF: seg023:1440j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_10CAA
		jmp	loc_10D3D
; ���������������������������������������������������������������������������

loc_10CAA:				; CODE XREF: seg023:1455j
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		mov	ax, word_48F7A
		sar	ax, 1
		mov	[bp-8],	ax
		mov	ax, word_48F7C
		mov	[bp-0Ah], ax
		mov	ax, [bp-8]
		sub	ax, [bp-2]
		inc	ax
		mov	di, ax
		cmp	di, [bp+8]
		jge	short loc_10CEC
		mov	di, [bp+8]
		jmp	short loc_10CF4
; ���������������������������������������������������������������������������

loc_10CEC:				; CODE XREF: seg023:1495j
		cmp	di, [bp+0Ch]
		jle	short loc_10CF4
		mov	di, [bp+0Ch]

loc_10CF4:				; CODE XREF: seg023:149Aj seg023:149Fj
		mov	ax, [bp-0Ah]
		sub	ax, [bp-4]
		inc	ax
		mov	[bp-6],	ax
		mov	ax, [bp-6]
		cmp	ax, [bp+0Ah]
		jge	short loc_10D0E
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		jmp	short loc_10D1C
; ���������������������������������������������������������������������������

loc_10D0E:				; CODE XREF: seg023:14B4j
		mov	ax, [bp-6]
		cmp	ax, [bp+0Eh]
		jle	short loc_10D1C
		mov	ax, [bp+0Eh]
		mov	[bp-6],	ax

loc_10D1C:				; CODE XREF: seg023:14BCj seg023:14C4j
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2

loc_10D3D:				; CODE XREF: seg023:1457j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_10D4A
		jmp	loc_10C52
; ���������������������������������������������������������������������������

loc_10D4A:				; CODE XREF: seg023:14F5j
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_F9A4
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		cmp	word ptr [bp-0Ch], 0
		jnz	short loc_10DB2
		mov	ax, [si+4]
		mov	[bp-12h], ax
		mov	ax, [si+6]
		mov	[bp-14h], ax
		mov	[bp-16h], di
		mov	ax, [bp-6]
		mov	[bp-18h], ax
		mov	ax, [bp-12h]
		mov	[si+4],	ax
		mov	ax, [bp-14h]
		mov	[si+6],	ax
		mov	ax, [bp-16h]
		mov	[si+1Ah], ax
		mov	ax, [bp-18h]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8],	ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax

loc_10DB2:				; CODE XREF: seg023:151Fj
		mov	ax, [bp-0Ch]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [si+24h]
		call	sub_112C4
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp-2],	dx
		mov	word ptr [si+1Eh], 0
		cmp	di, [bp-2]
		jge	short loc_10E01
		mov	ax, [bp-2]
		sub	ax, di
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+1Eh], ax

loc_10E01:				; CODE XREF: seg023:15A2j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [si+24h]
		call	sub_112C4
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp-2],	dx
		mov	word ptr [si+20h], 0
		jmp	short loc_10E4F
; ���������������������������������������������������������������������������

loc_10E34:				; CODE XREF: seg023:1602j
		mov	ax, [si+20h]
		inc	word ptr [si+20h]
		mov	bx, [si+24h]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	PaletteScreen_LookupByteTable_11303
		add	sp, 2
		add	ax, 2
		sub	di, ax

loc_10E4F:				; CODE XREF: seg023:15E2j
		cmp	di, [bp-2]
		jg	short loc_10E34
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_10E58:				; DATA XREF: dseg:2B52o dseg:2B86o
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+22h], 0FFFFh
		jnz	short loc_10E73
		push	si
		push	cs
		call	near ptr sub_101C8
		add	sp, 2
		jmp	short loc_10E7E
; ���������������������������������������������������������������������������

loc_10E73:				; CODE XREF: seg023:1617j
		push	word ptr [si+22h]
		push	si
		push	cs
		call	near ptr sub_10531
		add	sp, 4

loc_10E7E:				; CODE XREF: seg023:1621j
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+1Eh]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp-2],	ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp-4],	ax
		mov	di, [si+28h]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_10EBC
		mov	di, [si+26h]

loc_10EBC:				; CODE XREF: seg023:1667j
		mov	ax, word_45B54
		add	ax, 2
		mov	[bp-6],	ax
		mov	word ptr [bp-14h], 0
		mov	word ptr [bp-12h], 0
		push	word ptr [bp-6]
		lea	ax, [bp-14h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word_45B54
		push	di
		mov	ax, [si+24h]
		add	ax, [si+20h]
		push	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		lea	ax, [bp-14h]
		push	ax
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		lea	ax, [bp-14h]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_10F3B	proc far		; CODE XREF: seg025:0863P

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
		jz	short loc_10F5A
		push	word ptr [si+24h]
		call	sub_308
		add	sp, 2

loc_10F5A:				; CODE XREF: sub_10F3B+12j
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
		jz	short loc_10F87
		push	di
		push	word ptr [si+24h]
		call	CRT_Strcpy
		add	sp, 4

loc_10F87:				; CODE XREF: sub_10F3B+3Ej
		pop	di
		pop	si
		leave
		retf
sub_10F3B	endp

; ���������������������������������������������������������������������������

loc_10F8B:				; DATA XREF: dseg:07C0o dseg:07F4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		push	cs
		call	near ptr sub_101C8
		add	sp, 2
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp-2],	ax
		mov	ax, [si+6]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp-4],	ax
		push	si
		push	cs
		call	near ptr sub_F859
		add	sp, 2
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_11001:				; DATA XREF: dseg:2CE5o
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+6]
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp-2],	ax
		mov	ax, [si+6]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp-4],	ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp-6],	ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp-8],	ax
		mov	ax, word_45B54
		add	ax, 2
		mov	[bp-0Ah], ax
		mov	word ptr [bp-18h], 0
		mov	word ptr [bp-16h], 0
		push	word ptr [bp-0Ah]
		lea	ax, [bp-18h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_F859
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
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	word_45B54
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_F878
		add	sp, 2
		lea	ax, [bp-18h]
		push	ax
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		lea	ax, [bp-18h]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11108	proc far		; CODE XREF: sub_1119E+4Ep

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_112C4
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
		jge	short loc_11147
		mov	ax, [bp+var_2]
		sub	ax, di
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+2Ah], ax

loc_11147:				; CODE XREF: sub_11108+30j
		pop	di
		pop	si
		leave
		retf
sub_11108	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [si+2Eh]
		call	sub_112C4
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp-2],	dx
		mov	word ptr [si+2Ch], 0
		jmp	short loc_11195
; ���������������������������������������������������������������������������

loc_1117A:				; CODE XREF: seg023:1948j
		mov	ax, [si+2Ch]
		inc	word ptr [si+2Ch]
		mov	bx, [si+2Eh]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	PaletteScreen_LookupByteTable_11303
		add	sp, 2
		add	ax, 2
		sub	di, ax

loc_11195:				; CODE XREF: seg023:1928j
		cmp	di, [bp-2]
		jg	short loc_1117A
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1119E	proc far		; CODE XREF: sub_1220C+44FP
					; seg026:1588P	...

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
		jz	short loc_111BD
		push	word ptr [si+2Eh]
		call	sub_308
		add	sp, 2

loc_111BD:				; CODE XREF: sub_1119E+12j
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
		jz	short loc_111EA
		push	di
		push	word ptr [si+2Eh]
		call	CRT_Strcpy
		add	sp, 4

loc_111EA:				; CODE XREF: sub_1119E+3Ej
		push	si
		push	cs
		call	near ptr sub_11108
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_1119E	endp

; ���������������������������������������������������������������������������

loc_111F6:				; DATA XREF: dseg:58E0o
		push	bp
		mov	bp, sp
		mov	byte_48F78, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11200:				; DATA XREF: dseg:2B1Co
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_1122B
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_11229
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11229:				; CODE XREF: seg023:19CCj
		jmp	short $+2

loc_1122B:				; CODE XREF: seg023:19BDj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
seg023		ends
