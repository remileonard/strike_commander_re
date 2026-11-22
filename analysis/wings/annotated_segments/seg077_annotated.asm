seg077		segment	para public 'CODE' use16
		assume cs:seg077
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35A84		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [si+52h]
		inc	dx
		mov	ax, [bp+arg_2]
		imul	dx
		add	ax, 80h
		shr	ax, 8
		dec	ax
		mov	[bp+arg_2], ax
		mov	eax, [bp+arg_4]
		shr	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_5C3BA, 0FFFFFFFFh
		jz	short loc_35AD7
		cmp	eax, dword_5C3BA
		jl	short loc_35AD7
		mov	eax, [si+76h]
		cmp	eax, dword_5C3BA
		jg	short loc_35AC9
		jmp	loc_35BE3

loc_35AC9:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_5C3BE
		jge	short loc_35AD7
		jmp	loc_35BE3

loc_35AD7:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		nop
		jle	short loc_35AF9
		mov	dword_5C3BA, 0
		mov	dword_5C3BE, eax
		xor	eax, eax

loc_35AF2:
		mov	dword_5C3C2, eax
		jmp	loc_35BE7

loc_35AF9:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		nop
		jg	short loc_35B12
		mov	dword_5C3BA, eax
		mov	dword_5C3BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_35AF2

loc_35B12:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		nop
		nop
		jmp	loc_35BC4

loc_35B28:
		dec	[bp+var_2]
		nop
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		nop
		jl	short loc_35B72
		cmp	eax, [bp+var_A]
		nop
		jge	short loc_35B72
		mov	eax, [bp+var_6]
		mov	dword_5C3BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_35B95

loc_35B72:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		nop
		jnz	short loc_35BA1
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_5C3BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_35B95:
		mov	dword_5C3BE, eax
		mov	[bp+var_C], 1
		nop
		nop
		jmp	short loc_35BC4

loc_35BA1:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		nop
		jge	short loc_35BB9
		mov	ax, 1
		mov	cl, [bp+var_2]
		nop
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_35BC4

loc_35BB9:
		mov	ax, 1
		mov	cl, [bp+var_2]
		nop
		shl	ax, cl
		add	dx, ax

loc_35BC4:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_35BD0
		jmp	loc_35B28

loc_35BD0:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_35AF2

loc_35BE3:
		mov	eax, dword_5C3C2

loc_35BE7:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_35BF4
		nop
		nop
		mov	bx, 0

loc_35BF4:
		cmp	eax, 0
		jnz	short loc_35C03
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_35C25

loc_35C03:
		movsx	edx, word ptr [si+52h]
		shl	edx, 1
		sub	edx, ebx
		imul	edx, eax
		add	edx, [si+6Eh]
		mov	cx, [si+68h]
		sar	edx, cl
		sub	cx, [si+52h]
		movsx	eax, bx
		add	ax, cx

loc_35C25:
		mov	bx, ax
		or	bx, bx
		js	short loc_35C5C
		nop
		nop
		jnz	short loc_35C3E
		nop
		nop
		mov	eax, [si+80h]
		shld	edx, eax, 10h
		jmp	short loc_35C78
		nop

loc_35C3E:
		mov	cx, [si+52h]
		cmp	bx, cx
		jle	short loc_35C49
		nop
		nop
		mov	bx, cx

loc_35C49:
		dec	bx
		shl	bx, 8
		mov	eax, [si+8Ah]
		add	ax, bx
		shld	edx, eax, 10h
		jmp	short loc_35C78
		nop

loc_35C5C:
		neg	bx
		mov	cx, [si+52h]
		cmp	bx, cx
		jle	short loc_35C69
		nop
		nop
		mov	bx, cx

loc_35C69:
		shl	bx, 8
		mov	eax, [si+8Ah]
		sub	ax, bx
		shld	edx, eax, 10h

loc_35C78:
		pop	di
		pop	si
		leave
		retf
sub_35A84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_ShadeIndexWithFog_2F24E (sub_2F24E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 233 L, LUE 2026-10-14. INDEX DE PALETTE D'UN
; SOMMET OMBRÉ AVEC BROUILLARD (utilisée par le rendu du terrain et le setup de face seg055).
; Args : (table, couleur, intensité 0..255, profondeur 24.8, surcharge). couleur ≥ [table+58h]
; → 0. Profondeur ÷ 256 → facteur de brouillard f : 0 sous [table+72h], max [table+6Ah] au-
; delà de [table+76h], sinon recherche dichotomique dans la table de seuils dword [table+48h]
; (nombre [table+4Ch], cache dword_6E9BA/BE/C2), f = (rang+1) << ([table+68h]−[table+4Eh]).
; Entrée e = [table+5Ah] + couleur × 15. n = surcharge ou mot e+0Bh (nombre de teintes). v =
; (intensité × n + 0x80) >> 8. Résultat = e+6 (première teinte) + v si f = 0 ; sinon e+6 + v +
; (((mot e+0Dh) − v) × f + [[e]+6Eh]) >> [[e]+68h] : la teinte glisse vers la teinte de
; brouillard e+0Dh quand la distance croît. Ancien résumé : 'résolution d'interpolation cachée
; avec garde de limite'. Ex-'Interp_ResolveCachedGuarded'.
; ==============================================================================================
Palette_ShadeIndexWithFog_35C7C		proc far

var_14		= byte ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h

		enter	14h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, [si+58h]
		jnb	loc_35E2C
		mov	eax, [bp+arg_6]
		sar	eax, 8
		mov	[bp+arg_6], eax
		cmp	dword_5C3BA, 0FFFFFFFFh
		jz	short loc_35CC6
		cmp	eax, dword_5C3BA
		jl	short loc_35CC6
		mov	eax, [si+76h]
		cmp	eax, dword_5C3BA
		jg	short loc_35CB8
		jmp	loc_35DC5

loc_35CB8:
		mov	eax, [bp+arg_6]
		cmp	eax, dword_5C3BE
		jge	short loc_35CC6
		jmp	loc_35DC5

loc_35CC6:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_6]
		jle	short loc_35CE7
		mov	dword_5C3BA, 0
		mov	dword_5C3BE, eax
		xor	eax, eax

loc_35CE0:
		mov	dword_5C3C2, eax
		jmp	loc_35DC9

loc_35CE7:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_6]
		jg	short loc_35CFF
		mov	dword_5C3BA, eax
		mov	dword_5C3BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_35CE0

loc_35CFF:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_A], al
		mov	[bp+var_14], 0
		jmp	loc_35DA6

loc_35D13:
		dec	[bp+var_A]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_12], eax
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_E]
		jl	short loc_35D5A
		cmp	eax, [bp+var_12]
		jge	short loc_35D5A
		mov	eax, [bp+var_E]
		mov	dword_5C3BA, eax
		mov	eax, [bp+var_12]
		jmp	short loc_35D7C

loc_35D5A:
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_12]
		jnz	short loc_35D86
		inc	dx
		mov	eax, [bp+var_12]
		mov	dword_5C3BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_35D7C:
		mov	dword_5C3BE, eax
		mov	[bp+var_14], 1
		jmp	short loc_35DA6

loc_35D86:
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_E]
		jge	short loc_35D9C
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_35DA6

loc_35D9C:
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		add	dx, ax

loc_35DA6:
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_35DB2
		jmp	loc_35D13

loc_35DB2:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_35CE0

loc_35DC5:
		mov	eax, dword_5C3C2

loc_35DC9:
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_2]
		mov	dx, 0Fh
		imul	dx
		mov	di, [si+5Ah]
		add	di, ax
		mov	ax, [bp+arg_A]
		or	ax, ax
		jnz	short loc_35DEA
		mov	ax, [di+0Bh]

loc_35DEA:
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		imul	[bp+var_8]
		add	ax, 80h
		sar	ax, 8
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jnz	short loc_35E0B
		mov	ax, [di+6]
		add	ax, [bp+var_6]
		jmp	short loc_35E2A

loc_35E0B:
		mov	ax, [di+0Dh]
		sub	ax, [bp+var_6]
		cwde
		imul	eax, [bp+var_4]
		mov	bx, [di]
		add	eax, [bx+6Eh]
		mov	cl, [bx+68h]
		sar	eax, cl
		add	ax, [di+6]
		add	ax, [bp+var_6]

loc_35E2A:
		jmp	short loc_35E2E

loc_35E2C:
		xor	ax, ax

loc_35E2E:
		pop	di
		pop	si
		leave
		retf
Palette_ShadeIndexWithFog_35C7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_FogTableIndex_2E6CE (sub_2E6CE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Palette_FogTableIndex_1F908 (sub_1F908 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Palette_FogTableIndex_2F404 (sub_2F404 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). N° de table de brouillard pour une
; profondeur (ex-Interp_ResolveCached) : même recherche de seuils que
; Palette_ShadeIndexWithFog_2F24E (cache dword_6E9BA/BE/C2).
; ==============================================================================================
Palette_FogTableIndex_35E32		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_5C3BA, 0FFFFFFFFh
		jz	short loc_35E72
		cmp	eax, dword_5C3BA
		jl	short loc_35E72
		mov	eax, [si+76h]
		cmp	eax, dword_5C3BA
		jg	short loc_35E64
		jmp	loc_35F71

loc_35E64:
		mov	eax, [bp+arg_2]
		cmp	eax, dword_5C3BE
		jge	short loc_35E72
		jmp	loc_35F71

loc_35E72:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_35E93
		mov	dword_5C3BA, 0
		mov	dword_5C3BE, eax
		xor	eax, eax

loc_35E8C:
		mov	dword_5C3C2, eax
		jmp	loc_35F75

loc_35E93:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_35EAB
		mov	dword_5C3BA, eax
		mov	dword_5C3BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_35E8C

loc_35EAB:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_35F52

loc_35EBF:
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jl	short loc_35F06
		cmp	eax, [bp+var_A]
		jge	short loc_35F06
		mov	eax, [bp+var_6]
		mov	dword_5C3BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_35F28

loc_35F06:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_35F32
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_5C3BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_35F28:
		mov	dword_5C3BE, eax
		mov	[bp+var_C], 1
		jmp	short loc_35F52

loc_35F32:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_35F48
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_35F52

loc_35F48:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_35F52:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_35F5E
		jmp	loc_35EBF

loc_35F5E:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_35E8C

loc_35F71:
		mov	eax, dword_5C3C2

loc_35F75:
		movsx	edx, word ptr [si+52h]
		imul	eax, edx
		add	eax, [si+6Eh]
		mov	cx, [si+68h]
		sar	eax, cl
		pop	di
		pop	si
		leave
		retf
Palette_FogTableIndex_35E32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35F8C		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	bx, [si+52h]
		inc	bx
		imul	ax, bx
		add	ax, 80h
		sar	ax, 8
		dec	ax
		mov	[bp+arg_2], ax
		mov	eax, [bp+arg_4]
		sar	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_5C3BA, 0FFFFFFFFh
		jz	short loc_35FE0
		cmp	eax, dword_5C3BA
		jl	short loc_35FE0
		mov	eax, [si+76h]
		cmp	eax, dword_5C3BA
		jg	short loc_35FD2
		jmp	loc_360DF

loc_35FD2:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_5C3BE
		jge	short loc_35FE0
		jmp	loc_360DF

loc_35FE0:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_36001
		mov	dword_5C3BA, 0
		mov	dword_5C3BE, eax
		xor	eax, eax

loc_35FFA:
		mov	dword_5C3C2, eax
		jmp	loc_360E3

loc_36001:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_36019
		mov	dword_5C3BA, eax
		mov	dword_5C3BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_35FFA

loc_36019:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_360C0

loc_3602D:
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jl	short loc_36074
		cmp	eax, [bp+var_A]
		jge	short loc_36074
		mov	eax, [bp+var_6]
		mov	dword_5C3BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_36096

loc_36074:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_360A0
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_5C3BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_36096:
		mov	dword_5C3BE, eax
		mov	[bp+var_C], 1
		jmp	short loc_360C0

loc_360A0:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_360B6
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_360C0

loc_360B6:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_360C0:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_360CC
		jmp	loc_3602D

loc_360CC:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_35FFA

loc_360DF:
		mov	eax, dword_5C3C2

loc_360E3:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_360F0
		nop
		nop
		mov	bx, 0

loc_360F0:
		cmp	eax, 0
		jnz	short loc_360FF
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_36121

loc_360FF:
		movsx	edx, word ptr [si+52h]
		shl	edx, 1
		sub	edx, ebx
		imul	edx, eax
		add	edx, [si+6Eh]
		mov	cx, [si+68h]
		sar	edx, cl
		sub	cx, [si+52h]
		movsx	eax, bx
		add	ax, cx

loc_36121:
		pop	di
		pop	si
		leave
		retf
sub_35F8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36125		proc far

var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_4]
		sar	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_5C3BA, 0FFFFFFFFh
		jz	short loc_36165
		cmp	eax, dword_5C3BA
		jl	short loc_36165
		mov	eax, [si+76h]
		cmp	eax, dword_5C3BA
		jg	short loc_36157
		jmp	loc_36264

loc_36157:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_5C3BE
		jge	short loc_36165
		jmp	loc_36264

loc_36165:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_36186
		mov	dword_5C3BA, 0
		mov	dword_5C3BE, eax
		xor	eax, eax

loc_3617F:
		mov	dword_5C3C2, eax
		jmp	loc_36268

loc_36186:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_3619E
		mov	dword_5C3BA, eax
		mov	dword_5C3BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_3617F

loc_3619E:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_36245

loc_361B2:
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jl	short loc_361F9
		cmp	eax, [bp+var_A]
		jge	short loc_361F9
		mov	eax, [bp+var_6]
		mov	dword_5C3BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_3621B

loc_361F9:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_36225
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_5C3BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_3621B:
		mov	dword_5C3BE, eax
		mov	[bp+var_C], 1
		jmp	short loc_36245

loc_36225:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_3623B
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_36245

loc_3623B:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_36245:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_36251
		jmp	loc_361B2

loc_36251:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_3617F

loc_36264:
		mov	eax, dword_5C3C2

loc_36268:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_36275
		nop
		nop
		mov	bx, 0

loc_36275:
		cmp	eax, 0
		jnz	short loc_36284
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_362A6

loc_36284:
		movsx	edx, word ptr [si+52h]
		shl	edx, 1
		sub	edx, ebx
		imul	edx, eax
		add	edx, [si+6Eh]
		mov	cx, [si+68h]
		sar	edx, cl
		sub	cx, [si+52h]
		movsx	eax, bx
		add	ax, cx

loc_362A6:
		cmp	ax, 0
		jnz	short loc_362B2
		nop
		nop
		mov	ax, 0FFFFh
		jmp	short loc_362C2

loc_362B2:
		cmp	ax, 0
		jl	short loc_362BB
		nop
		nop
		jmp	short loc_362C2

loc_362BB:
		mov	bx, [si+52h]
		sub	bx, ax
sub_36125		endp
seg077		ends
