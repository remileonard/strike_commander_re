seg054		segment	para public 'CODE' use16
		assume cs:seg054
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

loc_210E6:
		db 0B8h, 0, 0, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_210EE		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	si
		push	di
		push	ecx
		push	ebx
		mov	eax, [bp+arg_0]
		mov	edx, [bp+arg_0]
		shl	eax, 8
		sar	edx, 18h
		mov	ebx, [bp+arg_4]
		idiv	ebx
		mov	edx, eax
		sar	edx, 10h
		pop	ebx
		pop	ecx
		pop	di
		pop	si
		leave
		retf
sub_210EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2111E		proc far

var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	12h, 0
		push	si
		push	di
		push	ds
		lds	si, [bp+arg_0]
		mov	[bp+var_12], si
		test	byte ptr [si+2], 1
		jnz	short loc_2118B
		mov	di, [bp+arg_6]
		movsx	eax, word ptr [si+0Ah]
		add	eax, eax
		add	eax, ss:[di]
		movsx	edx, word ptr [si+4]
		imul	edx
		mov	ebx, eax
		mov	ecx, edx
		movsx	eax, word ptr [si+0Ch]
		add	eax, eax
		add	eax, ss:[di+4]
		movsx	edx, word ptr [si+6]
		imul	edx
		add	ebx, eax
		adc	ecx, edx
		movsx	eax, word ptr [si+0Eh]
		add	eax, eax
		add	eax, ss:[di+8]
		movsx	edx, word ptr [si+8]
		imul	edx
		add	eax, ebx
		adc	edx, ecx
		or	edx, edx
		jns	loc_22020

loc_2118B:
		push	ds
		pop	gs
		push	ds
		pop	es
		mov	bx, si
		lds	si, [bx+10h]
		mov	di, [bp+arg_4]
		test	byte ptr [si+29h], 2
		jnz	loc_21379
		mov	eax, [si]
		imul	dword ptr ss:[di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		mov	[si+1Ch], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+10h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+14h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+18h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		jnz	short loc_21219
		nop
		nop
		mov	eax, 101h

loc_21219:
		mov	[si+20h], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+20h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+24h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+28h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		mov	[si+24h], eax
		or	byte ptr [si+29h], 2
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_212E1
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21292
		mov	eax, ecx

loc_21292:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2129D
		mov	eax, ecx

loc_2129D:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_212CA
		mov	edx, ecx

loc_212CA:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_212D5
		mov	edx, ecx

loc_212D5:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_21373

loc_212E1:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_21373
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_21373
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21327
		mov	eax, ecx

loc_21327:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21332
		mov	eax, ecx

loc_21332:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2135F
		mov	edx, ecx

loc_2135F:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2136A
		mov	edx, ecx

loc_2136A:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_21373:
		rol	cl, 3
		or	[si+29h], cl

loc_21379:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_213BD
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_213BD
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_213BD
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_213BD
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_213BD
		nop
		nop
		mov	cx, 0

loc_213BD:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_4], eax
		mov	si, [bp+var_12]
		mov	si, es:[si+14h]
		test	byte ptr [si+29h], 2
		jnz	loc_215B2
		mov	eax, [si]
		imul	dword ptr ss:[di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		mov	[si+1Ch], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+10h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+14h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+18h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		jnz	short loc_21452
		nop
		nop
		mov	eax, 101h

loc_21452:
		mov	[si+20h], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+20h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+24h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+28h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		mov	[si+24h], eax
		or	byte ptr [si+29h], 2
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_2151A
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_214CB
		mov	eax, ecx

loc_214CB:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_214D6
		mov	eax, ecx

loc_214D6:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21503
		mov	edx, ecx

loc_21503:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2150E
		mov	edx, ecx

loc_2150E:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_215AC

loc_2151A:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_215AC
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_215AC
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21560
		mov	eax, ecx

loc_21560:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2156B
		mov	eax, ecx

loc_2156B:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21598
		mov	edx, ecx

loc_21598:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_215A3
		mov	edx, ecx

loc_215A3:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_215AC:
		rol	cl, 3
		or	[si+29h], cl

loc_215B2:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_215F6
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_215F6
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_215F6
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_215F6
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_215F6
		nop
		nop
		mov	cx, 0

loc_215F6:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_8], eax
		mov	si, [bp+var_12]
		mov	si, es:[si+18h]
		test	byte ptr [si+29h], 2
		jnz	loc_217EB
		mov	eax, [si]
		imul	dword ptr ss:[di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		mov	[si+1Ch], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+10h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+14h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+18h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		jnz	short loc_2168B
		nop
		nop
		mov	eax, 101h

loc_2168B:
		mov	[si+20h], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+20h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+24h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+28h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		mov	[si+24h], eax
		or	byte ptr [si+29h], 2
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_21753
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21704
		mov	eax, ecx

loc_21704:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2170F
		mov	eax, ecx

loc_2170F:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2173C
		mov	edx, ecx

loc_2173C:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21747
		mov	edx, ecx

loc_21747:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_217E5

loc_21753:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_217E5
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_217E5
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21799
		mov	eax, ecx

loc_21799:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_217A4
		mov	eax, ecx

loc_217A4:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_217D1
		mov	edx, ecx

loc_217D1:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_217DC
		mov	edx, ecx

loc_217DC:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_217E5:
		rol	cl, 3
		or	[si+29h], cl

loc_217EB:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_2182F
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_2182F
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_2182F
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_2182F
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_2182F
		nop
		nop
		mov	cx, 0

loc_2182F:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_C], eax
		mov	si, [bp+var_12]
		mov	si, es:[si+1Ch]
		test	byte ptr [si+29h], 2
		jnz	loc_21A24
		mov	eax, [si]
		imul	dword ptr ss:[di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+0Ch]
		mov	[si+1Ch], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+10h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+14h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+18h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+1Ch]
		jnz	short loc_218C4
		nop
		nop
		mov	eax, 101h

loc_218C4:
		mov	[si+20h], eax
		mov	eax, [si]
		imul	dword ptr ss:[di+20h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr ss:[di+24h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr ss:[di+28h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		add	eax, ss:[di+2Ch]
		mov	[si+24h], eax
		or	byte ptr [si+29h], 2
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_2198C
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2193D
		mov	eax, ecx

loc_2193D:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21948
		mov	eax, ecx

loc_21948:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21975
		mov	edx, ecx

loc_21975:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21980
		mov	edx, ecx

loc_21980:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_21A1E

loc_2198C:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_21A1E
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_21A1E
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_219D2
		mov	eax, ecx

loc_219D2:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_219DD
		mov	eax, ecx

loc_219DD:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21A0A
		mov	edx, ecx

loc_21A0A:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21A15
		mov	edx, ecx

loc_21A15:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_21A1E:
		rol	cl, 3
		or	[si+29h], cl

loc_21A24:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_21A68
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_21A68
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_21A68
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_21A68
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_21A68
		nop
		nop
		mov	cx, 0

loc_21A68:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_10], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_21AA4
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		add	eax, [bp+var_10]
		sar	eax, 2
		push	ss
		pop	gs
		mov	gs:63F8h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_21AA4:
		mov	bx, [bp+var_12]
		mov	al, [si+29h]
		mov	si, es:[bx+18h]
		and	al, [si+29h]
		mov	si, es:[bx+14h]
		and	al, [si+29h]
		mov	si, es:[bx+10h]
		and	al, [si+29h]
		test	al, 8
		jnz	loc_22020
		test	byte ptr [si+29h], 4
		jnz	loc_21BC4
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_21B4C
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21B02
		mov	eax, ecx

loc_21B02:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21B0D
		mov	eax, ecx

loc_21B0D:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21B37
		mov	edx, ecx

loc_21B37:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21B42
		mov	edx, ecx

loc_21B42:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_21BC0
		nop

loc_21B4C:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21B76
		mov	eax, ecx

loc_21B76:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21B81
		mov	eax, ecx

loc_21B81:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21BAE
		mov	edx, ecx

loc_21BAE:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21BB9
		mov	edx, ecx

loc_21BB9:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_21BC0:
		or	byte ptr [si+29h], 8

loc_21BC4:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_21C08
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_21C08
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_21C08
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_21C08
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_21C08
		nop
		nop
		mov	cx, 0

loc_21C08:
		or	ss:1227h, cx
		mov	bx, [bp+var_12]
		mov	si, es:[bx+14h]
		test	byte ptr [si+29h], 4
		jnz	loc_21D13
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_21C9B
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21C51
		mov	eax, ecx

loc_21C51:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21C5C
		mov	eax, ecx

loc_21C5C:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21C86
		mov	edx, ecx

loc_21C86:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21C91
		mov	edx, ecx

loc_21C91:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_21D0F
		nop

loc_21C9B:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21CC5
		mov	eax, ecx

loc_21CC5:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21CD0
		mov	eax, ecx

loc_21CD0:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21CFD
		mov	edx, ecx

loc_21CFD:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21D08
		mov	edx, ecx

loc_21D08:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_21D0F:
		or	byte ptr [si+29h], 8

loc_21D13:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_21D57
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_21D57
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_21D57
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_21D57
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_21D57
		nop
		nop
		mov	cx, 0

loc_21D57:
		or	ss:1227h, cx
		mov	bx, [bp+var_12]
		mov	si, es:[bx+18h]
		test	byte ptr [si+29h], 4
		jnz	loc_21E62
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_21DEA
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21DA0
		mov	eax, ecx

loc_21DA0:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21DAB
		mov	eax, ecx

loc_21DAB:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21DD5
		mov	edx, ecx

loc_21DD5:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21DE0
		mov	edx, ecx

loc_21DE0:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_21E5E
		nop

loc_21DEA:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21E14
		mov	eax, ecx

loc_21E14:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21E1F
		mov	eax, ecx

loc_21E1F:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21E4C
		mov	edx, ecx

loc_21E4C:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21E57
		mov	edx, ecx

loc_21E57:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_21E5E:
		or	byte ptr [si+29h], 8

loc_21E62:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_21EA6
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_21EA6
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_21EA6
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_21EA6
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_21EA6
		nop
		nop
		mov	cx, 0

loc_21EA6:
		or	ss:1227h, cx
		mov	bx, [bp+var_12]
		mov	si, es:[bx+1Ch]
		test	byte ptr [si+29h], 4
		jnz	loc_21FB1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_21F39
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21EEF
		mov	eax, ecx

loc_21EEF:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21EFA
		mov	eax, ecx

loc_21EFA:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21F24
		mov	edx, ecx

loc_21F24:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21F2F
		mov	edx, ecx

loc_21F2F:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_21FAD
		nop

loc_21F39:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21F63
		mov	eax, ecx

loc_21F63:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_21F6E
		mov	eax, ecx

loc_21F6E:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_21F9B
		mov	edx, ecx

loc_21F9B:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21FA6
		mov	edx, ecx

loc_21FA6:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_21FAD:
		or	byte ptr [si+29h], 8

loc_21FB1:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_21FF5
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_21FF5
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_21FF5
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_21FF5
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_21FF5
		nop
		nop
		mov	cx, 0

loc_21FF5:
		or	ss:1227h, cx
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		add	eax, [bp+var_10]
		sar	eax, 2
		push	seg dseg
		pop	gs
		mov	gs:63F8h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf
sub_2111E		endp
seg054		ends
