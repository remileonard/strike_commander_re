seg074		segment	para public 'CODE' use16
		assume cs:seg074
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Render_EdgeSetup (sub_2B5F9 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — stocke un
; pointeur sommet (+1) et copie un champ (+2→+5) depuis un second sommet : setup d'une
; arête/segment (2 sommets), analogue linéaire de sub_294C0 (triangles, seg055).
; ==============================================================================================
Render_EdgeSetup		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		pop	bp
		retf
Render_EdgeSetup		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_344E1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_344FD
		mov	al, 1
		jmp	short loc_344FF

loc_344FD:
		mov	al, 0

loc_344FF:
		pop	bp
		retf
sub_344E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34501		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_60054, eax
		sar	eax, 8
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_34501		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3454D		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_3454D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34554		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_34554		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34559		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 2Ah
		cdq
		idiv	ebx
		imul	ax, ax, 2Ah
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		mov	si, [bp+arg_0]
		mov	es:[si+6], dx
		mov	es:[si+4], bx
		pop	si
		pop	bp
		retf
sub_34559		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34594		proc far

var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		call	sub_3329B
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_44], eax
		mov	eax, es:[si+4]
		mov	[bp+var_40], eax
		mov	eax, es:[si+8]
		mov	[bp+var_3C], eax
		lea	si, word ptr [bp+var_44]
		add	si, 4
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 8
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		cmp	[bp+var_4], 0
		jz	short loc_34612
		mov	ax, 1
		jmp	short loc_34614

loc_34612:
		xor	ax, ax

loc_34614:
		or	al, al
		jz	short loc_3465B
		mov	eax, dword_5FF62
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	ax, word ptr [bp+var_20+1]
		jmp	short loc_3469D

loc_3465B:
		mov	eax, dword_5FF62
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	edx, eax
		mov	ecx, dword_5C382
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	ax, word ptr [bp+var_30+1]

loc_3469D:
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], ax
		cmp	byte_5C354, 0
		jz	short loc_346E2
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_32], ax
		mov	[bp+var_34], dx
		les	si, [bp+var_34]
		mov	eax, es:[si]
		mov	[bp+var_50], eax
		mov	eax, es:[si+4]
		mov	[bp+var_4C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_4C]
		jmp	short loc_3473A

loc_346E2:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_346FB
		mov	al, 1
		jmp	short loc_346FD

loc_346FB:
		mov	al, 0

loc_346FD:
		or	al, al
		jz	short loc_34705
		mov	al, 0
		jmp	short loc_34740

loc_34705:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_36], ax
		mov	[bp+var_38], dx
		les	si, [bp+var_38]
		mov	eax, es:[si]
		mov	[bp+var_5C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_58], eax
		mov	eax, es:[si+8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_58]

loc_3473A:
		mov	dword_60054, eax
		mov	al, 1

loc_34740:
		pop	si
		leave
		retf
sub_34594		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Render_EdgeSetupSolidColor (sub_2BA67 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,22L — appelle
; sub_2B5F9 puis copie un flag couleur (+6→+9) : setup d'arête avec couleur unie.
; ==============================================================================================
Render_EdgeSetupSolidColor		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_8]
		mov	al, es:[bx+6]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Eh], al
		pop	bp
		retf
Render_EdgeSetupSolidColor		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34769		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Eh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_30551
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al
		pop	bp
		retf
sub_34769		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34789		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		push	ax
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		mov	edx, dword_5C386
		imul	edx, eax
		mov	[bp+var_6], edx
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	word ptr [bp+var_A+1]
		push	word ptr es:[bx+0Ch]
		les	bx, es:[bx+4]
		push	word ptr es:[bx+1Ah]
		push	word ptr es:[bx+18h]
		push	word_5DD42
		call	sub_49854
		add	sp, 0Ch
		leave
		retf
sub_34789		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_347D9		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_347D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_347E0		proc far
		push	bp
		mov	bp, sp
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_347E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_347E9		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		push	ax
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		mov	edx, dword_5C386
		imul	edx, eax
		mov	[bp+var_6], edx
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	word ptr [bp+var_A+1]
		push	word ptr es:[bx+0Ch]
		les	bx, es:[bx+4]
		push	word ptr es:[bx+1Ah]
		push	word ptr es:[bx+18h]
		push	word_5DD42
		call	sub_49512
		add	sp, 0Ch
		leave
		retf
sub_347E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34839		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_34839		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34840		proc far
		push	bp
		mov	bp, sp
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_34840		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34849		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_8]
		mov	al, es:[bx+6]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_34874
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_348A2

loc_34874:
		cmp	byte_60160, 3
		jnz	short loc_34893
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3489B

loc_34893:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3489B:
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_348A2:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], dx
		mov	es:[bx+0Eh], ax
		pop	si
		pop	bp
		retf
sub_34849		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_348B0		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		push	large es:[bx+0Eh]
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		mov	edx, dword_5C386
		imul	edx, eax
		mov	[bp+var_6], edx
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	word ptr [bp+var_A+1]
		push	word ptr es:[bx+0Ch]
		les	bx, es:[bx+4]
		push	word ptr es:[bx+1Ah]
		push	word ptr es:[bx+18h]
		push	word_5DD42
		call	sub_28484
		add	sp, 0Eh
		leave
		retf
sub_348B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34900		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_34900		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34907		proc far
		push	bp
		mov	bp, sp
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_34907		endp
seg074		ends
