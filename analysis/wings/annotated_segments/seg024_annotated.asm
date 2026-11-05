seg024		segment	para public 'CODE' use16
		assume cs:seg024
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E4D2		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	16h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_E4F4
		jmp	loc_E5BA

loc_E4F4:
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 1252h
		mov	dword ptr [di+4], 0
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 0
		mov	dword ptr [di+0Ah], 0
		add	ax, 0Eh
		push	ds
		push	ax
		push	ds
		push	[bp+var_4]
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	ax, [di+12h]
		sub	ax, [di+0Eh]
		inc	ax
		mov	dx, [di+14h]
		sub	dx, [di+10h]
		inc	dx
		imul	dx
		movsx	eax, ax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[di+4], eax
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_C]
		mov	[di+0Ah], eax
		mov	ax, di
		add	ax, 0Eh
		push	ax
		cmp	byte ptr [di+8], 3
		jnz	short loc_E5A2
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_E5A8

loc_E5A2:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_E5A8:
		push	dx
		push	ax
		push	word_5DD42
		call	sub_4AB4C
		add	sp, 8
		mov	ax, di
		jmp	short loc_E5BC

loc_E5BA:
		mov	ax, di

loc_E5BC:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	sub_485FB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_E4D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5CD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+2]
		or	di, di
		jz	short loc_E621
		mov	ax, di
		add	ax, 0Eh
		push	ax
		cmp	byte ptr [di+8], 3
		jnz	short loc_E5FF
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_E605

loc_E5FF:
		mov	dx, [di+6]
		mov	ax, [di+4]

loc_E605:
		push	dx
		push	ax
		push	word_5DD42
		call	sub_4A530
		add	sp, 8
		push	0
		push	word ptr [si+2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_E621:
		pop	di
		pop	si
		pop	bp
		retf
sub_E5CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E625		proc far

var_1BE		= word ptr -1BEh
var_1BA		= word ptr -1BAh
var_1B8		= word ptr -1B8h
var_16E		= dword ptr -16Eh
var_16A		= byte ptr -16Ah
var_169		= byte ptr -169h
var_168		= dword ptr -168h
var_164		= word ptr -164h
var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= dword ptr -154h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= word ptr -14Ch
var_13C		= word ptr -13Ch
var_13A		= word ptr -13Ah
var_138		= word ptr -138h
var_134		= word ptr -134h
var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_D6		= word ptr -0D6h
var_D5		= dword ptr -0D5h
var_D1		= dword ptr -0D1h
var_CD		= byte ptr -0CDh
var_CC		= dword ptr -0CCh
var_C7		= byte ptr -0C7h
var_C6		= dword ptr -0C6h
var_C1		= byte ptr -0C1h
var_C0		= dword ptr -0C0h
var_BB		= byte ptr -0BBh
var_BA		= dword ptr -0BAh
var_B5		= byte ptr -0B5h
var_B4		= dword ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= dword ptr -0ACh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A1		= byte ptr -0A1h
var_A0		= dword ptr -0A0h
var_9B		= byte ptr -9Bh
var_9A		= dword ptr -9Ah
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_8F		= byte ptr -8Fh
var_8E		= dword ptr -8Eh
var_89		= byte ptr -89h
var_88		= dword ptr -88h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7B		= byte ptr -7Bh
var_7A		= byte ptr -7Ah
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= byte ptr -70h
var_6F		= byte ptr -6Fh
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= byte ptr -48h
var_47		= byte ptr -47h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= byte ptr -3Eh
var_3D		= byte ptr -3Dh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_21		= word ptr -21h
var_1E		= word ptr -1Eh
var_1B		= word ptr -1Bh
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1BEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_E4], 0
		mov	[bp+var_E2], 0
		mov	[bp+var_E0], 0
		mov	[bp+var_DE], 0
		mov	[bp+var_DC], 13Fh
		mov	[bp+var_DA], 0C7h
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	sub_469A5
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD42
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_18], 0
		mov	[bp+var_14], 2
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	30h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_1B], 0
		lea	ax, word ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_46A98
		add	sp, 4
		mov	[bp+var_21], 0
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	sub_46A98
		add	sp, 4
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	2Fh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	3
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	1Ah
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_42], 0
		mov	[bp+var_3E], 2
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_4C], 0
		mov	[bp+var_48], 2
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		mov	[bp+var_60], 0
		mov	[bp+var_5C], 2
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		mov	[bp+var_6A], 0
		mov	[bp+var_66], 2
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	17h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	18h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	28h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	20h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	23h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_74], 0
		mov	[bp+var_70], 2
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aBwfont
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_134]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_134]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_78+2], dx
		mov	word ptr [bp+var_78], ax
		mov	eax, [bp+var_78]
		mov	[bp+var_74], eax
		mov	[bp+var_70], 2
		mov	[bp+var_6F], 1
		mov	[bp+var_6E], 0
		lea	ax, word ptr [bp+var_74]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_13C], 1
		mov	[bp+var_13A], 0
		mov	[bp+var_138], 3
		lea	ax, [bp+var_14C]
		push	ax
		push	word_5DD42
		call	PaletteScreen_ConstructAndBindWidget_231BC
		add	sp, 4
		mov	word ptr [si+0A0h], 0
		mov	[bp+var_7A], 0
		mov	word ptr [si+2], 0

loc_E8F3:
		mov	dword ptr [si+82h], 0
		push	2FDh
		call	sub_A4F0
		pop	cx
		push	large 0C80140h
		push	large 0
		lea	ax, [bp+var_1BE]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_150], 0
		mov	[bp+var_14E], 1
		mov	eax, [bp+var_38]
		mov	[bp+var_80], eax
		mov	al, [bp+var_34]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[bp+var_16E], eax
		mov	al, [bp+var_81]
		mov	[bp+var_16A], al
		mov	[bp+var_169], 0
		mov	[bp+var_168], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_168], eax
		mov	[bp+var_164], 0
		mov	[bp+var_84], 0
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_E97C
		jmp	loc_EA06

loc_E97C:
		push	large 0E0075h
		push	large 3C0066h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_88], eax
		mov	al, [bp+var_3E]
		mov	[bp+var_89], al
		mov	eax, [bp+var_88]
		mov	[di+1Eh], eax
		mov	al, [bp+var_89]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_3C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_EA08

loc_EA06:
		mov	ax, di

loc_EA08:
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_EA28
		jmp	loc_EAB2

loc_EA28:
		push	large 0E0075h
		push	large 4F0066h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_4C]
		mov	[bp+var_8E], eax
		mov	al, [bp+var_48]
		mov	[bp+var_8F], al
		mov	eax, [bp+var_8E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_46]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_EAB4

loc_EAB2:
		mov	ax, di

loc_EAB4:
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_EAD4
		jmp	loc_EB5E

loc_EAD4:
		push	large 0E0075h
		push	large 610066h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_56]
		mov	[bp+var_94], eax
		mov	al, [bp+var_52]
		mov	[bp+var_95], al
		mov	eax, [bp+var_94]
		mov	[di+1Eh], eax
		mov	al, [bp+var_95]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_50]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 3
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_EB60

loc_EB5E:
		mov	ax, di

loc_EB60:
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_EB80
		jmp	loc_EC0A

loc_EB80:
		push	large 0E0075h
		push	large 740066h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_60]
		mov	[bp+var_9A], eax
		mov	al, [bp+var_5C]
		mov	[bp+var_9B], al
		mov	eax, [bp+var_9A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_9B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_5A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_EC0C

loc_EC0A:
		mov	ax, di

loc_EC0C:
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_EC2C
		jmp	loc_ECB6

loc_EC2C:
		push	large 0E0075h
		push	large 860066h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_6A]
		mov	[bp+var_A0], eax
		mov	al, [bp+var_66]
		mov	[bp+var_A1], al
		mov	eax, [bp+var_A0]
		mov	[di+1Eh], eax
		mov	al, [bp+var_A1]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_64]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_84]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFFh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0
		mov	ax, di
		jmp	short loc_ECB8

loc_ECB6:
		mov	ax, di

loc_ECB8:
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_208FD
		add	sp, 6
		lea	ax, [bp+var_1BE]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		jmp	short loc_ED28

loc_ECD3:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	word ptr [bp+var_A6+2], ax
		cmp	word ptr [bp+var_A6+2], 0
		jz	short loc_ED28
		cmp	word ptr [bp+var_154], 0
		jnz	short loc_ED04
		cmp	word ptr [bp+var_154+2], 0
		jz	short loc_ED28

loc_ED04:
		push	large [bp+var_154]
		mov	ax, [bp+var_156]
		sub	ax, [bp+var_1B8]
		push	ax
		mov	ax, [bp+var_158]
		sub	ax, [bp+var_1BA]
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_ED28:
		cmp	[bp+var_84], 0
		jz	short loc_ECD3
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	[bp+var_AC], 0
		mov	byte ptr [bp+var_AA+2], 2
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		mov	[bp+var_AE], 66h
		mov	bx, [bp+var_84]
		inc	bx
		cmp	bx, 5
		jbe	short loc_ED63
		jmp	loc_EE9B

loc_ED63:
		shl	bx, 1
		jmp	cs:off_F296[bx]	; switch jump

loc_ED6A:
		mov	[bp+var_B0], 3Ch
		mov	eax, [bp+var_42]
		mov	[bp+var_B4], eax
		mov	al, [bp+var_3E]
		mov	[bp+var_B5], al
		mov	eax, [bp+var_B4]
		mov	[bp+var_AC], eax
		mov	al, [bp+var_B5]
		mov	byte ptr [bp+var_AA+2], al
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		mov	eax, [bp+var_3C]
		jmp	loc_EE96

loc_EDA7:
		mov	[bp+var_B0], 4Fh
		mov	eax, [bp+var_4C]
		mov	[bp+var_BA], eax
		mov	al, [bp+var_48]
		mov	[bp+var_BB], al
		mov	eax, [bp+var_BA]
		mov	[bp+var_AC], eax
		mov	al, [bp+var_BB]
		mov	byte ptr [bp+var_AA+2], al
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		mov	eax, [bp+var_46]
		jmp	loc_EE96

loc_EDE4:
		mov	[bp+var_B0], 61h
		mov	eax, [bp+var_56]
		mov	[bp+var_C0], eax
		mov	al, [bp+var_52]
		mov	[bp+var_C1], al
		mov	eax, [bp+var_C0]
		mov	[bp+var_AC], eax
		mov	al, [bp+var_C1]
		mov	byte ptr [bp+var_AA+2], al
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		mov	eax, [bp+var_50]
		jmp	short loc_EE96

loc_EE20:
		mov	[bp+var_B0], 74h
		mov	eax, [bp+var_60]
		mov	[bp+var_C6], eax
		mov	al, [bp+var_5C]
		mov	[bp+var_C7], al
		mov	eax, [bp+var_C6]
		mov	[bp+var_AC], eax
		mov	al, [bp+var_C7]
		mov	byte ptr [bp+var_AA+2], al
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		mov	eax, [bp+var_5A]
		jmp	short loc_EE96

loc_EE5C:
		mov	[bp+var_B0], 86h
		mov	eax, [bp+var_6A]
		mov	[bp+var_CC], eax
		mov	al, [bp+var_66]
		mov	[bp+var_CD], al
		mov	eax, [bp+var_CC]
		mov	[bp+var_AC], eax
		mov	al, [bp+var_CD]
		mov	byte ptr [bp+var_AA+2], al
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		mov	eax, [bp+var_64]

loc_EE96:
		mov	[bp+var_A6], eax

loc_EE9B:
		xor	eax, eax
		mov	[bp+var_D5], eax
		mov	[bp+var_D1], eax
		xor	di, di
		jmp	short loc_EF10

loc_EEAC:
		push	di
		cmp	byte ptr [bp+var_AA+2], 3
		jnz	short loc_EECD
		push	0
		mov	al, byte ptr [bp+var_AA+2]
		push	ax
		push	large [bp+var_AC]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_EED6

loc_EECD:
		mov	edx, [bp+var_AA]
		mov	ax, word ptr [bp+var_AC]

loc_EED6:
		push	dx
		push	ax
		push	[bp+var_B0]
		push	[bp+var_AE]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_D5], eax
		mov	byte ptr [bp+var_D6], 1

loc_EEFA:
		lea	ax, [bp+var_D6]
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 3
		jb	short loc_EEFA
		inc	di

loc_EF10:
		cmp	di, 7
		jl	short loc_EEAC
		push	0
		cmp	byte ptr [bp+var_AA+2], 3
		jnz	short loc_EF37
		push	0
		mov	al, byte ptr [bp+var_AA+2]
		push	ax
		push	large [bp+var_AC]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_EF40

loc_EF37:
		mov	edx, [bp+var_AA]
		mov	ax, word ptr [bp+var_AC]

loc_EF40:
		push	dx
		push	ax
		push	[bp+var_B0]
		push	[bp+var_AE]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		cmp	byte ptr [bp+var_AA+3], 0
		jz	short loc_EF7E
		cmp	[bp+var_AC], 0
		jz	short loc_EF7E
		push	0
		mov	al, byte ptr [bp+var_AA+2]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_EF7E

loc_EF7E:
		mov	[bp+var_AC], 0
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		lea	ax, [bp+var_1BE]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		cmp	[bp+var_84], 0FFFFh
		jnz	short loc_EFBC
		mov	[bp+var_7A], 1
		push	2
		lea	ax, [bp+var_1BE]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		jmp	short loc_F00F

loc_EFBC:
		mov	ax, [bp+var_84]
		mov	[si+0A0h], ax
		mov	bx, [si+0A0h]
		dec	bx
		cmp	bx, 3
		ja	short loc_EFF7
		shl	bx, 1
		jmp	cs:off_F28E[bx]	; switch jump

loc_EFD5:
		push	si
		nop
		push	cs
		call	near ptr sub_12BCA
		jmp	short loc_EFF3

loc_EFDD:
		push	si
		nop
		push	cs
		call	near ptr sub_12C16
		jmp	short loc_EFF3

loc_EFE5:
		push	si
		nop
		push	cs
		call	near ptr sub_12C62
		jmp	short loc_EFF3

loc_EFED:
		push	si
		nop
		push	cs
		call	near ptr sub_12D1E

loc_EFF3:
		pop	cx
		mov	[bp+var_7A], al

loc_EFF7:
		push	2
		lea	ax, [bp+var_1BE]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_7A], 0
		jnz	short loc_F00F
		jmp	loc_E8F3

loc_F00F:
		cmp	[bp+var_7A], 2
		jnz	short loc_F01A
		mov	ax, 1
		jmp	short loc_F01C

loc_F01A:
		xor	ax, ax

loc_F01C:
		mov	[bp+var_7B], al
		push	2
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_48B6C
		add	sp, 4
		cmp	[bp+var_6F], 0
		jz	short loc_F052
		cmp	[bp+var_74], 0
		jz	short loc_F052
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F052

loc_F052:
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_F08A
		cmp	[bp+var_6A], 0
		jz	short loc_F08A
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F08A

loc_F08A:
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_F0C2
		cmp	[bp+var_60], 0
		jz	short loc_F0C2
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F0C2

loc_F0C2:
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_F0FA
		cmp	[bp+var_56], 0
		jz	short loc_F0FA
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F0FA

loc_F0FA:
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		cmp	[bp+var_47], 0
		jz	short loc_F132
		cmp	[bp+var_4C], 0
		jz	short loc_F132
		push	0
		mov	al, [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F132

loc_F132:
		mov	[bp+var_4C], 0
		mov	[bp+var_47], 0
		mov	[bp+var_46], 0
		cmp	[bp+var_3D], 0
		jz	short loc_F16A
		cmp	[bp+var_42], 0
		jz	short loc_F16A
		push	0
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F16A

loc_F16A:
		mov	[bp+var_42], 0
		mov	[bp+var_3D], 0
		mov	[bp+var_3C], 0
		cmp	[bp+var_33], 0
		jz	short loc_F1A2
		cmp	[bp+var_38], 0
		jz	short loc_F1A2
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F1A2

loc_F1A2:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_F1DA
		cmp	[bp+var_2E], 0
		jz	short loc_F1DA
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F1DA

loc_F1DA:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		lea	ax, [bp+var_24]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_13], 0
		jz	short loc_F226
		cmp	[bp+var_18], 0
		jz	short loc_F226
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F226

loc_F226:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_9], 0
		jz	short loc_F25E
		cmp	[bp+var_E], 0
		jz	short loc_F25E
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_F25E

loc_F25E:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		lea	ax, [bp+var_4]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_E4]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		mov	al, [bp+var_7B]
		pop	di
		pop	si
		leave
		retf
sub_E625		endp

; START OF FUNCTION CHUNK FOR sub_E625
off_F28E	dw offset loc_EFD5
		dw offset loc_EFDD
		dw offset loc_EFE5
		dw offset loc_EFED
off_F296	dw offset loc_EE5C
		dw offset loc_EE9B
		dw offset loc_ED6A
		dw offset loc_EDA7
		dw offset loc_EDE4
		dw offset loc_EE20
; END OF FUNCTION CHUNK FOR sub_E625

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F2A2		proc far

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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, di
		dec	ax
		mov	[bp+var_4], ax
		push	[bp+arg_6]
		call	sub_23243
		pop	cx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_6], dx
		push	word_5BF72
		mov	bx, word_5BF72
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		mov	dx, di
		add	dx, ax
		add	dx, 4
		mov	[bp+var_8], dx
		mov	ax, [bp+var_2]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_16]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_A], ax
		lea	ax, [bp+var_10]
		push	ax
		mov	ax, si
		add	ax, 9Ah
		push	ax
		push	cs
		call	near ptr sub_E4D2
		add	sp, 4
		push	word_5BF74
		push	0FFh
		push	[bp+arg_6]
		push	di
		push	[bp+arg_2]
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		pop	di
		pop	si
		leave
		retf
sub_F2A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F340		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 9Ah
		push	ax
		push	cs
		call	near ptr sub_E5CD
		pop	cx
		pop	bp
		retf
sub_F340		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F353		proc far

var_11A		= word ptr -11Ah
var_F2		= word ptr -0F2h
var_EE		= word ptr -0EEh
var_EC		= word ptr -0ECh
var_BD		= word ptr -0BDh
var_A3		= byte ptr -0A3h
var_A2		= dword ptr -0A2h
var_9E		= byte ptr -9Eh
var_9D		= byte ptr -9Dh
var_9C		= dword ptr -9Ch
var_98		= word ptr -98h
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= dword ptr -88h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= byte ptr -7Eh
var_7D		= byte ptr -7Dh
var_7C		= dword ptr -7Ch
var_77		= byte ptr -77h
var_76		= dword ptr -76h
var_71		= byte ptr -71h
var_70		= dword ptr -70h
var_6B		= byte ptr -6Bh
var_6A		= dword ptr -6Ah
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_5F		= byte ptr -5Fh
var_5E		= dword ptr -5Eh
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_53		= byte ptr -53h
var_52		= dword ptr -52h
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_47		= byte ptr -47h
var_46		= dword ptr -46h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 11Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	1Fh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	26h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	large 750140h
		push	large 530000h
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_84], 0
		mov	[bp+var_82], 1
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	al, [bp+var_8]
		mov	[bp+var_1D], al
		mov	eax, [bp+var_1C]
		mov	[bp+var_A2], eax
		mov	al, [bp+var_1D]
		mov	[bp+var_9E], al
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_9C], eax
		mov	[bp+var_98], 0
		cmp	[bp+var_BD], 0
		jnz	short loc_F42E
		mov	[bp+var_A3], 0
		jmp	short loc_F42E

loc_F42E:
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F440
		jmp	loc_F4C5

loc_F440:
		push	large 0C005Ch
		push	large 170014h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_22], eax
		mov	al, [bp+var_12]
		mov	[bp+var_23], al
		mov	eax, [bp+var_22]
		mov	[di+1Eh], eax
		mov	al, [bp+var_23]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 5
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 10h
		mov	ax, di
		jmp	short loc_F4C7

loc_F4C5:
		mov	ax, di

loc_F4C7:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F4E7
		jmp	loc_F56C

loc_F4E7:
		push	large 0C0057h
		push	large 170074h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_28], eax
		mov	al, [bp+var_12]
		mov	[bp+var_29], al
		mov	eax, [bp+var_28]
		mov	[di+1Eh], eax
		mov	al, [bp+var_29]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 1
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 7
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 11h
		mov	ax, di
		jmp	short loc_F56E

loc_F56C:
		mov	ax, di

loc_F56E:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F58E
		jmp	loc_F613

loc_F58E:
		push	large 0C005Ch
		push	large 1700CFh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_2E], eax
		mov	al, [bp+var_12]
		mov	[bp+var_2F], al
		mov	eax, [bp+var_2E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_2F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 6
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 12h
		mov	ax, di
		jmp	short loc_F615

loc_F613:
		mov	ax, di

loc_F615:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F635
		jmp	loc_F6BA

loc_F635:
		push	large 0C0053h
		push	large 2A001Eh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_34], eax
		mov	al, [bp+var_12]
		mov	[bp+var_35], al
		mov	eax, [bp+var_34]
		mov	[di+1Eh], eax
		mov	al, [bp+var_35]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 3
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 8
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 13h
		mov	ax, di
		jmp	short loc_F6BC

loc_F6BA:
		mov	ax, di

loc_F6BC:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F6DC
		jmp	loc_F761

loc_F6DC:
		push	large 0C0058h
		push	large 2A0075h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_3A], eax
		mov	al, [bp+var_12]
		mov	[bp+var_3B], al
		mov	eax, [bp+var_3A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 9
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 14h
		mov	ax, di
		jmp	short loc_F763

loc_F761:
		mov	ax, di

loc_F763:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F783
		jmp	loc_F808

loc_F783:
		push	large 0C0050h
		push	large 2A00D1h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_40], eax
		mov	al, [bp+var_12]
		mov	[bp+var_41], al
		mov	eax, [bp+var_40]
		mov	[di+1Eh], eax
		mov	al, [bp+var_41]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 5
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Ah
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 15h
		mov	ax, di
		jmp	short loc_F80A

loc_F808:
		mov	ax, di

loc_F80A:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F82A
		jmp	loc_F8AF

loc_F82A:
		push	large 0C0045h
		push	large 3D0003h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_46], eax
		mov	al, [bp+var_12]
		mov	[bp+var_47], al
		mov	eax, [bp+var_46]
		mov	[di+1Eh], eax
		mov	al, [bp+var_47]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 6
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Bh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 16h
		mov	ax, di
		jmp	short loc_F8B1

loc_F8AF:
		mov	ax, di

loc_F8B1:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F8D1
		jmp	loc_F956

loc_F8D1:
		push	large 0C004Bh
		push	large 3D004Bh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_4C], eax
		mov	al, [bp+var_12]
		mov	[bp+var_4D], al
		mov	eax, [bp+var_4C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 7
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Ch
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 17h
		mov	ax, di
		jmp	short loc_F958

loc_F956:
		mov	ax, di

loc_F958:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_F978
		jmp	loc_F9FD

loc_F978:
		push	large 0C0058h
		push	large 3D0099h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_52], eax
		mov	al, [bp+var_12]
		mov	[bp+var_53], al
		mov	eax, [bp+var_52]
		mov	[di+1Eh], eax
		mov	al, [bp+var_53]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 8
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Fh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 18h
		mov	ax, di
		jmp	short loc_F9FF

loc_F9FD:
		mov	ax, di

loc_F9FF:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FA1F
		jmp	loc_FAA4

loc_FA1F:
		push	large 0C0048h
		push	large 3D00F4h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_58], eax
		mov	al, [bp+var_12]
		mov	[bp+var_59], al
		mov	eax, [bp+var_58]
		mov	[di+1Eh], eax
		mov	al, [bp+var_59]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 9
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 11h
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 19h
		mov	ax, di
		jmp	short loc_FAA6

loc_FAA4:
		mov	ax, di

loc_FAA6:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FAC6
		jmp	loc_FB4B

loc_FAC6:
		push	large 0C0053h
		push	large 500019h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_5E], eax
		mov	al, [bp+var_12]
		mov	[bp+var_5F], al
		mov	eax, [bp+var_5E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_5F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ah
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 12h
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Ah
		mov	ax, di
		jmp	short loc_FB4D

loc_FB4B:
		mov	ax, di

loc_FB4D:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FB6D
		jmp	loc_FBF2

loc_FB6D:
		push	large 0C0052h
		push	large 500070h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_64], eax
		mov	al, [bp+var_12]
		mov	[bp+var_65], al
		mov	eax, [bp+var_64]
		mov	[di+1Eh], eax
		mov	al, [bp+var_65]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Bh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 13h
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Bh
		mov	ax, di
		jmp	short loc_FBF4

loc_FBF2:
		mov	ax, di

loc_FBF4:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FC14
		jmp	loc_FC99

loc_FC14:
		push	large 0C005Eh
		push	large 5000C6h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_6A], eax
		mov	al, [bp+var_12]
		mov	[bp+var_6B], al
		mov	eax, [bp+var_6A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ch
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 15h
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Ch
		mov	ax, di
		jmp	short loc_FC9B

loc_FC99:
		mov	ax, di

loc_FC9B:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FCBB
		jmp	loc_FD40

loc_FCBB:
		push	large 0D004Bh
		push	large 640012h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_70], eax
		mov	al, [bp+var_12]
		mov	[bp+var_71], al
		mov	eax, [bp+var_70]
		mov	[di+1Eh], eax
		mov	al, [bp+var_71]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Dh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFEh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Dh
		mov	ax, di
		jmp	short loc_FD42

loc_FD40:
		mov	ax, di

loc_FD42:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FD62
		jmp	loc_FDE7

loc_FD62:
		push	large 0D004Bh
		push	large 64007Bh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_76], eax
		mov	al, [bp+var_12]
		mov	[bp+var_77], al
		mov	eax, [bp+var_76]
		mov	[di+1Eh], eax
		mov	al, [bp+var_77]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Eh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFFh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Eh
		mov	ax, di
		jmp	short loc_FDE9

loc_FDE7:
		mov	ax, di

loc_FDE9:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_FE09
		jmp	loc_FE8E

loc_FE09:
		push	large 0D0048h
		push	large 6400E4h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_7C], eax
		mov	al, [bp+var_12]
		mov	[bp+var_7D], al
		mov	eax, [bp+var_7C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_7D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Fh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFDh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Fh
		mov	ax, di
		jmp	short loc_FE90

loc_FE8E:
		mov	ax, di

loc_FE90:
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_208FD
		add	sp, 6

loc_FE9E:
		mov	[bp+var_18], 0
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx

loc_FEAD:
		mov	[bp+var_2], 0
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_UpdateWithLockWrapper_20936
		pop	cx
		jmp	short loc_FF27

loc_FED4:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_80], ax
		cmp	[bp+var_80], 0
		jz	short loc_FF27
		cmp	word ptr [bp+var_88], 0
		jnz	short loc_FF03
		cmp	word ptr [bp+var_88+2], 0
		jz	short loc_FF27

loc_FF03:
		push	large [bp+var_88]
		mov	ax, [bp+var_8A]
		sub	ax, [bp+var_EC]
		push	ax
		mov	ax, [bp+var_8C]
		sub	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_FF27:
		cmp	[bp+var_2], 0
		jz	short loc_FED4
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	ax, [bp+var_2]
		cmp	ax, 0FFFDh
		jnz	short loc_FF3D
		jmp	loc_FFF3

loc_FF3D:
		cmp	ax, 0FFFEh
		jnz	short loc_FF45
		jmp	loc_FFED

loc_FF45:
		cmp	ax, 0FFFFh
		jz	short loc_FF57
		jmp	loc_10037

loc_FF4D:
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_FF57:
		cmp	word ptr [si+2], 0Ch
		jge	short loc_FF4D
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_FFB0
		cmp	[bp+var_16], 0
		jz	short loc_FFB0
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_FFB0

loc_FFB0:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_FFE8
		cmp	[bp+var_C], 0
		jz	short loc_FFE8
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_FFE8

loc_FFE8:
		mov	al, 0
		jmp	loc_101BA

loc_FFED:
		mov	[bp+var_18], 2
		jmp	short loc_10037

loc_FFF3:
		cmp	word ptr [si+88h], 0
		jz	short loc_10037
		xor	di, di
		jmp	short loc_10013

loc_FFFE:
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+8Ah], 0
		inc	di

loc_10013:
		cmp	[si+88h], di
		jg	short loc_FFFE
		mov	word ptr [si+88h], 0
		push	1087h
		push	word ptr [si+2]
		mov	ax, [si]
		add	ax, 0Ah
		push	ax
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch

loc_10037:
		cmp	[bp+var_2], 0
		jg	short loc_10040
		jmp	loc_100F5

loc_10040:
		cmp	word ptr [si+88h], 4
		jl	short loc_1004A
		jmp	loc_100F5

loc_1004A:
		cmp	word ptr [si+88h], 0
		jnz	short loc_1005B
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_1005B:
		mov	bx, [si+88h]
		shl	bx, 1
		mov	ax, [bp+var_2]
		mov	[bx+si+8Ah], ax
		cmp	[bp+var_2], 13h
		jge	short loc_1007F
		push	si
		nop
		push	cs
		call	near ptr sub_101BE
		pop	cx
		mov	bx, [si+88h]
		shl	bx, 1
		mov	[bx+si+92h], ax

loc_1007F:
		mov	bx, [si+88h]
		shl	bx, 1
		mov	bx, [bx+si+8Ah]
		imul	bx, bx, 7
		push	word ptr [bx+0DD4h]
		lea	ax, [bp+var_11A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [si+88h]
		shl	bx, 1
		cmp	word ptr [bx+si+8Ah], 13h
		jge	short loc_100D7
		push	108Ch
		lea	ax, [bp+var_11A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+88h]
		shl	bx, 1
		mov	bx, [bx+si+92h]
		shl	bx, 1
		push	word ptr [bx+0E6Eh]
		lea	ax, [bp+var_11A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_100D7:
		lea	ax, [bp+var_11A]
		push	ax
		push	word ptr [si+2]
		mov	ax, [si]
		add	ax, 0Ah
		push	ax
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		inc	word ptr [si+88h]

loc_100F5:
		cmp	word ptr [si+88h], 4
		jnz	short loc_10100
		mov	[bp+var_18], 2

loc_10100:
		cmp	[bp+var_18], 2
		jz	short loc_10109
		jmp	loc_FEAD

loc_10109:
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		cmp	word ptr [si+88h], 4
		jge	short loc_10133
		push	si
		nop
		push	cs
		call	near ptr sub_10605
		jmp	short loc_10139

loc_10133:
		push	si
		nop
		push	cs
		call	near ptr sub_11C00

loc_10139:
		pop	cx
		mov	[bp+var_18], al
		cmp	[bp+var_18], 0
		jnz	short loc_10146
		jmp	loc_FE9E

loc_10146:
		mov	al, [bp+var_18]
		mov	[bp+var_7E], al
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_1017F
		cmp	[bp+var_16], 0
		jz	short loc_1017F
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1017F

loc_1017F:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_101B7
		cmp	[bp+var_C], 0
		jz	short loc_101B7
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_101B7

loc_101B7:
		mov	al, [bp+var_7E]

loc_101BA:
		pop	di
		pop	si
		leave
		retf
sub_F353		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_101BE		proc far

var_A4		= word ptr -0A4h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_54		= dword ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		push	si
		mov	si, [bp+arg_0]
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	21h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	22h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	large 120127h
		push	large 0B4000Ch
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_36], 0
		mov	[bp+var_34], 1
		mov	eax, [bp+var_C]
		mov	[bp+var_1A], eax
		mov	al, [bp+var_8]
		mov	[bp+var_1B], al
		mov	eax, [bp+var_1A]
		mov	[bp+var_54], eax
		mov	al, [bp+var_1B]
		mov	[bp+var_50], al
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 0
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_10299
		jmp	loc_1031E

loc_10299:
		push	large 0B002Fh
		push	large 40094h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_20], eax
		mov	al, [bp+var_12]
		mov	[bp+var_21], al
		mov	eax, [bp+var_20]
		mov	[si+1Eh], eax
		mov	al, [bp+var_21]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_10]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 0
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 0
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 3
		mov	ax, si
		jmp	short loc_10320

loc_1031E:
		mov	ax, si

loc_10320:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_10340
		jmp	loc_103C5

loc_10340:
		push	large 0B003Ch
		push	large 400C7h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_26], eax
		mov	al, [bp+var_12]
		mov	[bp+var_27], al
		mov	eax, [bp+var_26]
		mov	[si+1Eh], eax
		mov	al, [bp+var_27]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_10]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 1
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 1
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 4
		mov	ax, si
		jmp	short loc_103C7

loc_103C5:
		mov	ax, si

loc_103C7:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_103E7
		jmp	loc_1046C

loc_103E7:
		push	large 0B001Ch
		push	large 40107h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_2C], eax
		mov	al, [bp+var_12]
		mov	[bp+var_2D], al
		mov	eax, [bp+var_2C]
		mov	[si+1Eh], eax
		mov	al, [bp+var_2D]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_10]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 2
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 2
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 5
		mov	ax, si
		jmp	short loc_1046E

loc_1046C:
		mov	ax, si

loc_1046E:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_208FD
		add	sp, 6
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		push	large 2640018h
		call	sub_55F6F
		add	sp, 4
		push	large 0C500B4h
		call	sub_55F9E
		add	sp, 4
		mov	word_5B4DF, 0Ch
		mov	word_5B4E1, 0B4h
		mov	word_5B4E3, 132h
		mov	word_5B4E5, 0C5h
		push	large 0BC013Eh
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		push	large 0BC013Eh
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		jmp	short loc_1052A

loc_104DC:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_32], ax
		cmp	[bp+var_32], 0
		jz	short loc_1052A
		cmp	word ptr [bp+var_3A], 0
		jnz	short loc_10509
		cmp	word ptr [bp+var_3A+2], 0
		jz	short loc_1052A

loc_10509:
		push	large [bp+var_3A]
		mov	ax, [bp+var_3C]
		sub	ax, [bp+var_9E]
		push	ax
		mov	ax, [bp+var_3E]
		sub	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_1052A:
		cmp	[bp+var_2], 0FFFFh
		jz	short loc_104DC
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		push	large 27E0000h
		call	sub_55F6F
		add	sp, 4
		push	large 0C70000h
		call	sub_55F9E
		add	sp, 4
		mov	word_5B4DF, 0
		mov	word_5B4E1, 0
		mov	word_5B4E3, 13Fh
		mov	word_5B4E5, 0C7h
		push	large 63013Fh
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		push	large 63013Fh
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		mov	ax, [bp+var_2]
		mov	[bp+var_30], ax
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_105C7
		cmp	[bp+var_16], 0
		jz	short loc_105C7
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_105C7

loc_105C7:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_105FF
		cmp	[bp+var_C], 0
		jz	short loc_105FF
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_105FF

loc_105FF:
		mov	ax, [bp+var_30]
		pop	si
		leave
		retf
sub_101BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10605		proc far

var_108		= word ptr -108h
var_E0		= word ptr -0E0h
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_AB		= word ptr -0ABh
var_91		= byte ptr -91h
var_90		= dword ptr -90h
var_8C		= byte ptr -8Ch
var_8B		= byte ptr -8Bh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= dword ptr -76h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= byte ptr -6Ch
var_6B		= byte ptr -6Bh
var_6A		= dword ptr -6Ah
var_65		= byte ptr -65h
var_64		= dword ptr -64h
var_5F		= byte ptr -5Fh
var_5E		= dword ptr -5Eh
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_53		= byte ptr -53h
var_52		= dword ptr -52h
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_47		= byte ptr -47h
var_46		= dword ptr -46h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= byte ptr -24h
var_22		= dword ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [si+88h]
		mov	[bp+var_4], ax
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	[bp+var_18], 0
		mov	[bp+var_14], 2
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	2
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	1Dh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	1Eh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	26h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	large 750140h
		push	large 530000h
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_72], 0
		mov	[bp+var_70], 1
		mov	eax, [bp+var_E]
		mov	[bp+var_28], eax
		mov	al, [bp+var_A]
		mov	[bp+var_29], al
		mov	eax, [bp+var_28]
		mov	[bp+var_90], eax
		mov	al, [bp+var_29]
		mov	[bp+var_8C], al
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_8A], eax
		mov	[bp+var_86], 0
		cmp	[bp+var_AB], 0
		jnz	short loc_10713
		mov	[bp+var_91], 0
		jmp	short loc_10713

loc_10713:
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10725
		jmp	loc_107AA

loc_10725:
		push	large 0C0056h
		push	large 17002Dh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_2E], eax
		mov	al, [bp+var_14]
		mov	[bp+var_2F], al
		mov	eax, [bp+var_2E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_2F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 8
		mov	ax, di
		jmp	short loc_107AC

loc_107AA:
		mov	ax, di

loc_107AC:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_107CC
		jmp	loc_10851

loc_107CC:
		push	large 0C0065h
		push	large 170087h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_34], eax
		mov	al, [bp+var_14]
		mov	[bp+var_35], al
		mov	eax, [bp+var_34]
		mov	[di+1Eh], eax
		mov	al, [bp+var_35]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 1
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 9
		mov	ax, di
		jmp	short loc_10853

loc_10851:
		mov	ax, di

loc_10853:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10873
		jmp	loc_108F8

loc_10873:
		push	large 0C0025h
		push	large 1700F0h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_3A], eax
		mov	al, [bp+var_14]
		mov	[bp+var_3B], al
		mov	eax, [bp+var_3A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 3
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Ah
		mov	ax, di
		jmp	short loc_108FA

loc_108F8:
		mov	ax, di

loc_108FA:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_1091A
		jmp	loc_1099F

loc_1091A:
		push	large 0C003Dh
		push	large 2A0022h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_40], eax
		mov	al, [bp+var_14]
		mov	[bp+var_41], al
		mov	eax, [bp+var_40]
		mov	[di+1Eh], eax
		mov	al, [bp+var_41]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 3
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Bh
		mov	ax, di
		jmp	short loc_109A1

loc_1099F:
		mov	ax, di

loc_109A1:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_109C1
		jmp	loc_10A46

loc_109C1:
		push	large 0C0053h
		push	large 2A0063h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_46], eax
		mov	al, [bp+var_14]
		mov	[bp+var_47], al
		mov	eax, [bp+var_46]
		mov	[di+1Eh], eax
		mov	al, [bp+var_47]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Dh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Ch
		mov	ax, di
		jmp	short loc_10A48

loc_10A46:
		mov	ax, di

loc_10A48:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10A68
		jmp	loc_10AED

loc_10A68:
		push	large 0C0066h
		push	large 2A00BAh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_4C], eax
		mov	al, [bp+var_14]
		mov	[bp+var_4D], al
		mov	eax, [bp+var_4C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 5
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0Eh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Dh
		mov	ax, di
		jmp	short loc_10AEF

loc_10AED:
		mov	ax, di

loc_10AEF:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10B0F
		jmp	loc_10B94

loc_10B0F:
		push	large 0C0085h
		push	large 3D002Ch
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_52], eax
		mov	al, [bp+var_14]
		mov	[bp+var_53], al
		mov	eax, [bp+var_52]
		mov	[di+1Eh], eax
		mov	al, [bp+var_53]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 6
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 10h
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Eh
		mov	ax, di
		jmp	short loc_10B96

loc_10B94:
		mov	ax, di

loc_10B96:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10BB6
		jmp	loc_10C3B

loc_10BB6:
		push	large 0C005Eh
		push	large 3D00B5h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_58], eax
		mov	al, [bp+var_14]
		mov	[bp+var_59], al
		mov	eax, [bp+var_58]
		mov	[di+1Eh], eax
		mov	al, [bp+var_59]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_12]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 7
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 14h
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Fh
		mov	ax, di
		jmp	short loc_10C3D

loc_10C3B:
		mov	ax, di

loc_10C3D:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10C5D
		jmp	loc_10CE2

loc_10C5D:
		push	large 0D004Bh
		push	large 640012h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_5E], eax
		mov	al, [bp+var_1E]
		mov	[bp+var_5F], al
		mov	eax, [bp+var_5E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_5F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Dh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFEh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Dh
		mov	ax, di
		jmp	short loc_10CE4

loc_10CE2:
		mov	ax, di

loc_10CE4:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10D04
		jmp	loc_10D89

loc_10D04:
		push	large 0D004Bh
		push	large 64007Bh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_64], eax
		mov	al, [bp+var_1E]
		mov	[bp+var_65], al
		mov	eax, [bp+var_64]
		mov	[di+1Eh], eax
		mov	al, [bp+var_65]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Eh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFFh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Eh
		mov	ax, di
		jmp	short loc_10D8B

loc_10D89:
		mov	ax, di

loc_10D8B:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_10DAB
		jmp	loc_10E30

loc_10DAB:
		push	large 0D0048h
		push	large 6400E4h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_6A], eax
		mov	al, [bp+var_1E]
		mov	[bp+var_6B], al
		mov	eax, [bp+var_6A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Fh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFDh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Fh
		mov	ax, di
		jmp	short loc_10E32

loc_10E30:
		mov	ax, di

loc_10E32:
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_208FD
		add	sp, 6

loc_10E40:
		mov	[bp+var_24], 0
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx

loc_10E4F:
		mov	[bp+var_2], 0
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_UpdateWithLockWrapper_20936
		pop	cx
		jmp	short loc_10EC4

loc_10E76:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_6E], ax
		cmp	[bp+var_6E], 0
		jz	short loc_10EC4
		cmp	word ptr [bp+var_76], 0
		jnz	short loc_10EA3
		cmp	word ptr [bp+var_76+2], 0
		jz	short loc_10EC4

loc_10EA3:
		push	large [bp+var_76]
		mov	ax, [bp+var_78]
		sub	ax, [bp+var_DA]
		push	ax
		mov	ax, [bp+var_7A]
		sub	ax, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_10EC4:
		cmp	[bp+var_2], 0
		jz	short loc_10E76
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	ax, [bp+var_2]
		cmp	ax, 0FFFDh
		jnz	short loc_10EDA
		jmp	loc_10FB8

loc_10EDA:
		cmp	ax, 0FFFEh
		jnz	short loc_10EE2
		jmp	loc_10FB2

loc_10EE2:
		cmp	ax, 0FFFFh
		jz	short loc_10EEA
		jmp	loc_11007

loc_10EEA:
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_10F3D
		cmp	[bp+var_22], 0
		jz	short loc_10F3D
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_10F3D

loc_10F3D:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		cmp	[bp+var_13], 0
		jz	short loc_10F75
		cmp	[bp+var_18], 0
		jz	short loc_10F75
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_10F75

loc_10F75:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_9], 0
		jz	short loc_10FAD
		cmp	[bp+var_E], 0
		jz	short loc_10FAD
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_10FAD

loc_10FAD:
		mov	al, 0
		jmp	loc_111AF

loc_10FB2:
		mov	[bp+var_24], 2
		jmp	short loc_11007

loc_10FB8:
		mov	ax, [si+88h]
		sub	ax, [bp+var_4]
		jz	short loc_11007
		mov	di, [bp+var_4]
		jmp	short loc_10FDB

loc_10FC6:
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+8Ah], 0
		inc	di

loc_10FDB:
		cmp	[si+88h], di
		jg	short loc_10FC6
		mov	ax, [bp+var_4]
		mov	[si+88h], ax
		cmp	word ptr [si+88h], 0
		jnz	short loc_11007
		push	1090h
		push	word ptr [si+2]
		mov	ax, [si]
		add	ax, 0Ah
		push	ax
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch

loc_11007:
		cmp	[bp+var_2], 0
		jg	short loc_11010
		jmp	loc_110C4

loc_11010:
		cmp	word ptr [si+88h], 4
		jl	short loc_1101A
		jmp	loc_110C4

loc_1101A:
		cmp	word ptr [si+88h], 0
		jnz	short loc_1102B
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_1102B:
		mov	bx, [si+88h]
		shl	bx, 1
		mov	ax, [bp+var_2]
		mov	[bx+si+8Ah], ax
		cmp	[bp+var_2], 13h
		jge	short loc_1104E
		push	si
		push	cs
		call	near ptr sub_101BE
		pop	cx
		mov	bx, [si+88h]
		shl	bx, 1
		mov	[bx+si+92h], ax

loc_1104E:
		mov	bx, [si+88h]
		shl	bx, 1
		mov	bx, [bx+si+8Ah]
		imul	bx, bx, 7
		push	word ptr [bx+0DD4h]
		lea	ax, [bp+var_108]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [si+88h]
		shl	bx, 1
		cmp	word ptr [bx+si+8Ah], 13h
		jge	short loc_110A6
		push	1095h
		lea	ax, [bp+var_108]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+88h]
		shl	bx, 1
		mov	bx, [bx+si+92h]
		shl	bx, 1
		push	word ptr [bx+0E6Eh]
		lea	ax, [bp+var_108]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_110A6:
		lea	ax, [bp+var_108]
		push	ax
		push	word ptr [si+2]
		mov	ax, [si]
		add	ax, 0Ah
		push	ax
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		inc	word ptr [si+88h]

loc_110C4:
		cmp	word ptr [si+88h], 4
		jnz	short loc_110CF
		mov	[bp+var_24], 2

loc_110CF:
		cmp	[bp+var_24], 2
		jz	short loc_110D8
		jmp	loc_10E4F

loc_110D8:
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_11C00
		pop	cx
		mov	[bp+var_24], al
		cmp	[bp+var_24], 0
		jnz	short loc_11106
		jmp	loc_10E40

loc_11106:
		mov	[bp+var_6C], al
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_1113C
		cmp	[bp+var_22], 0
		jz	short loc_1113C
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1113C

loc_1113C:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		cmp	[bp+var_13], 0
		jz	short loc_11174
		cmp	[bp+var_18], 0
		jz	short loc_11174
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11174

loc_11174:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_9], 0
		jz	short loc_111AC
		cmp	[bp+var_E], 0
		jz	short loc_111AC
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_111AC

loc_111AC:
		mov	al, [bp+var_6C]

loc_111AF:
		pop	di
		pop	si
		leave
		retf
sub_10605		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_111B3		proc far

var_108		= word ptr -108h
var_104		= word ptr -104h
var_102		= word ptr -102h
var_B8		= dword ptr -0B8h
var_B4		= byte ptr -0B4h
var_B3		= byte ptr -0B3h
var_B2		= dword ptr -0B2h
var_AE		= word ptr -0AEh
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= byte ptr -94h
var_93		= byte ptr -93h
var_92		= dword ptr -92h
var_8D		= byte ptr -8Dh
var_8C		= dword ptr -8Ch
var_87		= byte ptr -87h
var_86		= dword ptr -86h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7B		= byte ptr -7Bh
var_7A		= dword ptr -7Ah
var_75		= byte ptr -75h
var_74		= dword ptr -74h
var_6F		= byte ptr -6Fh
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_67		= byte ptr -67h
var_66		= dword ptr -66h
var_62		= word ptr -62h
var_60		= byte ptr -60h
var_5F		= word ptr -5Fh
var_5C		= dword ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= byte ptr -3Ah
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_111CB

loc_111C1:
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_111CB:
		cmp	word ptr [si+2], 0Ch
		jge	short loc_111C1
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		push	2F8h
		call	sub_A4F0
		pop	cx
		push	2F9h
		call	sub_A4F0
		pop	cx
		push	2FBh
		call	sub_A4F0
		pop	cx
		push	2FAh
		call	sub_A4F0
		pop	cx
		push	2FCh
		call	sub_A4F0
		pop	cx
		mov	[bp+var_2], 2
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		mov	[bp+var_34], 0
		mov	[bp+var_30], 2
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_3E], 0
		mov	[bp+var_3A], 2
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	1Bh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	27h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	19h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	2Ah
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	2Bh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	1Ch
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	24h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	25h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_5F], 0
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	[bp+var_62]
		mov	al, [bp+var_60]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	0
		push	word ptr [si+7Bh]
		mov	al, [si+7Dh]
		push	ax
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	large 0C80140h
		push	large 0
		lea	ax, [bp+var_108]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_9A], 0
		mov	[bp+var_98], 1
		mov	eax, [bp+var_C]
		mov	[bp+var_66], eax
		mov	al, [bp+var_8]
		mov	[bp+var_67], al
		mov	eax, [bp+var_66]
		mov	[bp+var_B8], eax
		mov	al, [bp+var_67]
		mov	[bp+var_B4], al
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_B2], eax
		mov	[bp+var_AE], 0
		mov	[bp+var_6A], 0
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_1146E
		jmp	loc_114F3

loc_1146E:
		push	large 38007Dh
		push	large 100017h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_6E], eax
		mov	al, [bp+var_1C]
		mov	[bp+var_6F], al
		mov	eax, [bp+var_6E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_114F5

loc_114F3:
		mov	ax, di

loc_114F5:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11515
		jmp	loc_1159A

loc_11515:
		push	large 38007Dh
		push	large 4E0017h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_74], eax
		mov	al, [bp+var_26]
		mov	[bp+var_75], al
		mov	eax, [bp+var_74]
		mov	[di+1Eh], eax
		mov	al, [bp+var_75]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_24]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_1159C

loc_1159A:
		mov	ax, di

loc_1159C:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_115BC
		jmp	loc_11641

loc_115BC:
		push	large 38007Dh
		push	large 8C0017h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_7A], eax
		mov	al, [bp+var_30]
		mov	[bp+var_7B], al
		mov	eax, [bp+var_7A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_7B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_2E]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 3
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_11643

loc_11641:
		mov	ax, di

loc_11643:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11663
		jmp	loc_116EA

loc_11663:
		push	large 38007Dh
		push	large 1000A8h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_3E]
		mov	[bp+var_80], eax
		mov	al, [bp+var_3A]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[di+1Eh], eax
		mov	al, [bp+var_81]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_38]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_116EC

loc_116EA:
		mov	ax, di

loc_116EC:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_1170C
		jmp	loc_11795

loc_1170C:
		push	large 38007Dh
		push	large 4E00A8h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_48]
		mov	[bp+var_86], eax
		mov	al, [bp+var_44]
		mov	[bp+var_87], al
		mov	eax, [bp+var_86]
		mov	[di+1Eh], eax
		mov	al, [bp+var_87]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_42]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 5
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_11797

loc_11795:
		mov	ax, di

loc_11797:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_117B7
		jmp	loc_11840

loc_117B7:
		push	large 0B0062h
		push	large 9B00B5h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_52]
		mov	[bp+var_8C], eax
		mov	al, [bp+var_4E]
		mov	[bp+var_8D], al
		mov	eax, [bp+var_8C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_4C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFFh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_11842

loc_11840:
		mov	ax, di

loc_11842:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11862
		jmp	loc_118EB

loc_11862:
		push	large 0B0062h
		push	large 0AF00B5h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_5C]
		mov	[bp+var_92], eax
		mov	al, [bp+var_58]
		mov	[bp+var_93], al
		mov	eax, [bp+var_92]
		mov	[di+1Eh], eax
		mov	al, [bp+var_93]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_56]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_6A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFEh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_118ED

loc_118EB:
		mov	ax, di

loc_118ED:
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	sub_208FD
		add	sp, 6
		lea	ax, [bp+var_108]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		jmp	short loc_1195D

loc_11908:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_108]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_96], ax
		cmp	[bp+var_96], 0
		jz	short loc_1195D
		cmp	word ptr [bp+var_9E], 0
		jnz	short loc_11939
		cmp	word ptr [bp+var_9E+2], 0
		jz	short loc_1195D

loc_11939:
		push	large [bp+var_9E]
		mov	ax, [bp+var_A0]
		sub	ax, [bp+var_102]
		push	ax
		mov	ax, [bp+var_A2]
		sub	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_1195D:
		cmp	[bp+var_6A], 0
		jz	short loc_11908
		call	TextScrollDisplayB_ApplyHelperD_571DE
		lea	ax, [bp+var_108]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		mov	bx, [bp+var_6A]
		sub	bx, 0FFFEh
		cmp	bx, 7
		ja	short loc_119E4
		shl	bx, 1
		jmp	cs:off_11BF0[bx]	; switch jump

loc_11985:
		push	2F8h
		call	sub_A455
		pop	cx
		mov	word ptr [si+80h], 1
		jmp	short loc_119E4

loc_11996:
		push	2F9h
		call	sub_A455
		pop	cx
		mov	word ptr [si+80h], 2
		jmp	short loc_119E4

loc_119A7:
		push	2FBh
		call	sub_A455
		pop	cx
		mov	word ptr [si+80h], 3
		jmp	short loc_119E4

loc_119B8:
		push	2FAh
		call	sub_A455
		pop	cx
		mov	word ptr [si+80h], 4
		jmp	short loc_119E4

loc_119C9:
		push	2FCh
		call	sub_A455
		pop	cx
		mov	word ptr [si+80h], 0Ah
		jmp	short loc_119E4

loc_119DA:
		mov	[bp+var_2], 0
		jmp	short loc_119E4

loc_119E0:
		mov	[bp+var_2], 1

loc_119E4:
		mov	al, [bp+var_2]
		mov	[bp+var_94], al
		push	2
		lea	ax, [bp+var_108]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		lea	ax, [bp+var_62]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_57], 0
		jz	short loc_11A28
		cmp	[bp+var_5C], 0
		jz	short loc_11A28
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11A28

loc_11A28:
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_11A60
		cmp	[bp+var_52], 0
		jz	short loc_11A60
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11A60

loc_11A60:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_11A98
		cmp	[bp+var_48], 0
		jz	short loc_11A98
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11A98

loc_11A98:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+var_39], 0
		jz	short loc_11AD0
		cmp	[bp+var_3E], 0
		jz	short loc_11AD0
		push	0
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11AD0

loc_11AD0:
		mov	[bp+var_3E], 0
		mov	[bp+var_39], 0
		mov	[bp+var_38], 0
		cmp	[bp+var_2F], 0
		jz	short loc_11B08
		cmp	[bp+var_34], 0
		jz	short loc_11B08
		push	0
		mov	al, [bp+var_30]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11B08

loc_11B08:
		mov	[bp+var_34], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2E], 0
		cmp	[bp+var_25], 0
		jz	short loc_11B40
		cmp	[bp+var_2A], 0
		jz	short loc_11B40
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11B40

loc_11B40:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		cmp	[bp+var_1B], 0
		jz	short loc_11B78
		cmp	[bp+var_20], 0
		jz	short loc_11B78
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11B78

loc_11B78:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_11BB0
		cmp	[bp+var_16], 0
		jz	short loc_11BB0
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11BB0

loc_11BB0:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_11BE8
		cmp	[bp+var_C], 0
		jz	short loc_11BE8
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_11BE8

loc_11BE8:
		mov	al, [bp+var_94]
		pop	di
		pop	si
		leave
		retf
sub_111B3		endp

; START OF FUNCTION CHUNK FOR sub_111B3
off_11BF0	dw offset loc_119E0
		dw offset loc_119DA
		dw offset loc_119E4
		dw offset loc_11985
		dw offset loc_11996
		dw offset loc_119A7
		dw offset loc_119B8
		dw offset loc_119C9
; END OF FUNCTION CHUNK FOR sub_111B3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11C00		proc far

var_11E		= word ptr -11Eh
var_11A		= word ptr -11Ah
var_118		= word ptr -118h
var_E9		= word ptr -0E9h
var_CF		= byte ptr -0CFh
var_CE		= dword ptr -0CEh
var_CA		= byte ptr -0CAh
var_C9		= byte ptr -0C9h
var_C8		= dword ptr -0C8h
var_C4		= word ptr -0C4h
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B4		= dword ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_5C		= word ptr -5Ch
var_5A		= byte ptr -5Ah
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= dword ptr -56h
var_51		= byte ptr -51h
var_50		= dword ptr -50h
var_4B		= byte ptr -4Bh
var_4A		= dword ptr -4Ah
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_3F		= byte ptr -3Fh
var_3E		= dword ptr -3Eh
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 11Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+82h], 0
		jl	short loc_11C51
		cmp	dword ptr [si+82h], 0
		jz	short loc_11C26
		push	large [si+82h]
		push	1099h
		jmp	short loc_11C2E

loc_11C26:
		push	large [si+82h]
		push	10B5h

loc_11C2E:
		lea	ax, [bp+var_AC]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_AC]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch

loc_11C51:
		mov	[bp+var_2], 0
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	2Eh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	0Fh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	26h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	large 640140h
		push	large 640000h
		lea	ax, [bp+var_11E]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_B0], 0
		mov	[bp+var_AE], 1
		mov	eax, [bp+var_C]
		mov	[bp+var_24], eax
		mov	al, [bp+var_8]
		mov	[bp+var_25], al
		mov	eax, [bp+var_24]
		mov	[bp+var_CE], eax
		mov	al, [bp+var_25]
		mov	[bp+var_CA], al
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_C8], eax
		mov	[bp+var_C4], 0
		cmp	[bp+var_E9], 0
		jnz	short loc_11D4D
		mov	[bp+var_CF], 0
		jmp	short loc_11D4D

loc_11D4D:
		mov	[bp+var_28], 0
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11D64
		jmp	loc_11DE9

loc_11D64:
		push	large 0D0063h
		push	large 190075h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_2C], eax
		mov	al, [bp+var_12]
		mov	[bp+var_2D], al
		mov	eax, [bp+var_2C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_2D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 8
		mov	ax, di
		jmp	short loc_11DEB

loc_11DE9:
		mov	ax, di

loc_11DEB:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11E0B
		jmp	loc_11E90

loc_11E0B:
		push	large 0D0063h
		push	large 290038h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_32], eax
		mov	al, [bp+var_12]
		mov	[bp+var_33], al
		mov	eax, [bp+var_32]
		mov	[di+1Eh], eax
		mov	al, [bp+var_33]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 1
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 9
		mov	ax, di
		jmp	short loc_11E92

loc_11E90:
		mov	ax, di

loc_11E92:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11EB2
		jmp	loc_11F37

loc_11EB2:
		push	large 0D0063h
		push	large 3A0038h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_38], eax
		mov	al, [bp+var_12]
		mov	[bp+var_39], al
		mov	eax, [bp+var_38]
		mov	[di+1Eh], eax
		mov	al, [bp+var_39]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Ah
		mov	ax, di
		jmp	short loc_11F39

loc_11F37:
		mov	ax, di

loc_11F39:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_11F59
		jmp	loc_11FDE

loc_11F59:
		push	large 0D0063h
		push	large 2900B0h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_3E], eax
		mov	al, [bp+var_12]
		mov	[bp+var_3F], al
		mov	eax, [bp+var_3E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 3
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 3
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Bh
		mov	ax, di
		jmp	short loc_11FE0

loc_11FDE:
		mov	ax, di

loc_11FE0:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_12000
		jmp	loc_12085

loc_12000:
		push	large 0D0063h
		push	large 3A00B0h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_44], eax
		mov	al, [bp+var_12]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[di+1Eh], eax
		mov	al, [bp+var_45]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_10]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 5
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 0Ch
		mov	ax, di
		jmp	short loc_12087

loc_12085:
		mov	ax, di

loc_12087:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_120A7
		jmp	loc_1212C

loc_120A7:
		push	large 0D004Bh
		push	large 530012h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_4A], eax
		mov	al, [bp+var_1C]
		mov	[bp+var_4B], al
		mov	eax, [bp+var_4A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Dh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFEh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Dh
		mov	ax, di
		jmp	short loc_1212E

loc_1212C:
		mov	ax, di

loc_1212E:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_1214E
		jmp	loc_121D3

loc_1214E:
		push	large 0D004Bh
		push	large 53007Ah
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_50], eax
		mov	al, [bp+var_1C]
		mov	[bp+var_51], al
		mov	eax, [bp+var_50]
		mov	[di+1Eh], eax
		mov	al, [bp+var_51]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Eh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFFh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Eh
		mov	ax, di
		jmp	short loc_121D5

loc_121D3:
		mov	ax, di

loc_121D5:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_121F5
		jmp	loc_1227A

loc_121F5:
		push	large 0D0048h
		push	large 5300E4h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_56], eax
		mov	al, [bp+var_1C]
		mov	[bp+var_57], al
		mov	eax, [bp+var_56]
		mov	[di+1Eh], eax
		mov	al, [bp+var_57]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_1A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Fh
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 0FFFDh
		mov	word ptr [di+0Eh], 45Eh
		mov	word ptr [di+2Eh], 1Fh
		mov	ax, di
		jmp	short loc_1227C

loc_1227A:
		mov	ax, di

loc_1227C:
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_208FD
		add	sp, 6

loc_1228A:
		mov	[bp+var_28], 0
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		lea	ax, [bp+var_11E]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		jmp	short loc_12304

loc_122B1:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_5C], ax
		cmp	[bp+var_5C], 0
		jz	short loc_12304
		cmp	word ptr [bp+var_B4], 0
		jnz	short loc_122E0
		cmp	word ptr [bp+var_B4+2], 0
		jz	short loc_12304

loc_122E0:
		push	large [bp+var_B4]
		mov	ax, [bp+var_B6]
		sub	ax, [bp+var_118]
		push	ax
		mov	ax, [bp+var_B8]
		sub	ax, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_12304:
		cmp	[bp+var_28], 0
		jz	short loc_122B1
		call	TextScrollDisplayB_ApplyHelperD_571DE
		lea	ax, [bp+var_11E]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		mov	[bp+var_58], 1
		mov	ax, [bp+var_28]
		cmp	ax, 0FFFDh
		jnz	short loc_1233E
		jmp	loc_12425

loc_1233E:
		cmp	ax, 0FFFEh
		jnz	short loc_12346
		jmp	loc_12418

loc_12346:
		cmp	ax, 0FFFFh
		jz	short loc_1234E
		jmp	loc_12439

loc_1234E:
		cmp	dword ptr [si+82h], 0
		jl	short loc_12360
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_12360:
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		push	2
		lea	ax, [bp+var_11E]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_1B], 0
		jz	short loc_123A3
		cmp	[bp+var_20], 0
		jz	short loc_123A3
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_123A3

loc_123A3:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_123DB
		cmp	[bp+var_16], 0
		jz	short loc_123DB
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_123DB

loc_123DB:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_12413
		cmp	[bp+var_C], 0
		jz	short loc_12413
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_12413

loc_12413:
		mov	al, 0
		jmp	loc_12572

loc_12418:
		push	si
		nop
		push	cs
		call	near ptr sub_12576
		pop	cx
		mov	[bp+var_2], al
		jmp	loc_124BD

loc_12425:
		cmp	dword ptr [si+82h], 0
		jnz	short loc_12430
		jmp	loc_124BD

loc_12430:
		mov	[bp+var_28], 1
		mov	[bp+var_58], 0

loc_12439:
		cmp	dword ptr [si+82h], 0
		jl	short loc_1244B
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_1244B:
		mov	ax, [bp+var_28]
		dec	ax
		movsx	eax, ax
		imul	eax, eax, 9C4h
		mov	[si+82h], eax
		cmp	dword ptr [si+82h], 0
		jle	short loc_1247E
		push	large [si+82h]
		push	10D2h
		lea	ax, [bp+var_AC]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_1248E

loc_1247E:
		push	10EEh
		lea	ax, [bp+var_AC]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4

loc_1248E:
		lea	ax, [bp+var_AC]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		cmp	[bp+var_58], 0
		jz	short loc_124BD
		jmp	loc_12418

loc_124BD:
		cmp	[bp+var_2], 0
		jnz	short loc_124C6
		jmp	loc_1228A

loc_124C6:
		mov	al, [bp+var_2]
		mov	[bp+var_5A], al
		push	2
		lea	ax, [bp+var_11E]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_1B], 0
		jz	short loc_124FF
		cmp	[bp+var_20], 0
		jz	short loc_124FF
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_124FF

loc_124FF:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_12537
		cmp	[bp+var_16], 0
		jz	short loc_12537
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_12537

loc_12537:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		cmp	[bp+var_7], 0
		jz	short loc_1256F
		cmp	[bp+var_C], 0
		jz	short loc_1256F
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1256F

loc_1256F:
		mov	al, [bp+var_5A]

loc_12572:
		pop	di
		pop	si
		leave
		retf
sub_11C00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12576		proc far

var_A2		= word ptr -0A2h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_6D		= word ptr -6Dh
var_53		= byte ptr -53h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0A2h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	2
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	2Dh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	0Fh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	large 120140h
		push	large 0B40000h
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_34], 0
		mov	[bp+var_32], 1
		mov	eax, [bp+var_A]
		mov	[bp+var_18], eax
		mov	al, [bp+var_6]
		mov	[bp+var_19], al
		mov	eax, [bp+var_18]
		mov	[bp+var_52], eax
		mov	al, [bp+var_19]
		mov	[bp+var_4E], al
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_4C], eax
		mov	[bp+var_48], 0
		cmp	[bp+var_6D], 0
		jnz	short loc_12641
		mov	[bp+var_53], 0
		jmp	short loc_12641

loc_12641:
		mov	[bp+var_1C], 0
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_12658
		jmp	loc_126DD

loc_12658:
		push	large 0D0049h
		push	large 30012h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	al, [bp+var_10]
		mov	[bp+var_21], al
		mov	eax, [bp+var_20]
		mov	[si+1Eh], eax
		mov	al, [bp+var_21]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 5
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_1C]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 0FFFEh
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 0Dh
		mov	ax, si
		jmp	short loc_126DF

loc_126DD:
		mov	ax, si

loc_126DF:
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_126FF
		jmp	loc_12784

loc_126FF:
		push	large 0D0051h
		push	large 3007Bh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_26], eax
		mov	al, [bp+var_10]
		mov	[bp+var_27], al
		mov	eax, [bp+var_26]
		mov	[si+1Eh], eax
		mov	al, [bp+var_27]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 6
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_1C]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 0FFFFh
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 0Eh
		mov	ax, si
		jmp	short loc_12786

loc_12784:
		mov	ax, si

loc_12786:
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_127A6
		jmp	loc_1282B

loc_127A6:
		push	large 0D0051h
		push	large 300E5h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_2C], eax
		mov	al, [bp+var_10]
		mov	[bp+var_2D], al
		mov	eax, [bp+var_2C]
		mov	[si+1Eh], eax
		mov	al, [bp+var_2D]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 7
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_1C]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 0FFFDh
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 0Fh
		mov	ax, si
		jmp	short loc_1282D

loc_1282B:
		mov	ax, si

loc_1282D:
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_208FD
		add	sp, 6

loc_1283B:
		mov	[bp+var_1C], 0
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		jmp	short loc_128B0

loc_12862:
		push	0
		call	sub_1F7CA
		pop	cx
		push	large 1
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_20A18
		add	sp, 6
		mov	[bp+var_30], ax
		cmp	[bp+var_30], 0
		jz	short loc_128B0
		cmp	word ptr [bp+var_38], 0
		jnz	short loc_1288F
		cmp	word ptr [bp+var_38+2], 0
		jz	short loc_128B0

loc_1288F:
		push	large [bp+var_38]
		mov	ax, [bp+var_3A]
		sub	ax, [bp+var_9C]
		push	ax
		mov	ax, [bp+var_3C]
		sub	ax, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidget_RebuildDisplay_209A7
		add	sp, 0Ah

loc_128B0:
		cmp	[bp+var_1C], 0
		jz	short loc_12862
		call	TextScrollDisplayB_ApplyHelperD_571DE
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		mov	ax, [bp+var_1C]
		cmp	ax, 0FFFDh
		jnz	short loc_128E6
		jmp	loc_129D2

loc_128E6:
		cmp	ax, 0FFFEh
		jz	short loc_12963
		cmp	ax, 0FFFFh
		jz	short loc_128F3
		jmp	loc_1283B

loc_128F3:
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_12926
		cmp	[bp+var_14], 0
		jz	short loc_12926
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_12926

loc_12926:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		cmp	[bp+var_5], 0
		jz	short loc_1295E
		cmp	[bp+var_A], 0
		jz	short loc_1295E
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1295E

loc_1295E:
		mov	al, 0
		jmp	loc_12A44

loc_12963:
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_12996
		cmp	[bp+var_14], 0
		jz	short loc_12996
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_12996

loc_12996:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		cmp	[bp+var_5], 0
		jz	short loc_129CE
		cmp	[bp+var_A], 0
		jz	short loc_129CE
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_129CE

loc_129CE:
		mov	al, 2
		jmp	short loc_12A44

loc_129D2:
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_12A05
		cmp	[bp+var_14], 0
		jz	short loc_12A05
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_12A05

loc_12A05:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		cmp	[bp+var_5], 0
		jz	short loc_12A3D
		cmp	[bp+var_A], 0
		jz	short loc_12A3D
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_12A3D

loc_12A3D:
		mov	al, 1
		jmp	short loc_12A44
		mov	al, [bp+var_2E]

loc_12A44:
		pop	si
		leave
		retf
sub_12576		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12A47		proc far

var_1E		= word ptr -1Eh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	word ptr [si], 5
		mov	word ptr [si+2], 0
		call	TextScrollDisplayB_ApplyHelperD_571DE
		cmp	word ptr [si+0A0h], 1
		jz	short loc_12A6A
		jmp	loc_12B4B

loc_12A6A:
		push	110Bh
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		mov	bx, [si+80h]
		imul	bx, bx, 7
		push	word ptr [bx+0DD4h]
		push	112Ch
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		push	113Ch
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		cmp	word ptr [si+88h], 0
		jz	short loc_12B3D
		xor	di, di
		jmp	short loc_12B35

loc_12ACC:
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si+8Ah]
		imul	bx, bx, 7
		push	word ptr [bx+0DD4h]
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si+8Ah], 13h
		jge	short loc_12B1B
		push	114Ah
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si+92h]
		shl	bx, 1
		push	word ptr [bx+0E6Eh]
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_12B1B:
		lea	ax, [bp+var_1E]
		push	ax
		push	word ptr [si+2]
		mov	ax, [si]
		add	ax, 0Ah
		push	ax
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		inc	di

loc_12B35:
		cmp	[si+88h], di
		jg	short loc_12ACC
		jmp	short loc_12BB6

loc_12B3D:
		push	114Eh
		push	word ptr [si+2]
		mov	ax, [si]
		add	ax, 0Ah
		push	ax
		jmp	short loc_12BAA

loc_12B4B:
		push	1153h
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		push	1174h
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		push	1199h
		push	word ptr [si+2]
		push	word ptr [si]
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch
		mov	bx, [si+80h]
		imul	bx, bx, 7
		push	word ptr [bx+0DD4h]
		push	11ADh
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]

loc_12BAA:
		push	si
		push	cs
		call	near ptr sub_F2A2
		add	sp, 8
		add	word ptr [si+2], 0Ch

loc_12BB6:
		push	word_5DD44
		push	word_5DD42
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_12A47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12BCA		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_12BE0

loc_12BD6:
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_12BE0:
		cmp	word ptr [si+2], 0Ch
		jge	short loc_12BD6
		push	si
		push	cs
		call	near ptr sub_111B3
		pop	cx
		mov	[bp+var_2], al
		cmp	[bp+var_2], 2
		jnz	short loc_12C10
		push	si
		push	cs
		call	near ptr sub_12A47
		pop	cx
		push	si
		push	cs
		call	near ptr sub_F353
		pop	cx
		mov	[bp+var_2], al
		cmp	[bp+var_2], 1
		jz	short loc_12C10
		cmp	[bp+var_2], 2
		jnz	short loc_12BE0

loc_12C10:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_12BCA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12C16		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_12C2C

loc_12C22:
		push	si
		push	cs
		call	near ptr sub_F340
		pop	cx
		sub	word ptr [si+2], 0Ch

loc_12C2C:
		cmp	word ptr [si+2], 0Ch
		jge	short loc_12C22
		push	si
		push	cs
		call	near ptr sub_111B3
		pop	cx
		mov	[bp+var_2], al
		cmp	[bp+var_2], 2
		jnz	short loc_12C5C
		push	si
		push	cs
		call	near ptr sub_12A47
		pop	cx
		push	si
		push	cs
		call	near ptr sub_11C00
		pop	cx
		mov	[bp+var_2], al
		cmp	[bp+var_2], 1
		jz	short loc_12C5C
		cmp	[bp+var_2], 2
		jnz	short loc_12C2C

loc_12C5C:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_12C16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12C62		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_111B3
		pop	cx
		mov	[bp+var_2], al
		mov	ax, 1388h
		call	Math_RandomScale_39596
		add	ax, 1388h
		movsx	eax, ax
		mov	[si+82h], eax
		mov	di, 1
		jmp	short loc_12C90

loc_12C8F:
		inc	di

loc_12C90:
		mov	bx, di
		imul	bx, bx, 7
		cmp	byte ptr [bx+0DDAh], 0
		jnz	short loc_12C8F
		mov	ax, di
		dec	ax
		call	Math_RandomScale_39596
		inc	ax
		mov	[si+8Ah], ax
		mov	ax, 3
		call	Math_RandomScale_39596
		mov	[si+92h], ax
		mov	ax, 64h
		call	Math_RandomScale_39596
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 32h
		jge	short loc_12D17
		mov	ax, di
		call	Math_RandomScale_39596
		mov	[si+8Ch], ax
		mov	ax, 3
		call	Math_RandomScale_39596
		mov	[si+94h], ax
		cmp	[bp+var_4], 23h
		jge	short loc_12D17
		mov	ax, di
		call	Math_RandomScale_39596
		mov	[si+8Eh], ax
		mov	ax, 3
		call	Math_RandomScale_39596
		mov	[si+96h], ax
		cmp	[bp+var_4], 14h
		jge	short loc_12D17
		mov	ax, di
		call	Math_RandomScale_39596
		mov	[si+90h], ax
		mov	ax, 3
		call	Math_RandomScale_39596
		mov	[si+98h], ax

loc_12D17:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_12C62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12D1E		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	2FDh
		call	sub_A455
		pop	cx
		push	si
		push	cs
		call	near ptr sub_111B3
		pop	cx
		mov	[bp+var_2], al
		pop	si
		leave
		retf
sub_12D1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12D3D		proc far

var_272		= word ptr -272h
var_270		= word ptr -270h
var_268		= byte ptr -268h
var_260		= word ptr -260h
var_258		= word ptr -258h
var_256		= byte ptr -256h
var_255		= dword ptr -255h
var_251		= dword ptr -251h
var_24D		= dword ptr -24Dh
var_249		= word ptr -249h
var_247		= word ptr -247h
var_245		= word ptr -245h
var_244		= word ptr -244h
var_242		= word ptr -242h
var_240		= dword ptr -240h
var_23C		= dword ptr -23Ch
var_238		= dword ptr -238h
var_234		= word ptr -234h
var_217		= dword ptr -217h
var_213		= dword ptr -213h
var_20F		= dword ptr -20Fh
var_20B		= word ptr -20Bh
var_209		= word ptr -209h
var_1F6		= word ptr -1F6h
var_1EC		= word ptr -1ECh
var_1E2		= word ptr -1E2h
var_185		= dword ptr -185h
var_181		= dword ptr -181h
var_17D		= dword ptr -17Dh
var_175		= byte ptr -175h
var_16C		= dword ptr -16Ch
var_13A		= word ptr -13Ah
var_EA		= word ptr -0EAh
var_8D		= dword ptr -8Dh
var_89		= dword ptr -89h
var_85		= dword ptr -85h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_42		= word ptr -42h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_32		= dword ptr -32h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 272h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_EA], 9B5h
		mov	[bp+var_89], 100h
		mov	[bp+var_8D], 0
		mov	[bp+var_EA], 9CDh
		mov	[bp+var_6E], 0
		xor	ax, ax
		mov	[bp+var_70], ax
		movsx	eax, ax
		mov	[bp+var_85], eax
		mov	[bp+var_EA], 0B14h
		push	0
		push	11BDh
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_ReadDispatch_5274A
		add	sp, 6
		mov	al, 0
		cmp	word ptr [si+0A0h], 4
		jz	short loc_12DA9
		jmp	loc_12E73

loc_12DA9:
		push	ds
		push	offset aIFF
		push	ds
		push	offset aGauntlet
		push	ds
		push	offset aDataMissions
		lea	ax, [bp+var_13A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_1E2]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_1E2], 9B5h
		mov	[bp+var_181], 100h
		mov	[bp+var_185], 0
		mov	[bp+var_1E2], 9CDh
		push	1
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_1E2]
		push	ax
		mov	bx, [bp+var_1E2]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1E2]
		push	ax
		call	sub_541A0
		pop	cx
		push	large 0
		push	large dword_5AEF2
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C4A
		add	sp, 0Ah
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C4F
		pop	cx
		lea	ax, [bp+var_1E2]
		push	ax
		push	large dword_5AEF7
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C9A
		add	sp, 8
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C59
		pop	cx
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		mov	[bp+var_1E2], 9CDh
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_1E2]
		jmp	loc_13660

loc_12E73:
		cmp	word ptr [si+0A0h], 1
		jz	short loc_12E81
		cmp	word ptr [si+0A0h], 3
		jnz	short loc_12E8B

loc_12E81:
		push	ds
		push	offset aIFF
		push	ds
		push	offset aDogfight
		jmp	short loc_12E93

loc_12E8B:
		push	ds
		push	offset aIFF
		push	ds
		push	offset aBombrun

loc_12E93:
		push	ds
		push	offset aDataMissions
		lea	ax, [bp+var_13A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_1E2]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_1E2], 9B5h
		mov	[bp+var_181], 100h
		mov	[bp+var_185], 0
		mov	[bp+var_1E2], 9CDh
		push	1
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_1E2]
		push	ax
		mov	bx, [bp+var_1E2]
		call	dword ptr [bx+14h]
		add	sp, 6
		xor	di, di
		jmp	short loc_12EF6

loc_12EE7:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si+8Ah], 0
		jz	short loc_12EF5
		inc	[bp+var_2]

loc_12EF5:
		inc	di

loc_12EF6:
		cmp	di, 4
		jl	short loc_12EE7
		lea	ax, [bp+var_1E2]
		push	ax
		call	sub_541A0
		pop	cx
		push	large 0
		push	large dword_5AF0D
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C4A
		add	sp, 0Ah
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C4F
		pop	cx
		lea	ax, [bp+var_1E2]
		push	ax
		push	large dword_5AF12
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C9A
		add	sp, 8
		push	large 0
		push	large dword_5AF17
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	0
		push	large dword_5AF1C
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_1E2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C77
		add	sp, 4
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx
		mov	eax, [bp+var_16C]
		mov	[bp+var_17D], eax
		mov	[bp+var_175], 0
		lea	ax, [bp+var_1E2]
		push	ax
		push	large dword_5AF21
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C9A
		add	sp, 8
		push	large 0
		push	large dword_5AF26
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	0
		push	large dword_5AF2B
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		push	large 9
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_RecordCount_542E5
		add	sp, 6
		mov	[bp+var_4], ax
		lea	ax, [bp+var_1E2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C77
		add	sp, 4
		cmp	word ptr [si+0A0h], 1
		jz	short loc_13005
		cmp	word ptr [si+0A0h], 3
		jnz	short loc_1306C

loc_13005:
		xor	di, di
		jmp	short loc_13067

loc_13009:
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+8Ah]
		mov	word ptr [bp+var_2A+2], ax
		cmp	word ptr [bp+var_2A+2], 0
		jz	short loc_13066
		mov	bx, word ptr [bp+var_2A+2]
		imul	bx, bx, 7
		cmp	byte ptr [bx+0DDAh], 0
		jz	short loc_13037
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si+92h]
		shl	bx, 1
		push	word ptr [bx+0E74h]
		jmp	short loc_1303A

loc_13037:
		push	1210h

loc_1303A:
		lea	ax, word ptr [bp+var_32]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	large [bp+var_85]
		push	large 9
		push	ss
		lea	ax, word ptr [bp+var_32]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 9

loc_13066:
		inc	di

loc_13067:
		cmp	di, 4
		jl	short loc_13009

loc_1306C:
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx
		mov	eax, [bp+var_16C]
		mov	[bp+var_17D], eax
		mov	[bp+var_175], 0
		push	large 0
		push	large dword_5AF37
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	0
		push	large dword_5AF3C
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_1E2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C77
		add	sp, 4
		lea	ax, [bp+var_1F6]
		push	ss
		push	ax
		push	ds
		push	offset unk_5AB9A
		mov	cx, 14h
		call	CRT_Fmemcpy
		mov	ax, [bp+var_2]
		mov	[bp+var_1EC], ax
		push	large [bp+var_85]
		push	large 14h
		push	ss
		lea	ax, [bp+var_1F6]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 14h
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx
		mov	eax, [bp+var_16C]
		mov	[bp+var_17D], eax
		mov	[bp+var_175], 0
		push	large 0
		push	large dword_5AF41
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	0
		push	large dword_5AF46
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		push	large 3Eh
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_RecordCount_542E5
		add	sp, 6
		mov	[bp+var_6], ax
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	eax, [si+82h]
		mov	[bp+var_E], eax
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	ecx, dword_5C596
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_A], eax
		cmp	dword ptr [si+82h], 0
		jz	short loc_13201
		cmp	word ptr [si+0A0h], 1
		jz	short loc_131B1
		cmp	word ptr [si+0A0h], 3
		jnz	short loc_131D0

loc_131B1:
		mov	[bp+var_1A], 0FF503800h
		mov	eax, [bp+var_1A]
		mov	[bp+var_217], eax
		mov	[bp+var_1E], 0FEE6C000h
		mov	eax, [bp+var_1E]
		jmp	short loc_131ED

loc_131D0:
		mov	[bp+var_22], 7D0000h
		mov	eax, [bp+var_22]
		mov	[bp+var_217], eax
		mov	[bp+var_26], 0FF486800h
		mov	eax, [bp+var_26]

loc_131ED:
		mov	[bp+var_213], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_20F], eax
		mov	[bp+var_209], 32h

loc_13201:
		cmp	dword ptr [si+82h], 0
		jz	short loc_13211
		mov	[bp+var_20B], 5Ah
		jmp	short loc_13217

loc_13211:
		mov	[bp+var_20B], 0

loc_13217:
		push	large [bp+var_85]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 3Eh
		mov	di, 1
		jmp	short loc_13275

loc_1323D:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	large [bp+var_85]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 3Eh
		inc	di

loc_13275:
		cmp	di, [bp+var_6]
		jl	short loc_1323D
		cmp	word ptr [si+0A0h], 1
		jz	short loc_1328B
		cmp	word ptr [si+0A0h], 3
		jz	short loc_1328B
		jmp	loc_13422

loc_1328B:
		mov	ax, [bp+var_4]
		mov	word ptr [bp+var_2A+2], ax
		mov	[bp+var_2C], 0FF54E800h
		mov	[bp+var_30], 0FEE6C000h
		mov	eax, [bp+var_A]
		mov	[bp+var_34], eax
		cmp	dword ptr [si+82h], 0
		jnz	short loc_132E0
		mov	[bp+var_38], 9C400h
		mov	eax, [bp+var_38]
		mov	edx, eax
		mov	ecx, dword_5C596
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		add	[bp+var_34], eax

loc_132E0:
		xor	di, di
		jmp	loc_1341A

loc_132E5:
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+8Ah]
		mov	[bp+var_42], ax
		cmp	[bp+var_42], 0
		jnz	short loc_132F9
		jmp	loc_13411

loc_132F9:
		mov	ax, word ptr [bp+var_2A+2]
		mov	[bp+var_272], ax
		push	8
		mov	bx, [bp+var_42]
		imul	bx, bx, 7
		push	word ptr [bx+0DD6h]
		lea	ax, [bp+var_270]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_268], 0
		push	8
		mov	bx, [bp+var_42]
		imul	bx, bx, 7
		push	word ptr [bx+0DD8h]
		lea	ax, [bp+var_260]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_258], 0FFFFh
		mov	[bp+var_256], 0
		mov	eax, [bp+var_2C]
		mov	[bp+var_255], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_251], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_24D], eax
		mov	[bp+var_249], 10Eh
		mov	bx, [bp+var_42]
		imul	bx, bx, 7
		cmp	byte ptr [bx+0DDAh], 0
		jz	short loc_13378
		mov	[bp+var_247], 32h
		jmp	short loc_1337E

loc_13378:
		mov	[bp+var_247], 23h

loc_1337E:
		mov	byte ptr [bp+var_245], 0FFh
		mov	[bp+var_244], 0FFFFh
		mov	[bp+var_242], 0
		mov	word ptr [bp+var_240], 0
		mov	word ptr [bp+var_240+2], 0
		mov	word ptr [bp+var_23C], 0FFFFh
		mov	bx, [bp+var_42]
		imul	bx, bx, 7
		cmp	byte ptr [bx+0DDAh], 0
		jz	short loc_133B6
		mov	word ptr [bp+var_23C+2], 1
		jmp	short loc_133BC

loc_133B6:
		mov	word ptr [bp+var_23C+2], 2

loc_133BC:
		mov	word ptr [bp+var_238], 3
		mov	word ptr [bp+var_238+2], 0FFFFh
		cmp	[bp+var_42], 13h
		jnz	short loc_133E5
		add	[bp+var_255], 7D000h
		mov	[bp+var_249], 0
		add	[bp+var_30], 25800h

loc_133E5:
		push	large [bp+var_85]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 3Eh
		add	[bp+var_30], 25800h
		inc	word ptr [bp+var_2A+2]

loc_13411:
		add	[bp+var_2C], 25800h
		inc	di

loc_1341A:
		cmp	di, 4
		jge	short loc_13422
		jmp	loc_132E5

loc_13422:
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx
		mov	eax, [bp+var_16C]
		mov	[bp+var_17D], eax
		mov	[bp+var_175], 0
		push	large 0
		push	large dword_5AF4B
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	0
		push	large dword_5AF50
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_1E2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C77
		add	sp, 4
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx
		mov	eax, [bp+var_16C]
		mov	[bp+var_17D], eax
		mov	[bp+var_175], 0
		push	large 0
		push	large dword_5AF55
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C4A
		add	sp, 0Ah
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C4F
		pop	cx
		push	0
		push	large dword_5AF5A
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		lea	ax, [bp+var_1E2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C81
		add	sp, 4
		cmp	word ptr [si+0A0h], 1
		jz	short loc_134E8
		cmp	word ptr [si+0A0h], 3
		jz	short loc_134E8
		jmp	loc_135C8

loc_134E8:
		push	large 0
		push	large dword_5AF5F
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		mov	byte ptr [bp+var_24D+1], 1
		mov	word ptr [bp+var_24D+2], 1
		mov	[bp+var_249], 0FFFFh
		mov	[bp+var_247], 0FFFFh
		mov	[bp+var_245], 0FFFFh
		mov	byte ptr [bp+var_244+1], 0
		mov	[bp+var_242], 0
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_240], eax
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_23C], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_238], eax
		push	large [bp+var_85]
		push	large 18h
		push	ss
		lea	ax, word ptr [bp+var_24D+1]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 18h
		mov	ax, [bp+var_6]
		mov	word ptr [bp+var_34], ax
		xor	di, di
		jmp	short loc_135B8

loc_13583:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si+8Ah], 0
		jz	short loc_135B7
		mov	ax, word ptr [bp+var_34]
		mov	word ptr [bp+var_38+2], ax
		inc	word ptr [bp+var_34]
		push	large [bp+var_85]
		push	large 2
		push	ss
		lea	ax, word ptr [bp+var_38+2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	[bp+var_85], 2

loc_135B7:
		inc	di

loc_135B8:
		cmp	di, 4
		jl	short loc_13583
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx

loc_135C8:
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C59
		pop	cx
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		push	large 0
		push	large dword_5AF64
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C45
		add	sp, 0Ah
		push	0
		push	large dword_5AF69
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_1E2]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C77
		add	sp, 4
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C63
		pop	cx
		mov	eax, [bp+var_16C]
		mov	[bp+var_17D], eax
		mov	[bp+var_175], 0
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_59C59
		pop	cx
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		mov	[bp+var_1E2], 9CDh
		lea	ax, [bp+var_1E2]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_1E2]

loc_13660:
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	[bp+var_EA], 9CDh
		lea	ax, [bp+var_EA]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_EA]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_12D3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1368D		proc far

var_A4		= word ptr -0A4h
var_A0		= word ptr -0A0h
var_29		= word ptr -29h
var_A		= word ptr -0Ah
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		mov	ax, [bp+arg_0]
		mov	byte_5ABAE, 1
		push	0
		push	6040h
		call	sub_13AF4
		add	sp, 4
		push	6040h
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		nop
		push	cs
		call	near ptr sub_13734
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		push	cs
		call	near ptr sub_E625
		pop	cx
		mov	[bp+var_1], al
		call	TextScrollDisplayB_ApplyHelperD_571DE
		cmp	[bp+var_1], 0
		jz	short loc_136DF
		lea	ax, [bp+var_A4]
		push	ax
		push	cs
		call	near ptr sub_12D3D
		pop	cx

loc_136DF:
		mov	byte_5ABAE, 0
		push	3E8h
		push	6040h
		call	sub_13C38
		add	sp, 4
		mov	al, [bp+var_1]
		mov	[bp+var_2], al
		mov	[bp+var_A], 124Eh
		lea	ax, [bp+var_A]
		push	ax
		call	sub_4870F
		pop	cx
		mov	[bp+var_A], 492h
		lea	ax, [bp+var_A]
		push	ax
		call	sub_4870F
		pop	cx
		lea	ax, [bp+var_29]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_A0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	al, [bp+var_2]
		leave
		retf
sub_1368D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13734		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_13754
		push	0A2h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_13754
		jmp	loc_137F5

loc_13754:
		mov	ax, si
		add	ax, 4
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	100h
		push	0
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	word ptr [si+9Ah], 492h
		xor	ax, ax
		mov	[si+9Eh], ax
		mov	[si+9Ch], ax
		mov	word ptr [si+9Ah], 124Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aMenus
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_50]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		mov	bx, [si+4]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	word ptr [si+0A0h], 0
		mov	dword ptr [si+82h], 0
		mov	word ptr [si+86h], 0
		mov	word ptr [si+88h], 0
		mov	word ptr [si+80h], 1
		xor	dx, dx
		jmp	short loc_137F0

loc_137DB:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+8Ah], 0
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+92h], 0
		inc	dx

loc_137F0:
		cmp	dx, 4
		jl	short loc_137DB

loc_137F5:
		mov	ax, si
		pop	si
		leave
		retf
sub_13734		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_137FA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1382C
		mov	word ptr [si], 124Eh
		push	si
		call	sub_4870F
		pop	cx
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_1382C
		push	si
		call	sub_33B
		pop	cx

loc_1382C:
		pop	di
		pop	si
		pop	bp
		retf
sub_137FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13830		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1388A
		mov	word ptr [si], 1252h
		cmp	byte ptr [si+9], 0
		jz	short loc_13869
		cmp	dword ptr [si+4], 0
		jz	short loc_13869
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_13869

loc_13869:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
sub_13830		endp

; START OF FUNCTION CHUNK FOR sub_13830
		db 0F7h, 0C7h, 1
; END OF FUNCTION CHUNK FOR sub_13830
seg024		ends
