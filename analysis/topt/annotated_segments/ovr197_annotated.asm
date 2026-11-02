ovr197		segment	para public 'OVERLAY' use16
		assume cs:ovr197
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_675A0		proc far
		push	bp
		mov	bp, sp
		push	si
		call	sub_439D0
		push	1
		call	sub_451DB
		add	sp, 2
		mov	si, ax
		or	si, si
		jz	short loc_675C4
		mov	ax, si
		mov	bx, 5
		cwd
		idiv	bx
		mov	word_4A51B, ax

loc_675C4:
		pop	si
		pop	bp
		retf
sub_675A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_675C7		proc far

var_174		= word ptr -174h
var_117		= dword ptr -117h
var_113		= dword ptr -113h
var_10E		= word ptr -10Eh
var_BE		= word ptr -0BEh
var_9C		= word ptr -9Ch
var_3F		= dword ptr -3Fh
var_3B		= dword ptr -3Bh
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 174h
		push	si
		push	di
		lea	ax, [bp+var_9C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_9C], 480h
		mov	[bp+var_3B], 100h
		mov	[bp+var_3F], 0
		mov	[bp+var_9C], 5BDh
		mov	al, byte_4DE12
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_67608
		call	TextScrollDisplayB_ApplyHelperD_4555C

loc_67608:
		mov	al, byte ptr [bp+arg_2]
		add	al, 41h
		mov	byte_4A533, al
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6766D
		push	ds
		push	offset aJoyDat
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_6766D
		push	1
		push	1B50h
		lea	ax, [bp+var_9C]
		push	ax
		mov	bx, [bp+var_9C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ss
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		lea	si, [bp+var_BE]
		mov	ax, ss
		mov	di, 6DB2h
		push	ds
		pop	es
		push	ds
		mov	ds, ax
		mov	cx, 11h
		rep movsw
		pop	ds
		jmp	loc_67C71

loc_6766D:
		call	sub_2D992
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	100h
		push	0
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		lea	ax, [bp+var_12]
		push	ax
		call	sub_34B67
		add	sp, 2
		mov	[bp+var_1A], 0
		mov	[bp+var_18], 0
		mov	[bp+var_16], 13Fh
		mov	[bp+var_14], 0C7h
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[bp+var_24], eax
		mov	[bp+var_20], 3
		mov	[bp+var_1F], 1
		mov	[bp+var_1E], 0
		mov	[bp+var_1E], 0FA00h
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_SaveRect_392F6
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	1B59h
		push	68AEh
		call	sub_48241
		add	sp, 4
		push	68AEh
		call	sub_243B1
		add	sp, 2
		push	ds
		push	offset aShp_2
		push	ds
		push	offset aJoycalib
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_10E]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		lea	ax, [bp+var_174]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_174], 480h
		mov	[bp+var_113], 100h
		mov	[bp+var_117], 0
		mov	[bp+var_174], 5BDh
		push	1
		lea	ax, [bp+var_10E]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		mov	bx, [bp+var_174]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_174]
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		push	1
		push	0
		push	3
		push	large [bp+var_32]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_36+2], dx
		mov	word ptr [bp+var_36], ax
		mov	eax, [bp+var_36]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 3
		mov	[bp+var_7], 1
		mov	[bp+var_6], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_6], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_2E]
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		lea	ax, [bp+var_174]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_174]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	[bp+var_29], 1
		jmp	loc_67B91

loc_67867:
		call	Joystick_InitCalibrationDefaults_45178
		push	0
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	87h
		push	5
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	8
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh
		push	11h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	ax, [bp+arg_2]
		inc	ax
		push	ax
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h
		push	32h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		jmp	short loc_678FF

loc_678FA:
		call	sub_439D0

loc_678FF:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_678FA
		jmp	short loc_67918

loc_67913:
		call	sub_439D0

loc_67918:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_67913
		push	[bp+arg_2]
		call	sub_451E9
		add	sp, 2
		jmp	short loc_6793E

loc_67939:
		call	sub_439D0

loc_6793E:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_67939
		push	8
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh
		push	11h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	ax, [bp+arg_2]
		add	ax, 2
		push	ax
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h
		push	2Dh
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		jmp	short loc_679B9

loc_679B4:
		call	sub_439D0

loc_679B9:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_679B4
		push	[bp+arg_2]
		call	Joystick_ComputeCalibrationRatio_45225
		add	sp, 2
		jmp	short loc_679DF

loc_679DA:
		call	sub_439D0

loc_679DF:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_679DA
		push	8
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh
		push	11h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		mov	ax, [bp+arg_2]
		shl	ax, 1
		add	ax, [bp+arg_2]
		add	ax, 3
		push	ax
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h
		push	3Bh
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		jmp	short loc_67A5A

loc_67A55:
		call	sub_439D0

loc_67A5A:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_67A55
		push	[bp+arg_2]
		call	sub_45207
		add	sp, 2
		jmp	short loc_67A80

loc_67A7B:
		call	sub_439D0

loc_67A80:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_67A7B
		push	1Eh
		push	20h
		push	20h
		call	Joystick_InterpolateCalibrationPercent_4529E
		add	sp, 6
		cmp	word_4F7A2, 0
		jz	short loc_67AC0
		cmp	word_4F7A6, 0
		jz	short loc_67AC0
		cmp	word_4F7A4, 0
		jz	short loc_67AC0
		cmp	word_4F7A8, 0
		jz	short loc_67AC0
		mov	[bp+var_29], 0

loc_67AC0:
		mov	al, [bp+var_29]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67B04
		push	0
		push	1B50h
		lea	ax, [bp+var_9C]
		push	ax
		mov	bx, [bp+var_9C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ds
		push	offset word_4F792
		lea	ax, [bp+var_9C]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		lea	ax, [bp+var_9C]
		push	ax
		call	sub_4123E
		add	sp, 2
		jmp	loc_67B91

loc_67B04:
		push	8
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	9Fh
		push	11h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	7
		push	0
		mov	al, [bp+var_8]
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0A2h
		push	1Fh
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		add	sp, 2
		push	7
		call	PIT_DelayLoop
		add	sp, 2
		call	sub_2159
		jmp	short loc_67B7D

loc_67B78:
		call	sub_439D0

loc_67B7D:
		push	3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_67B78

loc_67B91:
		cmp	[bp+var_29], 0
		jz	short loc_67B9A
		jmp	loc_67867

loc_67B9A:
		push	0
		call	sub_450F2
		add	sp, 2
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_RestoreRect_38CDA
		add	sp, 8
		call	sub_2D9AA
		cmp	[bp+var_1F], 0
		jz	short loc_67C19
		cmp	[bp+var_24], 0
		jz	short loc_67C19
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_67C19

loc_67C19:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7], 0
		jz	short loc_67C5D
		cmp	[bp+var_C], 0
		jz	short loc_67C5D
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_67C5D

loc_67C5D:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0

loc_67C71:
		cmp	[bp+var_1], 0
		jz	short loc_67C7C
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_67C7C:
		push	0
		lea	ax, [bp+var_9C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_675C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67C8F		proc far

var_DC		= word ptr -0DCh
var_7F		= dword ptr -7Fh
var_7B		= dword ptr -7Bh
var_76		= word ptr -76h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0DCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_4A514
		mov	ah, 0
		or	ax, ax
		jz	short loc_67CA7
		jmp	loc_67F51

loc_67CA7:
		push	6D9Ch
		call	Stopwatch_RegisterTickModule_44C33
		add	sp, 2
		mov	byte_4EF07, 0
		mov	byte_4EF06, 0
		push	1
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_67CDD
		push	[bp+var_2]
		call	sub_443D7
		add	sp, 2
		mov	ax, [bp+var_2]
		jmp	short loc_67CE0

loc_67CDD:
		mov	ax, [bp+var_2]

loc_67CE0:
		mov	[si+14h], ax
		push	50h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+16h], ax
		push	14h
		push	ds
		push	word ptr [si+16h]
		push	0
		call	Keyboard_RegisterOrInitHandlerTable_441D7
		add	sp, 8
		mov	[si+18h], ax
		push	0
		call	sub_44E57
		add	sp, 2
		mov	[si+1Ah], ax
		push	1
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_4], ax
		or	ax, ax
		jz	short loc_67D31
		push	[bp+var_4]
		call	TextScrollDisplay_Construct_44889
		add	sp, 2
		mov	ax, [bp+var_4]
		jmp	short loc_67D34

loc_67D31:
		mov	ax, [bp+var_4]

loc_67D34:
		mov	[si+20h], ax
		push	seg stub197
		push	offset sub_47BF0
		push	1
		push	14h
		push	7
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+1Ch], ax
		push	14h
		push	word ptr [si+1Ch]
		push	0
		call	TextScroll_Construct_445E1
		add	sp, 6
		mov	[si+1Eh], ax
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aMouse
		push	0
		push	0
		lea	ax, [bp+var_76]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DC], 480h
		mov	[bp+var_7B], 100h
		mov	[bp+var_7F], 0
		mov	[bp+var_DC], 5BDh
		push	1
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		mov	bx, [bp+var_DC]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_C], eax
		push	1
		push	8
		push	2
		push	large [bp+var_C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_C]
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		cmp	[bp+var_8], 0
		jnz	short loc_67E30
		jmp	loc_67ED0

loc_67E30:
		xor	ax, ax
		mov	[bp+var_14], ax
		mov	[bp+var_12], ax
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		call	sub_38B8C
		mov	[bp+var_1E], ax
		xor	di, di
		jmp	short loc_67E82

loc_67E4A:
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	0
		push	0
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		push	di
		call	sub_35BAA
		mov	ax, [bp+var_18]
		sub	ax, [bp+var_1C]
		inc	ax
		mov	dx, ax
		cmp	dx, [bp+var_12]
		jle	short loc_67E70
		mov	[bp+var_12], dx

loc_67E70:
		mov	ax, [bp+var_16]
		sub	ax, [bp+var_1A]
		inc	ax
		mov	bx, ax
		cmp	bx, [bp+var_14]
		jle	short loc_67E81
		mov	[bp+var_14], bx

loc_67E81:
		inc	di

loc_67E82:
		cmp	di, [bp+var_1E]
		jl	short loc_67E4A
		mov	ax, [bp+var_12]
		imul	[bp+var_14]
		movsx	eax, ax
		mov	[bp+var_22], eax
		push	1
		push	8
		push	2
		push	large [bp+var_22]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2], dx
		mov	word ptr [bp+var_26], ax
		mov	eax, [bp+var_26]
		mov	[si+0Ah], eax
		mov	byte ptr [si+0Eh], 2
		mov	byte ptr [si+0Fh], 1
		mov	dword ptr [si+10h], 0
		mov	eax, [bp+var_22]
		mov	[si+10h], eax

loc_67ED0:
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	UIScreen_SetWidgetValue_4550C
		add	sp, 4
		push	0
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		push	6524h
		call	TextScrollDisplayB_InitAndRegister_4541A
		add	sp, 2
		push	0
		push	word_4D36E
		call	TextScrollDisplayB_ApplyHelperA_45482
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_45522
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word ptr [bp+var_8+2], 0
		jmp	short loc_67F3D

loc_67F18:
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		call	sub_45168
		add	sp, 2
		or	al, al
		jz	short loc_67F32
		mov	bx, word ptr [bp+var_8+2]
		mov	byte ptr [bx+652Ah], 1
		jmp	short loc_67F3A

loc_67F32:
		mov	bx, word ptr [bp+var_8+2]
		mov	byte ptr [bx+652Ah], 0

loc_67F3A:
		inc	word ptr [bp+var_8+2]

loc_67F3D:
		cmp	word ptr [bp+var_8+2], 2
		jl	short loc_67F18
		push	cs
		call	near ptr sub_675A0
		mov	byte_4A514, 1
		call	sub_A6F9

loc_67F51:
		pop	di
		pop	si
		leave
		retf
sub_67C8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67F55		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_4A514, 0
		jnz	short loc_67F66
		jmp	loc_68056

loc_67F66:
		push	word ptr [si+1Ch]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+1Ch], 0
		cmp	word ptr [si+1Eh], 0
		jz	short loc_67F94
		push	word ptr [si+1Eh]
		call	sub_44B7D
		add	sp, 2
		push	word ptr [si+1Eh]
		call	sub_39C
		add	sp, 2
		jmp	short loc_67F94

loc_67F94:
		mov	word ptr [si+1Eh], 0
		cmp	word ptr [si+20h], 0
		jz	short loc_67FB9
		push	0
		push	word ptr [si+20h]
		call	TextScrollDisplay_Destruct_448AC
		add	sp, 4
		push	word ptr [si+20h]
		call	sub_39C
		add	sp, 2
		jmp	short loc_67FB9

loc_67FB9:
		mov	word ptr [si+20h], 0
		push	3
		push	word ptr [si+1Ah]
		call	sub_44F0C
		add	sp, 4
		mov	word ptr [si+1Ah], 0
		push	3
		push	word ptr [si+18h]
		call	Keyboard_UnregisterHandlerTable_4427F
		add	sp, 4
		mov	word ptr [si+18h], 0
		push	word ptr [si+16h]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+16h], 0
		cmp	word ptr [si+14h], 0
		jz	short loc_68012
		push	0
		push	word ptr [si+14h]
		call	InputBinding_Destruct_443FA
		add	sp, 4
		push	word ptr [si+14h]
		call	sub_39C
		add	sp, 2
		jmp	short loc_68012

loc_68012:
		mov	word ptr [si+14h], 0
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_6803D
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_6803D
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6803D

loc_6803D:
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		mov	byte_4A514, 0

loc_68056:
		pop	si
		pop	bp
		retf
sub_67F55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68059		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_6806B
		jmp	loc_680EF

loc_6806B:
		push	si
		push	cs
		call	near ptr sub_67F55
		add	sp, 2
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_68099
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_68099
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_68099

loc_68099:
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		cmp	byte ptr [si+5], 0
		jz	short loc_680CD
		cmp	dword ptr [si], 0
		jz	short loc_680CD
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_680CD

loc_680CD:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_680EF
		push	si
		call	sub_39C
		add	sp, 2

loc_680EF:
		pop	di
		pop	si
		pop	bp
		retf
sub_68059		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_680F3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6810E
		push	7
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_68116

loc_6810E:
		mov	ax, si
		add	ax, 6
		mov	byte ptr [si], 0

loc_68116:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_680F3		endp

; START OF FUNCTION CHUNK FOR sub_680F3
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_680F3
ovr197		ends
