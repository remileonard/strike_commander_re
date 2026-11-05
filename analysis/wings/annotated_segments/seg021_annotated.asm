seg021		segment	para public 'CODE' use16
		assume cs:seg021
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0EBh, 0

loc_C422:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C426		proc far

var_AC		= word ptr -0ACh
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_47		= dword ptr -47h
var_3A		= word ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0ACh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AC]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_AC], 9B5h
		mov	[bp+var_4B], 100h
		mov	[bp+var_4F], 0
		mov	[bp+var_AC], 9CDh
		mov	[bp+var_30], 0
		xor	ax, ax
		mov	[bp+var_32], ax
		movsx	eax, ax
		mov	[bp+var_47], eax
		push	1
		mov	ax, si
		add	ax, 57h
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		mov	bx, [bp+var_AC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54415453h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		mov	[bp+var_1], 0
		jmp	short loc_C4F2

loc_C49C:
		push	1
		push	large 474E4843h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_2], al
		cmp	al, [bp+arg_2]
		jnz	short loc_C4DF
		mov	[bp+var_1], 1
		jmp	short loc_C520

loc_C4DF:
		mov	eax, [bp+var_36]
		mov	[bp+var_47], eax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_C4F2:
		cmp	[bp+var_30], 0
		jnz	short loc_C505
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_C519

loc_C505:
		mov	bx, [bp+var_30]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_47]
		jg	short loc_C517
		mov	ax, 1
		jmp	short loc_C519

loc_C517:
		xor	ax, ax

loc_C519:
		or	ax, ax
		jnz	short loc_C520
		jmp	loc_C49C

loc_C520:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C536
		push	27h
		push	0C06h
		call	sub_9D78
		add	sp, 4

loc_C536:
		mov	eax, [bp+var_36]
		mov	[bp+var_47], eax
		push	0
		push	large 544C4950h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_C55A
		jmp	loc_C6A3

loc_C55A:
		jmp	loc_C672

loc_C55D:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_2], al
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_3], al
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_4], al
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C5AD
		cmp	ax, 1
		jz	short loc_C5D5
		cmp	ax, 2
		jnz	short loc_C5AA
		jmp	loc_C63F

loc_C5AA:
		jmp	loc_C665

loc_C5AD:
		cmp	[bp+var_4], 0
		jnz	short loc_C5C4
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		add	[bx+si+2AEh], dx
		jmp	loc_C672

loc_C5C4:
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		add	[bx+si+2B0h], dx
		jmp	loc_C672

loc_C5D5:
		cmp	[bp+var_4], 0
		jnz	short loc_C60D
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		cmp	[bx+si+2AEh], dx
		jnb	short loc_C5FD
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		mov	word ptr [bx+si+2AEh], 0
		jmp	short loc_C672

loc_C5FD:
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		sub	[bx+si+2AEh], dx
		jmp	short loc_C672

loc_C60D:
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		cmp	[bx+si+2B0h], dx
		jnb	short loc_C62F
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		mov	word ptr [bx+si+2B0h], 0
		jmp	short loc_C672

loc_C62F:
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		sub	[bx+si+2B0h], dx
		jmp	short loc_C672

loc_C63F:
		cmp	[bp+var_4], 0
		jnz	short loc_C655
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		mov	[bx+si+2AEh], dx
		jmp	short loc_C672

loc_C655:
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		mov	[bx+si+2B0h], dx
		jmp	short loc_C672

loc_C665:
		push	2Ah
		push	0C06h
		call	sub_9D78
		add	sp, 4

loc_C672:
		test	[bp+var_3A], 1
		jz	short loc_C68B
		mov	eax, [bp+var_36]
		dec	eax
		cmp	eax, [bp+var_47]
		jnz	short loc_C68B
		inc	[bp+var_47]
		jmp	short loc_C68B

loc_C68B:
		mov	eax, [bp+var_47]
		cmp	eax, [bp+var_36]
		jl	short loc_C69A
		mov	ax, 1
		jmp	short loc_C69C

loc_C69A:
		xor	ax, ax

loc_C69C:
		or	ax, ax
		jnz	short loc_C6A3
		jmp	loc_C55D

loc_C6A3:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		mov	[bp+var_AC], 9CDh
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_AC]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
sub_C426		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6D1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_C6D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6D9		proc far

var_32A		= word ptr -32Ah
var_2DA		= word ptr -2DAh
var_2B2		= word ptr -2B2h
var_2B0		= byte ptr -2B0h
var_2AF		= byte ptr -2AFh
var_28A		= word ptr -28Ah
var_262		= word ptr -262h
var_260		= word ptr -260h
var_248		= word ptr -248h
var_246		= word ptr -246h
var_232		= byte ptr -232h
var_22E		= word ptr -22Eh
var_21E		= word ptr -21Eh
var_21C		= word ptr -21Ch
var_21A		= word ptr -21Ah
var_216		= word ptr -216h
var_214		= word ptr -214h
var_212		= word ptr -212h
var_210		= word ptr -210h
var_20E		= word ptr -20Eh
var_20C		= word ptr -20Ch
var_208		= word ptr -208h
var_1E8		= word ptr -1E8h
var_1C8		= word ptr -1C8h
var_1A8		= word ptr -1A8h
var_130		= word ptr -130h
var_CF		= dword ptr -0CFh
var_CB		= dword ptr -0CBh
var_C3		= word ptr -0C3h
var_BF		= dword ptr -0BFh
var_B8		= word ptr -0B8h
var_68		= word ptr -68h
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_43		= byte ptr -43h
var_42		= word ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= word ptr -2Dh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 32Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_68]
		push	ss
		push	ax
		push	ds
		push	offset unk_5A96E
		mov	cx, 10h
		call	CRT_Fmemcpy
		xor	di, di
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_C735
		mov	al, [si+10Dh]
		mov	ah, 0
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	cx, ax
		mov	dx, 0Ah
		mov	ax, cx
		imul	dx
		mov	cx, ax
		mov	bx, 2Ch
		mov	ax, cx
		cwd
		idiv	bx
		mov	cx, ax
		jmp	short loc_C758

loc_C735:
		mov	al, [si+10Dh]
		mov	ah, 0
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	cx, ax
		mov	dx, 0Ah
		mov	ax, cx
		imul	dx
		mov	cx, ax
		mov	bx, 24h
		mov	ax, cx
		cwd
		idiv	bx
		mov	cx, ax
		mov	di, 7

loc_C758:
		mov	ax, cx
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	dx, di
		add	dx, ax
		mov	[bp+var_2], dx
		or	cx, cx
		jz	short loc_C7C4
		cmp	cx, word_5A96C
		jz	short loc_C7C4
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_C7A2
		xor	di, di
		jmp	short loc_C79B

loc_C782:
		mov	ax, 0Ah
		call	Math_RandomScale_39596
		cmp	ax, 5
		jle	short loc_C79A
		mov	bx, di
		add	bx, [bp+var_2]
		shl	bx, 1
		inc	word ptr [bx+0C32h]

loc_C79A:
		inc	di

loc_C79B:
		cmp	di, 2
		jl	short loc_C782
		jmp	short loc_C7C4

loc_C7A2:
		xor	di, di
		jmp	short loc_C7BF

loc_C7A6:
		mov	ax, 0Ah
		call	Math_RandomScale_39596
		cmp	ax, 5
		jle	short loc_C7BE
		mov	bx, di
		add	bx, [bp+var_2]
		shl	bx, 1
		inc	word ptr [bx+0C32h]

loc_C7BE:
		inc	di

loc_C7BF:
		cmp	di, 3
		jl	short loc_C7A6

loc_C7C4:
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_B8]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_130]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_B8]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_1A8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_C84D
		push	3
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	36h
		jmp	short loc_C855

loc_C84D:
		push	3
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	37h

loc_C855:
		lea	ax, [bp+var_130]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_47001
		add	sp, 4
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		lea	ax, [bp+var_1E8]
		push	ax
		call	CachedObject_Allocate_46FA2
		pop	cx
		push	38h
		lea	ax, [bp+var_130]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_CB]
		mov	[bp+var_50], eax
		mov	ax, [bp+var_C3]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C8C1
		mov	eax, [bp+var_CF]
		jmp	short loc_C8C6

loc_C8C1:
		mov	eax, [bp+var_BF]

loc_C8C6:
		mov	edx, [bp+var_50]
		add	edx, eax
		mov	[bp+var_54], edx
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_54]
		jz	short loc_C93A
		lea	ax, [bp+var_32A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_54]
		push	large [bp+var_50]
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		push	3
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_1E8]
		push	ax
		call	CachedObject_DestructHelper_4738E
		add	sp, 4
		push	2
		lea	ax, [bp+var_32A]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		jmp	short loc_C943

loc_C93A:
		push	0D0Eh
		call	sub_9D78
		pop	cx

loc_C943:
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		lea	ax, [bp+var_208]
		push	ax
		call	CachedObject_Allocate_46FA2
		pop	cx
		push	39h
		lea	ax, [bp+var_130]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_CB]
		mov	[bp+var_50], eax
		mov	ax, [bp+var_C3]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C991
		mov	eax, [bp+var_CF]
		jmp	short loc_C996

loc_C991:
		mov	eax, [bp+var_BF]

loc_C996:
		mov	edx, [bp+var_50]
		add	edx, eax
		mov	[bp+var_54], edx
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_54]
		jz	short loc_CA0A
		lea	ax, [bp+var_32A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_54]
		push	large [bp+var_50]
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		push	3
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_208]
		push	ax
		call	CachedObject_DestructHelper_4738E
		add	sp, 4
		push	2
		lea	ax, [bp+var_32A]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		jmp	short loc_CA13

loc_CA0A:
		push	0D2Bh
		call	sub_9D78
		pop	cx

loc_CA13:
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	2
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	9
		lea	ax, [bp+var_1A8]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_30], 0
		mov	[bp+var_2D], 0
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		mov	[bp+var_216], 0
		mov	[bp+var_214], 0
		mov	[bp+var_212], 0
		mov	[bp+var_210], 0
		mov	[bp+var_20E], 13Fh
		mov	[bp+var_20C], 0C7h
		push	0
		lea	ax, [bp+var_216]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aBoardfnt
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_B8]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_B8]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_3E+2], dx
		mov	word ptr [bp+var_3E], ax
		mov	eax, [bp+var_3E]
		mov	[bp+var_3A], eax
		mov	[bp+var_36], 2
		mov	[bp+var_35], 1
		mov	[bp+var_34], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_22E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_21E], 1
		mov	[bp+var_21C], 0
		mov	[bp+var_21A], 6
		lea	ax, [bp+var_22E]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		lea	ax, [bp+var_216]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	0
		push	[bp+var_30]
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextScrollDisplayB_ApplyHelperA_57104
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_571A4
		push	word ptr [si+0F8h]
		lea	ax, [bp+var_216]
		push	ax
		lea	ax, [bp+var_262]
		push	ax
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_CB6E
		push	0D4Dh
		jmp	short loc_CB71

loc_CB6E:
		push	0D5Ch

loc_CB71:
		lea	ax, [bp+var_28A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_43], 0
		mov	[bp+var_232], 4
		mov	ax, si
		add	ax, 3B6h
		push	ax
		lea	ax, [bp+var_2B2]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	ds
		push	offset a__5
		push	ss
		lea	ax, [bp+var_2B2]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		mov	ax, si
		add	ax, 3A7h
		push	ax
		push	ss
		lea	ax, [bp+var_2B2]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		lea	ax, [bp+var_2B2]
		push	ax
		lea	ax, [bp+var_248]
		push	ax
		call	sub_4926B
		add	sp, 4
		cmp	ax, 0A0h
		jle	short loc_CC42
		cmp	byte ptr [bp+var_2B2], 0
		jz	short loc_CC42
		mov	al, [si+3B6h]
		mov	byte ptr [bp+var_2B2], al
		mov	byte ptr [bp+var_2B2+1], 2Eh
		mov	[bp+var_2B0], 20h
		mov	[bp+var_2AF], 0
		push	ds
		mov	ax, si
		add	ax, 3A7h
		push	ax
		push	ss
		lea	ax, [bp+var_2B2]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		jmp	short loc_CC24

loc_CC0D:
		lea	ax, [bp+var_2B2]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		lea	dx, [bp+var_2B2]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_CC24:
		lea	ax, [bp+var_2B2]
		push	ax
		lea	ax, [bp+var_248]
		push	ax
		call	sub_4926B
		add	sp, 4
		cmp	ax, 0A0h
		jle	short loc_CC42
		cmp	byte ptr [bp+var_2B2], 0
		jnz	short loc_CC0D

loc_CC42:
		xor	eax, eax
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		mov	[bp+var_48], 3
		mov	eax, dword_5E7D3
		mov	[bp+var_4C], eax

loc_CC5D:
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_48]
		cmp	eax, dword_5E7D3
		ja	short loc_CC71
		mov	ax, 1
		jmp	short loc_CC73

loc_CC71:
		xor	ax, ax

loc_CC73:
		or	al, al
		jnz	short loc_CC7A
		jmp	loc_CF05

loc_CC7A:
		push	0
		call	sub_1F7CA
		pop	cx
		mov	[bp+var_48], 3
		mov	eax, dword_5E7D3
		mov	[bp+var_4C], eax
		mov	word ptr [bp+var_50+2], 1Ah
		mov	word ptr [bp+var_50], 9
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_47617
		pop	cx
		xor	di, di
		jmp	loc_CDAA

loc_CCAC:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Ah
		mov	bx, si
		add	bx, ax
		cmp	word ptr [bx+2B2h], 0
		jnz	short loc_CCC8
		jmp	loc_CDA9

loc_CCC8:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_68]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_CCEA
		lea	ax, [bp+var_2B2]
		push	ax
		lea	ax, [bp+var_2DA]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_CD3A

loc_CCEA:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	bx, [bx]
		shl	bx, 1
		push	word ptr [bx+827h]
		lea	ax, [bp+var_2DA]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	ds
		push	offset a__6
		push	ss
		lea	ax, [bp+var_2DA]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	bx, [bx]
		shl	bx, 1
		push	word ptr [bx+837h]
		push	ss
		lea	ax, [bp+var_2DA]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_CD3A:
		lea	ax, [bp+var_2DA]
		push	ax
		push	word ptr [bp+var_50]
		push	69h
		push	0D76h
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		push	0Ah
		lea	ax, [bp+var_56]
		push	ax
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Ah
		mov	bx, si
		add	bx, ax
		push	word ptr [bx+2AEh]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_248]
		push	ax
		call	sub_4926B
		add	sp, 4
		lea	ax, [bp+var_56]
		push	ax
		push	word ptr [bp+var_50]
		push	10Eh
		push	0D7Dh
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		mov	ax, word ptr [bp+var_50+2]
		add	word ptr [bp+var_50], ax

loc_CDA9:
		inc	di

loc_CDAA:
		cmp	di, 8
		jge	short loc_CDB2
		jmp	loc_CCAC

loc_CDB2:
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_CE35
		xor	di, di
		jmp	short loc_CE2E

loc_CDC3:
		mov	bx, di
		add	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+0C18h]
		push	word ptr [bp+var_50]
		push	69h
		push	0D84h
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		push	0Ah
		lea	ax, [bp+var_56]
		push	ax
		mov	bx, di
		add	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+0C32h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_248]
		push	ax
		call	sub_4926B
		add	sp, 4
		lea	ax, [bp+var_56]
		push	ax
		push	word ptr [bp+var_50]
		push	10Eh
		push	0D8Bh
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		mov	ax, word ptr [bp+var_50+2]
		add	word ptr [bp+var_50], ax
		inc	di

loc_CE2E:
		cmp	di, 2
		jl	short loc_CDC3
		jmp	short loc_CEA9

loc_CE35:
		xor	di, di
		jmp	short loc_CEA4

loc_CE39:
		mov	bx, di
		add	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+0C18h]
		push	word ptr [bp+var_50]
		push	69h
		push	0D92h
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		push	0Ah
		lea	ax, [bp+var_56]
		push	ax
		mov	bx, di
		add	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+0C32h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_248]
		push	ax
		call	sub_4926B
		add	sp, 4
		lea	ax, [bp+var_56]
		push	ax
		push	word ptr [bp+var_50]
		push	10Eh
		push	0D99h
		lea	ax, [bp+var_248]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		mov	ax, word ptr [bp+var_50+2]
		add	word ptr [bp+var_50], ax
		inc	di

loc_CEA4:
		cmp	di, 3
		jl	short loc_CE39

loc_CEA9:
		lea	ax, [bp+var_208]
		push	ax
		call	sub_47617
		pop	cx
		lea	ax, [bp+var_1E8]
		push	ax
		call	sub_47617
		pop	cx
		cmp	[bp+var_43], 0
		jz	short loc_CEE0
		lea	ax, [bp+var_28A]
		push	ax
		push	large 0B70002h
		push	0DA0h
		lea	ax, [bp+var_262]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah

loc_CEE0:
		push	word_5DD42
		call	sub_57317
		pop	cx
		lea	ax, [bp+var_216]
		push	ax
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		push	word_5DD42
		call	sub_57329
		pop	cx

loc_CF05:
		mov	byte ptr [bp+var_54], 0
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte ptr [bp+var_54], 0
		jnz	short loc_CF3B
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CF3B
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_19979
		add	sp, 4
		jmp	short loc_CF3B

loc_CF3B:
		cmp	byte ptr [bp+var_54], 0
		jz	short loc_CF67
		mov	dx, word ptr [bp+var_54+2]
		mov	bx, word ptr [bp+var_50]
		or	dx, dx
		jle	short loc_CF63
		cmp	dx, 280h
		jge	short loc_CF63
		cmp	bx, 96h
		jle	short loc_CF63
		cmp	bx, 0C8h
		jge	short loc_CF63
		mov	[bp+var_43], 1
		jmp	short loc_CF67

loc_CF63:
		mov	[bp+var_43], 0

loc_CF67:
		cmp	[bp+var_43], 0
		jz	short loc_CF81
		cmp	word_606D8, 1
		jnz	short loc_CF98
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	word_606D8, 0
		jmp	short loc_CF93

loc_CF81:
		cmp	word_606D8, 0
		jnz	short loc_CF98
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	word_606D8, 1

loc_CF93:
		call	TextScrollDisplayB_ApplyHelperC_571A4

loc_CF98:
		cmp	byte ptr [bp+var_54], 2
		jnz	short loc_CFA4
		cmp	[bp+var_43], 0
		jnz	short loc_CFB6

loc_CFA4:
		cmp	byte ptr [bp+var_58], 2
		jz	short loc_CFAD
		jmp	loc_CC5D

loc_CFAD:
		cmp	byte ptr [bp+var_58+1], 1
		jz	short loc_CFB6
		jmp	loc_CC5D

loc_CFB6:
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_42]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_246]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_22E]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_D01C
		cmp	[bp+var_3A], 0
		jz	short loc_D01C
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_D01C

loc_D01C:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		lea	ax, [bp+var_216]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_25], 0
		jz	short loc_D069
		cmp	[bp+var_2A], 0
		jz	short loc_D069
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_D069

loc_D069:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	2
		lea	ax, [bp+var_208]
		push	ax
		call	CachedObject_Destruct_471E1
		add	sp, 4
		cmp	[bp+var_1B], 0
		jz	short loc_D0B0
		cmp	[bp+var_20], 0
		jz	short loc_D0B0
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_D0B0

loc_D0B0:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	2
		lea	ax, [bp+var_1E8]
		push	ax
		call	CachedObject_Destruct_471E1
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_D0F7
		cmp	[bp+var_16], 0
		jz	short loc_D0F7
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_D0F7

loc_D0F7:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_1C8]
		push	ax
		call	CachedObject_Destruct_471E1
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_D13E
		cmp	[bp+var_C], 0
		jz	short loc_D13E
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_D13E

loc_D13E:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_1A8]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_130]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
sub_C6D9		endp
seg021		ends
