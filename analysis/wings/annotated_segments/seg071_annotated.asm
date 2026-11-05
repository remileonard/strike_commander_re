seg071		segment	para public 'CODE' use16
		assume cs:seg071
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 46h, 6, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33296		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_33296		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3329B		proc far

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
		jz	short loc_332B7
		jmp	loc_33428

loc_332B7:
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
		call	Math_Helper_3CB86
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
		jz	short loc_33325
		jmp	loc_33428

loc_33325:
		cmp	byte_5C354, 0
		jz	short loc_33395
		push	large [bp+var_32]
		push	large dword_5FF62
		push	large [bp+var_36]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_E+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_32]
		push	large dword_5FF66
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_16+1]

loc_33381:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		or	byte ptr es:[bx+29h], 4
		and	byte ptr es:[bx+29h], 0F7h
		jmp	loc_33428

loc_33395:
		mov	eax, [bp+var_32]
		cmp	eax, dword_5C382
		jl	short loc_333A5
		mov	ax, 1
		jmp	short loc_333A7

loc_333A5:
		xor	ax, ax

loc_333A7:
		or	al, al
		jz	short loc_33420
		mov	eax, dword_60174
		mov	[bp+var_1A], eax
		shl	eax, 8
		cmp	eax, [bp+var_32]
		jl	short loc_333C2
		mov	ax, 1
		jmp	short loc_333C4

loc_333C2:
		xor	ax, ax

loc_333C4:
		or	al, al
		jz	short loc_33420
		push	large [bp+var_32]
		push	large dword_5FF62
		push	large [bp+var_36]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_22+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_32]
		push	large dword_5FF66
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_2A+1]
		jmp	loc_33381

loc_33420:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+29h], 8

loc_33428:
		pop	si
		leave
		retf
sub_3329B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3342B		proc far

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
		jz	short loc_33447
		jmp	loc_335CC

loc_33447:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		mov	eax, dword_5FF6A
		sub	[bp+var_34], eax
		mov	eax, dword_5FF6E
		sub	[bp+var_30], eax
		mov	eax, dword_5FF72
		sub	[bp+var_2C], eax
		push	6256h
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
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
		jz	short loc_334C9
		jmp	loc_335CC

loc_334C9:
		cmp	byte_5C354, 0
		jz	short loc_33539
		push	large [bp+var_30]
		push	large dword_5FF62
		push	large [bp+var_34]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_C+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_30]
		push	large dword_5FF66
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_14+1]

loc_33525:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		or	byte ptr es:[bx+29h], 4
		and	byte ptr es:[bx+29h], 0F7h
		jmp	loc_335CC

loc_33539:
		mov	eax, [bp+var_30]
		cmp	eax, dword_5C382
		jl	short loc_33549
		mov	ax, 1
		jmp	short loc_3354B

loc_33549:
		xor	ax, ax

loc_3354B:
		or	al, al
		jz	short loc_335C4
		mov	eax, dword_60174
		mov	[bp+var_18], eax
		shl	eax, 8
		cmp	eax, [bp+var_30]
		jl	short loc_33566
		mov	ax, 1
		jmp	short loc_33568

loc_33566:
		xor	ax, ax

loc_33568:
		or	al, al
		jz	short loc_335C4
		push	large [bp+var_30]
		push	large dword_5FF62
		push	large [bp+var_34]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_20+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_30]
		push	large dword_5FF66
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_28+1]
		jmp	loc_33525

loc_335C4:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+29h], 8

loc_335CC:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		cmp	ax, word_6019A
		jb	short loc_3360F
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		cmp	ax, word_6019C
		ja	short loc_3360F
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		cmp	ax, word_60196
		jb	short loc_3360F
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		cmp	ax, word_60198
		ja	short loc_3360F
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+20h]
		cmp	eax, dword_6019E
		jge	short loc_33615

loc_3360F:
		mov	word_5C345, 1

loc_33615:
		pop	si
		leave
		retf
sub_3342B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33618		proc far

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
		jz	short loc_33635
		jmp	loc_337EE

loc_33635:
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
		cmp	eax, dword_5C382
		jge	short loc_33671
		mov	ax, 1
		jmp	short loc_33673

loc_33671:
		xor	ax, ax

loc_33673:
		or	al, al
		jnz	short loc_3367A
		jmp	loc_33788

loc_3367A:
		mov	eax, [bp+var_5C]
		mov	[bp+var_8], eax
		mov	eax, dword_5C382
		mov	[bp+var_C], eax
		mov	ax, word_5FF5E
		mov	[bp+var_E], ax
		push	large [bp+var_C]
		push	large dword_5FF62
		push	large [bp+var_8]
		call	Math_FixedMulDiv_3C82C
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
		jle	short loc_336E9
		mov	[bp+var_22], 7D00h
		jmp	short loc_336FD

loc_336E9:
		cmp	[bp+var_22], 0FFFF8300h
		jge	short loc_336FD
		mov	[bp+var_22], 0FFFF8300h
		jmp	short loc_336FD

loc_336FD:
		mov	ax, word ptr [bp+var_22]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		mov	eax, [bp+var_54]
		mov	[bp+var_26], eax
		mov	eax, dword_5C382
		mov	[bp+var_2A], eax
		mov	ax, word_5FF60
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large dword_5FF66
		push	large [bp+var_26]
		call	Math_FixedMulDiv_3C82C
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
		jle	short loc_3376F
		mov	[bp+var_40], 7D00h
		jmp	short loc_33783

loc_3376F:
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_33783
		mov	[bp+var_40], 0FFFF8300h
		jmp	short loc_33783

loc_33783:
		mov	ax, word ptr [bp+var_40]
		jmp	short loc_337DD

loc_33788:
		push	large [bp+var_58]
		push	large dword_5FF62
		push	large [bp+var_5C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_48+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		push	large [bp+var_58]
		push	large dword_5FF66
		push	large [bp+var_54]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_50+1]

loc_337DD:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], ax
		or	byte ptr es:[bx+29h], 4
		or	byte ptr es:[bx+29h], 8

loc_337EE:
		pop	si
		leave
		retf
sub_33618		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_337F1		proc far

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
		jz	short loc_3380D
		jmp	loc_3397E

loc_3380D:
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
		call	Math_Helper_3CB86
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+5], eax
		mov	eax, [bp+var_32]
		mov	es:[bx+9], eax
		mov	eax, [bp+var_2E]
		mov	es:[bx+0Dh], eax
		or	byte ptr es:[bx+11h], 2
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_3387B
		jmp	loc_3397E

loc_3387B:
		cmp	byte_5C354, 0
		jz	short loc_338EB
		push	large [bp+var_32]
		push	large dword_5FF62
		push	large [bp+var_36]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_E+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], ax
		push	large [bp+var_32]
		push	large dword_5FF66
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_16+1]

loc_338D7:
		les	bx, [bp+arg_0]
		mov	es:[bx+3], ax
		or	byte ptr es:[bx+11h], 4
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_3397E

loc_338EB:
		mov	eax, [bp+var_32]
		cmp	eax, dword_5C382
		jl	short loc_338FB
		mov	ax, 1
		jmp	short loc_338FD

loc_338FB:
		xor	ax, ax

loc_338FD:
		or	al, al
		jz	short loc_33976
		mov	eax, dword_60174
		mov	[bp+var_1A], eax
		shl	eax, 8
		cmp	eax, [bp+var_32]
		jl	short loc_33918
		mov	ax, 1
		jmp	short loc_3391A

loc_33918:
		xor	ax, ax

loc_3391A:
		or	al, al
		jz	short loc_33976
		push	large [bp+var_32]
		push	large dword_5FF62
		push	large [bp+var_36]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_22+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], ax
		push	large [bp+var_32]
		push	large dword_5FF66
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_2A+1]
		jmp	loc_338D7

loc_33976:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_3397E:
		pop	si
		leave
		retf
sub_337F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33981		proc far

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
		jz	short loc_3399D
		jmp	loc_33B22

loc_3399D:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		mov	eax, dword_5FF6A
		sub	[bp+var_34], eax
		mov	eax, dword_5FF6E
		sub	[bp+var_30], eax
		mov	eax, dword_5FF72
		sub	[bp+var_2C], eax
		push	6256h
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_34]
		mov	es:[bx+5], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+9], eax
		mov	eax, [bp+var_2C]
		mov	es:[bx+0Dh], eax
		or	byte ptr es:[bx+11h], 2
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_33A1F
		jmp	loc_33B22

loc_33A1F:
		cmp	byte_5C354, 0
		jz	short loc_33A8F
		push	large [bp+var_30]
		push	large dword_5FF62
		push	large [bp+var_34]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_C+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], ax
		push	large [bp+var_30]
		push	large dword_5FF66
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_14+1]

loc_33A7B:
		les	bx, [bp+arg_0]
		mov	es:[bx+3], ax
		or	byte ptr es:[bx+11h], 4
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_33B22

loc_33A8F:
		mov	eax, [bp+var_30]
		cmp	eax, dword_5C382
		jl	short loc_33A9F
		mov	ax, 1
		jmp	short loc_33AA1

loc_33A9F:
		xor	ax, ax

loc_33AA1:
		or	al, al
		jz	short loc_33B1A
		mov	eax, dword_60174
		mov	[bp+var_18], eax
		shl	eax, 8
		cmp	eax, [bp+var_30]
		jl	short loc_33ABC
		mov	ax, 1
		jmp	short loc_33ABE

loc_33ABC:
		xor	ax, ax

loc_33ABE:
		or	al, al
		jz	short loc_33B1A
		push	large [bp+var_30]
		push	large dword_5FF62
		push	large [bp+var_34]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_20+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], ax
		push	large [bp+var_30]
		push	large dword_5FF66
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_28+1]
		jmp	loc_33A7B

loc_33B1A:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_33B22:
		pop	si
		leave
		retf
sub_33981		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33B25		proc far

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
		jz	short loc_33B42
		jmp	loc_33CFB

loc_33B42:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 5
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
		cmp	eax, dword_5C382
		jge	short loc_33B7E
		mov	ax, 1
		jmp	short loc_33B80

loc_33B7E:
		xor	ax, ax

loc_33B80:
		or	al, al
		jnz	short loc_33B87
		jmp	loc_33C95

loc_33B87:
		mov	eax, [bp+var_5C]
		mov	[bp+var_8], eax
		mov	eax, dword_5C382
		mov	[bp+var_C], eax
		mov	ax, word_5FF5E
		mov	[bp+var_E], ax
		push	large [bp+var_C]
		push	large dword_5FF62
		push	large [bp+var_8]
		call	Math_FixedMulDiv_3C82C
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
		jle	short loc_33BF6
		mov	[bp+var_22], 7D00h
		jmp	short loc_33C0A

loc_33BF6:
		cmp	[bp+var_22], 0FFFF8300h
		jge	short loc_33C0A
		mov	[bp+var_22], 0FFFF8300h
		jmp	short loc_33C0A

loc_33C0A:
		mov	ax, word ptr [bp+var_22]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], ax
		mov	eax, [bp+var_54]
		mov	[bp+var_26], eax
		mov	eax, dword_5C382
		mov	[bp+var_2A], eax
		mov	ax, word_5FF60
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large dword_5FF66
		push	large [bp+var_26]
		call	Math_FixedMulDiv_3C82C
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
		jle	short loc_33C7C
		mov	[bp+var_40], 7D00h
		jmp	short loc_33C90

loc_33C7C:
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_33C90
		mov	[bp+var_40], 0FFFF8300h
		jmp	short loc_33C90

loc_33C90:
		mov	ax, word ptr [bp+var_40]
		jmp	short loc_33CEA

loc_33C95:
		push	large [bp+var_58]
		push	large dword_5FF62
		push	large [bp+var_5C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	ax, word_5FF5E
		add	ax, word ptr [bp+var_48+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], ax
		push	large [bp+var_58]
		push	large dword_5FF66
		push	large [bp+var_54]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	ax, word_5FF60
		sub	ax, word ptr [bp+var_50+1]

loc_33CEA:
		les	bx, [bp+arg_0]
		mov	es:[bx+3], ax
		or	byte ptr es:[bx+11h], 4
		or	byte ptr es:[bx+11h], 8

loc_33CFB:
		pop	si
		leave
		retf
sub_33B25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33CFE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jnz	short loc_33D35
		mov	ax, [bp+arg_2]
		mov	[si], ax
		push	seg seg071
		push	offset sub_33DAE
		push	5
		movsx	eax, word ptr [si]
		push	eax
		push	large 120000h
		push	0
		call	sub_3846
		add	sp, 10h
		mov	[si+4], dx
		mov	[si+2], ax

loc_33D35:
		cmp	dword ptr [si+2], 0
		jz	short loc_33D41
		mov	ax, 1
		jmp	short loc_33D43

loc_33D41:
		xor	ax, ax

loc_33D43:
		pop	si
		pop	bp
		retf
sub_33CFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D46		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jz	short loc_33D6C
		push	large [si+2]
		call	sub_349
		add	sp, 4
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_33D6C:
		pop	si
		pop	bp
		retf
sub_33D46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D6F		proc far

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
		call	sub_3651
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_33D6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D8D		proc far
		push	bp
		mov	bp, sp
		mov	word_60080, 0
		mov	dword_60082, 0
		pop	bp
		retf
sub_33D8D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33DA1		proc far
		push	bp
		mov	bp, sp
		push	6360h
		push	cs
		call	near ptr sub_33D46
		pop	cx
		pop	bp
		retf
sub_33DA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33DAE		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_33DCD
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_33DEE

loc_33DCD:
		mov	ax, word ptr [bp+arg_0]
		inc	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+11h], 0FDh
		and	byte ptr es:[bx+11h], 0FBh
		and	byte ptr es:[bx+11h], 0F7h
		and	byte ptr es:[bx+11h], 0FEh
sub_33DAE		endp

; START OF FUNCTION CHUNK FOR sub_33DAE

loc_33DEE:
		db 8Bh
		push	si
; END OF FUNCTION CHUNK FOR sub_33DAE
seg071		ends
