seg088		segment	para public 'CODE' use16
		assume cs:seg088
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36FC1		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_36FC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36FC8		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	2Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_37013
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 15EAh
		push	large [bp+var_4]
		push	ax
		call	sub_36985
		add	sp, 6
		mov	ax, si
		jmp	short loc_37015

loc_37013:
		mov	ax, si

loc_37015:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
sub_36FC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37029		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	8
		push	ds
		push	offset aTERRAIN
		push	large [di+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_37052
		mov	ax, 1
		jmp	short loc_37054

loc_37052:
		xor	ax, ax

loc_37054:
		or	al, al
		jz	short loc_37066
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+17h], 2
		jz	short loc_37093

loc_37062:
		mov	al, 1
		jmp	short loc_37095

loc_37066:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37093
		push	si
		push	di
		mov	bx, [di]
		call	dword ptr [bx+88h]
		add	sp, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax
		add	[si+2Ah], ax
		mov	ax, [si+2Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+6]
		jnb	short loc_37062

loc_37093:
		mov	al, 0

loc_37095:
		pop	di
		pop	si
		leave
		retf
sub_37029		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37099		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_370D0
		les	bx, [bp+arg_6]
		les	bx, es:[bx]
		mov	ax, es:[bx+59h]
		mov	[bp+var_2], ax
		add	[si+2Ah], ax
		mov	ax, [si+2Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+6]
		jb	short loc_370D0
		mov	al, 1
		jmp	short loc_370D2

loc_370D0:
		mov	al, 0

loc_370D2:
		pop	si
		leave
		retf
sub_37099		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_370D5		proc far

var_32		= dword ptr -32h
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	byte_7975D, 0
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+27h], 0
		jnz	short loc_37100
		jmp	loc_372E0

loc_37100:
		mov	ax, [bp+arg_6]
		imul	ax, ax, 0C8h
		add	ax, 7D0h
		movsx	eax, ax
		cmp	eax, [bp+var_4]
		jl	short loc_37117
		jmp	loc_372E0

loc_37117:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	[bp+var_8], 99h
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_32], eax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	Utility_Helper_5783D
		add	sp, 6
		mov	[bp+var_E], 0
		jmp	loc_372D5

loc_3714C:
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 7D0h
		jg	short loc_37166
		jmp	loc_372E0

loc_37166:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+25h]
		call	Math_RandomScale_56C2F
		imul	ax, ax, 1Ah
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+29h]
		mov	bx, es:[bx+27h]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	eax, [bp+var_C]
		mov	[bp+var_12], eax
		push	1
		push	1
		push	large [bp+var_12]
		push	65D0h
		nop
		push	cs
		call	near ptr sub_379D2
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_371AC
		jmp	loc_372D2

loc_371AC:
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+8]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		shl	eax, 8
		mov	edx, [di+12h]
		add	edx, eax
		mov	[si+12h], edx
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+0Ah]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		shl	eax, 8
		mov	edx, [di+16h]
		add	edx, eax
		mov	[si+16h], edx
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+0Ch]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		shl	eax, 8
		mov	edx, [di+1Ah]
		add	edx, eax
		mov	[si+1Ah], edx
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+0Eh]
		shl	eax, 8
		mov	edx, [bp+var_1E]
		add	edx, eax
		push	edx
		mov	ax, es:[bx+14h]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		shl	eax, 8
		pop	edx
		add	edx, eax
		mov	[bp+var_2A], edx
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+10h]
		shl	eax, 8
		mov	edx, [bp+var_1A]
		add	edx, eax
		push	edx
		mov	ax, es:[bx+16h]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		shl	eax, 8
		pop	edx
		add	edx, eax
		mov	[bp+var_26], edx
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+12h]
		shl	eax, 8
		mov	edx, [bp+var_16]
		add	edx, eax
		push	edx
		mov	ax, es:[bx+18h]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		shl	eax, 8
		pop	edx
		add	edx, eax
		mov	[bp+var_22], edx
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		cmp	al, 5
		jnz	short loc_372C6
		push	large [si+0Ah]
		call	sub_2BC61
		add	sp, 4

loc_372C6:
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_372D2:
		inc	[bp+var_E]

loc_372D5:
		mov	ax, [bp+var_E]
		cmp	ax, [bp+arg_6]
		jge	short loc_372E0
		jmp	loc_3714C

loc_372E0:
		pop	di
		pop	si
		leave
		retf
sub_370D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_372E4		proc far

var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
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
var_14		= dword ptr -14h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	cx, 4
		mov	bx, offset word_377C0

loc_37301:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_37310
		add	bx, 2
		loop	short loc_37301
		jmp	short loc_37357

loc_37310:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_37314:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_7CADA
		jnz	short loc_37327
		dec	word_79793
		jmp	short loc_37357

loc_37327:
		dec	word_79795
		jmp	short loc_37357

loc_3732D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_7CADA
		jnz	short loc_37340
		dec	word_79791
		jmp	short loc_37357

loc_37340:
		dec	word_7978D
		jmp	short loc_37357

loc_37346:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_7CADA
		jz	short loc_37357
		dec	word_7978F

loc_37357:
		push	64h
		call	GameVar_Get_56414
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+46h]
		add	dx, ax
		push	dx
		push	64h
		call	GameVar_Set_564BB
		add	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+3], 0
		jz	short loc_37382
		mov	al, 0
		jmp	loc_377BC

loc_37382:
		push	[bp+arg_6]
		push	si
		call	sub_553B6
		add	sp, 4
		cmp	word_7CADA, si
		jnz	short loc_373A2
		mov	al, byte_7769A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_373A2
		mov	al, 0
		jmp	loc_377BC

loc_373A2:
		mov	byte_7975D, 0
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1Bh], 0
		jnz	short loc_373B5
		jmp	loc_37659

loc_373B5:
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_6], eax
		push	1
		push	1
		push	large [bp+var_6]
		push	65D0h
		nop
		push	cs
		call	near ptr sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_373DA
		jmp	loc_374D7

loc_373DA:
		mov	dx, si
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		push	64h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Bh]
		push	word ptr es:[bx+0Ah]
		sub	sp, 4
		mov	ax, es:[bx+8]
		mov	word ptr [bp+var_8], ax
		movsx	eax, word ptr [bp+var_8]
		shl	eax, 8
		mov	[bp+var_70], eax
		push	di
		call	sub_4BD5F
		add	sp, 0Ah
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		mov	word ptr [bp+var_C+2], ax
		push	ax
		mov	ax, di
		add	ax, 5Bh
		push	ax
		call	SetReference16
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		test	byte ptr [si+2], 20h
		jz	short loc_3746B
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+5Eh]
		mov	byte ptr [bp+var_C], al
		mov	[di+5Dh], al
		jmp	short loc_3746F

loc_3746B:
		mov	byte ptr [di+5Dh], 0

loc_3746F:
		mov	eax, [di+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_64], eax
		mov	eax, [di+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_60], eax
		mov	eax, [di+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_5C], eax
		push	eax
		push	large [bp+var_60]
		push	large [bp+var_64]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		sar	eax, 8
		mov	[bp+var_2C], eax
		push	0
		push	eax
		push	2
		call	sub_5EB62
		add	sp, 8
		push	di
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_374D7:
		push	0
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_4C], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_48], eax
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_40], eax
		mov	eax, [di+4]
		mov	[bp+var_3C], eax
		mov	eax, [di+8]
		mov	[bp+var_38], eax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_38]
		jl	short loc_3754D
		mov	ax, 1
		jmp	short loc_3754F

loc_3754D:
		xor	ax, ax

loc_3754F:
		or	al, al
		jnz	short loc_37556
		jmp	loc_37659

loc_37556:
		push	0
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_58], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_54], eax
		mov	[bp+var_28], 100h
		mov	eax, [bp+var_28]
		mov	[bp+var_50], eax
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		or	al, al
		jnz	short loc_375A3
		jmp	loc_37630

loc_375A3:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1Fh], 0FFFFh
		jnz	short loc_375B0
		jmp	loc_37659

loc_375B0:
		mov	eax, [si+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_64], eax
		mov	eax, [si+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_60], eax
		mov	eax, [si+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_5C], eax
		push	eax
		push	large [bp+var_60]
		push	large [bp+var_64]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		sar	eax, 8
		mov	[bp+var_2C], eax
		push	0
		push	eax
		push	10h
		call	sub_5EB62
		add	sp, 8
		sub	sp, 4
		mov	[bp+var_6C], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Fh]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah
		jmp	short loc_37659

loc_37630:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+21h], 0FFFFh
		jz	short loc_37659
		sub	sp, 4
		mov	[bp+var_6C], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	word ptr es:[bx+21h]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah

loc_37659:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+27h], 0
		jz	short loc_37674
		push	word ptr es:[bx+23h]
		push	si
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_370D5
		add	sp, 8

loc_37674:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+2Dh], 0
		jnz	short loc_37682
		jmp	loc_377BA

loc_37682:
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 249F0h
		ja	short loc_37696
		jmp	loc_377BA

loc_37696:
		push	si
		push	67ADh
		call	Container_Op_1E875
		add	sp, 4
		mov	word ptr [bp+var_6+2], ax
		cmp	word ptr [bp+var_6+2], 0
		jnz	short loc_376AE
		jmp	loc_377BA

loc_376AE:
		push	si
		push	ss
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	[bp+var_8], 99h
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_6C], eax
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	Utility_Helper_5783D
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Dh]
		mov	[bp+var_C], eax
		mov	word ptr [bp+var_10+2], 0
		jmp	loc_377AB

loc_376EF:
		mov	eax, [bp+var_C]
		mov	[bp+var_12], eax
		push	1
		push	1
		push	large [bp+var_12]
		push	65D0h
		nop
		push	cs
		call	near ptr sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_37713
		jmp	loc_377A4

loc_37713:
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+8]
		shl	eax, 8
		mov	edx, [si+12h]
		add	edx, eax
		mov	[di+12h], edx
		movsx	eax, word ptr es:[bx+0Ah]
		shl	eax, 8
		mov	edx, [si+16h]
		add	edx, eax
		mov	[di+16h], edx
		movsx	eax, word ptr es:[bx+0Ch]
		shl	eax, 8
		mov	edx, [si+1Ah]
		add	edx, eax
		mov	[di+1Ah], edx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+54h]
		add	sp, 4
		push	large [di+0Ah]
		les	bx, [di+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		cmp	al, 5
		jnz	short loc_37793
		push	large [di+0Ah]
		call	sub_2BC61
		add	sp, 4

loc_37793:
		mov	word ptr [bp+var_14], di
		push	word ptr [bp+var_14]
		push	word ptr [bp+var_6+2]
		call	sub_1EFF9
		add	sp, 4

loc_377A4:
		inc	word ptr [bp+var_10+2]
		add	word ptr [bp+var_C], 0Eh

loc_377AB:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2Bh]
		cmp	ax, word ptr [bp+var_10+2]
		jle	short loc_377BA
		jmp	loc_376EF

loc_377BA:
		mov	al, 1

loc_377BC:
		pop	di
		pop	si
		leave
		retf
sub_372E4		endp

; START OF FUNCTION CHUNK FOR sub_372E4
word_377C0	dw 8
		dw 9
		dw 0Dh
		dw 1Ah
off_377C8	dw offset loc_3732D
		dw offset loc_37314
		dw offset loc_37346
		dw offset loc_37314
; END OF FUNCTION CHUNK FOR sub_372E4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ManagerDestruct (sub_3896E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,32L —
; destructeur (type 0x1AD0) libérant la liste des débris associés : destructeur du
; gestionnaire de débris d'un objet.
; ==============================================================================================
Debris_ManagerDestruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_377FB
		mov	word ptr [si], 15DDh
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_377FB
		push	si
		call	sub_3B2
		pop	cx

loc_377FB:
		pop	di
		pop	si
		pop	bp
		retf
Debris_ManagerDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_377FF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di

loc_37811:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_3782A
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jl	short loc_37811

loc_3782A:
		cmp	[bp+var_2], 0
		jz	short loc_3783C
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Debris_ReleaseRefCounted
		add	sp, 4

loc_3783C:
		pop	di
		pop	si
		leave
		retf
sub_377FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_FindAndRemoveByID (sub_389DE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,43L — recherche dans une liste un élément dont le champ
; (+4) correspond à une valeur, puis le retire (sub_38A20) : recherche et suppression d'un
; débris spécifique par identifiant.
; ==============================================================================================
Debris_FindAndRemoveByID		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0

loc_3784F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_3786D
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_3784F

loc_3786D:
		cmp	[bp+var_2], 0
		jz	short loc_3787F
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Debris_ReleaseRefCounted
		add	sp, 4

loc_3787F:
		pop	si
		leave
		retf
Debris_FindAndRemoveByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ReleaseRefCounted (sub_38A20 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,60L — décrémente
; un compteur de référence (+4), si nul et flag actif (+2) notifie (vtable[0]) et retire de la
; liste : libération d'un débris quand son compteur de référence atteint zéro.
; ==============================================================================================
Debris_ReleaseRefCounted		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_378D7
		mov	eax, [di+4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		dec	word ptr es:[bx+4]
		mov	al, es:[bx+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_378D7
		cmp	byte ptr es:[bx+2], 0
		jz	short loc_378D7
		cmp	[bp+var_4], 0
		jz	short loc_378CB
		push	3
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_378CB

loc_378CB:
		push	0
		push	di
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_378D7:
		pop	di
		pop	si
		leave
		retf
Debris_ReleaseRefCounted		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_FindModelByID (sub_38A79 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,75L — recherche un
; modèle de débris par identifiant dans une table globale (offset +0x2B) : recherche d'un
; modèle de débris pré-chargé par identifiant.
; ==============================================================================================
Debris_FindModelByID		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_2]
		mov	[bp+var_14], eax
		push	8
		push	large [bp+var_14]
		push	ds
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_8], 0
		jmp	short loc_37942

loc_3790B:
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_6], eax
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+36h]
		cmp	eax, [bp+var_10]
		jnz	short loc_37934
		mov	eax, es:[bx+3Ah]
		cmp	eax, [bp+var_C]
		jnz	short loc_37934
		mov	ax, 1
		jmp	short loc_37936

loc_37934:
		xor	ax, ax

loc_37936:
		or	al, al
		jz	short loc_37942
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		jmp	short loc_37957

loc_37942:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_3790B
		xor	dx, dx
		xor	ax, ax

loc_37957:
		pop	si
		leave
		retf
Debris_FindModelByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3795A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_3797C

loc_3796B:
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_3797C
		mov	al, 1
		jmp	short loc_3798F

loc_3797C:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_3796B
		mov	al, 0

loc_3798F:
		pop	si
		leave
		retf
sub_3795A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37992		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_379B9

loc_379A6:
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jnz	short loc_379B9
		mov	bx, [bp+var_2]
		mov	dx, [bx+6]
		mov	ax, [bx+4]
		jmp	short loc_379CE

loc_379B9:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_379A6
		xor	dx, dx
		xor	ax, ax

loc_379CE:
		pop	di
		pop	si
		leave
		retf
sub_37992		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379D2		proc far

var_64		= word ptr -64h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_C], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_10], eax
		cmp	[bp+var_4], 0
		jnz	short loc_37A96
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		push	si
		call	sub_742E8
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	edx, [bp+var_8]
		sub	edx, eax
		mov	[bp+var_8], edx
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		sub	[bp+var_C], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		sub	[bp+var_10], eax
		cmp	byte_79B64, 0
		jz	short loc_37A96
		push	seg seg008
		push	offset loc_5531
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+arg_2]
		lea	ax, [bp+var_64]
		push	ax
		call	CRT_Msg_NullPtrAssign
		add	sp, 12h

loc_37A96:
		cmp	[bp+var_4], 0
		jnz	short loc_37AA0
		jmp	loc_37C1B

loc_37AA0:
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+arg_6]
		mov	es:[bx+43h], al
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_C], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_10], eax
		push	large [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	si, ax
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	edx, [bp+var_8]
		sub	edx, eax
		mov	[bp+var_8], edx
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		sub	[bp+var_C], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		sub	[bp+var_10], eax
		cmp	byte_79B64, 0
		jz	short loc_37B46
		push	seg seg008
		push	offset loc_5562
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+arg_2]
		lea	ax, [bp+var_64]
		push	ax
		call	CRT_Msg_NullPtrAssign
		add	sp, 12h

loc_37B46:
		or	si, si
		jnz	short loc_37B4D
		jmp	loc_37C12

loc_37B4D:
		mov	[bp+var_14], 0
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_C], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_10], eax
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+31h], 0
		jz	short loc_37BA0
		push	si
		push	large es:[bx+31h]
		les	bx, es:[bx+31h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax

loc_37BA0:
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	edx, [bp+var_8]
		sub	edx, eax
		mov	[bp+var_8], edx
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		sub	[bp+var_C], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		sub	[bp+var_10], eax
		cmp	byte_79B64, 0
		jz	short loc_37C03
		push	seg seg008
		push	offset loc_5593
		lea	ax, [bp+var_64]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+arg_2]
		lea	ax, [bp+var_64]
		push	ax
		call	CRT_Msg_NullPtrAssign
		add	sp, 12h

loc_37C03:
		mov	eax, [bp+var_14]
		mov	[si+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]

loc_37C12:
		cmp	byte_79B64, 0
		mov	ax, si
		jmp	short loc_37C1D

loc_37C1B:
		xor	ax, ax

loc_37C1D:
		pop	si
		leave
		retf
sub_379D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_LoadAndInstantiateAlt (sub_38C12 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,85L
; — variante de sub_38B70 utilisant sub_3CA22 pour la résolution finale : chargement et
; instanciation de débris, variante avec résolution alternative.
; ==============================================================================================
Debris_LoadAndInstantiateAlt		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_37C5A
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		push	si
		call	sub_742E8
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_37C5A:
		cmp	[bp+var_4], 0
		jz	short loc_37CCB
		push	large [bp+var_4]
		push	0
		call	sub_3B223
		add	sp, 6
		mov	si, ax
		or	si, si
		jz	short loc_37CC7
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 36h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6], eax
		mov	[bp+var_C], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+31h], 0
		jz	short loc_37CB8
		push	si
		push	large es:[bx+31h]
		les	bx, es:[bx+31h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax

loc_37CB8:
		mov	eax, [bp+var_C]
		mov	[si+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]

loc_37CC7:
		mov	ax, si
		jmp	short loc_37CCD

loc_37CCB:
		xor	ax, ax

loc_37CCD:
		pop	si
		leave
		retf
Debris_LoadAndInstantiateAlt		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37CD0		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		xor	di, di
		or	si, si
		jnz	short loc_37CE7
		jmp	loc_37D91

loc_37CE7:
		mov	eax, [si+0Eh]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_37CF9
		jmp	loc_37D91

loc_37CF9:
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+arg_4]
		mov	es:[bx+43h], al
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_37D6D
		mov	eax, [si+0Ah]
		mov	[di+0Ah], eax
		mov	[bp+var_6], di
		les	bx, [di+0Ah]
		mov	ax, [bp+var_6]
		mov	es:[bx+2], ax
		mov	dword ptr [si+0Ah], 0
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_37D6D:
		mov	dx, [si+24h]
		or	dx, dx
		jz	short loc_37D80
		push	si
		push	dx
		call	sub_74144
		add	sp, 4
		jmp	short loc_37D91

loc_37D80:
		or	si, si
		jz	short loc_37D91
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
sub_37CD0		endp

; START OF FUNCTION CHUNK FOR sub_37CD0
		db 0EBh
; END OF FUNCTION CHUNK FOR sub_37CD0
seg088		ends
