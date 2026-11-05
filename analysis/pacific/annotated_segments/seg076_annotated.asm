seg076		segment	para public 'CODE' use16
		assume cs:seg076
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 4, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E656		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_A		= word ptr  10h

		enter	14h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, 0
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
		jnz	short loc_2E686
		mov	ax, [di+0Bh]

loc_2E686:
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		imul	[bp+var_8]
		add	ax, 80h
		sar	ax, 8
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2E6A7
		mov	ax, [di+6]
		add	ax, [bp+var_6]
		jmp	short loc_2E6C6

loc_2E6A7:
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

loc_2E6C6:
		jmp	short loc_2E6CA
		xor	ax, ax

loc_2E6CA:
		pop	di
		pop	si
		leave
		retf
sub_2E656		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_FogTableIndex_1F908 (sub_1F908 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_FogTableIndex_2F404 (sub_2F404 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des
; objets, OBJECT_RENDER.md). N° de table de brouillard pour une profondeur (ex-
; Interp_ResolveCached) : même recherche de seuils que Palette_ShadeIndexWithFog_2F24E (cache
; dword_6E9BA/BE/C2).
; ==============================================================================================
Palette_FogTableIndex_2E6CE		proc far

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
		cmp	dword_77B30, 0FFFFFFFFh
		jz	short loc_2E70E
		cmp	eax, dword_77B30
		jl	short loc_2E70E
		mov	eax, [si+76h]
		cmp	eax, dword_77B30
		jg	short loc_2E700
		jmp	loc_2E80D

loc_2E700:
		mov	eax, [bp+arg_2]
		cmp	eax, dword_77B34
		jge	short loc_2E70E
		jmp	loc_2E80D

loc_2E70E:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_2E72F
		mov	dword_77B30, 0
		mov	dword_77B34, eax
		xor	eax, eax

loc_2E728:
		mov	dword_77B38, eax
		jmp	loc_2E811

loc_2E72F:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_2E747
		mov	dword_77B30, eax
		mov	dword_77B34, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2E728

loc_2E747:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_2E7EE

loc_2E75B:
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
		jl	short loc_2E7A2
		cmp	eax, [bp+var_A]
		jge	short loc_2E7A2
		mov	eax, [bp+var_6]
		mov	dword_77B30, eax
		mov	eax, [bp+var_A]
		jmp	short loc_2E7C4

loc_2E7A2:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_2E7CE
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_77B30, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2E7C4:
		mov	dword_77B34, eax
		mov	[bp+var_C], 1
		jmp	short loc_2E7EE

loc_2E7CE:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_2E7E4
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2E7EE

loc_2E7E4:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_2E7EE:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E7FA
		jmp	loc_2E75B

loc_2E7FA:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2E728

loc_2E80D:
		mov	eax, dword_77B38

loc_2E811:
		movsx	edx, word ptr [si+52h]
		imul	eax, edx
		add	eax, [si+6Eh]
		mov	cx, [si+68h]
		sar	eax, cl
		pop	di
		pop	si
		leave
		retf
Palette_FogTableIndex_2E6CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E828		proc far

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
		cmp	dword_77B30, 0FFFFFFFFh
		jz	short loc_2E87C
		cmp	eax, dword_77B30
		jl	short loc_2E87C
		mov	eax, [si+76h]
		cmp	eax, dword_77B30
		jg	short loc_2E86E
		jmp	loc_2E97B

loc_2E86E:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_77B34
		jge	short loc_2E87C
		jmp	loc_2E97B

loc_2E87C:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_2E89D
		mov	dword_77B30, 0
		mov	dword_77B34, eax
		xor	eax, eax

loc_2E896:
		mov	dword_77B38, eax
		jmp	loc_2E97F

loc_2E89D:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_2E8B5
		mov	dword_77B30, eax
		mov	dword_77B34, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2E896

loc_2E8B5:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_2E95C

loc_2E8C9:
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
		jl	short loc_2E910
		cmp	eax, [bp+var_A]
		jge	short loc_2E910
		mov	eax, [bp+var_6]
		mov	dword_77B30, eax
		mov	eax, [bp+var_A]
		jmp	short loc_2E932

loc_2E910:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_2E93C
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_77B30, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2E932:
		mov	dword_77B34, eax
		mov	[bp+var_C], 1
		jmp	short loc_2E95C

loc_2E93C:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_2E952
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2E95C

loc_2E952:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_2E95C:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E968
		jmp	loc_2E8C9

loc_2E968:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2E896

loc_2E97B:
		mov	eax, dword_77B38

loc_2E97F:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_2E98C
		nop
		nop
		mov	bx, 0

loc_2E98C:
		cmp	eax, 0
		jnz	short loc_2E99B
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_2E9BD

loc_2E99B:
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

loc_2E9BD:
		pop	di
		pop	si
		leave
		retf
sub_2E828		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E9C1		proc far

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
		cmp	dword_77B30, 0FFFFFFFFh
		jz	short loc_2EA01
		cmp	eax, dword_77B30
		jl	short loc_2EA01
		mov	eax, [si+76h]
		cmp	eax, dword_77B30
		jg	short loc_2E9F3
		jmp	loc_2EB00

loc_2E9F3:
		mov	eax, [bp+arg_4]
		cmp	eax, dword_77B34
		jge	short loc_2EA01
		jmp	loc_2EB00

loc_2EA01:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_4]
		jle	short loc_2EA22
		mov	dword_77B30, 0
		mov	dword_77B34, eax
		xor	eax, eax

loc_2EA1B:
		mov	dword_77B38, eax
		jmp	loc_2EB04

loc_2EA22:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_4]
		jg	short loc_2EA3A
		mov	dword_77B30, eax
		mov	dword_77B34, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2EA1B

loc_2EA3A:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], al
		mov	[bp+var_C], 0
		jmp	loc_2EAE1

loc_2EA4E:
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
		jl	short loc_2EA95
		cmp	eax, [bp+var_A]
		jge	short loc_2EA95
		mov	eax, [bp+var_6]
		mov	dword_77B30, eax
		mov	eax, [bp+var_A]
		jmp	short loc_2EAB7

loc_2EA95:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_A]
		jnz	short loc_2EAC1
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_77B30, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2EAB7:
		mov	dword_77B34, eax
		mov	[bp+var_C], 1
		jmp	short loc_2EAE1

loc_2EAC1:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_6]
		jge	short loc_2EAD7
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2EAE1

loc_2EAD7:
		mov	ax, 1
		mov	cl, [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_2EAE1:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2EAED
		jmp	loc_2EA4E

loc_2EAED:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cx, [si+68h]
		sub	cx, [si+4Eh]
		shl	eax, cl
		jmp	loc_2EA1B

loc_2EB00:
		mov	eax, dword_77B38

loc_2EB04:
		mov	bx, [bp+arg_2]
		cmp	bx, 0
		jge	short loc_2EB11
		nop
		nop
		mov	bx, 0

loc_2EB11:
		cmp	eax, 0
		jnz	short loc_2EB20
		movsx	eax, bx
		sub	ax, [si+52h]
		jmp	short loc_2EB42

loc_2EB20:
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

loc_2EB42:
		cmp	ax, 0
		jnz	short loc_2EB4E
		nop
		nop
		mov	ax, 0FFFFh
		jmp	short loc_2EB5E

loc_2EB4E:
		cmp	ax, 0
		jl	short loc_2EB57
		nop
		nop
		jmp	short loc_2EB5E

loc_2EB57:
		mov	bx, [si+52h]
		sub	bx, ax
		mov	ax, bx

loc_2EB5E:
		pop	di
		pop	si
sub_2E9C1		endp
seg076		ends
