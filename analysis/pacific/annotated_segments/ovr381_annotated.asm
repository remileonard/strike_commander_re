ovr381		segment	para public 'OVERLAY' use16
		assume cs:ovr381
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D4FA0		proc far

var_100		= word ptr -100h
var_A3		= dword ptr -0A3h
var_9F		= dword ptr -9Fh
var_9B		= dword ptr -9Bh
var_93		= byte ptr -93h
var_8E		= word ptr -8Eh
var_8A		= dword ptr -8Ah
var_58		= word ptr -58h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 100h
		push	si
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		push	dx
		push	ax
		push	ds
		push	offset aStrttext
		push	large [bp+var_4]
		lea	ax, [bp+var_58]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_100]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_100], 508h
		mov	[bp+var_9F], 100h
		mov	[bp+var_A3], 0
		mov	[bp+var_100], 520h
		push	1
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		mov	bx, [bp+var_100]
		call	dword ptr [bx+14h]
		add	sp, 6
		xor	si, si
		push	0
		push	large 4E474542h
		lea	ax, [bp+var_100]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_D50AB
		jmp	short loc_D5085

loc_D503F:
		push	[bp+var_8E]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	bx, si
		shl	bx, 1
		mov	[bx+6A28h], ax
		push	ds
		mov	bx, si
		shl	bx, 1
		push	word ptr [bx+6A28h]
		lea	ax, [bp+var_100]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		inc	si
		cmp	si, 14h
		jnz	short loc_D5076
		push	7734h
		call	sub_1DDFE
		pop	cx

loc_D5076:
		mov	eax, [bp+var_8A]
		mov	[bp+var_9B], eax
		mov	[bp+var_93], 0

loc_D5085:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_100]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_D503F
		jmp	short loc_D50AB

loc_D50A0:
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+6A28h], 0
		inc	si

loc_D50AB:
		cmp	si, 14h
		jl	short loc_D50A0
		mov	[bp+var_100], 520h
		lea	ax, [bp+var_100]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_100]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_D4FA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D50D3		proc far

var_150		= word ptr -150h
var_D8		= word ptr -0D8h
var_88		= word ptr -88h
var_27		= dword ptr -27h
var_23		= dword ptr -23h
var_1B		= word ptr -1Bh
var_17		= dword ptr -17h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 150h
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_88]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		push	dx
		push	ax
		push	ds
		push	offset aStrtspch_2
		push	large [bp+var_4]
		lea	ax, [bp+var_D8]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		mov	bx, [bp+var_88]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_88]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_23]
		mov	[bp+var_C], eax
		mov	ax, [bp+var_1B]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_D5165
		mov	eax, [bp+var_27]
		jmp	short loc_D5169

loc_D5165:
		mov	eax, [bp+var_17]

loc_D5169:
		mov	edx, [bp+var_C]
		add	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jz	short loc_D51D8
		lea	ax, [bp+var_150]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_10]
		push	large [bp+var_C]
		lea	ax, [bp+var_88]
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		xor	si, si
		jmp	short loc_D51C4

loc_D51A9:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [di]
		add	dx, ax
		push	dx
		push	si
		lea	ax, [bp+var_150]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D51C4:
		cmp	si, 0Ah
		jle	short loc_D51A9
		push	2
		lea	ax, [bp+var_150]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_D51D8:
		push	3
		lea	ax, [bp+var_88]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_23]
		mov	[bp+var_C], eax
		mov	ax, [bp+var_1B]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_D5200
		mov	eax, [bp+var_27]
		jmp	short loc_D5204

loc_D5200:
		mov	eax, [bp+var_17]

loc_D5204:
		mov	edx, [bp+var_C]
		add	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jz	short loc_D5276
		lea	ax, [bp+var_150]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_10]
		push	large [bp+var_C]
		lea	ax, [bp+var_88]
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		xor	si, si
		jmp	short loc_D5262

loc_D5244:
		push	3
		mov	ax, si
		add	ax, 0Bh
		imul	ax, ax, 0Ah
		mov	dx, [di]
		add	dx, ax
		push	dx
		push	si
		lea	ax, [bp+var_150]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D5262:
		cmp	si, 7
		jle	short loc_D5244
		push	2
		lea	ax, [bp+var_150]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_D5276:
		push	2
		lea	ax, [bp+var_88]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_D50D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5289		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		cmp	byte_7CB1B, 0
		jz	short loc_D52F2
		cmp	word_79E69, 0
		jz	short loc_D52F2
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aStrtspch_3
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_D52DC
		call	sub_5EFE1

loc_D52DC:
		push	0
		push	2
		push	[bp+arg_2]
		push	[bp+arg_0]
		lea	ax, [bp+var_50]
		push	ax
		call	sub_5EF07
		add	sp, 0Ah

loc_D52F2:
		leave
		retf
sub_D5289		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D52F4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_7D180, 0
		jz	short loc_D5328
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_D530F
		call	sub_5EFE1

loc_D530F:
		push	0
		push	2
		mov	ax, [bp+arg_0]
		imul	ax, ax, 0Ah
		mov	dx, word_7D154
		add	dx, ax
		push	dx
		call	sub_5EF3D
		add	sp, 6

loc_D5328:
		pop	bp
		retf
sub_D52F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D532A		proc far

var_D2		= word ptr -0D2h
var_5A		= word ptr -5Ah
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0D2h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	54h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	[bp+arg_2]
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		xor	si, si
		jmp	short loc_D53BE

loc_D5393:
		push	2
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, word ptr [bp+var_A]
		push	ax
		mov	ax, si
		imul	ax, ax, 5
		mov	dx, [di]
		add	dx, ax
		push	dx
		call	sub_76281
		add	sp, 4
		inc	si

loc_D53BE:
		cmp	si, [bp+arg_4]
		jl	short loc_D5393
		push	2
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		cmp	[bp+var_5], 0
		jz	short loc_D53F6
		cmp	[bp+var_A], 0
		jz	short loc_D53F6
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D53F6

loc_D53F6:
		pop	di
		pop	si
		leave
		retf
sub_D532A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D53FA		proc far

var_14C		= word ptr -14Ch
var_EF		= word ptr -0EFh
var_D4		= word ptr -0D4h
var_73		= dword ptr -73h
var_6F		= dword ptr -6Fh
var_67		= word ptr -67h
var_63		= dword ptr -63h
var_5C		= word ptr -5Ch
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	[bp+arg_4]
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	[bp+arg_2]
		lea	ax, [bp+var_D4]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_6F]
		mov	[bp+var_6], eax
		mov	ax, [bp+var_67]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_D5470
		mov	eax, [bp+var_73]
		jmp	short loc_D5474

loc_D5470:
		mov	eax, [bp+var_63]

loc_D5474:
		mov	edx, [bp+var_6]
		add	edx, eax
		mov	[bp+var_A], edx
		push	edx
		push	large [bp+var_6]
		lea	ax, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_7477
		add	sp, 0Ch
		mov	ax, [bp+var_EF]
		mov	[bp+var_2], ax
		mov	[si+1], ax
		xor	di, di
		jmp	short loc_D54C3

loc_D54A5:
		push	3
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 3
		push	dx
		push	di
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	di

loc_D54C3:
		cmp	di, [bp+var_2]
		jl	short loc_D54A5
		mov	byte ptr [si], 1
		mov	ax, [bp+var_2]
		mov	[bp+var_C], ax
		push	2
		lea	ax, [bp+var_14C]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D4]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_C]
		pop	di
		pop	si
		leave
		retf
sub_D53FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D54F6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	di, di
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 3567E0h
		jbe	short loc_D5542
		xor	si, si
		jmp	short loc_D5539

loc_D5512:
		push	418Dh
		push	si
		mov	ax, si
		imul	ax, ax, 85h
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	dx
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		call	sub_7575F
		or	al, al
		jz	short loc_D5533
		inc	di

loc_D5533:
		cmp	di, 2
		jge	short loc_D5542
		inc	si

loc_D5539:
		cmp	si, 8
		jl	short loc_D5512
		mov	al, 1
		jmp	short loc_D5544

loc_D5542:
		mov	al, 0

loc_D5544:
		pop	di
		pop	si
		pop	bp
		retf
sub_D54F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5548		proc far

var_2E		= word ptr -2Eh
var_F		= byte ptr -0Fh
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 97h
		push	si
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	di, di
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_2E]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		jmp	loc_D568B

loc_D55A8:
		mov	[bp+var_6], 8
		mov	eax, dword_7B29D
		mov	[bp+var_A], eax
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 97h
		push	1
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_75BF0
		add	sp, 4
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 0C7h
		push	word_7AF7E
		push	si
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_D564A
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	di
		cmp	di, [bp+arg_2]
		jnz	short loc_D5633
		mov	[bp+var_1], 1
		jmp	short loc_D564A

loc_D5633:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_2E]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_D564A:
		mov	eax, [bp+var_A]
		add	eax, [bp+var_6]
		cmp	eax, dword_7B29D
		ja	short loc_D565E
		mov	ax, 1
		jmp	short loc_D5660

loc_D565E:
		xor	ax, ax

loc_D5660:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D564A
		cmp	[bp+var_F], 0
		jz	short loc_D568B
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_1], 1
		mov	[bp+var_2], 1

loc_D568B:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5697
		jmp	loc_D55A8

loc_D5697:
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 0C7h
		mov	al, [bp+var_2]
		mov	[bp+var_B], al
		push	0
		lea	ax, [bp+var_2E]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		mov	al, [bp+var_B]
		pop	di
		pop	si
		leave
		retf
sub_D5548		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D56C6		proc far

var_1E		= word ptr -1Eh
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+10Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D56EF
		push	418Dh
		push	2
		mov	ax, di
		add	ax, 10Ah
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D56F3

loc_D56EF:
		mov	ax, [di+10Bh]

loc_D56F3:
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_D5724

loc_D56FA:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 10Dh
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_1E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D5724:
		cmp	si, [bp+var_2]
		jl	short loc_D56FA
		push	2
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+0Ah]
		mov	al, [bx+0Ch]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		push	ax
		call	sub_76259
		add	sp, 8
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5796
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D160
		push	4193h
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D5796:
		push	0
		push	[bp+arg_4]
		push	[bp+var_2]
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr sub_D5548
		add	sp, 8
		mov	[bp+var_3], al
		xor	si, si
		jmp	loc_D5846

loc_D57B1:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D57DA
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D57DA

loc_D57DA:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+112h], 0
		jz	short loc_D581C
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di+10Dh]
		or	ax, [bx+di+10Fh]
		jz	short loc_D581C
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+111h]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 10Dh
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D581C

loc_D581C:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+10Fh], 0
		mov	word ptr [bx+di+10Dh], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+112h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+113h], 0
		inc	si

loc_D5846:
		cmp	si, [bp+var_2]
		jge	short loc_D584E
		jmp	loc_D57B1

loc_D584E:
		cmp	byte_7D180, 0
		jz	short loc_D5861

loc_D5855:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D5855

loc_D5861:
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_D56C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5868		proc far

var_4A		= word ptr -4Ah
var_28		= word ptr -28h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_3], 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+214h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5899
		push	418Dh
		push	4
		mov	ax, [bp+arg_0]
		add	ax, 214h
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D58A0

loc_D5899:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+215h]

loc_D58A0:
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_D58D2

loc_D58A7:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		add	dx, 217h
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_28]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D58D2:
		cmp	si, [bp+var_2]
		jl	short loc_D58A7
		push	6
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+14h]
		mov	al, [bx+16h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 14h
		push	ax
		call	sub_76259
		add	sp, 8
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5944
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D164
		push	4196h
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D5944:
		mov	[bp+var_4], 0
		push	di
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	si, si
		mov	[bp+var_6], 0
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_4A]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		jmp	loc_D5AB3

loc_D5986:
		mov	[bp+var_A], 8
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	word ptr [di+8], 13Fh
		mov	word ptr [di+0Ah], 97h
		push	1
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_75BF0
		add	sp, 4
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	word ptr [di+8], 13Fh
		mov	word ptr [di+0Ah], 0C7h
		push	word_7AF7E
		push	di
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_D5A28
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	si
		cmp	si, [bp+var_2]
		jnz	short loc_D5A11
		mov	[bp+var_4], 1
		jmp	short loc_D5A28

loc_D5A11:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_4A]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_D5A28:
		call	sub_7575F
		or	al, al
		jz	short loc_D5A44
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		mov	al, 1
		jmp	loc_D5BA4

loc_D5A44:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_D5A58
		mov	ax, 1
		jmp	short loc_D5A5A

loc_D5A58:
		xor	ax, ax

loc_D5A5A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D5A44
		inc	[bp+var_6]
		cmp	[bp+var_6], 23h
		jnz	short loc_D5A70
		push	7
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D5A70:
		cmp	[bp+var_6], 1Bh
		jnz	short loc_D5AB3
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5AB3
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D166
		push	4199h
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D5AB3:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5ABF
		jmp	loc_D5986

loc_D5ABF:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		xor	si, si
		jmp	loc_D5B86

loc_D5AD2:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D5AFB
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D5AFB

loc_D5AFB:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+21Ch], 0
		jz	short loc_D5B4D
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx+217h]
		or	ax, [bx+219h]
		jz	short loc_D5B4D
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+21Bh]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		add	dx, 217h
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D5B4D

loc_D5B4D:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr [bx+219h], 0
		mov	word ptr [bx+217h], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+21Ch], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr [bx+21Dh], 0
		inc	si

loc_D5B86:
		cmp	si, [bp+var_2]
		jge	short loc_D5B8E
		jmp	loc_D5AD2

loc_D5B8E:
		cmp	byte_7D180, 0
		jz	short loc_D5BA1

loc_D5B95:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D5B95

loc_D5BA1:
		mov	al, [bp+var_3]

loc_D5BA4:
		pop	di
		pop	si
		leave
		retf
sub_D5868		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5BA8		proc far

var_1E		= word ptr -1Eh
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+3A3h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5BD1
		push	418Dh
		push	7
		mov	ax, di
		add	ax, 3A3h
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D5BD5

loc_D5BD1:
		mov	ax, [di+3A4h]

loc_D5BD5:
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_D5C06

loc_D5BDC:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 3A6h
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_1E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D5C06:
		cmp	si, [bp+var_2]
		jl	short loc_D5BDC
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+23h]
		mov	al, [bx+25h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 23h
		push	ax
		call	sub_76259
		add	sp, 8
		push	0Bh
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	1
		push	[bp+arg_4]
		push	[bp+var_2]
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr sub_D5548
		add	sp, 8
		mov	[bp+var_3], al
		xor	si, si
		jmp	loc_D5CEB

loc_D5C56:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D5C7F
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D5C7F

loc_D5C7F:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+3ABh], 0
		jz	short loc_D5CC1
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di+3A6h]
		or	ax, [bx+di+3A8h]
		jz	short loc_D5CC1
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+3AAh]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 3A6h
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D5CC1

loc_D5CC1:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+3A8h], 0
		mov	word ptr [bx+di+3A6h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+3ABh], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+3ACh], 0
		inc	si

loc_D5CEB:
		cmp	si, [bp+var_2]
		jge	short loc_D5CF3
		jmp	loc_D5C56

loc_D5CF3:
		cmp	byte_7D180, 0
		jz	short loc_D5D06

loc_D5CFA:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D5CFA

loc_D5D06:
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_D5BA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5D0D		proc far

var_1E		= word ptr -1Eh
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+18Fh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5D36
		push	418Dh
		push	3
		mov	ax, di
		add	ax, 18Fh
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D5D3A

loc_D5D36:
		mov	ax, [di+190h]

loc_D5D3A:
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_D5D6B

loc_D5D41:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 192h
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_1E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D5D6B:
		cmp	si, [bp+var_2]
		jl	short loc_D5D41
		push	3
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+0Fh]
		mov	al, [bx+11h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0Fh
		push	ax
		call	sub_76259
		add	sp, 8
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5DDD
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D162
		push	419Ch
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D5DDD:
		push	0
		push	[bp+arg_4]
		push	[bp+var_2]
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr sub_D5548
		add	sp, 8
		mov	[bp+var_3], al
		xor	si, si
		jmp	loc_D5E8D

loc_D5DF8:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D5E21
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D5E21

loc_D5E21:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+197h], 0
		jz	short loc_D5E63
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di+192h]
		or	ax, [bx+di+194h]
		jz	short loc_D5E63
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+196h]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 192h
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D5E63

loc_D5E63:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+194h], 0
		mov	word ptr [bx+di+192h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+197h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+198h], 0
		inc	si

loc_D5E8D:
		cmp	si, [bp+var_2]
		jge	short loc_D5E95
		jmp	loc_D5DF8

loc_D5E95:
		cmp	byte_7D180, 0
		jz	short loc_D5EA8

loc_D5E9C:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D5E9C

loc_D5EA8:
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_D5D0D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5EAF		proc far

var_4A		= word ptr -4Ah
var_28		= word ptr -28h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_3], 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+299h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5EE0
		push	418Dh
		push	5
		mov	ax, [bp+arg_0]
		add	ax, 299h
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D5EE7

loc_D5EE0:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+29Ah]

loc_D5EE7:
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_D5F19

loc_D5EEE:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		add	dx, 29Ch
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_28]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D5F19:
		cmp	si, [bp+var_2]
		jl	short loc_D5EEE
		push	8
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+19h]
		mov	al, [bx+1Bh]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 19h
		push	ax
		call	sub_76259
		add	sp, 8
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D5F8B
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D168
		push	419Fh
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D5F8B:
		mov	[bp+var_4], 0
		push	di
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	si, si
		mov	[bp+var_6], 0
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_4A]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		jmp	loc_D60B7

loc_D5FCD:
		mov	[bp+var_A], 8
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	word ptr [di+8], 13Fh
		mov	word ptr [di+0Ah], 97h
		push	1
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_75BF0
		add	sp, 4
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	word ptr [di+8], 13Fh
		mov	word ptr [di+0Ah], 0C7h
		push	word_7AF7E
		push	di
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_D606F
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	si
		cmp	si, [bp+var_2]
		jnz	short loc_D6058
		mov	[bp+var_4], 1
		jmp	short loc_D606F

loc_D6058:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_4A]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_D606F:
		call	sub_7575F
		or	al, al
		jz	short loc_D608B
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		mov	al, 1
		jmp	loc_D61A8

loc_D608B:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_D609F
		mov	ax, 1
		jmp	short loc_D60A1

loc_D609F:
		xor	ax, ax

loc_D60A1:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D608B
		inc	[bp+var_6]
		cmp	[bp+var_6], 1Fh
		jnz	short loc_D60B7
		push	12h
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D60B7:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D60C3
		jmp	loc_D5FCD

loc_D60C3:
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		xor	si, si
		jmp	loc_D618A

loc_D60D6:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_28]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D60FF
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D60FF

loc_D60FF:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+2A1h], 0
		jz	short loc_D6151
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx+29Ch]
		or	ax, [bx+29Eh]
		jz	short loc_D6151
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+2A0h]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		add	dx, 29Ch
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D6151

loc_D6151:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr [bx+29Eh], 0
		mov	word ptr [bx+29Ch], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+2A1h], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr [bx+2A2h], 0
		inc	si

loc_D618A:
		cmp	si, [bp+var_2]
		jge	short loc_D6192
		jmp	loc_D60D6

loc_D6192:
		cmp	byte_7D180, 0
		jz	short loc_D61A5

loc_D6199:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D6199

loc_D61A5:
		mov	al, [bp+var_3]

loc_D61A8:
		pop	di
		pop	si
		leave
		retf
sub_D5EAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D61AC		proc far

var_17		= byte ptr -17h
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_3], 0
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D61D5
		push	418Dh
		push	0
		push	si
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D61D8

loc_D61D5:
		mov	ax, [si+1]

loc_D61D8:
		mov	[bp+var_2], ax
		mov	byte ptr [bp+var_6], 0
		mov	byte ptr [bp+var_6+1], 0
		mov	[bp+var_4], 0
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	byte ptr [bp+var_16], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76259
		add	sp, 8
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76272
		add	sp, 8
		push	large 0
		mov	al, [si+7]
		push	ax
		push	large [si+3]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	word_7AF7E
		push	di
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		jmp	short loc_D62C4

loc_D6299:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D62C4
		push	4
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76259
		add	sp, 8
		call	sub_7575F
		or	al, al
		jz	short loc_D62C4
		mov	[bp+var_3], 1

loc_D62C4:
		push	3
		push	[bp+arg_2]
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jnz	short loc_D6299
		cmp	[bp+var_3], 1
		jnz	short loc_D630D
		jmp	loc_D63EF

loc_D62E2:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D630D
		push	4
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76259
		add	sp, 8
		call	sub_7575F
		or	al, al
		jz	short loc_D630D
		mov	[bp+var_3], 1

loc_D630D:
		push	4
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jnz	short loc_D62E2
		cmp	[bp+var_3], 1
		jnz	short loc_D632C
		jmp	loc_D63EF

loc_D632C:
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76259
		add	sp, 8
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76272
		add	sp, 8
		push	large 0
		mov	al, [si+11h]
		push	ax
		push	large [si+0Dh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	word_7AF7E
		push	di
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		jmp	short loc_D63B6

loc_D638B:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D63B6
		push	4
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76259
		add	sp, 8
		call	sub_7575F
		or	al, al
		jz	short loc_D63B6
		mov	[bp+var_3], 1

loc_D63B6:
		push	5
		push	[bp+arg_2]
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jnz	short loc_D638B
		cmp	[bp+var_3], 1
		jz	short loc_D63EF
		push	0
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	100h
		push	0
		push	4
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76286
		add	sp, 0Ah

loc_D63EF:
		xor	di, di
		jmp	short loc_D6456

loc_D63F3:
		mov	bx, di
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+si+8], 0
		jz	short loc_D6430
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+3]
		or	ax, [bx+si+5]
		jz	short loc_D6430
		push	0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	al, [bx+si+7]
		push	ax
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 3
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D6430

loc_D6430:
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	word ptr [bx+si+5], 0
		mov	word ptr [bx+si+3], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+si+8], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+si+9], 0
		inc	di

loc_D6456:
		cmp	di, [bp+var_2]
		jl	short loc_D63F3
		cmp	byte_7D180, 0
		jz	short loc_D646E

loc_D6462:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D6462

loc_D646E:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	al, [bp+var_3]
		mov	[bp+var_17], al
		lea	ax, [bp+var_12]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_C]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_17]
		pop	di
		pop	si
		leave
		retf
sub_D61AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D649D		proc far

var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_14		= word ptr -14h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_3], 0
		mov	[bp+var_4], 1
		mov	[bp+var_8], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	byte ptr [bp+var_18], 0
		mov	byte ptr [bp+var_18+1], 0
		mov	[bp+var_16], 0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76268
		add	sp, 8
		mov	al, [di+85h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D6522
		push	418Dh
		push	1
		mov	ax, di
		add	ax, 85h
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D6526

loc_D6522:
		mov	ax, [di+86h]

loc_D6526:
		mov	[bp+var_2], ax
		push	0
		push	word ptr [si+5]
		mov	al, [si+7]
		push	ax
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_76259
		add	sp, 8
		push	word_7D14D
		call	sub_60CD9
		pop	cx
		mov	si, word_7D14D
		add	si, 6AEh
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76272
		add	sp, 8
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76259
		add	sp, 8
		push	large 0
		mov	al, [di+8Ch]
		push	ax
		push	large [di+88h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	si, 140h
		jmp	loc_D6806

loc_D65C5:
		mov	[bp+var_1C], 4
		mov	eax, dword_7B29D
		mov	[bp+var_20], eax
		push	large 0
		mov	al, [di+8Ch]
		push	ax
		push	large [di+88h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		mov	ax, si
		add	ax, 0FEC0h
		push	ax
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	al, [di+96h]
		push	ax
		push	large [di+92h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		push	si
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		call	sub_7575F
		or	al, al
		jz	short loc_D6649
		mov	[bp+var_3], 1
		jmp	loc_D680D

loc_D6649:
		cmp	si, 131h
		jnz	short loc_D6656
		push	1
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D6656:
		cmp	si, 131h
		jge	short loc_D669B
		cmp	[bp+var_4], 0
		jz	short loc_D669B
		push	7
		mov	ax, word_7D14D
		add	ax, 6B3h
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_D6697
		call	sub_6828E
		push	1
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76259
		add	sp, 8
		jmp	short loc_D669B

loc_D6697:
		mov	[bp+var_4], 0

loc_D669B:
		cmp	si, 0AAh
		jge	short loc_D66CC
		push	8
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_D66CC
		push	1
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76259
		add	sp, 8

loc_D66CC:
		cmp	si, 10Eh
		jnz	short loc_D66EE
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D66EE
		push	word_7D158
		push	41A2h
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D66EE:
		cmp	si, 0F0h
		jnz	short loc_D66FB
		push	4
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D66FB:
		cmp	si, 0D2h
		jnz	short loc_D673E
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D673E
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D15A
		push	41A5h
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D673E:
		cmp	si, 0C8h
		jnz	short loc_D674B
		push	5
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D674B:
		cmp	si, 96h
		jnz	short loc_D678E
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D678E
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D15C
		push	41A8h
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D678E:
		cmp	si, 87h
		jnz	short loc_D679B
		push	9
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D679B:
		cmp	si, 46h
		jnz	short loc_D67DD
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D67DD
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		push	word_7D15E
		push	41ABh
		push	word_7D156
		call	sub_75D4A
		add	sp, 6

loc_D67DD:
		cmp	si, 3Ch
		jnz	short loc_D67E9
		push	0Ah
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D67E9:
		mov	eax, [bp+var_20]
		add	eax, [bp+var_1C]
		cmp	eax, dword_7B29D
		ja	short loc_D67FD
		mov	ax, 1
		jmp	short loc_D67FF

loc_D67FD:
		xor	ax, ax

loc_D67FF:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D67E9
		dec	si

loc_D6806:
		or	si, si
		jl	short loc_D680D
		jmp	loc_D65C5

loc_D680D:
		xor	si, si
		jmp	short loc_D687D

loc_D6811:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+8Dh], 0
		jz	short loc_D6853
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di+88h]
		or	ax, [bx+di+8Ah]
		jz	short loc_D6853
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+8Ch]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 88h
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D6853

loc_D6853:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+8Ah], 0
		mov	word ptr [bx+di+88h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+8Dh], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+8Eh], 0
		inc	si

loc_D687D:
		cmp	si, [bp+var_2]
		jl	short loc_D6811
		cmp	byte_7D180, 0
		jz	short loc_D6895

loc_D6889:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_D6889

loc_D6895:
		mov	al, [bp+var_3]
		mov	[bp+var_21], al
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_21]
		pop	di
		pop	si
		leave
		retf
sub_D649D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D68B6		proc far

var_66		= word ptr -66h
var_44		= word ptr -44h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_5], 0
		mov	al, [di+3A3h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D68E3
		push	418Dh
		push	7
		mov	ax, di
		add	ax, 3A3h
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D68E7

loc_D68E3:
		mov	ax, [di+3A4h]

loc_D68E7:
		mov	[bp+var_2], ax
		mov	al, [di+31Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D6908
		push	418Dh
		push	6
		mov	ax, di
		add	ax, 31Eh
		push	ax
		push	cs
		call	near ptr sub_D53FA
		add	sp, 6
		jmp	short loc_D690C

loc_D6908:
		mov	ax, [di+31Fh]

loc_D690C:
		mov	[bp+var_4], ax
		xor	si, si
		jmp	short loc_D693D

loc_D6913:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 3A6h
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_44]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D693D:
		cmp	si, [bp+var_2]
		jl	short loc_D6913
		xor	si, si
		jmp	short loc_D6973

loc_D6946:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 321h
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, [bp+var_2]
		add	bx, si
		shl	bx, 1
		lea	dx, [bp+var_44]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D6973:
		cmp	si, [bp+var_4]
		jl	short loc_D6946
		push	0Bh
		push	cs
		call	near ptr sub_D52F4
		pop	cx
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+23h]
		mov	al, [bx+25h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 23h
		push	ax
		call	sub_76259
		add	sp, 8
		mov	[bp+var_6], 0
		push	[bp+arg_4]
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_66]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	si, si
		mov	[bp+var_8], 0
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_66]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		jmp	loc_D6AEF

loc_D69EC:
		mov	[bp+var_C], 8
		mov	eax, dword_7B29D
		mov	[bp+var_10], eax
		push	1
		lea	ax, [bp+var_66]
		push	ax
		call	sub_75BF0
		add	sp, 4
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_D6A6D
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_66]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	si
		mov	ax, [bp+var_2]
		add	ax, [bp+var_4]
		cmp	ax, si
		jnz	short loc_D6A56
		mov	[bp+var_6], 1
		jmp	short loc_D6A6D

loc_D6A56:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_66]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_D6A6D:
		call	sub_7575F
		or	al, al
		jz	short loc_D6A95
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_66]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_6], 1
		mov	[bp+var_5], 1

loc_D6A95:
		mov	eax, [bp+var_10]
		add	eax, [bp+var_C]
		cmp	eax, dword_7B29D
		ja	short loc_D6AA9
		mov	ax, 1
		jmp	short loc_D6AAB

loc_D6AA9:
		xor	ax, ax

loc_D6AAB:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D6A95
		inc	[bp+var_8]
		cmp	[bp+var_8], 1Bh
		jnz	short loc_D6AC1
		push	0Ch
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D6AC1:
		cmp	[bp+var_8], 24h
		jnz	short loc_D6AE2
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+1Eh]
		mov	al, [bx+20h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 1Eh
		push	ax
		call	sub_76259
		add	sp, 8

loc_D6AE2:
		cmp	[bp+var_8], 3Ah
		jnz	short loc_D6AEF
		push	0Dh
		push	cs
		call	near ptr sub_D52F4
		pop	cx

loc_D6AEF:
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D6AFB
		jmp	loc_D69EC

loc_D6AFB:
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		xor	si, si
		jmp	loc_D6BA3

loc_D6B0E:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D6B37
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D6B37

loc_D6B37:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+3ABh], 0
		jz	short loc_D6B79
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di+3A6h]
		or	ax, [bx+di+3A8h]
		jz	short loc_D6B79
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+3AAh]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 3A6h
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D6B79

loc_D6B79:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+3A8h], 0
		mov	word ptr [bx+di+3A6h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+3ABh], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+3ACh], 0
		inc	si

loc_D6BA3:
		cmp	si, [bp+var_2]
		jge	short loc_D6BAB
		jmp	loc_D6B0E

loc_D6BAB:
		xor	si, si
		jmp	loc_D6C4E

loc_D6BB0:
		mov	bx, [bp+var_2]
		add	bx, si
		shl	bx, 1
		lea	ax, [bp+var_44]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_D6BE2
		push	3
		mov	bx, [bp+var_2]
		add	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_2]
		add	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_D6BE2

loc_D6BE2:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+326h], 0
		jz	short loc_D6C24
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di+321h]
		or	ax, [bx+di+323h]
		jz	short loc_D6C24
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+325h]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		add	dx, 321h
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D6C24

loc_D6C24:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+323h], 0
		mov	word ptr [bx+di+321h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+326h], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+327h], 0
		inc	si

loc_D6C4E:
		cmp	si, [bp+var_4]
		jge	short loc_D6C56
		jmp	loc_D6BB0

loc_D6C56:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_D6C67
		call	sub_5EFE1

loc_D6C67:
		mov	al, [bp+var_5]
		pop	di
		pop	si
		leave
		retf
sub_D68B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D6C6E		proc far

var_5A4		= word ptr -5A4h
var_5A0		= word ptr -5A0h
var_59F		= word ptr -59Fh
var_59E		= word ptr -59Eh
var_4E6		= word ptr -4E6h
var_BE		= word ptr -0BEh
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_88		= word ptr -88h
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_70		= word ptr -70h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5A4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+7C5h], 0
		mov	[bp+var_1], 0
		call	Keyboard_DrainBufferBIOS_701E1
		mov	[bp+var_4], 0
		mov	[bp+var_3], 0
		mov	[bp+var_2], 0
		xor	di, di
		mov	[bp+var_6], 0
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aConvfont_1
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_10], 0
		mov	[bp+var_C], 2
		mov	[bp+var_B], 0
		mov	[bp+var_A], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[bp+var_10], eax
		mov	[bp+var_C], 2
		mov	[bp+var_B], 1
		mov	[bp+var_A], 0
		lea	ax, word ptr [bp+var_10]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_78], 1
		mov	[bp+var_76], 0
		push	2Dh
		lea	ax, [bp+var_88]
		push	ax
		mov	bx, [bp+var_88]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_74], ax
		push	0Fh
		lea	ax, [bp+var_88]
		push	ax
		call	sub_6932C
		add	sp, 4
		mov	[bp+var_96], 0
		mov	[bp+var_94], 0
		mov	[bp+var_92], 0
		mov	[bp+var_90], 0
		mov	[bp+var_8E], 13Fh
		mov	[bp+var_8C], 0C7h
		push	0
		lea	ax, [bp+var_96]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		cmp	byte_7CB1B, 0
		jz	short loc_D6D92
		cmp	word_79E69, 0
		jz	short loc_D6D92
		mov	byte_7D180, 1
		jmp	short loc_D6D97

loc_D6D92:
		mov	byte_7D180, 0

loc_D6D97:
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D6DDC
		lea	ax, [bp+var_88]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	0
		call	sub_75D04
		add	sp, 6
		mov	word_7D156, ax
		push	large 0C7013Fh
		push	large 980000h
		push	ax
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ah
		mov	bx, word_7D156
		mov	byte ptr [bx+16h], 2
		push	cs
		call	near ptr sub_D4FA0

loc_D6DDC:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	seg stub381
		push	offset sub_75E3F
		push	large 10008h
		push	5
		lea	ax, [bp+var_BE]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub381
		push	offset sub_75E3A
		push	large 10008h
		push	85h
		lea	ax, [bp+var_4E6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 10013h
		push	0Ah
		lea	ax, [bp+var_5A4]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_5A4]
		mov	word_7D154, ax
		mov	[bp+var_16], ax
		lea	ax, [bp+var_16]
		push	ax
		push	cs
		call	near ptr sub_D50D3
		pop	cx
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D54F6
		pop	cx
		mov	[bp+var_5], al
		push	8
		push	4187h
		lea	ax, [bp+var_BE]
		mov	[bp+var_18], ax
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_D532A
		add	sp, 6
		push	850h
		call	GameVar_ClearFlag_56520
		pop	cx
		jmp	loc_D6FA0

loc_D6E7F:
		mov	bx, di
		cmp	bx, 9
		jbe	short loc_D6E89
		jmp	loc_D6F51

loc_D6E89:
		shl	bx, 1
		jmp	cs:off_D7135[bx]	; switch jump

loc_D6E90:
		push	0
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D61AC

loc_D6EAB:
		add	sp, 6
		mov	[bp+var_1], al
		jmp	loc_D6F55

loc_D6EB4:
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D649D
		jmp	short loc_D6EAB

loc_D6EC9:
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D56C6
		jmp	short loc_D6EAB

loc_D6EDE:
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D5D0D
		jmp	short loc_D6EAB

loc_D6EF3:
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D5868
		jmp	short loc_D6EAB

loc_D6F08:
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D5EAF
		jmp	short loc_D6EAB

loc_D6F1D:
		push	0B6h
		jmp	short loc_D6F46

loc_D6F22:
		jmp	short loc_D6F3D

loc_D6F24:
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_4E6]
		push	ax
		push	cs
		call	near ptr sub_D68B6
		add	sp, 6
		mov	[bp+var_1], al

loc_D6F3D:
		mov	[bp+var_6], 1
		jmp	short loc_D6F55

loc_D6F43:
		push	0B7h

loc_D6F46:
		push	si
		call	sub_757EF
		add	sp, 4
		jmp	short loc_D6F55

loc_D6F51:
		mov	[bp+var_1], 1

loc_D6F55:
		inc	di
		cmp	[bp+var_5], 0
		jz	short loc_D6FA0
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D6FA0
		xor	eax, eax
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[bp+var_1C], 32h
		mov	eax, dword_7B29D
		mov	[bp+var_20], eax

loc_D6F80:
		mov	eax, [bp+var_20]
		add	eax, [bp+var_1C]
		cmp	eax, dword_7B29D
		ja	short loc_D6F94
		mov	ax, 1
		jmp	short loc_D6F96

loc_D6F94:
		xor	ax, ax

loc_D6F96:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D6F80
		mov	[bp+var_6], 0

loc_D6FA0:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D6FAC
		jmp	loc_D6E7F

loc_D6FAC:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_D6FBD
		call	sub_5EFE1

loc_D6FBD:
		xor	di, di
		jmp	loc_D7042

loc_D6FC2:
		mov	bx, di
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_59F]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_D700D
		mov	bx, di
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_5A4]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_D700D
		push	0
		mov	bx, di
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_5A0]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, di
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_5A4]
		add	ax, dx
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D700D

loc_D700D:
		mov	bx, di
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_5A4]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_59F]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_59E]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	di

loc_D7042:
		cmp	di, 13h
		jge	short loc_D704A
		jmp	loc_D6FC2

loc_D704A:
		mov	al, byte_7D180
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D7096
		cmp	word_7D156, 0
		jz	short loc_D7073
		mov	ax, word_7D156
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word_7D156
		call	sub_3B2
		pop	cx
		jmp	short loc_D7073

loc_D7073:
		xor	di, di
		jmp	short loc_D7091

loc_D7077:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+6A28h], 0
		jz	short loc_D7090
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+6A28h]
		call	sub_3B2
		pop	cx

loc_D7090:
		inc	di

loc_D7091:
		cmp	di, 14h
		jl	short loc_D7077

loc_D7096:
		mov	word_7D154, 0
		mov	byte ptr [si+7C5h], 1
		push	seg stub253
		push	offset sub_735A0
		push	large 10013h
		push	0Ah
		lea	ax, [bp+var_5A4]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub381
		push	offset sub_75E35
		push	large 10008h
		push	85h
		lea	ax, [bp+var_4E6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub381
		push	offset sub_75E30
		push	large 10008h
		push	5
		lea	ax, [bp+var_BE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_96]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_88]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_B], 0
		jz	short loc_D7131
		cmp	[bp+var_10], 0
		jz	short loc_D7131
		push	0
		mov	al, [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D7131

loc_D7131:
		pop	di
		pop	si
		leave
		retf
sub_D6C6E		endp

; START OF FUNCTION CHUNK FOR sub_D6C6E
off_D7135	dw offset loc_D6E90
		dw offset loc_D6EB4
		dw offset loc_D6EC9
		dw offset loc_D6EDE
		dw offset loc_D6EF3
		dw offset loc_D6F08
		dw offset loc_D6F1D
		dw offset loc_D6F22
		dw offset loc_D6F24
		dw offset loc_D6F43
; END OF FUNCTION CHUNK FOR sub_D6C6E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D7149		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D7162
		push	5
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D7170

loc_D7162:
		push	100h
		push	0
		push	si
		call	sub_76245
		add	sp, 6

loc_D7170:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D7149		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D7175		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D718F
		push	85h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D71B3

loc_D718F:
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Dh
		push	0Ah
		mov	ax, si
		add	ax, 3
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	byte ptr [si], 0
		mov	word ptr [si+1], 0

loc_D71B3:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D7175		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D71B8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D71F2
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Dh
		push	0Ah
		mov	ax, si
		add	ax, 3
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		test	di, 1
		jz	short loc_D71F2
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D71F2

loc_D71F2:
		pop	di
		pop	si
		pop	bp
		retf
sub_D71B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_D71F6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D721B
		push	si
		call	sub_7627C
		pop	cx
		test	di, 1
		jz	short loc_D721B
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D721B

loc_D721B:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_D71F6		endp
ovr381		ends
