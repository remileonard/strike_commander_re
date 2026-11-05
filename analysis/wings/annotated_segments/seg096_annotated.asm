seg096		segment	para public 'CODE' use16
		assume cs:seg096
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Eh, 0, 0, 0, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41F07		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_41F24
		push	72h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_41F24
		jmp	loc_420E0

loc_41F24:
		push	large 20018h
		push	si
		call	sub_40CF3
		add	sp, 6
		mov	word ptr [si], 3AAFh
		mov	ax, si
		add	ax, 71h
		push	ax
		nop
		push	cs
		call	near ptr sub_426F8
		pop	cx
		push	large 280000h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5A0001h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5A0002h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5A0003h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5A0004h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5A0005h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 410006h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 460007h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 500008h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 0FA0009h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 19000Ah
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 64000Bh
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5A000Ch
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 0F000Dh
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5F000Eh
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 5F000Fh
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 0F0010h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 7D0011h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 7D0012h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 190013h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 320014h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 190015h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 460016h
		push	si
		call	sub_40E22
		add	sp, 6
		push	large 320017h
		push	si
		call	sub_40E22
		add	sp, 6
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_40F73
		add	sp, 8
		or	al, al
		jz	short loc_420D7
		xor	di, di
		jmp	short loc_420D0

loc_420C5:
		push	di
		push	si
		call	sub_4137E
		add	sp, 4
		inc	di

loc_420D0:
		cmp	di, 18h
		jl	short loc_420C5
		jmp	short loc_420E0

loc_420D7:
		push	3A8Eh
		call	sub_9D78
		pop	cx

loc_420E0:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_41F07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_420E6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_42121
		mov	word ptr [si], 3AAFh
		push	2
		mov	ax, si
		add	ax, 71h
		push	ax
		nop
		push	cs
		call	near ptr sub_4273D
		add	sp, 4
		push	0
		push	si
		call	sub_40E43
		add	sp, 4
		test	di, 1
		jz	short loc_42121
		push	si
		call	sub_33B
		pop	cx

loc_42121:
		pop	di
		pop	si
		pop	bp
		retf
sub_420E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42125		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 18h
		jnb	short loc_42150
		push	0
		push	[bp+arg_4]
		mov	ax, dx
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		push	word ptr [bx+2]
		push	dx
		push	si
		call	sub_4163D
		add	sp, 0Ah

loc_42150:
		pop	si
		pop	bp
		retf
sub_42125		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42153		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	di, 18h
		jnb	short loc_421CF
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		mov	dx, [bp+arg_8]
		cmp	[bp+arg_4], 0
		jz	short loc_421BF
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		push	word ptr [bx+2]
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_42666
		add	sp, 6
		mov	[bp+var_2], ax
		push	[bp+arg_8]
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_4255B
		add	sp, 6
		mov	dx, ax

loc_421BF:
		push	0
		push	dx
		push	[bp+var_2]
		push	di
		push	si
		call	sub_4163D
		add	sp, 0Ah

loc_421CF:
		pop	di
		pop	si
		leave
		retf
sub_42153		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_421D3		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 18h
		jb	short loc_421E7
		jmp	loc_422D3

loc_421E7:
		cmp	word_601D7, 0
		jz	short loc_42228
		mov	di, word_601D7
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [di+4]
		mov	[bp+var_1C], eax
		mov	eax, [di+8]
		mov	[bp+var_18], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		sub	[bp+var_20], eax
		mov	eax, [di+4]
		sub	[bp+var_1C], eax
		mov	eax, [di+8]
		sub	[bp+var_18], eax
		jmp	short loc_42237

loc_42228:
		xor	eax, eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax

loc_42237:
		push	large [bp+var_18]
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		push	word ptr [bx+2]
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_42666
		add	sp, 6
		mov	[bp+var_E], ax
		push	[bp+arg_8]
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_4255B
		add	sp, 6
		mov	[bp+var_10], ax
		push	[bp+arg_6]
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_42411
		add	sp, 6
		mov	di, ax
		cmp	di, 0D4EFh
		jle	short loc_422D3
		push	0
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+arg_2]
		push	si
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_14], eax
		mov	ax, di
		add	ax, 2B11h
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	si
		call	sub_41BAA
		add	sp, 6

loc_422D3:
		pop	di
		pop	si
		leave
		retf
sub_421D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_422D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_603B2, 0
		jz	short loc_4234A
		cmp	byte_603B3, 0
		jz	short loc_4234A
		nop
		push	cs
		call	near ptr sub_427A8
		push	large 0FFh
		mov	ax, word_603E4
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		push	word ptr [bx+2]
		push	word_603E4
		push	si
		call	sub_4180F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	dword_603EA, eax
		cmp	byte_5D7AC, 1
		jbe	short loc_4234A
		push	large 0FFh
		mov	ax, word_603E6
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		push	word ptr [bx+2]
		push	word_603E6
		push	si
		call	sub_4180F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	dword_603EE, eax

loc_4234A:
		pop	si
		pop	bp
		retf
sub_422D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4234D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_427B2
		cmp	dword_603EA, 0
		jz	short loc_42378
		push	large dword_603EA
		push	si
		call	sub_41997
		add	sp, 6
		mov	dword_603EA, 0

loc_42378:
		cmp	dword_603EE, 0
		jz	short loc_42397
		push	large dword_603EE
		push	si
		call	sub_41997
		add	sp, 6
		mov	dword_603EE, 0

loc_42397:
		pop	si
		pop	bp
		retf
sub_4234D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4239A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_427C1
		pop	cx
		pop	bp
		retf
sub_4239A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_423AB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_4281D
		pop	cx
		pop	bp
		retf
sub_423AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_423BC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_423BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_423C4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_603B2, 0
		jz	short loc_42406
		cmp	byte_5D7A8, 1
		jnz	short loc_423E5
		nop
		push	cs
		call	near ptr sub_427BC

loc_423DE:
		push	si
		push	cs
		call	near ptr sub_423BC
		jmp	short loc_423FE

loc_423E5:
		cmp	byte_5D7AC, 0
		jbe	short loc_423F9
		nop
		push	cs
		call	near ptr sub_427BC
		push	si
		push	cs
		call	near ptr sub_422D7
		pop	cx
		jmp	short loc_423DE

loc_423F9:
		push	si
		push	cs
		call	near ptr sub_4234D

loc_423FE:
		pop	cx
		push	si
		call	sub_41CB3
		pop	cx

loc_42406:
		pop	si
		pop	bp
		retf
sub_423C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42409		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_42409		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42411		proc far

var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 56h
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	large [si+8]
		push	large [si+4]
		push	large [si]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	[bp+var_46], eax
		mov	eax, [di+8]
		mov	[bp+var_42], eax
		mov	eax, dword_600D0
		sub	[bp+var_4A], eax
		mov	eax, dword_600D4
		sub	[bp+var_46], eax
		mov	eax, dword_600D8
		sub	[bp+var_42], eax
		cmp	[bp+var_4], 0
		jz	short loc_424F4
		push	si
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_56]
		push	ax
		call	Targeting_ComputeGeometryHelperB_39921
		add	sp, 8
		mov	eax, [bp+var_56]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_42], eax
		push	eax
		push	large [bp+var_46]
		push	large [bp+var_4A]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	[bp+var_8], eax
		push	si
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	Targeting_ComputeBearingElevation_3A2BC
		add	sp, 8
		cmp	[bp+var_36], 5A00h
		jle	short loc_42523
		mov	eax, [bp+var_8]
		neg	eax
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		jmp	short loc_4251F

loc_424F4:
		push	large [bp+var_42]
		push	large [bp+var_46]
		push	large [bp+var_4A]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		neg	eax
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax

loc_4251F:
		mov	[bp+var_8], eax

loc_42523:
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, dword_5C5C4
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		imul	eax, eax, 2B11h
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	ax, word ptr [bp+var_32+1]
		mov	[bp+var_2A], ax
		pop	di
		pop	si
		leave
		retf
sub_42411		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4255B		proc far

var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= dword ptr -36h
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
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_A], 40h
		mov	[bp+var_E], 100h
		mov	eax, [bp+var_A]
		sub	[bp+var_E], eax
		cmp	dword ptr [si], 0A00h
		jge	short loc_4259C
		mov	[bp+var_12], 100h
		mov	eax, [bp+var_12]

loc_42595:
		mov	[bp+var_4], eax
		jmp	loc_4263E

loc_4259C:
		cmp	dword ptr [si], 138800h
		jle	short loc_425B3
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		jmp	short loc_42595

loc_425B3:
		cmp	dword ptr [si], 1F400h
		jge	short loc_42602
		mov	eax, 1F400h
		sub	eax, [si]
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	ebx, 1EAh
		cdq
		idiv	ebx
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_A]
		add	[bp+var_4], eax
		jmp	short loc_4263E

loc_42602:
		mov	eax, 138800h
		sub	eax, [si]
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		mov	ebx, 1194h
		cdq
		idiv	ebx
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax

loc_4263E:
		mov	ax, [bp+arg_4]
		mov	[bp+var_38], ax
		movsx	eax, [bp+var_38]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_3C], edx
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	ax, word ptr [bp+var_40+1]
		mov	[bp+var_6], ax
		pop	si
		leave
		retf
sub_4255B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42666		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 3200h
		jge	short loc_4268C
		mov	[bp+var_A], 200h
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax

loc_4268C:
		cmp	dword ptr [si], 138800h
		jle	short loc_426A3
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		jmp	short loc_426CC

loc_426A3:
		mov	[bp+var_12], 6400h
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax

loc_426CC:
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_20], edx
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	ax, word ptr [bp+var_24+1]
		mov	[bp+var_6], ax
		pop	si
		leave
		retf
sub_42666		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_426F8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_42710
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_42739

loc_42710:
		mov	byte_5D7A8, 0
		mov	dword_603EA, 0
		mov	dword_603EE, 0
		mov	word_603E4, 19h
		mov	word_603E6, 19h
		mov	word_5D7A9, 0

loc_42739:
		mov	ax, dx
		pop	bp
		retf
sub_426F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4273D		proc far

var_4		= word ptr -4
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
		or	si, si
		jz	short loc_427A4
		cmp	word_5D7A9, 0
		jz	short loc_42797
		mov	ax, word_5D7A9
		mov	[bp+var_2], ax
		mov	bx, word_5D7A9
		jmp	short loc_4278B

loc_42762:
		cmp	[bp+var_2], 0
		jz	short loc_4277C
		push	[bp+var_2]
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	[bp+var_2]
		call	sub_33B
		pop	cx
		jmp	short loc_4277C

loc_4277C:
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_42791
		mov	bx, [bp+var_2]

loc_4278B:
		mov	ax, [bx+2]
		mov	[bp+var_4], ax

loc_42791:
		cmp	[bp+var_2], 0
		jnz	short loc_42762

loc_42797:
		test	di, 1
		jz	short loc_427A4
		push	si
		call	sub_33B
		pop	cx

loc_427A4:
		pop	di
		pop	si
		leave
		retf
sub_4273D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_427A8		proc far
		push	bp
		mov	bp, sp
		mov	byte_5D7A8, 1
		pop	bp
		retf
sub_427A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_427B2		proc far
		push	bp
		mov	bp, sp
		mov	byte_5D7A8, 0
		pop	bp
		retf
sub_427B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_427BC		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_427BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_427C1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_427DD
		mov	word ptr [si], 0
		jmp	short loc_427DF

loc_427DD:
		mov	ax, si

loc_427DF:
		mov	di, ax
		mov	word ptr [di+2], 0
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		push	ax
		push	di
		call	SetReference16
		add	sp, 4
		cmp	word_5D7A9, 0
		jnz	short loc_42803
		mov	word_5D7A9, di
		jmp	short loc_42815

loc_42803:
		mov	si, word_5D7A9
		jmp	short loc_4280C

loc_42809:
		mov	si, [si+2]

loc_4280C:
		cmp	word ptr [si+2], 0
		jnz	short loc_42809
		mov	[si+2], di

loc_42815:
		inc	byte_5D7AC
		pop	di
		pop	si
		leave
		retf
sub_427C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4281D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		cmp	word_5D7A9, 0
		jz	short loc_42885
		mov	si, word_5D7A9
		xor	di, di
		jmp	short loc_42839

loc_42834:
		mov	di, si
		mov	si, [si+2]

loc_42839:
		cmp	word ptr [si+2], 0
		jz	short loc_42843
		cmp	[si], dx
		jnz	short loc_42834

loc_42843:
		cmp	[si], dx
		jnz	short loc_42885
		or	di, di
		jz	short loc_42867
		mov	ax, [si+2]
		mov	[di+2], ax
		or	si, si
		jz	short loc_42865
		push	si
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_42881

loc_42865:
		jmp	short loc_42881

loc_42867:
		or	si, si
		jz	short loc_4287B
		push	si
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_4287B

loc_4287B:
		mov	word_5D7A9, 0

loc_42881:
		dec	byte_5D7AC

loc_42885:
		pop	di
		pop	si
		pop	bp
		retf
sub_4281D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42889		proc far
		push	bp
		mov	bp, sp
		push	seg seg096
		push	offset sub_428C0
		push	large 10002h
		push	0Ch
		push	66D4h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg096
		push	offset sub_428C0
		push	large 10002h
		push	0Ch
		push	66ECh
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		pop	bp
		retf
sub_42889		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_428C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_428D8
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_428E2

loc_428D8:
		mov	ax, dx
		add	ax, 4
		mov	ax, dx
sub_428C0		endp

; START OF FUNCTION CHUNK FOR sub_428C0
		db 5
; END OF FUNCTION CHUNK FOR sub_428C0
seg096		ends
