ovr366		segment	para public 'OVERLAY' use16
		assume cs:ovr366
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CC810		proc far

var_184		= word ptr -184h
var_182		= word ptr -182h
var_16E		= byte ptr -16Eh
var_16A		= word ptr -16Ah
var_F2		= word ptr -0F2h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DA		= word ptr -0DAh
var_8A		= word ptr -8Ah
var_39		= byte ptr -39h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 184h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_8], 0
		push	seg seg008
		push	offset loc_62CD
		lea	ax, [bp+var_DA]
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
		lea	ax, [bp+var_DA]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_16], eax
		mov	[bp+var_12], 2
		mov	[bp+var_11], 1
		mov	[bp+var_10], 0
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_E2], 1
		mov	[bp+var_E0], 0
		push	2Dh
		lea	ax, [bp+var_F2]
		push	ax
		mov	bx, [bp+var_F2]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_DE], ax
		push	seg seg008
		push	offset loc_62D6
		lea	ax, [bp+var_DA]
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
		lea	ax, [bp+var_DA]
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		lea	ax, [bp+var_F2]
		push	ax
		push	si
		lea	ax, [bp+var_184]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	large 0C700E3h
		push	large 6E003Ah
		lea	ax, [bp+var_184]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	0
		lea	ax, [bp+var_16A]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_30], eax
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	large [bp+var_24]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_26], dx
		mov	[bp+var_28], ax
		cmp	[bp+var_30], 0
		jz	short loc_CC9A8
		jmp	loc_CCA31

loc_CC9A8:
		cmp	[bp+var_1F], 0
		jz	short loc_CC9CC
		cmp	[bp+var_24], 0
		jz	short loc_CC9CC
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CC9CC

loc_CC9CC:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		lea	ax, [bp+var_182]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_CCA2E
		cmp	[bp+var_16], 0
		jz	short loc_CCA2E
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	loc_CCC2C

loc_CCA2E:
		jmp	loc_CCC2C

loc_CCA31:
		mov	[bp+var_16E], 4
		xor	eax, eax
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[bp+var_39], 0
		call	Keyboard_DrainBufferBIOS_701E1
		call	sub_75750
		mov	byte ptr [bp+var_C], 0
		jmp	loc_CCAFE

loc_CCA56:
		mov	[bp+var_34], 1
		mov	eax, dword_7B29D
		mov	[bp+var_38], eax
		les	bx, [bp+var_28]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		push	3BA8h
		lea	ax, [bp+var_184]
		push	ax
		call	sub_75D4A
		add	sp, 6
		inc	[bp+var_2C]
		inc	[bp+var_28]
		mov	al, [bp+var_39]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CCAFE
		push	si
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_CCACE
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CCACE
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_CCACE

loc_CCACE:
		cmp	byte ptr [bp+var_8], 1
		jnz	short loc_CCAD8
		mov	[bp+var_39], 1

loc_CCAD8:
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_CCAE2
		mov	[bp+var_39], 1

loc_CCAE2:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_34]
		cmp	eax, dword_7B29D
		ja	short loc_CCAF6
		mov	ax, 1
		jmp	short loc_CCAF8

loc_CCAF6:
		xor	ax, ax

loc_CCAF8:
		mov	ah, 0
		or	ax, ax
		jz	short loc_CCAE2

loc_CCAFE:
		mov	eax, [bp+var_2C]
		cmp	eax, [bp+var_30]
		jge	short loc_CCB0B
		jmp	loc_CCA56

loc_CCB0B:
		mov	[bp+var_39], 0
		call	Keyboard_DrainBufferBIOS_701E1
		call	sub_75750
		mov	byte ptr [bp+var_C], 0
		push	si
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	[bp+var_34], 4B0h
		mov	eax, dword_7B29D
		mov	[bp+var_38], eax
		jmp	short loc_CCB82

loc_CCB3C:
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_CCB6E
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CCB6E
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_CCB6E

loc_CCB6E:
		cmp	byte ptr [bp+var_8], 2
		jnz	short loc_CCB78
		mov	[bp+var_39], 1

loc_CCB78:
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_CCB82
		mov	[bp+var_39], 1

loc_CCB82:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_34]
		cmp	eax, dword_7B29D
		ja	short loc_CCB96
		mov	ax, 1
		jmp	short loc_CCB98

loc_CCB96:
		xor	ax, ax

loc_CCB98:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CCBA7
		mov	al, [bp+var_39]
		mov	ah, 0
		or	ax, ax
		jz	short loc_CCB3C

loc_CCBA7:
		cmp	[bp+var_1F], 0
		jz	short loc_CCBCB
		cmp	[bp+var_24], 0
		jz	short loc_CCBCB
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CCBCB

loc_CCBCB:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		lea	ax, [bp+var_182]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_CCC2C
		cmp	[bp+var_16], 0
		jz	short loc_CCC2C
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CCC2C

loc_CCC2C:
		pop	si
		leave
		retf
sub_CC810		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CCC2F		proc far

var_2E2		= word ptr -2E2h
var_2E1		= word ptr -2E1h
var_2CE		= word ptr -2CEh
var_2CC		= word ptr -2CCh
var_2B4		= word ptr -2B4h
var_2B2		= word ptr -2B2h
var_29A		= word ptr -29Ah
var_298		= word ptr -298h
var_280		= word ptr -280h
var_27E		= word ptr -27Eh
var_266		= word ptr -266h
var_264		= word ptr -264h
var_262		= word ptr -262h
var_260		= word ptr -260h
var_25E		= word ptr -25Eh
var_25C		= word ptr -25Ch
var_259		= byte ptr -259h
var_258		= word ptr -258h
var_256		= word ptr -256h
var_254		= word ptr -254h
var_252		= word ptr -252h
var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_24A		= word ptr -24Ah
var_248		= word ptr -248h
var_246		= word ptr -246h
var_244		= word ptr -244h
var_242		= word ptr -242h
var_240		= word ptr -240h
var_23C		= word ptr -23Ch
var_22C		= word ptr -22Ch
var_22A		= word ptr -22Ah
var_228		= word ptr -228h
var_224		= word ptr -224h
var_1AC		= word ptr -1ACh
var_134		= word ptr -134h
var_120		= word ptr -120h
var_10C		= word ptr -10Ch
var_F8		= word ptr -0F8h
var_F7		= word ptr -0F7h
var_E4		= word ptr -0E4h
var_94		= word ptr -94h
var_43		= byte ptr -43h
var_42		= word ptr -42h
var_40		= byte ptr -40h
var_3E		= word ptr -3Eh
var_39		= byte ptr -39h
var_38		= word ptr -38h
var_34		= word ptr -34h
var_32		= byte ptr -32h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= word ptr -2Bh
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2E2h
		push	si
		mov	ax, [bp+arg_0]
		call	sub_75750
		mov	byte ptr [bp+var_F8], 0
		mov	[bp+var_2], 32h
		mov	[bp+var_4], 32h
		mov	[bp+var_6], 32h
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
		lea	ax, [bp+var_E4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_1AC]
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
		lea	ax, [bp+var_E4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_224]
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
		push	2Fh
		lea	ax, [bp+var_1AC]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 2
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	7
		lea	ax, [bp+var_224]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	seg seg008
		push	offset loc_62DB
		lea	ax, [bp+var_94]
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
		lea	ax, [bp+var_94]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[bp+var_24], eax
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 1
		mov	[bp+var_1E], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_23C]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_22C], 1
		mov	[bp+var_22A], 0
		push	2Dh
		lea	ax, [bp+var_23C]
		push	ax
		mov	bx, [bp+var_23C]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_228], ax
		mov	[bp+var_2B], 0
		lea	ax, word ptr [bp+var_1A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_34]
		push	ax
		call	sub_76245
		add	sp, 6
		push	[bp+var_2E]
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	sub_76272
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_34]
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	sub_76259
		add	sp, 8
		mov	[bp+var_24A], 0
		mov	[bp+var_248], 0
		mov	[bp+var_246], 0
		mov	[bp+var_244], 0
		mov	[bp+var_242], 13Fh
		mov	[bp+var_240], 0C7h
		push	0
		lea	ax, [bp+var_24A]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_258], 0
		mov	[bp+var_256], 0
		mov	[bp+var_254], 0
		mov	[bp+var_252], 0
		mov	[bp+var_250], 3Ah
		mov	[bp+var_24E], 29h
		push	0
		lea	ax, [bp+var_258]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_266], 0
		mov	[bp+var_264], 0
		mov	[bp+var_259], 0
		lea	ax, [bp+var_24A]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		call	sub_6735D
		add	sp, 4
		lea	ax, [bp+var_24A]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	[bp+var_262], 41h
		mov	[bp+var_260], 32h
		mov	[bp+var_25E], 7Bh
		mov	[bp+var_25C], 5Bh
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_24A]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D04
		add	sp, 6
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_24A]
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_75D04
		add	sp, 6
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_24A]
		push	ax
		lea	ax, [bp+var_2B4]
		push	ax
		call	sub_75D04
		add	sp, 6
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_24A]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	large 3C013Fh
		push	large 370043h
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		push	large 45013Fh
		push	large 400043h
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		push	large 4F013Fh
		push	large 4A0043h
		lea	ax, [bp+var_2B4]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		push	large 59013Fh
		push	large 540043h
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		xor	si, si
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0
		mov	al, [bp+var_C]
		push	ax
		push	large [bp+var_10]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0FFCEFFBFh
		lea	ax, [bp+var_258]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	al, [bp+var_C]
		push	ax
		push	large [bp+var_10]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	loc_CD3FA

loc_CD023:
		mov	ax, si
		or	ax, ax
		jz	short loc_CD039
		cmp	ax, 1
		jz	short loc_CD072
		cmp	ax, 2
		jnz	short loc_CD036
		jmp	loc_CD0D7

loc_CD036:
		jmp	loc_CD15D

loc_CD039:
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	seg seg008
		push	offset loc_62E3
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_F8]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_280]
		jmp	loc_CD154

loc_CD072:
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	seg seg008
		push	offset loc_62EB
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_10C]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_62E3
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_F8]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_29A]
		jmp	short loc_CD154

loc_CD0D7:
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	seg seg008
		push	offset loc_62EB
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_10C]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_120]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_62E3
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_F8]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_2B4]

loc_CD154:
		push	ax
		call	sub_75D4A
		add	sp, 0Ah

loc_CD15D:
		push	word_7AF7C
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_701E1

loc_CD172:
		call	sub_75755
		push	0FFh
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_6EF5A
		add	sp, 4
		cmp	byte ptr [bp+var_3E], 0
		jz	short loc_CD172
		mov	al, byte ptr [bp+var_3E+1]
		mov	[bp+var_40], al
		mov	ah, 0
		cmp	ax, 0Eh
		jz	short loc_CD1A6
		cmp	ax, 0Fh
		jz	short loc_CD210
		cmp	ax, 1Ch
		jz	short loc_CD210
		jmp	loc_CD2EE

loc_CD1A6:
		cmp	byte ptr [bp+var_3E], 1
		jz	short loc_CD1B5
		cmp	byte ptr [bp+var_3E], 4
		jz	short loc_CD1B5
		jmp	loc_CD3FA

loc_CD1B5:
		cmp	byte ptr [bp+var_F8], 0
		jz	short loc_CD1CF
		lea	ax, [bp+var_F8]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		lea	dx, [bp+var_F8]
		jmp	loc_CD3F3

loc_CD1CF:
		or	si, si
		jg	short loc_CD1D6
		jmp	loc_CD3FA

loc_CD1D6:
		dec	si
		mov	byte ptr [bp+var_F8], 0
		mov	ax, si
		or	ax, ax
		jz	short loc_CD1EF
		cmp	ax, 1
		jz	short loc_CD1F5
		cmp	ax, 2
		jz	short loc_CD1FB
		jmp	loc_CD3FA

loc_CD1EF:
		lea	ax, [bp+var_10C]
		jmp	short loc_CD1FF

loc_CD1F5:
		lea	ax, [bp+var_120]
		jmp	short loc_CD1FF

loc_CD1FB:
		lea	ax, [bp+var_134]

loc_CD1FF:
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_CD3FA

loc_CD210:
		cmp	byte ptr [bp+var_3E], 2
		jz	short loc_CD219
		jmp	loc_CD3FA

loc_CD219:
		cmp	byte ptr [bp+var_F8], 0
		jnz	short loc_CD223
		jmp	loc_CD3FA

loc_CD223:
		inc	si
		mov	ax, si
		cmp	ax, 1
		jz	short loc_CD23B
		cmp	ax, 2
		jz	short loc_CD284
		cmp	ax, 3
		jnz	short loc_CD238
		jmp	loc_CD2C4

loc_CD238:
		jmp	loc_CD2E6

loc_CD23B:
		mov	byte ptr [bp+var_10C], 0
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	seg seg008
		push	offset loc_62EB
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_F8]
		push	ax
		push	large 30000h
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		jmp	short loc_CD2E6

loc_CD284:
		mov	byte ptr [bp+var_120], 0
		push	seg seg008
		push	offset loc_62EB
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_F8]
		push	ax
		push	large 30000h
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_120]
		jmp	short loc_CD2DD

loc_CD2C4:
		cmp	[bp+var_40], 1Ch
		jz	short loc_CD2CF
		mov	si, 2
		jmp	short loc_CD2E6

loc_CD2CF:
		mov	byte ptr [bp+var_134], 0
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_134]

loc_CD2DD:
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_CD2E6:
		mov	byte ptr [bp+var_F8], 0
		jmp	loc_CD3FA

loc_CD2EE:
		cmp	byte ptr [bp+var_3E], 1
		jz	short loc_CD2FD
		cmp	byte ptr [bp+var_3E], 4
		jz	short loc_CD2FD
		jmp	loc_CD3FA

loc_CD2FD:
		mov	al, [bp+var_40]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+4B9Eh]
		cbw
		mov	[bp+var_42], ax
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_42], ax
		cmp	[bp+var_42], 41h
		jge	short loc_CD31F
		jmp	loc_CD3FA

loc_CD31F:
		cmp	[bp+var_42], 5Ah
		jle	short loc_CD328
		jmp	loc_CD3FA

loc_CD328:
		lea	ax, [bp+var_F8]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 13h
		jb	short loc_CD33B
		jmp	loc_CD3FA

loc_CD33B:
		lea	ax, [bp+var_F8]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_43], al
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_2E2]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_43]
		mov	ah, 0
		lea	dx, [bp+var_2E2]
		add	ax, dx
		mov	dl, byte ptr [bp+var_42]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_43]
		mov	ah, 0
		lea	dx, [bp+var_2E1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		mov	ax, si
		or	ax, ax
		jz	short loc_CD38F
		cmp	ax, 1
		jz	short loc_CD3A8
		cmp	ax, 2
		jz	short loc_CD3C1
		jmp	short loc_CD3FA

loc_CD38F:
		lea	ax, [bp+var_2E2]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D4F
		add	sp, 4
		cmp	ax, [bp+var_2]
		jg	short loc_CD3FA
		jmp	short loc_CD3D8

loc_CD3A8:
		lea	ax, [bp+var_2E2]
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_75D4F
		add	sp, 4
		cmp	ax, [bp+var_4]
		jg	short loc_CD3FA
		jmp	short loc_CD3D8

loc_CD3C1:
		lea	ax, [bp+var_2E2]
		push	ax
		lea	ax, [bp+var_2B4]
		push	ax
		call	sub_75D4F
		add	sp, 4
		cmp	ax, [bp+var_6]
		jg	short loc_CD3FA

loc_CD3D8:
		mov	al, [bp+var_43]
		mov	ah, 0
		lea	dx, [bp+var_F8]
		add	ax, dx
		mov	dl, byte ptr [bp+var_42]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_43]
		mov	ah, 0
		lea	dx, [bp+var_F7]

loc_CD3F3:
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_CD3FA:
		cmp	si, 3
		jz	short loc_CD402
		jmp	loc_CD023

loc_CD402:
		mov	[bp+var_39], 1
		jmp	short loc_CD428

loc_CD408:
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	si, ax
		cmp	byte ptr [bp+si+var_10C], 20h
		jnz	short loc_CD424
		mov	byte ptr [bp+si+var_10C], 0
		jmp	short loc_CD428

loc_CD424:
		mov	[bp+var_39], 0

loc_CD428:
		cmp	[bp+var_39], 0
		jnz	short loc_CD408
		push	seg seg008
		push	offset loc_62EB
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_10C]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_120]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_134]
		push	ax
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_2B4]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_62F2
		lea	ax, [bp+var_94]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	sub_75D4A
		add	sp, 8
		push	word_7AF7C
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Strupr_2EE0
		pop	cx
		mov	al, byte ptr [bp+var_10C]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	byte ptr [bp+var_10C], al
		mov	[bp+var_39], 1
		jmp	short loc_CD51A

loc_CD4FA:
		lea	ax, [bp+var_120]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	si, ax
		cmp	byte ptr [bp+si+var_120], 20h
		jnz	short loc_CD516
		mov	byte ptr [bp+si+var_120], 0
		jmp	short loc_CD51A

loc_CD516:
		mov	[bp+var_39], 0

loc_CD51A:
		cmp	[bp+var_39], 0
		jnz	short loc_CD4FA
		lea	ax, [bp+var_120]
		push	ax
		call	CRT_Strupr_2EE0
		pop	cx
		mov	al, byte ptr [bp+var_120]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	byte ptr [bp+var_120], al
		mov	[bp+var_39], 1
		jmp	short loc_CD561

loc_CD541:
		lea	ax, [bp+var_134]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	si, ax
		cmp	byte ptr [bp+si+var_134], 20h
		jnz	short loc_CD55D
		mov	byte ptr [bp+si+var_134], 0
		jmp	short loc_CD561

loc_CD55D:
		mov	[bp+var_39], 0

loc_CD561:
		cmp	[bp+var_39], 0
		jnz	short loc_CD541
		lea	ax, [bp+var_134]
		push	ax
		call	CRT_Strupr_2EE0
		pop	cx
		mov	al, byte ptr [bp+var_134]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	byte ptr [bp+var_134], al
		lea	ax, [bp+var_10C]
		push	ax
		push	0F94h
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_120]
		push	ax
		push	0FA8h
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_134]
		push	ax
		push	0FBCh
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_1AC]
		push	ax
		call	sub_6C2A4
		pop	cx
		lea	ax, [bp+var_224]
		push	ax
		call	sub_6C2A4
		pop	cx
		lea	ax, [bp+var_24A]
		push	ax
		push	cs
		call	near ptr sub_CC810
		pop	cx
		call	sub_75750
		lea	ax, [bp+var_2CC]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_2B2]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_298]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_27E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_38]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_266]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_258]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_24A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_7627C
		pop	cx
		push	2
		lea	ax, [bp+var_23C]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_1F], 0
		jz	short loc_CD675
		cmp	[bp+var_24], 0
		jz	short loc_CD675
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CD675

loc_CD675:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	[bp+var_15], 0
		jz	short loc_CD6AD
		cmp	[bp+var_1A], 0
		jz	short loc_CD6AD
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CD6AD

loc_CD6AD:
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		cmp	[bp+var_B], 0
		jz	short loc_CD6E5
		cmp	[bp+var_10], 0
		jz	short loc_CD6E5
		push	0
		mov	al, [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CD6E5

loc_CD6E5:
		mov	[bp+var_10], 0
		mov	[bp+var_B], 0
		mov	[bp+var_A], 0
		push	2
		lea	ax, [bp+var_224]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1AC]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	si
		leave
		retf
sub_CCC2F		endp
ovr366		ends
