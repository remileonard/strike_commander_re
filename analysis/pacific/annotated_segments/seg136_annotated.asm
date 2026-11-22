seg136		segment	para public 'CODE' use16
		assume cs:seg136
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 69h, 9Ah, 0B3h, 2, 0A5h, 1Ch, 83h, 0C4h, 4

loc_5CB79:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CB7B		proc far

var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= dword ptr -16Ah
var_166		= byte ptr -166h
var_164		= word ptr -164h
var_114		= word ptr -114h
var_C4		= word ptr -0C4h
var_B6		= word ptr -0B6h
var_55		= dword ptr -55h
var_49		= word ptr -49h
var_45		= dword ptr -45h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= byte ptr -28h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_1C		= word ptr -1Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 172h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		lea	ax, [bp+var_B6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		les	bx, word_7AB7E
		mov	al, es:[bx]
		mov	[bp+var_5], al
		call	PagedMemory_DetectDriverSignatureA_63627
		push	[bp+arg_2]
		lea	ax, [bp+var_C4]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	36E7h
		lea	ax, [bp+var_C4]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	large 0
		push	ss
		lea	ax, [bp+var_C4]
		push	ax
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_114]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		and	byte ptr [si+79h], 0FDh
		lea	ax, [bp+var_114]
		push	ax
		call	StreamReader_ParseFormattedValueB_6BC5F
		pop	cx
		or	ax, ax
		jnz	short loc_5CC0A
		push	ds
		lea	ax, [bp+var_114]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5CC0A
		call	PagedMemory_DetectDriverSignatureB_63638

loc_5CC0A:
		push	1
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		mov	bx, [bp+var_B6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_49]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_5CC40
		mov	eax, [bp+var_55]
		jmp	short loc_5CC44

loc_5CC40:
		mov	eax, [bp+var_45]

loc_5CC44:
		add	eax, 10h
		mov	[bp+var_A], eax
		push	0
		push	1
		push	eax
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_1CD38
		add	sp, 0Ah
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_1CE74
		pop	cx
		mov	[bp+var_C], dx
		mov	ax, [bp+var_C]
		inc	ax
		mov	word ptr [bp+var_10+2], ax
		mov	word ptr [bp+var_10], 0
		push	ax
		push	word ptr [bp+var_10]
		push	0
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_75C8
		add	sp, 8
		push	large [bp+var_10]
		call	AIL_register_driver_1D983
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0FFFFh
		push	word ptr [si+4]
		call	sub_1DA51
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+2]
		mov	[si+6], ax
		cmp	di, 0FFFFh
		jnz	short loc_5CCC3
		mov	di, es:[bx+0Ch]

loc_5CCC3:
		cmp	[bp+arg_6], 0FFFFh
		jnz	short loc_5CCD3
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Eh]
		mov	[bp+arg_6], ax

loc_5CCD3:
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_5CCE3
		les	bx, [bp+var_4]
		mov	ax, es:[bx+10h]
		mov	[bp+arg_8], ax

loc_5CCE3:
		cmp	[bp+arg_A], 0FFFFh
		jnz	short loc_5CCF3
		les	bx, [bp+var_4]
		mov	ax, es:[bx+12h]
		mov	[bp+arg_A], ax

loc_5CCF3:
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	sub_1DA77
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_5CD27
		call	PagedMemory_DetectDriverSignatureB_63638
		call	sub_682F1
		push	368Ah
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx

loc_5CD27:
		mov	al, 1
		mov	byte_79E75, al
		mov	ah, 0
		mov	[bp+var_12], ax
		cmp	byte_79E66, 4
		jnz	short loc_5CD3D
		mov	ax, 1
		jmp	short loc_5CD3F

loc_5CD3D:
		xor	ax, ax

loc_5CD3F:
		and	ax, 1
		and	byte ptr [si+79h], 0FDh
		shl	al, 1
		or	[si+79h], al
		mov	al, [si+79h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_5CD6C
		mov	[si+7Ah], di
		mov	dx, di
		add	dx, 4
		mov	al, 83h
		out	dx, al
		jmp	short loc_5CD64

loc_5CD64:
		mov	dx, di
		add	dx, 5
		mov	al, 0Bh
		out	dx, al

loc_5CD6C:
		push	[bp+var_12]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	sub_1DA7D
		add	sp, 0Ch
		or	byte ptr [si+79h], 1
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+2], 3
		jz	short loc_5CD95
		jmp	loc_5D014

loc_5CD95:
		push	word ptr [si+4]
		call	sub_1DBCB
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_5CDDF
		mov	dx, 2
		mov	ax, di
		imul	dx
		mov	di, ax
		push	0
		push	1
		movzx	eax, di
		push	eax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_1CD38
		add	sp, 0Ah
		push	di
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_1CE74
		pop	cx
		push	dx
		push	ax
		push	word ptr [si+4]
		call	sub_1DBD1
		add	sp, 8

loc_5CDDF:
		push	36ECh
		lea	ax, [bp+var_1C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_22], 2Eh
		mov	byte ptr [bp+var_22+1], 0
		mov	ax, [bp+var_4]
		add	ax, 4
		push	[bp+var_2]
		push	ax
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_164]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_164]
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		mov	bx, [si+1Ch]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	1
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_49]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_5CE5E
		mov	eax, [bp+var_55]
		jmp	short loc_5CE62

loc_5CE5E:
		mov	eax, [bp+var_45]

loc_5CE62:
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jnz	short loc_5CE70
		jmp	loc_5D014

loc_5CE70:
		cmp	byte_79E75, 0
		jnz	short loc_5CE7A
		jmp	loc_5D014

loc_5CE7A:
		mov	[bp+var_30], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_2E], ax
		lea	ax, [bp+var_30]
		mov	word_7AFA2, ax
		mov	[bp+var_30], 0D84h
		mov	[bp+var_2C], 0
		mov	[bp+var_28], 0
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	0
		push	1
		push	large [bp+var_26]
		push	ax
		call	sub_1CD38
		add	sp, 0Ah
		lea	ax, [bp+var_30]
		push	ax
		call	sub_1CE74
		pop	cx
		mov	word ptr [bp+var_3E+2], dx
		mov	word ptr [bp+var_3E], ax
		mov	eax, [bp+var_3E]
		mov	[bp+var_3A], eax
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	0
		mov	al, [bp+var_36]
		push	ax
		push	large [bp+var_3A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	1
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_75C8
		add	sp, 8
		mov	[bp+var_16E], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_16C], ax
		lea	ax, [bp+var_16E]
		mov	word_7AFA2, ax
		mov	[bp+var_16E], 0D84h
		mov	[bp+var_16A], 0
		mov	[bp+var_166], 0
		mov	[bp+var_172], 0
		mov	[bp+var_170], 0FFFFh
		push	si
		lea	ax, [bp+var_172]
		push	ax
		call	sub_5C97F
		add	sp, 4
		push	0
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		call	sub_5CA72
		add	sp, 6
		cmp	[bp+var_172], 0
		jz	short loc_5CF84
		push	[bp+var_170]
		mov	bx, [bp+var_172]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5CF84

loc_5CF84:
		cmp	[bp+var_172], 0
		jz	short loc_5CFAC
		push	[bp+var_170]
		mov	bx, [bp+var_172]
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5CFA8
		mov	ax, 1
		jmp	short loc_5CFAA

loc_5CFA8:
		xor	ax, ax

loc_5CFAA:
		jmp	short loc_5CFAE

loc_5CFAC:
		mov	al, 1

loc_5CFAE:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5CF84
		lea	ax, [bp+var_172]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_1CD03
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_5CFF2
		cmp	[bp+var_3A], 0
		jz	short loc_5CFF2
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5CFF2

loc_5CFF2:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, [bp+var_30]
		push	ax
		call	sub_1CD03
		add	sp, 4

loc_5D014:
		cmp	[bp+var_5], 0
		jz	short loc_5D01F
		call	PagedMemory_DetectDriverSignatureB_63638

loc_5D01F:
		push	2
		lea	ax, [bp+var_B6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5CB7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D032		proc far

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
		call	sub_1CCB5
		pop	cx
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_PrepareForRead_6C498
		pop	cx

loc_5D053:
		push	large 0FFFFFFFFh
		push	large 6
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		cmp	byte ptr [bp+var_6+1], 0FFh
		jnz	short loc_5D075
		jmp	loc_5D118

loc_5D075:
		mov	al, byte ptr [bp+var_6+1]
		cmp	al, [bp+arg_5]
		jnz	short loc_5D053
		mov	al, byte ptr [bp+var_6]
		cmp	al, [bp+arg_4]
		jnz	short loc_5D053
		push	large [bp+var_4]
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2
		push	ds
		push	offset word_7D0AC
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		les	bx, word_7AB7E
		mov	al, es:[bx]
		mov	[bp+var_7], al
		call	PagedMemory_DetectDriverSignatureA_63627
		push	0
		push	1
		movzx	eax, word_7D0AC
		push	eax
		push	di
		call	sub_1CD38
		add	sp, 0Ah
		push	di
		call	sub_1CE74
		pop	cx
		mov	bx, word_7D0AC
		mov	es, dx
		xchg	bx, ax
		mov	es:[bx], ax
		push	large 0FFFFFFFFh
		mov	ax, word_7D0AC
		sub	ax, 2
		movzx	eax, ax
		push	eax
		push	di
		call	sub_1CE74
		pop	cx
		add	ax, 2
		push	dx
		push	ax
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		cmp	[bp+var_7], 0
		jz	short loc_5D118
		call	PagedMemory_DetectDriverSignatureB_63638

loc_5D118:
		pop	di
		pop	si
		leave
		retf
sub_5D032		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D11C		proc far

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
		call	sub_1DBEF
		add	sp, 6
		or	ax, ax
		jz	short loc_5D142
		jmp	loc_5D1C9

loc_5D142:
		mov	[bp+var_A], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_8], ax
		lea	ax, [bp+var_A]
		mov	word_7AFA2, ax
		mov	[bp+var_A], 0D84h
		mov	[bp+var_6], 0
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_5D032
		add	sp, 6
		lea	ax, [bp+var_A]
		push	ax
		call	sub_1CE74
		pop	cx
		or	ax, dx
		jz	short loc_5D1A1
		lea	ax, [bp+var_A]
		push	ax
		call	sub_1CE74
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
		call	sub_1DBDD
		add	sp, 0Ah
		jmp	short loc_5D1BB

loc_5D1A1:
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jz	short loc_5D1B6
		push	0D003h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_5D1BB

loc_5D1B6:
		mov	byte_79D64, 4

loc_5D1BB:
		push	2
		lea	ax, [bp+var_A]
		push	ax
		call	sub_1CD03
		add	sp, 4

loc_5D1C9:
		pop	si
		leave
		retf
sub_5D11C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D1CC		proc far

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
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_AC], 508h
		mov	[bp+var_4B], 100h
		mov	[bp+var_4F], 0
		mov	[bp+var_AC], 520h
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
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_5D272
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5D267
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	di, ax

loc_5D267:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_5D272:
		push	large 44494D58h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndReadC_6D8A4
		add	sp, 6
		or	ax, ax
		jnz	short loc_5D28C
		jmp	loc_5D349

loc_5D28C:
		jmp	loc_5D337

loc_5D28F:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jnz	short loc_5D2A1
		jmp	loc_5D320

loc_5D2A1:
		cmp	[bp+var_3F], 44494D58h
		jnz	short loc_5D2B0
		mov	ax, 1
		jmp	short loc_5D2B2

loc_5D2B0:
		xor	ax, ax

loc_5D2B2:
		or	ax, ax
		jz	short loc_5D320
		lea	ax, [bp+var_AC]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 424D4954h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5D314
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_4], ax
		jmp	short loc_5D30A

loc_5D2EA:
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_5D11C
		add	sp, 4

loc_5D30A:
		mov	ax, [bp+var_4]
		dec	[bp+var_4]
		or	ax, ax
		jnz	short loc_5D2EA

loc_5D314:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		dec	di

loc_5D320:
		mov	eax, [bp+var_36]
		mov	[bp+var_47], eax
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		or	ax, ax
		jnz	short loc_5D33E

loc_5D337:
		or	di, di
		jz	short loc_5D33E
		jmp	loc_5D28F

loc_5D33E:
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_ResetIfSet_6DDD1
		pop	cx

loc_5D349:
		mov	[bp+var_AC], 520h
		lea	ax, [bp+var_AC]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_AC]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5D1CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D36D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+79h]
		and	ax, 1
		or	al, al
		jz	short loc_5D3C5
		mov	al, byte_79E75
		mov	ah, 0
		push	ax
		push	ds
		push	offset aSCSCSCFY
		push	word ptr [si+4]
		call	AIL_shutdown_driver_1DB2C
		add	sp, 8
		push	word ptr [si+4]
		call	AIL_release_driver_handle_1DA29
		pop	cx
		mov	word ptr [si+4], 0FFFFh
		and	byte ptr [si+79h], 0FEh
		mov	al, [si+79h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_5D3C5
		mov	dx, [si+7Ah]
		add	dx, 4
		mov	al, 83h
		out	dx, al
		jmp	short loc_5D3BC

loc_5D3BC:
		mov	dx, [si+7Ah]
sub_5D36D		endp

; START OF FUNCTION CHUNK FOR sub_5D36D
		db 83h
; END OF FUNCTION CHUNK FOR sub_5D36D
seg136		ends
