ovr349		segment	para public 'OVERLAY' use16
		assume cs:ovr349
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C13A0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+6], 0
		xor	dx, dx
		jmp	short loc_C13BF

loc_C13B5:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	dx

loc_C13BF:
		cmp	dx, 0Ah
		jl	short loc_C13B5
		pop	si
		pop	bp
		retf
sub_C13A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C13C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_68B0D
		pop	cx
		xor	di, di
		jmp	short loc_C13F1

loc_C13DA:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+8]
		call	sub_65A86
		pop	cx
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	di

loc_C13F1:
		cmp	di, 0Ah
		jl	short loc_C13DA
		pop	di
		pop	si
		pop	bp
		retf
sub_C13C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C13FA		proc far

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
		jmp	short loc_C1442

loc_C1415:
		push	[bp+arg_2]
		mov	bx, [bp+var_4]
		push	word ptr [bx+0Eh]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_C1442
		mov	bx, [bp+var_4]
		mov	ax, [bx+10h]
		cmp	ax, [bp+arg_4]
		jnz	short loc_C1442
		mov	ax, [bp+var_4]
		mov	[si+1Ch], ax
		mov	[bp+var_2], 1
		jmp	short loc_C1453

loc_C1442:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_C1415

loc_C1453:
		mov	al, byte ptr [bp+var_2]
		pop	si
		leave
		retf
sub_C13FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C1459		proc far

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
		call	near ptr sub_C13FA
		add	sp, 6
		or	al, al
		jz	short loc_C14A0
		mov	ax, [si+1Ch]
		cmp	ax, [si+2]
		jz	short loc_C1497
		push	0
		push	ax
		push	si
		call	LinkedListB_FindByKey_68AA6
		add	sp, 6
		push	word ptr [si+1Ch]
		push	si
		call	sub_689F9
		add	sp, 4

loc_C1497:
		mov	ax, [si+1Ch]
		add	ax, 4

loc_C149D:
		jmp	loc_C1838

loc_C14A0:
		cmp	word ptr [si+6], 0Ah
		jl	short loc_C14A9
		jmp	loc_C182F

loc_C14A9:
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_C14D5

loc_C14B2:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+8]
		push	[bp+arg_2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_C14D4
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+8]
		mov	[bp+var_2], ax
		jmp	short loc_C14DA

loc_C14D4:
		inc	di

loc_C14D5:
		cmp	[si+6], di
		jg	short loc_C14B2

loc_C14DA:
		cmp	[bp+var_2], 0
		jnz	short loc_C14F7
		push	[bp+arg_2]
		call	CRT_Strdup
		pop	cx
		mov	bx, [si+6]
		shl	bx, 1
		mov	[bx+si+8], ax
		mov	[bp+var_2], ax
		inc	word ptr [si+6]

loc_C14F7:
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_C1546
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 3748h
		mov	dword ptr [di+4], 0
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 0
		mov	dword ptr [di+0Ah], 0
		mov	ax, [bp+var_4]
		mov	[di+0Eh], ax
		mov	ax, [bp+var_6]
		mov	[di+10h], ax
		mov	ax, di
		jmp	short loc_C1548

loc_C1546:
		mov	ax, di

loc_C1548:
		mov	di, ax
		push	ax
		push	si
		call	sub_689F9
		add	sp, 4
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_43]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C1587
		mov	eax, [bp+var_4F]
		jmp	short loc_C158B

loc_C1587:
		mov	eax, [bp+var_3F]

loc_C158B:
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 0
		jnz	short loc_C1599
		jmp	loc_C1801

loc_C1599:
		mov	[bp+var_D], 1
		cmp	[bp+var_A], 0FFFCh
		jle	short loc_C15AB
		mov	[bp+var_D], 0

loc_C15AB:
		push	0
		push	3
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_12], eax
		push	0
		push	2
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_16], eax
		cmp	[bp+var_D], 0
		jnz	short loc_C15E2
		jmp	loc_C1689

loc_C15E2:
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_12]
		jl	short loc_C15EF
		jmp	loc_C1689

loc_C15EF:
		mov	[bp+var_1A], eax
		push	0
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_C1689
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_75C8
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_20], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_20]
		jmp	loc_C149D

loc_C1689:
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_16]
		jl	short loc_C1696
		jmp	loc_C1730

loc_C1696:
		mov	[bp+var_24], eax
		push	0
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_C1730
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_75C8
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2A], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_2A]
		jmp	loc_C149D

loc_C1730:
		mov	[bp+var_2B], 2
		cmp	[bp+var_D], 0
		jz	short loc_C173E
		mov	[bp+var_2B], 3

loc_C173E:
		mov	al, [bp+var_2B]
		push	ax
		push	large [bp+var_A]
		push	si
		nop
		push	cs
		call	near ptr sub_C183C
		add	sp, 8
		mov	eax, [bp+var_A]
		mov	[bp+var_30], eax
		mov	al, [bp+var_2B]
		mov	[bp+var_31], al
		push	1
		push	0
		push	ax
		push	large [bp+var_30]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_C17F6
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_75C8
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_38], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_38]
		jmp	loc_C149D

loc_C17F6:
		push	0D999h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_C181E

loc_C1801:
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_C], ax
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_C]
		jmp	loc_C149D

loc_C181E:
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		jmp	short loc_C1838

loc_C182F:
		push	0D99Ah
		call	sub_1DDFE
		pop	cx

loc_C1838:
		pop	di
		pop	si
		leave
		retf
sub_C1459		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C183C		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		call	sub_66372
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		jmp	short loc_C1898

loc_C1859:
		cmp	word ptr [si+4], 0
		jz	short loc_C188F
		push	0
		push	word ptr [si+4]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		call	sub_66372
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		call	sub_66372
		mov	eax, [bp+var_6]
		cmp	eax, [bp+arg_2]
		jle	short loc_C1898
		mov	[bp+var_1], 1
		jmp	short loc_C1898

loc_C188F:
		push	0D99Bh
		call	sub_1DDFE
		pop	cx

loc_C1898:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C1859
		pop	si
		leave
		retf
sub_C183C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C18A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C1903
		mov	word ptr [si], 3748h
		mov	word ptr [si+0Eh], 0
		cmp	byte ptr [si+9], 0
		jz	short loc_C18E2
		cmp	dword ptr [si+4], 0
		jz	short loc_C18E2
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C18E2

loc_C18E2:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_C1903
		push	si
		call	sub_3B2
		pop	cx

loc_C1903:
		pop	di
		pop	si
		pop	bp
		retf
sub_C18A4		endp
ovr349		ends
