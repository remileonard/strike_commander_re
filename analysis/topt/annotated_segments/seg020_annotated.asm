seg020		segment	para public 'CODE' use16
		assume cs:seg020
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 0FDh, 2, 88h, 44h, 83h, 0C4h, 2, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADCA		proc far

var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= dword ptr -16Ch
var_168		= byte ptr -168h
var_166		= word ptr -166h
var_116		= word ptr -116h
var_C6		= word ptr -0C6h
var_B8		= word ptr -0B8h
var_57		= dword ptr -57h
var_4B		= word ptr -4Bh
var_47		= dword ptr -47h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_1E		= word ptr -1Eh
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
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

		push	bp
		mov	bp, sp
		sub	sp, 174h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	[bp+var_5], al
		call	PagedMemory_DetectDriverSignatureA_30BB4
		push	[bp+arg_2]
		lea	ax, [bp+var_C6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	1C29h
		lea	ax, [bp+var_C6]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	0
		push	0
		push	ss
		lea	ax, [bp+var_C6]
		push	ax
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_116]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		and	byte ptr [si+79h], 0FDh
		mov	al, [bp+arg_C]
		and	ax, 1
		and	byte ptr [si+79h], 0FBh
		shl	al, 2
		or	[si+79h], al
		lea	ax, [bp+var_116]
		push	ax
		call	StreamReader_ParseFormattedValueB_40BF9
		add	sp, 2
		or	ax, ax
		jnz	short loc_AE6E
		push	ds
		lea	ax, [bp+var_116]
		push	ax
		call	sub_993C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE6E
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_AE6E:
		push	1
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		mov	bx, [bp+var_B8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_4B]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_AEA4
		mov	eax, [bp+var_57]
		jmp	short loc_AEA8

loc_AEA4:
		mov	eax, [bp+var_47]

loc_AEA8:
		add	eax, 10h
		mov	[bp+var_A], eax
		push	1C0Ch
		push	1
		push	large [bp+var_A]
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_5C55
		add	sp, 0Ah
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_5D59
		add	sp, 2
		mov	[bp+var_C], dx
		mov	ax, [bp+var_C]
		inc	ax
		mov	[bp+var_E], ax
		mov	[bp+var_10], 0
		push	[bp+var_E]
		push	[bp+var_10]
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_ReadEntryInto_43519
		add	sp, 8
		push	[bp+var_E]
		push	[bp+var_10]
		call	AIL_register_driver_4E5F
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0FFFFh
		jnz	short loc_AF10

loc_AF10:
		push	word ptr [si+4]
		call	sub_4F2D
		add	sp, 2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+2]
		mov	[si+6], ax
		cmp	di, 0FFFFh
		jnz	short loc_AF37
		les	bx, [bp+var_4]
		mov	di, es:[bx+0Ch]

loc_AF37:
		cmp	[bp+arg_6], 0FFFFh
		jnz	short loc_AF47
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Eh]
		mov	[bp+arg_6], ax

loc_AF47:
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_AF57
		les	bx, [bp+var_4]
		mov	ax, es:[bx+10h]
		mov	[bp+arg_8], ax

loc_AF57:
		cmp	[bp+arg_A], 0FFFFh
		jnz	short loc_AF67
		les	bx, [bp+var_4]
		mov	ax, es:[bx+12h]
		mov	[bp+arg_A], ax

loc_AF67:
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	sub_4F53
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_AF9F
		call	PagedMemory_DetectDriverSignatureB_30BC5
		call	sub_35DEB
		push	1B80h
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2

loc_AF9F:
		cmp	byte_4CA58, 5
		jnz	short loc_AFD1
		cmp	dword_4EF20, 0
		jz	short loc_AFB3
		mov	ax, 1
		jmp	short loc_AFB5

loc_AFB3:
		xor	ax, ax

loc_AFB5:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AFD1
		push	1C0Ch
		push	1
		push	large 5000h
		push	653Ch
		call	sub_5C55
		add	sp, 0Ah

loc_AFD1:
		mov	al, 1
		mov	byte_4CA67, al
		mov	ah, 0
		mov	[bp+var_12], ax
		cmp	byte_4CA58, 4
		jnz	short loc_AFE7
		mov	ax, 1
		jmp	short loc_AFE9

loc_AFE7:
		xor	ax, ax

loc_AFE9:
		and	ax, 1
		and	byte ptr [si+79h], 0FDh
		shl	al, 1
		or	[si+79h], al
		mov	al, [si+79h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_B016
		mov	[si+7Ah], di
		mov	dx, di
		add	dx, 4
		mov	al, 83h
		out	dx, al
		jmp	short loc_B00E

loc_B00E:
		mov	dx, di
		add	dx, 5
		mov	al, 0Bh
		out	dx, al

loc_B016:
		push	[bp+var_12]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	sub_4F59
		add	sp, 0Ch
		or	byte ptr [si+79h], 1
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+2], 3
		jz	short loc_B03F
		jmp	loc_B2D6

loc_B03F:
		push	word ptr [si+4]
		call	sub_50A7
		add	sp, 2
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_B096
		mov	dx, 2
		mov	ax, [bp+var_14]
		imul	dx
		mov	[bp+var_14], ax
		push	1C0Ch
		push	1
		movzx	eax, [bp+var_14]
		push	eax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_5C55
		add	sp, 0Ah
		push	[bp+var_14]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_5D59
		add	sp, 2
		push	dx
		push	ax
		push	word ptr [si+4]
		call	sub_50AD
		add	sp, 8

loc_B096:
		push	1C2Eh
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_24], 2Eh
		mov	byte ptr [bp+var_24+1], 0
		mov	ax, [bp+var_4]
		add	ax, 4
		push	[bp+var_2]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_166]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_166]
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		mov	bx, [si+1Ch]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	1
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_4B]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_B115
		mov	eax, [bp+var_57]
		jmp	short loc_B119

loc_B115:
		mov	eax, [bp+var_47]

loc_B119:
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 0
		jnz	short loc_B127
		jmp	loc_B2D6

loc_B127:
		cmp	byte_4CA67, 0
		jnz	short loc_B131
		jmp	loc_B2D6

loc_B131:
		mov	[bp+var_32], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_30], ax
		lea	ax, [bp+var_32]
		mov	word_4D392, ax
		mov	[bp+var_32], 1BCh
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	0
		push	1
		push	large [bp+var_28]
		lea	ax, [bp+var_32]
		push	ax
		call	sub_5C55
		add	sp, 0Ah
		lea	ax, [bp+var_32]
		push	ax
		call	sub_5D59
		add	sp, 2
		mov	word ptr [bp+var_40+2], dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	0
		mov	al, [bp+var_38]
		push	ax
		push	word ptr [bp+var_3C+2]
		push	word ptr [bp+var_3C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_ReadEntryInto_43519
		add	sp, 8
		mov	[bp+var_170], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_16E], ax
		lea	ax, [bp+var_170]
		mov	word_4D392, ax
		mov	[bp+var_170], 1BCh
		mov	[bp+var_16C], 0
		mov	[bp+var_168], 0
		mov	[bp+var_174], 0
		mov	[bp+var_172], 0FFFFh
		push	si
		lea	ax, [bp+var_174]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, [bp+var_32]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	sub_B869
		add	sp, 6
		cmp	[bp+var_174], 0
		jz	short loc_B242
		push	[bp+var_172]
		mov	bx, [bp+var_174]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_B242

loc_B242:
		jmp	short loc_B244

loc_B244:
		cmp	[bp+var_174], 0
		jz	short loc_B26C
		push	[bp+var_172]
		mov	bx, [bp+var_174]
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_B268
		mov	ax, 1
		jmp	short loc_B26A

loc_B268:
		xor	ax, ax

loc_B26A:
		jmp	short loc_B26E

loc_B26C:
		mov	al, 1

loc_B26E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B244
		lea	ax, [bp+var_174]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_170]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_37], 0
		jz	short loc_B2B4
		cmp	[bp+var_3C], 0
		jz	short loc_B2B4
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B2B4

loc_B2B4:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	2
		lea	ax, [bp+var_32]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_B2D6:
		cmp	[bp+var_5], 0
		jz	short loc_B2E1
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_B2E1:
		push	2
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_ADCA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2F4		proc far

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
		call	sub_5BC6
		add	sp, 2
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_PrepareForRead_41432
		add	sp, 2

loc_B319:
		push	large 0FFFFFFFFh
		push	large 6
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		cmp	byte ptr [bp+var_6+1], 0FFh
		jnz	short loc_B33C
		pop	di
		pop	si
		leave
		retf

loc_B33C:
		mov	al, byte ptr [bp+var_6+1]
		cmp	al, [bp+arg_5]
		jnz	short loc_B319
		mov	al, byte ptr [bp+var_6]
		cmp	al, [bp+arg_4]
		jnz	short loc_B319
		push	large [bp+var_4]
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_SeekVariant_412E2
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2
		push	ds
		push	offset word_4EF26
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	[bp+var_7], al
		call	PagedMemory_DetectDriverSignatureA_30BB4
		push	0
		push	1
		movzx	eax, word_4EF26
		push	eax
		push	di
		call	sub_5C55
		add	sp, 0Ah
		push	di
		call	sub_5D59
		add	sp, 2
		mov	bx, word_4EF26
		mov	es, dx
		xchg	bx, ax
		mov	es:[bx], ax
		push	large 0FFFFFFFFh
		mov	ax, word_4EF26
		sub	ax, 2
		movzx	eax, ax
		push	eax
		push	di
		call	sub_5D59
		add	sp, 2
		add	ax, 2
		push	dx
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		cmp	[bp+var_7], 0
		jz	short loc_B3E3
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_B3E3:
		pop	di
		pop	si
		leave
		retf
sub_B2F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3E7		proc far

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
		call	sub_50CB
		add	sp, 6
		or	ax, ax
		jz	short loc_B40D
		jmp	loc_B49D

loc_B40D:
		mov	[bp+var_A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_8], ax
		lea	ax, [bp+var_A]
		mov	word_4D392, ax
		mov	[bp+var_A], 1BCh
		mov	[bp+var_6], 0
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		lea	ax, [bp+var_A]
		push	ax
		push	si
		push	cs
		call	near ptr sub_B2F4
		add	sp, 6
		lea	ax, [bp+var_A]
		push	ax
		call	sub_5D59
		add	sp, 2
		or	ax, dx
		jz	short loc_B473
		lea	ax, [bp+var_A]
		push	ax
		call	sub_5D59
		add	sp, 2
		push	dx
		push	ax
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	sub_50B9
		add	sp, 0Ah
		jmp	short loc_B48F

loc_B473:
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_B48A
		push	0D003h
		call	sub_13451
		add	sp, 2
		jmp	short loc_B48F

loc_B48A:
		mov	byte_4A67E, 4

loc_B48F:
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_B49D:
		pop	si
		leave
		retf
sub_B3E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4A0		proc far

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
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_AC], 480h
		mov	[bp+var_4B], 100h
		mov	[bp+var_4F], 0
		mov	[bp+var_AC], 498h
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
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_B54C
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B53F
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax

loc_B53F:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_B54C:
		push	large 44494D58h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndReadC_4283E
		add	sp, 6
		or	ax, ax
		jnz	short loc_B566
		jmp	loc_B631

loc_B566:
		jmp	loc_B61D

loc_B569:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_426EE
		add	sp, 2
		or	ax, ax
		jnz	short loc_B57D
		jmp	loc_B602

loc_B57D:
		cmp	[bp+var_3F], 44494D58h
		jnz	short loc_B58C
		mov	ax, 1
		jmp	short loc_B58E

loc_B58C:
		xor	ax, ax

loc_B58E:
		or	ax, ax
		jz	short loc_B602
		lea	ax, [bp+var_AC]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 424D4954h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B5F4
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_4], ax
		jmp	short loc_B5EA

loc_B5CA:
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_B3E7
		add	sp, 4

loc_B5EA:
		mov	ax, [bp+var_4]
		dec	[bp+var_4]
		or	ax, ax
		jnz	short loc_B5CA

loc_B5F4:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		dec	di

loc_B602:
		mov	eax, [bp+var_36]
		mov	[bp+var_47], eax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		or	ax, ax
		jz	short loc_B61D
		jmp	short loc_B624

loc_B61D:
		or	di, di
		jz	short loc_B624
		jmp	loc_B569

loc_B624:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ResetIfSet_42D6B
		add	sp, 2

loc_B631:
		mov	[bp+var_AC], 498h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_AC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_B4A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B657		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+79h]
		and	ax, 1
		or	al, al
		jz	short loc_B6B1
		mov	al, byte_4CA67
		mov	ah, 0
		push	ax
		push	ds
		push	offset aSCSCSCFY
		push	word ptr [si+4]
		call	AIL_shutdown_driver_5008
		add	sp, 8
		push	word ptr [si+4]
		call	AIL_release_driver_handle_4F05
		add	sp, 2
		mov	word ptr [si+4], 0FFFFh
		and	byte ptr [si+79h], 0FEh
		mov	al, [si+79h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_B6B1
		mov	dx, [si+7Ah]
		add	dx, 4
		mov	al, 83h
		out	dx, al
		jmp	short loc_B6A8

loc_B6A8:
		mov	dx, [si+7Ah]
		add	dx, 5
		mov	al, 0Fh
		out	dx, al

loc_B6B1:
		pop	si
		pop	bp
		retf
sub_B657		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6B4		proc far
		push	bp
		mov	bp, sp
		mov	word_4EF1C, 1B4h
		mov	ax, word_4D392
		mov	word_4EF1E, ax
		mov	word_4D392, 653Ch
		mov	word_4EF1C, 1BCh
		mov	dword_4EF20, 0
		mov	byte_4EF24, 0
		pop	bp
		retf
sub_B6B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6DF		proc far
		push	bp
		mov	bp, sp
		push	2
		push	653Ch
		call	sub_5C1C
		add	sp, 4
		pop	bp
sub_B6DF		endp
seg020		ends
