ovr228		segment	para public 'OVERLAY' use16
		assume cs:ovr228
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAFA0		proc far

var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_4B		= dword ptr -4Bh
var_47		= dword ptr -47h
var_43		= dword ptr -43h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_A8], 480h
		mov	[bp+var_47], 100h
		mov	[bp+var_4B], 0
		mov	[bp+var_A8], 498h
		mov	[bp+var_2C], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		movsx	eax, ax
		mov	[bp+var_43], eax
		push	seg seg182
		push	0
		push	ds
		push	[bp+arg_0]
		push	ds
		push	offset aMISSIONS
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_11166
		add	sp, 0Eh
		push	large 444C5257h
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_InitAndValidate_425E0
		add	sp, 8
		or	ax, ax
		jz	short loc_BB033
		lea	ax, [bp+var_A8]
		push	ax
		nop
		push	cs
		call	near ptr sub_BB647
		add	sp, 2
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_BB033:
		mov	[bp+var_A8], 498h
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		leave
		retf
sub_BAFA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB057		proc far

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
		sub	sp, 3Ch
		push	large 0Fh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_BB092
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3CB5h
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3CDDh
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_BB098

loc_BB092:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_BB098:
		mov	word_4F1B8, dx
		mov	word_4F1B6, ax
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_BB0D4
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 3CB5h
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 3C65h
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_BB0DA

loc_BB0D4:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_BB0DA:
		mov	word_4F1BC, dx
		mov	word_4F1BA, ax
		push	large 10h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	ax, dx
		jz	short loc_BB116
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 3CB5h
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 3C3Dh
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		jmp	short loc_BB11C

loc_BB116:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]

loc_BB11C:
		mov	word_4F1C0, dx
		mov	word_4F1BE, ax
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		or	ax, dx
		jz	short loc_BB158
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 3C15h
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	short loc_BB15E

loc_BB158:
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]

loc_BB15E:
		mov	word_4F234, dx
		mov	word_4F232, ax
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		or	ax, dx
		jz	short loc_BB19A
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 3BC5h
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]
		jmp	short loc_BB1A0

loc_BB19A:
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]

loc_BB1A0:
		mov	word_4F238, dx
		mov	word_4F236, ax
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		or	ax, dx
		jz	short loc_BB1E4
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 3C15h
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 3B9Dh
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]
		jmp	short loc_BB1EA

loc_BB1E4:
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]

loc_BB1EA:
		mov	word_4F23C, dx
		mov	word_4F23A, ax
		push	large 19h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		or	ax, dx
		jz	short loc_BB248
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx+12h], 3B6Dh
		les	bx, [bp+var_1C]
		and	byte ptr es:[bx+18h], 0FDh
		les	bx, [bp+var_1C]
		and	byte ptr es:[bx+18h], 0FEh
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 3B71h
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx+12h], 3B99h
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	short loc_BB24E

loc_BB248:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]

loc_BB24E:
		mov	word_4F240, dx
		mov	word_4F23E, ax
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		or	ax, dx
		jz	short loc_BB28A
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 3B45h
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]
		jmp	short loc_BB290

loc_BB28A:
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]

loc_BB290:
		mov	word_4F244, dx
		mov	word_4F242, ax
		push	large 12h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		or	ax, dx
		jz	short loc_BB2CC
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_24]
		mov	word ptr es:[bx], 3B19h
		mov	dx, [bp+var_22]
		mov	ax, [bp+var_24]
		jmp	short loc_BB2D2

loc_BB2CC:
		mov	dx, [bp+var_22]
		mov	ax, [bp+var_24]

loc_BB2D2:
		mov	word_4F248, dx
		mov	word_4F246, ax
		push	large 19h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_26], dx
		mov	[bp+var_28], ax
		or	ax, dx
		jz	short loc_BB338
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 3B19h
		les	bx, [bp+var_28]
		mov	word ptr es:[bx+12h], 3B6Dh
		les	bx, [bp+var_28]
		and	byte ptr es:[bx+18h], 0FDh
		les	bx, [bp+var_28]
		and	byte ptr es:[bx+18h], 0FEh
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 3AE9h
		les	bx, [bp+var_28]
		mov	word ptr es:[bx+12h], 3B15h
		mov	dx, [bp+var_26]
		mov	ax, [bp+var_28]
		jmp	short loc_BB33E

loc_BB338:
		mov	dx, [bp+var_26]
		mov	ax, [bp+var_28]

loc_BB33E:
		mov	word_4F24C, dx
		mov	word_4F24A, ax
		push	large 14h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		or	ax, dx
		jz	short loc_BB382
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 3B19h
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 3ABDh
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]
		jmp	short loc_BB388

loc_BB382:
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]

loc_BB388:
		mov	word_4F250, dx
		mov	word_4F24E, ax
		push	large 19h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_2E], dx
		mov	[bp+var_30], ax
		or	ax, dx
		jz	short loc_BB3EE
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 3BEDh
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 3B19h
		les	bx, [bp+var_30]
		mov	word ptr es:[bx+12h], 3B6Dh
		les	bx, [bp+var_30]
		and	byte ptr es:[bx+18h], 0FDh
		les	bx, [bp+var_30]
		and	byte ptr es:[bx+18h], 0FEh
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 3A8Dh
		les	bx, [bp+var_30]
		mov	word ptr es:[bx+12h], 3AB9h
		mov	dx, [bp+var_2E]
		mov	ax, [bp+var_30]
		jmp	short loc_BB3F4

loc_BB3EE:
		mov	dx, [bp+var_2E]
		mov	ax, [bp+var_30]

loc_BB3F4:
		mov	word_4F254, dx
		mov	word_4F252, ax
		push	large 10h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		or	ax, dx
		jz	short loc_BB430
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 3A3Dh
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 3A65h
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]
		jmp	short loc_BB436

loc_BB430:
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]

loc_BB436:
		mov	word_4F262, dx
		mov	word_4F260, ax
		push	large 0Dh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_36], dx
		mov	[bp+var_38], ax
		or	ax, dx
		jz	short loc_BB472
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 3A3Dh
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 3A15h
		mov	dx, [bp+var_36]
		mov	ax, [bp+var_38]
		jmp	short loc_BB478

loc_BB472:
		mov	dx, [bp+var_36]
		mov	ax, [bp+var_38]

loc_BB478:
		mov	word_4F266, dx
		mov	word_4F264, ax
		push	large 0Dh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		or	ax, dx
		jz	short loc_BB4BC
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 3C8Dh
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 3A3Dh
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 3A15h
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 39EDh
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]
		jmp	short loc_BB4C2

loc_BB4BC:
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]

loc_BB4C2:
		mov	word_4F26A, dx
		mov	word_4F268, ax
		leave
		retf
sub_BB057		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB4CB		proc far
		push	bp
		mov	bp, sp
		push	word_4F1B8
		push	word_4F1B6
		call	sub_3AA
		add	sp, 4
		push	word_4F1BC
		push	word_4F1BA
		call	sub_3AA
		add	sp, 4
		push	word_4F1C0
		push	word_4F1BE
		call	sub_3AA
		add	sp, 4
		push	word_4F234
		push	word_4F232
		call	sub_3AA
		add	sp, 4
		push	word_4F238
		push	word_4F236
		call	sub_3AA
		add	sp, 4
		push	word_4F23C
		push	word_4F23A
		call	sub_3AA
		add	sp, 4
		push	word_4F240
		push	word_4F23E
		call	sub_3AA
		add	sp, 4
		push	word_4F244
		push	word_4F242
		call	sub_3AA
		add	sp, 4
		push	word_4F248
		push	word_4F246
		call	sub_3AA
		add	sp, 4
		push	word_4F24C
		push	word_4F24A
		call	sub_3AA
		add	sp, 4
		push	word_4F250
		push	word_4F24E
		call	sub_3AA
		add	sp, 4
		push	word_4F254
		push	word_4F252
		call	sub_3AA
		add	sp, 4
		push	word_4F262
		push	word_4F260
		call	sub_3AA
		add	sp, 4
		push	word_4F266
		push	word_4F264
		call	sub_3AA
		add	sp, 4
		push	word_4F26A
		push	word_4F268
		call	sub_3AA
		add	sp, 4
		mov	dword ptr word_4F1B6, 0
		mov	dword ptr word_4F1BA, 0
		mov	dword ptr word_4F1BE, 0
		mov	dword ptr word_4F232, 0
		mov	dword ptr word_4F236, 0
		mov	dword ptr word_4F23A, 0
		mov	dword ptr word_4F23E, 0
		mov	dword ptr word_4F242, 0
		mov	dword ptr word_4F246, 0
		mov	dword ptr word_4F24A, 0
		mov	dword ptr word_4F24E, 0
		mov	dword ptr word_4F252, 0
		mov	dword ptr word_4F260, 0
		mov	dword ptr word_4F264, 0
		mov	dword ptr word_4F268, 0
		pop	bp
		retf
sub_BB4CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB647		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4C34B, 0
		jz	short loc_BB68F
		mov	byte_4C34C, 1
		mov	byte_4C376, 0
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_4C36D, eax
		mov	byte_4C371, 0
		mov	byte_4C372, 0
		mov	word_4C373, 1
		push	si
		nop
		push	cs
		call	near ptr sub_BB93B
		add	sp, 2
		jmp	loc_BB7CD

loc_BB68F:
		mov	di, 320h
		push	cs
		call	near ptr sub_BB057
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BB6BE
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_BB6BE:
		push	0
		push	large 5A524F48h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BB707
		push	si
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dword_4C3C5, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dword_4C3C9, eax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_BB707:
		push	1
		mov	ax, di
		mov	dx, 46h
		imul	dx
		push	ax
		push	688Ch
		call	sub_2259F
		add	sp, 6
		push	si
		nop
		push	cs
		call	near ptr TextScrollDisplayB_TickHelper_BB940
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_BB7D1
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_BB81B
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_BB93B
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_BB820
		add	sp, 2
		push	ds
		push	offset unk_4F345
		call	sub_4886F
		add	sp, 4
		push	0
		push	large 4C414353h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BB7C8
		push	si
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dword_4C351, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, dword_4C351
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	dword_4C34D, eax
		mov	eax, dword_4C355
		mov	edx, dword_4C351
		imul	edx
		shrd	eax, edx, 8
		mov	dword_4C355, eax

loc_BB7C8:
		mov	byte_4C34B, 1

loc_BB7CD:
		pop	di
		pop	si
		leave
		retf
sub_BB647		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB7D1		proc far

var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A]
		push	ax
		call	sub_1109C
		add	sp, 2
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BB818
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	68AEh
		call	sub_48241
		add	sp, 4

loc_BB818:
		pop	si
		leave
		retf
sub_BB7D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB81B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_BB81B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB820		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_14		= word ptr -14h
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
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 5448474Ch
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BB843
		jmp	loc_BB937

loc_BB843:
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	6A13h
		call	sub_228C0
		add	sp, 4
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 64h
		jge	short loc_BB874
		mov	ax, [bp+var_E]
		jmp	short loc_BB877

loc_BB874:
		mov	ax, 64h

loc_BB877:
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		imul	eax, eax, 0FFh
		mov	ebx, 64h
		cdq
		idiv	ebx
		push	ax
		push	6A13h
		call	LightSet_SetIntensityPercent_22899
		add	sp, 4
		jmp	short loc_BB904

loc_BB89F:
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	al, [bp+var_2]
		push	ax
		sub	sp, 4
		mov	ax, [bp+var_4]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_1E], eax
		sub	sp, 4
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_22], eax
		sub	sp, 4
		mov	ax, [bp+var_8]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_26], eax
		push	[bp+var_A]
		push	6A13h
		call	sub_2295B
		add	sp, 12h

loc_BB904:
		test	word ptr [di+72h], 1
		jz	short loc_BB91F
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_BB91D
		inc	dword ptr [di+65h]
		jmp	short loc_BB91D

loc_BB91D:
		jmp	short loc_BB91F

loc_BB91F:
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_BB92E
		mov	ax, 1
		jmp	short loc_BB930

loc_BB92E:
		xor	ax, ax

loc_BB930:
		or	ax, ax
		jnz	short loc_BB937
		jmp	loc_BB89F

loc_BB937:
		pop	di
		pop	si
		leave
		retf
sub_BB820		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB93B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_BB93B		endp

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
TextScrollDisplayB_TickHelper_BB940		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	6951h
		call	sub_4809D
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_BB940		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB953		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4C34B, 0
		jz	short loc_BB9A9
		push	6941h
		call	sub_26E14
		add	sp, 2
		push	688Ch
		call	sub_226C3
		add	sp, 2
		push	6951h
		call	sub_480FC
		add	sp, 2
		push	6A13h
		call	sub_22818
		add	sp, 2
		push	6947h
		call	sub_24F65
		add	sp, 2
		push	ds
		push	offset unk_4F345
		call	sub_4886A
		add	sp, 4
		push	cs
		call	near ptr sub_BB4CB
		mov	byte_4C34B, 0

loc_BB9A9:
		pop	bp
		retf
sub_BB953		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB9AB		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_BB9AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB9B0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BB9D2
		push	cs
		call	near ptr sub_BB953
		test	di, 1
		jz	short loc_BB9D2
		push	si
		call	sub_39C
		add	sp, 2

loc_BB9D2:
		pop	di
		pop	si
		pop	bp
		retf
sub_BB9B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB9D6		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	6951h
		call	sub_480C0
		add	sp, 2
		mov	[bp+var_2], ax
		mov	dword_49DF4, 0
		mov	word_4C36B, 0
		push	68AEh
		call	sub_243B1
		add	sp, 2
		mov	ax, [bp+var_2]
		leave
		retf
sub_BB9D6		endp

; START OF FUNCTION CHUNK FOR sub_BB9D6
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BB9D6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBA19		proc far
		push	bp
		mov	bp, sp
		mov	dword_4C3C5, 4E2000h
		mov	dword_4C3C9, 0FA000h
		pop	bp
		retf
sub_BBA19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBA30		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_BBA30		endp

; START OF FUNCTION CHUNK FOR sub_BBA30
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BBA30

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBA39		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_BBA39		endp

; START OF FUNCTION CHUNK FOR sub_BBA39
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BBA39

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBA42		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		lea	si, [bp+arg_4]
		mov	ax, ss
		les	bx, [bp+arg_0]
		les	di, es:[bx+2]
		add	di, 28h
		push	ds
		mov	ds, ax
		mov	cx, 3
		rep movsw
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_BBA42		endp
ovr228		ends
