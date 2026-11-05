ovr378		segment	para public 'OVERLAY' use16
		assume cs:ovr378
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1570		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	si, [bp+arg_4]
		mov	ax, [di]
		cmp	ax, [si+18h]
		jl	short loc_D158C
		cmp	ax, [si+1Ch]
		jg	short loc_D158C
		jmp	short loc_D159B

loc_D158C:
		mov	ax, [di]
		cmp	ax, [si+18h]
		jge	short loc_D1598
		mov	ax, [si+18h]
		jmp	short loc_D159B

loc_D1598:
		mov	ax, [si+1Ch]

loc_D159B:
		mov	bx, dx
		mov	[bx], ax
		mov	ax, [di+2]
		cmp	ax, [si+1Ah]
		jl	short loc_D15AE
		cmp	ax, [si+1Eh]
		jg	short loc_D15AE
		jmp	short loc_D15BE

loc_D15AE:
		mov	ax, [di+2]
		cmp	ax, [si+1Ah]
		jge	short loc_D15BB
		mov	ax, [si+1Ah]
		jmp	short loc_D15BE

loc_D15BB:
		mov	ax, [si+1Eh]

loc_D15BE:
		mov	bx, dx
		mov	[bx+2], ax
		mov	ax, [di+4]
		cmp	ax, [si+1Ch]
		jl	short loc_D15D2
		cmp	ax, [si+1Ch]
		jg	short loc_D15D2
		jmp	short loc_D15E2

loc_D15D2:
		mov	ax, [di+4]
		cmp	ax, [si+18h]
		jge	short loc_D15DF
		mov	ax, [si+18h]
		jmp	short loc_D15E2

loc_D15DF:
		mov	ax, [si+1Ch]

loc_D15E2:
		mov	bx, dx
		mov	[bx+4], ax
		mov	ax, [di+6]
		cmp	ax, [si+1Ah]
		jl	short loc_D15F6
		cmp	ax, [si+1Eh]
		jg	short loc_D15F6
		jmp	short loc_D1606

loc_D15F6:
		mov	ax, [di+6]
		cmp	ax, [si+1Ah]
		jge	short loc_D1603
		mov	ax, [si+1Ah]
		jmp	short loc_D1606

loc_D1603:
		mov	ax, [si+1Eh]

loc_D1606:
		mov	bx, dx
		mov	[bx+6], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_D1570		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D160F		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
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
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= byte ptr  18h
arg_14		= byte ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	cx, [bp+arg_E]
		mov	si, [bp+arg_10]
		mov	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	ax, [si+1Ah]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_A]
		sub	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	bx, ax
		mov	ax, [bp+arg_C]
		sub	ax, [bp+arg_8]
		mov	[bp+var_10], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		cmp	bx, dx
		jge	short loc_D1650
		jmp	loc_D1742

loc_D1650:
		shl	ax, 1
		mov	[bp+var_8], ax
		sub	ax, bx
		mov	[bp+var_6], ax
		sub	ax, bx
		mov	[bp+var_A], ax
		movsx	eax, cx
		mov	dx, [bp+arg_A]
		sub	dx, [bp+arg_6]
		movsx	edx, dx
		imul	eax, edx
		sar	eax, 0Ch
		mov	dx, [bp+arg_6]
		add	dx, ax
		mov	[bp+var_C], dx
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_8]
		jmp	loc_D170E

loc_D1686:
		mov	ax, [bp+arg_A]
		cmp	ax, [bp+arg_6]
		jle	short loc_D1691
		inc	si
		jmp	short loc_D1692

loc_D1691:
		dec	si

loc_D1692:
		cmp	[bp+var_6], 0
		jge	short loc_D169D
		mov	ax, [bp+var_8]
		jmp	short loc_D16AC

loc_D169D:
		mov	ax, [bp+arg_C]
		cmp	ax, [bp+arg_8]
		jle	short loc_D16A8
		inc	di
		jmp	short loc_D16A9

loc_D16A8:
		dec	di

loc_D16A9:
		mov	ax, [bp+var_A]

loc_D16AC:
		add	[bp+var_6], ax
		cmp	[bp+arg_12], 2
		jnb	short loc_D16D2
		mov	al, [bp+arg_14]
		push	ax
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		mov	ax, si
		sub	ax, [bp+var_2]
		push	ax
		push	[bp+arg_4]
		call	Render_SetPixelClipped_6A11A
		add	sp, 8
		jmp	short loc_D170E

loc_D16D2:
		mov	al, [bp+arg_12]
		mov	ah, 0
		sar	ax, 1
		mov	bl, al
		mov	al, [bp+arg_14]
		push	ax
		mov	al, bl
		mov	ah, 0
		mov	dx, di
		add	dx, ax
		sub	dx, [bp+var_4]
		push	dx
		mov	ax, si
		sub	ax, [bp+var_2]
		push	ax
		mov	al, bl
		mov	ah, 0
		mov	dx, di
		sub	dx, ax
		sub	dx, [bp+var_4]
		push	dx
		mov	ax, si
		sub	ax, [bp+var_2]
		push	ax
		push	[bp+arg_4]
		call	sub_69F22
		add	sp, 0Ch

loc_D170E:
		mov	ax, si
		sub	ax, [bp+var_C]
		mov	[bp+var_12], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jle	short loc_D1722
		jmp	loc_D1686

loc_D1722:
		mov	[bp+var_1A], si
		mov	[bp+var_1C], di
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_16], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_18]
		mov	[bx], ax
		mov	ax, [bp+var_16]
		jmp	loc_D1833

loc_D1742:
		mov	ax, bx
		shl	ax, 1
		mov	[bp+var_8], ax
		sub	ax, dx
		mov	[bp+var_6], ax
		sub	ax, dx
		mov	[bp+var_A], ax
		movsx	eax, cx
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_8]
		movsx	edx, dx
		imul	eax, edx
		sar	eax, 0Ch
		mov	dx, [bp+arg_8]
		add	dx, ax
		mov	[bp+var_C], dx
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_8]
		jmp	loc_D1802

loc_D177A:
		mov	ax, [bp+arg_C]
		cmp	ax, [bp+arg_8]
		jle	short loc_D1785
		inc	di
		jmp	short loc_D1786

loc_D1785:
		dec	di

loc_D1786:
		cmp	[bp+var_6], 0
		jge	short loc_D1791
		mov	ax, [bp+var_8]
		jmp	short loc_D17A0

loc_D1791:
		mov	ax, [bp+arg_A]
		cmp	ax, [bp+arg_6]
		jle	short loc_D179C
		inc	si
		jmp	short loc_D179D

loc_D179C:
		dec	si

loc_D179D:
		mov	ax, [bp+var_A]

loc_D17A0:
		add	[bp+var_6], ax
		cmp	[bp+arg_12], 2
		jnb	short loc_D17C6
		mov	al, [bp+arg_14]
		push	ax
		mov	ax, di
		sub	ax, [bp+var_2]
		push	ax
		mov	ax, si
		sub	ax, [bp+var_2]
		push	ax
		push	[bp+arg_4]
		call	Render_SetPixelClipped_6A11A
		add	sp, 8
		jmp	short loc_D1802

loc_D17C6:
		mov	al, [bp+arg_12]
		mov	ah, 0
		sar	ax, 1
		mov	bl, al
		mov	al, [bp+arg_14]
		push	ax
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		mov	al, bl
		mov	ah, 0
		mov	dx, si
		add	dx, ax
		sub	dx, [bp+var_2]
		push	dx
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		mov	al, bl
		mov	ah, 0
		mov	dx, si
		sub	dx, ax
		sub	dx, [bp+var_2]
		push	dx
		push	[bp+arg_4]
		call	sub_69F22
		add	sp, 0Ch

loc_D1802:
		mov	ax, di
		sub	ax, [bp+var_C]
		mov	[bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jle	short loc_D1816
		jmp	loc_D177A

loc_D1816:
		mov	[bp+var_1A], si
		mov	[bp+var_1C], di
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_16], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_18]
		mov	[bx], ax
		mov	ax, [bp+var_16]

loc_D1833:
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_D160F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1840		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	si, [bp+arg_4]
		cmp	byte ptr [si+23h], 0
		jz	short loc_D1876
		mov	al, [si+27h]
		push	ax
		push	large 20002h
		mov	ax, [si+2]
		sub	ax, [di+1Ah]
		push	ax
		mov	ax, [si]
		sub	ax, [di+18h]
		push	ax
		push	[bp+arg_0]
		call	sub_69892
		add	sp, 0Ch

loc_D1876:
		mov	ax, [si]
		sub	ax, [di+18h]
		mov	[bp+var_2], ax
		mov	al, [si+22h]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_D188F
		cmp	ax, 2
		jz	short loc_D189D
		jmp	short loc_D18B6

loc_D188F:
		mov	ax, si
		add	ax, 4
		push	ax
		call	CRT_Strlen
		pop	cx
		jmp	short loc_D18AE

loc_D189D:
		mov	ax, si
		add	ax, 4
		push	ax
		call	CRT_Strlen
		pop	cx
		imul	ax, ax, 5
		shr	ax, 1

loc_D18AE:
		mov	dx, [bp+var_2]
		sub	dx, ax
		mov	[bp+var_2], dx

loc_D18B6:
		mov	ax, [si+2]
		sub	ax, [di+1Ah]
		add	ax, 5
		push	ax
		push	[bp+var_2]
		push	[bp+arg_6]
		call	sub_75D27
		add	sp, 6
		mov	ax, si
		add	ax, 4
		push	ax
		push	[bp+arg_6]
		call	sub_75D4A
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_D1840		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D18E3		proc far

var_14		= word ptr -14h
var_10		= word ptr -10h
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
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+arg_4]
		xor	si, si
		jmp	short loc_D191E

loc_D18F2:
		mov	ax, si
		imul	ax, ax, 2Ch
		mov	bx, [bp+arg_6]
		add	bx, ax
		cmp	byte ptr [bx+2Bh], 0
		jz	short loc_D191D
		push	[bp+arg_8]
		mov	ax, si
		imul	ax, ax, 2Ch
		mov	dx, [bp+arg_6]
		add	dx, ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_D1840
		add	sp, 8

loc_D191D:
		inc	si

loc_D191E:
		cmp	si, 1Eh
		jl	short loc_D18F2
		xor	si, si
		jmp	loc_D1A10

loc_D1928:
		mov	bx, si
		imul	bx, bx, 2Ch
		cmp	byte ptr [bx+di+2Bh], 0
		jnz	short loc_D1936
		jmp	loc_D1A0F

loc_D1936:
		mov	bx, si
		inc	bx
		imul	bx, bx, 2Ch
		cmp	byte ptr [bx+di+2Bh], 0
		jnz	short loc_D1945
		jmp	loc_D1A0F

loc_D1945:
		mov	bx, si
		imul	bx, bx, 2Ch
		mov	ax, [bx+di]
		mov	[bp+var_8], ax
		mov	bx, si
		imul	bx, bx, 2Ch
		mov	ax, [bx+di+2]
		mov	[bp+var_6], ax
		mov	bx, si
		inc	bx
		imul	bx, bx, 2Ch
		mov	ax, [bx+di]
		mov	[bp+var_4], ax
		mov	bx, si
		inc	bx
		imul	bx, bx, 2Ch
		mov	ax, [bx+di+2]
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_D1570
		add	sp, 6
		mov	bx, si
		imul	bx, bx, 2Ch
		mov	al, [bx+di+27h]
		push	ax
		push	3
		push	[bp+arg_2]
		push	1000h
		mov	bx, si
		inc	bx
		imul	bx, bx, 2Ch
		push	word ptr [bx+di+2]
		mov	bx, si
		inc	bx
		imul	bx, bx, 2Ch
		push	word ptr [bx+di]
		mov	bx, si
		imul	bx, bx, 2Ch
		push	word ptr [bx+di+2]
		mov	bx, si
		imul	bx, bx, 2Ch
		push	word ptr [bx+di]
		push	[bp+arg_0]
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	cs
		call	near ptr sub_D160F
		add	sp, 16h
		push	[bp+arg_8]
		mov	ax, si
		imul	ax, ax, 2Ch
		mov	dx, di
		add	dx, ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_D1840
		add	sp, 8
		mov	bx, si
		inc	bx
		imul	bx, bx, 2Ch
		cmp	byte ptr [bx+di+23h], 0
		jnz	short loc_D19F4
		mov	bx, si
		imul	bx, bx, 2Ch
		cmp	byte ptr [bx+di+24h], 0
		jz	short loc_D1A0F

loc_D19F4:
		push	[bp+arg_8]
		mov	ax, si
		inc	ax
		imul	ax, ax, 2Ch
		mov	dx, di
		add	dx, ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_D1840
		add	sp, 8

loc_D1A0F:
		inc	si

loc_D1A10:
		cmp	si, 1Eh
		jge	short loc_D1A18
		jmp	loc_D1928

loc_D1A18:
		pop	di
		pop	si
		leave
		retf
sub_D18E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1A1C		proc far

var_380		= word ptr -380h
var_35E		= word ptr -35Eh
var_30E		= word ptr -30Eh
var_17E		= word ptr -17Eh
var_106		= word ptr -106h
var_A9		= word ptr -0A9h
var_8E		= word ptr -8Eh
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= byte ptr -26h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_1A		= word ptr -1Ah
var_14		= word ptr -14h
var_11		= word ptr -11h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 380h
		push	si
		push	di
		mov	[bp+var_3E], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_3A], 0
		mov	[bp+var_38], 0
		mov	[bp+var_36], 13Fh
		mov	[bp+var_34], 0C7h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_3], 0
		xor	di, di
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aArrive
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	54h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMidgame
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_17E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_A9]
		mov	[bp+var_2], ax
		push	seg stub253
		push	offset sub_735A5
		push	large 10028h
		push	0Ah
		lea	ax, [bp+var_30E]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_11], 0
		lea	ax, word ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	byte ptr [bp+var_1E], 2Eh
		mov	byte ptr [bp+var_1E+1], 28h
		mov	[bp+var_1C], 1Bh
		mov	byte ptr [bp+var_22], 0Fh
		mov	byte ptr [bp+var_22+1], 21h
		mov	[bp+var_20], 2Dh
		push	100h
		push	0
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76268
		add	sp, 8
		lea	ax, [bp+var_3E]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_380]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	si, si
		jmp	short loc_D1BC7

loc_D1BAA:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30E]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_106]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D1BC7:
		cmp	si, [bp+var_2]
		jl	short loc_D1BAA
		xor	si, si
		jmp	short loc_D1BF9

loc_D1BD0:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30E]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_35E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D1BF9:
		cmp	si, [bp+var_2]
		jl	short loc_D1BD0
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_35E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_380]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_7625E
		pop	cx
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_76286
		add	sp, 0Ah
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_76286
		add	sp, 0Ah
		push	0
		push	[bp+var_28]
		mov	al, [bp+var_26]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76259
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		jmp	loc_D1DB7

loc_D1C9C:
		mov	[bp+var_2C], 5
		mov	eax, dword_7B29D
		mov	[bp+var_30], eax
		push	1
		lea	ax, [bp+var_380]
		push	ax
		call	sub_75BF0
		add	sp, 4
		lea	ax, [bp+var_3E]
		push	ax
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	0Ah
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_D1CF6
		push	1
		push	[bp+var_28]
		mov	al, [bp+var_26]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76259
		add	sp, 8

loc_D1CF6:
		push	0Ah
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_D1D21
		push	1
		push	[bp+var_28]
		mov	al, [bp+var_26]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76259
		add	sp, 8

loc_D1D21:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_35E]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_D1D75
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_35E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_380]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	di
		cmp	di, [bp+var_2]
		jnz	short loc_D1D5C
		mov	[bp+var_3], 1
		jmp	short loc_D1D75

loc_D1D5C:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_35E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_380]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_D1D75:
		mov	eax, [bp+var_30]
		add	eax, [bp+var_2C]
		cmp	eax, dword_7B29D
		ja	short loc_D1D89
		mov	ax, 1
		jmp	short loc_D1D8B

loc_D1D89:
		xor	ax, ax

loc_D1D8B:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D1D75
		call	sub_7575F
		or	al, al
		jz	short loc_D1DB7
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_35E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_380]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_3], 1

loc_D1DB7:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D1DC3
		jmp	loc_D1C9C

loc_D1DC3:
		xor	si, si
		jmp	short loc_D1DF2

loc_D1DC7:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_35E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D1DF1
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D1DF1

loc_D1DF1:
		inc	si

loc_D1DF2:
		cmp	si, [bp+var_2]
		jl	short loc_D1DC7

loc_D1DF7:
		push	0Ah
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jnz	short loc_D1DF7
		push	0
		lea	ax, [bp+var_380]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		lea	ax, [bp+var_28]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_9], 0
		jz	short loc_D1E5E
		cmp	[bp+var_E], 0
		jz	short loc_D1E5E
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D1E5E

loc_D1E5E:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	seg stub253
		push	offset sub_735A0
		push	large 10028h
		push	0Ah
		lea	ax, [bp+var_30E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_17E]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_106]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_3E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_D1A1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1EB9		proc far

var_696		= word ptr -696h
var_646		= word ptr -646h
var_644		= word ptr -644h
var_630		= byte ptr -630h
var_62C		= word ptr -62Ch
var_61C		= word ptr -61Ch
var_61A		= word ptr -61Ah
var_618		= word ptr -618h
var_614		= word ptr -614h
var_5F2		= word ptr -5F2h
var_5A2		= word ptr -5A2h
var_412		= word ptr -412h
var_39A		= word ptr -39Ah
var_33D		= word ptr -33Dh
var_322		= word ptr -322h
var_192		= word ptr -192h
var_A2		= word ptr -0A2h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_44		= word ptr -44h
var_42		= byte ptr -42h
var_40		= byte ptr -40h
var_3F		= byte ptr -3Fh
var_3E		= byte ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= byte ptr -16h
var_14		= word ptr -14h
var_11		= word ptr -11h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 696h
		push	si
		push	di
		mov	[bp+var_52], 0
		mov	[bp+var_50], 0
		mov	[bp+var_4E], 0
		mov	[bp+var_4C], 0
		mov	[bp+var_4A], 13Fh
		mov	[bp+var_48], 0C7h
		push	0
		lea	ax, [bp+var_52]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_3], 0
		xor	di, di
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aDepart
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_39A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	54h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMidgame_1
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_412]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_33D]
		mov	[bp+var_2], ax
		push	seg stub253
		push	offset sub_735A5
		push	large 10028h
		push	0Ah
		lea	ax, [bp+var_5A2]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	2
		lea	ax, [bp+var_412]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_11], 0
		lea	ax, word ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7624F
		add	sp, 4
		mov	[bp+var_18], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	100h
		push	0
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	byte ptr [bp+var_22], 0
		mov	byte ptr [bp+var_22+1], 0
		mov	[bp+var_20], 0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76259
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		lea	ax, [bp+var_52]
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		lea	ax, [bp+var_52]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_614]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	si, si
		jmp	short loc_D2086

loc_D2069:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_5A2]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_39A]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D2086:
		cmp	si, [bp+var_2]
		jl	short loc_D2069
		xor	si, si
		jmp	short loc_D20B8

loc_D208F:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_5A2]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5F2]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D20B8:
		cmp	si, [bp+var_2]
		jl	short loc_D208F
		lea	ax, [bp+var_192]
		push	ax
		push	large 45544144h
		call	sub_75910
		add	sp, 6
		lea	ax, [bp+var_322]
		push	ax
		push	large 43414C50h
		call	sub_75910
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5F2]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_614]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aConvfont
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_3C+2], dx
		mov	word ptr [bp+var_3C], ax
		mov	eax, [bp+var_3C]
		mov	[bp+var_38], eax
		mov	[bp+var_34], 2
		mov	[bp+var_33], 1
		mov	[bp+var_32], 0
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, [bp+var_62C]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_61C], 1
		mov	[bp+var_61A], 0
		push	2Dh
		lea	ax, [bp+var_62C]
		push	ax
		mov	bx, [bp+var_62C]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_618], ax
		push	20h
		lea	ax, [bp+var_62C]
		push	ax
		call	sub_6932C
		add	sp, 4
		lea	ax, [bp+var_62C]
		push	ax
		push	word_7AF7C
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	0
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D3B
		add	sp, 4
		push	large 0C7013Fh
		push	large 9F0000h
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		mov	[bp+var_630], 2
		push	large 0
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D27
		add	sp, 6
		push	seg seg008
		push	offset loc_631D
		lea	ax, [bp+var_696]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	56h
		call	GameVar_Get_56414
		pop	cx
		imul	ax, ax, 14h
		lea	dx, [bp+var_322]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_696]
		push	ax
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D4A
		add	sp, 6
		push	40CDh
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D4A
		add	sp, 4
		push	seg seg008
		push	offset loc_6311
		lea	ax, [bp+var_696]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	51h
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	52h
		call	GameVar_Get_56414
		pop	cx
		imul	ax, ax, 14h
		lea	dx, [bp+var_192]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_696]
		push	ax
		lea	ax, [bp+var_646]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		jmp	loc_D23CA

loc_D22B2:
		mov	[bp+var_26], 5
		mov	eax, dword_7B29D
		mov	[bp+var_2A], eax
		push	1
		lea	ax, [bp+var_614]
		push	ax
		call	sub_75BF0
		add	sp, 4
		push	word_7AF7C
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	[bp+var_4], 0
		push	0Bh
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_D22FF
		mov	[bp+var_4], 1

loc_D22FF:
		push	0Bh
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_D2319
		mov	[bp+var_4], 1

loc_D2319:
		cmp	[bp+var_4], 0
		jz	short loc_D2334
		push	1
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76259
		add	sp, 8

loc_D2334:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5F2]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_D2388
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5F2]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_614]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	di
		cmp	di, [bp+var_2]
		jnz	short loc_D236F
		mov	[bp+var_3], 1
		jmp	short loc_D2388

loc_D236F:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5F2]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_614]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_D2388:
		mov	eax, [bp+var_2A]
		add	eax, [bp+var_26]
		cmp	eax, dword_7B29D
		ja	short loc_D239C
		mov	ax, 1
		jmp	short loc_D239E

loc_D239C:
		xor	ax, ax

loc_D239E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D2388
		call	sub_7575F
		or	al, al
		jz	short loc_D23CA
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5F2]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_614]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_3], 1

loc_D23CA:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D23D6
		jmp	loc_D22B2

loc_D23D6:
		xor	si, si
		jmp	short loc_D2405

loc_D23DA:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F2]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D2404
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D2404

loc_D2404:
		inc	si

loc_D2405:
		cmp	si, [bp+var_2]
		jl	short loc_D23DA
		mov	[bp+var_40], 3Fh
		mov	[bp+var_3F], 0
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_44], 26h
		mov	byte ptr [bp+var_44+1], 1Bh
		mov	[bp+var_42], 18h

loc_D2422:
		push	0Bh
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jnz	short loc_D2422
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76286
		add	sp, 0Ah
		lea	ax, [bp+var_644]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_62C]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_D248D
		cmp	[bp+var_38], 0
		jz	short loc_D248D
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D248D

loc_D248D:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_67383
		pop	cx
		push	0
		lea	ax, [bp+var_614]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_9], 0
		jz	short loc_D24F2
		cmp	[bp+var_E], 0
		jz	short loc_D24F2
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D24F2

loc_D24F2:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	seg stub253
		push	offset sub_735A0
		push	large 10028h
		push	0Ah
		lea	ax, [bp+var_5A2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_412]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_39A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_52]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_D1EB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D254D		proc far

var_DA8		= word ptr -0DA8h
var_DA6		= word ptr -0DA6h
var_DA4		= word ptr -0DA4h
var_DA2		= word ptr -0DA2h
var_DA0		= word ptr -0DA0h
var_D9E		= word ptr -0D9Eh
var_D9C		= word ptr -0D9Ch
var_D9A		= word ptr -0D9Ah
var_D98		= word ptr -0D98h
var_D96		= word ptr -0D96h
var_D94		= word ptr -0D94h
var_D92		= word ptr -0D92h
var_D90		= word ptr -0D90h
var_D8E		= word ptr -0D8Eh
var_D8C		= word ptr -0D8Ch
var_D8A		= word ptr -0D8Ah
var_D88		= word ptr -0D88h
var_D86		= word ptr -0D86h
var_D84		= word ptr -0D84h
var_D82		= word ptr -0D82h
var_D6E		= byte ptr -0D6Eh
var_D6A		= word ptr -0D6Ah
var_D5A		= word ptr -0D5Ah
var_D58		= word ptr -0D58h
var_D56		= word ptr -0D56h
var_D52		= word ptr -0D52h
var_D50		= word ptr -0D50h
var_D4E		= word ptr -0D4Eh
var_D4C		= word ptr -0D4Ch
var_D4A		= word ptr -0D4Ah
var_D48		= word ptr -0D48h
var_D44		= word ptr -0D44h
var_D33		= dword ptr -0D33h
var_D2F		= byte ptr -0D2Fh
var_D26		= word ptr -0D26h
var_D15		= dword ptr -0D15h
var_D11		= byte ptr -0D11h
var_D08		= word ptr -0D08h
var_CF7		= dword ptr -0CF7h
var_CF3		= byte ptr -0CF3h
var_CEA		= word ptr -0CEAh
var_CD9		= dword ptr -0CD9h
var_CD5		= byte ptr -0CD5h
var_CCC		= word ptr -0CCCh
var_CBB		= dword ptr -0CBBh
var_CB7		= byte ptr -0CB7h
var_CAE		= word ptr -0CAEh
var_C9D		= dword ptr -0C9Dh
var_C99		= byte ptr -0C99h
var_C90		= word ptr -0C90h
var_C18		= word ptr -0C18h
var_BBB		= dword ptr -0BBBh
var_BB7		= dword ptr -0BB7h
var_BB3		= dword ptr -0BB3h
var_BAB		= byte ptr -0BABh
var_BA2		= dword ptr -0BA2h
var_B9E		= word ptr -0B9Eh
var_B9C		= word ptr -0B9Ch
var_B70		= word ptr -0B70h
var_B20		= word ptr -0B20h
var_B1E		= word ptr -0B1Eh
var_B1C		= word ptr -0B1Ch
var_AFE		= word ptr -0AFEh
var_AFD		= word ptr -0AFDh
var_AF9		= word ptr -0AF9h
var_AF5		= word ptr -0AF5h
var_5F8		= word ptr -5F8h
var_5F6		= word ptr -5F6h
var_5F4		= word ptr -5F4h
var_5D6		= word ptr -5D6h
var_5D5		= word ptr -5D5h
var_5D4		= word ptr -5D4h
var_5D3		= word ptr -5D3h
var_5D1		= word ptr -5D1h
var_5CF		= word ptr -5CFh
var_5CD		= word ptr -5CDh
var_5CC		= word ptr -5CCh
var_5CA		= word ptr -5CAh
var_D0		= word ptr -0D0h
var_CE		= byte ptr -0CEh
var_CA		= word ptr -0CAh
var_C8		= byte ptr -0C8h
var_C6		= dword ptr -0C6h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B4		= word ptr -0B4h
var_B2		= word ptr -0B2h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= dword ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= word ptr -88h
var_86		= word ptr -86h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6D		= byte ptr -6Dh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_63		= byte ptr -63h
var_62		= word ptr -62h
var_60		= byte ptr -60h
var_5F		= word ptr -5Fh
var_5C		= word ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0DA8h
		push	si
		push	di
		push	seg stub378
		push	offset sub_75D80
		push	large 1001Eh
		push	2Ch
		lea	ax, [bp+var_5F8]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	di, di
		push	seg stub378
		push	offset sub_75D80
		push	large 1001Eh
		push	2Ch
		lea	ax, [bp+var_B20]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_C18], 508h
		mov	[bp+var_BB7], 100h
		mov	[bp+var_BBB], 0
		mov	[bp+var_C18], 520h
		mov	[bp+var_B9C], 0
		xor	ax, ax
		mov	[bp+var_B9E], ax
		movsx	eax, ax
		mov	[bp+var_BB3], eax
		mov	[bp+var_3], 0
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMapdata
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B70]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B70]
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		mov	bx, [bp+var_C18]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 444C5257h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_D2685
		jmp	short loc_D266C

loc_D2632:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	dl, [bp+arg_0]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_D2661
		mov	[bp+var_3], 1
		jmp	short loc_D2685

loc_D2661:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_D266C:
		push	1
		push	large 5350414Dh
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_D2632

loc_D2685:
		mov	eax, [bp+var_BA2]
		mov	[bp+var_BB3], eax
		mov	[bp+var_BAB], 0
		cmp	[bp+var_3], 0
		jnz	short loc_D269D
		jmp	loc_D3E67

loc_D269D:
		jmp	loc_D275E

loc_D26A0:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_B20]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_B1E]
		add	bx, dx
		mov	[bx], ax
		push	ds
		mov	ax, si
		imul	ax, ax, 2Ch
		lea	dx, [bp+var_B1C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadViaHelper_6DB52
		add	sp, 6
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_AFE]
		add	bx, dx
		mov	[bx], al
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_AFD]
		add	bx, dx
		mov	[bx], al
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_AF9]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_AF5]
		add	bx, ax
		mov	byte ptr [bx], 1
		inc	si
		cmp	si, 1Eh
		jnz	short loc_D274F
		push	0C001h
		call	sub_1DDFE
		pop	cx

loc_D274F:
		mov	eax, [bp+var_BA2]
		mov	[bp+var_BB3], eax
		mov	[bp+var_BAB], 0

loc_D275E:
		push	1
		push	large 4C42414Ch
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_D277A
		jmp	loc_D26A0

loc_D277A:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekToStart_6DC71
		pop	cx
		jmp	loc_D2880

loc_D2788:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5F8]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5F6]
		add	bx, dx
		mov	[bx], ax
		push	ds
		mov	ax, di
		imul	ax, ax, 2Ch
		lea	dx, [bp+var_5F4]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadViaHelper_6DB52
		add	sp, 6
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5D6]
		add	bx, dx
		mov	[bx], al
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5D5]
		add	bx, dx
		mov	[bx], al
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5D4]
		add	bx, dx
		mov	[bx], al
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5D3]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5D1]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, di
		imul	bx, bx, 2Ch
		lea	dx, [bp+var_5CF]
		add	bx, dx
		mov	[bx], ax
		inc	di
		cmp	di, 1Eh
		jnz	short loc_D2871
		push	0C002h
		call	sub_1DDFE
		pop	cx

loc_D2871:
		mov	eax, [bp+var_BA2]
		mov	[bp+var_BB3], eax
		mov	[bp+var_BAB], 0

loc_D2880:
		push	1
		push	large 454E494Ch
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_D289C
		jmp	loc_D2788

loc_D289C:
		cmp	di, 1
		jg	short loc_D28AF
		push	0C003h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_D28AF
		jmp	loc_D3E67

loc_D28AF:
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMidmap
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B70]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B70]
		push	ax
		lea	ax, [bp+var_C90]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	[bp+var_18], 0
		mov	[bp+var_14], 2
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_28], 2
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		mov	[bp+var_40], 0
		mov	[bp+var_3C], 2
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		mov	[bp+var_4A], 0
		mov	[bp+var_46], 2
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	3
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	0
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	1
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	2
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	3
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	4
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	5
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6
		lea	ax, [bp+var_C90]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMapfont
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B70]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_B70]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_58+2], dx
		mov	word ptr [bp+var_58], ax
		mov	eax, [bp+var_58]
		mov	[bp+var_54], eax
		mov	[bp+var_50], 2
		mov	[bp+var_4F], 1
		mov	[bp+var_4E], 0
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_CAE]
		push	ax
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, [bp+var_CCC]
		push	ax
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_CEA]
		push	ax
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_2C]
		push	ax
		lea	ax, [bp+var_D08]
		push	ax
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		lea	ax, [bp+var_D26]
		push	ax
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_D44]
		push	ax
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		mov	[bp+var_D52], 0
		mov	[bp+var_D50], 0
		mov	[bp+var_D4E], 0
		mov	[bp+var_D4C], 0
		mov	[bp+var_D4A], 13Fh
		mov	[bp+var_D48], 0C7h
		push	0
		lea	ax, [bp+var_D52]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		lea	ax, [bp+var_D52]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_6735D
		add	sp, 4
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, [bp+var_D6A]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_D5A], 0
		mov	[bp+var_D58], 0
		mov	[bp+var_D56], 4
		lea	ax, [bp+var_D6A]
		push	ax
		lea	ax, [bp+var_D52]
		push	ax
		lea	ax, [bp+var_D84]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	[bp+var_D6E], 4
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	[bp+var_5F], 0
		lea	ax, word ptr [bp+var_4A]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	sub_7624F
		add	sp, 4
		mov	[bp+var_63], 1
		mov	ax, [bp+var_5F8]
		mov	[bp+var_6A], ax
		mov	ax, [bp+var_5F6]
		mov	[bp+var_6C], ax
		mov	ax, [bp+var_6A]
		add	ax, 0FF60h
		mov	[bp+var_D90], ax
		add	ax, 140h
		mov	[bp+var_D8C], ax
		cmp	[bp+var_D90], 0
		jge	short loc_D2BF6
		mov	[bp+var_D90], 0
		mov	[bp+var_D8C], 13Fh
		jmp	short loc_D2BF6

loc_D2BF6:
		cmp	[bp+var_D8C], 280h
		jle	short loc_D2C0C
		mov	[bp+var_D90], 140h
		mov	[bp+var_D8C], 280h
		jmp	short loc_D2C0C

loc_D2C0C:
		mov	ax, [bp+var_6C]
		add	ax, 0FF9Ch
		mov	[bp+var_D8E], ax
		add	ax, 0C8h
		mov	[bp+var_D8A], ax
		cmp	[bp+var_D8E], 0
		jge	short loc_D2C32
		mov	[bp+var_D8E], 0
		mov	[bp+var_D8A], 0C7h
		jmp	short loc_D2C32

loc_D2C32:
		cmp	[bp+var_D8A], 1E0h
		jle	short loc_D2C48
		mov	[bp+var_D8E], 118h
		mov	[bp+var_D8A], 1E0h
		jmp	short loc_D2C48

loc_D2C48:
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA8], ax
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA0], ax
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_D98], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA4], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_D9C], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_D94], ax
		xor	ax, ax
		sub	ax, [bp+var_D8E]
		mov	[bp+var_DA6], ax
		mov	ax, 0C8h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D9E], ax
		mov	ax, 190h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D96], ax
		xor	ax, ax
		sub	ax, [bp+var_D8E]
		mov	[bp+var_DA2], ax
		mov	ax, 0C8h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D9A], ax
		mov	ax, 190h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D92], ax
		mov	[bp+var_D88], 0
		mov	[bp+var_D86], 0
		xor	si, si
		jmp	loc_D3A1F

loc_D2CD8:
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5D3]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_2], ax
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CD]
		add	bx, ax
		mov	byte ptr [bx], 1
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5F8]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_68], ax
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5F6]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_68+2], ax
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CF]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_78], ax
		mov	[bp+var_7A], 0
		jmp	loc_D33E6

loc_D2D2E:
		mov	ax, word ptr [bp+var_68]
		mov	[bp+var_7C], ax
		mov	ax, word ptr [bp+var_68+2]
		mov	[bp+var_7E], ax
		mov	cx, [bp+var_7C]
		add	cx, 0FF60h
		add	ax, 0FF9Ch
		mov	[bp+var_80], ax
		mov	bx, [bp+var_D90]
		sub	bx, cx
		mov	[bp+var_82], bx
		mov	ax, [bp+var_82]
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1
		jle	short loc_D2D79
		or	bx, bx
		jle	short loc_D2D6B
		mov	[bp+var_D88], 0FFFFh
		jmp	short loc_D2D7F

loc_D2D6B:
		or	bx, bx
		jge	short loc_D2D77
		mov	[bp+var_D88], 1
		jmp	short loc_D2D7F

loc_D2D77:
		jmp	short loc_D2D7F

loc_D2D79:
		mov	[bp+var_D88], 0

loc_D2D7F:
		mov	ax, [bp+var_D88]
		add	[bp+var_D90], ax
		mov	ax, [bp+var_D90]
		add	ax, 140h
		mov	[bp+var_D8C], ax
		or	cx, cx
		jge	short loc_D2DAA
		mov	[bp+var_D90], 0
		mov	[bp+var_D8C], 13Fh
		mov	[bp+var_D88], 0
		jmp	short loc_D2DAA

loc_D2DAA:
		cmp	[bp+var_D8C], 280h
		jle	short loc_D2DC6
		mov	[bp+var_D90], 140h
		mov	[bp+var_D8C], 280h
		mov	[bp+var_D88], 0
		jmp	short loc_D2DC6

loc_D2DC6:
		mov	bx, [bp+var_D8E]
		sub	bx, [bp+var_80]
		mov	[bp+var_84], bx
		mov	ax, [bp+var_84]
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1
		jle	short loc_D2DF9
		or	bx, bx
		jle	short loc_D2DEB
		mov	[bp+var_D86], 0FFFFh
		jmp	short loc_D2DFF

loc_D2DEB:
		or	bx, bx
		jge	short loc_D2DF7
		mov	[bp+var_D86], 1
		jmp	short loc_D2DFF

loc_D2DF7:
		jmp	short loc_D2DFF

loc_D2DF9:
		mov	[bp+var_D86], 0

loc_D2DFF:
		mov	ax, [bp+var_D86]
		add	[bp+var_D8E], ax
		mov	ax, [bp+var_D8E]
		add	ax, 0C8h
		mov	[bp+var_D8A], ax
		cmp	[bp+var_80], 0
		jge	short loc_D2E2C
		mov	[bp+var_D8E], 0
		mov	[bp+var_D8A], 0C7h
		mov	[bp+var_D86], 0
		jmp	short loc_D2E2C

loc_D2E2C:
		cmp	[bp+var_D8A], 1E0h
		jle	short loc_D2E48
		mov	[bp+var_D8E], 118h
		mov	[bp+var_D8A], 1E0h
		mov	[bp+var_D86], 0
		jmp	short loc_D2E48

loc_D2E48:
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA8], ax
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA0], ax
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_D98], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA4], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_D9C], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_D94], ax
		xor	ax, ax
		sub	ax, [bp+var_D8E]
		mov	[bp+var_DA6], ax
		mov	ax, 0C8h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D9E], ax
		mov	ax, 190h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D96], ax
		xor	ax, ax
		sub	ax, [bp+var_D8E]
		mov	[bp+var_DA2], ax
		mov	ax, 0C8h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D9A], ax
		mov	ax, 190h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D92], ax
		cmp	[bp+var_D88], 0
		jnz	short loc_D2ED5
		cmp	[bp+var_D86], 0
		jz	short loc_D2EDA

loc_D2ED5:
		mov	ax, 1
		jmp	short loc_D2EDC

loc_D2EDA:
		xor	ax, ax

loc_D2EDC:
		mov	[bp+var_6D], al
		mov	ax, [bp+var_DA8]
		mov	[bp+var_86], ax
		mov	ax, [bp+var_DA6]
		mov	[bp+var_88], ax
		push	large 0
		mov	al, [bp+var_C99]
		push	ax
		push	large [bp+var_C9D]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_88]
		push	[bp+var_86]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_DA4]
		mov	[bp+var_8A], ax
		mov	ax, [bp+var_DA2]
		mov	[bp+var_8C], ax
		push	large 0
		mov	al, [bp+var_CB7]
		push	ax
		push	large [bp+var_CBB]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8C]
		push	[bp+var_8A]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_DA0]
		mov	[bp+var_8E], ax
		mov	ax, [bp+var_D9E]
		mov	[bp+var_90], ax
		push	large 0
		mov	al, [bp+var_CD5]
		push	ax
		push	large [bp+var_CD9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_90]
		push	[bp+var_8E]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_D9C]
		mov	[bp+var_92], ax
		mov	ax, [bp+var_D9A]
		mov	[bp+var_94], ax
		push	large 0
		mov	al, [bp+var_CF3]
		push	ax
		push	large [bp+var_CF7]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_94]
		push	[bp+var_92]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_D98]
		mov	[bp+var_96], ax
		mov	ax, [bp+var_D96]
		mov	[bp+var_98], ax
		push	large 0
		mov	al, [bp+var_D11]
		push	ax
		push	large [bp+var_D15]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_98]
		push	[bp+var_96]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_D94]
		mov	[bp+var_9A], ax
		mov	ax, [bp+var_D92]
		mov	[bp+var_9C], ax
		push	large 0
		mov	al, [bp+var_D2F]
		push	ax
		push	large [bp+var_D33]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_9C]
		push	[bp+var_9A]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		lea	ax, [bp+var_D84]
		push	ax
		lea	ax, [bp+var_B20]
		push	ax
		lea	ax, [bp+var_5F8]
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		push	word_7AF7C
		push	cs
		call	near ptr sub_D18E3
		add	sp, 0Ah
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5D1]
		add	bx, ax
		mov	al, [bx]
		push	ax
		push	3
		lea	ax, [bp+var_DA8]
		push	ax
		push	[bp+var_7A]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CA]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CC]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5F8]
		add	bx, ax
		push	word ptr [bx]
		push	word_7AF7C
		push	ss
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	cs
		call	near ptr sub_D160F
		add	sp, 16h
		mov	eax, [bp+var_A0]
		mov	[bp+var_68], eax
		lea	ax, [bp+var_D84]
		push	ax
		mov	ax, si
		imul	ax, ax, 2Ch
		lea	dx, [bp+var_5F8]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		push	word_7AF7C
		push	cs
		call	near ptr sub_D1840
		add	sp, 8
		call	sub_7575F
		or	al, al
		jnz	short loc_D3105
		jmp	loc_D334E

loc_D3105:
		lea	ax, [bp+var_62]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_D82]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_D6A]
		push	ax
		call	sub_69368
		add	sp, 4
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_D52]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_D44]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D26]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D08]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CCC]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CAE]
		push	ax
		call	sub_66AAD
		add	sp, 4
		cmp	[bp+var_4F], 0
		jz	short loc_D31BC
		cmp	[bp+var_54], 0
		jz	short loc_D31BC
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D31BC

loc_D31BC:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_D31F4
		cmp	[bp+var_4A], 0
		jz	short loc_D31F4
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D31F4

loc_D31F4:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_D322C
		cmp	[bp+var_40], 0
		jz	short loc_D322C
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D322C

loc_D322C:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_D3264
		cmp	[bp+var_36], 0
		jz	short loc_D3264
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3264

loc_D3264:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_D329C
		cmp	[bp+var_2C], 0
		jz	short loc_D329C
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D329C

loc_D329C:
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		cmp	[bp+var_1D], 0
		jz	short loc_D32D4
		cmp	[bp+var_22], 0
		jz	short loc_D32D4
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D32D4

loc_D32D4:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		cmp	[bp+var_13], 0
		jz	short loc_D330C
		cmp	[bp+var_18], 0
		jz	short loc_D330C
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D330C

loc_D330C:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_9], 0
		jnz	short loc_D3329
		jmp	loc_D3E44

loc_D3329:
		cmp	[bp+var_E], 0
		jnz	short loc_D3333
		jmp	loc_D3E44

loc_D3333:
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	loc_D3E44
		jmp	loc_D3E44

loc_D334E:
		push	word_7AF7C
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_D33E0
		mov	byte ptr [bp+var_CA], 26h
		mov	byte ptr [bp+var_CA+1], 1Bh
		mov	[bp+var_C8], 18h
		push	100h
		push	0
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_76245
		add	sp, 6
		push	[bp+var_D0]
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_76268
		add	sp, 8
		push	[bp+var_62]
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_76272
		add	sp, 8
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		mov	[bp+var_63], 0
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_7627C
		pop	cx

loc_D33E0:
		mov	ax, [bp+var_78]
		add	[bp+var_7A], ax

loc_D33E6:
		mov	ax, [bp+var_7A]
		cmp	ax, [bp+var_2]
		jge	short loc_D33F1
		jmp	loc_D2D2E

loc_D33F1:
		jmp	loc_D3A15

loc_D33F4:
		mov	ax, word ptr [bp+var_68]
		mov	[bp+var_A2], ax
		mov	ax, word ptr [bp+var_68+2]
		mov	[bp+var_A4], ax
		mov	cx, [bp+var_A2]
		add	cx, 0FF60h
		add	ax, 0FF9Ch
		mov	[bp+var_A6], ax
		mov	bx, [bp+var_D90]
		sub	bx, cx
		mov	[bp+var_A8], bx
		mov	ax, [bp+var_A8]
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1
		jle	short loc_D3443
		or	bx, bx
		jle	short loc_D3435
		mov	[bp+var_D88], 0FFFFh
		jmp	short loc_D3449

loc_D3435:
		or	bx, bx
		jge	short loc_D3441
		mov	[bp+var_D88], 1
		jmp	short loc_D3449

loc_D3441:
		jmp	short loc_D3449

loc_D3443:
		mov	[bp+var_D88], 0

loc_D3449:
		mov	ax, [bp+var_D88]
		add	[bp+var_D90], ax
		mov	ax, [bp+var_D90]
		add	ax, 140h
		mov	[bp+var_D8C], ax
		or	cx, cx
		jge	short loc_D3474
		mov	[bp+var_D90], 0
		mov	[bp+var_D8C], 13Fh
		mov	[bp+var_D88], 0
		jmp	short loc_D3474

loc_D3474:
		cmp	[bp+var_D8C], 280h
		jle	short loc_D3490
		mov	[bp+var_D90], 140h
		mov	[bp+var_D8C], 280h
		mov	[bp+var_D88], 0
		jmp	short loc_D3490

loc_D3490:
		mov	bx, [bp+var_D8E]
		sub	bx, [bp+var_A6]
		mov	[bp+var_AA], bx
		mov	ax, [bp+var_AA]
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1
		jle	short loc_D34C4
		or	bx, bx
		jle	short loc_D34B6
		mov	[bp+var_D86], 0FFFFh
		jmp	short loc_D34CA

loc_D34B6:
		or	bx, bx
		jge	short loc_D34C2
		mov	[bp+var_D86], 1
		jmp	short loc_D34CA

loc_D34C2:
		jmp	short loc_D34CA

loc_D34C4:
		mov	[bp+var_D86], 0

loc_D34CA:
		mov	ax, [bp+var_D86]
		add	[bp+var_D8E], ax
		mov	ax, [bp+var_D8E]
		add	ax, 0C8h
		mov	[bp+var_D8A], ax
		cmp	[bp+var_A6], 0
		jge	short loc_D34F8
		mov	[bp+var_D8E], 0
		mov	[bp+var_D8A], 0C7h
		mov	[bp+var_D86], 0
		jmp	short loc_D34F8

loc_D34F8:
		cmp	[bp+var_D8A], 1E0h
		jle	short loc_D3514
		mov	[bp+var_D8E], 118h
		mov	[bp+var_D8A], 1E0h
		mov	[bp+var_D86], 0
		jmp	short loc_D3514

loc_D3514:
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA8], ax
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA0], ax
		xor	ax, ax
		sub	ax, [bp+var_D90]
		mov	[bp+var_D98], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_DA4], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_D9C], ax
		mov	ax, 140h
		sub	ax, [bp+var_D90]
		mov	[bp+var_D94], ax
		xor	ax, ax
		sub	ax, [bp+var_D8E]
		mov	[bp+var_DA6], ax
		mov	ax, 0C8h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D9E], ax
		mov	ax, 190h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D96], ax
		xor	ax, ax
		sub	ax, [bp+var_D8E]
		mov	[bp+var_DA2], ax
		mov	ax, 0C8h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D9A], ax
		mov	ax, 190h
		sub	ax, [bp+var_D8E]
		mov	[bp+var_D92], ax
		cmp	[bp+var_D88], 0
		jnz	short loc_D35A1
		cmp	[bp+var_D86], 0
		jz	short loc_D35A6

loc_D35A1:
		mov	ax, 1
		jmp	short loc_D35A8

loc_D35A6:
		xor	ax, ax

loc_D35A8:
		mov	[bp+var_6D], al
		mov	ax, [bp+var_DA8]
		mov	[bp+var_AC], ax
		mov	ax, [bp+var_DA6]
		mov	[bp+var_AE], ax
		push	large 0
		mov	al, [bp+var_C99]
		push	ax
		push	large [bp+var_C9D]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_AE]
		push	[bp+var_AC]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_DA4]
		mov	[bp+var_B0], ax
		mov	ax, [bp+var_DA2]
		mov	[bp+var_B2], ax
		push	large 0
		mov	al, [bp+var_CB7]
		push	ax
		push	large [bp+var_CBB]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_B2]
		push	[bp+var_B0]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_DA0]
		mov	[bp+var_B4], ax
		mov	ax, [bp+var_D9E]
		mov	[bp+var_B6], ax
		push	large 0
		mov	al, [bp+var_CD5]
		push	ax
		push	large [bp+var_CD9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_B6]
		push	[bp+var_B4]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_D9C]
		mov	[bp+var_B8], ax
		mov	ax, [bp+var_D9A]
		mov	[bp+var_BA], ax
		push	large 0
		mov	al, [bp+var_CF3]
		push	ax
		push	large [bp+var_CF7]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_BA]
		push	[bp+var_B8]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_D98]
		mov	[bp+var_BC], ax
		mov	ax, [bp+var_D96]
		mov	[bp+var_BE], ax
		push	large 0
		mov	al, [bp+var_D11]
		push	ax
		push	large [bp+var_D15]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_BE]
		push	[bp+var_BC]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [bp+var_D94]
		mov	[bp+var_C0], ax
		mov	ax, [bp+var_D92]
		mov	[bp+var_C2], ax
		push	large 0
		mov	al, [bp+var_D2F]
		push	ax
		push	large [bp+var_D33]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C2]
		push	[bp+var_C0]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		lea	ax, [bp+var_D84]
		push	ax
		lea	ax, [bp+var_B20]
		push	ax
		lea	ax, [bp+var_5F8]
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		push	word_7AF7C
		push	cs
		call	near ptr sub_D18E3
		add	sp, 0Ah
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5D1]
		add	bx, ax
		mov	al, [bx]
		push	ax
		push	3
		lea	ax, [bp+var_DA8]
		push	ax
		push	[bp+var_7A]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CA]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CC]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5F8]
		add	bx, ax
		push	word ptr [bx]
		push	word_7AF7C
		push	ss
		lea	ax, word ptr [bp+var_C6]
		push	ax
		push	cs
		call	near ptr sub_D160F
		add	sp, 16h
		mov	eax, [bp+var_C6]
		mov	[bp+var_68], eax
		lea	ax, [bp+var_D84]
		push	ax
		mov	ax, si
		imul	ax, ax, 2Ch
		lea	dx, [bp+var_5F8]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		push	word_7AF7C
		push	cs
		call	near ptr sub_D1840
		add	sp, 8
		call	sub_7575F
		or	al, al
		jnz	short loc_D37D1
		jmp	loc_D3A05

loc_D37D1:
		lea	ax, [bp+var_62]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_D82]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_D6A]
		push	ax
		call	sub_69368
		add	sp, 4
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_D52]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_D44]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D26]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D08]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CCC]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CAE]
		push	ax
		call	sub_66AAD
		add	sp, 4
		cmp	[bp+var_4F], 0
		jz	short loc_D3888
		cmp	[bp+var_54], 0
		jz	short loc_D3888
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3888

loc_D3888:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_D38C0
		cmp	[bp+var_4A], 0
		jz	short loc_D38C0
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D38C0

loc_D38C0:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_D38F8
		cmp	[bp+var_40], 0
		jz	short loc_D38F8
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D38F8

loc_D38F8:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_D3930
		cmp	[bp+var_36], 0
		jz	short loc_D3930
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3930

loc_D3930:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_D3968
		cmp	[bp+var_2C], 0
		jz	short loc_D3968
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3968

loc_D3968:
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		cmp	[bp+var_1D], 0
		jz	short loc_D39A0
		cmp	[bp+var_22], 0
		jz	short loc_D39A0
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D39A0

loc_D39A0:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		cmp	[bp+var_13], 0
		jz	short loc_D39D8
		cmp	[bp+var_18], 0
		jz	short loc_D39D8
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D39D8

loc_D39D8:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_9], 0
		jnz	short loc_D39F5
		jmp	loc_D3E44

loc_D39F5:
		cmp	[bp+var_E], 0
		jnz	short loc_D39FF
		jmp	loc_D3E44

loc_D39FF:
		jmp	loc_D3333
		jmp	loc_D3E44

loc_D3A05:
		push	word_7AF7C
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4

loc_D3A15:
		cmp	[bp+var_6D], 0
		jz	short loc_D3A1E
		jmp	loc_D33F4

loc_D3A1E:
		inc	si

loc_D3A1F:
		mov	ax, di
		dec	ax
		cmp	ax, si
		jle	short loc_D3A29
		jmp	loc_D2CD8

loc_D3A29:
		mov	bx, si
		imul	bx, bx, 2Ch
		lea	ax, [bp+var_5CD]
		add	bx, ax
		mov	byte ptr [bx], 1
		lea	ax, [bp+var_D84]
		push	ax
		lea	ax, [bp+var_B20]
		push	ax
		lea	ax, [bp+var_5F8]
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		push	word_7AF7C
		push	cs
		call	near ptr sub_D18E3
		add	sp, 0Ah
		lea	ax, [bp+var_D84]
		push	ax
		mov	ax, si
		imul	ax, ax, 2Ch
		lea	dx, [bp+var_5F8]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_DA8]
		push	ax
		push	word_7AF7C
		push	cs
		call	near ptr sub_D1840
		add	sp, 8
		push	word_7AF7C
		push	word_7AF7C
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		mov	[bp+var_72], 1Eh
		mov	eax, dword_7B29D
		mov	[bp+var_76], eax
		jmp	short loc_D3AAD

loc_D3AA4:
		call	sub_7575F
		or	al, al
		jnz	short loc_D3AC9

loc_D3AAD:
		mov	eax, [bp+var_76]
		add	eax, [bp+var_72]
		cmp	eax, dword_7B29D
		ja	short loc_D3AC1
		mov	ax, 1
		jmp	short loc_D3AC3

loc_D3AC1:
		xor	ax, ax

loc_D3AC3:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D3AA4

loc_D3AC9:
		cmp	[bp+var_9], 0
		jz	short loc_D3AED
		cmp	[bp+var_E], 0
		jz	short loc_D3AED
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3AED

loc_D3AED:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		cmp	[bp+var_13], 0
		jz	short loc_D3B25
		cmp	[bp+var_18], 0
		jz	short loc_D3B25
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3B25

loc_D3B25:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_1D], 0
		jz	short loc_D3B5D
		cmp	[bp+var_22], 0
		jz	short loc_D3B5D
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3B5D

loc_D3B5D:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		cmp	[bp+var_27], 0
		jz	short loc_D3B95
		cmp	[bp+var_2C], 0
		jz	short loc_D3B95
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3B95

loc_D3B95:
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		cmp	[bp+var_31], 0
		jz	short loc_D3BCD
		cmp	[bp+var_36], 0
		jz	short loc_D3BCD
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3BCD

loc_D3BCD:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_3B], 0
		jz	short loc_D3C05
		cmp	[bp+var_40], 0
		jz	short loc_D3C05
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3C05

loc_D3C05:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		lea	ax, [bp+var_62]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_D82]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_D6A]
		push	ax
		call	sub_69368
		add	sp, 4
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_D52]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_D44]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D26]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D08]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CEA]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CCC]
		push	ax
		call	sub_66AAD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CAE]
		push	ax
		call	sub_66AAD
		add	sp, 4
		cmp	[bp+var_4F], 0
		jz	short loc_D3CD0
		cmp	[bp+var_54], 0
		jz	short loc_D3CD0
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3CD0

loc_D3CD0:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_D3D08
		cmp	[bp+var_4A], 0
		jz	short loc_D3D08
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3D08

loc_D3D08:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		cmp	[bp+var_3B], 0
		jz	short loc_D3D40
		cmp	[bp+var_40], 0
		jz	short loc_D3D40
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3D40

loc_D3D40:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_D3D78
		cmp	[bp+var_36], 0
		jz	short loc_D3D78
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3D78

loc_D3D78:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_D3DB0
		cmp	[bp+var_2C], 0
		jz	short loc_D3DB0
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3DB0

loc_D3DB0:
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		cmp	[bp+var_1D], 0
		jz	short loc_D3DE8
		cmp	[bp+var_22], 0
		jz	short loc_D3DE8
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3DE8

loc_D3DE8:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		cmp	[bp+var_13], 0
		jz	short loc_D3E20
		cmp	[bp+var_18], 0
		jz	short loc_D3E20
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D3E20

loc_D3E20:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_9], 0
		jz	short loc_D3E44
		cmp	[bp+var_E], 0
		jz	short loc_D3E44
		jmp	loc_D3333

loc_D3E44:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, [bp+var_C90]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_D3E67:
		mov	[bp+var_C18], 520h
		lea	ax, [bp+var_C18]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_C18]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_D254D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D3E8B		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+7C5h], 0
		mov	byte_7D13E, 0
		push	8
		call	Music_SetPendingTune_5ED30
		pop	cx
		push	cs
		call	near ptr sub_D1EB9
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D3EBA
		mov	al, [bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_D254D
		pop	cx

loc_D3EBA:
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D3EC7
		push	cs
		call	near ptr sub_D1A1C

loc_D3EC7:
		mov	byte ptr [si+7C5h], 1
		pop	si
		pop	bp
		retf
sub_D3E8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D3ECF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D3EE8
		push	2Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D3EF3

loc_D3EE8:
		mov	al, 0
		mov	[si+2Bh], al
		mov	[si+24h], al
		mov	[si+23h], al

loc_D3EF3:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D3ECF		endp
ovr378		ends
