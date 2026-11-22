seg028		segment	para public 'CODE' use16
		assume cs:seg028
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0, 0, 59h

loc_16844:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16848		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+6], 0
		xor	dx, dx
		jmp	short loc_16867

loc_1685D:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	dx

loc_16867:
		cmp	dx, 0Ah
		jl	short loc_1685D
		pop	si
		pop	bp
		retf
sub_16848		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1686F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_4870F
		pop	cx
		xor	di, di
		jmp	short loc_16899

loc_16882:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+8]
		call	sub_45058
		pop	cx
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	di

loc_16899:
		cmp	di, 0Ah
		jl	short loc_16882
		pop	di
		pop	si
		pop	bp
		retf
sub_1686F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_168A2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	word ptr [si+1Ch], 0
		mov	[bp+var_4], 0
		jmp	short loc_168EA

loc_168BD:
		push	[bp+arg_2]
		mov	bx, [bp+var_4]
		push	word ptr [bx+0Eh]
		call	CRT_StrICmp_2D03
		add	sp, 4
		or	ax, ax
		jnz	short loc_168EA
		mov	bx, [bp+var_4]
		mov	ax, [bx+10h]
		cmp	ax, [bp+arg_4]
		jnz	short loc_168EA
		mov	ax, [bp+var_4]
		mov	[si+1Ch], ax
		mov	[bp+var_2], 1
		jmp	short loc_168FB

loc_168EA:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_168BD

loc_168FB:
		mov	al, byte ptr [bp+var_2]
		pop	si
		leave
		retf
sub_168A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16901		proc far

var_B0		= word ptr -0B0h
var_4F		= dword ptr -4Fh
var_43		= word ptr -43h
var_3F		= dword ptr -3Fh
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2B		= byte ptr -2Bh
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_168A2
		add	sp, 6
		or	al, al
		jz	short loc_16948
		mov	ax, [si+1Ch]
		cmp	ax, [si+2]
		jz	short loc_1693F
		push	0
		push	ax
		push	si
		call	LinkedListB_FindByKey_486A8
		add	sp, 6
		push	word ptr [si+1Ch]
		push	si
		call	sub_485FB
		add	sp, 4

loc_1693F:
		mov	ax, [si+1Ch]
		add	ax, 4
		jmp	loc_16D37

loc_16948:
		cmp	word ptr [si+6], 0Ah
		jl	short loc_16951
		jmp	loc_16D2A

loc_16951:
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_1697D

loc_1695A:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+8]
		push	[bp+arg_2]
		call	CRT_StrICmp_2D03
		add	sp, 4
		or	ax, ax
		jnz	short loc_1697C
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+8]
		mov	[bp+var_2], ax
		jmp	short loc_16982

loc_1697C:
		inc	di

loc_1697D:
		cmp	[si+6], di
		jg	short loc_1695A

loc_16982:
		cmp	[bp+var_2], 0
		jnz	short loc_1699F
		push	[bp+arg_2]
		call	CRT_Strdup
		pop	cx
		mov	bx, [si+6]
		shl	bx, 1
		mov	[bx+si+8], ax
		mov	[bp+var_2], ax
		inc	word ptr [si+6]

loc_1699F:
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_169EE
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 152Fh
		mov	dword ptr [di+4], 0
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 0
		mov	dword ptr [di+0Ah], 0
		mov	ax, [bp+var_4]
		mov	[di+0Eh], ax
		mov	ax, [bp+var_6]
		mov	[di+10h], ax
		mov	ax, di
		jmp	short loc_169F0

loc_169EE:
		mov	ax, di

loc_169F0:
		mov	di, ax
		push	ax
		push	si
		call	sub_485FB
		add	sp, 4
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_43]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_16A2F
		mov	eax, [bp+var_4F]
		jmp	short loc_16A33

loc_16A2F:
		mov	eax, [bp+var_3F]

loc_16A33:
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 0
		jnz	short loc_16A41
		jmp	loc_16D00

loc_16A41:
		mov	[bp+var_D], 1
		cmp	[bp+var_A], 0FFFCh
		jle	short loc_16A53
		mov	[bp+var_D], 0

loc_16A53:
		push	0
		push	3
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_12], eax
		push	0
		push	2
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_16], eax
		cmp	[bp+var_D], 0
		jnz	short loc_16A8A
		jmp	loc_16B4D

loc_16A8A:
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_12]
		jl	short loc_16A97
		jmp	loc_16B4D

loc_16A97:
		mov	[bp+var_1A], eax
		push	0
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[di+4], eax
		mov	byte ptr [di+8], 3
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_1A]
		mov	[di+0Ah], eax
		cmp	byte ptr [di+8], 3
		jnz	short loc_16AF1
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16AF7

loc_16AF1:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_16AF7:
		or	ax, dx
		jz	short loc_16B4D
		cmp	byte ptr [di+8], 3
		jnz	short loc_16B18
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16B1E

loc_16B18:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_16B1E:
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_54A85
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_20], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	ax, [bp+var_20]
		jmp	loc_16D37

loc_16B4D:
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_16]
		jl	short loc_16B5A
		jmp	loc_16C10

loc_16B5A:
		mov	[bp+var_24], eax
		push	0
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[di+4], eax
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_24]
		mov	[di+0Ah], eax
		cmp	byte ptr [di+8], 3
		jnz	short loc_16BB4
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16BBA

loc_16BB4:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_16BBA:
		or	ax, dx
		jz	short loc_16C10
		cmp	byte ptr [di+8], 3
		jnz	short loc_16BDB
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16BE1

loc_16BDB:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_16BE1:
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_54A85
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2A], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	ax, [bp+var_2A]
		jmp	loc_16D37

loc_16C10:
		mov	[bp+var_2B], 2
		cmp	[bp+var_D], 0
		jz	short loc_16C1E
		mov	[bp+var_2B], 3

loc_16C1E:
		mov	al, [bp+var_2B]
		push	ax
		push	large [bp+var_A]
		push	si
		nop
		push	cs
		call	near ptr sub_16D3B
		add	sp, 8
		mov	eax, [bp+var_A]
		mov	[bp+var_30], eax
		mov	al, [bp+var_2B]
		mov	[bp+var_31], al
		push	1
		push	0
		push	ax
		push	large [bp+var_30]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_36+2], dx
		mov	word ptr [bp+var_36], ax
		mov	eax, [bp+var_36]
		mov	[di+4], eax
		mov	al, [bp+var_31]
		mov	[di+8], al
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_30]
		mov	[di+0Ah], eax
		cmp	byte ptr [di+8], 3
		jnz	short loc_16C96
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16C9C

loc_16C96:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_16C9C:
		or	ax, dx
		jz	short loc_16CF1
		cmp	byte ptr [di+8], 3
		jnz	short loc_16CBD
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16CC3

loc_16CBD:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_16CC3:
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_54A85
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_38], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	ax, [bp+var_38]
		jmp	short loc_16D37

loc_16CF1:
		push	0
		push	1520h
		call	sub_9D78
		add	sp, 4
		jmp	short loc_16D1C

loc_16D00:
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_C], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	ax, [bp+var_C]
		jmp	short loc_16D37

loc_16D1C:
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		jmp	short loc_16D34

loc_16D2A:
		push	1
		push	1520h
		call	sub_9D78

loc_16D34:
		add	sp, 4

loc_16D37:
		pop	di
		pop	si
		leave
		retf
sub_16901		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16D3B		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_16D8F

loc_16D4F:
		cmp	word ptr [si+4], 0
		jz	short loc_16D82
		push	0
		push	word ptr [si+4]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6
		push	0
		push	0
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_16D8F

loc_16D82:
		push	2
		push	1520h
		call	sub_9D78
		add	sp, 4

loc_16D8F:
		cmp	[bp+var_4], 0
		jz	short loc_16D4F
		push	0
		mov	al, [bp+arg_6]
		push	ax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		pop	si
		leave
		retf
sub_16D3B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16DAE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16E0D
		mov	word ptr [si], 152Fh
		mov	word ptr [si+0Eh], 0
		cmp	byte ptr [si+9], 0
		jz	short loc_16DEC
		cmp	dword ptr [si+4], 0
		jz	short loc_16DEC
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_16DEC

loc_16DEC:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_16E0D
		push	si
		call	sub_33B
		pop	cx

loc_16E0D:
		pop	di
		pop	si
		pop	bp
sub_16DAE		endp
seg028		ends
