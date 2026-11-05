ovr361		segment	para public 'OVERLAY' use16
		assume cs:ovr361
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C8750		proc far

var_1DA		= word ptr -1DAh
var_17D		= dword ptr -17Dh
var_179		= dword ptr -179h
var_174		= word ptr -174h
var_117		= dword ptr -117h
var_113		= dword ptr -113h
var_10F		= dword ptr -10Fh
var_102		= word ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= word ptr -0FAh
var_F8		= word ptr -0F8h
var_CC		= word ptr -0CCh
var_7C		= word ptr -7Ch
var_34		= word ptr -34h
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1B		= byte ptr -1Bh
var_1A		= byte ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1DAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_7C]
		push	ax
		push	large 44495057h
		call	sub_75910
		add	sp, 6
		mov	[bp+var_2], 1
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_16]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	[bp+var_18], 0FFFFh
		cmp	byte ptr [si+4EAh], 0
		jnz	short loc_C8795
		jmp	loc_C9068

loc_C8795:
		lea	ax, [bp+var_174]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_174], 508h
		mov	[bp+var_113], 100h
		mov	[bp+var_117], 0
		mov	[bp+var_174], 520h
		mov	[bp+var_F8], 0
		xor	ax, ax
		mov	[bp+var_FA], ax
		movsx	eax, ax
		mov	[bp+var_10F], eax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	35h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		mov	bx, [bp+var_174]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E564E49h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		lea	ax, [bp+var_174]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 54495845h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C8874
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_2], al
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax

loc_C8874:
		cmp	[bp+var_2], 5
		jnz	short loc_C887D
		jmp	loc_C9048

loc_C887D:
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	32h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1DA], 508h
		mov	[bp+var_179], 100h
		mov	[bp+var_17D], 0
		mov	[bp+var_1DA], 0E61h
		push	1
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_1DA]
		push	ax
		mov	bx, [bp+var_1DA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1DA]
		push	ax
		call	sub_757F9
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C8910
		push	0F00Dh
		call	sub_1DDFE
		pop	cx

loc_C8910:
		push	large 0FFFFFFFFh
		push	large 170h
		push	ds
		mov	ax, si
		add	ax, 4EEh
		push	ax
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 200h
		lea	ax, [bp+var_1DA]
		push	ax
		call	sub_6C3BF
		add	sp, 6
		push	large 400h
		lea	ax, [bp+var_1DA]
		push	ax
		call	sub_6C3BF
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776C4
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776D8
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776EC
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_1DA]
		push	ax
		call	Handle_ReadWordField_6B4D0
		add	sp, 6
		mov	[si+69Bh], ax
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 65Eh
		push	ax
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		cmp	byte ptr [si+566h], 0
		jnz	short loc_C89D2
		mov	byte ptr [si+566h], 1

loc_C89D2:
		lea	ax, [bp+var_1DA]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_1DA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	0
		push	large 4749524Fh
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C8A2C
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax
		jmp	short loc_C8A35

loc_C8A2C:
		push	0DA24h
		call	sub_1DDFE
		pop	cx

loc_C8A35:
		push	0
		push	large 534E5057h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8A51
		jmp	loc_C8AD4

loc_C8A51:
		jmp	short loc_C8A94

loc_C8A53:
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		xor	di, di
		jmp	short loc_C8A8F

loc_C8A73:
		mov	ax, di
		shl	ax, 3
		lea	dx, [bp+var_7C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C8A94
		inc	di

loc_C8A8F:
		cmp	di, 9
		jl	short loc_C8A73

loc_C8A94:
		test	[bp+var_102], 1
		jz	short loc_C8AB1
		mov	eax, [bp+var_FE]
		dec	eax
		cmp	eax, [bp+var_10F]
		jnz	short loc_C8AB1
		inc	[bp+var_10F]
		jmp	short loc_C8AB1

loc_C8AB1:
		mov	eax, [bp+var_10F]
		cmp	eax, [bp+var_FE]
		jl	short loc_C8AC2
		mov	ax, 1
		jmp	short loc_C8AC4

loc_C8AC2:
		xor	ax, ax

loc_C8AC4:
		or	ax, ax
		jz	short loc_C8A53
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax
		jmp	short loc_C8ADD

loc_C8AD4:
		push	0DA26h
		call	sub_1DDFE
		pop	cx

loc_C8ADD:
		mov	word ptr [si+4E8h], 0
		push	0
		push	large 5354454Ah
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C8B1F
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+4E8h], ax
		mov	ax, [si+4E8h]
		add	[si+69Bh], ax
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax
		jmp	short loc_C8B28

loc_C8B1F:
		push	0DA27h
		call	sub_1DDFE
		pop	cx

loc_C8B28:
		push	0
		push	large 54415453h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C8B75
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1B], al
		mov	[si+565h], al
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax
		jmp	short loc_C8B7E

loc_C8B75:
		push	0DA28h
		call	sub_1DDFE
		pop	cx

loc_C8B7E:
		push	0
		push	large 4C4C494Bh
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8B9A
		jmp	loc_C8D8E

loc_C8B9A:
		mov	[bp+var_22], 0
		mov	[bp+var_24], 0
		push	54h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	1FCh
		call	GameVar_ClearFlag_56520
		pop	cx
		xor	di, di
		jmp	short loc_C8BC6

loc_C8BB9:
		mov	ax, di
		add	ax, 1F5h
		push	ax
		call	GameVar_ClearFlag_56520
		pop	cx
		inc	di

loc_C8BC6:
		cmp	di, 6
		jl	short loc_C8BB9
		xor	di, di
		jmp	short loc_C8BDC

loc_C8BCF:
		mov	ax, di
		add	ax, 83h
		push	ax
		call	GameVar_ClearFlag_56520
		pop	cx
		inc	di

loc_C8BDC:
		cmp	di, 8
		jl	short loc_C8BCF
		jmp	loc_C8CF7

loc_C8BE4:
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_26], ax
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_28], ax
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2A], ax
		cmp	[bp+var_28], 0
		jz	short loc_C8C1D
		push	1FCh
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8C1D:
		cmp	[bp+var_2A], 0
		jz	short loc_C8C2B
		push	54h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8C2B:
		lea	ax, [bp+var_34]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	8
		push	3A1Ch
		lea	ax, [bp+var_34]
		push	ax
		call	sub_2F4A
		add	sp, 6
		or	ax, ax
		jnz	short loc_C8C80
		mov	byte ptr [si+4EBh], 1
		mov	ax, [bp+var_22]
		add	ax, [bp+var_26]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_26]
		add	[si+57Fh], ax
		mov	ax, [bp+var_28]
		add	[si+581h], ax
		mov	ax, [bp+var_2A]
		add	[si+583h], ax
		jmp	short loc_C8CF7

loc_C8C80:
		mov	ax, [bp+var_24]
		add	ax, [bp+var_26]
		mov	[bp+var_24], ax
		xor	di, di
		jmp	short loc_C8CF2

loc_C8C8D:
		push	8
		mov	ax, di
		imul	ax, ax, 1Bh
		mov	dx, si
		add	dx, ax
		add	dx, 56Bh
		push	dx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_2FAD
		add	sp, 6
		or	ax, ax
		jnz	short loc_C8CF1
		cmp	[bp+var_26], 0
		jnz	short loc_C8CBF
		cmp	[bp+var_28], 0
		jnz	short loc_C8CBF
		cmp	[bp+var_2A], 0
		jz	short loc_C8CF7

loc_C8CBF:
		mov	ax, di
		add	ax, 82h
		push	ax
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	ax, [bp+var_26]
		add	[bx+si+57Fh], ax
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	ax, [bp+var_28]
		add	[bx+si+581h], ax
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	ax, [bp+var_2A]
		add	[bx+si+583h], ax
		jmp	short loc_C8CF7

loc_C8CF1:
		inc	di

loc_C8CF2:
		cmp	di, 9
		jl	short loc_C8C8D

loc_C8CF7:
		test	[bp+var_102], 1
		jz	short loc_C8D14
		mov	eax, [bp+var_FE]
		dec	eax
		cmp	eax, [bp+var_10F]
		jnz	short loc_C8D14
		inc	[bp+var_10F]
		jmp	short loc_C8D14

loc_C8D14:
		mov	eax, [bp+var_10F]
		cmp	eax, [bp+var_FE]
		jl	short loc_C8D25
		mov	ax, 1
		jmp	short loc_C8D27

loc_C8D25:
		xor	ax, ax

loc_C8D27:
		or	ax, ax
		jnz	short loc_C8D2E
		jmp	loc_C8BE4

loc_C8D2E:
		cmp	[bp+var_22], 5
		jle	short loc_C8D39
		push	1F7h
		jmp	short loc_C8D47

loc_C8D39:
		cmp	[bp+var_22], 2
		jle	short loc_C8D44
		push	1F6h
		jmp	short loc_C8D47

loc_C8D44:
		push	1F5h

loc_C8D47:
		call	GameVar_SetFlag_5646D
		pop	cx
		cmp	[bp+var_24], 5
		jle	short loc_C8D58
		push	1FAh
		jmp	short loc_C8D66

loc_C8D58:
		cmp	[bp+var_24], 2
		jle	short loc_C8D63
		push	1F9h
		jmp	short loc_C8D66

loc_C8D63:
		push	1F8h

loc_C8D66:
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	ax, [si+5EBh]
		add	ax, [si+5EFh]
		cmp	ax, 1
		jbe	short loc_C8D82
		push	8A4h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8D82:
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax
		jmp	short loc_C8D97

loc_C8D8E:
		push	0DA30h
		call	sub_1DDFE
		pop	cx

loc_C8D97:
		push	0
		push	large 44454944h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C8DBC
		cdq
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax

loc_C8DBC:
		push	0
		push	large 524F4353h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8DD8
		jmp	loc_C8F51

loc_C8DD8:
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	edx, [si+567h]
		add	edx, eax
		mov	[bp+var_20], edx
		mov	eax, [bp+var_20]
		mov	[si+567h], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_10F], eax
		cmp	dword ptr [si+567h], 9C4h
		jl	short loc_C8E27
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8E27
		push	852h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8E27:
		cmp	dword ptr [si+567h], 1388h
		jl	short loc_C8E55
		push	850h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8E55
		push	852h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8E55
		push	853h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8E55:
		cmp	dword ptr [si+567h], 2EE0h
		jl	short loc_C8E7F
		push	891h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8E7F
		push	87Dh
		call	GameVar_SetFlag_5646D
		pop	cx
		push	896h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8E7F:
		cmp	dword ptr [si+567h], 4A38h
		jl	short loc_C8EA9
		push	893h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8EA9
		push	87Fh
		call	GameVar_SetFlag_5646D
		pop	cx
		push	896h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8EA9:
		cmp	dword ptr [si+567h], 6590h
		jl	short loc_C8ED3
		push	894h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8ED3
		push	880h
		call	GameVar_SetFlag_5646D
		pop	cx
		push	896h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8ED3:
		cmp	dword ptr [si+567h], 80E8h
		jl	short loc_C8EFD
		push	88Eh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8EFD
		push	87Ah
		call	GameVar_SetFlag_5646D
		pop	cx
		push	896h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8EFD:
		cmp	dword ptr [si+567h], 9C40h
		jl	short loc_C8F27
		push	895h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8F27
		push	881h
		call	GameVar_SetFlag_5646D
		pop	cx
		push	896h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8F27:
		cmp	dword ptr [si+567h], 0B798h
		jl	short loc_C8F51
		push	88Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8F51
		push	87Bh
		call	GameVar_SetFlag_5646D
		pop	cx
		push	896h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_C8F51:
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	1
		mov	ax, si
		add	ax, 3F0h
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		mov	bx, [bp+var_174]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8F95
		push	0DA31h
		call	sub_1DDFE
		pop	cx

loc_C8F95:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8FB7
		push	0DA32h
		call	sub_1DDFE
		pop	cx

loc_C8FB7:
		lea	ax, [bp+var_2A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		xor	di, di
		jmp	short loc_C8FFA

loc_C8FC5:
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C8FF9
		mov	[bp+var_18], di
		jmp	short loc_C902E

loc_C8FF9:
		inc	di

loc_C8FFA:
		test	[bp+var_102], 1
		jz	short loc_C9017
		mov	eax, [bp+var_FE]
		dec	eax
		cmp	eax, [bp+var_10F]
		jnz	short loc_C9017
		inc	[bp+var_10F]
		jmp	short loc_C9017

loc_C9017:
		mov	eax, [bp+var_10F]
		cmp	eax, [bp+var_FE]
		jl	short loc_C9028
		mov	ax, 1
		jmp	short loc_C902A

loc_C9028:
		xor	ax, ax

loc_C902A:
		or	ax, ax
		jz	short loc_C8FC5

loc_C902E:
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		cmp	[bp+var_18], 0FFFFh
		jnz	short loc_C9048
		push	0DA33h
		call	sub_1DDFE
		pop	cx

loc_C9048:
		mov	[bp+var_174], 520h
		lea	ax, [bp+var_174]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_174]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_C9068:
		mov	byte ptr [si+4EEh], 0FFh
		mov	al, [bp+var_2]
		mov	[bp+var_1A], al
		pop	di
		pop	si
		leave
		retf
sub_C8750		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C9077		proc far

var_54		= word ptr -54h
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		mov	si, [bp+arg_0]
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	al, [si+4EFh]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	cx, 5
		mov	bx, offset word_C9144

loc_C90C9:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_C90D8
		add	bx, 2
		loop	short loc_C90C9
		jmp	short loc_C90DE

loc_C90D8:
		jmp	word ptr cs:[bx+0Ah] ; switch jump
		jmp	short loc_C90EB

loc_C90DE:
		lea	ax, [bp+var_54]
		push	ax
		push	si
		call	sub_759F5
		add	sp, 4

loc_C90EB:
		mov	al, [si+4F0h]
		mov	[bp+var_1], al
		mov	[si+4EFh], al
		mov	byte ptr [si+4F0h], 0FFh
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	32h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_54]
		push	ax
		push	si
		call	sub_759F5
		add	sp, 4
		pop	si
		leave
		retf
sub_C9077		endp

; START OF FUNCTION CHUNK FOR sub_C9077
word_C9144	dw 0
		dw 24h
		dw 26h
		dw 27h
		dw 28h
off_C914E	dw offset loc_C90EB
		dw offset loc_C90EB
		dw offset loc_C90EB
		dw offset loc_C90EB
		dw offset loc_C90EB
; END OF FUNCTION CHUNK FOR sub_C9077

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C9158		proc far

var_166		= word ptr -166h
var_11E		= word ptr -11Eh
var_C1		= dword ptr -0C1h
var_BD		= dword ptr -0BDh
var_B9		= dword ptr -0B9h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_76		= word ptr -76h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 166h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_75915
		pop	cx
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	34h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_11E], 508h
		mov	[bp+var_BD], 100h
		mov	[bp+var_C1], 0
		mov	[bp+var_11E], 520h
		mov	[bp+var_A2], 0
		xor	ax, ax
		mov	[bp+var_A4], ax
		movsx	eax, ax
		mov	[bp+var_B9], eax
		mov	[bp+var_11E], 15AEh
		push	0
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	al, 0
		push	large 0
		push	large 4E564E49h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766BF
		pop	cx
		push	large 0
		push	large 4F464E49h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	3A23h
		mov	ax, si
		add	ax, 7BAh
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C9273
		push	3A2Bh
		mov	ax, si
		add	ax, 7BAh
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C9273
		push	3A33h
		mov	ax, si
		add	ax, 7BAh
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C928C

loc_C9273:
		mov	ax, si
		add	ax, 7BAh
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_2]
		push	ax
		jmp	short loc_C92AD

loc_C928C:
		cmp	byte ptr [si+4EEh], 0FEh
		jnz	short loc_C92A1
		push	large [bp+var_B9]
		push	large 8
		push	ds
		push	offset aINSTANT
		jmp	short loc_C92AD

loc_C92A1:
		push	large [bp+var_B9]
		push	large 8
		push	ds
		push	offset aTEST

loc_C92AD:
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 4749524Fh
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		mov	ax, si
		add	ax, 7BAh
		mov	[bp+var_6], ds
		mov	[bp+var_8], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_6]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 534E5057h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		cmp	byte ptr [si+4ECh], 0
		jnz	short loc_C9341
		jmp	loc_C950E

loc_C9341:
		push	large 0
		push	large 52594C50h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766BF
		pop	cx
		push	large 0
		push	large 50414557h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766BF
		pop	cx
		push	large 0
		push	large 534E5057h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		lea	ax, [bp+var_166]
		push	ax
		push	large 44495057h
		call	sub_75910
		add	sp, 6
		xor	di, di
		jmp	short loc_C9422

loc_C93B0:
		mov	bx, di
		imul	bx, bx, 3
		cmp	byte ptr [bx+si+556h], 0FFh
		jz	short loc_C9421
		mov	bx, di
		imul	bx, bx, 3
		mov	ax, [bx+si+557h]
		mov	[bp+var_16], ax
		push	large [bp+var_B9]
		push	large 2
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 2
		mov	bx, di
		imul	bx, bx, 3
		mov	al, [bx+si+556h]
		mov	ah, 0
		shl	ax, 3
		lea	dx, [bp+var_166]
		add	ax, dx
		mov	[bp+var_18], ds
		mov	[bp+var_1A], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_18]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8

loc_C9421:
		inc	di

loc_C9422:
		cmp	di, 4
		jl	short loc_C93B0
		mov	ax, [si+563h]
		mov	[bp+var_1C], ax
		push	large [bp+var_B9]
		push	large 2
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 2
		mov	al, [si+562h]
		mov	ah, 0
		shl	ax, 3
		lea	dx, [bp+var_166]
		add	ax, dx
		mov	[bp+var_1E], ds
		mov	[bp+var_20], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_1E]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 594F4344h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		mov	[bp+var_22], 1Eh
		push	large [bp+var_B9]
		push	large 2
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 2
		mov	[bp+var_24], 1Eh
		push	large [bp+var_B9]
		push	large 2
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 2
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766C9
		pop	cx

loc_C950E:
		push	large 0
		push	large 454D414Eh
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0FA8h
		call	CRT_Strlen
		pop	cx
		movzx	eax, ax
		mov	[bp+var_C], eax
		push	large [bp+var_B9]
		push	eax
		push	ds
		push	offset unk_776D8
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[bp+var_B9], eax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 4D414E53h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0F94h
		call	CRT_Strlen
		pop	cx
		movzx	eax, ax
		mov	[bp+var_10], eax
		push	large [bp+var_B9]
		push	eax
		push	ds
		push	offset unk_776C4
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		mov	eax, [bp+var_10]
		add	[bp+var_B9], eax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 4C4C4143h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0FBCh
		call	CRT_Strlen
		pop	cx
		movzx	eax, ax
		mov	[bp+var_14], eax
		push	large [bp+var_B9]
		push	eax
		push	ds
		push	offset unk_776EC
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		mov	eax, [bp+var_14]
		add	[bp+var_B9], eax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 4D414554h
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		cmp	byte ptr [si+65Fh], 0
		jz	short loc_C966A
		mov	ax, si
		add	ax, 65Fh
		mov	[bp+var_20], ax
		push	8
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_16], 0
		lea	ax, [bp+var_1E]
		mov	[bp+var_22], ax
		mov	[bp+var_24], ds
		mov	[bp+var_26], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_24]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8

loc_C966A:
		cmp	byte ptr [si+673h], 0
		jz	short loc_C96B7
		mov	ax, si
		add	ax, 673h
		mov	[bp+var_20], ax
		push	8
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_16], 0
		lea	ax, [bp+var_1E]
		mov	[bp+var_22], ax
		mov	[bp+var_24], ds
		mov	[bp+var_26], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_24]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8

loc_C96B7:
		cmp	byte ptr [si+687h], 0
		jz	short loc_C9704
		mov	ax, si
		add	ax, 687h
		mov	[bp+var_20], ax
		push	8
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [bp+var_16], 0
		lea	ax, [bp+var_1E]
		mov	[bp+var_22], ax
		mov	[bp+var_24], ds
		mov	[bp+var_26], ax
		push	large [bp+var_B9]
		push	large 8
		push	[bp+var_24]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_B9], 8

loc_C9704:
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D3
		pop	cx
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_766D8
		pop	cx
		mov	[bp+var_11E], 520h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C9158		endp
ovr361		ends
