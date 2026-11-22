ovr344		segment	para public 'OVERLAY' use16
		assume cs:ovr344
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD330		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Ah
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_BD358
		push	[bp+arg_2]
		push	bx
		call	TextScrollDisplayB_TickHelper_54567
		add	sp, 4
		or	al, al
		jz	short loc_BD358
		mov	al, 1
		jmp	short loc_BD38D

loc_BD358:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1Dh], 0
		jz	short loc_BD38B
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_BD36F
		mov	ax, 1
		jmp	short loc_BD371

loc_BD36F:
		xor	ax, ax

loc_BD371:
		or	ax, ax
		jz	short loc_BD38B
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Ah
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_BD38B
		mov	ax, 1
		jmp	short loc_BD38D

loc_BD38B:
		xor	ax, ax

loc_BD38D:
		pop	bp
		retf
sub_BD330		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD38F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_BD3A1
		jmp	loc_BD45A

loc_BD3A1:
		push	si
		nop
		push	cs
		call	near ptr sub_BD45E
		pop	cx
		push	65D0h
		call	sub_741E8
		pop	cx
		mov	word_79B8C, 0
		mov	word ptr [si+0CAh], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 0ECh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+0ECh], 0
		mov	byte ptr [si+7Fh], 0
		push	word ptr [si+79h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+79h], 0
		mov	ax, si
		add	ax, 40h
		push	ax
		call	sub_75319
		pop	cx
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	sub_753BE
		pop	cx
		mov	ax, si
		add	ax, 34h
		push	ax
		call	sub_7539B
		pop	cx
		mov	ax, si
		add	ax, 2Eh
		push	ax
		call	sub_75373
		pop	cx
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_75369
		pop	cx
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_7535A
		pop	cx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_7534B
		pop	cx
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	sub_7533C
		pop	cx
		test	di, 1
		jz	short loc_BD45A
		push	si
		call	sub_3B2
		pop	cx

loc_BD45A:
		pop	di
		pop	si
		pop	bp
		retf
sub_BD38F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD45E		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	sub_7533C
		pop	cx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_7534B
		pop	cx
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_7535A
		pop	cx
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_75369
		pop	cx
		mov	ax, si
		add	ax, 2Eh
		push	ax
		call	sub_75373
		pop	cx
		mov	ax, si
		add	ax, 34h
		push	ax
		call	sub_7539B
		pop	cx
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	sub_753BE
		pop	cx
		mov	ax, si
		add	ax, 40h
		push	ax
		call	sub_75319
		pop	cx
		mov	word ptr [si+0CAh], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 0ECh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+0ECh], 0
		mov	byte ptr [si+7Fh], 0
		push	word ptr [si+79h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+79h], 0
		xor	ax, ax
		mov	[si+61h], ax
		mov	[si+5Fh], ax
		mov	dword ptr [si+65h], 0
		cmp	word ptr [si+48h], 0
		jz	short loc_BD535
		push	0
		push	1
		mov	ax, [si+48h]
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	word ptr [si+48h], 0

loc_BD535:
		push	6444h
		call	sub_29210
		pop	cx
		push	29Bh
		call	GameVar_ClearFlag_56520
		pop	cx
		pop	si
		leave
		retf
sub_BD45E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD54A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	sub_75231
		push	si
		push	cs
		call	near ptr sub_BD45E
		pop	cx
		call	sub_6CB4D
		call	sub_5EB2A
		cmp	byte_79BF4, 0
		jz	short loc_BD576
		push	si
		nop
		push	cs
		call	near ptr sub_BE20B
		pop	cx
		jmp	short loc_BD580

loc_BD576:
		push	si
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_LoadFromIFF_BD743
		add	sp, 4

loc_BD580:
		push	0FFFFh
		call	PagedResourceB_Helper_66268
		pop	cx
		push	0FFh
		call	sub_64C31
		pop	cx
		pop	si
		pop	bp
		retf
sub_BD54A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD594		proc far

var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	bx, [bp+arg_2]
		mov	eax, [bx+72h]
		mov	ebx, 9
		cdq
		idiv	ebx
		mov	[di+4Ah], ax
		push	1
		push	0
		push	1
		mov	ax, [di+4Ah]
		shl	ax, 2
		movsx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[di+48h], ax
		jmp	short loc_BD64D

loc_BD5DB:
		mov	[bp+var_A], 0
		cmp	[bp+var_A], 0
		jnz	short loc_BD5F8
		mov	ax, [bp+arg_2]
		add	ax, 0ACh
		mov	word ptr [bp+var_A+2], ds
		mov	word ptr [bp+var_A], ax
		jmp	short loc_BD5F8

loc_BD5F8:
		push	large 8
		push	large [bp+var_A]
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	[bp+arg_2]
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_B], 0
		mov	al, [bp+var_B]
		push	ax
		push	ds
		mov	ax, [bp+arg_2]
		add	ax, 0ACh
		push	ax
		push	65D0h
		call	sub_742E8
		add	sp, 8
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		mov	ax, [bp+var_2]
		shl	ax, 2
		mov	bx, [di+48h]
		add	bx, ax
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_6]
		mov	[bx+2], ax
		mov	[bx], dx
		inc	[bp+var_2]

loc_BD64D:
		mov	bx, [bp+arg_2]
		test	word ptr [bx+72h], 1
		jz	short loc_BD66C
		mov	si, [bp+arg_2]
		mov	eax, [si+76h]
		dec	eax
		cmp	[bx+65h], eax
		jnz	short loc_BD66C
		inc	dword ptr [bx+65h]
		jmp	short loc_BD66C

loc_BD66C:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_BD67E
		mov	ax, 1
		jmp	short loc_BD680

loc_BD67E:
		xor	ax, ax

loc_BD680:
		or	ax, ax
		jnz	short loc_BD687
		jmp	loc_BD5DB

loc_BD687:
		pop	di
		pop	si
		leave
		retf
sub_BD594		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD68B		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	word_79B8C, si
		mov	dword ptr [si+65h], 0
		mov	word ptr [si+48h], 0
		xor	ax, ax
		mov	[si+63h], ax
		mov	[si+61h], ax
		mov	[si+5Fh], ax
		mov	[bp+var_4], 3200h
		mov	eax, [bp+var_4]
		mov	dword_79B97, eax
		mov	byte ptr [si+19h], 0
		mov	al, 0
		mov	byte_77698, al
		mov	byte_7769E, al
		mov	byte_7769F, al
		mov	byte_76E25, 1
		xor	dx, dx
		jmp	short loc_BD6E4

loc_BD6D9:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+0BAh], 0
		inc	dx

loc_BD6E4:
		cmp	dx, 8
		jl	short loc_BD6D9
		mov	word ptr [si+0CAh], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 0ECh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+0ECh], 0
		mov	word ptr [si+0CAh], 0
		push	1
		push	0
		push	2
		push	large 90h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+0EEh], dx
		mov	[si+0ECh], ax
		push	2BCh
		push	6444h
		call	sub_291C8
		add	sp, 4
		pop	si
		leave
		retf
sub_BD68B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (structure) Lit un fichier de mission : MISN, VERS, NAME, CAMP, TUNE,
; WRLD, FILE, CAST, AREA, SPOT, NUMS, MSGS, PROG (ProgBuffer_LoadRawAndCountMarkers_BF8E9),
; PART (PartEntry_AllocateArray_BF7F9), TEAM, PLAY, LOAD, HOME. Appelée par sub_877A0 (départ
; en vol) et Gameflow_MeditScreen_E3D9D.
; ==============================================================================================
MissionScenario_LoadFromIFF_BD743		proc far

var_182		= word ptr -182h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= word ptr -136h
var_112		= word ptr -112h
var_B5		= dword ptr -0B5h
var_B1		= dword ptr -0B1h
var_AD		= dword ptr -0ADh
var_A5		= byte ptr -0A5h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= word ptr -98h
var_96		= word ptr -96h
var_6A		= dword ptr -6Ah
var_66		= word ptr -66h
var_5E		= byte ptr -5Eh
var_5C		= word ptr -5Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 182h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_BD68B
		pop	cx
		mov	[bp+var_2], di
		push	8
		push	[bp+var_2]
		push	si
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+8], 0
		push	si
		call	CRT_Strupr_30EF
		pop	cx
		mov	eax, [si]
		cmp	eax, dword_79BFE
		jnz	short loc_BD78E
		mov	eax, [si+4]
		cmp	eax, dword_79C02
		jnz	short loc_BD78E
		mov	ax, 1
		jmp	short loc_BD790

loc_BD78E:
		xor	ax, ax

loc_BD790:
		or	al, al
		jz	short loc_BD7BA
		push	ds
		push	offset aIFF_1
		push	ds
		push	di
		push	ds
		push	offset a__2
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	344Ch
		push	0FBCh
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_BD807

loc_BD7BA:
		mov	eax, [si]
		cmp	eax, dword_79C06
		jnz	short loc_BD7D4
		mov	eax, [si+4]
		cmp	eax, dword_79C0A
		jnz	short loc_BD7D4
		mov	ax, 1
		jmp	short loc_BD7D6

loc_BD7D4:
		xor	ax, ax

loc_BD7D6:
		or	al, al
		jz	short loc_BD7EF
		push	ds
		push	offset aIFF_2
		push	ds
		push	di
		push	ds
		push	offset a__3
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_BuildComposite
		jmp	short loc_BD804

loc_BD7EF:
		push	seg seg225
		push	0
		push	ds
		push	di
		push	ds
		push	offset aMISSIONS_1
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_29540

loc_BD804:
		add	sp, 0Eh

loc_BD807:
		lea	ax, [bp+var_112]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_112], 508h
		mov	[bp+var_B1], 100h
		mov	[bp+var_B5], 0
		mov	[bp+var_112], 520h
		mov	[bp+var_96], 0
		xor	ax, ax
		mov	[bp+var_98], ax
		movsx	eax, ax
		mov	[bp+var_AD], eax
		mov	[bp+var_112], 3529h
		mov	[bp+var_6A], 0
		mov	[bp+var_5E], 0
		push	large 4E53494Dh
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD875
		jmp	loc_BDE0B

loc_BD875:
		xor	di, di
		push	0
		push	large 53524556h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BD89D
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	di, ax

loc_BD89D:
		cmp	di, 500h
		jge	short loc_BD8B2
		push	500h
		push	di
		push	3502h
		call	Runtime_FatalErrorHandler_68BA2
		add	sp, 6

loc_BD8B2:
		push	0
		push	large 454D414Eh
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BD8FF
		cmp	[bp+var_A0], 10h
		jl	short loc_BD8DC
		push	9018h
		call	sub_1DDFE
		pop	cx

loc_BD8DC:
		push	large [bp+var_A0]
		push	ds
		mov	ax, si
		add	ax, 9
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_A0]
		mov	byte ptr [bx+si+9], 0
		jmp	short loc_BD90F

loc_BD8FF:
		mov	byte ptr [si+9], 55h
		mov	byte ptr [si+0Ah], 4Eh
		mov	byte ptr [si+0Bh], 4Bh
		mov	byte ptr [si+0Ch], 0

loc_BD90F:
		push	0F9Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_BD91F
		jmp	loc_BDA11

loc_BD91F:
		push	0
		push	large 504D4143h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD93B
		jmp	loc_BDA11

loc_BD93B:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+4Ch], al
		xor	di, di
		jmp	short loc_BD978

loc_BD94D:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		mov	[bx+si+4Dh], al
		cmp	byte ptr [si+4Ch], 0
		jz	short loc_BD977
		mov	al, [bx+si+4Dh]
		mov	ah, 0
		push	ax
		mov	ax, di
		add	ax, 0A0h
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4

loc_BD977:
		inc	di

loc_BD978:
		cmp	di, 9
		jl	short loc_BD94D
		xor	di, di
		jmp	short loc_BD992

loc_BD981:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		mov	[bx+si+56h], al
		inc	di

loc_BD992:
		cmp	di, 9
		jl	short loc_BD981
		mov	[bp+var_A], 47h
		mov	di, 3Ch
		jmp	short loc_BD9B7

loc_BD9A1:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		push	ax
		push	di
		call	GameVar_Set_564BB
		add	sp, 4
		inc	di

loc_BD9B7:
		cmp	di, [bp+var_A]
		jl	short loc_BD9A1
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		push	ax
		push	47h
		call	GameVar_Set_564BB
		add	sp, 4
		mov	[bp+var_A], 99h
		mov	di, 96h
		jmp	short loc_BD9F5

loc_BD9DC:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_C], ax
		push	ax
		push	di
		call	GameVar_Set_564BB
		add	sp, 4
		inc	di

loc_BD9F5:
		cmp	di, [bp+var_A]
		jl	short loc_BD9DC
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		push	ax
		push	1B3Fh
		call	GameVar_Set_564BB
		add	sp, 4

loc_BDA11:
		push	0
		push	large 454E5554h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDA38
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	byte_79B8E, al

loc_BDA38:
		push	0
		push	large 444C5257h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_BDACA
		push	0
		push	large 454C4946h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDAB3
		mov	[bp+var_8], 0
		cmp	[bp+var_8], 0
		jnz	short loc_BDA84
		lea	ax, [bp+var_66]
		mov	word ptr [bp+var_8+2], ds
		mov	word ptr [bp+var_8], ax
		jmp	short loc_BDA84

loc_BDA84:
		push	large 8
		push	large [bp+var_8]
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_66]
		push	ax
		call	sub_75240
		pop	cx
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0
		jmp	short loc_BDABE

loc_BDAB3:
		lea	ax, [bp+var_112]
		push	ax
		call	sub_75236
		pop	cx

loc_BDABE:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_BDAD2

loc_BDACA:
		push	9015h
		call	sub_1DDFE

loc_BDAD2:
		pop	cx
		push	0
		push	large 54534143h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDB0E
		lea	ax, [bp+var_112]
		push	ax
		mov	ax, si
		add	ax, 2Eh
		push	ax
		call	sub_7536E
		add	sp, 4
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDB0E:
		push	0
		push	large 41455241h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDB49
		lea	ax, [bp+var_112]
		push	ax
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	sub_75337
		add	sp, 4
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDB49:
		push	0
		push	large 544F5053h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDB85
		lea	ax, [bp+var_112]
		push	ax
		push	si
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_75346
		add	sp, 6
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDB85:
		push	0
		push	large 534D554Eh
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDBC0
		lea	ax, [bp+var_112]
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_75355
		add	sp, 4
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDBC0:
		push	0
		push	large 5347534Dh
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDBFB
		lea	ax, [bp+var_112]
		push	ax
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_75364
		add	sp, 4
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDBFB:
		push	0
		push	large 474F5250h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDC4B
		test	[bp+var_A0], 1
		jz	short loc_BDC28
		push	9116h
		call	sub_1DDFE
		pop	cx

loc_BDC28:
		lea	ax, [bp+var_112]
		push	ax
		push	si
		mov	ax, si
		add	ax, 40h
		push	ax
		call	sub_75314
		add	sp, 6
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDC4B:
		push	0
		push	large 54524150h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDC86
		lea	ax, [bp+var_112]
		push	ax
		mov	ax, si
		add	ax, 34h
		push	ax
		call	sub_75396
		add	sp, 4
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDC86:
		mov	word ptr [si+9Dh], 0
		push	0
		push	large 4D414554h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDCDF
		mov	eax, [bp+var_A0]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[si+9Dh], ax
		cmp	word ptr [si+9Dh], 0Ch
		jle	short loc_BDCC9
		push	9016h
		call	sub_1DDFE
		pop	cx

loc_BDCC9:
		push	ds
		mov	ax, si
		add	ax, 85h
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		jmp	short loc_BDCE8

loc_BDCDF:
		push	9017h
		call	sub_1DDFE
		pop	cx

loc_BDCE8:
		push	0
		push	large 59414C50h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_BDD20
		lea	ax, [bp+var_112]
		push	ax
		push	si
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	sub_753B9
		add	sp, 6
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_BDD20:
		push	104h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_BDD62
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDD62
		lea	ax, [bp+var_112]
		push	ax
		push	si
		push	cs
		call	near ptr sub_BD594
		add	sp, 4
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0

loc_BDD62:
		push	0
		push	large 454D4F48h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BDDE8
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_A], ax
		push	ax
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	PtrList_GetAt_54919
		add	sp, 4
		mov	[si+6Bh], dx
		mov	[si+69h], ax
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+6Dh], eax
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+71h], eax
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+75h], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_AD], eax
		mov	[bp+var_A5], 0
		jmp	short loc_BDDFF

loc_BDDE8:
		mov	dword ptr [si+69h], 0
		xor	eax, eax
		mov	[si+75h], eax
		mov	[si+71h], eax
		mov	[si+6Dh], eax

loc_BDDFF:
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_BDE13

loc_BDE0B:
		push	9018h
		call	sub_1DDFE

loc_BDE13:
		pop	cx
		push	large 0
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	Scene_FindByArea_54B92
		add	sp, 6
		mov	[si+5Fh], ax
		cmp	word ptr [si+5Fh], 0
		jnz	short loc_BDE37
		push	9019h
		call	sub_1DDFE
		pop	cx

loc_BDE37:
		push	word ptr [si+5Fh]
		call	Scene_TriggerActivation_54AB2
		pop	cx
		push	104h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_BDE50
		jmp	loc_BDFFA

loc_BDE50:
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_ConvertFieldValue_BE154
		pop	cx
		mov	[si+67h], dx
		mov	[si+65h], ax
		cmp	dword ptr [si+65h], 0
		jz	short loc_BDE6E
		les	bx, [si+65h]
		cmp	word ptr es:[bx+56h], 0
		jnz	short loc_BDE77

loc_BDE6E:
		push	9999h
		call	sub_1DDFE
		pop	cx

loc_BDE77:
		les	bx, [si+65h]
		or	byte ptr es:[bx+39h], 10h
		or	byte ptr es:[bx+39h], 20h
		mov	ax, es:[bx+56h]
		mov	[bp+var_4], ax
		push	ax
		push	63AAh
		call	SetReference16
		add	sp, 4
		mov	bx, word_7CADA
		mov	eax, [bx+0Eh]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_136]
		push	ss
		push	ax
		les	bx, word ptr [bp+var_8]
		push	large es:[bx+88h]
		mov	cx, 24h
		call	CRT_Fmemcpy
		push	3503h
		call	sub_51B93
		pop	cx
		lea	ax, [bp+var_136]
		push	ax
		push	67B7h
		call	sub_737E1
		add	sp, 4
		push	3513h
		call	sub_51B93
		pop	cx
		les	bx, word ptr [bp+var_8]
		cmp	dword ptr es:[bx+8Ch], 0
		jz	short loc_BDF0C
		lea	ax, [bp+var_182]
		push	ss
		push	ax
		push	large es:[bx+8Ch]
		mov	cx, 34h
		call	CRT_Fmemcpy
		lea	ax, [bp+var_182]
		push	ax
		push	67B7h
		call	sub_737E6
		add	sp, 4

loc_BDF0C:
		push	0
		cmp	dword ptr [si+65h], 0
		jz	short loc_BDF2F
		push	large [si+65h]
		push	ss
		lea	ax, word ptr [bp+var_142]
		push	ax
		call	sub_544F5
		add	sp, 8
		mov	dx, ss
		lea	ax, word ptr [bp+var_142]
		jmp	short loc_BDF50

loc_BDF2F:
		mov	eax, dword_79CEC
		mov	[bp+var_142], eax
		mov	eax, dword_79CF0
		mov	[bp+var_13E], eax
		mov	eax, dword_79CF4
		mov	[bp+var_13A], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_142]

loc_BDF50:
		lea	ax, word ptr [bp+var_142]
		push	ax
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	Scene_DetectAndActivateChange_54BCF
		add	sp, 6
		mov	[si+61h], ax
		cmp	word ptr [si+61h], 0
		jz	short loc_BDFA0
		cmp	dword ptr [si+69h], 0
		jnz	short loc_BDFA0
		push	large [si+65h]
		push	ss
		lea	ax, word ptr [bp+var_14E]
		push	ax
		call	sub_544F5
		add	sp, 8
		mov	eax, [bp+var_14E]
		mov	[si+6Dh], eax
		mov	eax, [bp+var_14A]
		mov	[si+71h], eax
		mov	eax, [bp+var_146]
		mov	[si+75h], eax

loc_BDFA0:
		push	si
		mov	ax, si
		add	ax, 79h
		push	ax
		call	Lexer_CountTokensAndFormat
		add	sp, 4
		cmp	byte_7CB1C, 0
		jz	short loc_BDFD1
		cmp	byte_76D44, 0
		jz	short loc_BDFC7
		push	word_79E73
		call	StreamReader_ReportError_5B025
		pop	cx

loc_BDFC7:
		push	word_79E73
		call	StreamReader_ReportError_5B03A
		pop	cx

loc_BDFD1:
		cmp	word_79E6F, 0
		jz	short loc_BDFE9
		push	0FFFFh
		push	3522h
		push	word_79E6F
		call	sub_75419
		add	sp, 6

loc_BDFE9:
		push	29Ah
		call	GameVar_ClearFlag_56520
		pop	cx
		push	54h
		call	GameVar_ClearFlag_56520
		pop	cx

loc_BDFFA:
		mov	[bp+var_112], 520h
		lea	ax, [bp+var_112]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_112]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
MissionScenario_LoadFromIFF_BD743		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_Helper_A8A40 (sub_A8A40 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; aucun appel externe visible (49 lignes, rôle exact non détaillé).
; ==============================================================================================
MissionScenario_Helper_BE01E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		xor	dx, dx
		sub	ax, [si+36h]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 59h
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_BE05B

loc_BE049:
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+si+85h]
		cmp	ax, [bp+var_2]
		jnz	short loc_BE05A
		mov	al, 1
		jmp	short loc_BE063

loc_BE05A:
		inc	dx

loc_BE05B:
		cmp	[si+9Dh], dx
		jg	short loc_BE049
		mov	al, 0

loc_BE063:
		pop	si
		leave
		retf
MissionScenario_Helper_BE01E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE066		proc far

var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_ResolveFieldChain_BE197
		pop	cx
		mov	[bp+var_2], 0
		jmp	short loc_BE0EC

loc_BE081:
		mov	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+si+85h]
		mov	ax, si
		add	ax, 34h
		push	ax
		call	Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_BE0AD
		mov	ax, 1
		jmp	short loc_BE0AF

loc_BE0AD:
		xor	ax, ax

loc_BE0AF:
		or	ax, ax
		jz	short loc_BE0E9
		les	bx, [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BE0E9
		mov	al, es:[bx+39h]
		shl	ax, 0Ah
		sar	ax, 0Fh
		mov	[bp+var_7], al
		cmp	[bp+var_7], 0
		jz	short loc_BE0E9
		mov	ax, es:[bx+56h]
		mov	dx, di
		shl	dx, 1
		mov	bx, [bp+arg_2]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_BE0E9:
		inc	[bp+var_2]

loc_BE0EC:
		mov	ax, [si+9Dh]
		cmp	ax, [bp+var_2]
		jg	short loc_BE081
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_BE066		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_ResolveFieldEntry_A8B37 (sub_A8B37 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 65 lignes, NON DÉTAILLÉE — appelle Expr_LookupTableEntry85B_52D45 (seg114).
; ==============================================================================================
MissionScenario_ResolveFieldEntry_BE0FB		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_BE145

loc_BE10F:
		mov	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+si+85h]
		mov	ax, si
		add	ax, 34h
		push	ax
		call	Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, [bp+arg_2]
		add	bx, ax
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_6]
		mov	[bx+2], ax
		mov	[bx], dx
		inc	di
		inc	[bp+var_2]

loc_BE145:
		mov	ax, [si+9Dh]
		cmp	ax, [bp+var_2]
		jg	short loc_BE10F
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveFieldEntry_BE0FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionScenario_ConvertFieldValue_A8B8F (sub_A8B8F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; Expr_Node_LookupAndConvert_52D69 (seg114).
; ==============================================================================================
MissionScenario_ConvertFieldValue_BE154		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	ds
		push	offset aPLAYER
		mov	ax, dx
		add	ax, 34h
		push	ax
		call	Expr_Node_LookupAndConvert_54636
		add	sp, 6
		pop	bp
		retf
MissionScenario_ConvertFieldValue_BE154		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_ResolveFieldEntryB_A8BA9 (sub_A8BA9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Expr_LookupTableEntry85B_52D45 (seg114).
; ==============================================================================================
MissionScenario_ResolveFieldEntryB_BE16E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+9Dh], 0
		jz	short loc_BE182
		mov	ax, [si+85h]
		jmp	short loc_BE185

loc_BE182:
		mov	ax, 0FFFFh

loc_BE185:
		push	ax
		mov	ax, si
		add	ax, 34h
		push	ax
		call	Expr_LookupTableEntry85B_54612
		add	sp, 4
		pop	si
		pop	bp
		retf
MissionScenario_ResolveFieldEntryB_BE16E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_ResolveFieldChain_A8BD1 (sub_A8BD1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine MissionScenario_ResolveFieldEntryB_A8BA9 et Expr_LookupTableEntry85B_52D45.
; ==============================================================================================
MissionScenario_ResolveFieldChain_BE197		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr MissionScenario_ResolveFieldEntryB_BE16E
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_BE203
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	di, 1
		jmp	short loc_BE1FD

loc_BE1C6:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+85h]
		mov	ax, si
		add	ax, 34h
		push	ax
		call	Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_BE1FC
		les	bx, word ptr [bp+var_A]
		mov	al, es:[bx+32h]
		mov	ah, 0
		cmp	ax, [bp+var_6]
		jnz	short loc_BE1FC
		mov	ax, word ptr [bp+var_A]
		jmp	short loc_BE207

loc_BE1FC:
		inc	di

loc_BE1FD:
		cmp	[si+9Dh], di
		jg	short loc_BE1C6

loc_BE203:
		xor	dx, dx
		xor	ax, ax

loc_BE207:
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveFieldChain_BE197		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE20B		proc far

var_128		= word ptr -128h
var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_93		= dword ptr -93h
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 128h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte_79BF4, 1
		push	seg seg225
		push	0
		push	ds
		push	offset aOP2MISN
		push	ds
		push	offset a__4
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_F8], 508h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 520h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	large 4E564E49h
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_BE290
		jmp	loc_BE497

loc_BE290:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BE2B7
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		call	String_ConstructFromPtrLen
		add	sp, 4

loc_BE2B7:
		push	0
		push	large 4749524Fh
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BE2E2
		lea	ax, [bp+var_F8]
		push	ax
		push	68D0h
		call	String_ConstructFromPtrLen
		add	sp, 4
		jmp	short loc_BE2EB

loc_BE2E2:
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_BE2EB:
		push	0
		push	large 454D414Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BE334
		cmp	[bp+var_86], 14h
		jl	short loc_BE315
		push	901Bh
		call	sub_1DDFE
		pop	cx

loc_BE315:
		push	large [bp+var_86]
		push	ds
		push	offset unk_776C4
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_86]
		mov	byte ptr [bx+0F94h], 0

loc_BE334:
		push	0
		push	large 4D414E53h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BE37D
		cmp	[bp+var_86], 14h
		jl	short loc_BE35E
		push	901Bh
		call	sub_1DDFE
		pop	cx

loc_BE35E:
		push	large [bp+var_86]
		push	ds
		push	offset unk_776D8
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_86]
		mov	byte ptr [bx+0FA8h], 0

loc_BE37D:
		push	0
		push	large 4C4C4143h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BE3C6
		cmp	[bp+var_86], 14h
		jl	short loc_BE3A7
		push	901Bh
		call	sub_1DDFE
		pop	cx

loc_BE3A7:
		push	large [bp+var_86]
		push	ds
		push	offset unk_776EC
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_86]
		mov	byte ptr [bx+0FBCh], 0

loc_BE3C6:
		push	0
		push	large 4D414554h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BE438
		xor	di, di
		jmp	short loc_BE3FF

loc_BE3E3:
		lea	ax, [bp+var_F8]
		push	ax
		mov	ax, di
		imul	ax, ax, 9
		mov	dx, si
		add	dx, ax
		add	dx, 9Fh
		push	dx
		call	String_ConstructFromPtrLen
		add	sp, 4
		inc	di

loc_BE3FF:
		test	word ptr [bp+var_86], 1
		jz	short loc_BE41C
		mov	eax, [bp+var_82]
		dec	eax
		cmp	eax, [bp+var_93]
		jnz	short loc_BE41C
		inc	[bp+var_93]
		jmp	short loc_BE41C

loc_BE41C:
		mov	eax, [bp+var_93]
		cmp	eax, [bp+var_82]
		jl	short loc_BE42D
		mov	ax, 1
		jmp	short loc_BE42F

loc_BE42D:
		xor	ax, ax

loc_BE42F:
		or	ax, ax
		jnz	short loc_BE438
		cmp	di, 3
		jl	short loc_BE3E3

loc_BE438:
		push	si
		push	si
		push	cs
		call	near ptr MissionScenario_LoadFromIFF_BD743
		add	sp, 4
		lea	ax, [bp+var_128]
		push	ax
		push	si
		push	cs
		call	near ptr MissionScenario_ResolveFieldEntry_BE0FB
		add	sp, 4
		lea	ax, [bp+var_F8]
		push	ax
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_753CD
		add	sp, 4
		push	0
		push	large 52594C50h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_BE4A0
		lea	ax, [bp+var_F8]
		push	ax
		push	large [si+65h]
		call	sub_7538C
		add	sp, 6
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_BE49F

loc_BE497:
		push	901Ah
		call	sub_1DDFE

loc_BE49F:
		pop	cx

loc_BE4A0:
		mov	[bp+var_F8], 520h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BE20B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE4C4		proc far

var_142		= word ptr -142h
var_E5		= dword ptr -0E5h
var_E1		= dword ptr -0E1h
var_DD		= dword ptr -0DDh
var_C8		= word ptr -0C8h
var_C6		= word ptr -0C6h
var_9A		= word ptr -9Ah
var_6A		= word ptr -6Ah
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_B		= word ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 142h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	seg seg225
		push	0
		push	ds
		push	offset aMISN2OP
		push	ds
		push	offset a__4
		lea	ax, [bp+var_6A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_9A]
		push	ax
		push	si
		push	cs
		call	near ptr MissionScenario_ResolveFieldEntry_BE0FB
		add	sp, 4
		mov	[bp+var_2], ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_142], 508h
		mov	[bp+var_E1], 100h
		mov	[bp+var_E5], 0
		mov	[bp+var_142], 520h
		mov	[bp+var_C6], 0
		xor	ax, ax
		mov	[bp+var_C8], ax
		movsx	eax, ax
		mov	[bp+var_DD], eax
		mov	[bp+var_142], 15AEh
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	al, 0
		push	large 0
		push	large 4E564E49h
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766BF
		pop	cx
		push	large 0
		push	large 4F464E49h
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], si
		push	large [bp+var_DD]
		push	large 8
		push	large [bp+var_6]
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 8
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 4749524Fh
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		mov	word ptr [bp+var_A+2], ds
		mov	word ptr [bp+var_A], 68D0h
		push	large [bp+var_DD]
		push	large 8
		push	large [bp+var_A]
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 8
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 54415453h
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_BE648

loc_BE61C:
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+0BAh]
		mov	[bp+var_C], ax
		push	large [bp+var_DD]
		push	large 2
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 2
		inc	di

loc_BE648:
		cmp	di, 8
		jl	short loc_BE61C
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 5354454Ah
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		xor	di, di
		xor	cx, cx
		jmp	short loc_BE6B4

loc_BE674:
		mov	bx, cx
		shl	bx, 2
		lea	ax, [bp+var_9A]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	word ptr [bp+var_10+2], ax
		mov	word ptr [bp+var_10], dx
		mov	bx, cx
		shl	bx, 2
		lea	ax, [bp+var_9A]
		add	bx, ax
		les	bx, [bx]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_BE6B3
		les	bx, word ptr [bp+var_10]
		cmp	dword ptr es:[bx], 36312D46h
		jnz	short loc_BE6B3
		inc	di

loc_BE6B3:
		inc	cx

loc_BE6B4:
		cmp	cx, [bp+var_2]
		jl	short loc_BE674
		mov	[bp+var_C], di
		push	large [bp+var_DD]
		push	large 2
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 2
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		xor	di, di
		jmp	short loc_BE708

loc_BE6EB:
		mov	ax, si
		add	ax, 0CAh
		push	ax
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_9A]
		add	bx, ax
		push	large [bx]
		call	sub_75387
		add	sp, 6
		inc	di

loc_BE708:
		cmp	di, [bp+var_2]
		jl	short loc_BE6EB
		lea	ax, [bp+var_142]
		push	ax
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_753D2
		add	sp, 4
		push	large 0
		push	large 4C4C494Bh
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		xor	di, di
		jmp	loc_BE7FF

loc_BE73B:
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_9A]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	word ptr [bp+var_10+2], ax
		mov	word ptr [bp+var_10], dx
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+3Eh]
		mov	word ptr [bp+var_12], ax
		push	large [bp+var_DD]
		push	large 2
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 2
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+40h]
		mov	word ptr [bp+var_14], ax
		push	large [bp+var_DD]
		push	large 2
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 2
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+42h]
		mov	[bp+var_16], ax
		push	large [bp+var_DD]
		push	large 2
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 2
		push	large [bp+var_10]
		call	Mission_GetCastName_544B8
		add	sp, 4
		mov	[bp+var_18], dx
		mov	[bp+var_1A], ax
		push	large [bp+var_DD]
		push	large 8
		push	dx
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 8
		inc	di

loc_BE7FF:
		cmp	di, [bp+var_2]
		jge	short loc_BE807
		jmp	loc_BE73B

loc_BE807:
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 54495845h
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		mov	al, byte_79B9B
		mov	byte ptr [bp+var_B], al
		push	large [bp+var_DD]
		push	large 1
		push	ss
		lea	ax, [bp+var_B]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		inc	[bp+var_DD]
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 44454944h
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_BE8D9

loc_BE872:
		mov	ax, di
		imul	ax, ax, 9
		mov	dx, si
		add	dx, ax
		add	dx, 9Fh
		mov	word ptr [bp+var_10+2], dx
		push	ds
		push	dx
		mov	ax, si
		add	ax, 34h
		push	ax
		call	Expr_Node_LookupAndConvert_54636
		add	sp, 6
		mov	word ptr [bp+var_10], dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_BE8D8
		les	bx, word ptr [bp+var_12]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	al, al
		jz	short loc_BE8D8
		mov	ax, word ptr [bp+var_10+2]
		mov	word ptr [bp+var_14], ds
		mov	[bp+var_16], ax
		push	large [bp+var_DD]
		push	large 8
		push	word ptr [bp+var_14]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 8

loc_BE8D8:
		inc	di

loc_BE8D9:
		cmp	di, 3
		jl	short loc_BE872
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 524F4353h
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		cmp	dword_79B97, 0
		jge	short loc_BE910
		mov	dword_79B97, 0

loc_BE910:
		mov	eax, dword_79B97
		mov	[bp+var_10], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		push	large [bp+var_DD]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_DD], 4
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766D3
		pop	cx
		lea	ax, [bp+var_142]
		push	ax
		call	sub_766C9
		pop	cx
		mov	[bp+var_142], 520h
		lea	ax, [bp+var_142]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_142]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BE4C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE97E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+61h], 0
		jz	short loc_BE994
		push	word ptr [si+61h]
		call	Scene_RunLeavingScript_54AF6
		pop	cx

loc_BE994:
		cmp	word ptr [si+5Fh], 0
		jz	short loc_BE9A3
		push	word ptr [si+5Fh]
		call	Scene_RunLeavingScript_54AF6
		pop	cx

loc_BE9A3:
		mov	eax, [si]
		cmp	eax, dword_79BFE
		jnz	short loc_BE9BD
		mov	eax, [si+4]
		cmp	eax, dword_79C02
		jnz	short loc_BE9BD
		mov	ax, 1
		jmp	short loc_BE9BF

loc_BE9BD:
		xor	ax, ax

loc_BE9BF:
		or	al, al
		jz	short loc_BE9C8
		mov	byte_79B9B, 5

loc_BE9C8:
		push	si
		push	cs
		call	near ptr sub_BE4C4
		pop	cx
		push	si
		push	cs
		call	near ptr sub_BD45E
		pop	cx
		call	sub_7522C
		cmp	word_79E71, 0
		jz	short loc_BE9EA
		push	word_79E71
		call	sub_754BE
		pop	cx

loc_BE9EA:
		cmp	word_79E6F, 0
		jz	short loc_BE9FB
		push	word_79E6F
		call	sub_7541E
		pop	cx

loc_BE9FB:
		pop	si
		pop	bp
		retf
sub_BE97E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE9FE		proc far
		push	bp
		mov	bp, sp
		push	68D0h
		call	String_ConstructEmpty
		pop	cx
		pop	bp
		retf
sub_BE9FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEA0C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BEA40
		mov	word ptr [si], 520h
		push	si
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		test	di, 1
		jz	short loc_BEA40
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_BEA40

loc_BEA40:
		pop	di
		pop	si
		pop	bp
		retf
sub_BEA0C		endp
ovr344		ends
