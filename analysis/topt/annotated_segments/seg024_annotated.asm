seg024		segment	para public 'CODE' use16
		assume cs:seg024
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D322		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_D322		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D32A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	si, word_4A680
		jg	short loc_D33D
		mov	word_4A68D, si
		jmp	short loc_D34E

loc_D33D:
		cmp	si, 0FFh
		jz	short loc_D34E
		push	0D006h
		call	sub_13451
		add	sp, 2

loc_D34E:
		pop	si
		pop	bp
		retf
sub_D32A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D351		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	al, 20h
		out	20h, al
		cmp	word_4A68D, 0FFFFh
		jnz	short loc_D366
		jmp	loc_D514

loc_D366:
		mov	al, byte_4A68C
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_D375
		jmp	loc_D50D

loc_D375:
		shl	bx, 1
		jmp	cs:off_D517[bx]	; switch jump

loc_D37C:
		mov	ax, 4700h
		mov	dx, word_4CFA2
		int	67h
		mov	al, byte ptr word_4A68D
		mov	byte_4EF46, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 6569h
		push	0
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		push	dx
		push	si
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_D3C4
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_D3C4

loc_D3C4:
		mov	byte_4EF57, 1
		mov	byte_4A68C, 1
		mov	ax, 4800h
		mov	dx, word_4CFA2
		int	67h
		jmp	loc_D514

loc_D3DA:
		mov	al, byte_4EF46
		mov	ah, 0
		cmp	ax, word_4A68D
		jz	short loc_D40D
		cmp	word_4EF49, 0
		jz	short loc_D401
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_5107
		add	sp, 4
		jmp	short loc_D403

loc_D401:
		xor	ax, ax

loc_D403:
		mov	word_4EF47, ax
		mov	byte_4A68C, 2
		jmp	short loc_D441

loc_D40D:
		cmp	word_4EF49, 0
		jz	short loc_D435
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_D431
		mov	ax, 1
		jmp	short loc_D433

loc_D431:
		xor	ax, ax

loc_D433:
		jmp	short loc_D437

loc_D435:
		mov	al, 1

loc_D437:
		or	al, al
		jz	short loc_D441
		mov	ax, word_4A68F
		mov	word_4A68D, ax

loc_D441:
		jmp	loc_D514

loc_D444:
		mov	al, byte_4EF46
		mov	ah, 0
		cmp	ax, word_4A68D
		jnz	short loc_D456
		mov	byte_4A68C, 1
		jmp	short loc_D4BF

loc_D456:
		cmp	word_4EF49, 0
		jz	short loc_D472
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_5107
		add	sp, 4
		jmp	short loc_D474

loc_D472:
		xor	ax, ax

loc_D474:
		cmp	ax, word_4EF47
		jnz	short loc_D4A8
		cmp	word_4EF49, 0
		jz	short loc_D4A2
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_D49E
		mov	ax, 1
		jmp	short loc_D4A0

loc_D49E:
		xor	ax, ax

loc_D4A0:
		jmp	short loc_D4A4

loc_D4A2:
		mov	al, 1

loc_D4A4:
		or	al, al
		jz	short loc_D4BF

loc_D4A8:
		mov	ax, 4700h
		mov	dx, word_4CFA2
		int	67h
		nop
		push	cs
		call	near ptr sub_D51F
		mov	ax, 4800h
		mov	dx, word_4CFA2
		int	67h

loc_D4BF:
		jmp	short loc_D514

loc_D4C1:
		cmp	word_4EF5B, 0
		jz	short loc_D4E9
		push	word_4EF5D
		mov	bx, word_4EF5B
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_D4E5
		mov	ax, 1
		jmp	short loc_D4E7

loc_D4E5:
		xor	ax, ax

loc_D4E7:
		jmp	short loc_D4EB

loc_D4E9:
		mov	al, 1

loc_D4EB:
		or	al, al
		jz	short loc_D50B
		mov	ax, 4700h
		mov	dx, word_4CFA2
		int	67h
		nop
		push	cs
		call	near ptr sub_D69E
		mov	byte_4A68C, 1
		mov	ax, 4800h
		mov	dx, word_4CFA2
		int	67h

loc_D50B:
		jmp	short loc_D514

loc_D50D:
		mov	byte_4A67E, 1
		jmp	short loc_D514

loc_D514:
		pop	si
		leave
		retf
sub_D351		endp

; START OF FUNCTION CHUNK FOR sub_D351
off_D517	dw offset loc_D37C
		dw offset loc_D3DA
		dw offset loc_D444
		dw offset loc_D4C1
; END OF FUNCTION CHUNK FOR sub_D351

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D51F		proc far

var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	al, byte_4EF46
		mov	ah, 0
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		mov	al, [bx+0Ah]
		mov	ah, 0
		push	ax
		mov	ax, word_4EF47
		cwd
		pop	bx
		idiv	bx
		mov	word_4EF47, dx
		cmp	word_4EF47, 0
		jz	short loc_D55B
		inc	word_4EF47
		jmp	short loc_D566

loc_D55B:
		mov	bx, [bp+var_2]
		mov	al, [bx+0Bh]
		mov	ah, 0
		mov	word_4EF47, ax

loc_D566:
		mov	al, byte_4EF46
		mov	ah, 0
		shl	ax, 2
		les	bx, word_4A695
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_4A68D
		mov	al, es:[bx]
		mov	[bp+var_4], al
		mov	al, byte_4EF46
		mov	ah, 0
		cmp	ax, word_4A680
		jge	short loc_D595
		mov	ax, word_4A68D
		cmp	ax, word_4A680
		jl	short loc_D599

loc_D595:
		mov	[bp+var_4], 0FFh

loc_D599:
		cmp	[bp+var_4], 0FFh
		jnz	short loc_D5A5
		mov	[bp+var_3], 0
		jmp	short loc_D5C0

loc_D5A5:
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 2
		les	bx, word_4A691
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_4EF47
		mov	al, es:[bx]
		mov	[bp+var_3], al

loc_D5C0:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D621
		push	6569h
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	al, byte ptr word_4A68D
		mov	byte_4EF46, al
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	di, 6569h
		push	0
		mov	ax, [bp+var_6]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		push	dx
		push	di
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	word ptr [di], 0
		jz	short loc_D613
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_D613

loc_D613:
		mov	byte_4EF57, 1
		mov	byte_4A68C, 1
		pop	di
		pop	si
		leave
		retf

loc_D621:
		test	[bp+var_3], 80h
		jz	short loc_D62D
		and	[bp+var_3], 7Fh
		jmp	short loc_D63D

loc_D62D:
		push	6569h
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	byte_4EF57, 0

loc_D63D:
		mov	al, [bp+var_3]
		mov	ah, 0
		cmp	ax, word_4A682
		jle	short loc_D65E
		mov	byte_4A67E, 2
		mov	byte_4A68C, 1
		mov	al, byte_4EF46
		mov	ah, 0
		mov	word_4A68D, ax
		pop	di
		pop	si
		leave
		retf

loc_D65E:
		mov	si, 657Bh
		push	0
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		add	ax, word_4A68A
		add	ax, 0FFF6h
		push	ax
		push	si
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_D695
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_D695

loc_D695:
		mov	byte_4A68C, 3
		pop	di
		pop	si
		leave
		retf
sub_D51F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D69E		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	657Bh
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	byte_4EF69, 0
		cmp	byte_4EF57, 1
		jnz	short loc_D6C7
		push	6569h
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_D6C7:
		mov	al, byte ptr word_4A68D
		mov	byte_4EF46, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 6569h
		push	0
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		push	dx
		push	si
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_D706
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_D706

loc_D706:
		mov	byte_4EF57, 1
		pop	si
		leave
		retf
sub_D69E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D70E		proc far

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
		mov	si, [bp+arg_0]
		push	1
		push	si
		call	sub_47CAC
		add	sp, 4
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_D72E
		jmp	loc_D83F

loc_D72E:
		mov	ax, [bp+arg_2]
		mov	word ptr [bp+var_4+2], ax
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_74], 480h
		mov	[bp+var_13], 100h
		mov	[bp+var_17], 0
		mov	[bp+var_74], 5BDh
		push	1
		push	word ptr [bp+var_4+2]
		lea	ax, [bp+var_74]
		push	ax
		mov	bx, [bp+var_74]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		cmp	byte_4EF6F, 0
		jz	short loc_D7AA
		cmp	dword ptr word_4EF6A, 0
		jz	short loc_D7AA
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	658Ah
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_D7AA

loc_D7AA:
		mov	dword ptr word_4EF6A, 0
		mov	byte_4EF6F, 0
		mov	dword_4EF70, 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	large [bp+var_A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_C], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	dword ptr word_4EF6A, eax
		mov	byte_4EF6E, 3
		mov	byte_4EF6F, 1
		mov	dword_4EF70, 0
		mov	eax, [bp+var_A]
		mov	dword_4EF70, eax
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	word_4EF6C
		push	word_4EF6A
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		call	sub_404D9
		add	sp, 6
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	loc_D940

loc_D83F:
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_19]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_D872
		mov	eax, [bp+var_25]
		jmp	short loc_D876

loc_D872:
		mov	eax, [bp+var_15]

loc_D876:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_D884
		jmp	loc_D931

loc_D884:
		cmp	byte_4EF6F, 0
		jz	short loc_D8A9
		cmp	dword ptr word_4EF6A, 0
		jz	short loc_D8A9
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	658Ah
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_D8A9

loc_D8A9:
		mov	dword ptr word_4EF6A, 0
		mov	byte_4EF6F, 0
		mov	dword_4EF70, 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	large [bp+var_8]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_A], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword ptr word_4EF6A, eax
		mov	byte_4EF6E, 3
		mov	byte_4EF6F, 1
		mov	dword_4EF70, 0
		mov	eax, [bp+var_8]
		mov	dword_4EF70, eax
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	word_4EF6C
		push	word_4EF6A
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_86]
		push	ax
		call	sub_43519
		add	sp, 8

loc_D931:
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_D940:
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	word_4EF6C
		push	word_4EF6A
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_D985
		mov	di, 6569h
		push	0
		push	658Ah
		push	di
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		cmp	word ptr [di], 0
		jz	short loc_D985
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_D985

loc_D985:
		pop	di
		pop	si
		leave
		retf
sub_D70E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D989		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4EF49, 0
		jz	short loc_D9B8
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_D9B4
		mov	ax, 1
		jmp	short loc_D9B6

loc_D9B4:
		xor	ax, ax

loc_D9B6:
		jmp	short loc_D9BA

loc_D9B8:
		mov	al, 0

loc_D9BA:
		or	al, al
		jz	short loc_DA31
		cmp	word_4EF49, 0
		jz	short loc_D9DF
		push	3E8h
		push	0
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_D9DF

loc_D9DF:
		jmp	short loc_D9E1

loc_D9E1:
		cmp	word_4EF49, 0
		jz	short loc_DA09
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_DA05
		mov	ax, 1
		jmp	short loc_DA07

loc_DA05:
		xor	ax, ax

loc_DA07:
		jmp	short loc_DA0B

loc_DA09:
		mov	al, 0

loc_DA0B:
		or	al, al
		jz	short loc_DA31
		cmp	word_4EF49, 0
		jz	short loc_DA2B
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E9
		add	sp, 4
		jmp	short loc_DA2D

loc_DA2B:
		xor	ax, ax

loc_DA2D:
		or	ax, ax
		jnz	short loc_D9E1

loc_DA31:
		push	6569h
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	byte_4EF6F, 0
		jz	short loc_DA61
		cmp	dword ptr word_4EF6A, 0
		jz	short loc_DA61
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	658Ah
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_DA61

loc_DA61:
		mov	dword ptr word_4EF6A, 0
		mov	byte_4EF6F, 0
		mov	dword_4EF70, 0
		pop	si
		pop	bp
		retf
sub_D989		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DA7B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4EF49, 0
		jz	short loc_DAAA
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_DAA6
		mov	ax, 1
		jmp	short loc_DAA8

loc_DAA6:
		xor	ax, ax

loc_DAA8:
		jmp	short loc_DAAC

loc_DAAA:
		mov	al, 0

loc_DAAC:
		pop	si
		pop	bp
		retf
sub_DA7B		endp

; START OF FUNCTION CHUNK FOR sub_DA7B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_DA7B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAB2		proc far
		push	bp
		mov	bp, sp
		mov	word_4EF4D, 1B4h
		mov	ax, word_4D392
		mov	word_4EF4F, ax
		mov	word_4D392, 656Dh
		mov	word_4EF4D, 1BCh
		mov	dword_4EF51, 0
		mov	byte_4EF55, 0
		mov	word_4EF49, 0
		mov	word_4EF4B, 0FFFFh
		mov	word_4EF5F, 1B4h
		mov	ax, word_4D392
		mov	word_4EF61, ax
		mov	word_4D392, 657Fh
		mov	word_4EF5F, 1BCh
		mov	dword_4EF63, 0
		mov	byte_4EF67, 0
		mov	word_4EF5B, 0
		mov	word_4EF5D, 0FFFFh
		mov	dword ptr word_4EF6A, 0
		mov	byte_4EF6E, 2
		mov	byte_4EF6F, 0
		mov	dword_4EF70, 0
		pop	bp
		retf
sub_DAB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB37		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4EF6F, 0
		jz	short loc_DB5F
		cmp	dword ptr word_4EF6A, 0
		jz	short loc_DB5F
		push	0
		mov	al, byte_4EF6E
		push	ax
		push	658Ah
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_DB5F

loc_DB5F:
		mov	dword ptr word_4EF6A, 0
		mov	byte_4EF6F, 0
		mov	dword_4EF70, 0
		push	657Bh
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		push	657Fh
		call	sub_5C1C
		add	sp, 4
		push	6569h
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		push	656Dh
sub_DB37		endp

; START OF FUNCTION CHUNK FOR sub_DB37
		db 9Ah
		in	al, dx
; END OF FUNCTION CHUNK FOR sub_DB37
seg024		ends
