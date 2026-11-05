ovr362		segment	para public 'OVERLAY' use16
		assume cs:ovr362
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C9750		proc far

var_46E		= word ptr -46Eh
var_41E		= word ptr -41Eh
var_411		= dword ptr -411h
var_40D		= dword ptr -40Dh
var_408		= word ptr -408h
var_3C1		= dword ptr -3C1h
var_3BD		= dword ptr -3BDh
var_3B8		= word ptr -3B8h
var_368		= word ptr -368h
var_366		= word ptr -366h
var_34E		= word ptr -34Eh
var_34C		= word ptr -34Ch
var_34A		= word ptr -34Ah
var_348		= word ptr -348h
var_346		= word ptr -346h
var_344		= word ptr -344h
var_340		= word ptr -340h
var_33C		= word ptr -33Ch
var_33A		= word ptr -33Ah
var_2D9		= word ptr -2D9h
var_2D7		= word ptr -2D7h
var_2D5		= dword ptr -2D5h
var_2D1		= word ptr -2D1h
var_2CF		= word ptr -2CFh
var_2CC		= word ptr -2CCh
var_2BC		= word ptr -2BCh
var_2BA		= word ptr -2BAh
var_2B8		= word ptr -2B8h
var_2B4		= word ptr -2B4h
var_23C		= word ptr -23Ch
var_1EC		= word ptr -1ECh
var_174		= word ptr -174h
var_124		= word ptr -124h
var_106		= word ptr -106h
var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_58		= word ptr -58h
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= byte ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= byte ptr -42h
var_41		= word ptr -41h
var_3E		= dword ptr -3Eh
var_3A		= byte ptr -3Ah
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 46Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+7C5h], 0
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		xor	eax, eax
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		call	sub_75750
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
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
		lea	ax, [bp+var_F8]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_124]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_22A2
		add	sp, 6
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_C9836
		lea	ax, [bp+var_41E]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_41E], 508h
		mov	[bp+var_3BD], 100h
		mov	[bp+var_3C1], 0
		mov	[bp+var_41E], 0E61h
		push	1
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_41E]
		push	ax
		mov	bx, [bp+var_41E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_41E]
		push	ax
		call	sub_757F9
		pop	cx
		or	al, al
		jz	short loc_C9827
		mov	[bp+var_9], 1

loc_C9827:
		push	0
		lea	ax, [bp+var_41E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_C9836:
		push	seg seg008
		push	offset loc_60E5
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ds
		push	offset unk_7A179
		push	ss
		lea	ax, [bp+var_A8]
		push	ax
		push	2
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_124]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_22A2
		add	sp, 6
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_C988F
		jmp	loc_C9939

loc_C988F:
		push	ds
		push	offset unk_7A17A
		push	ss
		lea	ax, [bp+var_106]
		push	ax
		push	2
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_408]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_46E]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_46E], 508h
		mov	[bp+var_40D], 100h
		mov	[bp+var_411], 0
		mov	[bp+var_46E], 0E61h
		push	1
		lea	ax, [bp+var_408]
		push	ax
		lea	ax, [bp+var_46E]
		push	ax
		mov	bx, [bp+var_46E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_46E]
		push	ax
		call	sub_757F9
		pop	cx
		or	al, al
		jz	short loc_C9918
		mov	[bp+var_A], 1
		push	0
		lea	ax, [bp+var_46E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		jmp	short loc_C9939

loc_C9918:
		push	0
		lea	ax, [bp+var_46E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_124]
		push	ax
		call	sub_22D5
		pop	cx
		or	ax, ax
		jnz	short loc_C9939
		jmp	loc_C988F

loc_C9939:
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C9957
		mov	al, byte_7A178
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C9952
		push	si
		call	sub_75E44
		pop	cx

loc_C9952:
		mov	byte_7A178, 1

loc_C9957:
		mov	byte ptr [si+7C5h], 0
		push	100h
		push	0
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76245
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	37h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	38h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_23C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_2B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	55h
		lea	ax, [bp+var_1EC]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	11h
		lea	ax, [bp+var_2B4]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	seg seg008
		push	offset loc_60EB
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_A8]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_34+2], dx
		mov	word ptr [bp+var_34], ax
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 1
		mov	[bp+var_2A], 0
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_2CC]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_2BC], 1
		mov	[bp+var_2BA], 0
		push	2Dh
		lea	ax, [bp+var_2CC]
		push	ax
		mov	bx, [bp+var_2CC]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_2B8], ax
		push	large 0A90103h
		push	large 1E003Ch
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_2D1], 0
		mov	[bp+var_2CF], 1
		mov	[bp+var_34E], 0
		mov	[bp+var_34C], 0
		mov	[bp+var_34A], 0
		mov	[bp+var_348], 0
		mov	[bp+var_346], 0C7h
		mov	[bp+var_344], 8Bh
		push	0
		lea	ax, [bp+var_34E]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		lea	ax, [bp+var_2CC]
		push	ax
		lea	ax, [bp+var_34E]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		push	2
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	56h
		lea	ax, [bp+var_1EC]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_44], 0
		mov	[bp+var_41], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	sub_76281
		add	sp, 4
		mov	[bp+var_46], 6
		push	seg seg008
		push	offset loc_60F1
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0
		mov	al, [bp+var_3A]
		push	ax
		push	large [bp+var_3E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_34E]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	0Fh
		push	large 1400BDh
		push	large 14000Ah
		lea	ax, [bp+var_34E]
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_60F8
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 0A0037h
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_6107
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 1E002Fh
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_6116
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 2F0032h
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_6125
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 400038h
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_614A
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 510032h
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	large 1F0024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_C9D45
		push	large 0F00D2h
		push	large 17000Bh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3A4Bh
		lea	ax, [bp+var_46]
		mov	[di+20h], ds
		mov	[di+1Eh], ax
		mov	word ptr [di+22h], 0
		mov	ax, di
		jmp	short loc_C9D47

loc_C9D45:
		mov	ax, di

loc_C9D47:
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 170024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_48], ax
		or	ax, ax
		jz	short loc_C9D98
		push	large 0F00D2h
		push	large 2B000Bh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_48]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_46]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 3
		mov	ax, [bp+var_48]
		jmp	short loc_C9D9B

loc_C9D98:
		mov	ax, [bp+var_48]

loc_C9D9B:
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 2F0024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_4A], ax
		or	ax, ax
		jz	short loc_C9DEC
		push	large 0F00D2h
		push	large 3B000Bh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_46]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 4
		mov	ax, [bp+var_4A]
		jmp	short loc_C9DEF

loc_C9DEC:
		mov	ax, [bp+var_4A]

loc_C9DEF:
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 200024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_4C], ax
		or	ax, ax
		jz	short loc_C9E40
		push	large 0F00D2h
		push	large 4B000Bh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_4C]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_46]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 5
		mov	ax, [bp+var_4C]
		jmp	short loc_C9E43

loc_C9E40:
		mov	ax, [bp+var_4C]

loc_C9E43:
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C8A
		add	sp, 6
		cmp	[bp+var_9], 0
		jnz	short loc_C9E5A
		jmp	loc_C9EDE

loc_C9E5A:
		push	large 2E0024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_4E], ax
		or	ax, ax
		jz	short loc_C9E9D
		push	large 0F00D2h
		push	large 5B000Bh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_4E]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_46]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 1
		mov	ax, [bp+var_4E]
		jmp	short loc_C9EA0

loc_C9E9D:
		mov	ax, [bp+var_4E]

loc_C9EA0:
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	seg seg008
		push	offset loc_6132
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 62002Fh
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah

loc_C9EDE:
		cmp	[bp+var_A], 0
		jnz	short loc_C9EE7
		jmp	loc_C9F6B

loc_C9EE7:
		push	large 260024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_50], ax
		or	ax, ax
		jz	short loc_C9F2A
		push	large 0F00D2h
		push	large 6B000Bh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_46]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 2
		mov	ax, [bp+var_50]
		jmp	short loc_C9F2D

loc_C9F2A:
		mov	ax, [bp+var_50]

loc_C9F2D:
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	seg seg008
		push	offset loc_6140
		lea	ax, [bp+var_3B8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_3B8]
		push	ax
		push	large 730032h
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah

loc_C9F6B:
		mov	[bp+var_54], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	0
		push	[bp+var_44]
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	sub_76259
		add	sp, 8
		mov	[bp+var_4], 3E8h
		mov	eax, dword_7B29D
		mov	[bp+var_8], eax
		push	large 0
		mov	al, [bp+var_18]
		push	ax
		push	large [bp+var_1C]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		cmp	word_79D77, 0
		jnz	short loc_C9FF8
		jmp	short loc_C9FEF

loc_C9FCC:
		call	sub_7575F
		or	al, al
		jnz	short loc_C9FF8
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		cmp	eax, dword_7B29D
		ja	short loc_C9FE9
		mov	ax, 1
		jmp	short loc_C9FEB

loc_C9FE9:
		xor	ax, ax

loc_C9FEB:
		or	al, al
		jnz	short loc_C9FF8

loc_C9FEF:
		call	sub_5EE45
		or	al, al
		jnz	short loc_C9FCC

loc_C9FF8:
		lea	ax, [bp+var_34E]
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	[bp+var_55], 0
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74CC6
		pop	cx
		push	6
		call	Music_SetPendingTune_5ED30
		pop	cx
		mov	[bp+var_4], 7D0h
		mov	eax, dword_7B29D
		mov	[bp+var_8], eax
		mov	ax, 0C00h
		int	21h
		jmp	short loc_CA0B0

loc_CA038:
		call	sub_75755
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		cmp	eax, dword_7B29D
		ja	short loc_CA051
		mov	ax, 1
		jmp	short loc_CA053

loc_CA051:
		xor	ax, ax

loc_CA053:
		or	al, al
		jz	short loc_CA065
		mov	[bp+var_55], 1
		mov	byte_7D13E, 0
		mov	byte_7A178, 0

loc_CA065:
		push	large 1
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_58], ax
		cmp	[bp+var_58], 0
		jz	short loc_CA0B0
		cmp	word ptr [bp+var_2D5], 0
		jnz	short loc_CA08C
		cmp	word ptr [bp+var_2D5+2], 0
		jz	short loc_CA0B0

loc_CA08C:
		push	large [bp+var_2D5]
		mov	ax, [bp+var_2D7]
		sub	ax, [bp+var_33A]
		push	ax
		mov	ax, [bp+var_2D9]
		sub	ax, [bp+var_33C]
		push	ax
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_CA0B0:
		cmp	[bp+var_46], 6
		jnz	short loc_CA0C2
		mov	al, [bp+var_55]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CA0C2
		jmp	loc_CA038

loc_CA0C2:
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74CEE
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		cmp	[bp+var_46], 2
		jz	short loc_CA0E6
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_CA0E6:
		cmp	[bp+var_46], 5
		jnz	short loc_CA113
		push	large 0
		mov	al, [bp+var_18]
		push	ax
		push	large [bp+var_1C]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch

loc_CA113:
		mov	al, byte ptr [bp+var_46]
		mov	[bp+var_56], al
		lea	ax, [bp+var_44]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_39], 0
		jz	short loc_CA147
		cmp	[bp+var_3E], 0
		jz	short loc_CA147
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CA147

loc_CA147:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		lea	ax, [bp+var_366]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_34E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_340]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CC]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_CA1B3
		cmp	[bp+var_30], 0
		jz	short loc_CA1B3
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CA1B3

loc_CA1B3:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_CA1EB
		cmp	[bp+var_26], 0
		jz	short loc_CA1EB
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CA1EB

loc_CA1EB:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_CA223
		cmp	[bp+var_1C], 0
		jz	short loc_CA223
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CA223

loc_CA223:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_2B4]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1EC]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_12]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_56]
		pop	di
		pop	si
		leave
		retf
sub_C9750		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_CA266		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CA28B
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_CA28B
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_CA28B

loc_CA28B:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_CA266		endp
ovr362		ends
