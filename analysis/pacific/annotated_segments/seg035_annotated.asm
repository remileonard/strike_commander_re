seg035		segment	para public 'CODE' use16
		assume cs:seg035
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 57h, 61h, 8Bh, 47h, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_185B9		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
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
		mov	byte_7730E, 0
		mov	ax, si
		add	ax, 61h
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, byte_7730E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1863F
		mov	bx, [si+2]
		mov	ax, [bx+148h]
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 2Dh
		jge	short loc_1863F
		mov	ax, [bx+14Ah]
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 2Dh
		jge	short loc_1863F
		sub	sp, 4
		mov	di, si
		add	di, 50h
		mov	eax, [di]
		mov	[bp+var_C], eax
		sub	sp, 4
		mov	di, si
		add	di, 4Ch
		mov	eax, [di]
		mov	[bp+var_10], eax
		mov	ax, si
		add	ax, 40h
		push	ax
		push	word ptr [bx+1DCh]
		mov	ax, si
		add	ax, 61h
		push	ax
		push	[bp+arg_2]
		call	sub_237B0
		add	sp, 10h

loc_1863F:
		pop	di
		pop	si
		leave
		retf
sub_185B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18643		proc far

var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7CADA
		mov	eax, [bx+1Ah]
		mov	[si+6Fh], eax
		mov	eax, dword_79762
		mov	edx, dword_7979B
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [si+6Fh]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+6Fh], eax
		mov	[bp+var_1C], 399h
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	eax, [si+6Fh]
		sar	eax, 8
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp+var_20], edx
		mov	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_C], eax
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		mov	eax, [si+6Fh]
		sar	eax, 8
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	[bp+var_28], edx
		mov	eax, [bp+var_28]
		shl	eax, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	ax, word ptr [bp+var_34+1]
		mov	[si+5Eh], ax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	ax, word ptr [bp+var_3C+1]
		mov	[si+73h], ax
		pop	si
		leave
		retf
sub_18643		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18746		proc far

var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7709E, 0
		jz	short loc_187A8
		cmp	byte ptr [si+20h], 0
		jnz	short loc_18760
		jmp	loc_187E4

loc_18760:
		push	si
		call	sub_1A95F
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_187E7
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	ax, [si+73h]
		mov	[si+5Eh], ax
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		jmp	short loc_187E4

loc_187A8:
		push	large 0AA0000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		mov	eax, [si+6Fh]
		sar	eax, 8
		push	eax
		push	word_7730F
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_14]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_187E4:
		pop	si
		leave
		retf
sub_18746		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_187E7		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+6Fh]
		sar	eax, 8
		mov	ebx, 186A0h
		cdq
		idiv	ebx
		mov	[bp+var_4], edx
		mov	eax, [bp+var_4]
		mov	ebx, 2710h
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		mov	eax, [si+6Fh]
		sar	eax, 8
		cdq
		idiv	ebx
		mov	[bp+var_8], edx
		mov	eax, [bp+var_8]
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp+var_8], eax
		cmp	byte ptr [si+20h], 0
		jnz	short loc_18848
		jmp	loc_18942

loc_18848:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_188C6
		mov	ax, word ptr [bp+var_4]
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+3Eh]
		add	ax, 2
		push	ax
		mov	ax, [si+3Ch]
		add	ax, 0FFFDh
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, word ptr [bp+var_8]
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+3Eh]
		add	ax, 2
		push	ax
		mov	ax, [si+3Ch]
		inc	ax
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_18942

loc_188C6:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jnz	short loc_18942
		mov	ax, word ptr [bp+var_4]
		add	ax, 0Ch
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+3Eh]
		add	ax, 2
		push	ax
		mov	ax, [si+3Ch]
		add	ax, 0FFFCh
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, word ptr [bp+var_8]
		add	ax, 0Ch
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+3Eh]
		add	ax, 2
		push	ax
		mov	ax, [si+3Ch]
		inc	ax
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch

loc_18942:
		pop	si
		leave
		retf
sub_187E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18945		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [si+3Ah]
		add	ax, [bp+var_1C]
		sub	ax, [si+26h]
		push	ax
		mov	ax, [si+38h]
		add	ax, [bp+var_10]
		sub	ax, [si+24h]
		push	ax
		mov	ax, [si+3Ah]
		sub	ax, [si+26h]
		push	ax
		mov	ax, [si+38h]
		sub	ax, [si+24h]
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_18945		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18A3E		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_18A3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18AF1		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_8], 0B8h
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		push	word_7CADA
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_1C]
		push	large [bp+var_20]
		push	large [bp+var_24]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[si+6Fh], eax
		mov	eax, [si+6Fh]
		mov	edx, dword_797A3
		imul	edx
		shrd	eax, edx, 8
		mov	[si+6Fh], eax
		mov	eax, [si+6Fh]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	ax, word ptr [bp+var_18+1]
		mov	[si+5Eh], ax
		cmp	word ptr [si+5Eh], 167h
		jle	short loc_18B87
		mov	word ptr [si+5Eh], 167h

loc_18B87:
		pop	si
		leave
		retf
sub_18AF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18B8A		proc far

var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7709E, 0
		jz	short loc_18BC5
		cmp	byte ptr [si+20h], 0
		jz	short loc_18BFA
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_18BFD
		add	sp, 6
		jmp	short loc_18BFA

loc_18BC5:
		push	large 0B40000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	word ptr [si+70h]
		push	word_77311
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_14]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_18BFA:
		pop	si
		leave
		retf
sub_18B8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18BFD		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_18BFD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18CB0		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [si+3Ah]
		add	ax, [bp+var_1C]
		sub	ax, [si+26h]
		push	ax
		mov	ax, [si+38h]
		add	ax, [bp+var_10]
		sub	ax, [si+24h]
		push	ax
		mov	ax, [si+3Ah]
		sub	ax, [si+26h]
		push	ax
		mov	ax, [si+38h]
		sub	ax, [si+24h]
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_18CB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18DA9		proc far

var_1C		= word ptr -1Ch
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_18DBC
		jmp	loc_18E6A

loc_18DBC:
		cmp	byte_7709E, 0
		jnz	short loc_18DC6
		jmp	loc_18E6A

loc_18DC6:
		mov	[bp+var_8], 73h
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		push	word_7CADA
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_14]
		mov	[si+6Fh], eax
		mov	eax, [si+6Fh]
		mov	edx, dword_7979B
		imul	edx
		shrd	eax, edx, 8
		mov	[si+6Fh], eax
		mov	eax, [si+6Fh]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10+1]
		mov	[si+5Eh], ax
		sub	word ptr [si+5Eh], 5Ah
		cmp	word ptr [si+5Eh], 0
		jge	short loc_18E39
		add	word ptr [si+5Eh], 168h

loc_18E39:
		cmp	dword ptr [si+6Fh], 0
		jge	short loc_18E45
		mov	ax, 1
		jmp	short loc_18E47

loc_18E45:
		xor	ax, ax

loc_18E47:
		or	al, al
		jz	short loc_18E58
		cmp	word ptr [si+5Eh], 5Ah
		jge	short loc_18E6A
		mov	word ptr [si+5Eh], 5Ah
		jmp	short loc_18E6A

loc_18E58:
		cmp	word ptr [si+5Eh], 5Ah
		jle	short loc_18E6A
		cmp	word ptr [si+5Eh], 10Eh
		jge	short loc_18E6A
		mov	word ptr [si+5Eh], 5Ah

loc_18E6A:
		pop	si
		leave
		retf
sub_18DA9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E6D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7709E, 0
		jz	short loc_18EA3
		cmp	byte ptr [si+20h], 0
		jz	short loc_18EA3
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_18EA6
		add	sp, 6

loc_18EA3:
		pop	si
		pop	bp
		retf
sub_18E6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18EA6		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_18EA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F59		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_18F59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1906A		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_190AB
		cmp	byte_7709E, 0
		jz	short loc_190AB
		les	bx, word_7C884
		mov	ax, es:[bx+23h]
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_8+1]
		mov	[bp+var_2], ax
		imul	ax, ax, 32h
		mov	bx, 10h
		cwd
		idiv	bx
		mov	[si+5Eh], ax

loc_190AB:
		pop	si
		leave
		retf
sub_1906A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_190AE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7709E, 0
		jz	short loc_190E4
		cmp	byte ptr [si+20h], 0
		jz	short loc_190E4
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6

loc_190E4:
		pop	si
		pop	bp
		retf
sub_190AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_190E7		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_190E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1919A		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_1919A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_192AB		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_19309
		cmp	byte_7709E, 0
		jz	short loc_19309
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[si+6Fh], eax
		mov	eax, [si+6Fh]
		add	eax, 0FFFFA600h
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14+1]
		mov	[si+5Eh], ax

loc_19309:
		pop	si
		leave
		retf
sub_192AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1930C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_1931C
		jmp	loc_1941C

loc_1931C:
		cmp	byte_7709E, 0
		jnz	short loc_19326
		jmp	loc_1941C

loc_19326:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_1935E
		push	large 0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1938D

loc_1935E:
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch

loc_1938D:
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1941F
		add	sp, 6
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_193E3
		push	large 20000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1941C

loc_193E3:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jnz	short loc_1941C
		push	large 30000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch

loc_1941C:
		pop	si
		pop	bp
		retf
sub_1930C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1941F		proc far

var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 44h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_10], di
		movsx	eax, [bp+var_10]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	cx, word ptr [bp+var_18+1]
		mov	[bp+var_1A], di
		movsx	eax, [bp+var_1A]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	dx, word ptr [bp+var_22+1]
		neg	dx
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, dx
		push	ax
		mov	ax, [si+3Ch]
		add	ax, cx
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		add	ax, 0FF4Ch
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_24]
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_4], eax
		cmp	word ptr [si+5Eh], 0
		jge	short loc_194EF
		add	word ptr [si+5Eh], 168h

loc_194EF:
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	eax, [bp+var_2C]
		mov	[bp+var_A], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_30]
		mov	[bp+var_E], eax
		mov	[bp+var_32], di
		movsx	eax, [bp+var_32]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_36], edx
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	cx, word ptr [bp+var_3A+1]
		mov	[bp+var_3C], di
		movsx	eax, [bp+var_3C]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_40], edx
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	dx, word ptr [bp+var_44+1]
		neg	dx
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, dx
		push	ax
		mov	ax, [si+3Ch]
		add	ax, cx
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_1941F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19589		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		mov	ax, [bp+var_10]
		neg	ax
		mov	[bp+var_10], ax
		mov	ax, [bp+var_1C]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		push	large 30000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+3Ah]
		sub	ax, [si+26h]
		push	ax
		mov	ax, [si+38h]
		sub	ax, [si+24h]
		push	ax
		push	di
		call	sub_6A514
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_19589		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19721		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_19762
		cmp	byte_7709E, 0
		jz	short loc_19762
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	[si+6Fh], eax
		mov	ax, [si+70h]
		mov	[si+5Eh], ax

loc_19762:
		pop	si
		leave
		retf
sub_19721		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19765		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_1979B
		cmp	byte_7709E, 0
		jz	short loc_1979B
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1979E
		add	sp, 6

loc_1979B:
		pop	si
		pop	bp
		retf
sub_19765		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1979E		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_1979E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19851		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_19851		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19859		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_198B1
		cmp	byte_7709E, 0
		jz	short loc_198B1
		mov	[bp+var_8], 1E00h
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		les	bx, word_7C884
		mov	al, es:[bx+1Eh]
		cbw
		mov	[si+6Fh], ax
		mov	ax, [si+6Fh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_E], edx
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[si+5Eh], ax

loc_198B1:
		pop	si
		leave
		retf
sub_19859		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_198B4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_198EA
		cmp	byte_7709E, 0
		jz	short loc_198EA
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_198ED
		add	sp, 6

loc_198EA:
		pop	si
		pop	bp
		retf
sub_198B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_198ED		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_198ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_199A0		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_199A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19AB1		proc far

var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_19AC5
		jmp	loc_19B77

loc_19AC5:
		cmp	byte_7709E, 0
		jnz	short loc_19ACF
		jmp	loc_19B77

loc_19ACF:
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 86h
		mov	di, ax
		mov	ax, [di+1]
		mov	[bp+var_2], ax
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 8Ah
		mov	di, ax
		mov	ax, [di+1]
		mov	[si+6Fh], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	ax, [si+6Fh]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_6]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_12], eax
		mov	[bp+var_1A], 16800h
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	ax, word ptr [bp+var_22+1]
		mov	[si+5Eh], ax

loc_19B77:
		pop	di
		pop	si
		leave
		retf
sub_19AB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19B7B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_19BB1
		cmp	byte_7709E, 0
		jz	short loc_19BB1
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_19BB4
		add	sp, 6

loc_19BB1:
		pop	si
		pop	bp
		retf
sub_19B7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19BB4		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		neg	ax
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_19BB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19C69		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_19C69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19D7A		proc far

var_4		= word ptr -4
var_3		= word ptr -3
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_19D93
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19DC0

loc_19D93:
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	dx, [bp+var_3]
		or	dx, dx
		jge	short loc_19DBD
		add	dx, 168h

loc_19DBD:
		mov	[si+5Eh], dx

loc_19DC0:
		pop	si
		leave
		retf
sub_19D7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19DC3		proc far

var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7709E, 0
		jz	short loc_19DFE
		cmp	byte ptr [si+20h], 0
		jz	short loc_19E33
		push	si
		call	sub_1A95F
		pop	cx
		push	1Dh
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		imul	ax, ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_19E36
		add	sp, 6
		jmp	short loc_19E33

loc_19DFE:
		push	large 0BE0000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	word ptr [si+5Eh]
		push	word_77313
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_14]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_19E33:
		pop	si
		leave
		retf
sub_19DC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19E36		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_19E36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19EE9		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	ax, [si+3Ch]
		sub	ax, [si+16h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		neg	ax
		mov	[bp+var_1C], ax
		push	1Dh
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_10]
		push	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		cwd
		sub	ax, dx
		sar	ax, 1
		push	ax
		push	di
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_19EE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19FFA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	al, [si+6Fh]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_19FFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A03E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_1A06B
		mov	byte ptr [si+6Fh], 1
		jmp	short loc_1A06F

loc_1A06B:
		mov	byte ptr [si+6Fh], 0

loc_1A06F:
		pop	si
		pop	bp
		retf
sub_1A03E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A072		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_1A082
		jmp	loc_1A106

loc_1A082:
		cmp	byte_7709E, 0
		jz	short loc_1A106
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_1A0C6
		mov	al, [si+6Fh]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A136

loc_1A0C6:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jnz	short loc_1A136
		mov	al, [si+6Fh]
		mov	ah, 0
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A136

loc_1A106:
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1A136
		cmp	byte ptr [si+6Fh], 0
		jz	short loc_1A136
		push	large 0BE0128h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	0C0Ch
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_1A136:
		pop	si
		pop	bp
		retf
sub_1A072		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A139		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	al, [si+6Fh]
		mov	ah, 0
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_1A139		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A180		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_1A1AC
		mov	byte ptr [si+6Fh], 1
		jmp	short loc_1A1B0

loc_1A1AC:
		mov	byte ptr [si+6Fh], 0

loc_1A1B0:
		pop	si
		pop	bp
		retf
sub_1A180		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A1B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_1A1C3
		jmp	loc_1A24E

loc_1A1C3:
		cmp	byte_7709E, 0
		jnz	short loc_1A1CD
		jmp	loc_1A24E

loc_1A1CD:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_1A20B
		mov	al, [si+6Fh]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	loc_1A2BC

loc_1A20B:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jz	short loc_1A218
		jmp	loc_1A2BC

loc_1A218:
		mov	al, [si+6Fh]
		mov	ah, 0
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A2BC

loc_1A24E:
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1A2BC
		cmp	byte ptr [si+6Fh], 0
		jz	short loc_1A27E
		push	large 0B40120h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	0C11h
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_1A27E:
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		and	ax, 1
		or	al, al
		jz	short loc_1A2BC
		push	large 0AA0120h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	0C17h
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_1A2BC:
		pop	si
		pop	bp
		retf
sub_1A1B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A2BF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	al, [si+6Fh]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_1A2BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A303		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_1A330
		mov	byte ptr [si+6Fh], 1
		jmp	short loc_1A334

loc_1A330:
		mov	byte ptr [si+6Fh], 0

loc_1A334:
		pop	si
		pop	bp
		retf
sub_1A303		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A337		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_1A347
		jmp	loc_1A3CB

loc_1A347:
		cmp	byte_7709E, 0
		jz	short loc_1A3CB
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_1A38B
		mov	al, [si+6Fh]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A3FB

loc_1A38B:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jnz	short loc_1A3FB
		mov	al, [si+6Fh]
		mov	ah, 0
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A3FB

loc_1A3CB:
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1A3FB
		cmp	byte ptr [si+6Fh], 0
		jz	short loc_1A3FB
		push	large 0BE008Ch
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	0C1Dh
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_1A3FB:
		pop	si
		pop	bp
		retf
sub_1A337		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A3FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7CADA
		les	bx, [bx+5Fh]
		mov	cx, es:[bx+3Ah]
		mov	ax, cx
		mov	bx, 3E8h
		cwd
		idiv	bx
		mov	[si+6Fh], ax
		mov	ax, cx
		mov	bx, 64h
		cwd
		idiv	bx
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	[si+71h], dx
		mov	ax, cx
		cwd
		idiv	bx
		cwd
		idiv	bx
		mov	[si+73h], dx
		mov	ax, cx
		cwd
		idiv	bx
		mov	[si+75h], dx
		pop	si
		pop	bp
		retf
sub_1A3FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A442		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_7730E, 1
		pop	bp
		retf
sub_1A442		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A44F		proc far

var_16		= word ptr -16h
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_1A463
		jmp	loc_1A641

loc_1A463:
		cmp	byte_7709E, 0
		jnz	short loc_1A46D
		jmp	loc_1A641

loc_1A46D:
		mov	ax, [si+1Ah]
		sub	ax, [si+16h]
		add	ax, 3
		mov	bx, 4
		cwd
		idiv	bx
		mov	di, ax
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jz	short loc_1A48B
		jmp	loc_1A558

loc_1A48B:
		push	word ptr [si+6Fh]
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	word ptr [si+71h]
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, [si+16h]
		add	ax, di
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	word ptr [si+73h]
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, di
		shl	ax, 1
		mov	dx, [si+16h]
		add	dx, ax
		push	dx
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	word ptr [si+75h]
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, di
		imul	ax, ax, 3
		mov	dx, [si+16h]
		add	dx, ax
		push	dx
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	loc_1A68D

loc_1A558:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jz	short loc_1A565
		jmp	loc_1A68D

loc_1A565:
		mov	ax, [si+6Fh]
		add	ax, 0Ah
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+71h]
		add	ax, 0Ah
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, [si+16h]
		add	ax, di
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+73h]
		add	ax, 0Ah
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, di
		shl	ax, 1
		mov	dx, [si+16h]
		add	dx, ax
		push	dx
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		mov	ax, [si+75h]
		add	ax, 0Ah
		push	ax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, di
		imul	ax, ax, 3
		mov	dx, [si+16h]
		add	dx, ax
		push	dx
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A68D

loc_1A641:
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1A68D
		mov	bx, word_7CADA
		les	bx, [bx+5Fh]
		mov	ax, es:[bx+3Ah]
		mov	[bp+var_2], ax
		push	large 0A00000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	[bp+var_2]
		push	word_77315
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_16]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_1A68D:
		pop	di
		pop	si
		leave
		retf
sub_1A44F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A691		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_7CADA
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		mov	cx, ax
		les	bx, [di+5Fh]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_1A6D8
		mov	ax, es:[bx+1Eh]
		add	ax, es:[bx+22h]
		cwd
		sub	ax, dx
		sar	ax, 1
		inc	ax
		mov	[si+6Fh], ax
		jmp	short loc_1A735

loc_1A6D8:
		les	bx, [di+5Fh]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_1A6F8
		les	bx, [di+5Fh]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_1A6FA

loc_1A6F8:
		mov	al, 0

loc_1A6FA:
		cmp	al, 40h
		jz	short loc_1A705
		mov	word ptr [si+6Fh], 0
		jmp	short loc_1A735

loc_1A705:
		les	bx, [di+5Fh]
		mov	ax, es:[bx+1Ch]
		add	ax, es:[bx+20h]
		mov	[si+6Fh], ax
		mov	ax, [si+6Fh]
		cwd
		sub	ax, dx
		sar	ax, 1
		inc	ax
		mov	[si+6Fh], ax
		mov	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		cmp	ax, [si+6Fh]
		jg	short loc_1A735
		mov	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+6Fh], ax

loc_1A735:
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 1
		jnz	short loc_1A749
		mov	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		add	[si+6Fh], ax

loc_1A749:
		pop	di
		pop	si
		pop	bp
		retf
sub_1A691		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A74D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_1A78F
		cmp	byte_7709E, 0
		jz	short loc_1A78F
		push	word ptr [si+6Fh]
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch

loc_1A78F:
		pop	si
		pop	bp
		retf
sub_1A74D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A792		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0FFh
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	word ptr [si+6Fh]
		push	0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_1A792		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A7D3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1A7D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A7DB		proc far

var_4		= word ptr -4
var_3		= word ptr -3
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jnz	short loc_1A7EF
		jmp	loc_1A89D

loc_1A7EF:
		cmp	byte_7709E, 0
		jnz	short loc_1A7F9
		jmp	loc_1A89D

loc_1A7F9:
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	dx, [bp+var_3]
		or	dx, dx
		jge	short loc_1A823
		add	dx, 168h

loc_1A823:
		mov	ax, [si+3Eh]
		imul	dx
		mov	bx, 168h
		cwd
		idiv	bx
		mov	di, ax
		mov	bx, [si+2]
		cmp	word ptr [bx+1E1h], 0
		jnz	short loc_1A86B
		push	large 0
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, [si+3Ch]
		sub	ax, di
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_1A89D

loc_1A86B:
		push	large 10000h
		mov	al, [si+58h]
		push	ax
		push	large [si+54h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		mov	ax, [si+3Ch]
		sub	ax, di
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A514
		add	sp, 0Ch

loc_1A89D:
		pop	di
		pop	si
		leave
sub_1A7DB		endp
seg035		ends
