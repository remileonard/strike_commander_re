ovr233		segment	para public 'OVERLAY' use16
		assume cs:ovr233
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_82C40		proc far

var_EE		= word ptr -0EEh
var_76		= word ptr -76h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_18		= word ptr -18h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0EEh
		push	si
		push	ds
		push	offset aPak
		push	ds
		push	offset aMIDGAM09
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_76]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, [bp+var_8]
		push	ax
		call	TextCycler_AllocateA_13A8B
		pop	cx
		push	5
		lea	ax, [bp+var_8]
		push	ax
		call	sub_13AF4
		add	sp, 4
		call	sub_1F377
		mov	[bp+var_12], 0
		mov	byte ptr [bp+var_10+2], 2
		mov	byte ptr [bp+var_10+3], 0
		mov	[bp+var_C], 0
		push	2F8h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_82CCA
		xor	si, si
		jmp	short loc_82D03

loc_82CCA:
		push	2F9h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_82CDC
		mov	si, 2
		jmp	short loc_82D03

loc_82CDC:
		push	2FAh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_82CEE
		mov	si, 4
		jmp	short loc_82D03

loc_82CEE:
		push	2FBh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_82D00
		mov	si, 6
		jmp	short loc_82D03

loc_82D00:
		mov	si, 8

loc_82D03:
		push	100h
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	si
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_LoadAndUpload_46E20
		add	sp, 4
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_82D74
		cmp	[bp+var_26], 0
		jz	short loc_82D74
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82D74

loc_82D74:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_82DAC
		cmp	[bp+var_26], 0
		jz	short loc_82DAC
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82DAC

loc_82DAC:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_12]
		push	ax
		mov	ax, si
		inc	ax
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	byte ptr [bp+var_1C], 0
		mov	byte ptr [bp+var_1C+1], 0
		mov	[bp+var_1A], 0
		push	100h
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		cmp	byte ptr [bp+var_10+2], 3
		jnz	short loc_82E48
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		push	large [bp+var_12]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_82E4F

loc_82E48:
		mov	edx, [bp+var_10]
		mov	ax, word ptr [bp+var_12]

loc_82E4F:
		push	dx
		push	ax
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_8]
		push	ax
		call	sub_13BB6
		pop	cx
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_46F0A
		add	sp, 0Ah
		xor	eax, eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_20], 96h
		mov	eax, dword_5E7D3
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_46E45
		add	sp, 0Ah
		lea	ax, [bp+var_8]
		push	ax
		call	sub_13CEA
		pop	cx
		push	0
		lea	ax, [bp+var_8]
		push	ax
		call	sub_13C38
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	byte ptr [bp+var_10+3], 0
		jz	short loc_82F03
		cmp	[bp+var_12], 0
		jz	short loc_82F03
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_82F03

loc_82F03:
		mov	[bp+var_12], 0
		mov	byte ptr [bp+var_10+3], 0
		mov	[bp+var_C], 0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	sub_13AAE
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		pop	si
		leave
		retf
sub_82C40		endp
ovr233		ends
