seg119		segment	para public 'CODE' use16
		assume cs:seg119
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F134		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_4F134		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F13B		proc far

var_A4		= dword ptr -0A4h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 9Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+24h], 0
		jnz	short loc_4F153
		mov	al, 1
		jmp	loc_4F563

loc_4F153:
		mov	[bp+var_A], 0
		mov	ax, [si+0Ch]
		mov	[bp+var_2], ax
		mov	eax, [si+24h]
		mov	[bp+var_6], eax
		jmp	loc_4F558

loc_4F16C:
		mov	[bp+var_B], 0
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_4F181
		jmp	loc_4F554

loc_4F181:
		mov	[bp+var_10], 0
		mov	ax, es:[bx+17h]
		mov	word ptr [bp+var_10], ax
		mov	eax, dword_7976E
		sub	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10]
		mov	es:[bx+17h], ax
		cmp	[bp+var_10], 0
		jge	short loc_4F1AB
		mov	ax, 1
		jmp	short loc_4F1AD

loc_4F1AB:
		xor	ax, ax

loc_4F1AD:
		or	al, al
		jz	short loc_4F1DF
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+4]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_4F1CF
		and	byte ptr es:[bx+4], 0FCh
		or	byte ptr es:[bx+4], 3
		jmp	loc_4F26A

loc_4F1CF:
		les	bx, word ptr [bp+var_6]
		and	byte ptr es:[bx+4], 0FCh
		or	byte ptr es:[bx+4], 2
		jmp	loc_4F26A

loc_4F1DF:
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+0Dh]
		cmp	eax, [bp+var_A]
		jg	short loc_4F208
		mov	al, es:[bx+4]
		and	ax, 3
		cmp	al, 3
		jz	short loc_4F26A
		mov	[bp+var_B], 1
		and	byte ptr es:[bx+4], 0FCh
		or	byte ptr es:[bx+4], 3
		jmp	short loc_4F26A

loc_4F208:
		push	large [bp+var_6]
		nop
		push	cs
		call	near ptr sub_50324
		add	sp, 4
		mov	di, ax
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+5]
		add	eax, [di]
		mov	es:[bx+5], eax
		mov	eax, es:[bx+9]
		add	eax, [di+4]
		mov	es:[bx+9], eax
		mov	eax, es:[bx+0Dh]
		add	eax, [di+8]
		mov	es:[bx+0Dh], eax
		mov	eax, dword_7942B
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		sar	eax, 4
		mov	word ptr [bp+var_1C+2], ax
		add	es:[bx+15h], ax

loc_4F26A:
		dec	[bp+var_2]
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+4]
		and	ax, 3
		cmp	al, 1
		jnz	short loc_4F27E
		jmp	loc_4F554

loc_4F27E:
		mov	al, es:[bx+4]
		and	ax, 3
		cmp	al, 3
		jz	short loc_4F28C
		jmp	loc_4F524

loc_4F28C:
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		cmp	[bp+var_B], 0
		jnz	short loc_4F29D
		jmp	loc_4F42C

loc_4F29D:
		push	0
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_54], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_50], eax
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	[bp+var_4C], eax
		lea	ax, word ptr [bp+var_54]
		push	ax
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		add	dx, 5
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		les	di, [bp+var_24]
		mov	eax, es:[di]
		mov	[bp+var_60], eax
		mov	eax, es:[di+4]
		mov	[bp+var_5C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_58], eax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		or	al, al
		jnz	short loc_4F316
		jmp	loc_4F3DA

loc_4F316:
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+5]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_78], eax
		mov	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+9]
		mov	bx, word_7CEF9
		sub	eax, [bx+18h]
		mov	[bp+var_74], eax
		mov	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+0Dh]
		mov	bx, word_7CEF9
		sub	eax, [bx+1Ch]
		mov	[bp+var_70], eax
		push	eax
		push	large [bp+var_74]
		push	large [bp+var_78]
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
		push	0Fh
		call	sub_5EB62
		add	sp, 8
		sub	sp, 4
		mov	[bp+var_A4], 0
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		add	dx, 5
		mov	word ptr [bp+var_38+2], ax
		mov	word ptr [bp+var_38], dx
		les	di, word ptr [bp+var_38]
		mov	eax, es:[di]
		mov	[bp+var_84], eax
		mov	eax, es:[di+4]
		mov	[bp+var_80], eax
		mov	eax, es:[di+8]
		mov	[bp+var_7C], eax
		lea	ax, word ptr [bp+var_84]
		push	ax
		les	bx, word ptr [bp+var_14]
		push	word ptr es:[bx+1Fh]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah
		jmp	loc_4F524

loc_4F3DA:
		sub	sp, 4
		mov	[bp+var_A4], 0
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		add	dx, 5
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		les	di, [bp+var_28]
		mov	eax, es:[di]
		mov	[bp+var_6C], eax
		mov	eax, es:[di+4]
		mov	[bp+var_68], eax
		mov	eax, es:[di+8]
		mov	[bp+var_64], eax
		lea	ax, word ptr [bp+var_6C]
		push	ax
		les	bx, word ptr [bp+var_14]
		push	word ptr es:[bx+21h]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah
		jmp	loc_4F524

loc_4F42C:
		les	bx, word ptr [bp+var_6]
		les	bx, es:[bx]
		mov	ax, es:[bx+1Bh]
		or	ax, es:[bx+1Dh]
		jnz	short loc_4F43F
		jmp	loc_4F524

loc_4F43F:
		mov	ax, es:[bx+1Dh]
		mov	dx, es:[bx+1Bh]
		mov	word ptr [bp+var_2C+2], ax
		mov	word ptr [bp+var_2C], dx
		push	1
		push	1
		push	ax
		push	dx
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_4F467
		jmp	loc_4F524

loc_4F467:
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		add	dx, 5
		mov	word ptr [bp+var_30+2], ax
		mov	word ptr [bp+var_30], dx
		les	cx, word ptr [bp+var_30]
		mov	bx, cx
		mov	eax, es:[bx]
		mov	[di+12h], eax
		mov	eax, es:[bx+4]
		mov	[di+16h], eax
		mov	eax, es:[bx+8]
		mov	[di+1Ah], eax
		push	0
		mov	ax, di
		add	ax, 5Bh
		push	ax
		call	SetReference16
		add	sp, 4
		lea	ax, [bp+var_90]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	byte ptr [di+5Dh], 0
		mov	eax, [di+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_9C], eax
		mov	eax, [di+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_98], eax
		mov	eax, [di+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_94], eax
		push	eax
		push	large [bp+var_98]
		push	large [bp+var_9C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		sar	eax, 8
		mov	[bp+var_34], eax
		push	0
		push	eax
		push	15h
		call	sub_5EB62
		add	sp, 8
		push	di
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_4F524:
		les	bx, word ptr [bp+var_6]
		and	byte ptr es:[bx+4], 0FCh
		mov	eax, [si+24h]
		cmp	eax, [bp+var_6]
		jnz	short loc_4F543
		push	si
		nop
		push	cs
		call	near ptr sub_4F567
		pop	cx
		mov	[si+26h], dx
		mov	[si+24h], ax

loc_4F543:
		cmp	dword ptr [si+24h], 0
		jz	short loc_4F54F
		dec	word ptr [si+0Ch]
		jmp	short loc_4F554

loc_4F54F:
		mov	word ptr [si+0Ch], 0

loc_4F554:
		add	word ptr [bp+var_6], 1Bh

loc_4F558:
		cmp	[bp+var_2], 0
		jz	short loc_4F561
		jmp	loc_4F16C

loc_4F561:
		mov	al, 1

loc_4F563:
		pop	di
		pop	si
		leave
		retf
sub_4F13B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F567		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	eax, [si+18h]
		mov	[bp+var_4], eax
		jmp	short loc_4F598

loc_4F57D:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jz	short loc_4F593
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_4F5A1

loc_4F593:
		inc	dx
		add	word ptr [bp+var_4], 1Bh

loc_4F598:
		cmp	[si+0Ah], dx
		jg	short loc_4F57D
		xor	dx, dx
		xor	ax, ax

loc_4F5A1:
		pop	si
		leave
		retf
sub_4F567		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F5A4		proc far

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
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+24h], 0
		jnz	short loc_4F5B9
		jmp	loc_4F6E2

loc_4F5B9:
		mov	di, [si+0Ch]
		mov	eax, [si+24h]
		mov	[bp+var_4], eax
		jmp	loc_4F6DB

loc_4F5C7:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_4F5D8
		jmp	loc_4F6D7

loc_4F5D8:
		les	bx, es:[bx]
		mov	ax, es:[bx+33h]
		mov	dx, es:[bx+31h]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 5
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_18], eax
		mov	eax, es:[si+8]
		mov	[bp+var_14], eax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_1C]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_18]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+0Ah], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 5
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		push	large [bp+var_4]
		nop
		push	cs
		call	near ptr sub_50324
		add	sp, 4
		mov	si, ax
		mov	eax, [bp+var_34]
		add	eax, [si]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_30]
		add	eax, [si+4]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		add	eax, [si+8]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_20], eax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_28]
		mov	es:[bx+2Ch], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+30h], eax
		mov	eax, [bp+var_20]
		mov	es:[bx+34h], eax
		push	[bp+arg_2]
		push	[bp+var_6]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		dec	di

loc_4F6D7:
		add	word ptr [bp+var_4], 1Bh

loc_4F6DB:
		or	di, di
		jz	short loc_4F6E2
		jmp	loc_4F5C7

loc_4F6E2:
		pop	di
		pop	si
		leave
		retf
sub_4F5A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F6E6		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_10		= dword ptr -10h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_4F700
		xor	ax, ax
		jmp	loc_4F78D

loc_4F700:
		push	large [bp+arg_8]
		push	65D0h
		call	Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+63h]
		les	bx, [bp+arg_2]
		mov	es:[bx+23h], eax
		cmp	[bp+var_4], 0
		jnz	short loc_4F743
		push	0
		push	large [bp+arg_8]
		push	65D0h
		call	sub_742E8
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_4F743:
		sub	sp, 4
		mov	[bp+var_10], 0
		push	large [bp+var_4]
		sub	sp, 0Ch
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		add	dx, 2
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	di, [bp+var_8]
		mov	eax, es:[di]
		mov	[bp+var_20], eax
		mov	eax, es:[di+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_18], eax
		push	[bp+arg_6]
		push	si
		nop
		push	cs
		call	near ptr sub_4F90A
		add	sp, 18h

loc_4F78D:
		pop	di
		pop	si
		leave
		retf
sub_4F6E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F791		proc far

var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_42		= dword ptr -42h
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [di+54h], 0
		jg	short loc_4F7A9
		jmp	loc_4F906

loc_4F7A9:
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	[bp+var_6], al
		les	bx, [di+0Eh]
		mov	ax, es:[bx+5Eh]
		mov	dx, es:[bx+5Ch]
		add	dx, 4
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	bx, [bp+var_12]
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 0
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_3A], eax
		les	bx, [di+0Eh]
		mov	eax, es:[bx+60h]
		mov	[bp+var_1A], eax
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_36], eax
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_32], eax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	65D0h
		call	Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_4F854
		push	0
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	65D0h
		call	sub_742E8
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_4F854:
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_42], eax
		push	large [bp+var_4]
		sub	sp, 0Ch
		mov	eax, [bp+var_3A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4A], eax
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_4F90A
		add	sp, 18h
		dec	dword ptr [di+54h]
		les	bx, [di+0Eh]
		mov	eax, es:[bx+57h]
		mov	[di+58h], eax
		mov	ax, es:[bx+70h]
		mov	[bp+var_24], ax
		mov	ax, es:[bx+74h]
		mov	dx, es:[bx+72h]
		mov	word ptr [bp+var_28+2], ax
		mov	word ptr [bp+var_28], dx
		mov	[bp+var_2A], 0
		jmp	short loc_4F8FE

loc_4F8B4:
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_42], eax
		push	large [bp+var_4]
		sub	sp, 0Ch
		mov	eax, [bp+var_28]
		mov	[bp+var_2E], eax
		les	dx, word ptr [bp+var_2E]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_52], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_4E], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_4A], eax
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_4F90A
		add	sp, 18h
		add	word ptr [bp+var_28], 0Ch
		inc	[bp+var_2A]

loc_4F8FE:
		mov	ax, [bp+var_2A]
		cmp	ax, [bp+var_24]
		jl	short loc_4F8B4

loc_4F906:
		pop	di
		pop	si
		leave
		retf
sub_4F791		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F90A		proc far

var_134		= dword ptr -134h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 12Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	word ptr [bx+24h], 0
		jz	short loc_4F986
		push	word ptr [bx+24h]
		push	ss
		lea	ax, word ptr [bp+var_A8]
		push	ax
		mov	bx, [bx+24h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_A8]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_7C], eax
		mov	bx, [bp+arg_2]
		push	word ptr [bx+24h]
		push	ss
		lea	ax, word ptr [bp+var_B4]
		push	ax
		mov	bx, [bx+24h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_B4]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_88], eax
		jmp	short loc_4F9E8

loc_4F986:
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_C0]
		push	ax
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_C0]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_7C], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_CC]
		push	ax
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_CC]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_C8]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_88], eax

loc_4F9E8:
		les	bx, [di+1Ch]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_4F9F9
		inc	word ptr [di+0Ch]

loc_4F9F9:
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+arg_4]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+24h]
		cmp	ax, word_7CADA
		jnz	short loc_4FA45
		cmp	byte_7769B, 0
		jz	short loc_4FA45
		les	bx, [di+1Ch]
		mov	eax, dword_7CA18
		mov	es:[bx+5], eax
		mov	eax, dword_7CA1C
		mov	es:[bx+9], eax
		mov	eax, dword_7CA20
		mov	es:[bx+0Dh], eax
		jmp	short loc_4FAB5

loc_4FA45:
		push	[bp+arg_2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	si, ax
		mov	eax, [si]
		add	eax, [bp+arg_4]
		mov	[bp+var_D8], eax
		mov	eax, [si+4]
		add	eax, [bp+arg_8]
		mov	[bp+var_D4], eax
		mov	eax, [si+8]
		add	eax, [bp+arg_C]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_DC], eax
		les	bx, [di+1Ch]
		mov	eax, [bp+var_E4]
		mov	es:[bx+5], eax
		mov	eax, [bp+var_E0]
		mov	es:[bx+9], eax
		mov	eax, [bp+var_DC]
		mov	es:[bx+0Dh], eax

loc_4FAB5:
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_78], eax
		mov	eax, [si+4]
		mov	[bp+var_74], eax
		mov	eax, [si+8]
		mov	[bp+var_70], eax
		lea	ax, word ptr [bp+var_78]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, word ptr [bp+arg_10+2]
		mov	dx, word ptr [bp+arg_10]
		add	dx, 85h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		mov	[bp+var_A], ss
		mov	[bp+var_C], ax
		les	bx, [bp+var_C]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_F0]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		add	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		add	[bp+var_98], eax
		mov	eax, [bp+var_88]
		add	[bp+var_94], eax
		mov	eax, [bp+var_84]
		add	[bp+var_9C], eax
		mov	eax, [bp+var_80]
		add	[bp+var_98], eax
		mov	eax, [bp+var_7C]
		add	[bp+var_94], eax
		mov	bx, [bp+arg_2]
		les	bx, [bx+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_4FBED
		jmp	loc_4FDDE

loc_4FBED:
		mov	bx, [bp+arg_2]
		push	large [bx+0Eh]
		les	bx, [bx+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 13h
		jz	short loc_4FC55
		sub	sp, 4
		mov	[bp+var_134], 0
		mov	ax, [di+1Eh]
		mov	dx, [di+1Ch]
		add	dx, 5
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	si, [bp+var_2C]
		mov	eax, es:[si]
		mov	[bp+var_FC], eax
		mov	eax, es:[si+4]
		mov	[bp+var_F8], eax
		mov	eax, es:[si+8]
		mov	[bp+var_F4], eax
		lea	ax, word ptr [bp+var_FC]
		push	ax
		push	3
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah
		jmp	loc_4FDDE

loc_4FC55:
		les	bx, word ptr [bp+arg_10]
		cmp	dword ptr es:[bx+67h], 0
		jz	short loc_4FC63
		jmp	loc_4FD0E

loc_4FC63:
		push	large [di+1Ch]
		nop
		push	cs
		call	near ptr sub_50324
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [si+4]
		cdq
		idiv	ebx
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [si+8]
		cdq
		idiv	ebx
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_100], eax
		lea	ax, word ptr [bp+var_108]
		push	ax
		mov	ax, [di+1Eh]
		mov	dx, [di+1Ch]
		add	dx, 5
		mov	[bp+var_46], ax
		mov	[bp+var_48], dx
		les	si, [bp+var_48]
		mov	eax, es:[si]
		mov	[bp+var_114], eax
		mov	eax, es:[si+4]
		mov	[bp+var_110], eax
		mov	eax, es:[si+8]
		mov	[bp+var_10C], eax
		lea	ax, word ptr [bp+var_114]
		push	ax
		push	6
		push	word_79797
		call	sub_4D430
		add	sp, 8
		jmp	loc_4FDDE

loc_4FD0E:
		mov	cx, 1
		cmp	byte_7769B, 0
		jz	short loc_4FD2F
		mov	bx, [bp+arg_2]
		mov	ax, [bx+24h]
		cmp	ax, word_7CADA
		jz	short loc_4FD2D
		mov	ax, [bp+arg_2]
		cmp	ax, word_7CADA
		jnz	short loc_4FD2F

loc_4FD2D:
		xor	cx, cx

loc_4FD2F:
		or	cx, cx
		jnz	short loc_4FD36
		jmp	loc_4FDDE

loc_4FD36:
		push	large [di+1Ch]
		nop
		push	cs
		call	near ptr sub_50324
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		mov	eax, [si+4]
		cdq
		idiv	ebx
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	eax, [si+8]
		cdq
		idiv	ebx
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_120], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_118], eax
		lea	ax, word ptr [bp+var_120]
		push	ax
		mov	ax, [di+1Eh]
		mov	dx, [di+1Ch]
		add	dx, 5
		mov	[bp+var_6A], ax
		mov	[bp+var_6C], dx
		les	si, [bp+var_6C]
		mov	eax, es:[si]
		mov	[bp+var_12C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_128], eax
		mov	eax, es:[si+8]
		mov	[bp+var_124], eax
		lea	ax, word ptr [bp+var_12C]
		push	ax
		push	3
		push	word_79797
		call	sub_4D430
		add	sp, 8

loc_4FDDE:
		les	bx, [di+1Ch]
		mov	eax, es:[bx+5]
		add	eax, [bp+var_84]
		mov	es:[bx+5], eax
		mov	eax, es:[bx+9]
		add	eax, [bp+var_80]
		mov	es:[bx+9], eax
		mov	eax, es:[bx+0Dh]
		add	eax, [bp+var_7C]
		mov	es:[bx+0Dh], eax
		les	bx, word ptr [bp+arg_10]
		cmp	dword ptr es:[bx+6Bh], 0
		jz	short loc_4FE89
		mov	ax, es:[bx+6Bh]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		les	bx, word ptr [bp+arg_10]
		sub	eax, es:[bx+6Bh]
		mov	[bp+var_120], eax
		mov	ax, es:[bx+6Bh]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		les	bx, word ptr [bp+arg_10]
		sub	eax, es:[bx+6Bh]
		mov	[bp+var_11C], eax
		mov	ax, es:[bx+6Bh]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		movsx	eax, ax
		les	bx, word ptr [bp+arg_10]
		sub	eax, es:[bx+6Bh]
		mov	[bp+var_118], eax
		mov	eax, [bp+var_120]
		add	[bp+var_9C], eax
		mov	eax, [bp+var_11C]
		add	[bp+var_98], eax
		mov	eax, [bp+var_118]
		add	[bp+var_94], eax

loc_4FE89:
		mov	eax, [bp+var_9C]
		sar	eax, 4
		les	bx, [di+1Ch]
		mov	es:[bx+11h], ax
		mov	eax, [bp+var_98]
		sar	eax, 4
		mov	es:[bx+13h], ax
		mov	eax, [bp+var_94]
		sar	eax, 4
		mov	es:[bx+15h], ax
		mov	bx, [bp+arg_2]
		cmp	word ptr [bx+24h], 0
		jz	short loc_4FECB
		mov	bx, [di+1Ch]
		mov	si, [bp+arg_2]
		mov	ax, [si+24h]
		mov	es:[bx+19h], ax
		jmp	short loc_4FED5

loc_4FECB:
		les	bx, [di+1Ch]
		mov	ax, [bp+arg_2]
		mov	es:[bx+19h], ax

loc_4FED5:
		les	bx, [di+1Ch]
		and	byte ptr es:[bx+4], 0FCh
		or	byte ptr es:[bx+4], 1
		mov	[bp+var_4C], 0
		mov	eax, [bp+arg_14]
		cmp	eax, [bp+var_4C]
		jz	short loc_4FEF9
		mov	ax, 1
		jmp	short loc_4FEFB

loc_4FEF9:
		xor	ax, ax

loc_4FEFB:
		or	al, al
		jz	short loc_4FF10
		les	bx, [di+1Ch]
		mov	ax, word ptr [bp+arg_14]
		mov	es:[bx+17h], ax
		or	byte ptr es:[bx+4], 4
		jmp	short loc_4FF23

loc_4FF10:
		les	bx, word ptr [bp+arg_10]
		mov	ax, es:[bx+73h]
		les	bx, [di+1Ch]
		mov	es:[bx+17h], ax
		and	byte ptr es:[bx+4], 0FBh

loc_4FF23:
		les	bx, [di+1Ch]
		mov	eax, [bp+arg_10]
		mov	es:[bx], eax
		cmp	dword ptr [di+24h], 0
		jnz	short loc_4FF3F
		mov	eax, [di+1Ch]
		mov	[di+24h], eax
		jmp	short loc_4FF4F

loc_4FF3F:
		mov	ax, [di+1Ch]
		cmp	ax, [di+24h]
		jnb	short loc_4FF4F
		mov	eax, [di+1Ch]
		mov	[di+24h], eax

loc_4FF4F:
		mov	eax, [di+1Ch]
		mov	[bp+var_50], eax
		jmp	short loc_4FF8D

loc_4FF59:
		add	word ptr [di+1Ch], 1Bh
		mov	ax, [di+1Ch]
		cmp	ax, [di+20h]
		jb	short loc_4FF6D
		mov	eax, [di+18h]
		mov	[di+1Ch], eax

loc_4FF6D:
		mov	eax, [di+1Ch]
		cmp	eax, [bp+var_50]
		jnz	short loc_4FF8D
		add	word ptr [di+1Ch], 1Bh
		mov	ax, [di+1Ch]
		cmp	ax, [di+20h]
		jb	short loc_4FF9B
		mov	eax, [di+18h]
		mov	[di+1Ch], eax
		jmp	short loc_4FF9B

loc_4FF8D:
		les	bx, [di+1Ch]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_4FF59

loc_4FF9B:
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_4F90A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FFA2		proc far

var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h
arg_E		= word ptr  14h
arg_18		= word ptr  1Eh
arg_1A		= word ptr  20h

		push	bp
		mov	bp, sp
		sub	sp, 7Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_5], 0
		push	ss
		lea	ax, [bp+arg_E]
		push	ax
		push	65D0h
		call	Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_4FFE6
		push	0
		push	ss
		lea	ax, [bp+arg_E]
		push	ax
		push	65D0h
		call	sub_742E8
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_4FFE6:
		push	0
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	[bp+var_62], eax
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_5E], eax
		mov	[bp+var_12], 100h
		mov	eax, [bp+var_12]
		mov	[bp+var_5A], eax
		lea	ax, word ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+arg_2]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+arg_A]
		cmp	eax, [bp+var_16]
		jg	short loc_50040
		mov	ax, 1
		jmp	short loc_50042

loc_50040:
		xor	ax, ax

loc_50042:
		or	al, al
		jz	short loc_500AB
		push	0
		mov	[bp+var_1A], 0
		mov	eax, [bp+var_1A]
		mov	[bp+var_6E], eax
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_6A], eax
		mov	[bp+var_22], 100h
		mov	eax, [bp+var_22]
		mov	[bp+var_66], eax
		lea	ax, word ptr [bp+var_6E]
		push	ax
		lea	ax, word ptr [bp+arg_2]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_26]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_26]
		add	eax, 500h
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		mov	[bp+arg_A], eax
		mov	[bp+var_5], 1

loc_500AB:
		xor	di, di
		jmp	loc_50316

loc_500B0:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 0FFCEh
		mov	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_7A], eax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 0FFCEh
		mov	[bp+var_38], ax
		movsx	eax, [bp+var_38]
		shl	eax, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_76], eax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 0FFCEh
		mov	[bp+var_3E], ax
		movsx	eax, [bp+var_3E]
		shl	eax, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_72], eax
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+7Bh]
		shl	ax, 1
		mov	[bp+var_44], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_44]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		les	bx, word ptr [bp+var_4]
		sub	ax, es:[bx+7Bh]
		mov	[bp+var_30], ax
		lea	ax, word ptr [bp+var_7A]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+85h]
		sar	eax, 8
		mov	bx, ax
		add	bx, [bp+var_30]
		or	bx, bx
		jge	short loc_5019E
		xor	bx, bx

loc_5019E:
		mov	[bp+var_46], bx
		movsx	eax, [bp+var_46]
		shl	eax, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_7A]
		mov	edx, [bp+var_4A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_76]
		mov	edx, [bp+var_4A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_72]
		mov	edx, [bp+var_4A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_72], eax
		cmp	[bp+var_5], 0
		jz	short loc_50215
		cmp	[bp+var_72], 0
		jge	short loc_501FC
		mov	ax, 1
		jmp	short loc_501FE

loc_501FC:
		xor	ax, ax

loc_501FE:
		or	al, al
		jz	short loc_50215
		mov	eax, [bp+var_72]
		neg	eax
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		mov	[bp+var_72], eax

loc_50215:
		les	bx, [si+1Ch]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		mov	eax, [bp+arg_2]
		mov	es:[bx+5], eax
		mov	eax, [bp+arg_6]
		mov	es:[bx+9], eax
		mov	eax, [bp+arg_A]
		mov	es:[bx+0Dh], eax
		mov	eax, [bp+var_7A]
		sar	eax, 4
		mov	es:[bx+11h], ax
		mov	eax, [bp+var_76]
		sar	eax, 4
		mov	es:[bx+13h], ax
		mov	eax, [bp+var_72]
		sar	eax, 4
		mov	es:[bx+15h], ax
		cmp	[bp+arg_1A], 0
		jz	short loc_5026E
		mov	ax, [bp+arg_1A]
		mov	es:[bx+19h], ax
		jmp	short loc_50277

loc_5026E:
		les	bx, [si+1Ch]
		mov	word ptr es:[bx+19h], 0

loc_50277:
		les	bx, [si+1Ch]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_50288
		inc	word ptr [si+0Ch]

loc_50288:
		les	bx, [si+1Ch]
		and	byte ptr es:[bx+4], 0FCh
		or	byte ptr es:[bx+4], 1
		and	byte ptr es:[bx+4], 0FBh
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+73h]
		les	bx, [si+1Ch]
		mov	es:[bx+17h], ax
		cmp	dword ptr [si+24h], 0
		jnz	short loc_502B9
		mov	eax, [si+1Ch]
		mov	[si+24h], eax
		jmp	short loc_502C9

loc_502B9:
		mov	ax, [si+1Ch]
		cmp	ax, [si+24h]
		jnb	short loc_502C9
		mov	eax, [si+1Ch]
		mov	[si+24h], eax

loc_502C9:
		mov	eax, [si+1Ch]
		mov	[bp+var_56], eax
		jmp	short loc_50307

loc_502D3:
		add	word ptr [si+1Ch], 1Bh
		mov	ax, [si+1Ch]
		cmp	ax, [si+20h]
		jb	short loc_502E7
		mov	eax, [si+18h]
		mov	[si+1Ch], eax

loc_502E7:
		mov	eax, [si+1Ch]
		cmp	eax, [bp+var_56]
		jnz	short loc_50307
		add	word ptr [si+1Ch], 1Bh
		mov	ax, [si+1Ch]
		cmp	ax, [si+20h]
		jb	short loc_50315
		mov	eax, [si+18h]
		mov	[si+1Ch], eax
		jmp	short loc_50315

loc_50307:
		les	bx, [si+1Ch]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_502D3

loc_50315:
		inc	di

loc_50316:
		cmp	di, [bp+arg_18]
		jge	short loc_5031E
		jmp	loc_500B0

loc_5031E:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_4FFA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50324		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_79684, 0
		jnz	short loc_50332
		inc	byte_79684

loc_50332:
		les	bx, [bp+arg_0]
		movsx	eax, word ptr es:[bx+11h]
		shl	eax, 4
		mov	dword_7CEBC, eax
		movsx	eax, word ptr es:[bx+13h]
		shl	eax, 4
		mov	dword_7CEC0, eax
		movsx	eax, word ptr es:[bx+15h]
		shl	eax, 4
		mov	dword_7CEC4, eax
		mov	eax, dword_7CEBC
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CEBC, eax
		mov	eax, dword_7CEC0
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CEC0, eax
		mov	eax, dword_7CEC4
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CEC4, eax
sub_50324		endp

; START OF FUNCTION CHUNK FOR sub_50324
		db 0B8h, 8Ch
; END OF FUNCTION CHUNK FOR sub_50324
seg119		ends
