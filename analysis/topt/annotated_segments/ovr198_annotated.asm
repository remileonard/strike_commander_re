ovr198		segment	para public 'OVERLAY' use16
		assume cs:ovr198
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68120		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_68453
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		push	si
		nop
		push	cs
		call	near ptr sub_6817C
		add	sp, 2
		xor	di, di
		jmp	short loc_68160

loc_68144:
		push	word ptr [si+4]
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h
		push	dx
		call	MusicChannel_Init_B75B
		add	sp, 4
		inc	di

loc_68160:
		cmp	di, 5
		jl	short loc_68144
		pop	di
		pop	si
		pop	bp
		retf
sub_68120		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68169		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_6836B
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_68169		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6817C		proc far

var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DC		= dword ptr -0DCh
var_D8		= byte ptr -0D8h
var_D6		= word ptr -0D6h
var_75		= dword ptr -75h
var_69		= word ptr -69h
var_65		= dword ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_4CA58
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_68194
		jmp	short loc_681A5

loc_68194:
		push	1C8Ch
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_681B6

loc_681A5:
		push	1C91h
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_681B6

loc_681B6:
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		push	ds
		push	offset aSoundfx
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		mov	bx, [bp+var_D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_E0], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_DE], ax
		lea	ax, [bp+var_E0]
		mov	word_4D392, ax
		mov	[bp+var_E0], 1BCh
		mov	[bp+var_DC], 0
		mov	[bp+var_D8], 0
		mov	[bp+var_E4], 0
		mov	[bp+var_E2], 0FFFFh
		push	word ptr [si+4]
		lea	ax, [bp+var_E4]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		xor	di, di
		jmp	loc_68334

loc_6823A:
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68259
		mov	eax, [bp+var_75]
		jmp	short loc_6825D

loc_68259:
		mov	eax, [bp+var_65]

loc_6825D:
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	large [bp+var_A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_C]
		mov	bx, [bp+var_E]
		push	bx
		mov	bx, ax
		mov	[bx+si+8], dx
		pop	ax
		mov	[bx+si+6], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0Ah], 3
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0Bh], 1
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	dword ptr [bx+si+0Ch], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	edx, [bp+var_A]
		mov	bx, ax
		mov	[bx+si+0Ch], edx
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	al, [bx+si+0Ah]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+8]
		push	word ptr [bx+si+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ReadEntryInto_43519
		add	sp, 8
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		lea	ax, [bp+var_E4]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		inc	di

loc_68334:
		cmp	di, 0Eh
		jge	short loc_6833C
		jmp	loc_6823A

loc_6833C:
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6817C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6836B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_6839E

loc_68377:
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h
		push	dx
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 0Fh
		inc	di

loc_6839E:
		cmp	di, 5
		jl	short loc_68377
		pop	di
		pop	si
		pop	bp
		retf
sub_6836B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_683A7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4A66A, 0
		jnz	short loc_683B9
		jmp	loc_6844F

loc_683B9:
		mov	byte_4A66A, 0
		push	si
		push	cs
		call	near ptr sub_6836B
		add	sp, 2
		xor	di, di
		jmp	short loc_68447

loc_683CA:
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+si+0Bh], 0
		jz	short loc_68415
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	ax, [bx+si+6]
		or	ax, [bx+si+8]
		jz	short loc_68415
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	al, [bx+si+0Ah]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_68415

loc_68415:
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+8], 0
		mov	word ptr [bx+si+6], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0Bh], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	dword ptr [bx+si+0Ch], 0
		inc	di

loc_68447:
		cmp	di, 0Eh
		jge	short loc_6844F
		jmp	loc_683CA

loc_6844F:
		pop	di
		pop	si
		pop	bp
		retf
sub_683A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68453		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_4A66A, 1
		mov	word ptr [si+4], 0
		xor	cx, cx
		jmp	short loc_68477

loc_68468:
		mov	ax, cx
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 0Fh
		inc	cx

loc_68477:
		cmp	cx, 5
		jl	short loc_68468
		pop	si
		pop	bp
		retf
sub_68453		endp
ovr198		ends
