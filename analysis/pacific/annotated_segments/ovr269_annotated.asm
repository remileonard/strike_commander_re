ovr269		segment	para public 'OVERLAY' use16
		assume cs:ovr269
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2870		proc far

var_2C		= word ptr -2Ch
var_24		= dword ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		mov	[bp+var_2], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A28BF
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	di, ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_A28B1
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax

loc_A28B1:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_A28C8

loc_A28BF:
		push	6006h
		call	sub_1DDFE
		pop	cx

loc_A28C8:
		push	[bp+var_2]
		push	di
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_751B0
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+80h]
		mov	[bp+var_6], eax
		mov	[bp+var_8], 0
		mov	eax, es:[bx+84h]
		mov	[bp+var_C], eax
		mov	[bp+var_E], 0
		jmp	loc_A2B7D

loc_A2902:
		push	si
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_A2918
		mov	ax, 1
		jmp	short loc_A291A

loc_A2918:
		xor	ax, ax

loc_A291A:
		or	ax, ax
		jnz	short loc_A2921
		jmp	loc_A29D6

loc_A2921:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		cmp	ax, [bp+var_8]
		ja	short loc_A2936
		push	6007h
		call	sub_1DDFE
		pop	cx

loc_A2936:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		cmp	word ptr [bp+var_22+2], 4B50h
		jnz	short loc_A2965
		push	si
		push	large [bp+var_24]
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_6]
		call	sub_75183
		add	sp, 0Ch
		jmp	short loc_A29CC

loc_A2965:
		cmp	word ptr [bp+var_22+2], 4E55h
		jnz	short loc_A2983
		push	si
		push	large [bp+var_24]
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_6]
		call	sub_75174
		add	sp, 0Ch
		jmp	short loc_A29CC

loc_A2983:
		cmp	word ptr [bp+var_22+2], 2B50h
		jnz	short loc_A29A4
		mov	word_79752, 1
		push	si
		push	large [bp+var_24]
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_6]
		call	sub_75183
		jmp	short loc_A29C3

loc_A29A4:
		cmp	word ptr [bp+var_22+2], 2B55h
		jnz	short loc_A29CC
		mov	word_79752, 1
		push	si
		push	large [bp+var_24]
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_6]
		call	sub_75174

loc_A29C3:
		add	sp, 0Ch
		mov	word_79752, 0

loc_A29CC:
		add	word ptr [bp+var_6], 0Eh
		inc	[bp+var_8]
		jmp	loc_A2B71

loc_A29D6:
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_A29E5
		mov	ax, 1
		jmp	short loc_A29E7

loc_A29E5:
		xor	ax, ax

loc_A29E7:
		or	ax, ax
		jnz	short loc_A29EE
		jmp	loc_A2B71

loc_A29EE:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Eh]
		cmp	ax, [bp+var_E]
		ja	short loc_A2A03
		push	6008h
		call	sub_1DDFE
		pop	cx

loc_A2A03:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 2B50h
		jnz	short loc_A2A2B
		mov	word_79752, 1

loc_A2A2B:
		cmp	[bp+var_10], 2B55h
		jnz	short loc_A2A38
		mov	word_79752, 1

loc_A2A38:
		push	large [bp+var_22]
		push	word ptr [bp+var_24]
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		call	sub_75192
		add	sp, 0Ch
		mov	word_79752, 0
		xor	di, di
		jmp	loc_A2B62

loc_A2A5A:
		or	di, di
		jz	short loc_A2A68
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_10], ax

loc_A2A68:
		cmp	[bp+var_10], 4B50h
		jnz	short loc_A2A9F
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1A], ax
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_751A6
		add	sp, 8
		movsx	eax, [bp+var_1A]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1E]
		mov	[si+65h], eax

loc_A2A9F:
		cmp	[bp+var_10], 4E55h
		jnz	short loc_A2AD5
		sub	dword ptr [si+65h], 2
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_75197
		add	sp, 8
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+16h]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[si+65h], eax

loc_A2AD5:
		cmp	[bp+var_10], 2B50h
		jnz	short loc_A2B18
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1A], ax
		mov	word_79752, 1
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_751A6
		add	sp, 8
		mov	word_79752, 0
		movsx	eax, [bp+var_1A]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1E]
		mov	[si+65h], eax

loc_A2B18:
		cmp	[bp+var_10], 2B55h
		jnz	short loc_A2B61
		sub	dword ptr [si+65h], 2
		mov	word_79752, 1
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_75197
		add	sp, 8
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+16h]
		cwd
		sub	ax, dx
		sar	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_18], edx
		mov	eax, [bp+var_18]
		mov	[si+65h], eax
		mov	word_79752, 0

loc_A2B61:
		inc	di

loc_A2B62:
		cmp	di, word ptr [bp+var_22+2]
		jge	short loc_A2B6A
		jmp	loc_A2A5A

loc_A2B6A:
		add	word ptr [bp+var_C], 18h
		inc	[bp+var_E]

loc_A2B71:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_A2B7D:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_A2B8C
		push	si
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_A2BA0

loc_A2B8C:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_A2B9E
		mov	ax, 1
		jmp	short loc_A2BA0

loc_A2B9E:
		xor	ax, ax

loc_A2BA0:
		or	ax, ax
		jnz	short loc_A2BA7
		jmp	loc_A2902

loc_A2BA7:
		pop	di
		pop	si
		leave
		retf
sub_A2870		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2BAB		proc far

var_2A		= word ptr -2Ah
var_22		= dword ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		mov	[bp+var_2], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A2BFA
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	di, ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_A2BEC
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax

loc_A2BEC:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_A2C03

loc_A2BFA:
		push	6006h
		call	sub_1DDFE
		pop	cx

loc_A2C03:
		push	[bp+var_2]
		push	di
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_751B0
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+80h]
		mov	[bp+var_6], eax
		mov	[bp+var_8], 0
		mov	eax, es:[bx+84h]
		mov	[bp+var_C], eax
		jmp	loc_A2E91

loc_A2C38:
		push	si
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_A2C4E
		mov	ax, 1
		jmp	short loc_A2C50

loc_A2C4E:
		xor	ax, ax

loc_A2C50:
		or	ax, ax
		jnz	short loc_A2C57
		jmp	loc_A2D0C

loc_A2C57:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		cmp	ax, [bp+var_8]
		ja	short loc_A2C7D
		push	6007h
		call	sub_1DDFE
		pop	cx

loc_A2C7D:
		cmp	word ptr [bp+var_20+2], 4B50h
		jnz	short loc_A2C9B
		push	si
		push	large [bp+var_22]
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+var_6]
		call	sub_75183
		add	sp, 0Ch
		jmp	short loc_A2D02

loc_A2C9B:
		cmp	word ptr [bp+var_20+2], 4E55h
		jnz	short loc_A2CB9
		push	si
		push	large [bp+var_22]
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+var_6]
		call	sub_75174
		add	sp, 0Ch
		jmp	short loc_A2D02

loc_A2CB9:
		cmp	word ptr [bp+var_20+2], 2B50h
		jnz	short loc_A2CDA
		mov	word_79752, 1
		push	si
		push	large [bp+var_22]
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+var_6]
		call	sub_75183
		jmp	short loc_A2CF9

loc_A2CDA:
		cmp	word ptr [bp+var_20+2], 2B55h
		jnz	short loc_A2D02
		mov	word_79752, 1
		push	si
		push	large [bp+var_22]
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+var_6]
		call	sub_75174

loc_A2CF9:
		add	sp, 0Ch
		mov	word_79752, 0

loc_A2D02:
		add	word ptr [bp+var_6], 0Eh
		inc	[bp+var_8]
		jmp	loc_A2E85

loc_A2D0C:
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_A2D1B
		mov	ax, 1
		jmp	short loc_A2D1D

loc_A2D1B:
		xor	ax, ax

loc_A2D1D:
		or	ax, ax
		jnz	short loc_A2D24
		jmp	loc_A2E85

loc_A2D24:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 2B50h
		jnz	short loc_A2D4C
		mov	word_79752, 1

loc_A2D4C:
		cmp	[bp+var_E], 2B55h
		jnz	short loc_A2D59
		mov	word_79752, 1

loc_A2D59:
		push	large [bp+var_20]
		push	word ptr [bp+var_22]
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+var_C]
		call	sub_75192
		add	sp, 0Ch
		mov	word_79752, 0
		xor	di, di
		jmp	loc_A2E79

loc_A2D7B:
		or	di, di
		jz	short loc_A2D89
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_E], ax

loc_A2D89:
		cmp	[bp+var_E], 4B50h
		jnz	short loc_A2DC3
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_18], ax
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_751A6
		add	sp, 8
		movsx	eax, [bp+var_18]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_1C], edx
		mov	eax, [bp+var_1C]
		mov	[si+65h], eax
		jmp	loc_A2E78

loc_A2DC3:
		cmp	[bp+var_E], 4E55h
		jnz	short loc_A2DFB
		sub	dword ptr [si+65h], 4
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_75197
		add	sp, 8
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+16h]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_12], edx
		mov	eax, [bp+var_12]
		mov	[si+65h], eax
		jmp	short loc_A2E78

loc_A2DFB:
		cmp	[bp+var_E], 2B50h
		jnz	short loc_A2E36
		mov	word_79752, 1
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_18], ax
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_751A6
		add	sp, 8
		movsx	eax, [bp+var_18]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_1C], edx
		mov	eax, [bp+var_1C]
		jmp	short loc_A2E6E

loc_A2E36:
		cmp	[bp+var_E], 2B55h
		jnz	short loc_A2E78
		mov	word_79752, 1
		sub	dword ptr [si+65h], 4
		push	di
		push	si
		push	large [bp+var_C]
		call	sub_75197
		add	sp, 8
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+16h]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]

loc_A2E6E:
		mov	[si+65h], eax
		mov	word_79752, 0

loc_A2E78:
		inc	di

loc_A2E79:
		cmp	di, word ptr [bp+var_20+2]
		jge	short loc_A2E81
		jmp	loc_A2D7B

loc_A2E81:
		add	word ptr [bp+var_C], 18h

loc_A2E85:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_A2E91:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_A2EA0
		push	si
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_A2EB4

loc_A2EA0:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_A2EB2
		mov	ax, 1
		jmp	short loc_A2EB4

loc_A2EB2:
		xor	ax, ax

loc_A2EB4:
		or	ax, ax
		jnz	short loc_A2EBB
		jmp	loc_A2C38

loc_A2EBB:
		pop	di
		pop	si
		leave
		retf
sub_A2BAB		endp
ovr269		ends
