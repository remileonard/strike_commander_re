seg035		segment	para public 'CODE' use16
		assume cs:seg035
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 60h, 9Ah, 0F6h, 2, 0DEh, 55h, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19DD9		proc far

var_154		= word ptr -154h
var_112		= word ptr -112h
var_110		= word ptr -110h
var_10E		= word ptr -10Eh
var_10C		= word ptr -10Ch
var_10A		= dword ptr -10Ah
var_106		= byte ptr -106h
var_104		= word ptr -104h
var_B4		= word ptr -0B4h
var_A6		= word ptr -0A6h
var_45		= dword ptr -45h
var_39		= word ptr -39h
var_35		= dword ptr -35h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 154h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		lea	ax, [bp+var_A6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		les	bx, word_5D974
		mov	al, es:[bx]
		mov	[bp+var_5], al
		call	PagedMemory_DetectDriverSignatureA_42BF9
		push	[bp+arg_2]
		lea	ax, [bp+var_B4]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	18CFh
		lea	ax, [bp+var_B4]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	large 0
		push	ss
		lea	ax, [bp+var_B4]
		push	ax
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_104]
		push	ax
		call	Path_BuildDataPath_1F0C4
		add	sp, 0Eh
		and	byte ptr [si+79h], 0FDh
		mov	al, [bp+arg_C]
		and	ax, 1
		and	byte ptr [si+79h], 0FBh
		shl	al, 2
		or	[si+79h], al
		push	1
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		mov	bx, [bp+var_A6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_A6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_39]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_19E86
		mov	eax, [bp+var_45]
		jmp	short loc_19E8A

loc_19E86:
		mov	eax, [bp+var_35]

loc_19E8A:
		add	eax, 10h
		mov	[bp+var_A], eax
		push	18B2h
		push	1
		push	eax
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_1914B
		add	sp, 0Ah
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_19287
		pop	cx
		mov	[bp+var_C], dx
		mov	ax, [bp+var_C]
		inc	ax
		mov	word ptr [bp+var_10+2], ax
		mov	word ptr [bp+var_10], 0
		call	PagedMemory_DetectDriverSignatureA_42BF9
		push	large [bp+var_10]
		push	0
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_54A85
		add	sp, 8
		push	large [bp+var_10]
		call	AIL_register_driver_9A4B
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0FFFFh
		jnz	short loc_19EF8
		push	0D001h
		call	sub_9D47
		pop	cx

loc_19EF8:
		push	word ptr [si+4]
		call	sub_9B19
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+2]
		mov	[si+6], ax
		cmp	di, 0FFFFh
		jnz	short loc_19F1A
		mov	di, es:[bx+0Ch]

loc_19F1A:
		cmp	[bp+arg_6], 0FFFFh
		jnz	short loc_19F2A
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Eh]
		mov	[bp+arg_6], ax

loc_19F2A:
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_19F3A
		les	bx, [bp+var_4]
		mov	ax, es:[bx+10h]
		mov	[bp+arg_8], ax

loc_19F3A:
		cmp	[bp+arg_A], 0FFFFh
		jnz	short loc_19F4A
		les	bx, [bp+var_4]
		mov	ax, es:[bx+12h]
		mov	[bp+arg_A], ax

loc_19F4A:
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	sub_9B3F
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_19F7E
		call	PagedMemory_DetectDriverSignatureB_42C0A
		call	sub_47E06
		push	1828h
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx

loc_19F7E:
		cmp	byte_5CF9C, 5
		jnz	short loc_19FB0
		cmp	dword_5FDF8, 0
		jz	short loc_19F92
		mov	ax, 1
		jmp	short loc_19F94

loc_19F92:
		xor	ax, ax

loc_19F94:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19FB0
		push	18B2h
		push	1
		push	large 5000h
		push	60D4h
		call	sub_1914B
		add	sp, 0Ah

loc_19FB0:
		mov	al, 1
		mov	byte_5CFA5, al
		mov	ah, 0
		mov	[bp+var_12], ax
		cmp	byte_5CF9C, 4
		jnz	short loc_19FC6
		mov	ax, 1
		jmp	short loc_19FC8

loc_19FC6:
		xor	ax, ax

loc_19FC8:
		and	ax, 1
		and	byte ptr [si+79h], 0FDh
		shl	al, 1
		or	[si+79h], al
		mov	al, [si+79h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_19FFA
		mov	ax, [bp+arg_E]
		mov	[si+7Ah], ax
		mov	dx, [si+7Ah]
		add	dx, 4
		mov	al, 83h
		out	dx, al
		jmp	short loc_19FF1

loc_19FF1:
		mov	dx, [si+7Ah]
		add	dx, 5
		mov	al, 0Bh
		out	dx, al

loc_19FFA:
		push	[bp+var_12]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	sub_9B45
		add	sp, 0Ch
		or	byte ptr [si+79h], 1
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+2], 3
		jz	short loc_1A023
		jmp	loc_1A2B9

loc_1A023:
		push	word ptr [si+4]
		call	sub_9C93
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_1A06E
		mov	dx, 2
		mov	ax, di
		imul	dx
		mov	di, ax
		push	18B2h
		push	1
		movzx	eax, di
		push	eax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_1914B
		add	sp, 0Ah
		push	di
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_19287
		pop	cx
		push	dx
		push	ax
		push	word ptr [si+4]
		call	sub_9C99
		add	sp, 8

loc_1A06E:
		cmp	byte_5CF9C, 3
		jnz	short loc_1A0D4
		push	18D4h
		lea	ax, [bp+var_20]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_28+2], 2Eh
		mov	byte ptr [bp+var_28+3], 0
		mov	ax, [bp+var_4]
		add	ax, 4
		push	[bp+var_2]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_28+2]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ss
		lea	ax, word ptr [bp+var_28+2]
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_154]
		push	ax
		call	Path_BuildDataPath_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_154]
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		mov	bx, [si+1Ch]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_1A0D4:
		push	1
		lea	ax, [bp+var_A6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_39]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_1A0F4
		mov	eax, [bp+var_45]
		jmp	short loc_1A0F8

loc_1A0F4:
		mov	eax, [bp+var_35]

loc_1A0F8:
		mov	[bp+var_16], eax
		cmp	[bp+var_16], 0
		jnz	short loc_1A106
		jmp	loc_1A2B9

loc_1A106:
		cmp	byte_5CFA5, 0
		jnz	short loc_1A110
		jmp	loc_1A2B9

loc_1A110:
		mov	[bp+var_20], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_1E], ax
		lea	ax, [bp+var_20]
		mov	word_5DD68, ax
		mov	[bp+var_20], 975h
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 0
		mov	[bp+var_2A], 0
		mov	byte ptr [bp+var_28+2], 2
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		push	0
		push	1
		push	large [bp+var_16]
		push	ax
		call	sub_1914B
		add	sp, 0Ah
		lea	ax, [bp+var_20]
		push	ax
		call	sub_19287
		pop	cx
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[bp+var_2A], eax
		mov	byte ptr [bp+var_28+2], 2
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		cmp	byte ptr [bp+var_28+2], 3
		jnz	short loc_1A1A0
		push	0
		mov	al, byte ptr [bp+var_28+2]
		push	ax
		push	large [bp+var_2A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1A1A7

loc_1A1A0:
		mov	edx, [bp+var_28]
		mov	ax, word ptr [bp+var_2A]

loc_1A1A7:
		push	dx
		push	ax
		push	1
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_54A85
		add	sp, 8
		mov	[bp+var_10E], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_10C], ax
		lea	ax, [bp+var_10E]
		mov	word_5DD68, ax
		mov	[bp+var_10E], 975h
		mov	[bp+var_10A], 0
		mov	[bp+var_106], 0
		mov	[bp+var_112], 0
		mov	[bp+var_110], 0FFFFh
		push	si
		lea	ax, [bp+var_112]
		push	ax
		call	sub_1A714
		add	sp, 4
		push	0
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	sub_1A839
		add	sp, 6
		cmp	[bp+var_112], 0
		jz	short loc_1A229
		push	[bp+var_110]
		mov	bx, [bp+var_112]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1A229

loc_1A229:
		cmp	[bp+var_112], 0
		jz	short loc_1A251
		push	[bp+var_110]
		mov	bx, [bp+var_112]
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_1A24D
		mov	ax, 1
		jmp	short loc_1A24F

loc_1A24D:
		xor	ax, ax

loc_1A24F:
		jmp	short loc_1A253

loc_1A251:
		mov	al, 1

loc_1A253:
		mov	ah, 0
		or	ax, ax
		jz	short loc_1A229
		lea	ax, [bp+var_112]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_10E]
		push	ax
		call	sub_19116
		add	sp, 4
		cmp	byte ptr [bp+var_28+3], 0
		jz	short loc_1A297
		cmp	[bp+var_2A], 0
		jz	short loc_1A297
		push	0
		mov	al, byte ptr [bp+var_28+2]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1A297

loc_1A297:
		mov	[bp+var_2A], 0
		mov	byte ptr [bp+var_28+3], 0
		mov	[bp+var_24], 0
		push	2
		lea	ax, [bp+var_20]
		push	ax
		call	sub_19116
		add	sp, 4

loc_1A2B9:
		cmp	[bp+var_5], 0
		jz	short loc_1A2C4
		call	PagedMemory_DetectDriverSignatureB_42C0A

loc_1A2C4:
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_19DD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A2D7		proc far

var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_5		= byte ptr  0Bh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	sub_190C8
		pop	cx
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_PrepareForRead_5299E
		pop	cx

loc_1A2F8:
		push	large 0FFFFFFFFh
		push	large 6
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		cmp	byte ptr [bp+var_6+1], 0FFh
		jnz	short loc_1A31A
		jmp	loc_1A3BD

loc_1A31A:
		mov	al, byte ptr [bp+var_6+1]
		cmp	al, [bp+arg_5]
		jnz	short loc_1A2F8
		mov	al, byte ptr [bp+var_6]
		cmp	al, [bp+arg_4]
		jnz	short loc_1A2F8
		push	large [bp+var_4]
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_SeekVariant_5284E
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2
		push	ds
		push	offset word_5FDFE
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		les	bx, word_5D974
		mov	al, es:[bx]
		mov	[bp+var_7], al
		call	PagedMemory_DetectDriverSignatureA_42BF9
		push	0
		push	1
		movzx	eax, word_5FDFE
		push	eax
		push	di
		call	sub_1914B
		add	sp, 0Ah
		push	di
		call	sub_19287
		pop	cx
		mov	bx, word_5FDFE
		mov	es, dx
		xchg	bx, ax
		mov	es:[bx], ax
		push	large 0FFFFFFFFh
		mov	ax, word_5FDFE
		sub	ax, 2
		movzx	eax, ax
		push	eax
		push	di
		call	sub_19287
		pop	cx
		add	ax, 2
		push	dx
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		cmp	[bp+var_7], 0
		jz	short loc_1A3BD
		call	PagedMemory_DetectDriverSignatureB_42C0A

loc_1A3BD:
		pop	di
		pop	si
		leave
		retf
sub_1A2D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A3C1		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	sub_9CB7
		add	sp, 6
		or	ax, ax
		jz	short loc_1A3E7
		jmp	loc_1A46E

loc_1A3E7:
		mov	[bp+var_A], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_8], ax
		lea	ax, [bp+var_A]
		mov	word_5DD68, ax
		mov	[bp+var_A], 975h
		mov	[bp+var_6], 0
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1A2D7
		add	sp, 6
		lea	ax, [bp+var_A]
		push	ax
		call	sub_19287
		pop	cx
		or	ax, dx
		jz	short loc_1A446
		lea	ax, [bp+var_A]
		push	ax
		call	sub_19287
		pop	cx
		push	dx
		push	ax
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	sub_9CA5
		add	sp, 0Ah
		jmp	short loc_1A460

loc_1A446:
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jz	short loc_1A45B
		push	0D003h
		call	sub_9D47
		pop	cx
		jmp	short loc_1A460

loc_1A45B:
		mov	byte_5B774, 4

loc_1A460:
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	sub_19116
		add	sp, 4

loc_1A46E:
		pop	si
		leave
		retf
sub_1A3C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A471		proc far

var_AC		= word ptr -0ACh
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_47		= dword ptr -47h
var_3F		= dword ptr -3Fh
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0ACh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 1
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
		push	[bp+arg_2]
		lea	ax, [bp+var_AC]
		push	ax
		mov	bx, [bp+var_AC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 52494458h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_1A517
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_1A50C
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	di, ax

loc_1A50C:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_1A517:
		push	large 44494D58h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndReadC_53DAA
		add	sp, 6
		or	ax, ax
		jnz	short loc_1A531
		jmp	loc_1A5EE

loc_1A531:
		jmp	loc_1A5DC

loc_1A534:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_53C5A
		pop	cx
		or	ax, ax
		jnz	short loc_1A546
		jmp	loc_1A5C5

loc_1A546:
		cmp	[bp+var_3F], 44494D58h
		jnz	short loc_1A555
		mov	ax, 1
		jmp	short loc_1A557

loc_1A555:
		xor	ax, ax

loc_1A557:
		or	ax, ax
		jz	short loc_1A5C5
		lea	ax, [bp+var_AC]
		push	ax
		call	sub_541A0
		pop	cx
		push	0
		push	large 424D4954h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_1A5B9
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_4], ax
		jmp	short loc_1A5AF

loc_1A58F:
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1A3C1
		add	sp, 4

loc_1A5AF:
		mov	ax, [bp+var_4]
		dec	[bp+var_4]
		or	ax, ax
		jnz	short loc_1A58F

loc_1A5B9:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		dec	di

loc_1A5C5:
		mov	eax, [bp+var_36]
		mov	[bp+var_47], eax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		or	ax, ax
		jnz	short loc_1A5E3

loc_1A5DC:
		or	di, di
		jz	short loc_1A5E3
		jmp	loc_1A534

loc_1A5E3:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ResetIfSet_542D7
		pop	cx

loc_1A5EE:
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
		pop	di
		pop	si
		leave
		retf
sub_1A471		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A612		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+79h]
		and	ax, 1
		or	al, al
		jz	short loc_1A66A
		mov	al, byte_5CFA5
		mov	ah, 0
		push	ax
		push	ds
		push	offset aBye
		push	word ptr [si+4]
		call	AIL_shutdown_driver_9BF4
		add	sp, 8
		push	word ptr [si+4]
		call	AIL_release_driver_handle_9AF1
		pop	cx
		mov	word ptr [si+4], 0FFFFh
		and	byte ptr [si+79h], 0FEh
		mov	al, [si+79h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_1A66A
		mov	dx, [si+7Ah]
		add	dx, 4
		mov	al, 83h
		out	dx, al
		jmp	short loc_1A661

loc_1A661:
		mov	dx, [si+7Ah]
		add	dx, 5
		mov	al, 0Fh
		out	dx, al

loc_1A66A:
		pop	si
		pop	bp
		retf
sub_1A612		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A66D		proc far
		push	bp
		mov	bp, sp
		mov	word_5FDF4, 96Dh
		mov	ax, word_5DD68
		mov	word_5FDF6, ax
		mov	word_5DD68, 60D4h
		mov	word_5FDF4, 975h
		mov	dword_5FDF8, 0
		mov	byte_5FDFC, 0
		pop	bp
		retf
sub_1A66D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A698		proc far
		push	bp
		mov	bp, sp
		push	2
		push	60D4h
sub_1A698		endp
seg035		ends
