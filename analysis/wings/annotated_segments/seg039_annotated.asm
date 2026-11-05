seg039		segment	para public 'CODE' use16
		assume cs:seg039
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7Ch, 0A1h, 56h, 0Eh, 0E8h, 82h, 0FFh, 59h, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B71C		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	al, 20h
		out	20h, al
		cmp	word_5B781, 0FFFFh
		jnz	short loc_1B731
		jmp	loc_1B8C8

loc_1B731:
		mov	al, byte_5B780
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_1B740
		jmp	loc_1B8C3

loc_1B740:
		shl	bx, 1
		jmp	cs:off_1B8CB[bx]	; switch jump

loc_1B747:
		mov	ax, 4700h
		mov	dx, word_5D978
		int	67h
		mov	al, byte ptr word_5B781
		mov	byte_5FE14, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 60F7h
		push	0
		imul	ax, ax, 0Ch
		mov	dx, word_5B77E
		add	dx, ax
		push	dx
		push	si
		call	sub_1A769
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_1B78A
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1B78A

loc_1B78A:
		mov	byte_5FE25, 1

loc_1B78F:
		mov	byte_5B780, 1

loc_1B794:
		mov	ax, 4800h
		mov	dx, word_5D978
		int	67h
		jmp	loc_1B8C8

loc_1B7A0:
		mov	al, byte_5FE14
		mov	ah, 0
		cmp	ax, word_5B781
		jz	short loc_1B7D4
		cmp	word_5FE17, 0
		jz	short loc_1B7C7
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CF3
		add	sp, 4
		jmp	short loc_1B7C9

loc_1B7C7:
		xor	ax, ax

loc_1B7C9:
		mov	word_5FE15, ax
		mov	byte_5B780, 2
		jmp	loc_1B8C8

loc_1B7D4:
		cmp	word_5FE17, 0
		jz	short loc_1B7FC
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_1B7F8
		mov	ax, 1
		jmp	short loc_1B7FA

loc_1B7F8:
		xor	ax, ax

loc_1B7FA:
		jmp	short loc_1B7FE

loc_1B7FC:
		mov	al, 1

loc_1B7FE:
		or	al, al
		jnz	short loc_1B805
		jmp	loc_1B8C8

loc_1B805:
		mov	ax, word_5B783
		mov	word_5B781, ax
		jmp	loc_1B8C8

loc_1B80E:
		mov	al, byte_5FE14
		mov	ah, 0
		cmp	ax, word_5B781
		jnz	short loc_1B821
		mov	byte_5B780, 1
		jmp	loc_1B8C8

loc_1B821:
		cmp	word_5FE17, 0
		jz	short loc_1B83D
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CF3
		add	sp, 4
		jmp	short loc_1B83F

loc_1B83D:
		xor	ax, ax

loc_1B83F:
		cmp	ax, word_5FE15
		jnz	short loc_1B873
		cmp	word_5FE17, 0
		jz	short loc_1B86D
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_1B869
		mov	ax, 1
		jmp	short loc_1B86B

loc_1B869:
		xor	ax, ax

loc_1B86B:
		jmp	short loc_1B86F

loc_1B86D:
		mov	al, 1

loc_1B86F:
		or	al, al
		jz	short loc_1B8C8

loc_1B873:
		mov	ax, 4700h
		mov	dx, word_5D978
		int	67h
		nop
		push	cs
		call	near ptr sub_1B8D3
		jmp	loc_1B794

loc_1B884:
		cmp	word_5FE29, 0
		jz	short loc_1B8AC
		push	word_5FE2B
		mov	bx, word_5FE29
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_1B8A8
		mov	ax, 1
		jmp	short loc_1B8AA

loc_1B8A8:
		xor	ax, ax

loc_1B8AA:
		jmp	short loc_1B8AE

loc_1B8AC:
		mov	al, 1

loc_1B8AE:
		or	al, al
		jz	short loc_1B8C8
		mov	ax, 4700h
		mov	dx, word_5D978
		int	67h
		nop
		push	cs
		call	near ptr sub_1BA11
		jmp	loc_1B78F

loc_1B8C3:
		mov	byte_5B774, 1

loc_1B8C8:
		pop	si
		leave
		retf
sub_1B71C		endp

; START OF FUNCTION CHUNK FOR sub_1B71C
off_1B8CB	dw offset loc_1B747
		dw offset loc_1B7A0
		dw offset loc_1B80E
		dw offset loc_1B884
; END OF FUNCTION CHUNK FOR sub_1B71C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B8D3		proc far

var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	al, byte_5FE14
		mov	ah, 0
		imul	ax, ax, 0Ch
		mov	si, word_5B77E
		add	si, ax
		mov	al, [si+0Ah]
		mov	ah, 0
		push	ax
		mov	ax, word_5FE15
		cwd
		pop	bx
		idiv	bx
		mov	word_5FE15, dx
		cmp	word_5FE15, 0
		jz	short loc_1B906
		inc	word_5FE15
		jmp	short loc_1B90E

loc_1B906:
		mov	al, [si+0Bh]
		mov	ah, 0
		mov	word_5FE15, ax

loc_1B90E:
		mov	al, byte_5FE14
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_5B789
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_5B781
		mov	dl, es:[bx]
		cmp	dl, 0FFh
		jnz	short loc_1B931
		mov	[bp+var_1], 0
		jmp	short loc_1B94B

loc_1B931:
		mov	al, dl
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_5B785
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_5FE15
		mov	al, es:[bx]
		mov	[bp+var_1], al

loc_1B94B:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1B9A3
		push	60F7h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	al, byte ptr word_5B781
		mov	byte_5FE14, al
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	si, 60F7h
		push	0
		imul	ax, ax, 0Ch
		mov	dx, word_5B77E
		add	dx, ax
		push	dx
		push	si
		call	sub_1A769
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_1B997
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1B997

loc_1B997:
		mov	byte_5FE25, 1
		mov	byte_5B780, 1
		jmp	short loc_1BA0E

loc_1B9A3:
		test	[bp+var_1], 80h
		jz	short loc_1B9AF
		and	[bp+var_1], 7Fh
		jmp	short loc_1B9BD

loc_1B9AF:
		push	60F7h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	byte_5FE25, 0

loc_1B9BD:
		mov	al, [bp+var_1]
		mov	ah, 0
		cmp	ax, word_5B778
		jle	short loc_1B9DC
		mov	byte_5B774, 2
		mov	byte_5B780, 1
		mov	al, byte_5FE14
		mov	ah, 0
		mov	word_5B781, ax
		jmp	short loc_1BA0E

loc_1B9DC:
		mov	si, 6109h
		mov	al, [bp+var_1]
		mov	ah, 0
		dec	ax
		push	ax
		push	60EAh
		push	si
		call	sub_1A769
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_1BA09
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1BA09

loc_1BA09:
		mov	byte_5B780, 3

loc_1BA0E:
		pop	si
		leave
		retf
sub_1B8D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BA11		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	6109h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	byte_5FE37, 0
		cmp	byte_5FE25, 1
		jnz	short loc_1BA36
		push	60F7h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx

loc_1BA36:
		mov	al, byte ptr word_5B781
		mov	byte_5FE14, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 60F7h
		push	0
		imul	ax, ax, 0Ch
		mov	dx, word_5B77E
		add	dx, ax
		push	dx
		push	si
		call	sub_1A769
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_1BA70
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1BA70

loc_1BA70:
		mov	byte_5FE25, 1
		pop	si
		leave
		retf
sub_1BA11		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BA78		proc far

var_86		= word ptr -86h
var_74		= word ptr -74h
var_25		= dword ptr -25h
var_19		= word ptr -19h
var_17		= dword ptr -17h
var_15		= dword ptr -15h
var_13		= dword ptr -13h
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_6		= dword ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [bp+arg_4]
		push	1
		push	ax
		call	sub_58C7C
		add	sp, 4
		cmp	si, 0FFFFh
		jz	short loc_1BA9D
		jmp	loc_1BBAB

loc_1BA9D:
		mov	word ptr [bp+var_4+2], di
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_74], 9B5h
		mov	[bp+var_13], 100h
		mov	[bp+var_17], 0
		mov	[bp+var_74], 0B2Ch
		push	1
		push	word ptr [bp+var_4+2]
		lea	ax, [bp+var_74]
		push	ax
		mov	bx, [bp+var_74]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		cmp	byte_5FE3D, 0
		jz	short loc_1BB0D
		cmp	dword_5FE38, 0
		jz	short loc_1BB0D
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	6118h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1BB0D

loc_1BB0D:
		mov	dword_5FE38, 0
		mov	byte_5FE3D, 0
		mov	dword_5FE3E, 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	dword_5FE38, eax
		mov	byte_5FE3C, 3
		mov	byte_5FE3D, 1
		mov	dword_5FE3E, 0
		mov	eax, [bp+var_A]
		mov	dword_5FE3E, eax
		cmp	byte_5FE3C, 3
		jnz	short loc_1BB87
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	large dword_5FE38
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1BB8F

loc_1BB87:
		mov	edx, dword_5FE3A
		mov	ax, word ptr dword_5FE38

loc_1BB8F:
		push	dx
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		call	sub_51D33
		add	sp, 6
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		jmp	loc_1BCAF

loc_1BBAB:
		push	1
		push	di
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	si
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_19]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_1BBDA
		mov	eax, [bp+var_25]
		jmp	short loc_1BBDE

loc_1BBDA:
		mov	eax, [bp+var_15]

loc_1BBDE:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_1BBEC
		jmp	loc_1BCA3

loc_1BBEC:
		cmp	byte_5FE3D, 0
		jz	short loc_1BC11
		cmp	dword_5FE38, 0
		jz	short loc_1BC11
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	6118h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1BC11

loc_1BC11:
		mov	dword_5FE38, 0
		mov	byte_5FE3D, 0
		mov	dword_5FE3E, 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_A], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword_5FE38, eax
		mov	byte_5FE3C, 3
		mov	byte_5FE3D, 1
		mov	dword_5FE3E, 0
		mov	eax, [bp+var_8]
		mov	dword_5FE3E, eax
		cmp	byte_5FE3C, 3
		jnz	short loc_1BC8B
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	large dword_5FE38
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1BC93

loc_1BC8B:
		mov	edx, dword_5FE3A
		mov	ax, word ptr dword_5FE38

loc_1BC93:
		push	dx
		push	ax
		push	si
		lea	ax, [bp+var_86]
		push	ax
		call	sub_54A85
		add	sp, 8

loc_1BCA3:
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_Destruct_5483E

loc_1BCAF:
		add	sp, 4
		cmp	byte_5FE3C, 3
		jnz	short loc_1BCD1
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	large dword_5FE38
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1BCD9

loc_1BCD1:
		mov	edx, dword_5FE3A
		mov	ax, word ptr dword_5FE38

loc_1BCD9:
		or	ax, dx
		jz	short loc_1BD05
		mov	si, 60F7h
		push	0
		push	6118h
		push	si
		call	sub_1A769
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_1BD05
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1BD05

loc_1BD05:
		pop	di
		pop	si
		leave
		retf
sub_1BA78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BD09		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_5FE17, 0
		jz	short loc_1BD37
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_1BD33
		mov	ax, 1
		jmp	short loc_1BD35

loc_1BD33:
		xor	ax, ax

loc_1BD35:
		jmp	short loc_1BD39

loc_1BD37:
		mov	al, 0

loc_1BD39:
		or	al, al
		jz	short loc_1BDAF
		cmp	word_5FE17, 0
		jz	short loc_1BD5F
		push	large 3E80000h
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_1BD5F

loc_1BD5F:
		cmp	word_5FE17, 0
		jz	short loc_1BD87
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_1BD83
		mov	ax, 1
		jmp	short loc_1BD85

loc_1BD83:
		xor	ax, ax

loc_1BD85:
		jmp	short loc_1BD89

loc_1BD87:
		mov	al, 0

loc_1BD89:
		or	al, al
		jz	short loc_1BDAF
		cmp	word_5FE17, 0
		jz	short loc_1BDA9
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CD5
		add	sp, 4
		jmp	short loc_1BDAB

loc_1BDA9:
		xor	ax, ax

loc_1BDAB:
		or	ax, ax
		jnz	short loc_1BD5F

loc_1BDAF:
		push	60F7h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		cmp	byte_5FE3D, 0
		jz	short loc_1BDDD
		cmp	dword_5FE38, 0
		jz	short loc_1BDDD
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	6118h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1BDDD

loc_1BDDD:
		mov	dword_5FE38, 0
		mov	byte_5FE3D, 0
		mov	dword_5FE3E, 0
		pop	bp
		retf
sub_1BD09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BDF6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_5FE17, 0
		jz	short loc_1BE24
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_1BE20
		mov	ax, 1
		jmp	short loc_1BE22

loc_1BE20:
		xor	ax, ax

loc_1BE22:
		jmp	short loc_1BE26

loc_1BE24:
		mov	al, 0

loc_1BE26:
		pop	bp
		retf
sub_1BDF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BE28		proc far
		push	bp
		mov	bp, sp
		mov	dword_5FE0A, 0
		mov	byte_5FE0E, 2
		mov	byte_5FE0F, 0
		mov	dword_5FE10, 0
		mov	word_5FE1B, 96Dh
		mov	ax, word_5DD68
		mov	word_5FE1D, ax
		mov	word_5DD68, 60FBh
		mov	word_5FE1B, 975h
		mov	dword_5FE1F, 0
		mov	byte_5FE23, 0
		mov	word_5FE17, 0
		mov	word_5FE19, 0FFFFh
		mov	word_5FE2D, 96Dh
		mov	ax, word_5DD68
		mov	word_5FE2F, ax
		mov	word_5DD68, 610Dh
		mov	word_5FE2D, 975h
		mov	dword_5FE31, 0
		mov	byte_5FE35, 0
		mov	word_5FE29, 0
		mov	word_5FE2B, 0FFFFh
		mov	dword_5FE38, 0
		mov	byte_5FE3C, 2
		mov	byte_5FE3D, 0
		mov	dword_5FE3E, 0
		pop	bp
		retf
sub_1BE28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BEC9		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5FE3D, 0
		jz	short loc_1BEF1
		cmp	dword_5FE38, 0
		jz	short loc_1BEF1
		push	0
		mov	al, byte_5FE3C
		push	ax
		push	6118h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1BEF1

loc_1BEF1:
		mov	dword_5FE38, 0
		mov	byte_5FE3D, 0
		mov	dword_5FE3E, 0
		push	6109h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		push	610Dh
		call	sub_19116
		add	sp, 4
		push	60F7h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		push	60FBh
		call	sub_19116
		add	sp, 4
		cmp	byte_5FE0F, 0
		jz	short loc_1BF59
		cmp	dword_5FE0A, 0
		jz	short loc_1BF59
		push	0
		mov	al, byte_5FE0E
		push	ax
		push	60EAh
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1BF59

loc_1BF59:
		mov	dword_5FE0A, 0
		mov	byte_5FE0F, 0
		mov	dword_5FE10, 0
sub_1BEC9		endp
seg039		ends
