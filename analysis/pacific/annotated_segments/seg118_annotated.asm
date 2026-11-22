seg118		segment	para public 'CODE' use16
		assume cs:seg118
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2

loc_4DC01:
		db 0EBh, 0

loc_4DC03:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DC07		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4DC4F
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1EFCh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_40242
		add	sp, 6
		test	si, 1
		jz	short loc_4DC4F
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4DC4F:
		pop	si
		leave
		retf
sub_4DC07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DC52		proc far
		push	bp
		mov	bp, sp
		xor	ax, ax
		pop	bp
		retf
sub_4DC52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DC59		proc far
		push	bp
		mov	bp, sp
		mov	al, 0Dh
		pop	bp
		retf
sub_4DC59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DC60		proc far

var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_36		= dword ptr -36h
var_34		= dword ptr -34h
var_32		= dword ptr -32h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_22		= dword ptr -22h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
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
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 0C6h
		push	si
		push	di
		mov	di, [bp+arg_8]
		mov	si, [bp+arg_A]
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 73h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 7Fh
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 85h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		cmp	[bp+arg_E], 0
		jz	short loc_4DCC7
		jmp	loc_4E17F

loc_4DCC7:
		or	si, si
		jnz	short loc_4DCCE
		jmp	loc_4E15D

loc_4DCCE:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_1C+2], ax
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		lea	ax, word ptr [bp+var_8A]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_8A]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_82]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_82], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_96]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_8A]
		add	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		add	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_82]
		add	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		or	di, di
		jnz	short loc_4DD90
		jmp	loc_4E13B

loc_4DD90:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_A2]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_8A]
		sub	eax, [bp+var_A2]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		sub	eax, [bp+var_9E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_82]
		sub	eax, [bp+var_9A]
		mov	[bp+var_82], eax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_8A]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	[bp+var_1E], 0
		mov	[bp+var_22], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_AA], eax
		mov	eax, dword_7942B
		mov	[bp+var_A6], eax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_AE]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		add	di, 12h
		add	si, 12h
		mov	eax, [di]
		sub	eax, [si]
		mov	[bp+var_BA], eax
		mov	eax, [di+4]
		sub	eax, [si+4]
		mov	[bp+var_B6], eax
		mov	eax, [di+8]
		sub	eax, [si+8]
		mov	[bp+var_B2], eax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		cmp	[bp+var_AA], 0
		jnz	short loc_4DE62
		mov	ax, 1
		jmp	short loc_4DE64

loc_4DE62:
		xor	ax, ax

loc_4DE64:
		or	al, al
		jz	short loc_4DED4
		mov	eax, [bp+var_B6]
		mov	edx, eax
		mov	ecx, [bp+var_86]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jge	short loc_4DE90
		mov	ax, 1
		jmp	short loc_4DE92

loc_4DE90:
		xor	ax, ax

loc_4DE92:
		or	al, al
		jnz	short loc_4DE99
		jmp	loc_4E073

loc_4DE99:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4DEA4
		mov	ax, si
		jmp	short loc_4DEAE

loc_4DEA4:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DEAE:
		or	ax, ax
		jnz	short loc_4DEB5
		jmp	loc_4E397

loc_4DEB5:
		mov	eax, dword_79CD4
		mov	[si], eax
		mov	eax, dword_79CD8
		mov	[si+4], eax
		mov	eax, dword_79CDC

loc_4DEC8:
		mov	[si+8], eax
		mov	ax, si
		jmp	loc_4E399
		jmp	loc_4E397

loc_4DED4:
		mov	eax, [bp+var_86]
		mov	edx, [bp+var_86]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_AA]
		mov	edx, [bp+var_B6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		shl	eax, 1
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_26]
		add	eax, [bp+var_2A]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jge	short loc_4DF23
		mov	ax, 1
		jmp	short loc_4DF25

loc_4DF23:
		xor	ax, ax

loc_4DF25:
		or	al, al
		jz	short loc_4DF4B
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4DF34
		mov	ax, si
		jmp	short loc_4DF3E

loc_4DF34:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4DF3E:
		or	ax, ax
		jnz	short loc_4DF45
		jmp	loc_4E397

loc_4DF45:
		jmp	loc_4DEB5
		jmp	loc_4E397

loc_4DF4B:
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2E]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_2E]
		mov	[bp+var_26], eax
		sub	eax, [bp+var_86]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_26]
		add	eax, [bp+var_86]
		mov	[bp+var_3A], eax
		neg	eax
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	[bp+var_36], eax
		cmp	[bp+var_AA], 0
		jge	short loc_4DF96
		mov	ax, 1
		jmp	short loc_4DF98

loc_4DF96:
		xor	ax, ax

loc_4DF98:
		or	al, al
		jz	short loc_4DFD7
		mov	eax, [bp+var_32]
		neg	eax
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_32], eax
		mov	eax, [bp+var_36]
		neg	eax
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_AA]
		neg	eax
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		mov	[bp+var_AA], eax

loc_4DFD7:
		cmp	[bp+var_32], 0
		jle	short loc_4DFE3
		mov	ax, 1
		jmp	short loc_4DFE5

loc_4DFE3:
		xor	ax, ax

loc_4DFE5:
		or	al, al
		jz	short loc_4E01E
		cmp	[bp+var_36], 0
		jle	short loc_4DFF5
		mov	ax, 1
		jmp	short loc_4DFF7

loc_4DFF5:
		xor	ax, ax

loc_4DFF7:
		or	al, al
		jz	short loc_4E010
		mov	eax, [bp+var_36]
		cmp	eax, [bp+var_32]
		jle	short loc_4E00A
		mov	ax, 1
		jmp	short loc_4E00C

loc_4E00A:
		xor	ax, ax

loc_4E00C:
		or	al, al
		jz	short loc_4E030

loc_4E010:
		mov	eax, [bp+var_32]

loc_4E014:
		mov	[bp+var_26], eax
		jmp	short loc_4E058
		jmp	short loc_4E030
		jmp	short loc_4E010

loc_4E01E:
		cmp	[bp+var_36], 0
		jle	short loc_4E02A
		mov	ax, 1
		jmp	short loc_4E02C

loc_4E02A:
		xor	ax, ax

loc_4E02C:
		or	al, al
		jz	short loc_4E036

loc_4E030:
		mov	eax, [bp+var_36]
		jmp	short loc_4E014

loc_4E036:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4E041
		mov	ax, si
		jmp	short loc_4E04B

loc_4E041:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4E04B:
		or	ax, ax
		jnz	short loc_4E052
		jmp	loc_4E397

loc_4E052:
		jmp	loc_4DEB5
		jmp	loc_4E397

loc_4E058:
		mov	eax, [bp+var_26]
		mov	edx, eax
		mov	ecx, [bp+var_AA]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax

loc_4E073:
		mov	eax, [bp+var_B6]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_AE]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_C6]
		sar	eax, 1
		mov	[bp+var_C6], eax
		add	eax, [bp+var_8A]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_C6]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_A6]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_BE]
		sar	eax, 1
		mov	[bp+var_BE], eax
		add	eax, [bp+var_82]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_BE]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BE], eax
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4E10E
		mov	ax, si
		jmp	short loc_4E118

loc_4E10E:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4E118:
		or	ax, ax
		jnz	short loc_4E11F
		jmp	loc_4E397

loc_4E11F:
		mov	eax, [bp+var_C6]
		mov	[si], eax
		mov	eax, [bp+var_C2]
		mov	[si+4], eax
		mov	eax, [bp+var_BE]
		jmp	loc_4DEC8
		jmp	loc_4E397

loc_4E13B:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4E146
		mov	ax, si
		jmp	short loc_4E150

loc_4E146:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4E150:
		or	ax, ax
		jnz	short loc_4E157
		jmp	loc_4E397

loc_4E157:
		jmp	loc_4DEB5
		jmp	loc_4E397

loc_4E15D:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4E168
		mov	ax, si
		jmp	short loc_4E172

loc_4E168:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4E172:
		or	ax, ax
		jnz	short loc_4E179
		jmp	loc_4E397

loc_4E179:
		jmp	loc_4DEB5
		jmp	loc_4E397

loc_4E17F:
		or	si, si
		jnz	short loc_4E186
		jmp	loc_4E368

loc_4E186:
		mov	bx, [bp+arg_C]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_66], eax
		mov	eax, [di+4]
		mov	[bp+var_62], eax
		mov	eax, [di+8]
		mov	[bp+var_5E], eax
		lea	ax, word ptr [bp+var_66]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_66]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_62]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		mov	eax, [bp+var_5E]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5E], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_72]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_66]
		add	eax, [bp+var_72]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_62]
		add	eax, [bp+var_6E]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_5E]
		add	eax, [bp+var_6A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		mov	edx, [bp+var_76]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, dword_7942B
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		shl	eax, 1
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		sub	eax, [bp+var_24]
		mov	[bp+var_20], eax
		mov	[bp+var_28], 0
		cmp	eax, [bp+var_28]
		jl	short loc_4E295
		mov	ax, 1
		jmp	short loc_4E297

loc_4E295:
		xor	ax, ax

loc_4E297:
		or	al, al
		jz	short loc_4E2BF
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_2C]
		neg	eax
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_20], eax

loc_4E2BF:
		mov	eax, [bp+var_20]
		sub	eax, [bp+var_76]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, dword_7942B
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_20], eax
		mov	eax, [bp+var_66]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_62]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		mov	bx, [bp+arg_C]
		mov	eax, [bx]
		neg	eax
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	[bp+var_5E], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4E342
		mov	ax, si
		jmp	short loc_4E34C

loc_4E342:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4E34C:
		or	ax, ax
		jz	short loc_4E397
		mov	eax, [bp+var_66]
		mov	[si], eax
		mov	eax, [bp+var_62]
		mov	[si+4], eax
		mov	eax, [bp+var_5E]
		jmp	loc_4DEC8
		jmp	short loc_4E397

loc_4E368:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4E373
		mov	ax, si
		jmp	short loc_4E37D

loc_4E373:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4E37D:
		or	ax, ax
		jz	short loc_4E397
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		jmp	loc_4DEC8

loc_4E397:
		mov	ax, si

loc_4E399:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_4DC60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E3A3		proc far

arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_7CADA
		jz	short loc_4E3BB
		dec	word_7978F

loc_4E3BB:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_4E3A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E3C0		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jnz	short loc_4E3D8
		jmp	loc_4E469

loc_4E3D8:
		cmp	si, word_7CADA
		jnz	short loc_4E3EE
		cmp	byte_7CEF8, 4
		jnz	short loc_4E3EE
		push	0
		push	large 0
		push	8
		jmp	short loc_4E461

loc_4E3EE:
		mov	si, [bp+arg_4]
		add	si, 12h
		mov	di, word_7CEF9
		add	di, 14h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_20], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		push	eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	[bp+var_4], eax
		push	0
		push	eax
		push	9

loc_4E461:
		call	sub_5EB62
		add	sp, 8

loc_4E469:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_4E3C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ParticleEmitter_Reset (sub_4E041 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,26L — remet à
; zéro 4 champs de compteur/timer (+0x2C/0x30/0x34/0x38), positionne des flags (+4 bits
; 0/3/5/2) : reset d'un émetteur de particules (compteurs de génération + flags de mode).
; ==============================================================================================
ParticleEmitter_Reset		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+35h], eax
		mov	[si+31h], eax
		mov	[si+2Dh], eax
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+39h], eax
		mov	dword ptr [si+3Dh], 0
		or	byte ptr [si+2], 1
		or	byte ptr [si+2], 8
		or	byte ptr [si+2], 20h
		or	byte ptr [si+2], 4
		pop	si
		leave
		retf
ParticleEmitter_Reset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ParticleEmitter_CopyRateParam (sub_4E085 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,16L
; — copie un champ (+0x62 depuis une source référencée) vers +0x40 : copie d'un paramètre de
; configuration (probable taux d'émission) depuis une source.
; ==============================================================================================
ParticleEmitter_CopyRateParam		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+6Bh]
		mov	[si+41h], eax
		pop	si
		pop	bp
		retf
ParticleEmitter_CopyRateParam		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E4C9		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	sub_36985
		add	sp, 6
		push	si
		push	cs
		call	near ptr ParticleEmitter_Reset
		pop	cx
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr ParticleEmitter_CopyRateParam
		add	sp, 6
		or	byte ptr [si+2], 4
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 73h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[si+3Dh], eax
		pop	si
		leave
		retf
sub_4E4C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E513		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, [si+0Eh]
		mov	ax, es:[bx+59h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		mov	ax, es:[bx+89h]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_4], edx
		mov	di, si
		add	di, 3Dh
		mov	eax, [di]
		mov	[bp+var_C], eax
		sar	eax, 1
		mov	[bp+var_C], eax
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 73h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	[bp+var_18], 80h
		mov	eax, [bp+var_18]
		add	[bp+var_C], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+var_4+1]
		pop	di
		pop	si
		leave
		retf
sub_4E513		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E5C0		proc far

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
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_6]
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	di
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_4E641
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 85h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		les	bx, [si+0Eh]
		mov	eax, es:[bx+7Bh]
		mov	[bp+var_20], eax
		mov	ax, word ptr [bp+var_20]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_24], eax
		mov	eax, [bp+var_4]
		add	eax, [bp+var_24]
		mov	[bp+var_4], eax

loc_4E641:
		mov	cx, [bp+arg_6]
		mov	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	bx, cx
		mov	[bx], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	bx, cx
		mov	[bx+4], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	bx, cx
		mov	[bx+8], eax
		mov	cx, [bp+arg_6]
		mov	ax, [bp+arg_6]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		add	eax, [bp+var_30]
		mov	bx, cx
		mov	[bx], eax
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		add	eax, [bp+var_2C]
		mov	bx, cx
		mov	[bx+4], eax
		mov	bx, [bp+var_10]
		mov	eax, [bx+8]
		add	eax, [bp+var_28]
		mov	bx, cx
		mov	[bx+8], eax
		mov	cx, [bp+arg_6]
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+2Dh], eax
		mov	eax, [bx+4]
		mov	[si+31h], eax
		mov	eax, [bx+8]
		mov	[si+35h], eax
		mov	cx, si
		add	cx, 12h
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_14], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	bx, [bp+var_14]
		add	eax, [bx]
		mov	bx, cx
		mov	[bx], eax
		mov	bx, [bp+var_12]
		mov	eax, [bx+4]
		mov	bx, [bp+var_14]
		add	eax, [bx+4]
		mov	bx, cx
		mov	[bx+4], eax
		mov	bx, [bp+var_12]
		mov	eax, [bx+8]
		mov	bx, [bp+var_14]
		add	eax, [bx+8]
		mov	bx, cx
		mov	[bx+8], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_3C]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_3C]
		add	[si+12h], eax
		mov	eax, [bp+var_38]
		add	[si+16h], eax
		mov	eax, [bp+var_34]
		add	[si+1Ah], eax
		mov	di, si
		add	di, 2Dh
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 7Fh
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [di]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_44]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	di, si
		add	di, 12h
		add	si, 12h
		mov	eax, [si]
		add	eax, [bp+var_48]
		mov	[di], eax
		mov	eax, [si+4]
		add	eax, [bp+var_44]
		mov	[di+4], eax
		mov	eax, [si+8]
		add	eax, [bp+var_40]
		mov	[di+8], eax
		pop	di
		pop	si
		leave
		retf
sub_4E5C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_ComputeSpawnAtAttachPoint (sub_4E3F3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,41L
; — résout la position d'un point d'attache (vtable[0x3C]) puis calcule le spawn (sub_4E192) :
; wrapper de calcul de position de particule à un point d'attache — appelé par
; HUD_RenderSymbologyMain (probable effet de fumée/étincelle du réticule ou d'un composant
; endommagé affiché au HUD).
; ==============================================================================================
Particle_ComputeSpawnAtAttachPoint		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_4E5C0
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
Particle_ComputeSpawnAtAttachPoint		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E86B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0Dh
		pop	bp
		retf
sub_4E86B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E875		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+45h]
		pop	si
		pop	bp
		retf
sub_4E875		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E882		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E8B9
		mov	word ptr [si], 22A4h
		mov	ax, si
		add	ax, 45h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_7418A
		add	sp, 4
		test	di, 1
		jz	short loc_4E8B9
		push	si
		call	sub_3B2
		pop	cx

loc_4E8B9:
		pop	di
		pop	si
		pop	bp
		retf
sub_4E882		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_IntegrateWindDrift (sub_4E48E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,94L — intègre un
; vecteur de vitesse globale (dword_6FFD7) mis à l'échelle du delta-temps physique
; (dword_70458), avec une constante négative (-7) : intégration de la dérive du vent sur les
; particules émises.
; ==============================================================================================
Particle_IntegrateWindDrift		proc far

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

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, dword_7942B
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	[bp+var_10], 0FFFFFFF9h
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	si, cx
		add	si, 2Dh
		mov	eax, [si]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	si, cx
		add	si, 2Dh
		mov	di, cx
		add	di, 2Dh
		mov	eax, [di]
		add	eax, [bp+var_1C]
		mov	[si], eax
		mov	eax, [di+4]
		add	eax, [bp+var_18]
		mov	[si+4], eax
		mov	eax, [di+8]
		add	eax, [bp+var_14]
		mov	[si+8], eax
		mov	si, cx
		add	si, 2Dh
		mov	di, cx
		add	di, 2Dh
		mov	eax, [di]
		add	eax, [bp+var_28]
		mov	[si], eax
		mov	eax, [di+4]
		add	eax, [bp+var_24]
		mov	[si+4], eax
		mov	eax, [di+8]
		add	eax, [bp+var_20]
		mov	[si+8], eax
		pop	di
		pop	si
		leave
		retf
Particle_IntegrateWindDrift		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E9DB		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	si
		call	sub_36D52
		pop	cx
		or	al, al
		jz	short loc_4EA2A
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_4EA2A
		mov	eax, dword_7976E
		sub	[si+3Dh], eax
		mov	eax, [si+3Dh]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_4EA14
		mov	al, 0
		jmp	short loc_4EA2D

loc_4EA14:
		les	bx, [si+0Eh]
		mov	eax, es:[bx+77h]
		add	[si+41h], eax
		push	si
		push	cs
		call	near ptr Particle_IntegrateWindDrift
		pop	cx
		mov	[bp+var_1], 1

loc_4EA2A:
		mov	al, [bp+var_1]

loc_4EA2D:
		pop	si
		leave
		retf
sub_4E9DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EA30		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bx, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	si, bx
		add	si, 2Dh
		mov	eax, [si]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_4EAA8
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_4EAB3

loc_4EAA8:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_4EAB3:
		or	ax, ax
		jz	short loc_4EAD3
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_C]
		mov	[bx], eax
		mov	eax, [bp+var_14]
		mov	[bx+4], eax
		mov	eax, [bp+var_1C]
		mov	[bx+8], eax
		jmp	short loc_4EAD3

loc_4EAD3:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_4EA30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EADC		proc far

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
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[si+2Dh], eax
		mov	eax, [bp+var_20]
		mov	[si+31h], eax
		mov	eax, [bp+var_1C]
		mov	[si+35h], eax
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_4EB87
		les	bx, [si+0Ah]
		push	large es:[bx+4]
		nop
		push	cs
		call	near ptr sub_4ED61
		add	sp, 4

loc_4EB87:
		pop	di
		pop	si
		leave
		retf
sub_4EADC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EB8B		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 2Dh
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	ax, [si+41h]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		sub	eax, [si+41h]
		mov	[bp+var_20], eax
		mov	ax, [si+41h]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		sub	eax, [si+41h]
		mov	[bp+var_1C], eax
		mov	ax, [si+41h]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		sub	eax, [si+41h]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		add	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		add	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		add	eax, [bp+var_18]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	si
		call	WorldObject_TranslateBy_36A6C
		add	sp, 8
		mov	di, si
		add	di, 39h
		add	si, 39h
		push	large [bp+var_C]
		push	large [bp+var_10]
		push	large [bp+var_14]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [si]
		add	eax, [bp+var_8]
		mov	[di], eax
		pop	di
		pop	si
		leave
		retf
sub_4EB8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EC8A		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4ECD2
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1188h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_23D7C
		add	sp, 6
		test	si, 1
		jz	short loc_4ECD2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4ECD2:
		pop	si
		leave
		retf
sub_4EC8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_ComputeSteppedRangeWrapper_A6AE9
; (sub_A6AE9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle PlayerComponent_LoadListAndCompute_A6B09.
; ==============================================================================================
PlayerComponent_ComputeSteppedRangeWrapper_4ECD5		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_4ECFD
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
PlayerComponent_ComputeSteppedRangeWrapper_4ECD5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4ECF6		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_4ECF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4ECFD		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_4ED25
		push	1
		push	0
		push	2
		push	large 0Dh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_4ED59

loc_4ED25:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1100h
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Descriptor_Reset
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2F28h
		mov	eax, [bp+arg_8]
		mov	es:[bx+9], eax
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax
		mov	word ptr es:[bx+2], 0

loc_4ED59:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_4ECFD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4ED61		proc far

var_50		= dword ptr -50h
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
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
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
		sub	sp, 50h
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+69h], 0
		jnz	short loc_4ED76
		jmp	loc_4EE2E

loc_4ED76:
		mov	ax, es:[bx+6Bh]
		mov	dx, es:[bx+69h]
		add	dx, 5
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	si, [bp+var_1C]
		mov	eax, es:[si]
		mov	[bp+var_50], eax
		mov	eax, es:[si+4]
		mov	[bp+var_4C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_48], eax
		mov	es, [bp+arg_2]
		mov	eax, [bp+var_50]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_4C]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+0Ah], eax
		mov	ax, es:[bx+6Bh]
		mov	dx, es:[bx+69h]
		add	dx, 5
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	si, [bp+var_20]
		mov	eax, es:[si]
		mov	[bp+var_44], eax
		mov	eax, es:[si+4]
		mov	[bp+var_40], eax
		mov	eax, es:[si+8]
		mov	[bp+var_3C], eax
		mov	es, [bp+arg_2]
		les	bx, es:[bx+69h]
		mov	eax, es:[bx+5]
		sub	[bp+var_44], eax
		mov	eax, es:[bx+9]
		sub	[bp+var_40], eax
		mov	eax, es:[bx+0Dh]
		sub	[bp+var_40], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_44]
		mov	es:[bx+2Ch], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+30h], eax
		mov	eax, [bp+var_3C]
		jmp	loc_4EEC2

loc_4EE2E:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_2C], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_28], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_2C]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_28]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+0Ah], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_38], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_34], eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+2Ch], eax
		mov	eax, [bp+var_34]
		mov	es:[bx+30h], eax
		mov	eax, [bp+var_30]

loc_4EEC2:
		mov	es:[bx+34h], eax
		pop	si
		leave
		retf
sub_4ED61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EECA		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_4EECA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EED1		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4EF19
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2F28h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_23E5B
		add	sp, 6
		test	si, 1
		jz	short loc_4EF19
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4EF19:
		pop	si
		leave
		retf
sub_4EED1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EF1C		proc far

var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= word ptr -98h
var_68		= word ptr -68h
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
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	byte_778FC, 0
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	di, [bp+var_4]
		mov	eax, es:[di]
		mov	[bp+var_20], eax
		mov	eax, es:[di+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_18], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Ch
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	di, [bp+var_8]
		mov	eax, es:[di]
		mov	[bp+var_2C], eax
		mov	eax, es:[di+4]
		mov	[bp+var_28], eax
		mov	eax, es:[di+8]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_2C]
		jz	short loc_4EF94
		mov	ax, 1
		jmp	short loc_4EF96

loc_4EF94:
		xor	ax, ax

loc_4EF96:
		or	al, al
		jnz	short loc_4EFC4
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_28]
		jz	short loc_4EFA9
		mov	ax, 1
		jmp	short loc_4EFAB

loc_4EFA9:
		xor	ax, ax

loc_4EFAB:
		or	al, al
		jnz	short loc_4EFC4
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_24]
		jz	short loc_4EFBE
		mov	ax, 1
		jmp	short loc_4EFC0

loc_4EFBE:
		xor	ax, ax

loc_4EFC0:
		or	al, al
		jz	short loc_4EFC9

loc_4EFC4:
		mov	ax, 1
		jmp	short loc_4EFCB

loc_4EFC9:
		xor	ax, ax

loc_4EFCB:
		or	ax, ax
		jnz	short loc_4EFD2
		jmp	loc_4F104

loc_4EFD2:
		lea	ax, [bp+var_68]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, [bp+var_98]
		push	ax
		call	Damage_ComputeHelperA_58243
		pop	cx
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Ch
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	di, [bp+var_C]
		mov	eax, es:[di]
		mov	[bp+var_A4], eax
		mov	eax, es:[di+4]
		mov	[bp+var_A0], eax
		mov	eax, es:[di+8]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_3C], eax
		mov	eax, [si+14h]
		neg	eax
		mov	[bp+var_38], eax
		mov	eax, [si+18h]
		neg	eax
		mov	[bp+var_34], eax
		mov	eax, [si+1Ch]
		neg	eax
		mov	[bp+var_30], eax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	62F4h
		lea	ax, [bp+var_68]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	Damage_ComputeHelperB_58297
		add	sp, 8
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 56h
		push	[bp+arg_2]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+56h]
		call	dword ptr [bx+14h]
		add	sp, 8
		or	al, al
		jz	short loc_4F104
		push	35BCh
		mov	ax, [bp+arg_0]
		add	ax, 56h
		push	[bp+arg_2]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+56h]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	ax, [bp+arg_0]
		add	ax, 56h
		push	[bp+arg_2]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+56h]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_4F104
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_4F0EB
		mov	ax, 1
		jmp	short loc_4F0ED

loc_4F0EB:
		xor	ax, ax

loc_4F0ED:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4F104
		push	large [bp+var_14]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_4F104

loc_4F104:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+5Ah]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+5Eh]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
sub_4EF1C		endp
seg118		ends
