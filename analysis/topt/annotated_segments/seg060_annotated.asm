seg060		segment	para public 'CODE' use16
		assume cs:seg060
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23870		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[si+2], al
		add	[bp+arg_2], 2
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	[si], ax
		add	[bp+arg_2], 2
		mov	ax, [si]
		shl	ax, 1
		add	ax, [si]
		mov	di, ax
		push	1
		push	0
		push	2
		movzx	eax, di
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+5], dx
		mov	[si+3], ax
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+5]
		push	word ptr [si+3]
		call	sub_3545
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_23870		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_DestructResource (sub_1ECAB de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Palette_DestructResource (sub_2E8A6 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — libère une chaîne (+3
; via sub_5C7B6) et réinitialise le pointeur : destructeur de ressource palette.
; ==============================================================================================
Palette_DestructResource		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		mov	ax, si
		add	ax, 3
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	dword ptr [si+3], 0
		pop	si
		pop	bp
		retf
Palette_DestructResource		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_ShadeTableFor_1ECD2 (sub_1ECD2 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_ShadeTableFor_2E8CD (sub_2E8CD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des
; objets, OBJECT_RENDER.md). TABLE D'OMBRE ET DE BROUILLARD d'une couleur hors gamme (ex-
; Gauge_ResolveAndApplyLabel). Args (541Ah, intensité, profondeur 24.8) →
; Interp_ResolveNormalizedIndex_2F55E puis Text_ResolveTruncated_2E8F1 : pointeur de table de
; 256 o, ou 0 (couleur inchangée).
; ==============================================================================================
Palette_ShadeTableFor_238F6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_246F4
		add	sp, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_2391D
		add	sp, 4
		pop	si
		pop	bp
		retf
Palette_ShadeTableFor_238F6		endp

; START OF FUNCTION CHUNK FOR Palette_ShadeTableFor_238F6
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Palette_ShadeTableFor_238F6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2391D		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		or	cx, cx
		jnz	short loc_23938
		mov	[bp+var_4], 0
		jmp	short loc_23986

loc_23938:
		or	cx, cx
		jle	short loc_2395A
		cmp	[si+52h], cx
		jge	short loc_23944
		mov	cx, [si+52h]

loc_23944:
		mov	ax, [si+60h]
		mov	dx, [si+5Eh]
		mov	bx, cx
		dec	bx
		shl	bx, 8
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		jmp	short loc_23986

loc_2395A:
		mov	[bp+var_6], cx
		mov	ax, [bp+var_6]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cx, ax
		cmp	[si+52h], cx
		jge	short loc_2396F
		mov	cx, [si+52h]

loc_2396F:
		mov	ax, [si+60h]
		mov	dx, [si+5Eh]
		add	dx, [si+50h]
		mov	bx, cx
		dec	bx
		shl	bx, 8
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx

loc_23986:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_2391D		endp

; START OF FUNCTION CHUNK FOR sub_2391D
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2391D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23992		proc far

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_3], 0
		xor	cx, cx
		jmp	short loc_239ED

loc_239AD:
		mov	ax, cx
		shl	ax, 4
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6], di
		jg	short loc_239DF
		mov	ax, cx
		shl	ax, 4
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, cx
		shl	dx, 4
		mov	bx, [si+5Ah]
		add	bx, dx
		add	ax, [bx+0Eh]
		cmp	ax, di
		jl	short loc_239DF
		mov	ax, 1
		jmp	short loc_239E1

loc_239DF:
		xor	ax, ax

loc_239E1:
		or	al, al
		jz	short loc_239EC
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_239EC:
		inc	cx

loc_239ED:
		cmp	[si+58h], cx
		jle	short loc_239FB
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_239AD

loc_239FB:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_23992		endp

; START OF FUNCTION CHUNK FOR sub_23992
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_23992

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23A06		proc far

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_3], 0
		xor	cx, cx
		jmp	short loc_23A8C

loc_23A21:
		mov	ax, cx
		shl	ax, 4
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6], di
		jg	short loc_23A53
		mov	ax, cx
		shl	ax, 4
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, cx
		shl	dx, 4
		mov	bx, [si+5Ah]
		add	bx, dx
		add	ax, [bx+0Eh]
		cmp	ax, di
		jl	short loc_23A53
		mov	ax, 1
		jmp	short loc_23A55

loc_23A53:
		xor	ax, ax

loc_23A55:
		or	al, al
		jz	short loc_23A8B
		mov	ax, cx
		shl	ax, 4
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+2], 0
		jz	short loc_23A7E
		mov	ax, cx
		shl	ax, 4
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+3], 0
		jz	short loc_23A7E
		mov	ax, 1
		jmp	short loc_23A80

loc_23A7E:
		xor	ax, ax

loc_23A80:
		or	al, al
		jz	short loc_23A8B
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_23A8B:
		inc	cx

loc_23A8C:
		cmp	[si+58h], cx
		jle	short loc_23A9A
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_23A21

loc_23A9A:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_23A06		endp

; START OF FUNCTION CHUNK FOR sub_23A06
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_23A06

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23AA5		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 6
		mov	[bp+arg_2], eax
		mov	eax, [di+7Ch]
		cmp	eax, [bp+arg_2]
		jg	short loc_23ADF
		mov	ax, [di+44h]
		mov	dx, [di+42h]
		mov	bx, [di+46h]
		dec	bx
		mov	cl, [di+4Eh]
		shl	bx, cl
		shl	bx, 2
		add	dx, bx
		mov	[di+4Ah], ax
		mov	[di+48h], dx
		jmp	short loc_23AFF

loc_23ADF:
		mov	cl, [di+7Ah]
		mov	eax, [bp+arg_2]
		sar	eax, cl
		mov	cl, [di+4Eh]
		shl	ax, cl
		shl	ax, 2
		mov	dx, [di+44h]
		mov	bx, [di+42h]
		add	bx, ax
		mov	[di+4Ah], dx
		mov	[di+48h], bx

loc_23AFF:
		les	bx, [di+48h]
		mov	eax, es:[bx]
		mov	[di+72h], eax
		les	bx, [di+48h]
		mov	ax, [di+4Ch]
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx-4]
		mov	[di+76h], eax
		mov	dword_4C18E, 0FFFFFFFFh
		pop	di
		pop	si
		pop	bp
		retf
sub_23AA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23B2B		proc far

var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_4C19A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_23B4B
		xor	eax, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf

loc_23B4B:
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_4C18E, 0FFFFFFFFh
		jz	short loc_23B86
		mov	eax, [bp+arg_2]
		cmp	eax, dword_4C18E
		jl	short loc_23B86
		mov	eax, [si+76h]
		cmp	eax, dword_4C18E
		jg	short loc_23B78
		jmp	loc_23CC1

loc_23B78:
		mov	eax, [bp+arg_2]
		cmp	eax, dword_4C192
		jge	short loc_23B86
		jmp	loc_23CC1

loc_23B86:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_23BB4
		mov	dword_4C18E, 0
		mov	eax, [si+72h]
		mov	dword_4C192, eax
		xor	eax, eax
		mov	dword_4C196, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
		jmp	loc_23CBF

loc_23BB4:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_23BE2
		mov	eax, [si+76h]
		mov	dword_4C18E, eax
		mov	eax, [si+76h]
		mov	dword_4C192, eax
		mov	eax, [si+6Ah]
		mov	dword_4C196, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
		jmp	loc_23CBF

loc_23BE2:
		mov	ax, [si+4Ch]
		sar	ax, 1
		dec	ax
		mov	di, ax
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], ax
		mov	[bp+var_B], 0
		jmp	loc_23C96

loc_23BF8:
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	ax, di
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		les	bx, [si+48h]
		mov	ax, di
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jl	short loc_23C4A
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jge	short loc_23C4A
		mov	eax, [bp+var_6]
		mov	dword_4C18E, eax
		mov	eax, [bp+var_A]
		mov	dword_4C192, eax
		mov	[bp+var_B], 1
		jmp	short loc_23C96

loc_23C4A:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_23C76
		inc	di
		mov	eax, [bp+var_A]
		mov	dword_4C18E, eax
		les	bx, [si+48h]
		mov	ax, di
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	dword_4C192, eax
		mov	[bp+var_B], 1
		jmp	short loc_23C96

loc_23C76:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_23C8C
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		shl	ax, cl
		sub	di, ax
		jmp	short loc_23C96

loc_23C8C:
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		shl	ax, cl
		add	di, ax

loc_23C96:
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_23CA2
		jmp	loc_23BF8

loc_23CA2:
		mov	ax, di
		inc	ax
		movsx	eax, ax
		mov	cl, [si+68h]
		sub	cl, [si+4Eh]
		shl	eax, cl
		mov	dword_4C196, eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf

loc_23CBF:
		jmp	short loc_23CCE

loc_23CC1:
		mov	eax, dword_4C196
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_23B2B		endp

; START OF FUNCTION CHUNK FOR sub_23B2B

loc_23CCE:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_23B2B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23CD2		proc far

var_36		= dword ptr -36h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 100h
		jle	short loc_23CEE
		mov	ax, 1
		jmp	short loc_23CF0

loc_23CEE:
		xor	ax, ax

loc_23CF0:
		or	al, al
		jz	short loc_23D06
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	bx, [bp+arg_2]
		mov	[bx], eax

loc_23D06:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jz	short loc_23D14
		mov	ax, 1
		jmp	short loc_23D16

loc_23D14:
		xor	ax, ax

loc_23D16:
		or	al, al
		jz	short loc_23D20
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_23D24

loc_23D20:
		mov	byte ptr [si+3Bh], 0

loc_23D24:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 100h
		jnz	short loc_23D35
		mov	ax, 1
		jmp	short loc_23D37

loc_23D35:
		xor	ax, ax

loc_23D37:
		or	al, al
		jz	short loc_23D45
		cmp	byte ptr [si+3Eh], 0
		jnz	short loc_23D45
		mov	byte ptr [si+3Bh], 0

loc_23D45:
		push	1
		sub	sp, 4
		mov	eax, dword_4F174
		mov	[bp+var_36], eax
		push	si
		nop
		push	cs
		call	near ptr sub_241AC
		add	sp, 8
		push	0
		mov	bx, [bp+arg_4]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_4]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		add	word ptr [bp+var_8], 4
		push	0
		mov	al, [si+21h]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		add	[bp+var_14], 4
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_23E33
		mov	byte ptr [si+3Ch], 0
		xor	di, di
		jmp	short loc_23E2A

loc_23DE8:
		les	bx, word ptr [bp+var_18]
		mov	al, es:[bx]
		les	bx, [bp+var_14]
		sub	al, es:[bx]
		mov	[bp+var_1D], al
		les	bx, word ptr [bp+var_1C]
		mov	al, [bp+var_1D]
		mov	es:[bx], al
		mov	al, [bp+var_1D]
		cbw
		mov	[bp+var_20], ax
		mov	ax, [bp+var_20]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_1D], al
		mov	al, [si+3Ch]
		cmp	al, [bp+var_1D]
		jge	short loc_23E20
		mov	al, [bp+var_1D]
		mov	[si+3Ch], al

loc_23E20:
		inc	di
		inc	word ptr [bp+var_1C]
		inc	word ptr [bp+var_18]
		inc	[bp+var_14]

loc_23E2A:
		cmp	[si+7], di
		jg	short loc_23DE8
		mov	byte ptr [si+3Dh], 1

loc_23E33:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jle	short loc_23E41
		mov	ax, 1
		jmp	short loc_23E43

loc_23E41:
		xor	ax, ax

loc_23E43:
		or	al, al
		jnz	short loc_23E4A
		jmp	loc_23F0B

loc_23E4A:
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_28], ax
		movsx	eax, [bp+var_28]
		mov	bx, [bp+arg_2]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_2C], edx
		mov	eax, [bp+var_2C]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jg	short loc_23E78
		mov	ax, 1
		jmp	short loc_23E7A

loc_23E78:
		xor	ax, ax

loc_23E7A:
		or	al, al
		jz	short loc_23E84
		mov	[bp+var_21], 0
		jmp	short loc_23E99

loc_23E84:
		mov	eax, [bp+var_26]
		sar	eax, 8
		mov	[bp+var_21], al
		cmp	[bp+var_21], 0
		jnz	short loc_23E99
		mov	[bp+var_21], 1

loc_23E99:
		xor	di, di
		jmp	short loc_23EFD

loc_23E9D:
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx]
		mov	[bp+var_1D], al
		cmp	[bp+var_1D], 0
		jle	short loc_23EC2
		mov	al, [bp+var_1D]
		cmp	al, [bp+var_21]
		jle	short loc_23EBC
		mov	al, [bp+var_21]
		sub	[bp+var_1D], al
		jmp	short loc_23EC0

loc_23EBC:
		mov	[bp+var_1D], 0

loc_23EC0:
		jmp	short loc_23EE4

loc_23EC2:
		cmp	[bp+var_1D], 0
		jge	short loc_23EE4
		mov	al, [bp+var_1D]
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_21]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_23EE0
		mov	al, [bp+var_21]
		add	[bp+var_1D], al
		jmp	short loc_23EE4

loc_23EE0:
		mov	[bp+var_1D], 0

loc_23EE4:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx]
		sub	al, [bp+var_1D]
		les	bx, word ptr [bp+var_10]
		mov	es:[bx], al
		inc	di
		inc	word ptr [bp+var_C]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_10]

loc_23EFD:
		cmp	[si+7], di
		jg	short loc_23E9D
		push	si
		call	sub_243B1
		add	sp, 2

loc_23F0B:
		pop	di
		pop	si
		leave
		retf
sub_23CD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23F0F		proc far

var_32		= dword ptr -32h
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 100h
		jle	short loc_23F2B
		mov	ax, 1
		jmp	short loc_23F2D

loc_23F2B:
		xor	ax, ax

loc_23F2D:
		or	al, al
		jz	short loc_23F43
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	bx, [bp+arg_2]
		mov	[bx], eax

loc_23F43:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jz	short loc_23F51
		mov	ax, 1
		jmp	short loc_23F53

loc_23F51:
		xor	ax, ax

loc_23F53:
		or	al, al
		jz	short loc_23F5D
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_23F61

loc_23F5D:
		mov	byte ptr [si+3Bh], 0

loc_23F61:
		push	1
		sub	sp, 4
		mov	eax, dword_4F174
		mov	[bp+var_32], eax
		push	si
		nop
		push	cs
		call	near ptr sub_241AC
		add	sp, 8
		cmp	byte ptr [si+3Eh], 2
		jnz	short loc_23F95
		mov	al, [si+3Fh]
		cmp	al, [bp+arg_4]
		jz	short loc_23FAF
		mov	al, [si+40h]
		cmp	al, [bp+arg_6]
		jz	short loc_23FAF
		mov	al, [si+41h]
		cmp	al, [bp+arg_8]
		jz	short loc_23FAF

loc_23F95:
		mov	byte ptr [si+3Eh], 2
		mov	byte ptr [si+3Dh], 0
		mov	al, [bp+arg_4]
		mov	[si+3Fh], al
		mov	al, [bp+arg_6]
		mov	[si+40h], al
		mov	al, [bp+arg_8]
		mov	[si+41h], al

loc_23FAF:
		push	0
		mov	al, [si+21h]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [si+3]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_14], eax
		mov	ax, si
		add	ax, 3Fh
		mov	di, ax
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2405F
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_16], 0
		jmp	short loc_24054

loc_23FFF:
		mov	[bp+var_18], 0
		jmp	short loc_24044

loc_24006:
		mov	al, [di]
		les	bx, word ptr [bp+var_14]
		sub	al, es:[bx]
		mov	[bp+var_19], al
		les	bx, word ptr [bp+var_10]
		mov	al, [bp+var_19]
		mov	es:[bx], al
		mov	al, [bp+var_19]
		cbw
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_1C]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_19], al
		mov	al, [si+3Ch]
		cmp	al, [bp+var_19]
		jge	short loc_2403A
		mov	al, [bp+var_19]
		mov	[si+3Ch], al

loc_2403A:
		inc	[bp+var_18]
		inc	word ptr [bp+var_10]
		inc	word ptr [bp+var_14]
		inc	di

loc_24044:
		cmp	[bp+var_18], 3
		jl	short loc_24006
		mov	ax, si
		add	ax, 3Fh
		mov	di, ax
		inc	[bp+var_16]

loc_24054:
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_23FFF
		mov	byte ptr [si+3Dh], 1

loc_2405F:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jle	short loc_2406D
		mov	ax, 1
		jmp	short loc_2406F

loc_2406D:
		xor	ax, ax

loc_2406F:
		or	al, al
		jnz	short loc_24076
		jmp	loc_24156

loc_24076:
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_24]
		mov	bx, [bp+arg_2]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_28], edx
		mov	eax, [bp+var_28]
		mov	[bp+var_22], eax
		cmp	[bp+var_22], 0
		jg	short loc_240A4
		mov	ax, 1
		jmp	short loc_240A6

loc_240A4:
		xor	ax, ax

loc_240A6:
		or	al, al
		jz	short loc_240B0
		mov	[bp+var_1D], 0
		jmp	short loc_240C5

loc_240B0:
		mov	eax, [bp+var_22]
		sar	eax, 8
		mov	[bp+var_1D], al
		cmp	[bp+var_1D], 0
		jnz	short loc_240C5
		mov	[bp+var_1D], 1

loc_240C5:
		mov	ax, si
		add	ax, 3Fh
		mov	di, ax
		mov	[bp+var_16], 0
		jmp	short loc_24146

loc_240D3:
		mov	[bp+var_18], 0
		jmp	short loc_24136

loc_240DA:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx]
		mov	[bp+var_19], al
		cmp	[bp+var_19], 0
		jle	short loc_240FF
		mov	al, [bp+var_19]
		cmp	al, [bp+var_1D]
		jle	short loc_240F9
		mov	al, [bp+var_1D]
		sub	[bp+var_19], al
		jmp	short loc_240FD

loc_240F9:
		mov	[bp+var_19], 0

loc_240FD:
		jmp	short loc_24121

loc_240FF:
		cmp	[bp+var_19], 0
		jge	short loc_24121
		mov	al, [bp+var_19]
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_1D]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_2411D
		mov	al, [bp+var_1D]
		add	[bp+var_19], al
		jmp	short loc_24121

loc_2411D:
		mov	[bp+var_19], 0

loc_24121:
		mov	al, [di]
		sub	al, [bp+var_19]
		les	bx, word ptr [bp+var_C]
		mov	es:[bx], al
		inc	[bp+var_18]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_C]
		inc	di

loc_24136:
		cmp	[bp+var_18], 3
		jl	short loc_240DA
		mov	ax, si
		add	ax, 3Fh
		mov	di, ax
		inc	[bp+var_16]

loc_24146:
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_240D3
		push	si
		call	sub_243B1
		add	sp, 2

loc_24156:
		pop	di
		pop	si
		leave
		retf
sub_23F0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Cockpit_PanAzimuthUpdate (sub_1F54F de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Cockpit_PanAzimuthUpdate (sub_2F064 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,28L — reset optionnel d'état
; (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9 : pilotage de la transition d'azimut/pan
; de la caméra du cockpit (appelé par Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate_2415A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 0
		jz	short loc_2416F
		mov	byte ptr [si+3Eh], 0
		mov	byte ptr [si+3Dh], 0

loc_2416F:
		mov	ax, si
		add	ax, 9
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_23CD2
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate_2415A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cockpit_PanAzimuthUpdate (sub_1F54F de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Cockpit_PanAzimuthUpdate
; (sub_2F064 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,28L — reset optionnel d'état (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9
; : pilotage de la transition d'azimut/pan de la caméra du cockpit (appelé par
; Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate_24183		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 1
		jz	short loc_24198
		mov	byte ptr [si+3Eh], 1
		mov	byte ptr [si+3Dh], 0

loc_24198:
		mov	ax, si
		add	ax, 13h
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_23CD2
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate_24183		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_241AC		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 37h
		mov	[bp+var_6], ax
		mov	eax, [bp+arg_2]
		mov	edx, eax
		mov	bx, [bp+var_6]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	di, word ptr [bp+var_4+1]
		or	di, di
		jnz	short loc_241ED
		mov	di, 1

loc_241ED:
		mov	ax, [si+33h]
		sub	ax, di
		mov	di, ax
		or	di, di
		jge	short loc_241FA
		xor	di, di

loc_241FA:
		cmp	[bp+arg_6], 0
		jnz	short loc_24208
		cmp	[si+31h], di
		jnz	short loc_24208
		jmp	loc_2429D

loc_24208:
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2421B
		mov	eax, [si+3]
		mov	[bp+var_E], eax
		jmp	short loc_2423C

loc_2421B:
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		add	word ptr [bp+var_E], 4

loc_2423C:
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		add	word ptr [bp+var_E], 2D0h
		mov	ax, [si+35h]
		shl	ax, 1
		add	ax, [si+35h]
		mov	[bp+var_14], ax
		mov	ax, di
		imul	[bp+var_14]
		add	[bp+var_12], ax
		push	[bp+var_14]
		push	[bp+var_10]
		push	[bp+var_12]
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		call	sub_3545
		add	sp, 0Ah
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2429A
		push	si
		call	sub_243B1
		add	sp, 2

loc_2429A:
		mov	[si+31h], di

loc_2429D:
		pop	di
		pop	si
		leave
		retf
sub_241AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_242A1		proc far
		push	bp
		mov	bp, sp
		mov	word_4F28E, 0
		mov	dword ptr word_4F291, 0
		mov	dword_4F297, 0
		mov	byte_4F29B, 2
		mov	byte_4F29C, 0
		mov	dword_4F29D, 0
		mov	dword_4F2A1, 0
		mov	byte_4F2A5, 2
		mov	byte_4F2A6, 0
		mov	dword_4F2A7, 0
		mov	dword_4F2AB, 0
		mov	byte_4F2AF, 2
		mov	byte_4F2B0, 0
		mov	dword_4F2B1, 0
		mov	dword_4F2B5, 0
		mov	byte_4F2B9, 2
		mov	byte_4F2BA, 0
		mov	dword_4F2BB, 0
		mov	dword ptr word_4F2EC, 0
		mov	byte_4F2F0, 2
		mov	byte_4F2F1, 0
		mov	dword_4F2F2, 0
		push	68AEh
		call	sub_48237
		add	sp, 2
		pop	bp
		retf
sub_242A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2434C		proc far
		push	bp
		mov	bp, sp
sub_2434C		endp

; START OF FUNCTION CHUNK FOR sub_2434C
		db 6Ah
; END OF FUNCTION CHUNK FOR sub_2434C
seg060		ends
