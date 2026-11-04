seg058		segment	para public 'CODE' use16
		assume cs:seg058
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0EBh, 0

loc_22CA2:
		db 0EBh, 0

loc_22CA4:
		db 5Fh, 5Eh, 5Dh, 0CBh, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Render_EdgeSetup (sub_1DBE0 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Render_EdgeSetup (sub_2B5F9 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — stocke un
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
		mov	es:[bx+2], eax
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], eax
		pop	bp
		retf
Render_EdgeSetup		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22CCD		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		pop	bp
		retf
sub_22CCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22CEA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_22D06
		mov	al, 1
		jmp	short loc_22D08

loc_22D06:
		mov	al, 0

loc_22D08:
		pop	bp
		retf
sub_22CEA		endp

; START OF FUNCTION CHUNK FOR sub_22CEA
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_22CEA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D0C		proc far

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
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
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
		mov	dword_4F22E, eax
		mov	eax, dword_4F22E
		sar	eax, 8
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_22D0C		endp

; START OF FUNCTION CHUNK FOR sub_22D0C
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_22D0C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D5F		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_22D5F		endp

; START OF FUNCTION CHUNK FOR sub_22D5F
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_22D5F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D68		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_22D68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D6D		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		les	si, [bp+arg_0]
		mov	es:[si+8], dx
		mov	es:[si+6], bx
		pop	si
		pop	bp
		retf
sub_22D6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22DAF		proc far

var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+2]
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		call	sub_21E34
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		mov	[bp+var_4C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_48], eax
		mov	eax, es:[si+8]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_4C]
		add	ax, 4
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 6
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		les	bx, [bp+var_16]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		cmp	[bp+var_8], 0
		jz	short loc_22E4E
		mov	ax, 1
		jmp	short loc_22E50

loc_22E4E:
		xor	ax, ax

loc_22E50:
		or	al, al
		jz	short loc_22E9E
		mov	eax, dword_4F164
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax
		jmp	short loc_22EE7

loc_22E9E:
		mov	eax, dword_4F164
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	edx, eax
		mov	ecx, dword_4C156
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		mov	ax, word ptr [bp+var_36+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax

loc_22EE7:
		cmp	byte_4C120, 0
		jz	short loc_22F2F
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
		mov	[bp+var_38], ax
		mov	[bp+var_3A], dx
		les	di, [bp+var_3A]
		mov	eax, es:[di]
		mov	[bp+var_58], eax
		mov	eax, es:[di+4]
		mov	[bp+var_54], eax
		mov	eax, es:[di+8]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_54]
		mov	dword_4F22E, eax
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_22FA1

loc_22F2F:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_22F48
		mov	al, 1
		jmp	short loc_22F4A

loc_22F48:
		mov	al, 0

loc_22F4A:
		or	al, al
		jz	short loc_22F56
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_22FA1

loc_22F56:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
		mov	[bp+var_3C], ax
		mov	[bp+var_3E], dx
		les	ax, [bp+var_3E]
		mov	[bp+var_40], ax
		mov	bx, [bp+var_40]
		mov	eax, es:[bx]
		mov	[bp+var_64], eax
		mov	bx, [bp+var_40]
		mov	eax, es:[bx+4]
		mov	[bp+var_60], eax
		mov	bx, [bp+var_40]
		mov	eax, es:[bx+8]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_60]
		mov	dword_4F22E, eax
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_22DAF		endp

; START OF FUNCTION CHUNK FOR sub_22DAF

loc_22FA1:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_22DAF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22FA5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, [bp+arg_8]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], al
		pop	bp
		retf
sub_22FA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22FD1		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Ah]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1F7D5
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], al
		leave
		retf
sub_22FD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23002		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_23002		endp

; START OF FUNCTION CHUNK FOR sub_23002
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_23002

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2300B		proc far
		push	bp
		mov	bp, sp
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_2300B		endp

; START OF FUNCTION CHUNK FOR sub_2300B
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2300B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23016		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_23016		endp

; START OF FUNCTION CHUNK FOR sub_23016
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_23016

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2301F		proc far
		push	bp
		mov	bp, sp
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_2301F		endp

; START OF FUNCTION CHUNK FOR sub_2301F
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2301F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2302A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, [bp+arg_8]
		mov	al, es:[bx+6]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_2305B
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2306C

loc_2305B:
		mov	ax, si
		shl	ax, 8
		mov	edx, dword_4F2EE
		push	ax
		mov	ax, word_4F2EC
		pop	bx
		add	ax, bx

loc_2306C:
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], dx
		mov	es:[bx+0Ah], ax
		pop	si
		pop	bp
		retf
sub_2302A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2307A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_22CCD
		add	sp, 0Ch
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		leave
		retf
sub_2307A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_230B3		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_230B3		endp

; START OF FUNCTION CHUNK FOR sub_230B3
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_230B3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_230BC		proc far
		push	bp
		mov	bp, sp
sub_230BC		endp

; START OF FUNCTION CHUNK FOR sub_230BC
		db 33h
; END OF FUNCTION CHUNK FOR sub_230BC
seg058		ends
