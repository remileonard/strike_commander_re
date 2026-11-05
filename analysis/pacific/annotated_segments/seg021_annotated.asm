seg021		segment	para public 'CODE' use16
		assume cs:seg021
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0B0h, 8, 0EBh, 2

loc_A404:
		db 8Ah, 0C1h

loc_A406:
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A408		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_A408		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A40D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9]
		mov	ax, es:[bx+7]
		pop	bp
		retf
sub_A40D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A41D		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [si+4]
		mov	[bp+var_10], eax
		mov	si, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_1C], eax
		mov	eax, [si+4]
		mov	[bp+var_18], eax
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Math_ArcTan2_56937
		add	sp, 8
		mov	eax, [bp+var_20]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+var_14+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_A4A1
		mov	ax, word ptr [bp+var_10+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_A497
		sub	[bp+var_4], 0B400h

loc_A495:
		jmp	short loc_A4A1

loc_A497:
		add	[bp+var_4], 0B400h
		jmp	short loc_A495

loc_A4A1:
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_ArcTan2_56937
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_1C+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_A4E6
		mov	ax, word ptr [bp+var_18+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_A4DC
		sub	[bp+var_8], 0B400h

loc_A4DA:
		jmp	short loc_A4E6

loc_A4DC:
		add	[bp+var_8], 0B400h
		jmp	short loc_A4DA

loc_A4E6:
		mov	eax, [bp+var_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0B400h
		jle	short loc_A506
		sub	[bp+var_C], 16800h
		jmp	short loc_A51A

loc_A506:
		cmp	[bp+var_C], 0FFFF4C00h
		jge	short loc_A51A
		add	[bp+var_C], 16800h
		jmp	short loc_A51A

loc_A51A:
		mov	ax, word ptr [bp+var_C+1]
		pop	si
		leave
		retf
sub_A41D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Vec_NegateSwapPair
; (sub_50AD de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,46L — échange/négate conditionnellement une paire de dwords (vecteur 2D ou nombre
; complexe) selon flag : inversion de direction.
; ==============================================================================================
Vec_NegateSwapPair		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_4], eax
		cmp	[bp+arg_2], 0
		jz	short loc_A550
		mov	eax, [si+4]
		mov	[si], eax
		add	si, 4
		mov	eax, [bp+var_4]
		neg	eax
		mov	[si], eax
		jmp	short loc_A56E

loc_A550:
		mov	di, si
		mov	ax, si
		add	ax, 4
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		neg	eax
		mov	[di], eax
		mov	eax, [bp+var_4]
		mov	[si+4], eax

loc_A56E:
		pop	di
		pop	si
		leave
		retf
Vec_NegateSwapPair		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A572		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	sub_5711C
		add	sp, 6
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_A572		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A58C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	word_7CADA, 0
		jz	short loc_A626
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+6Dh], 0
		jz	short loc_A612
		add	ax, 6Fh
		push	dx
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		call	sub_750CF
		add	sp, 6
		push	1
		push	9
		push	word_7CADA
		push	large [bp+arg_0]
		call	sub_EA0E
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0DFh
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		push	word ptr [bx+73h]
		push	bx
		call	sub_553B6
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+92h], 20h
		jmp	short loc_A626

loc_A612:
		push	1
		push	0Ah
		push	word_7CADA
		push	large [bp+arg_0]
		call	sub_EA0E
		add	sp, 0Ah

loc_A626:
		leave
		retf
sub_A58C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A628		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	large [bp+arg_0]
		call	sub_9578
		add	sp, 4
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0E2h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		add	eax, dword_7976E
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0E2h], eax
		cmp	byte ptr es:[bx+0DEh], 0
		jz	short loc_A6A7
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		movzx	edx, byte ptr es:[bx+0E6h]
		test	edx, eax
		jnz	short loc_A696
		mov	ax, 1
		jmp	short loc_A698

loc_A696:
		xor	ax, ax

loc_A698:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0DEh], al
		mov	es:[bx+0DFh], al
		jmp	short loc_A6A7

loc_A6A7:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0E0h], 0
		jz	short loc_A6E4
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		mov	dl, es:[bx+0E6h]
		mov	dh, 0
		sar	dx, 1
		movsx	edx, dx
		test	edx, eax
		jnz	short loc_A6D3
		mov	ax, 1
		jmp	short loc_A6D5

loc_A6D3:
		xor	ax, ax

loc_A6D5:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0E0h], al
		mov	es:[bx+0E1h], al
		jmp	short loc_A6E4

loc_A6E4:
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+7]
		call	sub_116E0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+161h], 0
		jz	short loc_A740
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_A740
		push	large [bp+arg_0]
		call	sub_FA7E
		jmp	short loc_A749

loc_A740:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_A783

loc_A749:
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	al, 0
		mov	es:[bx+160h], al
		mov	es:[bx+1FAh], al
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+85h], 0FFh
		jz	short loc_A76B
		mov	ax, 1
		jmp	short loc_A76D

loc_A76B:
		xor	ax, ax

loc_A76D:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A77F
		push	large [bp+arg_0]
		call	sub_9890
		add	sp, 4

loc_A77F:
		mov	al, 1
		leave
		retf
sub_A628		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A783		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A7AE
		push	large [bp+arg_0]
		call	sub_B0C4
		add	sp, 4
		jmp	short loc_A7D9

loc_A7AE:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_A7D9
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4
		mov	[bp+var_1], 0
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bp+var_1]
		mov	[bx+20h], al

loc_A7D9:
		leave
		retf
sub_A783		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7DB		proc far

var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	cx, [bp+arg_8]
		xor	eax, eax
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		or	cx, cx
		jnz	short loc_A7FB
		jmp	loc_A8C2

loc_A7FB:
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx+0D6h], 0
		jnz	short loc_A80A
		jmp	loc_A8C2

loc_A80A:
		les	bx, es:[bx+0D6h]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, bx, 13h
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		cmp	[bp+var_4], 0
		jnz	short loc_A82F
		jmp	loc_A8C2

loc_A82F:
		mov	[bp+var_6], cx
		mov	[bp+var_A], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_A86D
		push	0
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	word ptr es:[bx+0Dh]
		push	[bp+var_6]
		push	large es:[bx]
		push	ss
		lea	ax, word ptr [bp+var_22]
		push	ax
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 10h
		mov	dx, ss
		lea	ax, word ptr [bp+var_22]
		jmp	short loc_A88A

loc_A86D:
		mov	eax, dword_79CD4
		mov	[bp+var_22], eax
		mov	eax, dword_79CD8
		mov	[bp+var_1E], eax
		mov	eax, dword_79CDC
		mov	[bp+var_1A], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_22]

loc_A88A:
		mov	eax, [bp+var_22]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_E], eax
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_5A629
		add	sp, 4

loc_A8C2:
		mov	eax, [bp+var_16]
		or	eax, [bp+var_12]
		or	eax, [bp+var_E]
		jnz	short loc_A8D5
		mov	ax, 1
		jmp	short loc_A8D7

loc_A8D5:
		xor	ax, ax

loc_A8D7:
		or	al, al
		jz	short loc_A8F3
		mov	eax, dword_7C81D
		mov	[bp+var_16], eax
		mov	eax, dword_7C821
		mov	[bp+var_12], eax
		mov	eax, dword_7C825
		mov	[bp+var_E], eax

loc_A8F3:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_A8FE
		mov	ax, si
		jmp	short loc_A908

loc_A8FE:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_A908:
		or	ax, ax
		jz	short loc_A927
		mov	eax, [bp+var_16]
		mov	[si], eax
		mov	eax, [bp+var_12]
		mov	[si+4], eax
		mov	eax, [bp+var_E]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_A929

loc_A927:
		mov	ax, si

loc_A929:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_A7DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A932		proc far

var_32		= word ptr -32h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		lea	ax, [bp+var_32]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	60E1h
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_6]
		or	eax, eax
		jge	short loc_A976
		neg	eax

loc_A976:
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		mov	ax, word ptr [bp+var_E+1]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B9h]
		cbw
		mov	bx, 3
		cwd
		idiv	bx
		cmp	ax, [bp+var_2]
		jle	short loc_AA05
		mov	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	60E1h
		call	Vector_Normalize3D_57796
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_26], eax
		mov	eax, [si+4]
		mov	[bp+var_22], eax
		mov	eax, [si+8]
		mov	[bp+var_1E], eax
		lea	ax, [bp+var_32]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, [bp+var_32]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	al, 1
		jmp	short loc_AA07

loc_AA05:
		mov	al, 0

loc_AA07:
		pop	si
		leave
		retf
sub_A932		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA0A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_AA0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA0F		proc far

var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5
		jge	short loc_AA2B
		mov	al, 1
		jmp	loc_AB26

loc_AA2B:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+arg_4], eax
		mov	eax, [si+4]
		sub	[bp+arg_8], eax
		mov	eax, [si+8]
		sub	[bp+arg_C], eax
		cmp	[bp+arg_8], 0
		jl	short loc_AA67
		mov	ax, 1
		jmp	short loc_AA69

loc_AA67:
		xor	ax, ax

loc_AA69:
		or	al, al
		jz	short loc_AA84
		mov	eax, [bp+arg_4]
		mov	dword_7C811, eax
		mov	eax, [bp+arg_8]
		mov	dword_7C815, eax
		mov	eax, [bp+arg_C]
		jmp	loc_AB20

loc_AA84:
		cmp	[bp+arg_4], 0
		jl	short loc_AA90
		mov	ax, 1
		jmp	short loc_AA92

loc_AA90:
		xor	ax, ax

loc_AA92:
		or	al, al
		jz	short loc_AADC
		mov	[bp+var_6], 100h
		mov	eax, [bp+var_6]
		mov	[bp+var_26], eax
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	[bp+var_22], eax
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_26]
		mov	dword_7C811, eax
		mov	eax, [bp+var_22]
		mov	dword_7C815, eax
		mov	eax, [bp+var_1E]
		jmp	short loc_AB20

loc_AADC:
		mov	[bp+var_12], 0FFFFFF00h
		mov	eax, [bp+var_12]
		mov	[bp+var_32], eax
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_2E], eax
		mov	[bp+var_1A], 0
		mov	eax, [bp+var_1A]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_32]
		mov	dword_7C811, eax
		mov	eax, [bp+var_2E]
		mov	dword_7C815, eax
		mov	eax, [bp+var_2A]

loc_AB20:
		mov	dword_7C819, eax
		mov	al, 0

loc_AB26:
		pop	si
		leave
		retf
sub_AA0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB29		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_8], 0
		jl	short loc_AB38
		mov	ax, 1
		jmp	short loc_AB3A

loc_AB38:
		xor	ax, ax

loc_AB3A:
		or	al, al
		jz	short loc_AB7D
		sub	sp, 4
		mov	eax, [bp+arg_14]
		mov	[bp+var_4], eax
		sub	sp, 4
		mov	eax, [bp+arg_10]
		mov	[bp+var_8], eax
		sub	sp, 0Ch
		mov	eax, [bp+arg_4]
		mov	[bp+var_14], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_C], eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_ABA8
		add	sp, 18h
		jmp	short loc_ABA6

loc_AB7D:
		sub	sp, 0Ch
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_4], eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_ADA8
		add	sp, 10h
		mov	al, 0

loc_ABA6:
		pop	bp
		retf
sub_AB29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ABA8		proc far

var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 50h
		cmp	word_7C7D3, 5
		jge	short loc_ABBA
		mov	al, 1
		jmp	loc_ADA6

loc_ABBA:
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+arg_C], eax
		lea	ax, [bp+arg_4]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, word_7C7D3
		mov	word_7C835, ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	al, 0
		jmp	loc_ADA6
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		xor	al, 1
		and	ax, 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		mov	word_7C82F, 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		xor	al, 1
		and	ax, 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		jmp	loc_ACE3
		lea	ax, [bp+var_8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	eax, [bp+var_24]
		mov	[bp+var_18], eax
		cmp	[bp+var_4], 0
		jge	short loc_AC82
		mov	ax, 1
		jmp	short loc_AC84

loc_AC82:
		xor	ax, ax

loc_AC84:
		or	al, al
		jz	short loc_AC9A
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_14], eax
		jmp	short loc_ACD7

loc_AC9A:
		mov	eax, [bp+var_14]
		or	eax, eax
		jge	short loc_ACA6
		neg	eax

loc_ACA6:
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		cmp	[bp+var_30], 0F00h
		jle	short loc_ACC1
		mov	ax, 1
		jmp	short loc_ACC3

loc_ACC1:
		xor	ax, ax

loc_ACC3:
		or	al, al
		jz	short loc_ACD7
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_18], eax

loc_ACD7:
		mov	ax, word ptr [bp+var_18+1]
		mov	word_7C82F, ax
		mov	ax, word ptr [bp+var_14+1]
		mov	word_7C833, ax

loc_ACE3:
		mov	eax, [bp+var_14]
		or	eax, eax
		jge	short loc_ACEF
		neg	eax

loc_ACEF:
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		cmp	[bp+var_3C], 700h
		jge	short loc_AD0A
		mov	ax, 1
		jmp	short loc_AD0C

loc_AD0A:
		xor	ax, ax

loc_AD0C:
		or	al, al
		jz	short loc_AD2F
		mov	eax, [bp+var_14]
		shl	eax, 1
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	ax, word ptr [bp+var_44+1]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], ax
		jmp	short loc_AD3C

loc_AD2F:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0

loc_AD3C:
		push	large 0
		push	large [bp+var_C]
		push	large [bp+var_10]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		cmp	eax, [bp+arg_10]
		jge	short loc_AD66
		mov	ax, 1
		jmp	short loc_AD68

loc_AD66:
		xor	ax, ax

loc_AD68:
		or	al, al
		jz	short loc_ADA4
		mov	word_7C833, 0
		mov	word_7C82F, 0
		mov	ax, word_7C831
		mov	[bp+var_4E], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_50], ax
		movsx	eax, [bp+var_50]
		shl	eax, 8
		cmp	eax, [bp+arg_14]
		jg	short loc_AD9A
		mov	ax, 1
		jmp	short loc_AD9C

loc_AD9A:
		xor	ax, ax

loc_AD9C:
		or	al, al
		jz	short loc_ADA4
		mov	al, 1
		jmp	short loc_ADA6

loc_ADA4:
		mov	al, 0

loc_ADA6:
		leave
		retf
sub_ABA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADA8		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		cmp	word_7C7D3, 5
		jge	short loc_ADBA
		mov	al, 1
		jmp	loc_AE58

loc_ADBA:
		mov	ax, word_7C7D3
		mov	word_7C835, ax
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+arg_C], eax
		lea	ax, word ptr [bp+arg_4]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	al, 0
		jmp	short loc_AE58
		xor	ax, ax
		or	al, al
		jz	short loc_AE2E
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		cmp	[bp+arg_4], 0
		jle	short loc_AE0C
		mov	ax, 1
		jmp	short loc_AE0E

loc_AE0C:
		xor	ax, ax

loc_AE0E:
		or	al, al
		jz	short loc_AE20
		mov	word_7C833, 50h
		mov	word_7C82F, 14h
		jmp	short loc_AE56

loc_AE20:
		mov	word_7C833, 0FFB0h
		mov	word_7C82F, 14h
		jmp	short loc_AE56

loc_AE2E:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	word_7C82F, 3
		jmp	short loc_AE56
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	word_7C82F, 14h

loc_AE56:
		mov	al, 0

loc_AE58:
		leave
		retf
sub_ADA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE5A		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		cmp	[bp+arg_4], 0B400h
		jle	short loc_AE74
		sub	[bp+arg_4], 16800h
		jmp	short loc_AE88

loc_AE74:
		cmp	[bp+arg_4], 0FFFF4C00h
		jge	short loc_AE88
		add	[bp+arg_4], 16800h
		jmp	short loc_AE88

loc_AE88:
		sub	[bp+arg_4], 100h
		mov	dl, 0
		cmp	[bp+arg_4], 1000h
		jle	short loc_AEA1
		mov	ax, 1
		jmp	short loc_AEA3

loc_AEA1:
		xor	ax, ax

loc_AEA3:
		or	al, al
		jz	short loc_AEB9
		mov	[bp+var_8], 1000h
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_AF25

loc_AEB9:
		cmp	[bp+arg_4], 0FFFFF000h
		jge	short loc_AEC8
		mov	ax, 1
		jmp	short loc_AECA

loc_AEC8:
		xor	ax, ax

loc_AECA:
		or	al, al
		jz	short loc_AEE0
		mov	[bp+var_C], 0FFFFF000h
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_AF25

loc_AEE0:
		cmp	[bp+arg_4], 0
		jle	short loc_AEEC
		mov	ax, 1
		jmp	short loc_AEEE

loc_AEEC:
		xor	ax, ax

loc_AEEE:
		or	al, al
		jz	short loc_AF1B
		cmp	[bp+arg_4], 500h
		jge	short loc_AF01
		mov	ax, 1
		jmp	short loc_AF03

loc_AF01:
		xor	ax, ax

loc_AF03:
		or	al, al
		jz	short loc_AF1B
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		mov	dl, 1
		jmp	short loc_AF25

loc_AF1B:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	dl, 1

loc_AF25:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	ax, word ptr [bp+var_4+1]
		mov	es:[bx+1Fh], ax
		mov	al, dl
		leave
		retf
sub_AE5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF37		proc far

var_52		= dword ptr -52h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		mov	eax, [bp+arg_4]
		mov	[bp+var_34], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_30], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_2C], eax
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_34], eax
		mov	eax, [si+4]
		sub	[bp+var_30], eax
		mov	eax, [si+8]
		sub	[bp+var_2C], eax
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_30]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		push	ss
		lea	ax, word ptr [bp+var_4C]
		push	ax
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_4C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_38], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_3C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		add	eax, [bp+var_18]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_10]
		jge	short loc_B077
		mov	ax, 1
		jmp	short loc_B079

loc_B077:
		xor	ax, ax

loc_B079:
		or	al, al
		jz	short loc_B090
		mov	eax, [bp+var_14]
		neg	eax
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	[bp+var_14], eax

loc_B090:
		sub	sp, 4
		mov	eax, [bp+var_14]
		mov	[bp+var_52], eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_AE5A
		add	sp, 8
		mov	eax, [bp+var_14]
		cmp	eax, [bp+arg_10]
		jge	short loc_B0B5
		mov	ax, 1
		jmp	short loc_B0B7

loc_B0B5:
		xor	ax, ax

loc_B0B7:
		or	al, al
		jz	short loc_B0BF
		mov	al, 1
		jmp	short loc_B0C1
sub_AF37		endp

; START OF FUNCTION CHUNK FOR sub_AF37

loc_B0BF:
		db 0B0h
; END OF FUNCTION CHUNK FOR sub_AF37
seg021		ends
