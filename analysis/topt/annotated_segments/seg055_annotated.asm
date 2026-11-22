seg055		segment	para public 'CODE' use16
		assume cs:seg055
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C4h, 8

loc_21E32:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21E34		proc far

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
		jz	short loc_21E50
		jmp	loc_2201A

loc_21E50:
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
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	Math_Helper_2BB12
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_32]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_2E]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_21ECC
		jmp	loc_2201A

loc_21ECC:
		cmp	byte_4C120, 0
		jnz	short loc_21ED6
		jmp	loc_21F56

loc_21ED6:
		push	large [bp+var_32]
		push	large dword_4F164
		push	large [bp+var_36]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		mov	ax, word_4F160
		add	ax, word ptr [bp+var_E+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_32]
		push	large dword_4F168
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	ax, word_4F162
		sub	ax, word ptr [bp+var_16+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_2201A

loc_21F56:
		mov	eax, [bp+var_32]
		cmp	eax, dword_4C156
		jl	short loc_21F66
		mov	ax, 1
		jmp	short loc_21F68

loc_21F66:
		xor	ax, ax

loc_21F68:
		or	al, al
		jnz	short loc_21F6F
		jmp	loc_22012

loc_21F6F:
		mov	eax, dword_4F304
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		shl	eax, 8
		cmp	eax, [bp+var_32]
		jl	short loc_21F8A
		mov	ax, 1
		jmp	short loc_21F8C

loc_21F8A:
		xor	ax, ax

loc_21F8C:
		or	al, al
		jnz	short loc_21F93
		jmp	loc_22012

loc_21F93:
		push	large [bp+var_32]
		push	large dword_4F164
		push	large [bp+var_36]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	ax, word_4F160
		add	ax, word ptr [bp+var_22+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_32]
		push	large dword_4F168
		push	large [bp+var_2E]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	ax, word_4F162
		sub	ax, word ptr [bp+var_2A+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	short loc_2201A

loc_22012:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_2201A:
		pop	si
		leave
		retf
sub_21E34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2201D		proc far

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
		jz	short loc_22039
		jmp	loc_22215

loc_22039:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	si, word ptr [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		mov	eax, dword_4F16C
		sub	[bp+var_34], eax
		mov	eax, dword_4F170
		sub	[bp+var_30], eax
		mov	eax, dword_4F174
		sub	[bp+var_2C], eax
		push	6798h
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_34]
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_30]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_2C]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_220C7
		jmp	loc_22215

loc_220C7:
		cmp	byte_4C120, 0
		jnz	short loc_220D1
		jmp	loc_22151

loc_220D1:
		push	large [bp+var_30]
		push	large dword_4F164
		push	large [bp+var_34]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word_4F160
		add	ax, word ptr [bp+var_C+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_30]
		push	large dword_4F168
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	ax, word_4F162
		sub	ax, word ptr [bp+var_14+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_22215

loc_22151:
		mov	eax, [bp+var_30]
		cmp	eax, dword_4C156
		jl	short loc_22161
		mov	ax, 1
		jmp	short loc_22163

loc_22161:
		xor	ax, ax

loc_22163:
		or	al, al
		jnz	short loc_2216A
		jmp	loc_2220D

loc_2216A:
		mov	eax, dword_4F304
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		shl	eax, 8
		cmp	eax, [bp+var_30]
		jl	short loc_22185
		mov	ax, 1
		jmp	short loc_22187

loc_22185:
		xor	ax, ax

loc_22187:
		or	al, al
		jnz	short loc_2218E
		jmp	loc_2220D

loc_2218E:
		push	large [bp+var_30]
		push	large dword_4F164
		push	large [bp+var_34]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	ax, word_4F160
		add	ax, word ptr [bp+var_20+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_30]
		push	large dword_4F168
		push	large [bp+var_2C]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	ax, word_4F162
		sub	ax, word ptr [bp+var_28+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	short loc_22215

loc_2220D:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_22215:
		pop	si
		leave
		retf
sub_2201D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22218		proc far

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
		jz	short loc_22235
		jmp	loc_22439

loc_22235:
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
		cmp	eax, dword_4C156
		jge	short loc_22271
		mov	ax, 1
		jmp	short loc_22273

loc_22271:
		xor	ax, ax

loc_22273:
		or	al, al
		jnz	short loc_2227A
		jmp	loc_223BC

loc_2227A:
		mov	eax, [bp+var_5C]
		mov	[bp+var_8], eax
		mov	eax, dword_4C156
		mov	[bp+var_C], eax
		mov	ax, word_4F160
		mov	[bp+var_E], ax
		push	large [bp+var_C]
		push	large dword_4F164
		push	large [bp+var_8]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		sar	eax, 8
		mov	[bp+var_22], eax
		cmp	[bp+var_22], 7D00h
		jle	short loc_222F6
		mov	[bp+var_22], 7D00h
		jmp	short loc_2230A

loc_222F6:
		cmp	[bp+var_22], 0FFFF8300h
		jge	short loc_2230A
		mov	[bp+var_22], 0FFFF8300h
		jmp	short loc_2230A

loc_2230A:
		mov	ax, word ptr [bp+var_22]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		mov	eax, [bp+var_54]
		mov	[bp+var_26], eax
		mov	eax, dword_4C156
		mov	[bp+var_2A], eax
		mov	ax, word_4F162
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large dword_4F168
		push	large [bp+var_26]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		sub	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		sar	eax, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 7D00h
		jle	short loc_2238C
		mov	[bp+var_40], 7D00h
		jmp	short loc_223A0

loc_2238C:
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_223A0
		mov	[bp+var_40], 0FFFF8300h
		jmp	short loc_223A0

loc_223A0:
		mov	ax, word ptr [bp+var_40]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8
		jmp	short loc_22439

loc_223BC:
		push	large [bp+var_58]
		push	large dword_4F164
		push	large [bp+var_5C]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	ax, word_4F160
		add	ax, word ptr [bp+var_48+1]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	large [bp+var_58]
		push	large dword_4F168
		push	large [bp+var_54]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	ax, word_4F162
		sub	ax, word ptr [bp+var_50+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+11h], 8

loc_22439:
		pop	si
		leave
		retf
sub_22218		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2243C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jnz	short loc_22471
		mov	ax, [bp+arg_2]
		mov	[si], ax
		push	seg seg055
		push	offset sub_224F6
		push	5
		movsx	eax, word ptr [si]
		push	eax
		push	12h
		push	0
		push	0
		call	sub_1474
		add	sp, 10h
		mov	[si+4], dx
		mov	[si+2], ax

loc_22471:
		cmp	dword ptr [si+2], 0
		jz	short loc_2247D
		mov	ax, 1
		jmp	short loc_2247F

loc_2247D:
		xor	ax, ax

loc_2247F:
		pop	si
		pop	bp
		retf
sub_2243C		endp

; START OF FUNCTION CHUNK FOR sub_2243C
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2243C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22485		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jz	short loc_224AD
		push	word ptr [si+4]
		push	word ptr [si+2]
		call	sub_3AA
		add	sp, 4
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_224AD:
		pop	si
		pop	bp
		retf
sub_22485		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_224B0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	dx, 12h
		imul	dx
		push	ax
		push	0
		push	word ptr [si+4]
		push	word ptr [si+2]
		call	sub_358D
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_224B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_224D3		proc far
		push	bp
		mov	bp, sp
		mov	word_4F25A, 0
		mov	dword_4F25C, 0
		pop	bp
		retf
sub_224D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_224E7		proc far
		push	bp
		mov	bp, sp
		push	687Ah
		push	cs
		call	near ptr sub_22485
		add	sp, 2
		pop	bp
		retf
sub_224E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_224F6		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_22515
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_2253B

loc_22515:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+11h], 0FDh
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+11h], 0FBh
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+11h], 0F7h
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+11h], 0FEh

loc_2253B:
		mov	dx, word ptr [bp+arg_0+2]
sub_224F6		endp

; START OF FUNCTION CHUNK FOR sub_224F6
		db 8Bh
		inc	si
; END OF FUNCTION CHUNK FOR sub_224F6
seg055		ends
