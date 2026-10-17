seg048		segment	byte public 'CODE' use16
		assume cs:seg048
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

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
Palette_ShadeIndexWithFog_1F752	proc far		; CODE XREF: seg042:0CA0P seg042:1085P ...

var_14		= byte ptr -14h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h

		enter	14h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]

loc_1F75E:				; DATA XREF: seg170:0246o
		cmp	ax, [si+58h]
		jnb	loc_1F902
		mov	eax, [bp+arg_6]
		sar	eax, 8
		mov	[bp+arg_6], eax
		cmp	dword_4628C, 0FFFFFFFFh
		jz	short loc_1F79C
		cmp	eax, dword_4628C
		jl	short loc_1F79C
		mov	eax, [si+76h]
		cmp	eax, dword_4628C
		jg	short loc_1F78E
		jmp	loc_1F89B
; ���������������������������������������������������������������������������

loc_1F78E:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+37j
		mov	eax, [bp+arg_6]
		cmp	eax, dword_46290
		jge	short loc_1F79C
		jmp	loc_1F89B
; ���������������������������������������������������������������������������

loc_1F79C:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+25j
					; Palette_ShadeIndexWithFog_1F752+2Cj ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_6]
		jle	short loc_1F7BD
		mov	dword_4628C, 0
		mov	dword_46290, eax
		xor	eax, eax

loc_1F7B6:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+81j
					; Palette_ShadeIndexWithFog_1F752+146j
		mov	dword_46294, eax
		jmp	loc_1F89F
; ���������������������������������������������������������������������������

loc_1F7BD:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+52j
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_6]
		jg	short loc_1F7D5
		mov	dword_4628C, eax
		mov	dword_46290, eax
		mov	eax, [si+6Ah]
		jmp	short loc_1F7B6
; ���������������������������������������������������������������������������

loc_1F7D5:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+73j
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_A], al
		mov	[bp+var_14], 0
		jmp	loc_1F87C
; ���������������������������������������������������������������������������

loc_1F7E9:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+133j
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
		jl	short loc_1F830
		cmp	eax, [bp+var_12]
		jge	short loc_1F830
		mov	eax, [bp+var_E]
		mov	dword_4628C, eax
		mov	eax, [bp+var_12]
		jmp	short loc_1F852
; ���������������������������������������������������������������������������

loc_1F830:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+C8j
					; Palette_ShadeIndexWithFog_1F752+CEj
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_12]
		jnz	short loc_1F85C
		inc	dx
		mov	eax, [bp+var_12]
		mov	dword_4628C, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_1F852:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+DCj
		mov	dword_46290, eax
		mov	[bp+var_14], 1
		jmp	short loc_1F87C
; ���������������������������������������������������������������������������

loc_1F85C:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+E6j
		mov	eax, [bp+arg_6]
		cmp	eax, [bp+var_E]
		jge	short loc_1F872
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_1F87C
; ���������������������������������������������������������������������������

loc_1F872:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+112j
		mov	ax, 1
		mov	cl, [bp+var_A]
		shl	ax, cl
		add	dx, ax

loc_1F87C:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+94j
					; Palette_ShadeIndexWithFog_1F752+108j ...
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F888
		jmp	loc_1F7E9
; ���������������������������������������������������������������������������

loc_1F888:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+131j
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_1F7B6
; ���������������������������������������������������������������������������

loc_1F89B:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+39j
					; Palette_ShadeIndexWithFog_1F752+47j
		mov	eax, dword_46294

loc_1F89F:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+68j
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
		jnz	short loc_1F8C0
		mov	ax, [di+0Bh]

loc_1F8C0:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+169j
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		imul	[bp+var_8]
		add	ax, 80h	; '�'
		sar	ax, 8
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jnz	short loc_1F8E1
		mov	ax, [di+6]
		add	ax, [bp+var_6]
		jmp	short loc_1F900
; ���������������������������������������������������������������������������

loc_1F8E1:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+185j
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

loc_1F900:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+18Dj
		jmp	short loc_1F904
; ���������������������������������������������������������������������������

loc_1F902:				; CODE XREF: Palette_ShadeIndexWithFog_1F752+Fj
		xor	ax, ax

loc_1F904:				; CODE XREF: Palette_ShadeIndexWithFog_1F752:loc_1F900j
		pop	di
		pop	si
		leave
		retf
Palette_ShadeIndexWithFog_1F752	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_FogTableIndex_2F404 (sub_2F404 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des objets,
; OBJECT_RENDER.md). N° de table de brouillard pour une profondeur (ex-Interp_ResolveCached) :
; même recherche de seuils que Palette_ShadeIndexWithFog_2F24E (cache dword_6E9BA/BE/C2).
; ==============================================================================================
Palette_FogTableIndex_1F908	proc far		; CODE XREF: sub_1B4C0+17P
					; seg042:1304P

var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_4628C, 0FFFFFFFFh
		jz	short loc_1F948
		cmp	eax, dword_4628C
		jl	short loc_1F948
		mov	eax, [si+76h]
		cmp	eax, dword_4628C
		jg	short loc_1F93A
		jmp	loc_1FA47
; ���������������������������������������������������������������������������

loc_1F93A:				; CODE XREF: Palette_FogTableIndex_1F908+2Dj
		mov	eax, [bp+arg_2]
		cmp	eax, dword_46290
		jge	short loc_1F948
		jmp	loc_1FA47
; ���������������������������������������������������������������������������

loc_1F948:				; CODE XREF: Palette_FogTableIndex_1F908+1Bj
					; Palette_FogTableIndex_1F908+22j ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_1F969
		mov	dword_4628C, 0
		mov	dword_46290, eax
		xor	eax, eax

loc_1F962:				; CODE XREF: Palette_FogTableIndex_1F908+77j
					; Palette_FogTableIndex_1F908+13Cj
		mov	dword_46294, eax
		jmp	loc_1FA4B
; ���������������������������������������������������������������������������

loc_1F969:				; CODE XREF: Palette_FogTableIndex_1F908+48j
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_1F981
		mov	dword_4628C, eax
		mov	dword_46290, eax
		mov	eax, [si+6Ah]
		jmp	short loc_1F962
; ���������������������������������������������������������������������������

loc_1F981:				; CODE XREF: Palette_FogTableIndex_1F908+69j
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_1FA28
; ���������������������������������������������������������������������������

loc_1F995:				; CODE XREF: Palette_FogTableIndex_1F908+129j
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
		jl	short loc_1F9DC
		cmp	eax, [bp+var_A]
		jge	short loc_1F9DC
		mov	eax, [bp+var_6]
		mov	dword_4628C, eax
		mov	eax, [bp+var_A]
		jmp	short loc_1F9FE
; ���������������������������������������������������������������������������

loc_1F9DC:				; CODE XREF: Palette_FogTableIndex_1F908+BEj
					; Palette_FogTableIndex_1F908+C4j
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_1FA08
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_4628C, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_1F9FE:				; CODE XREF: Palette_FogTableIndex_1F908+D2j
		mov	dword_46290, eax
		mov	[bp+var_C], 1
		jmp	short loc_1FA28
; ���������������������������������������������������������������������������

loc_1FA08:				; CODE XREF: Palette_FogTableIndex_1F908+DCj
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_1FA1E
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_1FA28
; ���������������������������������������������������������������������������

loc_1FA1E:				; CODE XREF: Palette_FogTableIndex_1F908+108j
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_1FA28:				; CODE XREF: Palette_FogTableIndex_1F908+8Aj
					; Palette_FogTableIndex_1F908+FEj ...
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1FA34
		jmp	loc_1F995
; ���������������������������������������������������������������������������

loc_1FA34:				; CODE XREF: Palette_FogTableIndex_1F908+127j
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_1F962
; ���������������������������������������������������������������������������

loc_1FA47:				; CODE XREF: Palette_FogTableIndex_1F908+2Fj
					; Palette_FogTableIndex_1F908+3Dj
		mov	eax, dword_46294

loc_1FA4B:				; CODE XREF: Palette_FogTableIndex_1F908+5Ej
		movsx	edx, word ptr [si+52h]
		imul	eax, edx
		add	eax, [si+6Eh]
		mov	cx, [si+68h]
		sar	eax, cl
		pop	di
		pop	si
		leave
		retf
Palette_FogTableIndex_1F908	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1FA62	proc far		; CODE XREF: Palette_ShadeTableFor_1ECD2+FP

var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	bx, [si+52h]
		inc	bx
		imul	ax, bx
		add	ax, 80h	; '�'
		sar	ax, 8
		dec	ax
		mov	[bp+arg_2], ax
		mov	eax, [bp+arg_4]
		sar	eax, 8
		mov	[bp+arg_4], eax
		cmp	dword_4628C, 0FFFFFFFFh
		jz	short loc_1FAB6
		cmp	eax, dword_4628C
		jl	short loc_1FAB6
		mov	eax, [si+76h]
		cmp	eax, dword_4628C
		jg	short loc_1FAA8
		jmp	loc_1FBB5
; ���������������������������������������������������������������������������

loc_1FAA8:				; CODE XREF: sub_1FA62+41j
		mov	eax, [bp+arg_4]
		cmp	eax, dword_46290
		jge	short loc_1FAB6
		jmp	loc_1FBB5
; ���������������������������������������������������������������������������

loc_1FAB6:				; CODE XREF: sub_1FA62+2Fj
					; sub_1FA62+36j ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_1FAD7
		mov	dword_4628C, 0
		mov	dword_46290, eax
		xor	eax, eax

loc_1FAD0:				; CODE XREF: sub_1FA62+8Bj
					; sub_1FA62+150j
		mov	dword_46294, eax
		jmp	loc_1FBB9
; ���������������������������������������������������������������������������

loc_1FAD7:				; CODE XREF: sub_1FA62+5Cj
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_1FAEF
		mov	dword_4628C, eax
		mov	dword_46290, eax
		mov	eax, [si+6Ah]
		jmp	short loc_1FAD0
; ���������������������������������������������������������������������������

loc_1FAEF:				; CODE XREF: sub_1FA62+7Dj
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_1FB96
; ���������������������������������������������������������������������������

loc_1FB03:				; CODE XREF: sub_1FA62+13Dj
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
		jl	short loc_1FB4A
		cmp	eax, [bp+var_A]
		jge	short loc_1FB4A
		mov	eax, [bp+var_6]
		mov	dword_4628C, eax
		mov	eax, [bp+var_A]
		jmp	short loc_1FB6C
; ���������������������������������������������������������������������������

loc_1FB4A:				; CODE XREF: sub_1FA62+D2j
					; sub_1FA62+D8j
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_1FB76
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_4628C, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_1FB6C:				; CODE XREF: sub_1FA62+E6j
		mov	dword_46290, eax
		mov	[bp+var_C], 1
		jmp	short loc_1FB96
; ���������������������������������������������������������������������������

loc_1FB76:				; CODE XREF: sub_1FA62+F0j
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_1FB8C
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_1FB96
; ���������������������������������������������������������������������������

loc_1FB8C:				; CODE XREF: sub_1FA62+11Cj
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_1FB96:				; CODE XREF: sub_1FA62+9Ej
					; sub_1FA62+112j ...
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1FBA2
		jmp	loc_1FB03
; ���������������������������������������������������������������������������

loc_1FBA2:				; CODE XREF: sub_1FA62+13Bj
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_1FAD0
; ���������������������������������������������������������������������������

loc_1FBB5:				; CODE XREF: sub_1FA62+43j
					; sub_1FA62+51j
		mov	eax, dword_46294

loc_1FBB9:				; CODE XREF: sub_1FA62+72j
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_1FBC6
		nop
		nop
		mov	bx, 0

loc_1FBC6:				; CODE XREF: sub_1FA62+15Dj
		cmp	eax, 0
		jnz	short loc_1FBD5
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_1FBF7
; ���������������������������������������������������������������������������

loc_1FBD5:				; CODE XREF: sub_1FA62+168j
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

loc_1FBF7:				; CODE XREF: sub_1FA62+171j
		pop	di
		pop	si
		leave
		retf
sub_1FA62	endp

; ���������������������������������������������������������������������������
		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+6]
		mov	eax, [bp+0Ah]
		sar	eax, 8
		mov	[bp+0Ah], eax
		cmp	dword_4628C, 0FFFFFFFFh
		jz	short loc_1FC3B
		cmp	eax, dword_4628C
		jl	short loc_1FC3B
		mov	eax, [si+76h]
		cmp	eax, dword_4628C
		jg	short loc_1FC2D
		jmp	loc_1FD3A
; ���������������������������������������������������������������������������

loc_1FC2D:				; CODE XREF: seg048:04D8j
		mov	eax, [bp+0Ah]
		cmp	eax, dword_46290
		jge	short loc_1FC3B
		jmp	loc_1FD3A
; ���������������������������������������������������������������������������

loc_1FC3B:				; CODE XREF: seg048:04C6j seg048:04CDj ...
		mov	eax, [si+72h]
		cmp	eax, [bp+0Ah]
		jle	short loc_1FC5C
		mov	dword_4628C, 0
		mov	dword_46290, eax
		xor	eax, eax

loc_1FC55:				; CODE XREF: seg048:0522j seg048:05E7j
		mov	dword_46294, eax
		jmp	loc_1FD3E
; ���������������������������������������������������������������������������

loc_1FC5C:				; CODE XREF: seg048:04F3j
		mov	eax, [si+76h]
		cmp	eax, [bp+0Ah]
		jg	short loc_1FC74
		mov	dword_4628C, eax
		mov	dword_46290, eax
		mov	eax, [si+6Ah]
		jmp	short loc_1FC55
; ���������������������������������������������������������������������������

loc_1FC74:				; CODE XREF: seg048:0514j
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp-2],	al
		mov	byte ptr [bp-0Ch], 0
		jmp	loc_1FD1B
; ���������������������������������������������������������������������������

loc_1FC88:				; CODE XREF: seg048:05D4j
		dec	byte ptr [bp-2]
		les	bx, [si+48h]
		mov	cx, bx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp-6],	eax
		mov	bx, cx
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp-0Ah], eax
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-6]
		jl	short loc_1FCCF
		cmp	eax, [bp-0Ah]
		jge	short loc_1FCCF
		mov	eax, [bp-6]
		mov	dword_4628C, eax
		mov	eax, [bp-0Ah]
		jmp	short loc_1FCF1
; ���������������������������������������������������������������������������

loc_1FCCF:				; CODE XREF: seg048:0569j seg048:056Fj
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-0Ah]
		jnz	short loc_1FCFB
		inc	dx
		mov	eax, [bp-0Ah]
		mov	dword_4628C, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_1FCF1:				; CODE XREF: seg048:057Dj
		mov	dword_46290, eax
		mov	byte ptr [bp-0Ch], 1
		jmp	short loc_1FD1B
; ���������������������������������������������������������������������������

loc_1FCFB:				; CODE XREF: seg048:0587j
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-6]
		jge	short loc_1FD11
		mov	ax, 1
		mov	cl, [bp-2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_1FD1B
; ���������������������������������������������������������������������������

loc_1FD11:				; CODE XREF: seg048:05B3j
		mov	ax, 1
		mov	cl, [bp-2]
		shl	ax, cl
		add	dx, ax

loc_1FD1B:				; CODE XREF: seg048:0535j seg048:05A9j ...
		mov	al, [bp-0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1FD27
		jmp	loc_1FC88
; ���������������������������������������������������������������������������

loc_1FD27:				; CODE XREF: seg048:05D2j
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_1FC55
; ���������������������������������������������������������������������������

loc_1FD3A:				; CODE XREF: seg048:04DAj seg048:04E8j
		mov	eax, dword_46294

loc_1FD3E:				; CODE XREF: seg048:0509j
		mov	bx, [bp+8]
		cmp	bx, 0
		jge	short loc_1FD4B
		nop
		nop
		mov	bx, 0

loc_1FD4B:				; CODE XREF: seg048:05F4j
		cmp	eax, 0
		jnz	short loc_1FD5A
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_1FD7C
; ���������������������������������������������������������������������������

loc_1FD5A:				; CODE XREF: seg048:05FFj
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

loc_1FD7C:				; CODE XREF: seg048:0608j
		cmp	ax, 0
		jnz	short loc_1FD88
		nop
		nop
		mov	ax, 0FFFFh
		jmp	short loc_1FD98
; ���������������������������������������������������������������������������

loc_1FD88:				; CODE XREF: seg048:062Fj
		cmp	ax, 0
		jl	short loc_1FD91
		nop
		nop
		jmp	short loc_1FD98
; ���������������������������������������������������������������������������

loc_1FD91:				; CODE XREF: seg048:063Bj
		mov	bx, [si+52h]
		sub	bx, ax
		mov	ax, bx

loc_1FD98:				; CODE XREF: seg048:0636j seg048:063Fj
		pop	di
		pop	si
		leave
		retf
seg048		ends
