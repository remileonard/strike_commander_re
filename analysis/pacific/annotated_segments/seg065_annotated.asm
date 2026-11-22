seg065		segment	para public 'CODE' use16
		assume cs:seg065
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 6, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28766		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_28766		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2876B		proc far

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
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+29h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28787
		jmp	loc_288F8

loc_28787:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_36], eax
		mov	eax, es:[si+4]
		mov	[bp+var_32], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2E], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	Math_Helper_5A1A4
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+1Ch], eax
		mov	eax, [bp+var_32]
		mov	es:[bx+20h], eax
		mov	eax, [bp+var_2E]
		mov	es:[bx+24h], eax
		or	byte ptr es:[bx+29h], 2
		mov	al, es:[bx+29h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_287F5
		jmp	loc_288F8

loc_287F5:
		cmp	byte_778FC, 0
		jz	short loc_28865
		push	large [bp+var_32]
		push	large dword_7CA10
		push	large [bp+var_36]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_E+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_32]
		push	large dword_7CA14
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_16+1]

loc_28851:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		or	byte ptr es:[bx+29h], 4
		and	byte ptr es:[bx+29h], 0F7h
		jmp	loc_288F8

loc_28865:
		mov	eax, [bp+var_32]
		cmp	eax, dword_77B0E
		jl	short loc_28875
		mov	ax, 1
		jmp	short loc_28877

loc_28875:
		xor	ax, ax

loc_28877:
		or	al, al
		jz	short loc_288F0
		mov	eax, dword_7CC84
		mov	[bp+var_1A], eax
		shl	eax, 8
		cmp	eax, [bp+var_32]
		jl	short loc_28892
		mov	ax, 1
		jmp	short loc_28894

loc_28892:
		xor	ax, ax

loc_28894:
		or	al, al
		jz	short loc_288F0
		push	large [bp+var_32]
		push	large dword_7CA10
		push	large [bp+var_36]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_22+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_32]
		push	large dword_7CA14
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_2A+1]
		jmp	loc_28851

loc_288F0:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+29h], 8

loc_288F8:
		pop	si
		leave
		retf
sub_2876B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_288FB		proc far

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

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+29h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28917
		jmp	loc_28A9C

loc_28917:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		mov	eax, dword_7CA18
		sub	[bp+var_34], eax
		mov	eax, dword_7CA1C
		sub	[bp+var_30], eax
		mov	eax, dword_7CA20
		sub	[bp+var_2C], eax
		push	62F4h
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_34]
		mov	es:[bx+1Ch], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+20h], eax
		mov	eax, [bp+var_2C]
		mov	es:[bx+24h], eax
		or	byte ptr es:[bx+29h], 2
		mov	al, es:[bx+29h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28999
		jmp	loc_28A9C

loc_28999:
		cmp	byte_778FC, 0
		jz	short loc_28A09
		push	large [bp+var_30]
		push	large dword_7CA10
		push	large [bp+var_34]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_C+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_30]
		push	large dword_7CA14
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_14+1]

loc_289F5:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		or	byte ptr es:[bx+29h], 4
		and	byte ptr es:[bx+29h], 0F7h
		jmp	loc_28A9C

loc_28A09:
		mov	eax, [bp+var_30]
		cmp	eax, dword_77B0E
		jl	short loc_28A19
		mov	ax, 1
		jmp	short loc_28A1B

loc_28A19:
		xor	ax, ax

loc_28A1B:
		or	al, al
		jz	short loc_28A94
		mov	eax, dword_7CC84
		mov	[bp+var_18], eax
		shl	eax, 8
		cmp	eax, [bp+var_30]
		jl	short loc_28A36
		mov	ax, 1
		jmp	short loc_28A38

loc_28A36:
		xor	ax, ax

loc_28A38:
		or	al, al
		jz	short loc_28A94
		push	large [bp+var_30]
		push	large dword_7CA10
		push	large [bp+var_34]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_20+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_30]
		push	large dword_7CA14
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_28+1]
		jmp	loc_289F5

loc_28A94:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+29h], 8

loc_28A9C:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		cmp	ax, word_7C9FC
		jb	short loc_28ADF
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		cmp	ax, word_7C9FE
		ja	short loc_28ADF
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		cmp	ax, word_7C9F8
		jb	short loc_28ADF
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		cmp	ax, word_7C9FA
		ja	short loc_28ADF
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+20h]
		cmp	eax, dword_7CA00
		jge	short loc_28AE5

loc_28ADF:
		mov	word_77957, 1

loc_28AE5:
		pop	si
		leave
		retf
sub_288FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28AE8		proc far

var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+29h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28B05
		jmp	loc_28CBE

loc_28B05:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_5C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_58], eax
		mov	eax, es:[si+8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_58]
		cmp	eax, dword_77B0E
		jge	short loc_28B41
		mov	ax, 1
		jmp	short loc_28B43

loc_28B41:
		xor	ax, ax

loc_28B43:
		or	al, al
		jnz	short loc_28B4A
		jmp	loc_28C58

loc_28B4A:
		mov	eax, [bp+var_5C]
		mov	[bp+var_8], eax
		mov	eax, dword_77B0E
		mov	[bp+var_C], eax
		mov	ax, word_7CA0C
		mov	[bp+var_E], ax
		push	large [bp+var_C]
		push	large dword_7CA10
		push	large [bp+var_8]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		sar	eax, 8
		mov	[bp+var_22], eax
		cmp	[bp+var_22], 7D00h
		jle	short loc_28BB9
		mov	[bp+var_22], 7D00h
		jmp	short loc_28BCD

loc_28BB9:
		cmp	[bp+var_22], 0FFFF8300h
		jge	short loc_28BCD
		mov	[bp+var_22], 0FFFF8300h
		jmp	short loc_28BCD

loc_28BCD:
		mov	ax, word ptr [bp+var_22]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		mov	eax, [bp+var_54]
		mov	[bp+var_26], eax
		mov	eax, dword_77B0E
		mov	[bp+var_2A], eax
		mov	ax, word_7CA0E
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large dword_7CA14
		push	large [bp+var_26]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		sub	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		sar	eax, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 7D00h
		jle	short loc_28C3F
		mov	[bp+var_40], 7D00h
		jmp	short loc_28C53

loc_28C3F:
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_28C53
		mov	[bp+var_40], 0FFFF8300h
		jmp	short loc_28C53

loc_28C53:
		mov	ax, word ptr [bp+var_40]
		jmp	short loc_28CAD

loc_28C58:
		push	large [bp+var_58]
		push	large dword_7CA10
		push	large [bp+var_5C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_48+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_58]
		push	large dword_7CA14
		push	large [bp+var_54]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_50+1]

loc_28CAD:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], ax
		or	byte ptr es:[bx+29h], 4
		or	byte ptr es:[bx+29h], 8

loc_28CBE:
		pop	si
		leave
		retf
sub_28AE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28CC1		proc far

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
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+11h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28CDD
		jmp	loc_28E4C

loc_28CDD:
		mov	eax, [bp+arg_6]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_36], eax
		mov	eax, es:[si+4]
		mov	[bp+var_32], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2E], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	Math_Helper_5A1A4
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+4], eax
		mov	eax, [bp+var_32]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_2E]
		mov	es:[bx+0Ch], eax
		or	byte ptr es:[bx+11h], 2
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28D4B
		jmp	loc_28E4C

loc_28D4B:
		cmp	byte_778FC, 0
		jz	short loc_28DBA
		push	large [bp+var_32]
		push	large dword_7CA10
		push	large [bp+var_36]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_E+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_32]
		push	large dword_7CA14
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_16+1]

loc_28DA6:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		or	byte ptr es:[bx+11h], 4
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_28E4C

loc_28DBA:
		mov	eax, [bp+var_32]
		cmp	eax, dword_77B0E
		jl	short loc_28DCA
		mov	ax, 1
		jmp	short loc_28DCC

loc_28DCA:
		xor	ax, ax

loc_28DCC:
		or	al, al
		jz	short loc_28E44
		mov	eax, dword_7CC84
		mov	[bp+var_1A], eax
		shl	eax, 8
		cmp	eax, [bp+var_32]
		jl	short loc_28DE7
		mov	ax, 1
		jmp	short loc_28DE9

loc_28DE7:
		xor	ax, ax

loc_28DE9:
		or	al, al
		jz	short loc_28E44
		push	large [bp+var_32]
		push	large dword_7CA10
		push	large [bp+var_36]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_22+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_32]
		push	large dword_7CA14
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_2A+1]
		jmp	loc_28DA6

loc_28E44:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_28E4C:
		pop	si
		leave
		retf
sub_28CC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28E4F		proc far

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
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+11h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28E6B
		jmp	loc_28FEE

loc_28E6B:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		mov	eax, dword_7CA18
		sub	[bp+var_34], eax
		mov	eax, dword_7CA1C
		sub	[bp+var_30], eax
		mov	eax, dword_7CA20
		sub	[bp+var_2C], eax
		push	62F4h
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_34]
		mov	es:[bx+4], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_2C]
		mov	es:[bx+0Ch], eax
		or	byte ptr es:[bx+11h], 2
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_28EED
		jmp	loc_28FEE

loc_28EED:
		cmp	byte_778FC, 0
		jz	short loc_28F5C
		push	large [bp+var_30]
		push	large dword_7CA10
		push	large [bp+var_34]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_C+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_30]
		push	large dword_7CA14
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_14+1]

loc_28F48:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		or	byte ptr es:[bx+11h], 4
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_28FEE

loc_28F5C:
		mov	eax, [bp+var_30]
		cmp	eax, dword_77B0E
		jl	short loc_28F6C
		mov	ax, 1
		jmp	short loc_28F6E

loc_28F6C:
		xor	ax, ax

loc_28F6E:
		or	al, al
		jz	short loc_28FE6
		mov	eax, dword_7CC84
		mov	[bp+var_18], eax
		shl	eax, 8
		cmp	eax, [bp+var_30]
		jl	short loc_28F89
		mov	ax, 1
		jmp	short loc_28F8B

loc_28F89:
		xor	ax, ax

loc_28F8B:
		or	al, al
		jz	short loc_28FE6
		push	large [bp+var_30]
		push	large dword_7CA10
		push	large [bp+var_34]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_20+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_30]
		push	large dword_7CA14
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_28+1]
		jmp	loc_28F48

loc_28FE6:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_28FEE:
		pop	si
		leave
		retf
sub_28E4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28FF1		proc far

var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_2900E
		jmp	loc_291C5

loc_2900E:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_5C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_58], eax
		mov	eax, es:[si+8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_58]
		cmp	eax, dword_77B0E
		jge	short loc_2904A
		mov	ax, 1
		jmp	short loc_2904C

loc_2904A:
		xor	ax, ax

loc_2904C:
		or	al, al
		jnz	short loc_29053
		jmp	loc_29160

loc_29053:
		mov	eax, [bp+var_5C]
		mov	[bp+var_8], eax
		mov	eax, dword_77B0E
		mov	[bp+var_C], eax
		mov	ax, word_7CA0C
		mov	[bp+var_E], ax
		push	large [bp+var_C]
		push	large dword_7CA10
		push	large [bp+var_8]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		sar	eax, 8
		mov	[bp+var_22], eax
		cmp	[bp+var_22], 7D00h
		jle	short loc_290C2
		mov	[bp+var_22], 7D00h
		jmp	short loc_290D6

loc_290C2:
		cmp	[bp+var_22], 0FFFF8300h
		jge	short loc_290D6
		mov	[bp+var_22], 0FFFF8300h
		jmp	short loc_290D6

loc_290D6:
		mov	ax, word ptr [bp+var_22]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		mov	eax, [bp+var_54]
		mov	[bp+var_26], eax
		mov	eax, dword_77B0E
		mov	[bp+var_2A], eax
		mov	ax, word_7CA0E
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large dword_7CA14
		push	large [bp+var_26]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		sub	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		sar	eax, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 7D00h
		jle	short loc_29147
		mov	[bp+var_40], 7D00h
		jmp	short loc_2915B

loc_29147:
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_2915B
		mov	[bp+var_40], 0FFFF8300h
		jmp	short loc_2915B

loc_2915B:
		mov	ax, word ptr [bp+var_40]
		jmp	short loc_291B4

loc_29160:
		push	large [bp+var_58]
		push	large dword_7CA10
		push	large [bp+var_5C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	ax, word_7CA0C
		add	ax, word ptr [bp+var_48+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_58]
		push	large dword_7CA14
		push	large [bp+var_54]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	ax, word_7CA0E
		sub	ax, word ptr [bp+var_50+1]

loc_291B4:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		or	byte ptr es:[bx+11h], 4
		or	byte ptr es:[bx+11h], 8

loc_291C5:
		pop	si
		leave
		retf
sub_28FF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_291C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jnz	short loc_291FF
		mov	ax, [bp+arg_2]
		mov	[si], ax
		push	seg seg065
		push	offset sub_29278
		push	5
		movsx	eax, word ptr [si]
		push	eax
		push	large 120000h
		push	0
		call	sub_149D
		add	sp, 10h
		mov	[si+4], dx
		mov	[si+2], ax

loc_291FF:
		cmp	dword ptr [si+2], 0
		jz	short loc_2920B
		mov	ax, 1
		jmp	short loc_2920D

loc_2920B:
		xor	ax, ax

loc_2920D:
		pop	si
		pop	bp
		retf
sub_291C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29210		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jz	short loc_29236
		push	large [si+2]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_29236:
		pop	si
		pop	bp
		retf
sub_29210		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29239		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si]
		imul	ax, ax, 12h
		push	ax
		push	0
		push	large [si+2]
		call	sub_380B
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_29239		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29257		proc far
		push	bp
		mov	bp, sp
		mov	word_7CB74, 0
		mov	dword_7CB76, 0
		pop	bp
		retf
sub_29257		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2926B		proc far
		push	bp
		mov	bp, sp
		push	6444h
		push	cs
		call	near ptr sub_29210
		pop	cx
		pop	bp
		retf
sub_2926B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29278		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_29297
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_292B4

loc_29297:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+11h], 0FDh
		and	byte ptr es:[bx+11h], 0FBh
		and	byte ptr es:[bx+11h], 0F7h
sub_29278		endp

; START OF FUNCTION CHUNK FOR sub_29278
		db 26h
; END OF FUNCTION CHUNK FOR sub_29278
seg065		ends
