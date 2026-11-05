ovr396		segment	para public 'OVERLAY' use16
		assume cs:ovr396
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E3A60		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	loc_E3AF4

loc_E3A6D:
		mov	dx, di
		or	dx, dx
		jl	short loc_E3A7E
		cmp	dx, 3
		jge	short loc_E3A7E
		mov	[si+28Bh], dx
		jmp	short loc_E3A7E

loc_E3A7E:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	ax, [bx+si+27Fh]
		jge	short loc_E3ABE
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+27Fh]
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4

loc_E3ABE:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	bx, [si+28Bh]
		shl	bx, 1
		sub	ax, [bx+si+27Fh]
		push	ax
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4
		inc	di

loc_E3AF4:
		cmp	di, 3
		jge	short loc_E3AFC
		jmp	loc_E3A6D

loc_E3AFC:
		pop	di
		pop	si
		pop	bp
		retf
sub_E3A60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E3B00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	loc_E3B91

loc_E3B0D:
		mov	dx, di
		or	dx, dx
		jl	short loc_E3B1E
		cmp	dx, 3
		jge	short loc_E3B1E
		mov	[si+28Bh], dx
		jmp	short loc_E3B1E

loc_E3B1E:
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+27Fh], 0
		jz	short loc_E3B90
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jge	short loc_E3B5B
		push	0
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4

loc_E3B5B:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	bx, [si+28Bh]
		shl	bx, 1
		add	ax, [bx+si+27Fh]
		push	ax
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4

loc_E3B90:
		inc	di

loc_E3B91:
		cmp	di, 3
		jge	short loc_E3B99
		jmp	loc_E3B0D

loc_E3B99:
		pop	di
		pop	si
		pop	bp
		retf
sub_E3B00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E3B9D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		inc	si
		push	13BAh
		call	GameVar_SetFlag_5646D
		pop	cx
		push	834h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	837h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	838h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	83Ah
		call	GameVar_ClearFlag_56520
		pop	cx
		push	835h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	836h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	839h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	83Eh
		call	GameVar_ClearFlag_56520
		pop	cx
		push	841h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	842h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	83Fh
		call	GameVar_ClearFlag_56520
		pop	cx
		push	840h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	843h
		call	GameVar_ClearFlag_56520
		pop	cx
		mov	bx, [bp+arg_0]
		cmp	bx, 8
		jbe	short loc_E3C2E
		jmp	loc_E3D6C

loc_E3C2E:
		shl	bx, 1
		jmp	cs:off_E3D8B[bx]	; switch jump

loc_E3C35:
		push	834h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	ax, si
		cmp	ax, 2
		jz	short loc_E3C48
		jmp	loc_E3D6C

loc_E3C48:
		push	83Fh

loc_E3C4B:
		call	GameVar_SetFlag_5646D
		pop	cx
		jmp	loc_E3D6C

loc_E3C54:
		push	837h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	bx, si
		sub	bx, 2
		cmp	bx, 6
		jbe	short loc_E3C6A
		jmp	loc_E3D6C

loc_E3C6A:
		shl	bx, 1
		jmp	cs:off_E3D7D[bx]	; switch jump

loc_E3C71:
		jmp	short loc_E3C85

loc_E3C73:
		jmp	loc_E3D60

loc_E3C76:
		jmp	loc_E3D60

loc_E3C79:
		jmp	loc_E3D12

loc_E3C7C:
		push	840h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_E3C85:
		push	843h
		jmp	short loc_E3C4B

loc_E3C8A:
		push	840h
		jmp	loc_E3D5A

loc_E3C90:
		jmp	short loc_E3C8A

loc_E3C92:
		push	838h
		call	GameVar_SetFlag_5646D
		pop	cx
		cmp	si, 5
		jz	short loc_E3CA3
		jmp	loc_E3D6C

loc_E3CA3:
		jmp	short loc_E3D12

loc_E3CA5:
		push	83Ah
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	ax, si
		cmp	ax, 2
		jz	short loc_E3C48
		cmp	ax, 3
		jnz	short loc_E3CBD
		jmp	loc_E3D57

loc_E3CBD:
		cmp	ax, 4
		jz	short loc_E3D2F
		jmp	loc_E3D6C
		jmp	short loc_E3C48
		jmp	loc_E3D57
		jmp	short loc_E3D2F

loc_E3CCC:
		push	835h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	ax, si
		cmp	ax, 2
		jz	short loc_E3D57
		cmp	ax, 3
		jnz	short loc_E3CE4
		jmp	loc_E3D66

loc_E3CE4:
		cmp	ax, 4
		jz	short loc_E3D66
		jmp	loc_E3D6C
		jmp	short loc_E3D57
		jmp	short loc_E3D66
		jmp	short loc_E3D66

loc_E3CF2:
		push	836h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	bx, si
		sub	bx, 2
		cmp	bx, 6
		ja	short loc_E3D6C
		shl	bx, 1
		jmp	cs:off_E3D6F[bx]	; switch jump

loc_E3D0C:
		jmp	short loc_E3D60

loc_E3D0E:
		jmp	short loc_E3D66

loc_E3D10:
		jmp	short loc_E3D2F

loc_E3D12:
		push	840h
		jmp	loc_E3C4B

loc_E3D18:
		jmp	loc_E3C8A

loc_E3D1B:
		push	840h
		call	GameVar_SetFlag_5646D
		pop	cx
		jmp	short loc_E3D66

loc_E3D26:
		push	840h
		call	GameVar_SetFlag_5646D
		pop	cx

loc_E3D2F:
		push	83Eh
		jmp	loc_E3C4B

loc_E3D35:
		push	839h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	ax, si
		cmp	ax, 2
		jnz	short loc_E3D48
		jmp	loc_E3C48

loc_E3D48:
		cmp	ax, 3
		jz	short loc_E3D57
		cmp	ax, 4
		jz	short loc_E3D66
		jmp	short loc_E3D6C
		jmp	loc_E3C48

loc_E3D57:
		push	83Fh

loc_E3D5A:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_E3D60:
		push	842h
		jmp	loc_E3C4B

loc_E3D66:
		push	841h
		jmp	loc_E3C4B

loc_E3D6C:
		pop	si
		pop	bp
		retf
sub_E3B9D		endp

; START OF FUNCTION CHUNK FOR sub_E3B9D
off_E3D6F	dw offset loc_E3D0C
		dw offset loc_E3D0E
		dw offset loc_E3D10
		dw offset loc_E3D12
		dw offset loc_E3D18
		dw offset loc_E3D1B
		dw offset loc_E3D26
off_E3D7D	dw offset loc_E3C71
		dw offset loc_E3C73
		dw offset loc_E3C76
		dw offset loc_E3C79
		dw offset loc_E3C7C
		dw offset loc_E3C8A
		dw offset loc_E3C90
off_E3D8B	dw offset loc_E3C35
		dw offset loc_E3C35
		dw offset loc_E3C54
		dw offset loc_E3C54
		dw offset loc_E3C92
		dw offset loc_E3CA5
		dw offset loc_E3CCC
		dw offset loc_E3CF2
		dw offset loc_E3D35
; END OF FUNCTION CHUNK FOR sub_E3B9D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E3D9D		proc far

var_2A4		= word ptr -2A4h
var_28E		= word ptr -28Eh
var_28C		= word ptr -28Ch
var_278		= byte ptr -278h
var_274		= word ptr -274h
var_264		= word ptr -264h
var_262		= word ptr -262h
var_260		= word ptr -260h
var_25C		= word ptr -25Ch
var_1E4		= word ptr -1E4h
var_16C		= word ptr -16Ch
var_11C		= word ptr -11Ch
var_CA		= word ptr -0CAh
var_C6		= word ptr -0C6h
var_C4		= word ptr -0C4h
var_63		= word ptr -63h
var_61		= word ptr -61h
var_5F		= dword ptr -5Fh
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2A4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	[bp+var_56], 0
		mov	[bp+var_54], 0
		mov	[bp+var_52], 0
		mov	[bp+var_50], 0
		mov	[bp+var_4E], 13Fh
		mov	[bp+var_4C], 0C7h
		push	0
		lea	ax, [bp+var_56]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74C9E
		add	sp, 4
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_75EC5
		pop	cx
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMedit_1
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_16C]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	5
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_E3E8A
		mov	word ptr [di+3], 0
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	di
		call	sub_7624F
		add	sp, 4
		mov	ax, di
		jmp	short loc_E3E8C

loc_E3E8A:
		mov	ax, di

loc_E3E8C:
		mov	[bp+var_10], ax
		push	1
		lea	ax, [bp+var_16C]
		push	ax
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 2
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		push	3
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	3
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	1
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+var_10]
		push	word ptr [bx]
		mov	al, [bx+2]
		push	ax
		push	bx
		call	sub_76259
		add	sp, 8
		mov	[bp+var_2F], 0
		mov	[bp+var_32], 14h
		push	19EAh
		call	GameVar_SetFlag_5646D
		pop	cx
		push	104h
		call	GameVar_SetFlag_5646D
		pop	cx
		push	si
		call	sub_75915
		pop	cx
		push	0F0h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_E3F80
		jmp	loc_E4027

loc_E3F80:
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	ax, di
		add	ax, 1Ah
		push	ax
		call	sub_75332
		pop	cx
		mov	ax, di
		add	ax, 1Eh
		push	ax
		call	sub_75341
		pop	cx
		mov	ax, di
		add	ax, 24h
		push	ax
		call	sub_75350
		pop	cx
		mov	ax, di
		add	ax, 28h
		push	ax
		call	sub_7535F
		pop	cx
		mov	word ptr [di+2Eh], 0
		mov	dword ptr [di+30h], 0
		mov	ax, di
		add	ax, 34h
		push	ax
		call	sub_75391
		pop	cx
		mov	ax, di
		add	ax, 3Ah
		push	ax
		call	sub_753AF
		pop	cx
		mov	ax, di
		add	ax, 40h
		push	ax
		call	sub_7530A
		pop	cx
		mov	word ptr [di+79h], 0
		mov	byte ptr [di+7Fh], 0
		push	seg seg067
		push	offset String_ConstructEmpty
		push	large 10003h
		push	9
		mov	ax, di
		add	ax, 9Fh
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [di+0CAh], 0
		mov	dword ptr [di+0ECh], 0
		push	di
		call	sub_752A3
		pop	cx
		mov	ax, di
		jmp	short loc_E4029

loc_E4027:
		mov	ax, di

loc_E4029:
		mov	[bp+var_2], ax
		cmp	word_7D18E, 0
		jnz	short loc_E4078
		push	0F9Fh
		call	GameVar_ClearFlag_56520
		pop	cx
		mov	ax, si
		add	ax, 7BAh
		push	ax
		push	[bp+var_2]
		call	sub_752A8
		add	sp, 4
		push	0
		call	sub_7594F
		pop	cx
		mov	word_7D18E, ax
		push	[bp+var_2]
		push	ax
		call	sub_75968
		add	sp, 4
		push	word_7D18E
		push	cs
		call	near ptr sub_E3A60
		pop	cx
		push	0F9Fh
		call	GameVar_SetFlag_5646D
		pop	cx
		jmp	short loc_E4089

loc_E4078:
		mov	ax, si
		add	ax, 7BAh
		push	ax
		push	[bp+var_2]
		call	sub_752A8
		add	sp, 4

loc_E4089:
		push	1
		push	0
		call	sub_73263
		add	sp, 4
		mov	[bp+var_4], ax
		push	0
		call	sub_7594F
		pop	cx
		mov	di, ax
		cmp	word_7D190, 0
		jz	short loc_E40B2
		push	ds
		push	ax
		push	ds
		push	word_7D190
		jmp	short loc_E40B9

loc_E40B2:
		push	ds
		push	di
		push	ds
		push	word_7D18E

loc_E40B9:
		mov	cx, 299h
		call	CRT_Fmemcpy
		mov	word ptr [di+28Bh], 0
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C25
		pop	cx
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		mov	ax, di
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		lea	ax, [bp+var_32]
		mov	[bp+var_34], ss
		mov	[bp+var_36], ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_75ECA
		add	sp, 0Ah
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_75EE8
		pop	cx
		push	di
		call	sub_7595E
		pop	cx
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSmFont
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_44+2], dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 2
		mov	[bp+var_3B], 1
		mov	[bp+var_3A], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_274]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		push	0Fh
		lea	ax, [bp+var_274]
		push	ax
		call	sub_6932C
		add	sp, 4
		mov	[bp+var_264], 1
		mov	[bp+var_262], 0
		push	2Dh
		lea	ax, [bp+var_274]
		push	ax
		mov	bx, [bp+var_274]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_260], ax
		lea	ax, [bp+var_274]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_28E]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	large 0
		lea	ax, [bp+var_28E]
		push	ax
		lea	ax, [bp+var_2A4]
		push	ax
		call	sub_62958
		add	sp, 8
		mov	[bp+var_278], 4
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74CC6
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		jmp	loc_E49A2

loc_E4204:
		push	0
		lea	ax, [bp+var_56]
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0FFF2FFCEh
		lea	ax, [bp+var_56]
		push	ax
		push	[bp+var_4]
		call	sub_7329A
		add	sp, 8
		push	large 0
		mov	al, [bp+var_2A]
		push	ax
		push	large [bp+var_2E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_56]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		push	di
		call	sub_75986
		add	sp, 6
		push	di
		lea	ax, [bp+var_28E]
		push	ax
		call	sub_7597C
		add	sp, 4
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	sub_6735D
		add	sp, 4
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_48]
		push	ax
		call	sub_67383
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_56]
		push	ax
		push	word_7AF7C
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_75EE8
		pop	cx
		push	di
		call	sub_7595E
		pop	cx
		jmp	short loc_E4305

loc_E42BF:
		push	large 1
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_46], ax
		cmp	[bp+var_46], 0
		jz	short loc_E4305
		cmp	word ptr [bp+var_5F], 0
		jnz	short loc_E42E4
		cmp	word ptr [bp+var_5F+2], 0
		jz	short loc_E4305

loc_E42E4:
		push	large [bp+var_5F]
		mov	ax, [bp+var_61]
		sub	ax, [bp+var_C4]
		push	ax
		mov	ax, [bp+var_63]
		sub	ax, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_E4305:
		cmp	[bp+var_32], 14h
		jz	short loc_E42BF
		mov	bx, [bp+var_32]
		cmp	bx, 13h
		jbe	short loc_E4316
		jmp	loc_E499D

loc_E4316:
		shl	bx, 1
		jmp	cs:off_E4BA3[bx]	; switch jump

loc_E431D:
		cmp	byte ptr [di+28Dh], 0
		jz	short loc_E435B
		cmp	word_7D190, 0
		jz	short loc_E4335
		push	word_7D190
		call	sub_3B2
		pop	cx

loc_E4335:
		mov	word_7D190, di
		mov	bx, [di+28Eh]
		shl	bx, 1
		push	word ptr [bx+di+285h]
		mov	bx, [di+28Eh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		push	cs
		call	near ptr sub_E3B9D
		add	sp, 4
		mov	[bp+var_2F], 1
		jmp	loc_E499D

loc_E435B:
		call	sub_75990
		jmp	loc_E499D

loc_E4363:
		mov	byte ptr [bp+var_46+1], 0
		mov	byte ptr [bp+var_46], 0
		mov	ax, [di+28Bh]
		mov	[bp+var_48], ax
		inc	word ptr [di+28Bh]
		cmp	word ptr [di+28Bh], 2
		jle	short loc_E4385
		mov	word ptr [di+28Bh], 2
		jmp	short loc_E4385

loc_E4385:
		mov	ax, [di+28Bh]
		cmp	ax, [bp+var_48]
		jz	short loc_E4391
		jmp	loc_E4414

loc_E4391:
		jmp	short loc_E4410

loc_E4393:
		cmp	word ptr [di+28Bh], 2
		jnz	short loc_E439E
		mov	byte ptr [bp+var_46+1], 1

loc_E439E:
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+24Ch], 0Ah
		jge	short loc_E43BB
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	bx, [bx+di+24Ch]
		mov	al, [bx+di+19Ah]
		jmp	short loc_E43BD

loc_E43BB:
		mov	al, 0

loc_E43BD:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E43EA
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+27Fh], 0
		jnz	short loc_E43EA
		push	0FFFFh
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C2A
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	[bx+di+24Ch], ax

loc_E43EA:
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+24Ch], 0FFFFh
		jnz	short loc_E440C
		inc	word ptr [di+28Bh]
		cmp	word ptr [di+28Bh], 2
		jle	short loc_E440A
		mov	word ptr [di+28Bh], 2
		jmp	short loc_E4414

loc_E440A:
		jmp	short loc_E4414

loc_E440C:
		mov	byte ptr [bp+var_46], 1

loc_E4410:
		mov	byte ptr [bp+var_46+1], 1

loc_E4414:
		mov	al, byte ptr [bp+var_46+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E4420
		jmp	loc_E4393

loc_E4420:
		cmp	byte ptr [bp+var_46], 0
		jnz	short loc_E4429
		jmp	loc_E499D

loc_E4429:
		push	di
		call	sub_7595E
		jmp	loc_E4984

loc_E4432:
		mov	byte ptr [bp+var_46+1], 0
		mov	byte ptr [bp+var_46], 0
		mov	ax, [di+28Bh]
		mov	[bp+var_48], ax
		dec	word ptr [di+28Bh]
		cmp	word ptr [di+28Bh], 0
		jge	short loc_E4454
		mov	word ptr [di+28Bh], 0
		jmp	short loc_E4454

loc_E4454:
		mov	ax, [di+28Bh]
		cmp	ax, [bp+var_48]
		jz	short loc_E4460
		jmp	loc_E44E3

loc_E4460:
		jmp	short loc_E44DF

loc_E4462:
		cmp	word ptr [di+28Bh], 0
		jnz	short loc_E446D
		mov	byte ptr [bp+var_46+1], 1

loc_E446D:
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+24Ch], 0Ah
		jge	short loc_E448A
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	bx, [bx+di+24Ch]
		mov	al, [bx+di+19Ah]
		jmp	short loc_E448C

loc_E448A:
		mov	al, 0

loc_E448C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E44B9
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+27Fh], 0
		jnz	short loc_E44B9
		push	0FFFFh
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C2A
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	[bx+di+24Ch], ax

loc_E44B9:
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+24Ch], 0FFFFh
		jnz	short loc_E44DB
		dec	word ptr [di+28Bh]
		cmp	word ptr [di+28Bh], 0
		jge	short loc_E44D9
		mov	word ptr [di+28Bh], 0
		jmp	short loc_E44E3

loc_E44D9:
		jmp	short loc_E44E3

loc_E44DB:
		mov	byte ptr [bp+var_46], 1

loc_E44DF:
		mov	byte ptr [bp+var_46+1], 1

loc_E44E3:
		mov	al, byte ptr [bp+var_46+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E44EF
		jmp	loc_E4462

loc_E44EF:
		cmp	byte ptr [bp+var_46], 0
		jnz	short loc_E44F8
		jmp	loc_E499D

loc_E44F8:
		jmp	loc_E4429

loc_E44FB:
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C2A

loc_E4510:
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	[bx+di+24Ch], ax
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		mov	ax, di
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		push	0FFFFh

loc_E4537:
		mov	ax, di
		add	ax, 1A4h
		push	ax
		call	sub_75C65
		jmp	loc_E48CF

loc_E4545:
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C2F
		jmp	short loc_E4510

loc_E455C:
		mov	ax, [di+27Fh]
		add	ax, [di+281h]
		add	ax, [di+283h]
		cmp	ax, 6
		jl	short loc_E4570
		jmp	loc_E499D

loc_E4570:
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_E458B
		jmp	loc_E499D

loc_E458B:
		mov	bx, [di+28Bh]
		shl	bx, 1
		inc	word ptr [bx+di+27Fh]
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+27Fh], 4
		jle	short loc_E45B2
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	word ptr [bx+di+27Fh], 4
		mov	al, 0
		jmp	short loc_E45B4

loc_E45B2:
		mov	al, 1

loc_E45B4:
		or	al, al
		jz	short loc_E45F7
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		dec	ax
		push	ax
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4
		push	di
		call	sub_7595E
		pop	cx
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C25
		pop	cx

loc_E45F7:
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+27Fh], 1
		jz	short loc_E4607
		jmp	loc_E499D

loc_E4607:
		mov	al, [di+28Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_E4614
		jmp	loc_E499D

loc_E4614:
		mov	byte ptr [di+28Dh], 1
		mov	ax, [di+28Bh]
		mov	[di+28Eh], ax
		mov	bx, [di+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+di+271h], 1
		mov	bx, [di+28Bh]
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+254h], 0
		jmp	loc_E499D

loc_E463D:
		mov	ax, [di+27Fh]
		add	ax, [di+281h]
		add	ax, [di+283h]
		jg	short loc_E464E
		jmp	loc_E499D

loc_E464E:
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	dx, [bx+di+27Fh]
		or	dx, dx
		jle	short loc_E4675
		cmp	dx, 5
		jge	short loc_E4675
		mov	ax, [di+28Bh]
		imul	ax, ax, 5
		mov	bx, di
		add	bx, ax
		add	bx, dx
		mov	byte ptr [bx+270h], 0
		jmp	short loc_E4675

loc_E4675:
		mov	bx, [di+28Bh]
		shl	bx, 1
		dec	word ptr [bx+di+27Fh]
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+27Fh], 0
		jge	short loc_E469C
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	word ptr [bx+di+27Fh], 0
		mov	al, 0
		jmp	short loc_E469E

loc_E469C:
		mov	al, 1

loc_E469E:
		or	al, al
		jnz	short loc_E46A5
		jmp	loc_E475D

loc_E46A5:
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		inc	ax
		push	ax
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+27Fh]
		inc	ax
		jle	short loc_E4710
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+27Fh]
		inc	ax
		cmp	ax, 5
		jge	short loc_E4710
		mov	ax, [di+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, di
		add	bx, ax
		push	bx
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	ax, [bx+di+27Fh]
		inc	ax
		shl	ax, 1
		pop	bx
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_E4713

loc_E4710:
		mov	ax, 1

loc_E4713:
		push	ax
		push	di
		call	sub_75CB9
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	dx, [bx+di+27Fh]
		inc	dx
		or	dx, dx
		jle	short loc_E474A
		cmp	dx, 5
		jge	short loc_E474A
		mov	ax, [di+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, di
		add	bx, ax
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+252h], 1
		jmp	short loc_E474A

loc_E474A:
		push	di
		call	sub_7595E
		pop	cx
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C25
		pop	cx

loc_E475D:
		mov	bx, [di+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+di+27Fh], 0
		jz	short loc_E476D
		jmp	loc_E499D

loc_E476D:
		cmp	byte ptr [di+28Dh], 0
		jnz	short loc_E4777
		jmp	loc_E499D

loc_E4777:
		mov	ax, [di+28Eh]
		cmp	ax, [di+28Bh]
		jz	short loc_E4784
		jmp	loc_E499D

loc_E4784:
		mov	bx, [di+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+di+271h], 0
		mov	byte ptr [di+28Dh], 0
		mov	bx, [di+28Bh]
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+254h], 1
		push	0
		push	di
		call	sub_75CB9
		jmp	loc_E499A

loc_E47AD:
		mov	si, [bp+var_32]
		add	si, 0FFFAh
		or	si, si
		jle	short loc_E47D3
		cmp	si, 5
		jge	short loc_E47D3
		mov	ax, [di+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, di
		add	bx, ax
		mov	ax, si
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_E47D6

loc_E47D3:
		mov	ax, 1

loc_E47D6:
		mov	[bp+var_46], ax
		push	ax
		push	di
		call	sub_75CB9
		add	sp, 4
		push	[bp+var_46]
		push	di
		call	sub_75CAF
		add	sp, 4
		mov	[bp+var_46], ax
		mov	dx, si
		mov	cx, [bp+var_46]
		or	dx, dx
		jle	short loc_E4826
		cmp	dx, 5
		jge	short loc_E4826
		mov	ax, [di+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, di
		add	bx, ax
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	[bx+252h], cx
		cmp	cx, 2
		jl	short loc_E4826
		push	cx
		push	di
		call	sub_75CB9
		add	sp, 4
		jmp	short loc_E48A3

loc_E4826:
		jmp	short loc_E48A3
		jmp	short loc_E48A3

loc_E482A:
		mov	si, [bp+var_32]
		add	si, 0FFF6h
		or	si, si
		jle	short loc_E4850
		cmp	si, 5
		jge	short loc_E4850
		mov	ax, [di+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, di
		add	bx, ax
		mov	ax, si
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_E4853

loc_E4850:
		mov	ax, 1

loc_E4853:
		mov	[bp+var_46], ax
		push	ax
		push	di
		call	sub_75CB9
		add	sp, 4
		push	[bp+var_46]
		push	di
		call	sub_75CB4
		add	sp, 4
		mov	[bp+var_46], ax
		mov	dx, si
		mov	cx, [bp+var_46]
		or	dx, dx
		jle	short loc_E48A3
		cmp	dx, 5
		jge	short loc_E48A3
		mov	ax, [di+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, di
		add	bx, ax
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	[bx+252h], cx
		cmp	cx, 2
		jl	short loc_E48A3
		push	cx
		push	di
		call	sub_75CB9
		add	sp, 4
		jmp	short loc_E48A3

loc_E48A3:
		push	di
		call	sub_7595E
		pop	cx
		jmp	loc_E499D

loc_E48AD:
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+285h]
		jmp	loc_E4537

loc_E48BA:
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+285h]
		mov	ax, di
		add	ax, 1A4h
		push	ax
		call	sub_75C6A

loc_E48CF:
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	[bx+di+285h], ax
		jmp	loc_E499D

loc_E48DF:
		push	di
		push	cs
		call	near ptr sub_E3B00
		pop	cx
		push	di
		call	sub_75954
		pop	cx
		mov	word ptr [di+28Bh], 0
		push	di
		call	sub_7595E
		pop	cx
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C25
		pop	cx
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		mov	ax, di
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		push	0
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C2A
		add	sp, 4
		mov	bx, [di+28Bh]
		shl	bx, 1
		mov	[bx+di+24Ch], ax
		jmp	short loc_E499D

loc_E4939:
		push	di
		push	cs
		call	near ptr sub_E3B00
		pop	cx
		cmp	word_7D190, 0
		jz	short loc_E4957
		push	ds
		push	di
		push	ds
		push	word_7D190
		jmp	short loc_E495E
		jmp	short loc_E4957

loc_E4951:
		push	di
		push	cs
		call	near ptr sub_E3B00
		pop	cx

loc_E4957:
		push	ds
		push	di
		push	ds
		push	word_7D18E

loc_E495E:
		mov	cx, 299h
		call	CRT_Fmemcpy
		push	di
		push	cs
		call	near ptr sub_E3A60
		pop	cx
		mov	word ptr [di+28Bh], 0
		push	di
		call	sub_7595E
		pop	cx
		mov	ax, di
		add	ax, 0D2h
		push	ax
		call	sub_75C25

loc_E4984:
		pop	cx
		mov	bx, [di+28Bh]
		shl	bx, 1
		push	word ptr [bx+di+24Ch]
		mov	ax, di
		add	ax, 1A4h
		push	ax
		call	sub_75C6F

loc_E499A:
		add	sp, 4

loc_E499D:
		mov	[bp+var_32], 14h

loc_E49A2:
		mov	al, [bp+var_2F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E49AE
		jmp	loc_E4204

loc_E49AE:
		push	104h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	19EAh
		call	GameVar_ClearFlag_56520
		pop	cx
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74CEE
		pop	cx
		cmp	[bp+var_4], 0
		jz	short loc_E49DE
		push	3
		push	[bp+var_4]
		call	sub_73268
		add	sp, 4

loc_E49DE:
		push	[bp+var_2]
		call	sub_752B2
		pop	cx
		call	sub_7522C
		cmp	[bp+var_2], 0
		jz	short loc_E49FF
		push	3
		push	[bp+var_2]
		call	sub_752AD
		add	sp, 4

loc_E49FF:
		cmp	[bp+var_10], 0
		jz	short loc_E4A19
		push	[bp+var_10]
		call	sub_7627C
		pop	cx
		push	[bp+var_10]
		call	sub_3B2
		pop	cx
		jmp	short loc_E4A19

loc_E4A19:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	2
		lea	ax, [bp+var_2A4]
		push	ax
		call	sub_629D1
		add	sp, 4
		lea	ax, [bp+var_28C]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_274]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_E4A74
		cmp	[bp+var_40], 0
		jz	short loc_E4A74
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E4A74

loc_E4A74:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_29], 0
		jz	short loc_E4AAC
		cmp	[bp+var_2E], 0
		jz	short loc_E4AAC
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E4AAC

loc_E4AAC:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	[bp+var_1F], 0
		jz	short loc_E4AE4
		cmp	[bp+var_24], 0
		jz	short loc_E4AE4
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E4AE4

loc_E4AE4:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	[bp+var_15], 0
		jz	short loc_E4B1C
		cmp	[bp+var_1A], 0
		jz	short loc_E4B1C
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E4B1C

loc_E4B1C:
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_E4B63
		cmp	[bp+var_E], 0
		jz	short loc_E4B63
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E4B63

loc_E4B63:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_74CA8
		add	sp, 4
		lea	ax, [bp+var_56]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_E3D9D		endp

; START OF FUNCTION CHUNK FOR sub_E3D9D
off_E4BA3	dw offset loc_E431D
		dw offset loc_E44FB
		dw offset loc_E4545
		dw offset loc_E455C
		dw offset loc_E463D
		dw offset loc_E48AD
		dw offset loc_E48BA
		dw offset loc_E47AD
		dw offset loc_E47AD
		dw offset loc_E47AD
		dw offset loc_E47AD
		dw offset loc_E482A
		dw offset loc_E482A
		dw offset loc_E482A
		dw offset loc_E482A
		dw offset loc_E4363
		dw offset loc_E4432
		dw offset loc_E4939
		dw offset loc_E48DF
		dw offset loc_E4951
; END OF FUNCTION CHUNK FOR sub_E3D9D
ovr396		ends
