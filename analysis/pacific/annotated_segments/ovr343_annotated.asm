ovr343		segment	para public 'OVERLAY' use16
		assume cs:ovr343
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB6A0		proc far

var_FA		= word ptr -0FAh
var_AA		= word ptr -0AAh
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_45		= dword ptr -45h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FAh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_AA], 508h
		mov	[bp+var_49], 100h
		mov	[bp+var_4D], 0
		mov	[bp+var_AA], 520h
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_30], ax
		movsx	eax, ax
		mov	[bp+var_45], eax
		mov	[bp+var_2], si
		push	8
		push	[bp+var_2]
		push	68B3h
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte_7CFEB, 0
		push	seg seg225
		push	0
		push	ds
		push	si
		push	ds
		push	offset aMISSIONS
		lea	ax, [bp+var_FA]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	large 444C5257h
		lea	ax, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jz	short loc_BB747
		lea	ax, [bp+var_AA]
		push	ax
		nop
		push	cs
		call	near ptr sub_BB76A
		pop	cx
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_BB747:
		mov	[bp+var_AA], 520h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_BB6A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB76A		proc far

var_1E		= word ptr -1Eh
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
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7975C, 0
		jz	short loc_BB7E1
		mov	byte_7975D, 1
		mov	byte_79787, 0
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_7977E, eax
		mov	byte_79782, 0
		mov	byte_79783, 0
		mov	word_79784, 1
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jz	short loc_BB7B1
		jmp	loc_BBB02

loc_BB7B1:
		push	word_79797
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		push	word_79799
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		push	word_79788
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		jmp	loc_BBB02

loc_BB7E1:
		mov	word_7977C, 0
		cmp	word_7CEDD, 0
		jnz	short loc_BB7F7
		push	67ADh
		call	Container_Construct
		pop	cx

loc_BB7F7:
		push	67B7h
		call	sub_73778
		pop	cx
		mov	byte_78EB6, 1
		mov	byte_78EB7, 0
		mov	byte_78EB8, 1
		mov	byte_78EB9, 0
		mov	word_777AA, 0
		mov	dword_7CB24, 0
		mov	word_79D5C, 0
		mov	byte_79D5E, 0
		mov	word_77356, 0
		mov	byte_77358, 0FFh
		mov	byte_77359, 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_7735A, eax
		mov	dword_7735E, 0
		mov	byte_77362, 0
		mov	byte_77363, 0FFh
		mov	byte_7CAC3, 0
		mov	byte_7CAC2, 0
		mov	byte_7CE06, 0
		mov	word_791F8, 0
		mov	word_791FA, 1
		mov	word_791FC, 2
		mov	word_791FE, 3
		mov	word_79200, 4
		mov	word_79202, 5
		mov	word_79204, 6
		mov	word_79206, 7
		mov	word_79208, 8
		mov	word_7920A, 9
		mov	word_7920C, 0Ah
		mov	word_7920E, 0Bh
		mov	word_79210, 0Ch
		mov	word_79212, 0Dh
		mov	word_79214, 0Eh
		mov	word_79216, 0Fh
		mov	word_79218, 0
		mov	word_7921A, 0
		mov	word_7921C, 87h
		mov	word_7921E, 1
		mov	word_79220, 0Fh
		mov	word_79222, 8
		mov	ax, word_77535
		mov	word_79260, ax
		nop
		push	cs
		call	near ptr sub_BC892
		call	sub_7421A
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BB928
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_BB928:
		push	0
		push	large 5A524F48h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BB963
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_797C7, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_797CB, eax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_BB963:
		push	large 1FFFAh
		push	6496h
		call	sub_29301
		add	sp, 6
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BB9AD
		push	0
		push	large 48435457h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BB99F
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1E], ax
		push	ax
		jmp	short loc_BB9A2

loc_BB99F:
		push	12Ch

loc_BB9A2:
		push	67A5h
		call	sub_392E8
		add	sp, 4

loc_BB9AD:
		push	si
		nop
		push	cs
		call	near ptr sub_BBE39
		pop	cx
		push	19EAh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_BB9C8
		push	si
		nop
		push	cs
		call	near ptr sub_BC0C9
		pop	cx

loc_BB9C8:
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_SpawnEntity_BC305
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr World_LoadLGHTChunk_BC1F7
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr TextScrollDisplayB_TickHelper_BC475
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr World_LoadSmokeSet_BC488
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_BC52D
		pop	cx
		push	ds
		push	offset unk_7CEFE
		call	sub_7330F
		add	sp, 4
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BBA7A
		push	0
		push	large 544E4C47h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BBA7A
		mov	eax, [si+72h]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	dword_7CFD5, eax
		mov	byte_7CFD9, 3
		mov	byte_7CFDA, 1
		mov	dword_7CFDB, 0
		mov	eax, [bp+var_C]
		mov	dword_7CFDB, eax
		push	0
		mov	al, byte_7CFD9
		push	ax
		push	large dword_7CFD5
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_BBA7A:
		push	0
		push	large 4C414353h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BBAE2
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_79762, eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	edx, eax
		mov	ecx, dword_79762
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	dword_7975E, eax
		mov	eax, dword_79766
		mov	edx, dword_79762
		imul	edx
		shrd	eax, edx, 8
		mov	dword_79766, eax

loc_BBAE2:
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BBAFD
		push	687Ch
		call	Collision_ResetLinkPool
		pop	cx
		push	687Ch
		call	sub_41EF7
		pop	cx

loc_BBAFD:
		mov	byte_7975C, 1

loc_BBB02:
		pop	si
		leave
		retf
sub_BB76A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBB05		proc far

var_114		= word ptr -114h
var_C4		= word ptr -0C4h
var_67		= dword ptr -67h
var_63		= dword ptr -63h
var_5F		= dword ptr -5Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 114h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_C4]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_C4], 508h
		mov	[bp+var_63], 100h
		mov	[bp+var_67], 0
		mov	[bp+var_C4], 520h
		mov	[bp+var_48], 0
		xor	ax, ax
		mov	[bp+var_4A], ax
		movsx	eax, ax
		mov	[bp+var_5F], eax
		mov	[bp+var_2], si
		push	8
		push	[bp+var_2]
		push	68B3h
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte_7CFEB, 0
		push	seg seg225
		push	0
		push	ds
		push	si
		push	ds
		push	offset aMISSIONS
		lea	ax, [bp+var_114]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	large 444C5257h
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_BBB99
		jmp	loc_BBE16

loc_BBB99:
		cmp	byte_7975C, 0
		jz	short loc_BBBE8
		mov	byte_7975D, 1
		mov	byte_79787, 0
		mov	[bp+var_6], 100h
		mov	eax, [bp+var_6]
		mov	dword_7977E, eax
		mov	byte_79782, 0
		mov	byte_79783, 0
		mov	word_79784, 1
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jz	short loc_BBBD6
		jmp	loc_BBE0B

loc_BBBD6:
		push	word_79788
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		jmp	loc_BBE0B

loc_BBBE8:
		mov	[bp+var_A], 100h
		mov	eax, [bp+var_A]
		mov	dword_7977E, eax
		mov	byte_79782, 0
		mov	byte_79783, 0
		mov	word_79784, 1
		mov	word_7977C, 0
		cmp	word_7CEDD, 0
		jnz	short loc_BBC1E
		push	67ADh
		call	Container_Construct
		pop	cx

loc_BBC1E:
		mov	byte_78EB6, 1
		mov	byte_78EB7, 0
		mov	byte_78EB8, 1
		mov	byte_78EB9, 0
		mov	word_777AA, 0
		mov	dword_7CB24, 0
		mov	word_79D5C, 0
		mov	byte_79D5E, 0
		mov	word_77356, 0
		mov	byte_77358, 0FFh
		mov	byte_77359, 0
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	dword_7735A, eax
		mov	dword_7735E, 0
		mov	byte_77362, 0
		mov	byte_77363, 0FFh
		mov	byte_78EBA, 0
		nop
		push	cs
		call	near ptr sub_BC892
		call	sub_7421A
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BBCBA
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	eax, [bp+var_4E]
		mov	[bp+var_5F], eax

loc_BBCBA:
		push	0
		push	large 5A524F48h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BBD01
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_797C7, eax
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_797CB, eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_5F], eax

loc_BBD01:
		push	large 1FA00h
		push	6496h
		call	sub_29301
		add	sp, 6
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BBD53
		push	0
		push	large 48435457h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BBD45
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1C], ax
		push	ax
		jmp	short loc_BBD48

loc_BBD45:
		push	12Ch

loc_BBD48:
		push	67A5h
		call	sub_392E8
		add	sp, 4

loc_BBD53:
		lea	ax, [bp+var_C4]
		push	ax
		nop
		push	cs
		call	near ptr sub_BBE39
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		nop
		push	cs
		call	near ptr sub_BC0C9
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		nop
		push	cs
		call	near ptr MissionLoader_SpawnEntity_BC305
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		nop
		push	cs
		call	near ptr World_LoadLGHTChunk_BC1F7
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		nop
		push	cs
		call	near ptr TextScrollDisplayB_TickHelper_BC475
		pop	cx
		push	ds
		push	offset unk_7CEFE
		call	sub_7330F
		add	sp, 4
		push	0
		push	large 4C414353h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BBE06
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_79762, eax
		mov	[bp+var_12], 100h
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	ecx, dword_79762
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	dword_7975E, eax
		mov	eax, dword_79766
		mov	edx, dword_79762
		imul	edx
		shrd	eax, edx, 8
		mov	dword_79766, eax

loc_BBE06:
		mov	byte_7975C, 1

loc_BBE0B:
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_BBE16:
		mov	[bp+var_C4], 520h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_C4]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_BBB05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBE39		proc far

var_112		= word ptr -112h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 112h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_BBE66
		jmp	loc_BC0BD

loc_BBE66:
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	64DEh
		call	sub_73E71
		add	sp, 4
		xor	si, si
		jmp	loc_BC0B3

loc_BBE87:
		mov	ax, 0Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_BBE9A
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_BBEBD

loc_BBE9A:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, 0Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_BBEBD:
		mov	word ptr [bp+var_E], ax
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_37C3
		add	sp, 0Ah
		mov	ax, si
		add	ax, 10h
		cmp	ax, 0FFFFh
		jnz	short loc_BBEF0
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_BBF13

loc_BBEF0:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, si
		add	bx, 10h
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_BBF13:
		mov	word ptr [bp+var_E], ax
		mov	ax, 0Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_BBF29
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_BBF4C

loc_BBF29:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, 0Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_BBF4C:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_37C3
		add	sp, 0Ah
		cmp	si, 0FFFFh
		jnz	short loc_BBF70
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_BBF90

loc_BBF70:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_BBF90:
		mov	word ptr [bp+var_E], ax
		mov	ax, si
		add	ax, 10h
		cmp	ax, 0FFFFh
		jnz	short loc_BBFA6
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_BBFC9

loc_BBFA6:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, si
		add	bx, 10h
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_BBFC9:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_37C3
		add	sp, 0Ah
		mov	ax, 1Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_BBFF2
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		jmp	short loc_BC015

loc_BBFF2:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, 1Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_E+2], dx

loc_BC015:
		mov	word ptr [bp+var_E], ax
		cmp	si, 0FFFFh
		jnz	short loc_BC026
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_BC046

loc_BC026:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_BC046:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_E+2], ss
		mov	word ptr [bp+var_E], ax
		mov	ax, 1Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_BC079
		lea	ax, [bp+var_112]
		mov	word ptr [bp+var_12+2], ss
		jmp	short loc_BC09C

loc_BC079:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, 1Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_12+2], dx

loc_BC09C:
		mov	word ptr [bp+var_12], ax
		push	100h
		push	large [bp+var_E]
		push	large [bp+var_12]
		call	sub_37C3
		add	sp, 0Ah
		inc	si

loc_BC0B3:
		cmp	si, 8
		jge	short loc_BC0BB
		jmp	loc_BBE87

loc_BC0BB:
		jmp	short loc_BC0C6

loc_BC0BD:
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_BC0C6:
		pop	si
		leave
		retf
sub_BBE39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC0C9		proc far

var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 41524554h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_BC0EB
		jmp	loc_BC1E1

loc_BC0EB:
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	eax, [bp+var_A]
		cmp	eax, dword_797B7
		jnz	short loc_BC118
		mov	eax, [bp+var_6]
		cmp	eax, dword_797BB
		jnz	short loc_BC118
		mov	ax, 1
		jmp	short loc_BC11A

loc_BC118:
		xor	ax, ax

loc_BC11A:
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jnz	short loc_BC128
		jmp	loc_BC1E1

loc_BC128:
		push	292h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_BC13A
		jmp	loc_BC1D0

loc_BC13A:
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 158Ah
		add	ax, 0Bh
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [si+0Bh], 508h
		mov	dword ptr [si+6Ch], 100h
		mov	dword ptr [si+68h], 0
		mov	word ptr [si+0Bh], 520h
		mov	word ptr [si+87h], 0
		xor	ax, ax
		mov	[si+85h], ax
		movsx	eax, ax
		mov	[si+70h], eax
		mov	ax, si
		add	ax, 0C1h
		push	ax
		call	TerrainTile_DescriptorConstruct
		pop	cx
		mov	ax, si
		add	ax, 171h
		push	ax
		call	TerrainTile_DescriptorConstruct
		pop	cx
		mov	ax, si
		add	ax, 208h
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		mov	ax, si
		add	ax, 27Fh
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		call	sub_740F3
		add	sp, 4
		mov	ax, si
		jmp	short loc_BC1D2

loc_BC1D0:
		mov	ax, si

loc_BC1D2:
		mov	word_79788, ax
		push	ax
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_BC1E1:
		mov	ax, word_7CB01
		add	ax, 0Bh
		push	ax
		push	word_79788
		call	sub_367B1
		add	sp, 4
		pop	si
		leave
		retf
sub_BC0C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à World_LoadLGHTChunk_A7A10 (sub_A7A10 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14.
; LECTEUR DU CHUNK 'LGHT' du FORM WRLD (appelé par World_ParseWrldForm_A767F), objet jeu de
; lumières 5A9Ah. uint16 poids ambiant → LightSet_SetAmbientWeight_2B24F (+7) ; uint16
; pourcentage, borné à 100 puis × 255 ÷ 100 → LightSet_SetIntensityPercent_2B228 (+9 ; ce
; dernier borne à son tour à 100 : ≥ 40 % donne 1,0) ; puis jusqu'à la fin du chunk,
; enregistrements de 10 o : uint16 poids, 3 int16 direction (<< 8 ; ordre fichier X, Z, Y),
; uint8 normaliser, 1 octet non référencé ici → LightSet_AddLight_2B2DB.
; Ex-'MissionLoader_LoadPosition_A7A10'.
; ==============================================================================================
World_LoadLGHTChunk_BC1F7		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 5448474Ch
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_BC21A
		jmp	loc_BC301

loc_BC21A:
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_C], ax
		push	ax
		push	6882h
		call	LightSet_SetAmbientWeight_29723
		add	sp, 4
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	dx, ax
		cmp	dx, 64h
		jge	short loc_BC240
		jmp	short loc_BC243

loc_BC240:
		mov	ax, 64h

loc_BC243:
		mov	dx, ax
		movsx	eax, dx
		imul	eax, eax, 0FFh
		mov	ebx, 64h
		cdq
		idiv	ebx
		push	ax
		push	6882h
		call	LightSet_SetIntensityPercent_296FC
		add	sp, 4
		jmp	short loc_BC2CE

loc_BC269:
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	al, [bp+var_2]
		push	ax
		sub	sp, 4
		mov	ax, [bp+var_4]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	ax, [bp+var_6]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	ax, [bp+var_8]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_24], eax
		push	[bp+var_A]
		push	6882h
		call	LightSet_AddLight_297AF
		add	sp, 12h

loc_BC2CE:
		test	word ptr [di+72h], 1
		jz	short loc_BC2E9
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_BC2E7
		inc	dword ptr [di+65h]
		jmp	short loc_BC2E9

loc_BC2E7:
		jmp	short loc_BC2E9

loc_BC2E9:
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_BC2F8
		mov	ax, 1
		jmp	short loc_BC2FA

loc_BC2F8:
		xor	ax, ax

loc_BC2FA:
		or	ax, ax
		jnz	short loc_BC301
		jmp	loc_BC269

loc_BC301:
		pop	di
		pop	si
		leave
		retf
World_LoadLGHTChunk_BC1F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionLoader_SpawnEntity_A7B1E (sub_A7B1E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐⚠️
; far, 199 lignes, NON DÉTAILLÉE — combine sub_2AFB5, ResourceRecord_SeekAndRead_64743,
; sub_2AFE0, instanciation d'objet (sub_38B70, motif de spawn seg109), ReadFieldGroupC_64A7E
; (×3), enregistrement conteneur (sub_21F8D) — spawn d'une entité de mission (avion, objet,
; cible) depuis les données chargées. Candidat prioritaire pour session dédiée.
; ==============================================================================================
MissionLoader_SpawnEntity_BC305		proc far

var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
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
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	0
		push	large 53594B53h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_BC332
		jmp	loc_BC471

loc_BC332:
		jmp	loc_BC43E

loc_BC335:
		push	di
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, word ptr [bp+var_A]
		mov	[bp+var_C], ds
		mov	[bp+var_E], ax
		push	1
		push	1
		push	[bp+var_C]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_BC367
		jmp	loc_BC43E

loc_BC367:
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_12], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_32], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1A], eax
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_2E], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_22], eax
		shl	eax, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_3E]
		mov	[si+12h], eax
		mov	eax, [bp+var_3A]
		mov	[si+16h], eax
		mov	eax, [bp+var_36]
		mov	[si+1Ah], eax
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		mov	eax, [bp+var_A]
		cmp	eax, dword_797BF
		jnz	short loc_BC41B
		mov	eax, [bp+var_6]
		cmp	eax, dword_797C3
		jnz	short loc_BC41B
		mov	ax, 1
		jmp	short loc_BC41D

loc_BC41B:
		xor	ax, ax

loc_BC41D:
		or	al, al
		jz	short loc_BC43E
		mov	eax, [bp+var_32]
		mov	dword_7CFBF, eax
		mov	eax, [bp+var_2E]
		mov	dword_7CFC3, eax
		mov	eax, [bp+var_2A]
		mov	dword_7CFC7, eax
		mov	byte_7978B, 1

loc_BC43E:
		test	word ptr [di+72h], 1
		jz	short loc_BC459
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_BC457
		inc	dword ptr [di+65h]
		jmp	short loc_BC459

loc_BC457:
		jmp	short loc_BC459

loc_BC459:
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_BC468
		mov	ax, 1
		jmp	short loc_BC46A

loc_BC468:
		xor	ax, ax

loc_BC46A:
		or	ax, ax
		jnz	short loc_BC471
		jmp	loc_BC335

loc_BC471:
		pop	di
		pop	si
		leave
		retf
MissionLoader_SpawnEntity_BC305		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_3F737 (sub_3F737 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A (même
; appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_BC475		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	67B7h
		call	sub_7377D
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_BC475		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à World_LoadSmokeSet_A7CA1 (sub_A7CA1 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LECTEUR DU
; CHUNK SMOK D'UN MONDE (ex-MissionLoader_LoadChunkB) : nom du jeu de fumées (ex. 'SMOKESET'),
; alloue l'objet jeu de fumées (0x33 o, vtable 30BAh) et le remplit par
; SmokeSet_LoadFromIFF_A636C ; résultat dans word_70483 (utilisé par SmokeTrail_Tick_3D57E,
; SmokeGen_Tick_4C057, Particle_SpawnWithColor).
; ==============================================================================================
World_LoadSmokeSet_BC488		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 4B4F4D53h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_BC4AA
		jmp	loc_BC52A

loc_BC4AA:
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	33h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_BC512
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 2E64h
		mov	word ptr [si+17h], 0
		mov	word ptr [si+15h], 0
		mov	byte ptr [si+19h], 2
		mov	byte ptr [si+1Ah], 0
		mov	dword ptr [si+1Bh], 0
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	sub_7502D
		add	sp, 4
		mov	ax, si
		jmp	short loc_BC514

loc_BC512:
		mov	ax, si

loc_BC514:
		mov	word_79797, ax
		cmp	word_79797, 0
		jz	short loc_BC52A
		push	ax
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_BC52A:
		pop	si
		leave
		retf
World_LoadSmokeSet_BC488		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC52D		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 4E4D5254h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BC584
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	0
		call	sub_75060
		add	sp, 4
		mov	word_79799, ax
		cmp	word_79799, 0
		jz	short loc_BC58D
		push	ax
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		jmp	short loc_BC58D

loc_BC584:
		push	903Ah
		call	sub_1DDFE
		pop	cx

loc_BC58D:
		pop	si
		leave
		retf
sub_BC52D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC590		proc far

var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_7975C, 0
		jnz	short loc_BC5A0
		jmp	loc_BC6DF

loc_BC5A0:
		push	67A5h
		call	WeakRef_TableDestruct
		pop	cx
		push	6452h
		call	sub_73CD0
		pop	cx
		push	6496h
		call	sub_293AE
		pop	cx
		push	67B7h
		call	sub_737DC
		pop	cx
		push	6882h
		call	Collection_ClearAndFree
		pop	cx
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jz	short loc_BC5D9
		jmp	loc_BC66E

loc_BC5D9:
		push	word_79788
		push	67ADh
		call	sub_1E642
		add	sp, 4
		push	word_79797
		push	67ADh
		call	sub_1E642
		add	sp, 4
		push	word_79799
		push	67ADh
		call	sub_1E642
		add	sp, 4
		nop
		push	cs
		call	near ptr sub_BD09E
		cmp	word_79788, 0
		jz	short loc_BC626
		push	3
		push	word_79788
		mov	bx, word_79788
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_BC626

loc_BC626:
		mov	word_79788, 0
		cmp	word_79797, 0
		jz	short loc_BC647
		push	3
		push	word_79797
		mov	bx, word_79797
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_BC647

loc_BC647:
		mov	word_79797, 0
		cmp	word_79799, 0
		jz	short loc_BC668
		push	3
		push	word_79799
		mov	bx, word_79799
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_BC668

loc_BC668:
		mov	word_79799, 0

loc_BC66E:
		push	67ADh
		call	Container_Clear
		pop	cx
		push	ds
		push	offset unk_7CEFE
		call	sub_7330A
		add	sp, 4
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BC6D1
		cmp	byte_7CFDA, 0
		jz	short loc_BC6BA
		cmp	dword_7CFD5, 0
		jz	short loc_BC6BA
		push	0
		mov	al, byte_7CFD9
		push	ax
		mov	eax, dword_7CFD5
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_BC6BA

loc_BC6BA:
		mov	dword_7CFD5, 0
		mov	byte_7CFDA, 0
		mov	dword_7CFDB, 0

loc_BC6D1:
		push	64DEh
		call	sub_73E7B
		pop	cx
		mov	byte_7975C, 0

loc_BC6DF:
		leave
		retf
sub_BC590		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC6E1		proc far
		push	bp
		mov	bp, sp
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jz	short loc_BC6F0
		jmp	loc_BC7D5

loc_BC6F0:
		cmp	byte_7975C, 0
		jnz	short loc_BC6FA
		jmp	loc_BC7D5

loc_BC6FA:
		push	67A5h
		call	WeakRef_InvalidateAll
		pop	cx
		push	67B7h
		call	sub_737C3
		pop	cx
		push	word_79788
		push	67ADh
		call	sub_1E642
		add	sp, 4
		push	word_79788
		call	sub_740FD
		pop	cx
		push	word_79797
		push	67ADh
		call	sub_1E642
		add	sp, 4
		push	word_79799
		push	67ADh
		call	sub_1E642
		add	sp, 4
		push	67ADh
		call	Container_Clear
		pop	cx
		push	67ADh
		call	Container_Construct
		pop	cx
		call	sub_23584
		mov	word_77356, 0
		mov	byte_77359, 0
		mov	byte_77358, 0FFh
		mov	dword_7735E, 0
		mov	byte_7CF9E, 0
		xor	eax, eax
		mov	dword_7CF9F, eax
		mov	dword_7CFA3, eax
		mov	dword_7752F, 0
		mov	word_775E3, 0
		mov	byte_7CAC2, 0
		mov	byte_7CAC3, 0
		mov	dword_775ED, 0
		mov	word_775F1, 5
		mov	word_775F3, 5
		mov	word_7977C, 0
		mov	word_7978D, 0
		mov	word_79791, 0
		mov	word_7978F, 0
		mov	word_79793, 0
		mov	word_79795, 0

loc_BC7D5:
		pop	bp
		retf
sub_BC6E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionLoader_ReleaseRosterAndDestruct_A7F16 (sub_A7F16 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; MissionLoader_AssignUnitRoster_A7D46 puis libère l'objet (sub_338).
; ==============================================================================================
MissionLoader_ReleaseRosterAndDestruct_BC7D7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BC7F7
		push	cs
		call	near ptr sub_BC590
		test	di, 1
		jz	short loc_BC7F7
		push	si
		call	sub_3B2
		pop	cx

loc_BC7F7:
		pop	di
		pop	si
		pop	bp
		retf
MissionLoader_ReleaseRosterAndDestruct_BC7D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC7FB		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_BC817
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_BC817

loc_BC817:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_BC869
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_2], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_2], 0
		jnz	short loc_BC867
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_BC869

loc_BC867:
		jmp	short loc_BC869

loc_BC869:
		push	67B7h
		call	sub_737A0
		pop	cx
		mov	[bp+var_4], ax
		mov	dword_7752F, 0
		mov	word_7977C, 0
		push	64DEh
		call	VGA_LoadPalette
		pop	cx
		mov	ax, [bp+var_4]
		leave
		retf
sub_BC7FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC892		proc far

var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	1
		push	0
		push	2
		push	large 1Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_BC8DD
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 340Bh
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_BC8E3

loc_BC8DD:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_BC8E3:
		mov	word_7CB52, dx
		mov	word ptr dword_7CB50, ax
		push	1
		push	0
		push	2
		push	large 20h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_BC92F
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 33BBh
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_BC935

loc_BC92F:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_BC935:
		mov	word_7CB56, dx
		mov	word ptr dword_7CB54, ax
		push	1
		push	0
		push	2
		push	large 1Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	ax, dx
		jz	short loc_BC986
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 340Bh
		mov	word ptr es:[bx], 3393h
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		jmp	short loc_BC98C

loc_BC986:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]

loc_BC98C:
		mov	word_7CB5A, dx
		mov	word ptr dword_7CB58, ax
		push	1
		push	0
		push	2
		push	large 24h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		or	ax, dx
		jz	short loc_BC9EE
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx+1Ch], 3363h
		and	byte ptr es:[bx+22h], 0FDh
		and	byte ptr es:[bx+22h], 0FEh
		mov	word ptr es:[bx], 3367h
		mov	word ptr es:[bx+1Ch], 338Fh
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	short loc_BC9F4

loc_BC9EE:
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]

loc_BC9F4:
		mov	word_7CB5E, dx
		mov	word ptr dword_7CB5C, ax
		push	1
		push	0
		push	2
		push	large 1Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		or	ax, dx
		jz	short loc_BCA40
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 333Bh
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]
		jmp	short loc_BCA46

loc_BCA40:
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]

loc_BCA46:
		mov	word_7CB62, dx
		mov	word ptr dword_7CB60, ax
		push	1
		push	0
		push	2
		push	large 2Ch
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		or	ax, dx
		jz	short loc_BCA9B
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 3307h
		mov	dword ptr es:[bx+1Ch], 0
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]
		jmp	short loc_BCAA1

loc_BCA9B:
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]

loc_BCAA1:
		mov	word_7CB66, dx
		mov	word ptr dword_7CB64, ax
		push	1
		push	0
		push	2
		push	large 34h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		or	ax, dx
		jz	short loc_BCB11
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 3307h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx+2Ch], 3363h
		and	byte ptr es:[bx+32h], 0FDh
		and	byte ptr es:[bx+32h], 0FEh
		mov	word ptr es:[bx], 32CFh
		mov	word ptr es:[bx+2Ch], 3303h
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	short loc_BCB17

loc_BCB11:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]

loc_BCB17:
		mov	word_7CB6A, dx
		mov	word ptr dword_7CB68, ax
		push	1
		push	0
		push	2
		push	large 2Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		or	ax, dx
		jz	short loc_BCB71
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 3307h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx], 329Bh
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]
		jmp	short loc_BCB77

loc_BCB71:
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]

loc_BCB77:
		mov	word_7CB6E, dx
		mov	word ptr dword_7CB6C, ax
		push	1
		push	0
		push	2
		push	large 36h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		or	ax, dx
		jz	short loc_BCBE7
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 33E3h
		mov	word ptr es:[bx], 3307h
		mov	dword ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx+2Ch], 3363h
		and	byte ptr es:[bx+32h], 0FDh
		and	byte ptr es:[bx+32h], 0FEh
		mov	word ptr es:[bx], 3263h
		mov	word ptr es:[bx+2Ch], 3297h
		mov	dx, [bp+var_22]
		mov	ax, [bp+var_24]
		jmp	short loc_BCBED

loc_BCBE7:
		mov	dx, [bp+var_22]
		mov	ax, [bp+var_24]

loc_BCBED:
		mov	word_7CB72, dx
		mov	word ptr dword_7CB70, ax
		push	1
		push	0
		push	2
		push	large 22h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_26], dx
		mov	[bp+var_28], ax
		or	ax, dx
		jz	short loc_BCC39
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 323Bh
		mov	dx, [bp+var_26]
		mov	ax, [bp+var_28]
		jmp	short loc_BCC3F

loc_BCC39:
		mov	dx, [bp+var_26]
		mov	ax, [bp+var_28]

loc_BCC3F:
		mov	word_7CB2E, dx
		mov	word ptr dword_7CB2C, ax
		push	1
		push	0
		push	2
		push	large 24h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		or	ax, dx
		jz	short loc_BCC8B
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 3213h
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]
		jmp	short loc_BCC91

loc_BCC8B:
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]

loc_BCC91:
		mov	word_7CB32, dx
		mov	word ptr dword_7CB30, ax
		push	1
		push	0
		push	2
		push	large 22h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2E], dx
		mov	[bp+var_30], ax
		or	ax, dx
		jz	short loc_BCCE2
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 323Bh
		mov	word ptr es:[bx], 31EBh
		mov	dx, [bp+var_2E]
		mov	ax, [bp+var_30]
		jmp	short loc_BCCE8

loc_BCCE2:
		mov	dx, [bp+var_2E]
		mov	ax, [bp+var_30]

loc_BCCE8:
		mov	word_7CB36, dx
		mov	word ptr dword_7CB34, ax
		push	1
		push	0
		push	2
		push	large 28h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		or	ax, dx
		jz	short loc_BCD4A
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx+20h], 31BBh
		and	byte ptr es:[bx+27h], 0FDh
		and	byte ptr es:[bx+27h], 0FEh
		mov	word ptr es:[bx], 31BFh
		mov	word ptr es:[bx+20h], 31E7h
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]
		jmp	short loc_BCD50

loc_BCD4A:
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]

loc_BCD50:
		mov	word_7CB3A, dx
		mov	word ptr dword_7CB38, ax
		push	1
		push	0
		push	2
		push	large 22h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_36], dx
		mov	[bp+var_38], ax
		or	ax, dx
		jz	short loc_BCD9C
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 3193h
		mov	dx, [bp+var_36]
		mov	ax, [bp+var_38]
		jmp	short loc_BCDA2

loc_BCD9C:
		mov	dx, [bp+var_36]
		mov	ax, [bp+var_38]

loc_BCDA2:
		mov	word_7CB3E, dx
		mov	word ptr dword_7CB3C, ax
		push	1
		push	0
		push	2
		push	large 34h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		or	ax, dx
		jz	short loc_BCDF7
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 10CCh
		mov	dword ptr es:[bx+20h], 0
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]
		jmp	short loc_BCDFD

loc_BCDF7:
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]

loc_BCDFD:
		mov	word_7CB42, dx
		mov	word ptr dword_7CB40, ax
		push	1
		push	0
		push	2
		push	large 3Ch
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_3E], dx
		mov	[bp+var_40], ax
		or	ax, dx
		jz	short loc_BCE6D
		les	bx, [bp+var_40]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_40]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 10CCh
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx+34h], 31BBh
		and	byte ptr es:[bx+3Bh], 0FDh
		and	byte ptr es:[bx+3Bh], 0FEh
		mov	word ptr es:[bx], 315Bh
		mov	word ptr es:[bx+34h], 318Fh
		mov	dx, [bp+var_3E]
		mov	ax, [bp+var_40]
		jmp	short loc_BCE73

loc_BCE6D:
		mov	dx, [bp+var_3E]
		mov	ax, [bp+var_40]

loc_BCE73:
		mov	word_7CB46, dx
		mov	word ptr dword_7CB44, ax
		push	1
		push	0
		push	2
		push	large 36h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_42], dx
		mov	[bp+var_44], ax
		or	ax, dx
		jz	short loc_BCECD
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 10CCh
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx], 3127h
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]
		jmp	short loc_BCED3

loc_BCECD:
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]

loc_BCED3:
		mov	word_7CB4A, dx
		mov	word ptr dword_7CB48, ax
		push	1
		push	0
		push	2
		push	large 3Ch
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_46], dx
		mov	[bp+var_48], ax
		or	ax, dx
		jz	short loc_BCF43
		les	bx, [bp+var_48]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_48]
		mov	word ptr es:[bx], 10A4h
		mov	word ptr es:[bx], 10CCh
		mov	dword ptr es:[bx+20h], 0
		mov	word ptr es:[bx+34h], 31BBh
		and	byte ptr es:[bx+3Bh], 0FDh
		and	byte ptr es:[bx+3Bh], 0FEh
		mov	word ptr es:[bx], 30EFh
		mov	word ptr es:[bx+34h], 3123h
		mov	dx, [bp+var_46]
		mov	ax, [bp+var_48]
		jmp	short loc_BCF49

loc_BCF43:
		mov	dx, [bp+var_46]
		mov	ax, [bp+var_48]

loc_BCF49:
		mov	word_7CB4E, dx
		mov	word ptr dword_7CB4C, ax
		push	1
		push	0
		push	2
		push	large 0D2h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_7CB22, dx
		mov	word_7CB20, ax
		xor	cx, cx
		jmp	short loc_BCFA1

loc_BCF72:
		mov	ax, cx
		imul	ax, ax, 0Eh
		mov	dx, word_7CB22
		mov	bx, word_7CB20
		add	bx, ax
		mov	[bp+var_4A], dx
		mov	[bp+var_4C], bx
		mov	es, [bp+var_4A]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+0Ch], 2
		inc	cx

loc_BCFA1:
		cmp	cx, 0Fh
		jl	short loc_BCF72
		push	1
		push	0
		push	2
		push	large 0Fh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_4E], dx
		mov	[bp+var_50], ax
		or	ax, dx
		jz	short loc_BCFEB
		les	bx, [bp+var_50]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_50]
		mov	word ptr es:[bx], 1138h
		mov	word ptr es:[bx], 30C7h
		mov	dx, [bp+var_4E]
		mov	ax, [bp+var_50]
		jmp	short loc_BCFF1

loc_BCFEB:
		mov	dx, [bp+var_4E]
		mov	ax, [bp+var_50]

loc_BCFF1:
		mov	word_7CA64, dx
		mov	word ptr dword_7CA62, ax
		push	1
		push	0
		push	2
		push	large 12h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_52], dx
		mov	[bp+var_54], ax
		or	ax, dx
		jz	short loc_BD03D
		les	bx, [bp+var_54]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_54]
		mov	word ptr es:[bx], 1138h
		mov	word ptr es:[bx], 309Fh
		mov	dx, [bp+var_52]
		mov	ax, [bp+var_54]
		jmp	short loc_BD043

loc_BD03D:
		mov	dx, [bp+var_52]
		mov	ax, [bp+var_54]

loc_BD043:
		mov	word_7CA68, dx
		mov	word ptr dword_7CA66, ax
		push	1
		push	0
		push	2
		push	large 11h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_56], dx
		mov	[bp+var_58], ax
		or	ax, dx
		jz	short loc_BD08F
		les	bx, [bp+var_58]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_58]
		mov	word ptr es:[bx], 1138h
		mov	word ptr es:[bx], 1160h
		mov	dx, [bp+var_56]
		mov	ax, [bp+var_58]
		jmp	short loc_BD095

loc_BD08F:
		mov	dx, [bp+var_56]
		mov	ax, [bp+var_58]

loc_BD095:
		mov	word_7CA6C, dx
		mov	word_7CA6A, ax
		leave
		retf
sub_BC892		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD09E		proc far

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

		push	bp
		mov	bp, sp
		sub	sp, 54h
		mov	eax, dword_7CB50
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB54
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB58
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB5C
		mov	[bp+var_10], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB60
		mov	[bp+var_14], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB64
		mov	[bp+var_18], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB68
		mov	[bp+var_1C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB6C
		mov	[bp+var_20], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB70
		mov	[bp+var_24], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB2C
		mov	[bp+var_28], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB30
		mov	[bp+var_2C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB34
		mov	[bp+var_30], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB38
		mov	[bp+var_34], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB3C
		mov	[bp+var_38], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB40
		mov	[bp+var_3C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB44
		mov	[bp+var_40], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB48
		mov	[bp+var_44], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CB4C
		mov	[bp+var_48], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		push	63F0h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CA62
		mov	[bp+var_4C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_7CA66
		mov	[bp+var_50], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword ptr word_7CA6A
		mov	[bp+var_54], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		leave
		retf
sub_BD09E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD2EF		proc far
		push	bp
		mov	bp, sp
		mov	dword_797C7, 4E2000h
		mov	dword_797CB, 1F4000h
		pop	bp
		retf
sub_BD2EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD306		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_BD306		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD30D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 20h
		push	[bp+arg_2]
		push	ax
		lea	ax, [bp+arg_4]
		push	ss
		push	ax
		mov	cx, 0Ch
		call	CRT_Fmemcpy
		pop	bp
		retf
sub_BD30D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD329		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_BD329		endp
ovr343		ends
