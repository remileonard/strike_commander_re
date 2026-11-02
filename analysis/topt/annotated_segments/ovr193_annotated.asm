ovr193		segment	para public 'OVERLAY' use16
		assume cs:ovr193
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B390		proc far

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
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	ax, [bp+arg_C]
		sub	ax, [bp+arg_8]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_10]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_E]
		sub	ax, [bp+arg_A]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_12]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jge	short loc_5B3CE
		jmp	loc_5B4EB

loc_5B3CE:
		mov	ax, [bp+var_4]
		shl	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_2]
		mov	[bp+var_C], ax
		movsx	eax, [bp+arg_10]
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_8]
		movsx	edx, dx
		imul	eax, edx
		sar	eax, 0Ch
		mov	dx, [bp+arg_8]
		add	dx, ax
		mov	[bp+var_E], dx
		mov	di, [bp+arg_8]
		mov	ax, [bp+arg_A]
		mov	[bp+var_6], ax
		mov	al, [bp+arg_14]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+arg_6]
		call	Render_SetPixelClipped_3811A
		add	sp, 8
		jmp	short loc_5B4A1

loc_5B425:
		mov	ax, [bp+arg_C]
		cmp	ax, [bp+arg_8]
		jle	short loc_5B430
		inc	di
		jmp	short loc_5B431

loc_5B430:
		dec	di

loc_5B431:
		cmp	[bp+var_8], 0
		jge	short loc_5B43F
		mov	ax, [bp+var_A]
		add	[bp+var_8], ax
		jmp	short loc_5B455

loc_5B43F:
		mov	ax, [bp+arg_E]
		cmp	ax, [bp+arg_A]
		jle	short loc_5B44C
		inc	[bp+var_6]
		jmp	short loc_5B44F

loc_5B44C:
		dec	[bp+var_6]

loc_5B44F:
		mov	ax, [bp+var_C]
		add	[bp+var_8], ax

loc_5B455:
		cmp	[bp+arg_12], 2
		jnb	short loc_5B470
		mov	al, [bp+arg_14]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+arg_6]
		call	Render_SetPixelClipped_3811A
		add	sp, 8
		jmp	short loc_5B4A1

loc_5B470:
		mov	al, [bp+arg_12]
		mov	ah, 0
		sar	ax, 1
		mov	byte ptr [bp+var_18+1], al
		mov	al, [bp+arg_14]
		push	ax
		mov	al, byte ptr [bp+var_18+1]
		mov	ah, 0
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		push	di
		mov	al, byte ptr [bp+var_18+1]
		mov	ah, 0
		mov	dx, [bp+var_6]
		sub	dx, ax
		push	dx
		push	di
		push	[bp+arg_6]
		call	sub_37F22
		add	sp, 0Ch

loc_5B4A1:
		mov	ax, di
		sub	ax, [bp+var_E]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_14]
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jle	short loc_5B4B8
		jmp	loc_5B425

loc_5B4B8:
		mov	[bp+var_1C], di
		mov	ax, [bp+var_6]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_1E]
		mov	[bp+var_18], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_1A]
		mov	[bx], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_18]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
		jmp	loc_5B608

loc_5B4EB:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_4]
		mov	[bp+var_C], ax
		movsx	eax, [bp+arg_10]
		mov	dx, [bp+arg_E]
		sub	dx, [bp+arg_A]
		movsx	edx, dx
		imul	eax, edx
		sar	eax, 0Ch
		mov	dx, [bp+arg_A]
		add	dx, ax
		mov	[bp+var_E], dx
		mov	di, [bp+arg_8]
		mov	ax, [bp+arg_A]
		mov	[bp+var_6], ax
		mov	al, [bp+arg_14]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+arg_6]
		call	Render_SetPixelClipped_3811A
		add	sp, 8
		jmp	short loc_5B5C0

loc_5B542:
		mov	ax, [bp+arg_E]
		cmp	ax, [bp+arg_A]
		jle	short loc_5B54F
		inc	[bp+var_6]
		jmp	short loc_5B552

loc_5B54F:
		dec	[bp+var_6]

loc_5B552:
		cmp	[bp+var_8], 0
		jge	short loc_5B560
		mov	ax, [bp+var_A]
		add	[bp+var_8], ax
		jmp	short loc_5B572

loc_5B560:
		mov	ax, [bp+arg_C]
		cmp	ax, [bp+arg_8]
		jle	short loc_5B56B
		inc	di
		jmp	short loc_5B56C

loc_5B56B:
		dec	di

loc_5B56C:
		mov	ax, [bp+var_C]
		add	[bp+var_8], ax

loc_5B572:
		cmp	[bp+arg_12], 2
		jnb	short loc_5B58D
		mov	al, [bp+arg_14]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+arg_6]
		call	Render_SetPixelClipped_3811A
		add	sp, 8
		jmp	short loc_5B5C0

loc_5B58D:
		mov	al, [bp+arg_12]
		mov	ah, 0
		sar	ax, 1
		mov	byte ptr [bp+var_18+1], al
		mov	al, [bp+arg_14]
		push	ax
		push	[bp+var_6]
		mov	al, byte ptr [bp+var_18+1]
		mov	ah, 0
		mov	dx, di
		add	dx, ax
		push	dx
		push	[bp+var_6]
		mov	al, byte ptr [bp+var_18+1]
		mov	ah, 0
		mov	dx, di
		sub	dx, ax
		push	dx
		push	[bp+arg_6]
		call	sub_37F22
		add	sp, 0Ch

loc_5B5C0:
		mov	ax, [bp+var_6]
		sub	ax, [bp+var_E]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_16]
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jle	short loc_5B5D8
		jmp	loc_5B542

loc_5B5D8:
		mov	[bp+var_1C], di
		mov	ax, [bp+var_6]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_1E]
		mov	[bp+var_18], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_1A]
		mov	[bx], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_18]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_5B390		endp

; START OF FUNCTION CHUNK FOR sub_5B390

loc_5B608:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5B390

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B60C		proc far

var_4D2		= word ptr -4D2h
var_4D0		= word ptr -4D0h
var_4BC		= byte ptr -4BCh
var_4B8		= word ptr -4B8h
var_4A8		= word ptr -4A8h
var_4A6		= word ptr -4A6h
var_4A4		= word ptr -4A4h
var_4A0		= word ptr -4A0h
var_49E		= word ptr -49Eh
var_49C		= word ptr -49Ch
var_49A		= word ptr -49Ah
var_498		= word ptr -498h
var_496		= word ptr -496h
var_492		= word ptr -492h
var_481		= word ptr -481h
var_47F		= word ptr -47Fh
var_47D		= byte ptr -47Dh
var_474		= word ptr -474h
var_463		= word ptr -463h
var_461		= word ptr -461h
var_45F		= byte ptr -45Fh
var_456		= word ptr -456h
var_445		= word ptr -445h
var_443		= word ptr -443h
var_441		= byte ptr -441h
var_438		= word ptr -438h
var_427		= word ptr -427h
var_425		= word ptr -425h
var_423		= byte ptr -423h
var_41A		= word ptr -41Ah
var_409		= word ptr -409h
var_407		= word ptr -407h
var_405		= byte ptr -405h
var_3FC		= word ptr -3FCh
var_3EB		= word ptr -3EBh
var_3E9		= word ptr -3E9h
var_3E7		= byte ptr -3E7h
var_3DE		= word ptr -3DEh
var_3CD		= word ptr -3CDh
var_3CB		= word ptr -3CBh
var_3C9		= byte ptr -3C9h
var_3C0		= word ptr -3C0h
var_348		= word ptr -348h
var_2D0		= word ptr -2D0h
var_280		= word ptr -280h
var_223		= dword ptr -223h
var_21F		= dword ptr -21Fh
var_21B		= dword ptr -21Bh
var_20A		= dword ptr -20Ah
var_206		= word ptr -206h
var_204		= word ptr -204h
var_1D8		= word ptr -1D8h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1C0		= word ptr -1C0h
var_1BE		= word ptr -1BEh
var_1BC		= word ptr -1BCh
var_E8		= word ptr -0E8h
var_E6		= word ptr -0E6h
var_E4		= word ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= word ptr -0D4h
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
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= byte ptr -84h
var_83		= byte ptr -83h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= word ptr -7Ah
var_76		= word ptr -76h
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
		sub	sp, 4D2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4F55C, 0
		jz	short loc_5B623
		pop	di
		pop	si
		leave
		retf

loc_5B623:
		push	seg stub193
		push	offset sub_47A40
		push	1
		push	0Ah
		push	18h
		lea	ax, [bp+var_1D8]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_6], 1000h
		lea	ax, [bp+var_280]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_280], 480h
		mov	[bp+var_21F], 100h
		mov	[bp+var_223], 0
		mov	[bp+var_280], 498h
		mov	[bp+var_204], 0
		xor	ax, ax
		mov	[bp+var_206], ax
		movsx	eax, ax
		mov	[bp+var_21B], eax
		push	1
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		mov	bx, [bp+var_280]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_7], 0
		push	0
		push	large 444C5257h
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_5B6BB
		jmp	loc_5B80A

loc_5B6BB:
		jmp	short loc_5B6FB

loc_5B6BD:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	dl, [bp+arg_2]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_5B6EE
		mov	[bp+var_7], 1
		jmp	short loc_5B714

loc_5B6EE:
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_5B6FB:
		push	1
		push	large 5350414Dh
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_5B6BD

loc_5B714:
		cmp	[bp+var_7], 0
		jnz	short loc_5B71D
		jmp	loc_5B7FB

loc_5B71D:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1], al
		mov	byte ptr [bp+var_7E+3], 0
		jmp	short loc_5B7B4

loc_5B748:
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	dl, byte ptr [bp+var_7E+3]
		mov	dh, 0
		mov	bx, 18h
		push	ax
		mov	ax, dx
		imul	bx
		lea	dx, [bp+var_1D8]
		add	ax, dx
		mov	bx, ax
		pop	ax
		mov	[bx], ax
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	dl, byte ptr [bp+var_7E+3]
		mov	dh, 0
		mov	bx, 18h
		push	ax
		mov	ax, dx
		imul	bx
		lea	dx, [bp+var_1D6]
		add	ax, dx
		mov	bx, ax
		pop	ax
		mov	[bx], ax
		push	ds
		mov	al, byte ptr [bp+var_7E+3]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D4]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReadViaHelper_42AEC
		add	sp, 6
		inc	byte ptr [bp+var_7E+3]

loc_5B7B4:
		mov	al, byte ptr [bp+var_7E+3]
		cmp	al, [bp+var_1]
		jb	short loc_5B748
		mov	eax, [bp+var_20A]
		mov	[bp+var_21B], eax
		push	0
		push	large 44455053h
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_5B7F9
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax

loc_5B7F9:
		jmp	short loc_5B808

loc_5B7FB:
		push	13h
		push	0A48h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_5B808:
		jmp	short loc_5B817

loc_5B80A:
		push	14h
		push	0A48h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_5B817:
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_8], 0
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_2D0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_2D0]
		push	ax
		lea	ax, [bp+var_348]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_2D0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_2D0]
		push	ax
		lea	ax, [bp+var_3C0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
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
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	81h
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	82h
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	83h
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	84h
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	85h
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	86h
		lea	ax, [bp+var_348]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_58], 0
		mov	[bp+var_54], 2
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	17h
		lea	ax, [bp+var_3C0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	ds
		push	offset aShp
		push	ds
		push	offset aMapfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_2D0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_2D0]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_66+2], dx
		mov	word ptr [bp+var_66], ax
		mov	eax, [bp+var_66]
		mov	[bp+var_62], eax
		mov	[bp+var_5E], 2
		mov	[bp+var_5D], 1
		mov	[bp+var_5C], 0
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_12]
		push	ax
		lea	ax, [bp+var_3DE]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_3FC]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_41A]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_438]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_456]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_474]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_492]
		push	ax
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_4A0], 0
		mov	[bp+var_49E], 0
		mov	[bp+var_49C], 0
		mov	[bp+var_49A], 0
		mov	[bp+var_498], 13Fh
		mov	[bp+var_496], 0C7h
		push	0
		lea	ax, [bp+var_4A0]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_4A0]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_3499B
		add	sp, 4
		lea	ax, word ptr [bp+var_62]
		push	ax
		lea	ax, [bp+var_4B8]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_4A8], 0
		mov	[bp+var_4A6], 0
		push	2Dh
		lea	ax, [bp+var_4B8]
		push	ax
		mov	bx, [bp+var_4B8]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_4A4], ax
		lea	ax, [bp+var_4B8]
		push	ax
		lea	ax, [bp+var_4A0]
		push	ax
		lea	ax, [bp+var_4D2]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	[bp+var_4BC], 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	[bp+var_6D], 0
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	0
		push	[bp+var_70]
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	ax, 0A0h
		sub	ax, [bp+var_1D8]
		mov	[bp+var_72], ax
		mov	ax, 0A0h
		sub	ax, [bp+var_1D6]
		mov	[bp+var_74], ax
		call	Input_Flush_116D1
		mov	[bp+var_76], 0
		jmp	loc_5C2BE

loc_5BBC3:
		mov	[bp+var_83], 0
		mov	[bp+var_84], 0
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D8]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_7E+2], ax
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D6]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_82+2], ax
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1C0]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_7E], ax
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1BE]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_82], ax
		mov	[bp+var_88], 3
		mov	ax, word ptr [bp+var_7E]
		sub	ax, word ptr [bp+var_7E+2]
		mov	[bp+var_9A], ax
		mov	ax, [bp+var_9A]
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	[bp+var_90], eax
		mov	ax, word ptr [bp+var_82]
		sub	ax, word ptr [bp+var_82+2]
		mov	[bp+var_9C], ax
		mov	ax, [bp+var_9C]
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		cmp	eax, [bp+var_90]
		jle	short loc_5BC8E
		mov	eax, [bp+var_90]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_94], eax

loc_5BC8E:
		mov	eax, [bp+var_94]
		imul	eax, eax, 0Bh
		sar	eax, 5
		mov	edx, [bp+var_90]
		add	edx, eax
		mov	[bp+var_8C], edx
		mov	eax, [bp+var_6]
		cdq
		idiv	[bp+var_8C]
		mov	[bp+var_A0], eax
		mov	[bp+var_A4], 0
		mov	ax, word ptr [bp+var_7E+2]
		mov	[bp+var_AA], ax
		mov	ax, word ptr [bp+var_82+2]
		mov	[bp+var_AC], ax
		mov	ax, [bp+var_AA]
		mov	word ptr [bp+var_A8], ax
		mov	ax, [bp+var_AC]
		mov	word ptr [bp+var_A8+2], ax
		xor	eax, eax
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax

loc_5BCEC:
		mov	[bp+var_B4], 3
		mov	eax, dword_4DE15
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_A0]
		add	[bp+var_A4], eax
		cmp	[bp+var_A4], 1000h
		jle	short loc_5BD1C
		mov	[bp+var_A4], 1000h

loc_5BD1C:
		cmp	[bp+var_72], 0
		jle	short loc_5BD27
		mov	[bp+var_72], 0

loc_5BD27:
		cmp	[bp+var_72], 0FE0Fh
		jge	short loc_5BD33
		mov	[bp+var_72], 0FE0Fh

loc_5BD33:
		cmp	[bp+var_74], 0
		jle	short loc_5BD3E
		mov	[bp+var_74], 0

loc_5BD3E:
		cmp	[bp+var_74], 0FF13h
		jge	short loc_5BD4A
		mov	[bp+var_74], 0FF13h

loc_5BD4A:
		cmp	[bp+var_72], 0FF49h
		jge	short loc_5BD5C
		cmp	[bp+var_74], 0FFDBh
		jle	short loc_5BD5C
		mov	[bp+var_74], 0FFDBh

loc_5BD5C:
		cmp	[bp+var_72], 0FEC0h
		jle	short loc_5BDAA
		cmp	[bp+var_74], 0FF38h
		jle	short loc_5BDAA
		mov	ax, [bp+var_72]
		mov	[bp+var_BA], ax
		mov	ax, [bp+var_74]
		mov	[bp+var_BC], ax
		push	0
		push	0
		mov	al, [bp+var_47D]
		push	ax
		push	[bp+var_47F]
		push	[bp+var_481]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_BC]
		push	[bp+var_BA]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BDAA:
		cmp	[bp+var_72], 0FE0Fh
		jle	short loc_5BDFE
		cmp	[bp+var_74], 0FF13h
		jle	short loc_5BDFE
		mov	ax, [bp+var_72]
		add	ax, 0B1h
		mov	[bp+var_BE], ax
		mov	ax, [bp+var_74]
		add	ax, 25h
		mov	[bp+var_C0], ax
		push	0
		push	0
		mov	al, [bp+var_3C9]
		push	ax
		push	[bp+var_3CB]
		push	[bp+var_3CD]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C0]
		push	[bp+var_BE]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BDFE:
		cmp	[bp+var_72], 0FE0Fh
		jle	short loc_5BE51
		cmp	[bp+var_74], 0FFDBh
		jge	short loc_5BE51
		mov	ax, [bp+var_72]
		add	ax, 0B1h
		mov	[bp+var_C2], ax
		mov	ax, [bp+var_74]
		add	ax, 0EDh
		mov	[bp+var_C4], ax
		push	0
		push	0
		mov	al, [bp+var_3E7]
		push	ax
		push	[bp+var_3E9]
		push	[bp+var_3EB]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C4]
		push	[bp+var_C2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BE51:
		cmp	[bp+var_72], 0FF4Fh
		jge	short loc_5BEA5
		cmp	[bp+var_74], 0FF13h
		jle	short loc_5BEA5
		mov	ax, [bp+var_72]
		add	ax, 1F1h
		mov	[bp+var_C6], ax
		mov	ax, [bp+var_74]
		add	ax, 25h
		mov	[bp+var_C8], ax
		push	0
		push	0
		mov	al, [bp+var_405]
		push	ax
		push	[bp+var_407]
		push	[bp+var_409]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C8]
		push	[bp+var_C6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BEA5:
		cmp	[bp+var_72], 0FF4Fh
		jge	short loc_5BEF8
		cmp	[bp+var_74], 0FFDBh
		jge	short loc_5BEF8
		mov	ax, [bp+var_72]
		add	ax, 1F1h
		mov	[bp+var_CA], ax
		mov	ax, [bp+var_74]
		add	ax, 0EDh
		mov	[bp+var_CC], ax
		push	0
		push	0
		mov	al, [bp+var_423]
		push	ax
		push	[bp+var_425]
		push	[bp+var_427]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_CC]
		push	[bp+var_CA]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BEF8:
		cmp	[bp+var_72], 0FE0Fh
		jle	short loc_5BF48
		cmp	[bp+var_74], 0
		jge	short loc_5BF48
		mov	ax, [bp+var_72]
		mov	[bp+var_CE], ax
		mov	ax, [bp+var_74]
		add	ax, 0C8h
		mov	[bp+var_D0], ax
		push	0
		push	0
		mov	al, [bp+var_441]
		push	ax
		push	[bp+var_443]
		push	[bp+var_445]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_D0]
		push	[bp+var_CE]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BF48:
		cmp	[bp+var_74], 0FF13h
		jle	short loc_5BF92
		mov	ax, [bp+var_72]
		add	ax, 0B7h
		mov	[bp+var_D2], ax
		mov	ax, [bp+var_74]
		mov	[bp+var_D4], ax
		push	0
		push	0
		mov	al, [bp+var_45F]
		push	ax
		push	[bp+var_461]
		push	[bp+var_463]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_D4]
		push	[bp+var_D2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_5BF92:
		mov	eax, [bp+var_A8]
		mov	[bp+var_B0], eax
		push	0F6h
		mov	al, byte ptr [bp+var_88]
		push	ax
		push	word ptr [bp+var_A4]
		mov	ax, word ptr [bp+var_82]
		add	ax, [bp+var_74]
		push	ax
		mov	ax, word ptr [bp+var_7E]
		add	ax, [bp+var_72]
		push	ax
		mov	ax, word ptr [bp+var_82+2]
		add	ax, [bp+var_74]
		push	ax
		mov	ax, word ptr [bp+var_7E+2]
		add	ax, [bp+var_72]
		push	ax
		push	word_4D36C
		push	si
		push	ss
		lea	ax, word ptr [bp+var_D8]
		push	ax
		push	cs
		call	near ptr sub_5B390
		add	sp, 16h
		mov	eax, [bp+var_D8]
		mov	[bp+var_A8], eax
		mov	ax, [bp+var_72]
		sub	word ptr [bp+var_A8], ax
		mov	ax, [bp+var_74]
		sub	word ptr [bp+var_A8+2], ax
		xor	di, di
		jmp	short loc_5C065

loc_5BFF3:
		push	0F6h
		mov	al, byte ptr [bp+var_88]
		push	ax
		push	1000h
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1BE]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_74]
		push	ax
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1C0]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D6]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_74]
		push	ax
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D8]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		push	word_4D36C
		push	si
		push	ss
		lea	ax, [bp+var_E4]
		push	ax
		push	cs
		call	near ptr sub_5B390
		add	sp, 16h
		inc	di

loc_5C065:
		cmp	di, [bp+var_76]
		jl	short loc_5BFF3
		xor	di, di
		jmp	loc_5C102

loc_5C06F:
		push	0F6h
		push	2
		push	2
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D6]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_74]
		push	ax
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D8]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		push	word_4D36C
		call	sub_37BE0
		add	sp, 0Ch
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D6]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_74]
		add	ax, 5
		push	ax
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D8]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_4D2]
		push	ax
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		mov	ax, di
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1D4]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_4D2]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		inc	di

loc_5C102:
		cmp	di, [bp+var_76]
		jg	short loc_5C10A
		jmp	loc_5C06F

loc_5C10A:
		mov	ax, word ptr [bp+var_A8]
		sub	ax, word ptr [bp+var_B0]
		mov	[bp+var_E6], ax
		mov	ax, word ptr [bp+var_A8+2]
		sub	ax, word ptr [bp+var_B0+2]
		mov	[bp+var_E8], ax
		mov	[bp+var_83], 1
		mov	[bp+var_84], 1
		mov	ax, word ptr [bp+var_A8]
		add	ax, [bp+var_72]
		cmp	ax, 46h
		jg	short loc_5C13F
		cmp	[bp+var_E6], 0
		jl	short loc_5C157

loc_5C13F:
		mov	ax, word ptr [bp+var_A8]
		add	ax, [bp+var_72]
		cmp	ax, 0FAh
		jl	short loc_5C152
		cmp	[bp+var_E6], 0
		jg	short loc_5C157

loc_5C152:
		mov	[bp+var_83], 0

loc_5C157:
		mov	ax, word ptr [bp+var_A8+2]
		add	ax, [bp+var_74]
		cmp	ax, 3Ch
		jg	short loc_5C16A
		cmp	[bp+var_E8], 0
		jl	short loc_5C182

loc_5C16A:
		mov	ax, word ptr [bp+var_A8+2]
		add	ax, [bp+var_74]
		cmp	ax, 8Ch
		jl	short loc_5C17D
		cmp	[bp+var_E8], 0
		jg	short loc_5C182

loc_5C17D:
		mov	[bp+var_84], 0

loc_5C182:
		cmp	[bp+var_A4], 1000h
		jge	short loc_5C1A9
		cmp	[bp+var_83], 0
		jz	short loc_5C19B
		mov	ax, [bp+var_E6]
		sub	[bp+var_72], ax

loc_5C19B:
		cmp	[bp+var_84], 0
		jz	short loc_5C1A9
		mov	ax, [bp+var_E8]
		sub	[bp+var_74], ax

loc_5C1A9:
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_5C1C8
		mov	[bp+var_8], 1
		jmp	short loc_5C1E3

loc_5C1C8:
		lea	ax, word ptr [bp+var_B8]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		cmp	[bp+var_A4], 1000h
		jge	short loc_5C1E3
		jmp	loc_5BCEC

loc_5C1E3:
		cmp	[bp+var_8], 0
		jz	short loc_5C1EC
		jmp	loc_5C2CC

loc_5C1EC:
		push	0F6h
		push	2
		push	2
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1BE]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_74]
		push	ax
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1C0]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		push	word_4D36C
		call	sub_37BE0
		add	sp, 0Ch
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1BE]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_74]
		add	ax, 5
		push	ax
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1C0]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_4D2]
		push	ax
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		mov	ax, [bp+var_76]
		mov	dx, 18h
		imul	dx
		lea	dx, [bp+var_1BC]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_4D2]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		mov	[bp+var_E0], 0
		mov	[bp+var_DC], 3Ch
		mov	eax, dword_4DE15
		mov	[bp+var_E0], eax
		lea	ax, word ptr [bp+var_E0]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	[bp+var_76]

loc_5C2BE:
		mov	al, [bp+var_1]
		mov	ah, 0
		dec	ax
		cmp	ax, [bp+var_76]
		jle	short loc_5C2CC
		jmp	loc_5BBC3

loc_5C2CC:
		mov	al, [bp+var_8]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5C325
		mov	[bp+var_82], 0
		mov	[bp+var_7E], 32h
		mov	eax, dword_4DE15
		mov	[bp+var_82], eax
		jmp	short loc_5C308

loc_5C2F1:
		push	0FFh
		lea	ax, [bp+var_7A]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte ptr [bp+var_7A], 0
		jz	short loc_5C308
		jmp	short loc_5C325

loc_5C308:
		mov	eax, [bp+var_82]
		add	eax, [bp+var_7E]
		cmp	eax, dword_4DE15
		ja	short loc_5C31D
		mov	ax, 1
		jmp	short loc_5C31F

loc_5C31D:
		xor	ax, ax

loc_5C31F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5C2F1

loc_5C325:
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_4D0]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_4B8]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		lea	ax, [bp+var_6A]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_4A0]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_492]
		push	ax
		call	sub_3410F
		add	sp, 4
		push	2
		lea	ax, [bp+var_474]
		push	ax
		call	sub_3410F
		add	sp, 4
		push	2
		lea	ax, [bp+var_456]
		push	ax
		call	sub_3410F
		add	sp, 4
		push	2
		lea	ax, [bp+var_438]
		push	ax
		call	sub_3410F
		add	sp, 4
		push	2
		lea	ax, [bp+var_41A]
		push	ax
		call	sub_3410F
		add	sp, 4
		push	2
		lea	ax, [bp+var_3FC]
		push	ax
		call	sub_3410F
		add	sp, 4
		push	2
		lea	ax, [bp+var_3DE]
		push	ax
		call	sub_3410F
		add	sp, 4
		cmp	[bp+var_5D], 0
		jz	short loc_5C3F3
		cmp	[bp+var_62], 0
		jz	short loc_5C3F3
		push	0
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C3F3

loc_5C3F3:
		mov	[bp+var_62], 0
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		cmp	[bp+var_53], 0
		jz	short loc_5C42B
		cmp	[bp+var_58], 0
		jz	short loc_5C42B
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C42B

loc_5C42B:
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		cmp	[bp+var_49], 0
		jz	short loc_5C463
		cmp	[bp+var_4E], 0
		jz	short loc_5C463
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C463

loc_5C463:
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		cmp	[bp+var_3F], 0
		jz	short loc_5C49B
		cmp	[bp+var_44], 0
		jz	short loc_5C49B
		push	0
		mov	al, [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C49B

loc_5C49B:
		mov	[bp+var_44], 0
		mov	[bp+var_3F], 0
		mov	[bp+var_3E], 0
		cmp	[bp+var_35], 0
		jz	short loc_5C4D3
		cmp	[bp+var_3A], 0
		jz	short loc_5C4D3
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C4D3

loc_5C4D3:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		cmp	[bp+var_2B], 0
		jz	short loc_5C50B
		cmp	[bp+var_30], 0
		jz	short loc_5C50B
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C50B

loc_5C50B:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_5C543
		cmp	[bp+var_26], 0
		jz	short loc_5C543
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C543

loc_5C543:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_5C57B
		cmp	[bp+var_1C], 0
		jz	short loc_5C57B
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C57B

loc_5C57B:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		cmp	[bp+var_D], 0
		jz	short loc_5C5B3
		cmp	[bp+var_12], 0
		jz	short loc_5C5B3
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5C5B3

loc_5C5B3:
		mov	[bp+var_12], 0
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	2
		lea	ax, [bp+var_3C0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_348]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	[bp+var_280], 498h
		lea	ax, [bp+var_280]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_280]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5B60C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C60B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5C626
		push	18h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_5C626

loc_5C626:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5C60B		endp

; START OF FUNCTION CHUNK FOR sub_5C60B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_5C60B
ovr193		ends
