ovr254		segment	para public 'OVERLAY' use16
		assume cs:ovr254
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96000		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	0
		push	large 534E5547h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96026
		jmp	loc_960C8

loc_96026:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	6Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_960B1
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	word ptr [bx], 0BC2h
		mov	dword ptr [bx+60h], 0
		mov	byte ptr [bx+64h], 2
		mov	byte ptr [bx+65h], 0
		mov	dword ptr [bx+66h], 0
		mov	word ptr [bx+6Ch], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		push	[bp+var_6]
		push	bx
		call	sub_1BB54
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_960B4

loc_960B1:
		mov	ax, [bp+var_8]

loc_960B4:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_960C8:
		push	0
		push	large 49544C41h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_960E0
		jmp	loc_96183

loc_960E0:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	75h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_9616C
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0B9Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_9616F

loc_9616C:
		mov	ax, [bp+var_8]

loc_9616F:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_96183:
		push	0
		push	large 53524941h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_9619B
		jmp	loc_9623E

loc_9619B:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96227
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0B5Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_9622A

loc_96227:
		mov	ax, [bp+var_8]

loc_9622A:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_9623E:
		push	0
		push	large 504D4F43h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96256
		jmp	loc_962F9

loc_96256:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	6Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_962E2
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0B3Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_962E5

loc_962E2:
		mov	ax, [bp+var_8]

loc_962E5:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_962F9:
		push	0
		push	large 48434154h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96311
		jmp	loc_963B4

loc_96311:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	71h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_9639D
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0B1Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_963A0

loc_9639D:
		mov	ax, [bp+var_8]

loc_963A0:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_963B4:
		push	0
		push	large 49534156h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_963CC
		jmp	loc_9646F

loc_963CC:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96458
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0AFEh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_9645B

loc_96458:
		mov	ax, [bp+var_8]

loc_9645B:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_9646F:
		push	0
		push	large 4C455546h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96487
		jmp	loc_9652A

loc_96487:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	71h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96513
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0ADEh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96516

loc_96513:
		mov	ax, [bp+var_8]

loc_96516:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_9652A:
		push	0
		push	large 4B4E4142h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96542
		jmp	loc_965E5

loc_96542:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_965CE
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0ABEh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_965D1

loc_965CE:
		mov	ax, [bp+var_8]

loc_965D1:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_965E5:
		push	0
		push	large 49524F48h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_965FD
		jmp	loc_966A0

loc_965FD:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96689
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0A9Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_9668C

loc_96689:
		mov	ax, [bp+var_8]

loc_9668C:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_966A0:
		push	0
		push	large 52414547h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_966B8
		jmp	loc_9675B

loc_966B8:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	70h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96744
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0A7Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96747

loc_96744:
		mov	ax, [bp+var_8]

loc_96747:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_9675B:
		push	0
		push	large 50414C46h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96773
		jmp	loc_96816

loc_96773:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	70h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_967FF
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0A5Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96802

loc_967FF:
		mov	ax, [bp+var_8]

loc_96802:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_96816:
		push	0
		push	large 4C415453h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_9682E
		jmp	loc_968D1

loc_9682E:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	70h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_968BA
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0A3Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_968BD

loc_968BA:
		mov	ax, [bp+var_8]

loc_968BD:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_968D1:
		push	0
		push	large 4F4D4D41h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_968E9
		jmp	loc_9698C

loc_968E9:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96975
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 0A1Eh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96978

loc_96975:
		mov	ax, [bp+var_8]

loc_96978:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_9698C:
		push	0
		push	large 534E4741h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_969A4
		jmp	loc_96A47

loc_969A4:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	71h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96A30
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 9FEh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96A33

loc_96A30:
		mov	ax, [bp+var_8]

loc_96A33:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_96A47:
		push	0
		push	large 4D4F4342h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96A5F
		jmp	loc_96B02

loc_96A5F:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	6Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96AEB
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 9DEh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96AEE

loc_96AEB:
		mov	ax, [bp+var_8]

loc_96AEE:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_96B02:
		push	0
		push	large 52445552h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_96B1A
		jmp	loc_96BBD

loc_96B1A:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	6Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_96BA6
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 8D1h
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	byte ptr [bx+11h], 0
		mov	word ptr [bx+12h], 0
		mov	word ptr [bx+14h], 0
		mov	byte ptr [bx+1Fh], 0
		mov	byte ptr [bx+20h], 1
		mov	byte ptr [bx+21h], 0
		mov	byte ptr [bx+22h], 0
		mov	ax, [bp+var_4]
		mov	[bx+2], ax
		mov	word ptr [bx], 0B7Eh
		mov	dword ptr [bx+54h], 0
		mov	byte ptr [bx+58h], 2
		mov	byte ptr [bx+59h], 0
		mov	dword ptr [bx+5Ah], 0
		mov	word ptr [bx+61h], 0
		mov	word ptr [bx+63h], 0
		mov	byte ptr [bx+6Eh], 0
		mov	word ptr [bx], 9BAh
		push	[bp+var_6]
		push	bx
		call	sub_736A0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_96BA9

loc_96BA6:
		mov	ax, [bp+var_8]

loc_96BA9:
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_96BC1
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_96BBD:
		pop	di
		pop	si
		leave
		retf
sub_96000		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScroll_AllocateAndInsert_87D74 (sub_87D74 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue et insère dans une liste (LinkedListB_InsertAtTail_5F57F, seg159).
; ==============================================================================================
TextScroll_AllocateAndInsert_96BC1		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_96BF7
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 9B6h
		mov	ax, [bp+var_4]
		mov	[di+4], ax
		mov	ax, di
		jmp	short loc_96BF9

loc_96BF7:
		mov	ax, di

loc_96BF9:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TextScroll_AllocateAndInsert_96BC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96C0A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_96C3E

loc_96C16:
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+4], 0
		jz	short loc_96C30
		push	3
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_96C30

loc_96C30:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_96C3E:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_96C16
		pop	si
		leave
		retf
sub_96C0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_ListHelperB_87E57 (sub_87E57 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle LinkedListB_Helper_5F6A9.
; ==============================================================================================
TextScroll_ListHelperB_96C57		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_96C77

loc_96C68:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx

loc_96C77:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_96C68
		pop	si
		leave
		retf
TextScroll_ListHelperB_96C57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à UI_NotifyListRepaint
; (sub_168F0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,34L — itère une collection via sub_5F6A9, appelle vtable[8] sur chaque élément :
; notification/rafraîchissement de tous les éléments d'une liste UI (ex: repaint).
; ==============================================================================================
UI_NotifyListRepaint		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_96CAB

loc_96C9C:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_96CAB:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_96C9C
		pop	si
		leave
		retf
UI_NotifyListRepaint		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96CBF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_96CDD
		mov	word ptr [si], 9B2h
		test	ax, 1
		jz	short loc_96CDD
		push	si
		call	sub_3B2
		pop	cx

loc_96CDD:
		pop	si
		pop	bp
		retf
sub_96CBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96CE0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_96CFC
		test	dx, 1
		jz	short loc_96CFC
		push	ax
		call	sub_3B2
		pop	cx
		jmp	short loc_96CFC

loc_96CFC:
		pop	bp
		retf
sub_96CE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96CFE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96D29
		mov	word ptr [si], 9BAh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96D29
		push	si
		call	sub_3B2
		pop	cx

loc_96D29:
		pop	di
		pop	si
		pop	bp
		retf
sub_96CFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96D2D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96D58
		mov	word ptr [si], 9DEh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96D58
		push	si
		call	sub_3B2
		pop	cx

loc_96D58:
		pop	di
		pop	si
		pop	bp
		retf
sub_96D2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96D5C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96D87
		mov	word ptr [si], 9FEh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96D87
		push	si
		call	sub_3B2
		pop	cx

loc_96D87:
		pop	di
		pop	si
		pop	bp
		retf
sub_96D5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96D8B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96DB6
		mov	word ptr [si], 0A1Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96DB6
		push	si
		call	sub_3B2
		pop	cx

loc_96DB6:
		pop	di
		pop	si
		pop	bp
		retf
sub_96D8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96DBA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96DE5
		mov	word ptr [si], 0A3Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96DE5
		push	si
		call	sub_3B2
		pop	cx

loc_96DE5:
		pop	di
		pop	si
		pop	bp
		retf
sub_96DBA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96DE9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96E14
		mov	word ptr [si], 0A5Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96E14
		push	si
		call	sub_3B2
		pop	cx

loc_96E14:
		pop	di
		pop	si
		pop	bp
		retf
sub_96DE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96E18		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96E43
		mov	word ptr [si], 0A7Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96E43
		push	si
		call	sub_3B2
		pop	cx

loc_96E43:
		pop	di
		pop	si
		pop	bp
		retf
sub_96E18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96E47		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96E72
		mov	word ptr [si], 0A9Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96E72
		push	si
		call	sub_3B2
		pop	cx

loc_96E72:
		pop	di
		pop	si
		pop	bp
		retf
sub_96E47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96E76		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96EA1
		mov	word ptr [si], 0ABEh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96EA1
		push	si
		call	sub_3B2
		pop	cx

loc_96EA1:
		pop	di
		pop	si
		pop	bp
		retf
sub_96E76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96EA5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96ED0
		mov	word ptr [si], 0ADEh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96ED0
		push	si
		call	sub_3B2
		pop	cx

loc_96ED0:
		pop	di
		pop	si
		pop	bp
		retf
sub_96EA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96ED4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96EFF
		mov	word ptr [si], 0AFEh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96EFF
		push	si
		call	sub_3B2
		pop	cx

loc_96EFF:
		pop	di
		pop	si
		pop	bp
		retf
sub_96ED4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96F03		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96F2E
		mov	word ptr [si], 0B1Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96F2E
		push	si
		call	sub_3B2
		pop	cx

loc_96F2E:
		pop	di
		pop	si
		pop	bp
		retf
sub_96F03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96F32		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96F5D
		mov	word ptr [si], 0B3Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96F5D
		push	si
		call	sub_3B2
		pop	cx

loc_96F5D:
		pop	di
		pop	si
		pop	bp
		retf
sub_96F32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96F61		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96F8C
		mov	word ptr [si], 0B5Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96F8C
		push	si
		call	sub_3B2
		pop	cx

loc_96F8C:
		pop	di
		pop	si
		pop	bp
		retf
sub_96F61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96F90		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_96F90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96F98		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_96FC3
		mov	word ptr [si], 0B9Eh
		push	0
		push	si
		call	sub_736A5
		add	sp, 4
		test	di, 1
		jz	short loc_96FC3
		push	si
		call	sub_3B2
		pop	cx

loc_96FC3:
		pop	di
		pop	si
		pop	bp
		retf
sub_96F98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_96FC7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_97037
		cmp	byte ptr [si+65h], 0
		jz	short loc_96FFC
		cmp	dword ptr [si+60h], 0
		jz	short loc_96FFC
		push	0
		mov	al, [si+64h]
		push	ax
		mov	ax, si
		add	ax, 60h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_96FFC

loc_96FFC:
		mov	dword ptr [si+60h], 0
		mov	byte ptr [si+65h], 0
		mov	dword ptr [si+66h], 0
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_97037
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_97037

loc_97037:
		pop	di
		pop	si
		pop	bp
		retf
sub_96FC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9703B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_9703B		endp
ovr254		ends
