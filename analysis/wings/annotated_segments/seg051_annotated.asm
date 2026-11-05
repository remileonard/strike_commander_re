seg051		segment	para public 'CODE' use16
		assume cs:seg051
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23370		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_23385
		mov	ax, [si+4]
		jmp	short loc_23389

loc_23385:
		dec	word ptr [di]
		xor	ax, ax

loc_23389:
		pop	di
		pop	si
		pop	bp
		retf
sub_23370		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2338D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	word ptr [si+4]
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_233AE
		mov	al, 1
		jmp	short loc_233B2

loc_233AE:
		inc	word ptr [di]
		mov	al, 0

loc_233B2:
		pop	di
		pop	si
		pop	bp
		retf
sub_2338D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_233B6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si+7]
		jl	short loc_233D1
		mov	ax, [si+7]
		sub	[di], ax
		xor	ax, ax
		jmp	short loc_233E2

loc_233D1:
		mov	dx, [si+4]
		jmp	short loc_233DB

loc_233D6:
		add	dx, [si+9]
		dec	word ptr [di]

loc_233DB:
		cmp	word ptr [di], 0
		jg	short loc_233D6
		mov	ax, dx

loc_233E2:
		pop	di
		pop	si
		pop	bp
		retf
sub_233B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_233E6		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+4]
		mov	[bp+var_2], 0
		jmp	short loc_2341A

loc_233FB:
		push	di
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_2340F
		mov	al, 1
		jmp	short loc_23424

loc_2340F:
		mov	bx, [bp+arg_4]
		inc	word ptr [bx]
		inc	[bp+var_2]
		add	di, [si+9]

loc_2341A:
		mov	ax, [si+7]
		cmp	ax, [bp+var_2]
		jg	short loc_233FB
		mov	al, 0

loc_23424:
		pop	di
		pop	si
		leave
		retf
sub_233E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23428		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+6], 0
		jnz	short loc_2344F
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_235BE
		add	sp, 4
		cmp	ax, 0FFFFh
		jz	short loc_2344F
		mov	al, 0
		jmp	short loc_234AD

loc_2344F:
		mov	[bp+var_2], di
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_23481
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2346h
		push	[bp+var_2]
		call	CRT_Strdup
		pop	cx
		mov	[di+4], ax
		mov	byte ptr [di+6], 1
		mov	ax, di
		jmp	short loc_23483

loc_23481:
		mov	ax, di

loc_23483:
		mov	di, ax
		or	di, di
		jz	short loc_234A2
		cmp	[bp+arg_4], 0
		jz	short loc_23498
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		jmp	short loc_2349F

loc_23498:
		push	di
		push	si
		call	sub_485FB

loc_2349F:
		add	sp, 4

loc_234A2:
		or	di, di
		jz	short loc_234AB
		mov	ax, 1
		jmp	short loc_234AD

loc_234AB:
		xor	ax, ax

loc_234AD:
		pop	di
		pop	si
		leave
		retf
sub_23428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_234B1		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	0Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_23510
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2346h
		mov	word ptr [di+4], 0
		mov	byte ptr [di+6], 0
		mov	word ptr [di], 233Ah
		mov	ax, [bp+var_4]
		mov	[di+7], ax
		mov	ax, [bp+var_6]
		mov	[di+9], ax
		mov	ax, [bp+var_2]
		mov	[di+4], ax
		mov	byte ptr [di+6], 0
		mov	ax, di
		jmp	short loc_23512

loc_23510:
		mov	ax, di

loc_23512:
		mov	di, ax
		or	di, di
		jz	short loc_23522
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4

loc_23522:
		or	di, di
		jz	short loc_2352B
		mov	ax, 1
		jmp	short loc_2352D

loc_2352B:
		xor	ax, ax

loc_2352D:
		pop	di
		pop	si
		leave
		retf
sub_234B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23531		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_23569

loc_23542:
		push	[bp+arg_2]
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_23569
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6
		mov	al, 1
		jmp	short loc_2357C

loc_23569:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_23542
		mov	al, 0

loc_2357C:
		pop	si
		leave
		retf
sub_23531		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2357F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_235A8

loc_23590:
		lea	ax, [bp+arg_2]
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_235BB

loc_235A8:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_23590
		xor	ax, ax

loc_235BB:
		pop	si
		leave
		retf
sub_2357F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_235BE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_235F2

loc_235D4:
		lea	ax, [bp+var_4]
		push	ax
		push	[bp+arg_2]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_235F2
		mov	ax, [bp+var_4]
		jmp	short loc_23606

loc_235F2:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_235D4
		mov	ax, 0FFFFh

loc_23606:
		pop	si
		leave
		retf
sub_235BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23609		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_23609		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23611		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [si+1Eh]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+1Eh]
		mov	di, ax
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp+var_4], ax
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	[bp+var_8], 0
		jmp	short loc_236C0

loc_23644:
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp+var_8]
		mov	[bp+var_A], ax
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_2357F
		add	sp, 4
		mov	[bp+var_C], ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_23677
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_C]
		jnz	short loc_23677
		mov	dx, word_5BF00
		mov	ax, word_5BF1E
		jmp	short loc_2367E

loc_23677:
		mov	dx, word_5BF28
		mov	ax, word_5BF22

loc_2367E:
		mov	[bp+var_6], ax
		push	dx
		mov	ax, di
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	[bp+var_4]
		push	di
		push	[bp+var_2]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		cmp	[bp+var_C], 0
		jz	short loc_236BA
		push	word_5BF74
		push	[bp+var_6]
		push	[bp+var_C]
		push	di
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah

loc_236BA:
		inc	[bp+var_8]
		add	di, [si+20h]

loc_236C0:
		mov	ax, [si+30h]
		cmp	ax, [bp+var_8]
		jle	short loc_236CB
		jmp	loc_23644

loc_236CB:
		mov	al, byte ptr word_5BF2A
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		mov	ax, [si+0Ah]
		dec	ax
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		mov	ax, [si+6]
		inc	ax
		push	ax
		push	word ptr [si+8]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_23611		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2374A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		sub	ax, [si+1Eh]
		cwd
		idiv	word ptr [si+20h]
		mov	[bp+var_2], ax
		mov	bx, [si+2Eh]
		mov	dx, [bx]
		add	dx, [bp+var_2]
		cmp	[si+22h], dx
		jle	short loc_23797
		push	dx
		mov	ax, si
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_2357F
		add	sp, 4
		mov	dx, ax
		cmp	[si+2Ch], dx
		jnz	short loc_2378C
		mov	bx, [si+32h]
		mov	word ptr [bx], 1
		jmp	short loc_23797

loc_2378C:
		mov	[si+2Ch], dx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_23797:
		pop	si
		leave
		retf
sub_2374A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2379A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+83h], 0
		pop	si
		pop	bp
		retf
sub_2379A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_237AA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+35h], 0
		jz	short loc_237BE
		push	si
		call	GaugeWidget_DrawByMode_206F3
		pop	cx

loc_237BE:
		pop	si
		pop	bp
		retf
sub_237AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_237C1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+79h], 0
		jz	short loc_23819
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	di, ax
		push	word ptr [si+79h]
		call	sub_23243
		pop	cx
		mov	dx, ax
		mov	bx, [si+1Ah]
		sub	bx, di
		sub	bx, di
		cmp	dx, bx
		jge	short loc_237FB
		mov	ax, bx
		sub	ax, dx
		sar	ax, 1
		add	di, ax

loc_237FB:
		push	word_5BF74
		push	0FFFFh
		push	word ptr [si+79h]
		mov	ax, [si+6]
		add	ax, [bp+var_2]
		push	ax
		mov	ax, [si+4]
		add	ax, di
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah

loc_23819:
		pop	di
		pop	si
		leave
		retf
sub_237C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2381D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_DrawWidgetBorderA_22259
		pop	cx
		cmp	word ptr [si+79h], 0
		jz	short loc_23837
		push	si
		push	cs
		call	near ptr sub_237C1
		pop	cx

loc_23837:
		push	si
		nop
		push	cs
		call	near ptr AITargeting_Helper4_23B1F
		pop	cx
		push	si
		call	GaugeWidget_UpdateWithLock_20106
		pop	cx
		pop	si
		pop	bp
		retf
sub_2381D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23848		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		jmp	short loc_23860

loc_23855:
		push	1
		push	si
		call	GaugeWidget_QueryAndFormat_2094E
		add	sp, 4

loc_23860:
		cmp	word ptr [si+7Bh], 0
		jz	short loc_23855
		mov	bx, [si+83h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_23885
		push	word ptr [bx+2Ch]
		push	di
		call	CRT_Strcpy
		add	sp, 4
		push	di
		call	CRT_StrUpr_2F35
		pop	cx
		jmp	short loc_23888

loc_23885:
		mov	byte ptr [di], 0

loc_23888:
		pop	di
		pop	si
		pop	bp
		retf
sub_23848		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2388C		proc far

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
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	GaugeWidget_AllocateRenderBufferWrapper_207CC
		pop	cx
		mov	[bp+var_6], 2
		mov	[bp+var_8], 0Ah
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp+var_A], ax
		mov	ax, [si+1Ch]
		add	ax, 0FFE2h
		mov	[bp+var_C], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_8]
		add	ax, [bp+var_C]
		add	ax, 8
		mov	[bp+var_10], ax
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp+var_12], ax
		mov	di, [bp+var_6]
		add	di, 0Bh
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	cx, [bp+var_C]
		mov	ax, [bp+var_A]
		add	ax, 0FFF5h
		mov	[bp+var_4], ax
		mov	ax, cx
		add	ax, 0FFFEh
		mov	bx, 8
		cwd
		idiv	bx
		mov	[si+75h], ax
		mov	[bp+var_14], di
		mov	ax, [bp+var_2]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		mov	[bp+var_1A], cx
		mov	ax, [si+75h]
		mov	[bp+var_1C], ax
		mov	ax, si
		add	ax, 73h
		mov	[bp+var_1E], ax
		mov	ax, si
		add	ax, 7Bh
		mov	[bp+var_20], ax
		push	34h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_23990
		push	[bp+var_1A]
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+var_14]
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 49Ah
		mov	word ptr [di+24h], 492h
		xor	ax, ax
		mov	[di+28h], ax
		mov	[di+26h], ax
		mov	word ptr [di+24h], 496h
		mov	word ptr [di+2Ah], 0
		mov	word ptr [di+2Ch], 0
		and	byte ptr [di+10h], 0FDh
		mov	word ptr [di+16h], 0
		mov	ax, [bp+var_1C]
		mov	[di+30h], ax
		mov	ax, [bp+var_20]
		mov	[di+32h], ax
		mov	ax, [bp+var_1E]
		mov	[di+2Eh], ax
		mov	word ptr [di+1Eh], 2
		mov	word ptr [di+20h], 8
		mov	ax, di
		jmp	short loc_23992

loc_23990:
		mov	ax, di

loc_23992:
		mov	[si+83h], ax
		push	0
		push	word ptr [si+83h]
		push	si
		call	sub_208FD
		add	sp, 6
		mov	di, [bp+var_6]
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0Bh
		mov	cx, [bp+var_C]
		push	0
		mov	[bp+var_22], di
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_26], ax
		mov	[bp+var_28], cx
		push	58h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_23A12
		push	[bp+var_28]
		push	[bp+var_26]
		push	[bp+var_24]
		push	[bp+var_22]
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 22C2h
		push	di
		call	sub_2105B
		pop	cx
		mov	word ptr [di+0Eh], 22FEh
		mov	byte ptr [di+1Eh], 1
		mov	ax, [bp+var_26]
		mov	[di+1Fh], ax
		mov	ax, [di+1Fh]
		add	ax, 0FFFEh
		mov	[di+45h], ax
		mov	ax, di
		jmp	short loc_23A14

loc_23A12:
		mov	ax, di

loc_23A14:
		mov	[si+7Dh], ax
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	word ptr [si+83h]
		mov	ax, si
		add	ax, 73h
		push	ax
		push	word ptr [si+75h]
		push	word ptr [si+77h]
		push	word ptr [si+7Dh]
		mov	bx, [si+7Dh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	di, [bp+var_E]
		add	di, [bp+var_12]
		add	di, 0FFE7h
		mov	ax, [bp+var_10]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 18h
		mov	cx, 0Ah
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_23A63
		jmp	loc_23AF0

loc_23A63:
		push	1
		mov	[bp+var_2A], di
		mov	ax, [bp+var_2]
		mov	[bp+var_2C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_2E], ax
		mov	[bp+var_30], cx
		mov	ax, si
		add	ax, 7Bh
		mov	[bp+var_32], ax
		push	2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_23AE4
		push	[bp+var_30]
		push	[bp+var_2E]
		push	[bp+var_2C]
		push	[bp+var_2A]
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 225Ah
		mov	word ptr [di+24h], 0
		push	2256h
		push	di
		call	PaletteScreen_ReleaseResources_22EE4
		add	sp, 4
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_5BF22
		mov	[di+28h], ax
		mov	[di+26h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 228Eh
		mov	ax, [bp+var_32]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	ax, di
		jmp	short loc_23AE6

loc_23AE4:
		mov	ax, di

loc_23AE6:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6

loc_23AF0:
		pop	di
		pop	si
		leave
		retf
sub_2388C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23AF4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+83h]
		mov	ax, si
		add	ax, 73h
		push	ax
		push	word ptr [si+75h]
		push	word ptr [si+77h]
		push	word ptr [si+7Dh]
		mov	bx, [si+7Dh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_23AF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AITargeting_Helper4_B765C (sub_B765C de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à AITargeting_Helper4_86948 (sub_86948 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe
; visible (21 lignes).
; ==============================================================================================
AITargeting_Helper4_23B1F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+83h], 0
		jz	short loc_23B3C
		push	word ptr [si+83h]
		mov	bx, [si+83h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_23B3C:
		pop	si
		pop	bp
		retf
AITargeting_Helper4_23B1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23B3F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_23428
		add	sp, 6
		or	al, al
		jz	short loc_23B64
		inc	word ptr [si+77h]

loc_23B64:
		mov	ax, [si+77h]
		mov	[bp+var_2], ax
		mov	bx, [si+83h]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_23AF4
		pop	cx
		pop	si
		leave
		retf
sub_23B3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23B7A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_23531
		add	sp, 4
		or	al, al
		jz	short loc_23B9D
		dec	word ptr [si+77h]

loc_23B9D:
		mov	ax, [si+77h]
		mov	[bp+var_2], ax
		mov	bx, [si+83h]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_23AF4
		pop	cx
		pop	si
		leave
		retf
sub_23B7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23BB3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	[bp+arg_6]
		push	di
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_234B1
		add	sp, 8
		or	al, al
		jz	short loc_23BDE
		add	[si+77h], di

loc_23BDE:
		mov	ax, [si+77h]
		mov	[bp+var_2], ax
		mov	bx, [si+83h]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_23AF4
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_23BB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23BF5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_235BE
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_23BF5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23C11		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23C47
		mov	word ptr [si+0Eh], 225Ah
		push	word ptr [si+24h]
		call	sub_33B
		pop	cx
		mov	word ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_23C47
		push	si
		call	sub_33B
		pop	cx

loc_23C47:
		pop	di
		pop	si
		pop	bp
		retf
sub_23C11		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23C4B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23C83
		mov	word ptr [si+0Eh], 225Ah
		push	word ptr [si+24h]
		call	sub_33B
		pop	cx
		mov	word ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_23C83
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_23C83

loc_23C83:
		pop	di
		pop	si
		pop	bp
		retf
sub_23C4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseStyleAndObject_B5041 (sub_B5041 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_23C87		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23CAC
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_23CAC
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_23CAC

loc_23CAC:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_23C87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseStyleAndObject_B5041 (sub_B5041 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_23CB0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23CD5
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_23CD5
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_23CD5

loc_23CD5:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_23CB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23CD9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23D13
		mov	word ptr [si], 233Ah
		mov	word ptr [si], 2346h
		cmp	byte ptr [si+6], 0
		jz	short loc_23D01
		push	word ptr [si+4]
		call	sub_33B
		pop	cx
		jmp	short loc_23D01

loc_23D01:
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_23D13
		push	si
		call	sub_33B
		pop	cx

loc_23D13:
		pop	di
		pop	si
		pop	bp
		retf
sub_23CD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23D17		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23D4D
		mov	word ptr [si], 2346h
		cmp	byte ptr [si+6], 0
		jz	short loc_23D3B
		push	word ptr [si+4]
		call	sub_33B
		pop	cx
		jmp	short loc_23D3B

loc_23D3B:
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_23D4D
		push	si
		call	sub_33B
		pop	cx

loc_23D4D:
		pop	di
		pop	si
		pop	bp
sub_23D17		endp
seg051		ends
