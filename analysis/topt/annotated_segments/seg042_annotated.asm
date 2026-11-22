seg042		segment	para public 'CODE' use16
		assume cs:seg042
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A720		proc far

var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0Eh, 0
		push	si
		push	di
		push	ds
		lds	si, [bp+arg_0]
		les	si, [si+2]
		mov	[bp+var_E], si
		test	byte ptr es:[si], 1
		jnz	short loc_1A77E
		mov	di, [bp+arg_6]
		mov	eax, es:[si+0Eh]
		add	eax, ss:[di]
		imul	dword ptr es:[si+2]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, es:[si+12h]
		add	eax, ss:[di+4]
		imul	dword ptr es:[si+6]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, es:[si+16h]
		add	eax, ss:[di+8]
		imul	dword ptr es:[si+0Ah]
		add	eax, ebx
		adc	edx, ecx
		or	edx, edx
		jns	loc_1B0D1

loc_1A77E:
		push	ds
		pop	gs
		push	es
		pop	fs
		mov	bx, si
		mov	si, [bp+arg_0]
		lds	si, [si+6]
		les	bx, es:[bx+1Ah]
		mov	di, [bp+arg_4]
		test	byte ptr [si+11h], 2
		jnz	loc_1A972
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+8]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		pop	si
		mov	[si+4], eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+10h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+14h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+18h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		pop	si
		mov	[si+8], eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+24h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+28h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		pop	si
		mov	[si+0Ch], eax
		or	byte ptr [si+11h], 2
		cmp	byte ptr ss:3740h, 0
		jz	short loc_1A8DB
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1A88D
		mov	eax, ecx

loc_1A88D:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1A898
		mov	eax, ecx

loc_1A898:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1A8C4
		mov	edx, ecx

loc_1A8C4:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1A8CF
		mov	edx, ecx

loc_1A8CF:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_1A96C

loc_1A8DB:
		mov	cl, 1
		mov	eax, [si+8]
		cmp	eax, ss:3776h
		jl	loc_1A96C
		sar	eax, 8
		cmp	eax, ss:6924h
		jg	short loc_1A96C
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1A921
		mov	eax, ecx

loc_1A921:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1A92C
		mov	eax, ecx

loc_1A92C:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1A958
		mov	edx, ecx

loc_1A958:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1A963
		mov	edx, ecx

loc_1A963:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_1A96C:
		rol	cl, 3
		or	[si+11h], cl

loc_1A972:
		mov	eax, [si+8]
		mov	[bp+var_4], eax
		mov	si, [bp+arg_0]
		mov	si, gs:[si+0Ah]
		mov	bx, [bp+var_E]
		mov	bx, fs:[bx+1Eh]
		test	byte ptr [si+11h], 2
		jnz	loc_1AB67
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+8]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		pop	si
		mov	[si+4], eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+10h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+14h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+18h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		pop	si
		mov	[si+8], eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+24h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+28h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		pop	si
		mov	[si+0Ch], eax
		or	byte ptr [si+11h], 2
		cmp	byte ptr ss:3740h, 0
		jz	short loc_1AAD0
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AA82
		mov	eax, ecx

loc_1AA82:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AA8D
		mov	eax, ecx

loc_1AA8D:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AAB9
		mov	edx, ecx

loc_1AAB9:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AAC4
		mov	edx, ecx

loc_1AAC4:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_1AB61

loc_1AAD0:
		mov	cl, 1
		mov	eax, [si+8]
		cmp	eax, ss:3776h
		jl	loc_1AB61
		sar	eax, 8
		cmp	eax, ss:6924h
		jg	short loc_1AB61
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AB16
		mov	eax, ecx

loc_1AB16:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AB21
		mov	eax, ecx

loc_1AB21:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AB4D
		mov	edx, ecx

loc_1AB4D:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AB58
		mov	edx, ecx

loc_1AB58:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_1AB61:
		rol	cl, 3
		or	[si+11h], cl

loc_1AB67:
		mov	eax, [si+8]
		mov	[bp+var_8], eax
		mov	si, [bp+arg_0]
		mov	si, gs:[si+0Eh]
		mov	bx, [bp+var_E]
		mov	bx, fs:[bx+22h]
		test	byte ptr [si+11h], 2
		jnz	loc_1AD5C
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+4]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+8]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		pop	si
		mov	[si+4], eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+10h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+14h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+18h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		pop	si
		mov	[si+8], eax
		push	si
		mov	eax, es:[bx]
		imul	dword ptr ss:[di+20h]
		mov	esi, eax
		mov	ecx, edx
		mov	eax, es:[bx+4]
		imul	dword ptr ss:[di+24h]
		add	esi, eax
		adc	ecx, edx
		mov	eax, es:[bx+8]
		imul	dword ptr ss:[di+28h]
		add	eax, esi
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		pop	si
		mov	[si+0Ch], eax
		or	byte ptr [si+11h], 2
		cmp	byte ptr ss:3740h, 0
		jz	short loc_1ACC5
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AC77
		mov	eax, ecx

loc_1AC77:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AC82
		mov	eax, ecx

loc_1AC82:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1ACAE
		mov	edx, ecx

loc_1ACAE:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1ACB9
		mov	edx, ecx

loc_1ACB9:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		mov	cl, 0
		jmp	loc_1AD56

loc_1ACC5:
		mov	cl, 1
		mov	eax, [si+8]
		cmp	eax, ss:3776h
		jl	loc_1AD56
		sar	eax, 8
		cmp	eax, ss:6924h
		jg	short loc_1AD56
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AD0B
		mov	eax, ecx

loc_1AD0B:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AD16
		mov	eax, ecx

loc_1AD16:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AD42
		mov	edx, ecx

loc_1AD42:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AD4D
		mov	edx, ecx

loc_1AD4D:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		mov	cl, 0

loc_1AD56:
		rol	cl, 3
		or	[si+11h], cl

loc_1AD5C:
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:3740h, 0
		jz	short loc_1AD95
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		sar	eax, 2
		mov	edx, eax
		sar	eax, 1
		add	eax, edx
		mov	ss:684Eh, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_1AD95:
		mov	al, [si+11h]
		mov	si, gs:[di+0Ah]
		and	al, [si+11h]
		mov	si, gs:[di+6]
		and	al, [si+11h]
		test	al, 8
		jnz	loc_1B0D1
		test	byte ptr [si+11h], 4
		jnz	loc_1AEA9
		mov	eax, [si+8]
		cmp	eax, ss:3776h
		jge	short loc_1AE32
		nop
		nop
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1ADE9
		mov	eax, ecx

loc_1ADE9:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1ADF4
		mov	eax, ecx

loc_1ADF4:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AE1D
		mov	edx, ecx

loc_1AE1D:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AE28
		mov	edx, ecx

loc_1AE28:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		jmp	short loc_1AEA5
		nop

loc_1AE32:
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AE5C
		mov	eax, ecx

loc_1AE5C:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AE67
		mov	eax, ecx

loc_1AE67:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AE93
		mov	edx, ecx

loc_1AE93:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AE9E
		mov	edx, ecx

loc_1AE9E:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4

loc_1AEA5:
		or	byte ptr [si+11h], 8

loc_1AEA9:
		mov	si, gs:[di+0Ah]
		test	byte ptr [si+11h], 4
		jnz	loc_1AFAA
		mov	eax, [si+8]
		cmp	eax, ss:3776h
		jge	short loc_1AF33
		nop
		nop
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AEEA
		mov	eax, ecx

loc_1AEEA:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AEF5
		mov	eax, ecx

loc_1AEF5:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AF1E
		mov	edx, ecx

loc_1AF1E:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AF29
		mov	edx, ecx

loc_1AF29:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		jmp	short loc_1AFA6
		nop

loc_1AF33:
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AF5D
		mov	eax, ecx

loc_1AF5D:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AF68
		mov	eax, ecx

loc_1AF68:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1AF94
		mov	edx, ecx

loc_1AF94:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1AF9F
		mov	edx, ecx

loc_1AF9F:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4

loc_1AFA6:
		or	byte ptr [si+11h], 8

loc_1AFAA:
		mov	si, gs:[di+0Eh]
		test	byte ptr [si+11h], 4
		jnz	loc_1B0AB
		mov	eax, [si+8]
		cmp	eax, ss:3776h
		jge	short loc_1B034
		nop
		nop
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1AFEB
		mov	eax, ecx

loc_1AFEB:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1AFF6
		mov	eax, ecx

loc_1AFF6:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1B01F
		mov	edx, ecx

loc_1B01F:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1B02A
		mov	edx, ecx

loc_1B02A:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4
		jmp	short loc_1B0A7
		nop

loc_1B034:
		mov	eax, [si+4]
		imul	dword ptr ss:6784h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6780h
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_1B05E
		mov	eax, ecx

loc_1B05E:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_1B069
		mov	eax, ecx

loc_1B069:
		mov	[si], ax
		mov	eax, [si+0Ch]
		imul	dword ptr ss:6788h
		idiv	dword ptr [si+8]
		sar	eax, 8
		movsx	edx, word ptr ss:6782h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_1B095
		mov	edx, ecx

loc_1B095:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_1B0A0
		mov	edx, ecx

loc_1B0A0:
		mov	[si+2], dx
		or	byte ptr [si+11h], 4

loc_1B0A7:
		or	byte ptr [si+11h], 8

loc_1B0AB:
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		sar	eax, 2
		mov	edx, eax
		sar	eax, 1
		add	eax, edx
		mov	ss:684Eh, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
sub_1A720		endp
seg042		ends
