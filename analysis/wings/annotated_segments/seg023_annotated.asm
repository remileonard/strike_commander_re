seg023		segment	para public 'CODE' use16
		assume cs:seg023
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 33h, 0C0h

loc_D332:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D335		proc far

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
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= byte ptr  18h
arg_14		= byte ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	ax, [bp+arg_4]
		mov	cx, [bp+arg_10]
		mov	ax, [bp+arg_C]
		sub	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	bx, ax
		mov	ax, [bp+arg_E]
		sub	ax, [bp+arg_A]
		mov	[bp+var_C], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		cmp	bx, dx
		jge	short loc_D36A
		jmp	loc_D43C

loc_D36A:
		shl	ax, 1
		mov	[bp+var_4], ax
		sub	ax, bx
		mov	[bp+var_2], ax
		sub	ax, bx
		mov	[bp+var_6], ax
		movsx	eax, cx
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_8]
		movsx	edx, dx
		imul	eax, edx
		sar	eax, 0Ch
		mov	dx, [bp+arg_8]
		add	dx, ax
		mov	[bp+var_8], dx
		mov	si, [bp+arg_8]
		mov	di, [bp+arg_A]

loc_D39D:
		mov	al, [bp+arg_14]
		push	ax
		push	di
		push	si
		push	[bp+arg_6]
		call	Render_SetPixelClipped_49D9A
		add	sp, 8
		jmp	short loc_D40B

loc_D3B0:
		mov	ax, [bp+arg_C]
		cmp	ax, [bp+arg_8]
		jle	short loc_D3BB
		inc	si
		jmp	short loc_D3BC

loc_D3BB:
		dec	si

loc_D3BC:
		cmp	[bp+var_2], 0
		jge	short loc_D3C7
		mov	ax, [bp+var_4]
		jmp	short loc_D3D6

loc_D3C7:
		mov	ax, [bp+arg_E]
		cmp	ax, [bp+arg_A]
		jle	short loc_D3D2
		inc	di
		jmp	short loc_D3D3

loc_D3D2:
		dec	di

loc_D3D3:
		mov	ax, [bp+var_6]

loc_D3D6:
		add	[bp+var_2], ax
		cmp	[bp+arg_12], 2
		jb	short loc_D39D
		mov	al, [bp+arg_12]
		mov	ah, 0
		sar	ax, 1
		mov	bl, al
		mov	al, [bp+arg_14]
		push	ax
		mov	al, bl
		mov	ah, 0
		mov	dx, di
		add	dx, ax
		push	dx
		push	si
		mov	al, bl
		mov	ah, 0
		mov	dx, di
		sub	dx, ax
		push	dx
		push	si
		push	[bp+arg_6]
		call	sub_49BA2
		add	sp, 0Ch

loc_D40B:
		mov	ax, si
		sub	ax, [bp+var_8]
		mov	[bp+var_E], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jg	short loc_D3B0
		mov	[bp+var_16], si
		mov	[bp+var_18], di
		mov	ax, [bp+var_16]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_12], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_14]
		mov	[bx], ax
		mov	ax, [bp+var_12]
		jmp	loc_D50D

loc_D43C:
		mov	ax, bx
		shl	ax, 1
		mov	[bp+var_4], ax
		sub	ax, dx
		mov	[bp+var_2], ax
		sub	ax, dx
		mov	[bp+var_6], ax
		movsx	eax, cx
		mov	dx, [bp+arg_E]
		sub	dx, [bp+arg_A]
		movsx	edx, dx
		imul	eax, edx
		sar	eax, 0Ch
		mov	dx, [bp+arg_A]
		add	dx, ax
		mov	[bp+var_8], dx
		mov	si, [bp+arg_8]
		mov	di, [bp+arg_A]

loc_D471:
		mov	al, [bp+arg_14]
		push	ax
		push	di
		push	si
		push	[bp+arg_6]
		call	Render_SetPixelClipped_49D9A
		add	sp, 8
		jmp	short loc_D4DF

loc_D484:
		mov	ax, [bp+arg_E]
		cmp	ax, [bp+arg_A]
		jle	short loc_D48F
		inc	di
		jmp	short loc_D490

loc_D48F:
		dec	di

loc_D490:
		cmp	[bp+var_2], 0
		jge	short loc_D49B
		mov	ax, [bp+var_4]
		jmp	short loc_D4AA

loc_D49B:
		mov	ax, [bp+arg_C]
		cmp	ax, [bp+arg_8]
		jle	short loc_D4A6
		inc	si
		jmp	short loc_D4A7

loc_D4A6:
		dec	si

loc_D4A7:
		mov	ax, [bp+var_6]

loc_D4AA:
		add	[bp+var_2], ax
		cmp	[bp+arg_12], 2
		jb	short loc_D471
		mov	al, [bp+arg_12]
		mov	ah, 0
		sar	ax, 1
		mov	bl, al
		mov	al, [bp+arg_14]
		push	ax
		push	di
		mov	al, bl
		mov	ah, 0
		mov	dx, si
		add	dx, ax
		push	dx
		push	di
		mov	al, bl
		mov	ah, 0
		mov	dx, si
		sub	dx, ax
		push	dx
		push	[bp+arg_6]
		call	sub_49BA2
		add	sp, 0Ch

loc_D4DF:
		mov	ax, di
		sub	ax, [bp+var_8]
		mov	[bp+var_10], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jg	short loc_D484
		mov	[bp+var_16], si
		mov	[bp+var_18], di
		mov	ax, [bp+var_16]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_12], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_14]
		mov	[bx], ax
		mov	ax, [bp+var_12]

loc_D50D:
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_D335		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D51A		proc far

var_4CE		= word ptr -4CEh
var_4CC		= word ptr -4CCh
var_4B8		= byte ptr -4B8h
var_4B4		= word ptr -4B4h
var_4A4		= word ptr -4A4h
var_4A2		= word ptr -4A2h
var_4A0		= word ptr -4A0h
var_49C		= word ptr -49Ch
var_49A		= word ptr -49Ah
var_498		= word ptr -498h
var_496		= word ptr -496h
var_494		= word ptr -494h
var_492		= word ptr -492h
var_48E		= word ptr -48Eh
var_47D		= dword ptr -47Dh
var_47B		= dword ptr -47Bh
var_470		= word ptr -470h
var_45F		= dword ptr -45Fh
var_45D		= dword ptr -45Dh
var_452		= word ptr -452h
var_441		= dword ptr -441h
var_43F		= dword ptr -43Fh
var_434		= word ptr -434h
var_423		= dword ptr -423h
var_421		= dword ptr -421h
var_416		= word ptr -416h
var_405		= dword ptr -405h
var_403		= dword ptr -403h
var_3F8		= word ptr -3F8h
var_3E7		= dword ptr -3E7h
var_3E5		= dword ptr -3E5h
var_3DA		= word ptr -3DAh
var_3C9		= dword ptr -3C9h
var_3C7		= dword ptr -3C7h
var_3BC		= word ptr -3BCh
var_344		= word ptr -344h
var_2CC		= word ptr -2CCh
var_27C		= word ptr -27Ch
var_21F		= dword ptr -21Fh
var_21B		= dword ptr -21Bh
var_217		= dword ptr -217h
var_206		= dword ptr -206h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1BC		= word ptr -1BCh
var_1BA		= word ptr -1BAh
var_1B8		= word ptr -1B8h
var_E4		= word ptr -0E4h
var_E0		= word ptr -0E0h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= word ptr -0D2h
var_D0		= word ptr -0D0h
var_CE		= word ptr -0CEh
var_CC		= word ptr -0CCh
var_CA		= word ptr -0CAh
var_C8		= word ptr -0C8h
var_C6		= word ptr -0C6h
var_C4		= word ptr -0C4h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= word ptr -78h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= byte ptr -6Eh
var_6D		= word ptr -6Dh
var_6A		= word ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= byte ptr -40h
var_3F		= byte ptr -3Fh
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
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
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4CEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_603DE, 0
		jz	short loc_D530
		jmp	loc_E4B4

loc_D530:
		push	seg seg023
		push	offset sub_E4B8
		push	large 1000Ah
		push	18h
		lea	ax, [bp+var_1D4]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_6], 1000h
		lea	ax, [bp+var_27C]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_27C], 9B5h
		mov	[bp+var_21B], 100h
		mov	[bp+var_21F], 0
		mov	[bp+var_27C], 9CDh
		mov	[bp+var_200], 0
		xor	ax, ax
		mov	[bp+var_202], ax
		movsx	eax, ax
		mov	[bp+var_217], eax
		push	1
		mov	ax, si
		add	ax, 57h
		push	ax
		lea	ax, [bp+var_27C]
		push	ax
		mov	bx, [bp+var_27C]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_7], 0
		push	0
		push	large 444C5257h
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_D5C8
		jmp	loc_D6ED

loc_D5C8:
		jmp	short loc_D604

loc_D5CA:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	dl, [bp+arg_2]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_D5F9
		mov	[bp+var_7], 1
		jmp	short loc_D61D

loc_D5F9:
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_D604:
		push	1
		push	large 5350414Dh
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_D5CA

loc_D61D:
		cmp	[bp+var_7], 0
		jnz	short loc_D626
		jmp	loc_D6E9

loc_D626:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_1], al
		mov	byte ptr [bp+var_7C+3], 0
		jmp	short loc_D6A9

loc_D64F:
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dl, byte ptr [bp+var_7C+3]
		mov	dh, 0
		imul	dx, dx, 18h
		lea	bx, [bp+var_1D4]
		add	dx, bx
		mov	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dl, byte ptr [bp+var_7C+3]
		mov	dh, 0
		imul	dx, dx, 18h
		lea	bx, [bp+var_1D2]
		add	dx, bx
		mov	bx, dx
		mov	[bx], ax
		push	ds
		mov	al, byte ptr [bp+var_7C+3]
		mov	ah, 0
		imul	ax, ax, 18h
		lea	dx, [bp+var_1D0]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReadViaHelper_54058
		add	sp, 6
		inc	byte ptr [bp+var_7C+3]

loc_D6A9:
		mov	al, byte ptr [bp+var_7C+3]
		cmp	al, [bp+var_1]
		jb	short loc_D64F
		mov	eax, [bp+var_206]
		mov	[bp+var_217], eax
		push	0
		push	large 44455053h
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_D6FA
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		jmp	short loc_D6FA

loc_D6E9:
		push	13h
		jmp	short loc_D6EF

loc_D6ED:
		push	14h

loc_D6EF:
		push	0DBAh
		call	sub_9D78
		add	sp, 4

loc_D6FA:
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		mov	[bp+var_8], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_2CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_2CC]
		push	ax
		lea	ax, [bp+var_344]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_2CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_2CC]
		push	ax
		lea	ax, [bp+var_3BC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_44], 0
		mov	[bp+var_40], 2
		mov	[bp+var_3F], 0
		mov	[bp+var_3E], 0
		mov	[bp+var_4E], 0
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		push	3
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	80h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	81h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	82h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	83h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	84h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	85h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	86h
		lea	ax, [bp+var_344]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_58], 0
		mov	[bp+var_54], 2
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	17h
		lea	ax, [bp+var_3BC]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aMapfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_2CC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_2CC]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_66+2], dx
		mov	word ptr [bp+var_66], ax
		mov	eax, [bp+var_66]
		mov	[bp+var_62], eax
		mov	[bp+var_5E], 2
		mov	[bp+var_5D], 1
		mov	[bp+var_5C], 0
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_12]
		push	ax
		lea	ax, [bp+var_3DA]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_3F8]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_416]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_434]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_452]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_470]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_48E]
		push	ax
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	[bp+var_49C], 0
		mov	[bp+var_49A], 0
		mov	[bp+var_498], 0
		mov	[bp+var_496], 0
		mov	[bp+var_494], 13Fh
		mov	[bp+var_492], 0C7h
		push	0
		lea	ax, [bp+var_49C]
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		lea	ax, [bp+var_49C]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_469A5
		add	sp, 4
		lea	ax, word ptr [bp+var_62]
		push	ax
		lea	ax, [bp+var_4B4]
		push	ax
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	[bp+var_4A4], 0
		mov	[bp+var_4A2], 0
		push	2Dh
		lea	ax, [bp+var_4B4]
		push	ax
		mov	bx, [bp+var_4B4]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_4A0], ax
		lea	ax, [bp+var_4B4]
		push	ax
		lea	ax, [bp+var_49C]
		push	ax
		lea	ax, [bp+var_4CE]
		push	ax
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	[bp+var_4B8], 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		mov	[bp+var_6D], 0
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	0
		push	[bp+var_70]
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		mov	ax, 0A0h
		sub	ax, [bp+var_1D4]
		mov	[bp+var_72], ax
		mov	di, 0A0h
		sub	di, [bp+var_1D2]
		call	sub_1F377
		mov	[bp+var_74], 0
		jmp	loc_E17A

loc_DA9A:
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D4]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_7C+2], ax
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D2]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_80+2], ax
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BC]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_7C], ax
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BA]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_80], ax
		mov	[bp+var_86], 3
		mov	ax, word ptr [bp+var_7C]
		sub	ax, word ptr [bp+var_7C+2]
		mov	[bp+var_98], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	[bp+var_8E], eax
		mov	ax, word ptr [bp+var_80]
		sub	ax, word ptr [bp+var_80+2]
		mov	[bp+var_9A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	[bp+var_92], eax
		cmp	eax, [bp+var_8E]
		jle	short loc_DB3C
		mov	eax, [bp+var_8E]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_92], eax

loc_DB3C:
		mov	eax, [bp+var_92]
		imul	eax, eax, 0Bh
		sar	eax, 5
		mov	edx, [bp+var_8E]
		add	edx, eax
		mov	[bp+var_8A], edx
		mov	eax, [bp+var_6]
		cdq
		idiv	[bp+var_8A]
		mov	[bp+var_9E], eax
		mov	[bp+var_A2], 0
		mov	ax, word ptr [bp+var_7C+2]
		mov	[bp+var_A8], ax
		mov	ax, word ptr [bp+var_80+2]
		mov	[bp+var_AA], ax
		mov	ax, [bp+var_A8]
		mov	word ptr [bp+var_A6], ax
		mov	ax, [bp+var_AA]
		mov	word ptr [bp+var_A6+2], ax
		xor	eax, eax
		mov	[bp+var_B2], eax
		mov	[bp+var_B6], eax

loc_DB9A:
		mov	[bp+var_B2], 3
		mov	eax, dword_5E7D3
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_9E]
		add	[bp+var_A2], eax
		cmp	[bp+var_A2], 1000h
		jle	short loc_DBCA
		mov	[bp+var_A2], 1000h

loc_DBCA:
		cmp	[bp+var_72], 0
		jle	short loc_DBD5
		mov	[bp+var_72], 0

loc_DBD5:
		cmp	[bp+var_72], 0FE0Fh
		jge	short loc_DBE1
		mov	[bp+var_72], 0FE0Fh

loc_DBE1:
		or	di, di
		jle	short loc_DBE7
		xor	di, di

loc_DBE7:
		cmp	di, 0FF13h
		jge	short loc_DBF0
		mov	di, 0FF13h

loc_DBF0:
		cmp	[bp+var_72], 0FF49h
		jge	short loc_DBFF
		cmp	di, 0FFDBh
		jle	short loc_DBFF
		mov	di, 0FFDBh

loc_DBFF:
		cmp	[bp+var_72], 0FEC0h
		jle	short loc_DC58
		cmp	di, 0FF38h
		jle	short loc_DC58
		mov	ax, [bp+var_72]
		mov	[bp+var_B8], ax
		mov	[bp+var_BA], di
		push	0
		cmp	byte ptr [bp+var_47B+2], 3
		jnz	short loc_DC39
		push	0
		mov	al, byte ptr [bp+var_47B+2]
		push	ax
		push	large [bp+var_47D]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DC42

loc_DC39:
		mov	edx, [bp+var_47B]
		mov	ax, word ptr [bp+var_47D]

loc_DC42:
		push	dx
		push	ax
		push	[bp+var_BA]
		push	[bp+var_B8]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DC58:
		cmp	[bp+var_72], 0FE0Fh
		jle	short loc_DCB9
		cmp	di, 0FF13h
		jle	short loc_DCB9
		mov	ax, [bp+var_72]
		add	ax, 0B1h
		mov	[bp+var_BC], ax
		mov	ax, di
		add	ax, 25h
		mov	[bp+var_BE], ax
		push	0
		cmp	byte ptr [bp+var_3C7+2], 3
		jnz	short loc_DC9A
		push	0
		mov	al, byte ptr [bp+var_3C7+2]
		push	ax
		push	large [bp+var_3C9]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DCA3

loc_DC9A:
		mov	edx, [bp+var_3C7]
		mov	ax, word ptr [bp+var_3C9]

loc_DCA3:
		push	dx
		push	ax
		push	[bp+var_BE]
		push	[bp+var_BC]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DCB9:
		cmp	[bp+var_72], 0FE0Fh
		jle	short loc_DD19
		cmp	di, 0FFDBh
		jge	short loc_DD19
		mov	ax, [bp+var_72]
		add	ax, 0B1h
		mov	[bp+var_C0], ax
		mov	ax, di
		add	ax, 0EDh
		mov	[bp+var_C2], ax
		push	0
		cmp	byte ptr [bp+var_3E5+2], 3
		jnz	short loc_DCFA
		push	0
		mov	al, byte ptr [bp+var_3E5+2]
		push	ax
		push	large [bp+var_3E7]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DD03

loc_DCFA:
		mov	edx, [bp+var_3E5]
		mov	ax, word ptr [bp+var_3E7]

loc_DD03:
		push	dx
		push	ax
		push	[bp+var_C2]
		push	[bp+var_C0]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DD19:
		cmp	[bp+var_72], 0FF4Fh
		jge	short loc_DD7A
		cmp	di, 0FF13h
		jle	short loc_DD7A
		mov	ax, [bp+var_72]
		add	ax, 1F1h
		mov	[bp+var_C4], ax
		mov	ax, di
		add	ax, 25h
		mov	[bp+var_C6], ax
		push	0
		cmp	byte ptr [bp+var_403+2], 3
		jnz	short loc_DD5B
		push	0
		mov	al, byte ptr [bp+var_403+2]
		push	ax
		push	large [bp+var_405]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DD64

loc_DD5B:
		mov	edx, [bp+var_403]
		mov	ax, word ptr [bp+var_405]

loc_DD64:
		push	dx
		push	ax
		push	[bp+var_C6]
		push	[bp+var_C4]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DD7A:
		cmp	[bp+var_72], 0FF4Fh
		jge	short loc_DDDA
		cmp	di, 0FFDBh
		jge	short loc_DDDA
		mov	ax, [bp+var_72]
		add	ax, 1F1h
		mov	[bp+var_C8], ax
		mov	ax, di
		add	ax, 0EDh
		mov	[bp+var_CA], ax
		push	0
		cmp	byte ptr [bp+var_421+2], 3
		jnz	short loc_DDBB
		push	0
		mov	al, byte ptr [bp+var_421+2]
		push	ax
		push	large [bp+var_423]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DDC4

loc_DDBB:
		mov	edx, [bp+var_421]
		mov	ax, word ptr [bp+var_423]

loc_DDC4:
		push	dx
		push	ax
		push	[bp+var_CA]
		push	[bp+var_C8]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DDDA:
		cmp	[bp+var_72], 0FE0Fh
		jle	short loc_DE36
		or	di, di
		jge	short loc_DE36
		mov	ax, [bp+var_72]
		mov	[bp+var_CC], ax
		mov	ax, di
		add	ax, 0C8h
		mov	[bp+var_CE], ax
		push	0
		cmp	byte ptr [bp+var_43F+2], 3
		jnz	short loc_DE17
		push	0
		mov	al, byte ptr [bp+var_43F+2]
		push	ax
		push	large [bp+var_441]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DE20

loc_DE17:
		mov	edx, [bp+var_43F]
		mov	ax, word ptr [bp+var_441]

loc_DE20:
		push	dx
		push	ax
		push	[bp+var_CE]
		push	[bp+var_CC]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DE36:
		cmp	di, 0FF13h
		jle	short loc_DE8B
		mov	ax, [bp+var_72]
		add	ax, 0B7h
		mov	[bp+var_D0], ax
		mov	[bp+var_D2], di
		push	0
		cmp	byte ptr [bp+var_45D+2], 3
		jnz	short loc_DE6C
		push	0
		mov	al, byte ptr [bp+var_45D+2]
		push	ax
		push	large [bp+var_45F]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_DE75

loc_DE6C:
		mov	edx, [bp+var_45D]
		mov	ax, word ptr [bp+var_45F]

loc_DE75:
		push	dx
		push	ax
		push	[bp+var_D2]
		push	[bp+var_D0]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_DE8B:
		mov	eax, [bp+var_A6]
		mov	[bp+var_AE], eax
		push	0F6h
		mov	al, byte ptr [bp+var_86]
		push	ax
		push	word ptr [bp+var_A2]
		mov	ax, word ptr [bp+var_80]
		add	ax, di
		push	ax
		mov	ax, word ptr [bp+var_7C]
		add	ax, [bp+var_72]
		push	ax
		mov	ax, word ptr [bp+var_80+2]
		add	ax, di
		push	ax
		mov	ax, word ptr [bp+var_7C+2]
		add	ax, [bp+var_72]
		push	ax
		push	word_5DD42
		push	si
		push	ss
		lea	ax, word ptr [bp+var_D6]
		push	ax
		push	cs
		call	near ptr sub_D335
		add	sp, 16h
		mov	eax, [bp+var_D6]
		mov	[bp+var_A6], eax
		mov	ax, [bp+var_72]
		sub	word ptr [bp+var_A6], ax
		sub	word ptr [bp+var_A6+2], di
		mov	[bp+var_E0], 0
		jmp	short loc_DF55

loc_DEEA:
		push	0F6h
		mov	al, byte ptr [bp+var_86]
		push	ax
		push	1000h
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BA]
		add	bx, ax
		mov	ax, [bx]
		add	ax, di
		push	ax
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BC]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D2]
		add	bx, ax
		mov	ax, [bx]
		add	ax, di
		push	ax
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D4]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		push	word_5DD42
		push	si
		push	ss
		lea	ax, [bp+var_E4]
		push	ax
		push	cs
		call	near ptr sub_D335
		add	sp, 16h
		inc	[bp+var_E0]

loc_DF55:
		mov	ax, [bp+var_E0]
		cmp	ax, [bp+var_74]
		jl	short loc_DEEA
		mov	[bp+var_E0], 0
		jmp	loc_DFF5

loc_DF67:
		push	0F6h
		push	large 20002h
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D2]
		add	bx, ax
		mov	ax, [bx]
		add	ax, di
		push	ax
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D4]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		push	word_5DD42
		call	sub_49512
		add	sp, 0Ch
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D2]
		add	bx, ax
		mov	ax, [bx]
		add	ax, di
		add	ax, 5
		push	ax
		mov	bx, [bp+var_E0]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1D4]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_4CE]
		push	ax
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		mov	ax, [bp+var_E0]
		imul	ax, ax, 18h
		lea	dx, [bp+var_1D0]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_4CE]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		inc	[bp+var_E0]

loc_DFF5:
		mov	ax, [bp+var_E0]
		cmp	ax, [bp+var_74]
		jg	short loc_E001
		jmp	loc_DF67

loc_E001:
		mov	dx, word ptr [bp+var_A6]
		sub	dx, word ptr [bp+var_AE]
		mov	bx, word ptr [bp+var_A6+2]
		sub	bx, word ptr [bp+var_AE+2]
		mov	cl, 1
		mov	[bp+var_81], 1
		mov	ax, word ptr [bp+var_A6]
		add	ax, [bp+var_72]
		cmp	ax, 46h
		jg	short loc_E028
		or	dx, dx
		jl	short loc_E03A

loc_E028:
		mov	ax, word ptr [bp+var_A6]
		add	ax, [bp+var_72]
		cmp	ax, 0FAh
		jl	short loc_E038
		or	dx, dx
		jg	short loc_E03A

loc_E038:
		mov	cl, 0

loc_E03A:
		mov	ax, word ptr [bp+var_A6+2]
		add	ax, di
		cmp	ax, 3Ch
		jg	short loc_E049
		or	bx, bx
		jl	short loc_E05D

loc_E049:
		mov	ax, word ptr [bp+var_A6+2]
		add	ax, di
		cmp	ax, 8Ch
		jl	short loc_E058
		or	bx, bx
		jg	short loc_E05D

loc_E058:
		mov	[bp+var_81], 0

loc_E05D:
		cmp	[bp+var_A2], 1000h
		jge	short loc_E078
		or	cl, cl
		jz	short loc_E06F
		sub	[bp+var_72], dx

loc_E06F:
		cmp	[bp+var_81], 0
		jz	short loc_E078
		sub	di, bx

loc_E078:
		push	word_5DD42
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_E09A
		mov	[bp+var_8], 1
		jmp	short loc_E0B3

loc_E09A:
		lea	ax, word ptr [bp+var_B6]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		cmp	[bp+var_A2], 1000h
		jge	short loc_E0B3
		jmp	loc_DB9A

loc_E0B3:
		cmp	[bp+var_8], 0
		jz	short loc_E0BC
		jmp	loc_E188

loc_E0BC:
		push	0F6h
		push	large 20002h
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BA]
		add	bx, ax
		mov	ax, [bx]
		add	ax, di
		push	ax
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BC]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		push	word_5DD42
		call	sub_49512
		add	sp, 0Ch
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BA]
		add	bx, ax
		mov	ax, [bx]
		add	ax, di
		add	ax, 5
		push	ax
		mov	bx, [bp+var_74]
		imul	bx, bx, 18h
		lea	ax, [bp+var_1BC]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_4CE]
		push	ax
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		mov	ax, [bp+var_74]
		imul	ax, ax, 18h
		lea	dx, [bp+var_1B8]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_4CE]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		push	word_5DD42
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		mov	[bp+var_DE], 0
		mov	[bp+var_DA], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_DE], eax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		inc	[bp+var_74]

loc_E17A:
		mov	al, [bp+var_1]
		mov	ah, 0
		dec	ax
		cmp	ax, [bp+var_74]
		jle	short loc_E188
		jmp	loc_DA9A

loc_E188:
		mov	al, [bp+var_8]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E1DC
		mov	[bp+var_80], 0
		mov	[bp+var_7C], 32h
		mov	eax, dword_5E7D3
		mov	[bp+var_80], eax
		jmp	short loc_E1C0

loc_E1AB:
		push	0FFh
		lea	ax, [bp+var_78]
		push	ax
		call	sub_55996
		add	sp, 4
		cmp	byte ptr [bp+var_78], 0
		jnz	short loc_E1DC

loc_E1C0:
		mov	eax, [bp+var_80]
		add	eax, [bp+var_7C]
		cmp	eax, dword_5E7D3
		ja	short loc_E1D4
		mov	ax, 1
		jmp	short loc_E1D6

loc_E1D4:
		xor	ax, ax

loc_E1D6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E1AB

loc_E1DC:
		lea	ax, [bp+var_70]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_4CC]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	sub_48B6C
		add	sp, 4
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_469CB
		pop	cx
		lea	ax, [bp+var_49C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_48E]
		push	ax
		call	sub_4607F
		add	sp, 4
		push	2
		lea	ax, [bp+var_470]
		push	ax
		call	sub_4607F
		add	sp, 4
		push	2
		lea	ax, [bp+var_452]
		push	ax
		call	sub_4607F
		add	sp, 4
		push	2
		lea	ax, [bp+var_434]
		push	ax
		call	sub_4607F
		add	sp, 4
		push	2
		lea	ax, [bp+var_416]
		push	ax
		call	sub_4607F
		add	sp, 4
		push	2
		lea	ax, [bp+var_3F8]
		push	ax
		call	sub_4607F
		add	sp, 4
		push	2
		lea	ax, [bp+var_3DA]
		push	ax
		call	sub_4607F
		add	sp, 4
		cmp	[bp+var_5D], 0
		jz	short loc_E2A2
		cmp	[bp+var_62], 0
		jz	short loc_E2A2
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E2A2

loc_E2A2:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_E2DA
		cmp	[bp+var_58], 0
		jz	short loc_E2DA
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E2DA

loc_E2DA:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		cmp	[bp+var_49], 0
		jz	short loc_E312
		cmp	[bp+var_4E], 0
		jz	short loc_E312
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E312

loc_E312:
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		cmp	[bp+var_3F], 0
		jz	short loc_E34A
		cmp	[bp+var_44], 0
		jz	short loc_E34A
		push	0
		mov	al, [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E34A

loc_E34A:
		mov	[bp+var_44], 0
		mov	[bp+var_3F], 0
		mov	[bp+var_3E], 0
		cmp	[bp+var_35], 0
		jz	short loc_E382
		cmp	[bp+var_3A], 0
		jz	short loc_E382
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E382

loc_E382:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		cmp	[bp+var_2B], 0
		jz	short loc_E3BA
		cmp	[bp+var_30], 0
		jz	short loc_E3BA
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E3BA

loc_E3BA:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_E3F2
		cmp	[bp+var_26], 0
		jz	short loc_E3F2
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E3F2

loc_E3F2:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_E42A
		cmp	[bp+var_1C], 0
		jz	short loc_E42A
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E42A

loc_E42A:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		cmp	[bp+var_D], 0
		jz	short loc_E462
		cmp	[bp+var_12], 0
		jz	short loc_E462
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_E462

loc_E462:
		mov	[bp+var_12], 0
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	2
		lea	ax, [bp+var_3BC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_344]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	[bp+var_27C], 9CDh
		lea	ax, [bp+var_27C]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_27C]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_E4B4:
		pop	di
		pop	si
		leave
		retf
sub_D51A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E4B8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_E4CE
		push	18h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_E4CE:
		mov	ax, dx
sub_E4B8		endp
seg023		ends
