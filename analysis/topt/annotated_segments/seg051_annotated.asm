seg051		segment	para public 'CODE' use16
		assume cs:seg051
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E931		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_1E931		endp

; START OF FUNCTION CHUNK FOR sub_1E931
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E931

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E93A		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1E93A		endp

; START OF FUNCTION CHUNK FOR sub_1E93A
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E93A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E943		proc far

var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		mov	[bp+var_8], 0B33Ah
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_4F164
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		mov	[bp+var_1E], 8
		jmp	short loc_1EA01

loc_1E9AB:
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		cmp	dword ptr es:[bx+5Ah], 0
		jz	short loc_1EA01
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+5Ah]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_1E9E5
		mov	ax, 1
		jmp	short loc_1E9E7

loc_1E9E5:
		xor	ax, ax

loc_1E9E7:
		or	al, al
		jz	short loc_1E9F2
		mov	al, byte ptr [bp+var_1E]
		leave
		retf
		jmp	short loc_1EA01

loc_1E9F2:
		mov	al, byte_4C116
		mov	ah, 0
		cmp	ax, [bp+var_1E]
		jl	short loc_1EA01
		mov	al, byte ptr [bp+var_1E]
		leave
		retf

loc_1EA01:
		dec	[bp+var_1E]
		jg	short loc_1E9AB
		mov	al, 0
		leave
		retf
sub_1E943		endp

; START OF FUNCTION CHUNK FOR sub_1E943
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1E943

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EA0C		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Eh]
		cmp	ax, word_4C36B
		jz	short loc_1EA81
		les	bx, [bp+arg_0]
		mov	ax, word_4C36B
		mov	es:[bx+8Eh], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+88h]
		sub	eax, dword_4C35D
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jg	short loc_1EA6C
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_2707F
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+84h]
		les	bx, [bp+arg_0]
		mov	es:[bx+88h], eax
		mov	al, 1
		leave
		retf

loc_1EA6C:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+88h], eax

loc_1EA81:
		mov	al, 0
		leave
		retf
sub_1EA0C		endp

; START OF FUNCTION CHUNK FOR sub_1EA0C
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1EA0C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EA87		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		add	ax, 23h
		pop	bp
		retf
sub_1EA87		endp

; START OF FUNCTION CHUNK FOR sub_1EA87
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1EA87

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EA97		proc far

arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+95h], 0FEh
		or	es:[bx+95h], al
		pop	bp
		retf
sub_1EA97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EAB0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+95h]
		and	ax, 1
		pop	bp
		retf
sub_1EAB0		endp

; START OF FUNCTION CHUNK FOR sub_1EAB0
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1EAB0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EAC2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+95h]
		shr	ax, 1
		and	ax, 1
		pop	bp
		retf
sub_1EAC2		endp

; START OF FUNCTION CHUNK FOR sub_1EAC2
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1EAC2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EAD6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		add	ax, 12h
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 53h
		push	[bp+arg_2]
		push	ax
		call	sub_2A3E4
		add	sp, 8
		pop	bp
		retf
sub_1EAD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_SetWidgetValue_50654 (sub_50654 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine transmettant 2 arguments + id widget 59CDh à sub_23241 (probable setter
; générique de valeur de widget).
; ==============================================================================================
UIScreen_SetWidgetValue_1EB0F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1EAD6
		add	sp, 4
		pop	bp
		retf
UIScreen_SetWidgetValue_1EB0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EB21		proc far

var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= word ptr -116h
var_FE		= word ptr -0FEh
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= word ptr -8Ch
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6C		= dword ptr -6Ch
var_6A		= dword ptr -6Ah
var_68		= dword ptr -68h
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_60		= dword ptr -60h
var_5E		= dword ptr -5Eh
var_5C		= dword ptr -5Ch
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_56		= dword ptr -56h
var_54		= dword ptr -54h
var_52		= dword ptr -52h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	bx, word_4F3F5
		mov	ax, [bx+4]
		inc	ax
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_CE], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_CA], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[bp+var_C6], eax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+2], 0
		jnz	short loc_1EB71
		push	600Ch
		call	sub_13451
		add	sp, 2

loc_1EB71:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+95h]
		and	ax, 1
		or	al, al
		jnz	short loc_1EB83
		jmp	loc_1F5C0

loc_1EB83:
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+95h], 0FDh
		lea	ax, [bp+var_116]
		push	ax
		call	sub_2A4FF
		add	sp, 2
		mov	[bp+var_C], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+26h], 0
		jz	short loc_1EBBB
		mov	ax, 1
		jmp	short loc_1EBBD

loc_1EBBB:
		xor	ax, ax

loc_1EBBD:
		mov	[bp+var_7], al
		cmp	[bp+var_7], 0
		jz	short loc_1EC21
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		call	sub_25FAC
		add	sp, 2
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_F2], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		mov	[bp+var_EE], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx+8]
		mov	[bp+var_EA], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		call	sub_2A606
		add	sp, 4
		jmp	short loc_1EC75

loc_1EC21:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		add	ax, 12h
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_F2], eax
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		mov	[bp+var_EE], eax
		mov	bx, [bp+var_10]
		mov	eax, [bx+8]
		mov	[bp+var_EA], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		call	sub_2A606
		add	sp, 4

loc_1EC75:
		cmp	[bp+var_7], 0
		jnz	short loc_1EC7E
		jmp	loc_1ED03

loc_1EC7E:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	dword ptr [bx+1Ah], 0
		jge	short loc_1ED03
		mov	eax, [bp+var_F2]
		sub	eax, [si+14h]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_EE]
		sub	eax, [si+18h]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_EA]
		sub	eax, [si+1Ch]
		mov	[bp+var_11A], eax
		lea	ax, word ptr [bp+var_122]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_38]
		mov	[bp+var_34], eax
		mov	[bp+var_3C], 0
		cmp	[bp+var_34], 0
		jge	short loc_1ECEC
		mov	[bp+var_3C], 400h

loc_1ECEC:
		cmp	[bp+var_34], 0
		jle	short loc_1ECFB
		mov	[bp+var_3C], 0FFFFFC00h

loc_1ECFB:
		mov	eax, [bp+var_3C]
		add	[bp+var_C], eax

loc_1ED03:
		mov	eax, [bp+var_F2]
		sub	eax, [si+14h]
		mov	[bp+var_DA], eax
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_EE]
		sub	eax, [si+18h]
		mov	[bp+var_D6], eax
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_EA]
		sub	eax, [si+1Ch]
		mov	[bp+var_D2], eax
		mov	[bp+var_DE], eax
		push	6798h
		lea	ax, word ptr [bp+var_E6]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		mov	eax, [bp+var_E2]
		mov	[bp+var_6], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		add	ax, 20h
		mov	[bp+var_16], ax
		mov	bx, [bp+var_16]
		mov	eax, [bx]
		mov	[bp+var_14], eax
		mov	eax, dword_4C156
		sub	eax, [bp+var_14]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_1E]
		jge	short loc_1ED8F
		mov	ax, 1
		jmp	short loc_1ED91

loc_1ED8F:
		xor	ax, ax

loc_1ED91:
		or	al, al
		jz	short loc_1EDA2
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2
		pop	di
		pop	si
		leave
		retf

loc_1EDA2:
		push	large [bp+var_DE]
		push	large [bp+var_E2]
		push	large [bp+var_E6]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		cmp	eax, [bp+var_14]
		jge	short loc_1EDF5
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+7Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1EDED
		pop	di
		pop	si
		leave
		retf

loc_1EDED:
		mov	byte_4C120, 0
		jmp	loc_1F2AD

loc_1EDF5:
		mov	eax, dword_4F304
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		shl	eax, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_40+2], dx
		mov	word ptr [bp+var_40], ax
		cmp	[bp+var_40], 0
		jz	short loc_1EEA5
		les	bx, word ptr [bp+var_40]
		cmp	byte ptr es:[bx+11h], 1
		jnz	short loc_1EEA5
		mov	eax, [bp+var_34]
		shl	eax, 1
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		cmp	al, 6
		jnz	short loc_1EEA5
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		push	ss
		lea	ax, word ptr [bp+var_122]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_122]
		or	eax, [bp+var_11E]
		or	eax, [bp+var_11A]
		jnz	short loc_1EE94
		mov	ax, 1
		jmp	short loc_1EE96

loc_1EE94:
		xor	ax, ax

loc_1EE96:
		or	al, al
		jz	short loc_1EEA5
		mov	eax, [bp+var_34]
		sar	eax, 1
		mov	[bp+var_34], eax

loc_1EEA5:
		mov	eax, [bp+var_34]
		add	eax, [bp+var_14]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_48]
		jle	short loc_1EEC8
		mov	ax, 1
		jmp	short loc_1EECA

loc_1EEC8:
		xor	ax, ax

loc_1EECA:
		or	al, al
		jz	short loc_1EEDB
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2
		pop	di
		pop	si
		leave
		retf

loc_1EEDB:
		mov	eax, [bp+var_14]
		mov	[bp+var_4C], eax
		mov	ax, si
		add	ax, 66h
		mov	di, ax
		mov	eax, [bp+var_4C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	ax, si
		add	ax, 6Eh
		mov	word ptr [bp+var_50+2], ax
		mov	eax, [bp+var_6]
		mov	bx, word ptr [bp+var_50+2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		add	[bp+var_4C], eax
		mov	eax, [bp+var_DE]
		or	eax, eax
		jge	short loc_1EF38
		neg	eax

loc_1EF38:
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		cmp	eax, [bp+var_4C]
		jle	short loc_1EF53
		mov	ax, 1
		jmp	short loc_1EF55

loc_1EF53:
		xor	ax, ax

loc_1EF55:
		or	al, al
		jz	short loc_1EF69
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2
		pop	di
		pop	si
		leave
		retf
		jmp	loc_1EFFE

loc_1EF69:
		mov	eax, [bp+var_14]
		mov	[bp+var_76], eax
		mov	ax, si
		add	ax, 6Ah
		mov	word ptr [bp+var_7A+2], ax
		mov	eax, [bp+var_76]
		mov	bx, word ptr [bp+var_7A+2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	ax, si
		add	ax, 72h
		mov	word ptr [bp+var_7A], ax
		mov	eax, [bp+var_6]
		mov	bx, word ptr [bp+var_7A]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_82]
		add	[bp+var_76], eax
		mov	eax, [bp+var_E6]
		or	eax, eax
		jge	short loc_1EFCC
		neg	eax

loc_1EFCC:
		mov	[bp+var_86], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		cmp	eax, [bp+var_76]
		jle	short loc_1EFEB
		mov	ax, 1
		jmp	short loc_1EFED

loc_1EFEB:
		xor	ax, ax

loc_1EFED:
		or	al, al
		jz	short loc_1EFFE
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2
		pop	di
		pop	si
		leave
		retf

loc_1EFFE:
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_14]
		jg	short loc_1F00B
		jmp	loc_1F243

loc_1F00B:
		push	large [bp+var_6]
		push	large dword_4F164
		push	large [bp+var_14]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_76], eax
		cmp	[bp+var_76], 19h
		jg	short loc_1F054
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2
		pop	di
		pop	si
		leave
		retf
		jmp	loc_1F243

loc_1F054:
		cmp	[bp+var_76], 133h
		jle	short loc_1F061
		jmp	loc_1F243

loc_1F061:
		cmp	[bp+var_7], 0
		jz	short loc_1F06B
		pop	di
		pop	si
		leave
		retf

loc_1F06B:
		mov	eax, [bp+var_6]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_82]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_8A], eax
		mov	ax, word_4F160
		mov	[bp+var_8C], ax
		push	large [bp+var_8A]
		push	large dword_4F164
		push	large [bp+var_86]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_94], eax
		movsx	eax, [bp+var_8C]
		shl	eax, 8
		mov	edx, [bp+var_94]
		add	edx, eax
		mov	[bp+var_98], edx
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		sar	eax, 8
		mov	[bp+var_A0], eax
		cmp	[bp+var_A0], 7D00h
		jle	short loc_1F10F
		mov	[bp+var_A0], 7D00h
		jmp	short loc_1F125

loc_1F10F:
		cmp	[bp+var_A0], 0FFFF8300h
		jge	short loc_1F125
		mov	[bp+var_A0], 0FFFF8300h
		jmp	short loc_1F125

loc_1F125:
		mov	ax, word ptr [bp+var_A0]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], ax
		mov	eax, [bp+var_DE]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_A8], eax
		mov	ax, word_4F162
		mov	[bp+var_AA], ax
		push	large [bp+var_A8]
		push	large dword_4F168
		push	large [bp+var_A4]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		movsx	eax, [bp+var_AA]
		shl	eax, 8
		sub	eax, [bp+var_B2]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_BA]
		sar	eax, 8
		mov	[bp+var_BE], eax
		cmp	[bp+var_BE], 7D00h
		jle	short loc_1F1BB
		mov	[bp+var_BE], 7D00h
		jmp	short loc_1F1D1

loc_1F1BB:
		cmp	[bp+var_BE], 0FFFF8300h
		jge	short loc_1F1D1
		mov	[bp+var_BE], 0FFFF8300h
		jmp	short loc_1F1D1

loc_1F1D1:
		mov	ax, word ptr [bp+var_BE]
		les	bx, [bp+arg_0]
		mov	es:[bx+21h], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+7Bh]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], al
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 18h
		mov	word ptr [bp+var_C2+2], ax
		mov	word ptr [bp+var_C2], dx
		cmp	[bp+var_C2], 0
		jz	short loc_1F22E
		mov	ax, word_4F26E
		inc	ax
		shl	ax, 2
		cmp	ax, word_4F27A
		ja	short loc_1F22C
		les	bx, word_4F27C
		mov	eax, [bp+var_C2]
		mov	es:[bx], eax
		add	word_4F27C, 4
		inc	word_4F26E
		jmp	short loc_1F22C

loc_1F22C:
		jmp	short loc_1F22E

loc_1F22E:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 1
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2
		pop	di
		pop	si
		leave
		retf

loc_1F243:
		mov	eax, dword_4F304
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		shl	eax, 8
		sub	eax, [bp+var_14]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_6A]
		jge	short loc_1F272
		mov	ax, 1
		jmp	short loc_1F274

loc_1F272:
		xor	ax, ax

loc_1F274:
		or	al, al
		jz	short loc_1F2A8
		mov	eax, dword_4C156
		add	eax, [bp+var_14]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_72]
		jle	short loc_1F29B
		mov	ax, 1
		jmp	short loc_1F29D

loc_1F29B:
		xor	ax, ax

loc_1F29D:
		or	al, al
		jz	short loc_1F2A8
		mov	byte_4C120, 1
		jmp	short loc_1F2AD

loc_1F2A8:
		mov	byte_4C120, 0

loc_1F2AD:
		mov	eax, [bp+var_6]
		sar	eax, 8
		push	eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+2]
		push	cs
		call	near ptr sub_1E943
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	es:[bx+9], al
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+12h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+10h]
		push	word ptr es:[bx+0Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_28], dx
		mov	[bp+var_2A], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+9]
		mov	ah, 0
		shl	ax, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		mov	word ptr [bp+var_2E+2], ax
		mov	word ptr [bp+var_2E], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+9]
		mov	ah, 0
		shl	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+42h]
		mov	[bp+var_30], ax
		cmp	[bp+var_2E], 0
		jnz	short loc_1F33E
		jmp	loc_1F5BE

loc_1F33E:
		lea	ax, word ptr [bp+var_146]
		push	ax
		call	Damage_ComputeHelperA_29BBE
		add	sp, 2
		cmp	[bp+var_7], 0
		jz	short loc_1F392
		mov	ax, [bp+arg_0]
		add	ax, 53h
		push	[bp+arg_2]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		push	word ptr [bx+0Ch]
		push	word ptr [bx+0Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	dx
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		call	sub_29CA3
		add	sp, 0Ah
		jmp	short loc_1F3AC

loc_1F392:
		lea	ax, word ptr [bp+var_DA]
		push	ax
		push	6798h
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		call	sub_29C12
		add	sp, 8

loc_1F3AC:
		mov	eax, [bp+var_146]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		mov	eax, [bp+var_142]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	eax, [bp+var_13E]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax
		mov	eax, [bp+var_13A]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	eax, [bp+var_136]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		les	bx, [bp+arg_0]
		mov	es:[bx+33h], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		les	bx, [bp+arg_0]
		mov	es:[bx+37h], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		les	bx, [bp+arg_0]
		mov	es:[bx+3Bh], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		les	bx, [bp+arg_0]
		mov	es:[bx+3Fh], eax
		mov	eax, [bp+var_126]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		les	bx, [bp+arg_0]
		mov	es:[bx+43h], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		les	bx, [bp+arg_0]
		mov	es:[bx+47h], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		les	bx, [bp+arg_0]
		mov	es:[bx+4Bh], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		les	bx, [bp+arg_0]
		mov	es:[bx+4Fh], eax
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, word ptr [bp+var_DA]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		push	0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		lea	ax, word ptr [bp+var_CE]
		push	ax
		call	sub_28F25
		add	sp, 2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	687Ah
		call	sub_224B0
		add	sp, 4
		xor	di, di
		jmp	loc_1F5AE

loc_1F518:
		les	bx, word ptr [bp+var_2E]
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_2A]
		add	dx, es:[bx]
		mov	word ptr [bp+var_62], ax
		mov	word ptr [bp+var_66+2], dx
		lea	ax, word ptr [bp+var_DA]
		push	ax
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	word ptr [bp+var_62]
		push	word ptr [bp+var_66+2]
		les	bx, word ptr [bp+var_66+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 8
		or	al, al
		jz	short loc_1F5A9
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	word ptr [bp+var_62]
		push	word ptr [bp+var_66+2]
		les	bx, word ptr [bp+var_66+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 6
		push	word ptr [bp+var_62]
		push	word ptr [bp+var_66+2]
		les	bx, word ptr [bp+var_66+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	word ptr [bp+var_66], dx
		mov	word ptr [bp+var_68], ax
		cmp	[bp+var_68], 0
		jz	short loc_1F5A9
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		les	bx, word_4F27C
		mov	eax, [bp+var_6C]
		mov	es:[bx], eax
		add	word_4F27C, 4
		inc	word_4F26E
		les	bx, word ptr [bp+var_68]
		mov	eax, [bp+var_C]
		add	es:[bx+2], eax

loc_1F5A9:
		inc	di
		add	word ptr [bp+var_2E], 2

loc_1F5AE:
		cmp	di, [bp+var_30]
		jge	short loc_1F5B6
		jmp	loc_1F518

loc_1F5B6:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 1

loc_1F5BE:
		jmp	short loc_1F5C9

loc_1F5C0:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+95h], 2

loc_1F5C9:
		pop	di
		pop	si
		leave
		retf
sub_1EB21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F5CD		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1F5CD		endp

; START OF FUNCTION CHUNK FOR sub_1F5CD
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1F5CD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F5D6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+2]
		push	cs
		call	near ptr sub_1EA0C
		add	sp, 4
		or	al, al
		jz	short loc_1F61D
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	word ptr es:[bx+8Ch], 0
		jz	short loc_1F61D
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+93h]
		mov	ax, es:[bx+93h]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	ax, es:[bx+8Ch]
		jl	short loc_1F61D
		mov	al, 0
		pop	bp
		retf

loc_1F61D:
		mov	al, 1
		pop	bp
		retf
sub_1F5D6		endp

; START OF FUNCTION CHUNK FOR sub_1F5D6
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1F5D6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F623		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		call	sub_48795
		add	sp, 0Ah
sub_1F623		endp

; START OF FUNCTION CHUNK FOR sub_1F623
		db 89h
		push	si
; END OF FUNCTION CHUNK FOR sub_1F623
seg051		ends
