ovr394		segment	para public 'OVERLAY' use16
		assume cs:ovr394
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFE10		proc far

var_2F4		= word ptr -2F4h
var_A8		= word ptr -0A8h
var_75		= word ptr -75h
var_69		= word ptr -69h
var_64		= word ptr -64h
var_5C		= byte ptr -5Ch
var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2F4h
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_5A]
		push	ax
		push	large 4E4C5046h
		call	sub_75910
		add	sp, 6
		mov	bx, di
		cmp	bx, 19h
		jbe	short loc_DFE38
		jmp	loc_DFF2F

loc_DFE38:
		shl	bx, 1
		jmp	cs:off_DFF3C[bx]	; switch jump

loc_DFE3F:
		lea	ax, [bp+var_2F4]
		push	ax
		call	sub_7594F
		pop	cx
		mov	bx, [bp+var_69]
		shl	bx, 1
		lea	ax, [bp+var_75]
		add	bx, ax
		inc	word ptr [bx]
		mov	bx, [bp+var_69]
		shl	bx, 1
		add	bx, ax
		cmp	word ptr [bx], 4
		jle	short loc_DFE6F
		mov	bx, [bp+var_69]
		shl	bx, 1
		add	bx, ax
		mov	word ptr [bx], 4
		jmp	short loc_DFE6F

loc_DFE6F:
		mov	[bp+var_A8], di
		push	seg seg008
		push	offset loc_615A
		lea	ax, [bp+var_A]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	8
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_5C], 0
		push	1
		push	1
		mov	ax, di
		shl	ax, 3
		lea	dx, [bp+var_5A]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_2F4]
		push	ax
		call	sub_7596D
		add	sp, 8
		jmp	short loc_DFF2F

loc_DFEB9:
		push	0
		call	sub_760D5
		pop	cx
		mov	si, ax
		mov	bx, [si+28Bh]
		shl	bx, 1
		inc	word ptr [bx+si+27Fh]
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+27Fh], 4
		jle	short loc_DFEE8
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	word ptr [bx+si+27Fh], 4
		jmp	short loc_DFEE8

loc_DFEE8:
		push	seg seg008
		push	offset loc_6162
		lea	ax, [bp+var_A]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	8
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, si
		add	ax, 290h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+298h], 0
		mov	[si+24Ch], di
		mov	word ptr [si+28Eh], 0
		push	0
		push	si
		call	sub_760DF
		add	sp, 4
		push	si
		call	sub_3B2
		pop	cx

loc_DFF2F:
		mov	bx, word_7D14D
		mov	byte ptr [bx+4ECh], 0
		pop	di
		pop	si
		leave
		retf
sub_DFE10		endp

; START OF FUNCTION CHUNK FOR sub_DFE10
off_DFF3C	dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFE3F
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
		dw offset loc_DFEB9
; END OF FUNCTION CHUNK FOR sub_DFE10

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFF70		proc far

var_2DC		= word ptr -2DCh
var_2DA		= word ptr -2DAh
var_2C2		= word ptr -2C2h
var_2B2		= word ptr -2B2h
var_2B0		= word ptr -2B0h
var_2AE		= word ptr -2AEh
var_2AA		= word ptr -2AAh
var_232		= word ptr -232h
var_1E2		= word ptr -1E2h
var_16A		= word ptr -16Ah
var_11A		= word ptr -11Ah
var_118		= word ptr -118h
var_116		= word ptr -116h
var_114		= word ptr -114h
var_112		= word ptr -112h
var_110		= word ptr -110h
var_10C		= word ptr -10Ch
var_108		= word ptr -108h
var_106		= word ptr -106h
var_BB		= dword ptr -0BBh
var_B7		= byte ptr -0B7h
var_B6		= byte ptr -0B6h
var_B5		= dword ptr -0B5h
var_B1		= word ptr -0B1h
var_A5		= word ptr -0A5h
var_A3		= word ptr -0A3h
var_A1		= dword ptr -0A1h
var_98		= word ptr -98h
var_48		= word ptr -48h
var_46		= word ptr -46h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_19		= word ptr -19h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2DCh
		push	si
		push	di
		mov	[bp+var_2], 6
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 560088h
		push	large 230058h
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_11A], 0
		mov	[bp+var_118], 0
		mov	[bp+var_116], 0
		mov	[bp+var_114], 0
		mov	[bp+var_112], 30h
		mov	[bp+var_110], 33h
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
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
		lea	ax, [bp+var_16A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_16A]
		push	ax
		lea	ax, [bp+var_1E2]
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
		lea	ax, [bp+var_232]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_232]
		push	ax
		lea	ax, [bp+var_2AA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	13h
		lea	ax, [bp+var_2AA]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	8Bh
		lea	ax, [bp+var_1E2]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_1C], 0
		mov	[bp+var_19], 0
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_76281
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_76259
		add	sp, 8
		push	seg seg008
		push	offset loc_60EB
		lea	ax, [bp+var_98]
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
		lea	ax, [bp+var_98]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_2A+2], dx
		mov	word ptr [bp+var_2A], ax
		mov	eax, [bp+var_2A]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 2
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_2C2]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_2B2], 1
		mov	[bp+var_2B0], 0
		push	2Dh
		lea	ax, [bp+var_2C2]
		push	ax
		mov	bx, [bp+var_2C2]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_2AE], ax
		lea	ax, [bp+var_2C2]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_2DC]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	eax, [bp+var_16]
		mov	[bp+var_2E], eax
		mov	al, [bp+var_12]
		mov	[bp+var_2F], al
		mov	eax, [bp+var_2E]
		mov	[bp+var_BB], eax
		mov	al, [bp+var_2F]
		mov	[bp+var_B7], al
		mov	[bp+var_B6], 0
		mov	[bp+var_B5], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_B5], eax
		mov	[bp+var_B1], 0
		push	0Fh
		push	large 1400BDh
		push	large 14000Ah
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		push	16h
		lea	ax, [bp+var_2]
		mov	word ptr [bp+var_34+2], ss
		mov	word ptr [bp+var_34], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_E022A
		jmp	loc_E02B6

loc_E022A:
		push	large 190032h
		push	large 220047h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3CF1h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_38], eax
		mov	al, [bp+var_12]
		mov	[bp+var_39], al
		mov	eax, [bp+var_38]
		mov	[si+1Eh], eax
		mov	al, [bp+var_39]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_10]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 2
		mov	word ptr [si+0Eh], 41B8h
		mov	eax, [bp+var_34]
		mov	[si+2Ah], eax
		mov	word ptr [si+2Eh], 1
		mov	word ptr [si+30h], 1
		mov	word ptr [si+32h], 0A3h
		mov	word ptr [si+34h], 45h
		mov	ax, si
		jmp	short loc_E02B8

loc_E02B6:
		mov	ax, si

loc_E02B8:
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	24h
		lea	ax, [bp+var_2]
		mov	word ptr [bp+var_3E+2], ss
		mov	word ptr [bp+var_3E], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_E02E2
		jmp	loc_E036E

loc_E02E2:
		push	large 190032h
		push	large 220020h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_42], eax
		mov	al, [bp+var_12]
		mov	[bp+var_43], al
		mov	eax, [bp+var_42]
		mov	[di+1Eh], eax
		mov	al, [bp+var_43]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	eax, [bp+var_3E]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 2
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 71h
		mov	word ptr [di+34h], 45h
		mov	ax, di
		jmp	short loc_E0370

loc_E036E:
		mov	ax, di

loc_E0370:
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 10024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_46], ax
		or	ax, ax
		jz	short loc_E03C1
		push	large 140064h
		push	large 4C002Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 3
		mov	ax, [bp+var_46]
		jmp	short loc_E03C4

loc_E03C1:
		mov	ax, [bp+var_46]

loc_E03C4:
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74C8A
		add	sp, 6
		lea	ax, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CC6
		pop	cx
		mov	ax, 0C00h
		int	21h
		jmp	short loc_E044B

loc_E03FB:
		call	sub_75755
		push	large 1
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_48], ax
		cmp	[bp+var_48], 0
		jz	short loc_E044B
		cmp	word ptr [bp+var_A1], 0
		jnz	short loc_E0427
		cmp	word ptr [bp+var_A1+2], 0
		jz	short loc_E044B

loc_E0427:
		push	large [bp+var_A1]
		mov	ax, [bp+var_A3]
		sub	ax, [bp+var_106]
		push	ax
		mov	ax, [bp+var_A5]
		sub	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_E044B:
		cmp	[bp+var_2], 6
		jz	short loc_E03FB
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CEE
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		cmp	[bp+var_2], 1
		jz	short loc_E0478
		jmp	loc_E0581

loc_E0478:
		lea	ax, [bp+var_2DA]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_2C2]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_E04B6
		cmp	[bp+var_26], 0
		jz	short loc_E04B6
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E04B6

loc_E04B6:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_11], 0
		jz	short loc_E04F8
		cmp	[bp+var_16], 0
		jz	short loc_E04F8
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E04F8

loc_E04F8:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_E0530
		cmp	[bp+var_C], 0
		jz	short loc_E0530
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E0530

loc_E0530:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_2AA]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_11A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CA8
		add	sp, 4
		mov	al, 1
		jmp	loc_E0799

loc_E0581:
		cmp	[bp+var_2], 2
		jz	short loc_E058A
		jmp	loc_E0693

loc_E058A:
		lea	ax, [bp+var_2DA]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_2C2]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_E05C8
		cmp	[bp+var_26], 0
		jz	short loc_E05C8
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E05C8

loc_E05C8:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_11], 0
		jz	short loc_E060A
		cmp	[bp+var_16], 0
		jz	short loc_E060A
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E060A

loc_E060A:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_E0642
		cmp	[bp+var_C], 0
		jz	short loc_E0642
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E0642

loc_E0642:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_2AA]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_11A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CA8
		add	sp, 4
		mov	al, 2
		jmp	loc_E0799

loc_E0693:
		lea	ax, [bp+var_2DA]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_2C2]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_E06D1
		cmp	[bp+var_26], 0
		jz	short loc_E06D1
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E06D1

loc_E06D1:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_11], 0
		jz	short loc_E0713
		cmp	[bp+var_16], 0
		jz	short loc_E0713
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E0713

loc_E0713:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_E074B
		cmp	[bp+var_C], 0
		jz	short loc_E074B
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E074B

loc_E074B:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_2AA]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_11A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		call	sub_74CA8
		add	sp, 4
		mov	al, 0

loc_E0799:
		pop	di
		pop	si
		leave
		retf
sub_DFF70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E079D		proc far

var_606		= word ptr -606h
var_5B6		= word ptr -5B6h
var_566		= word ptr -566h
var_564		= word ptr -564h
var_54C		= word ptr -54Ch
var_53C		= word ptr -53Ch
var_53A		= word ptr -53Ah
var_538		= word ptr -538h
var_534		= word ptr -534h
var_4BC		= word ptr -4BCh
var_4BA		= word ptr -4BAh
var_4B8		= word ptr -4B8h
var_4B6		= word ptr -4B6h
var_4B4		= word ptr -4B4h
var_4B2		= word ptr -4B2h
var_4AE		= word ptr -4AEh
var_4AA		= word ptr -4AAh
var_4A8		= word ptr -4A8h
var_447		= word ptr -447h
var_445		= word ptr -445h
var_443		= dword ptr -443h
var_43A		= word ptr -43Ah
var_3C2		= word ptr -3C2h
var_372		= word ptr -372h
var_2FA		= dword ptr -2FAh
var_2F6		= byte ptr -2F6h
var_2F4		= dword ptr -2F4h
var_2F0		= dword ptr -2F0h
var_2EC		= byte ptr -2ECh
var_2EA		= dword ptr -2EAh
var_2E6		= word ptr -2E6h
var_21E		= word ptr -21Eh
var_F2		= word ptr -0F2h
var_A2		= word ptr -0A2h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4D		= byte ptr -4Dh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_13		= word ptr -13h
var_10		= dword ptr -10h
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 606h
		push	si
		push	di
		mov	[bp+var_2], 6
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	bx, [bp+arg_0]
		mov	word ptr [bx], 0
		lea	ax, [bp+var_2E6]
		push	ax
		push	large 4E414C50h
		call	sub_75910
		add	sp, 6
		lea	ax, [bp+var_21E]
		push	ax
		push	large 4E4C504Ah
		call	sub_75910
		add	sp, 6
		push	seg stub253
		push	offset sub_735A5
		push	large 10002h
		push	0Ah
		lea	ax, word ptr [bp+var_2FA]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_616B
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_372]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_6], 0
		jmp	short loc_E087C

loc_E085A:
		push	2
		mov	ax, [bp+var_6]
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_2FA]
		add	ax, dx
		push	ax
		push	[bp+var_6]
		lea	ax, [bp+var_372]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	[bp+var_6]

loc_E087C:
		cmp	[bp+var_6], 2
		jl	short loc_E085A
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
		lea	ax, [bp+var_3C2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_3C2]
		push	ax
		lea	ax, [bp+var_43A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_10], 0
		mov	[bp+var_C], 2
		mov	[bp+var_B], 0
		mov	[bp+var_A], 0
		push	2
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	11h
		lea	ax, [bp+var_43A]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_16], 0
		mov	[bp+var_13], 0
		lea	ax, word ptr [bp+var_10]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_76281
		add	sp, 4
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_76259
		add	sp, 8
		push	large 0A90103h
		push	large 1E003Ch
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_4BC], 0
		mov	[bp+var_4BA], 0
		mov	[bp+var_4B8], 0
		mov	[bp+var_4B6], 0
		mov	[bp+var_4B4], 0C7h
		mov	[bp+var_4B2], 8Bh
		push	0
		lea	ax, [bp+var_4BC]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
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
		lea	ax, [bp+var_F2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_534]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	seg seg008
		push	offset loc_60EB
		lea	ax, [bp+var_A2]
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
		lea	ax, [bp+var_A2]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 1
		mov	[bp+var_1A], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_54C]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_53C], 1
		mov	[bp+var_53A], 0
		push	2Dh
		lea	ax, [bp+var_54C]
		push	ax
		mov	bx, [bp+var_54C]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_538], ax
		lea	ax, [bp+var_54C]
		push	ax
		lea	ax, [bp+var_4BC]
		push	ax
		lea	ax, [bp+var_566]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	2
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	56h
		lea	ax, [bp+var_534]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, [bp+var_2]
		mov	word ptr [bp+var_34+2], ss
		mov	word ptr [bp+var_34], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_E0AC7
		jmp	loc_E0B56

loc_E0AC7:
		push	large 0A000Fh
		push	large 2A005Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3CF1h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_2F0]
		mov	[bp+var_38], eax
		mov	al, [bp+var_2EC]
		mov	[bp+var_39], al
		mov	eax, [bp+var_38]
		mov	[si+1Eh], eax
		mov	al, [bp+var_39]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_2EA]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 0
		mov	word ptr [si+0Eh], 41B8h
		mov	eax, [bp+var_34]
		mov	[si+2Ah], eax
		mov	word ptr [si+2Eh], 0Ah
		mov	word ptr [si+30h], 1
		mov	word ptr [si+32h], 96h
		mov	word ptr [si+34h], 48h
		mov	ax, si
		jmp	short loc_E0B58

loc_E0B56:
		mov	ax, si

loc_E0B58:
		mov	[bp+var_30], ax
		lea	ax, [bp+var_2]
		mov	word ptr [bp+var_40+2], ss
		mov	word ptr [bp+var_40], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_E0B75
		jmp	loc_E0C04

loc_E0B75:
		push	large 0A000Fh
		push	large 58005Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_2FA]
		mov	[bp+var_44], eax
		mov	al, [bp+var_2F6]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[di+1Eh], eax
		mov	al, [bp+var_45]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_2F4]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	eax, [bp+var_40]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 9
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 96h
		mov	word ptr [di+34h], 76h
		mov	ax, di
		jmp	short loc_E0C06

loc_E0C04:
		mov	ax, di

loc_E0C06:
		mov	[bp+var_3C], ax
		push	5Bh
		push	[bp+var_30]
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	63h
		push	[bp+var_3C]
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 1C0024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_48], ax
		or	ax, ax
		jz	short loc_E0C70
		push	large 0A000Ah
		push	large 3B002Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_48]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 63h
		mov	ax, [bp+var_48]
		jmp	short loc_E0C73

loc_E0C70:
		mov	ax, [bp+var_48]

loc_E0C73:
		push	ax
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 10024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_4A], ax
		or	ax, ax
		jz	short loc_E0CC4
		push	large 140064h
		push	large 710096h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 8
		mov	ax, [bp+var_4A]
		jmp	short loc_E0CC7

loc_E0CC4:
		mov	ax, [bp+var_4A]

loc_E0CC7:
		push	ax
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 190024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_4C], ax
		or	ax, ax
		jz	short loc_E0D18
		push	large 140050h
		push	large 760010h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_4C]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 63h
		mov	ax, [bp+var_4C]
		jmp	short loc_E0D1B

loc_E0D18:
		mov	ax, [bp+var_4C]

loc_E0D1B:
		push	ax
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74C8A
		add	sp, 6
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74CC6
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		jmp	loc_E0F7B

loc_E0D41:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	seg seg008
		push	offset loc_60F1
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_6174
		lea	ax, [bp+var_5B6]
		push	ax
		call	sub_54BE
		add	sp, 6
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
		lea	ax, [bp+var_4BC]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	0Fh
		push	large 1400BDh
		push	large 14000Ah
		lea	ax, [bp+var_4BC]
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_617D
		lea	ax, [bp+var_606]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_606]
		push	ax
		push	large 0A0037h
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_566]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [bp+arg_0]
		mov	ax, [bx]
		imul	ax, ax, 14h
		lea	dx, [bp+var_2E6]
		add	ax, dx
		push	ax
		push	large 20040h
		push	33h
		lea	ax, [bp+var_5B6]
		push	ax
		lea	ax, [bp+var_566]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_618A
		lea	ax, [bp+var_606]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_606]
		push	ax
		push	large 40076h
		push	10h
		lea	ax, [bp+var_5B6]
		push	ax
		lea	ax, [bp+var_566]
		push	ax
		call	sub_75D4A
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_618F
		lea	ax, [bp+var_606]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_606]
		push	ax
		push	large 76009Bh
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_566]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_4BC]
		push	ax
		lea	ax, [bp+var_4AE]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	bx, [bp+arg_0]
		cmp	word ptr [bx], 17h
		jnz	short loc_E0E92
		push	[bp+var_3C]
		mov	bx, [bp+var_3C]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		jmp	short loc_E0E9D

loc_E0E92:
		push	[bp+var_3C]
		mov	bx, [bp+var_3C]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]

loc_E0E9D:
		pop	cx
		mov	bx, [bp+arg_0]
		cmp	word ptr [bx], 0
		jnz	short loc_E0EB4
		push	[bp+var_30]
		mov	bx, [bp+var_30]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		jmp	short loc_E0EBF

loc_E0EB4:
		push	[bp+var_30]
		mov	bx, [bp+var_30]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]

loc_E0EBF:
		pop	cx
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74CD5
		pop	cx
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		mov	ax, 0C00h
		int	21h
		jmp	short loc_E0F27

loc_E0ED7:
		call	sub_75755
		push	large 1
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_52], ax
		cmp	[bp+var_52], 0
		jz	short loc_E0F27
		cmp	word ptr [bp+var_443], 0
		jnz	short loc_E0F03
		cmp	word ptr [bp+var_443+2], 0
		jz	short loc_E0F27

loc_E0F03:
		push	large [bp+var_443]
		mov	ax, [bp+var_445]
		sub	ax, [bp+var_4A8]
		push	ax
		mov	ax, [bp+var_447]
		sub	ax, [bp+var_4AA]
		push	ax
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_E0F27:
		cmp	[bp+var_2], 6
		jz	short loc_E0ED7
		mov	ax, [bp+var_2]
		mov	[bp+var_50], ax
		mov	cx, 4
		mov	bx, offset word_E10DB

loc_E0F39:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_50]
		jz	short loc_E0F48
		add	bx, 2
		loop	short loc_E0F39
		jmp	short loc_E0F76

loc_E0F48:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_E0F4C:
		mov	[bp+var_4], 1
		jmp	short loc_E0F72

loc_E0F52:
		mov	bx, [bp+arg_0]
		inc	word ptr [bx]
		cmp	word ptr [bx], 17h
		jle	short loc_E0F76
		mov	word ptr [bx], 17h
		jmp	short loc_E0F76

loc_E0F62:
		mov	bx, [bp+arg_0]
		dec	word ptr [bx]
		cmp	word ptr [bx], 0
		jge	short loc_E0F76
		mov	word ptr [bx], 0
		jmp	short loc_E0F76

loc_E0F72:
		mov	[bp+var_3], 1

loc_E0F76:
		mov	[bp+var_2], 6

loc_E0F7B:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E0F87
		jmp	loc_E0D41

loc_E0F87:
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74CEE
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	al, [bp+var_4]
		mov	[bp+var_4D], al
		cmp	[bp+var_29], 0
		jz	short loc_E0FCA
		cmp	[bp+var_2E], 0
		jz	short loc_E0FCA
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E0FCA

loc_E0FCA:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_564]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_54C]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_1B], 0
		jz	short loc_E101C
		cmp	[bp+var_20], 0
		jz	short loc_E101C
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E101C

loc_E101C:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	2
		lea	ax, [bp+var_534]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_4BC]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_4AE]
		push	ax
		call	sub_74CA8
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_B], 0
		jz	short loc_E1087
		cmp	[bp+var_10], 0
		jz	short loc_E1087
		push	0
		mov	al, [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E1087

loc_E1087:
		mov	[bp+var_10], 0
		mov	[bp+var_B], 0
		mov	[bp+var_A], 0
		push	2
		lea	ax, [bp+var_43A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_372]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	seg stub253
		push	offset sub_735A0
		push	large 10002h
		push	0Ah
		lea	ax, word ptr [bp+var_2FA]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	al, [bp+var_4D]
		pop	di
		pop	si
		leave
		retf
sub_E079D		endp

; START OF FUNCTION CHUNK FOR sub_E079D
word_E10DB	dw 8
		dw 9
		dw 0Ah
		dw 63h
off_E10E3	dw offset loc_E0F72
		dw offset loc_E0F52
		dw offset loc_E0F62
		dw offset loc_E0F4C
; END OF FUNCTION CHUNK FOR sub_E079D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E10EB		proc far

var_2A8		= word ptr -2A8h
var_298		= word ptr -298h
var_296		= word ptr -296h
var_294		= word ptr -294h
var_290		= word ptr -290h
var_218		= word ptr -218h
var_1C8		= word ptr -1C8h
var_150		= word ptr -150h
var_100		= word ptr -100h
var_FC		= word ptr -0FCh
var_FA		= word ptr -0FAh
var_AF		= dword ptr -0AFh
var_AB		= byte ptr -0ABh
var_AA		= byte ptr -0AAh
var_A9		= dword ptr -0A9h
var_A5		= word ptr -0A5h
var_99		= word ptr -99h
var_97		= word ptr -97h
var_95		= dword ptr -95h
var_8C		= word ptr -8Ch
var_3C		= word ptr -3Ch
var_39		= byte ptr -39h
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_1B		= word ptr -1Bh
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2A8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 6
		mov	[bp+var_3], 0
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
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
		lea	ax, [bp+var_150]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_150]
		push	ax
		lea	ax, [bp+var_1C8]
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
		push	89h
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_75B60
		add	sp, 8
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
		lea	ax, [bp+var_218]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_218]
		push	ax
		lea	ax, [bp+var_290]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_18], 0
		mov	[bp+var_14], 2
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	13h
		lea	ax, [bp+var_290]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_1E], 0
		mov	[bp+var_1B], 0
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76281
		add	sp, 4
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_1E]
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76259
		add	sp, 8
		push	seg seg008
		push	offset loc_60EB
		lea	ax, [bp+var_8C]
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
		lea	ax, [bp+var_8C]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_150]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_150]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 2
		mov	[bp+var_23], 1
		mov	[bp+var_22], 0
		lea	ax, word ptr [bp+var_28]
		push	ax
		lea	ax, [bp+var_2A8]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_298], 1
		mov	[bp+var_296], 0
		push	2Dh
		lea	ax, [bp+var_2A8]
		push	ax
		mov	bx, [bp+var_2A8]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_294], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_30], eax
		mov	al, [bp+var_A]
		mov	[bp+var_31], al
		mov	eax, [bp+var_30]
		mov	[bp+var_AF], eax
		mov	al, [bp+var_31]
		mov	[bp+var_AB], al
		mov	[bp+var_AA], 0
		mov	[bp+var_A9], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_A9], eax
		mov	[bp+var_A5], 0
		push	large 220024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_E1366
		push	large 0B5005Ch
		push	large 700D7h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[di+20h], ds
		mov	[di+1Eh], ax
		mov	word ptr [di+22h], 0
		mov	ax, di
		jmp	short loc_E1368

loc_E1366:
		mov	ax, di

loc_E1368:
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 260024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_34], ax
		or	ax, ax
		jz	short loc_E13B9
		push	large 0B5005Dh
		push	large 7000Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_34]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 4
		mov	ax, [bp+var_34]
		jmp	short loc_E13BC

loc_E13B9:
		mov	ax, [bp+var_34]

loc_E13BC:
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 1F0024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_36], ax
		or	ax, ax
		jz	short loc_E140D
		push	large 0B5005Ah
		push	large 70072h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_36]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 5
		mov	ax, [bp+var_36]
		jmp	short loc_E1410

loc_E140D:
		mov	ax, [bp+var_36]

loc_E1410:
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	large 10024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_38], ax
		or	ax, ax
		jz	short loc_E1461
		push	large 0C7013Fh
		push	large 0C30000h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	bx, [bp+var_38]
		mov	word ptr [bx+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[bx+20h], ds
		mov	[bx+1Eh], ax
		mov	word ptr [bx+22h], 3
		mov	ax, [bp+var_38]
		jmp	short loc_E1464

loc_E1461:
		mov	ax, [bp+var_38]

loc_E1464:
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74C8A
		add	sp, 6
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74CC6
		pop	cx
		mov	ax, 0C00h
		int	21h
		jmp	short loc_E14D4

loc_E1484:
		call	sub_75755
		push	large 1
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_3C], ax
		cmp	[bp+var_3C], 0
		jz	short loc_E14D4
		cmp	word ptr [bp+var_95], 0
		jnz	short loc_E14B0
		cmp	word ptr [bp+var_95+2], 0
		jz	short loc_E14D4

loc_E14B0:
		push	large [bp+var_95]
		mov	ax, [bp+var_97]
		sub	ax, [bp+var_FA]
		push	ax
		mov	ax, [bp+var_99]
		sub	ax, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_E14D4:
		cmp	[bp+var_2], 6
		jz	short loc_E1484
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74CEE
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	ax, [bp+var_2]
		or	ax, ax
		jz	short loc_E14FE
		cmp	ax, 4
		jz	short loc_E1528
		cmp	ax, 5
		jz	short loc_E1559
		jmp	loc_E1599

loc_E14FE:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		lea	ax, [bp+var_3C]
		push	ax
		push	cs
		call	near ptr sub_E079D
		pop	cx
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_E1599
		push	[bp+var_3C]
		push	cs
		call	near ptr sub_DFE10
		pop	cx
		jmp	short loc_E1599

loc_E1528:
		push	cs
		call	near ptr sub_DFF70
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_E153A
		cmp	ax, 2
		jz	short loc_E1551
		jmp	short loc_E1599

loc_E153A:
		push	seg seg008
		push	offset loc_6194

loc_E1540:
		lea	ax, [bp+var_8C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	1
		jmp	short loc_E1588

loc_E1551:
		push	seg seg008
		push	offset loc_619D
		jmp	short loc_E1540

loc_E1559:
		push	cs
		call	near ptr sub_DFF70
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_E156B
		cmp	ax, 2
		jz	short loc_E1573
		jmp	short loc_E1599

loc_E156B:
		push	seg seg008
		push	offset loc_61A5
		jmp	short loc_E1579

loc_E1573:
		push	seg seg008
		push	offset loc_61AE

loc_E1579:
		lea	ax, [bp+var_8C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	2

loc_E1588:
		lea	ax, [bp+var_8C]
		push	ax
		push	si
		call	sub_760D0
		add	sp, 6
		mov	[bp+var_3], al

loc_E1599:
		mov	al, [bp+var_3]
		mov	[bp+var_39], al
		push	2
		lea	ax, [bp+var_2A8]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_E15D2
		cmp	[bp+var_28], 0
		jz	short loc_E15D2
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E15D2

loc_E15D2:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_13], 0
		jz	short loc_E1614
		cmp	[bp+var_18], 0
		jz	short loc_E1614
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E1614

loc_E1614:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		push	2
		lea	ax, [bp+var_290]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_E165B
		cmp	[bp+var_E], 0
		jz	short loc_E165B
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E165B

loc_E165B:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, [bp+var_1C8]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_100]
		push	ax
		call	sub_74CA8
		add	sp, 4
		mov	al, [bp+var_39]
		pop	di
		pop	si
		leave
		retf
sub_E10EB		endp
ovr394		ends
