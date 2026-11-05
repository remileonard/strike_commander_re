seg055		segment	para public 'CODE' use16
		assume cs:seg055
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0B8h, 0, 0, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22028		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		enter	0Ah, 0
		push	si
		push	di
		push	ds
		lds	si, [bp+arg_0]
		mov	[bp+var_A], si
		push	ds
		pop	gs
		push	ds
		pop	es
		mov	bx, si
		lds	si, [bx+4]
		mov	di, [bp+arg_4]
		test	byte ptr [si+29h], 2
		jnz	loc_22223
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
		jnz	short loc_220C3
		nop
		nop
		mov	eax, 101h

loc_220C3:
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
		jz	short loc_2218B
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
		jle	short loc_2213C
		mov	eax, ecx

loc_2213C:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_22147
		mov	eax, ecx

loc_22147:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_22174
		mov	edx, ecx

loc_22174:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2217F
		mov	edx, ecx

loc_2217F:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_2221D

loc_2218B:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_2221D
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_2221D
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_221D1
		mov	eax, ecx

loc_221D1:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_221DC
		mov	eax, ecx

loc_221DC:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_22209
		mov	edx, ecx

loc_22209:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_22214
		mov	edx, ecx

loc_22214:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_2221D:
		rol	cl, 3
		or	[si+29h], cl

loc_22223:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_22267
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_22267
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_22267
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_22267
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_22267
		nop
		nop
		mov	cx, 0

loc_22267:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_4], eax
		mov	si, [bp+var_A]
		mov	si, es:[si+8]
		test	byte ptr [si+29h], 2
		jnz	loc_2245C
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
		jnz	short loc_222FC
		nop
		nop
		mov	eax, 101h

loc_222FC:
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
		jz	short loc_223C4
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
		jle	short loc_22375
		mov	eax, ecx

loc_22375:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_22380
		mov	eax, ecx

loc_22380:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_223AD
		mov	edx, ecx

loc_223AD:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_223B8
		mov	edx, ecx

loc_223B8:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_22456

loc_223C4:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_22456
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_22456
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2240A
		mov	eax, ecx

loc_2240A:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_22415
		mov	eax, ecx

loc_22415:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_22442
		mov	edx, ecx

loc_22442:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2244D
		mov	edx, ecx

loc_2244D:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_22456:
		rol	cl, 3
		or	[si+29h], cl

loc_2245C:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_224A0
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_224A0
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_224A0
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_224A0
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_224A0
		nop
		nop
		mov	cx, 0

loc_224A0:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_8], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_224D3
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		sar	eax, 1
		push	ss
		pop	gs
		mov	gs:63F8h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_224D3:
		mov	bx, [bp+var_A]
		mov	al, [si+29h]
		mov	si, es:[bx+4]
		and	al, [si+29h]
		test	al, 8
		jnz	loc_2279A
		test	byte ptr [si+29h], 4
		jnz	loc_225E5
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_2256D
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_22523
		mov	eax, ecx

loc_22523:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2252E
		mov	eax, ecx

loc_2252E:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_22558
		mov	edx, ecx

loc_22558:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_22563
		mov	edx, ecx

loc_22563:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_225E1
		nop

loc_2256D:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_22597
		mov	eax, ecx

loc_22597:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_225A2
		mov	eax, ecx

loc_225A2:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_225CF
		mov	edx, ecx

loc_225CF:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_225DA
		mov	edx, ecx

loc_225DA:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_225E1:
		or	byte ptr [si+29h], 8

loc_225E5:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_22629
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_22629
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_22629
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_22629
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_22629
		nop
		nop
		mov	cx, 0

loc_22629:
		or	ss:1227h, cx
		mov	bx, [bp+var_A]
		mov	si, es:[bx+8]
		test	byte ptr [si+29h], 4
		jnz	loc_22734
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_226BC
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_22672
		mov	eax, ecx

loc_22672:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2267D
		mov	eax, ecx

loc_2267D:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_226A7
		mov	edx, ecx

loc_226A7:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_226B2
		mov	edx, ecx

loc_226B2:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_22730
		nop

loc_226BC:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_226E6
		mov	eax, ecx

loc_226E6:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_226F1
		mov	eax, ecx

loc_226F1:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2271E
		mov	edx, ecx

loc_2271E:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_22729
		mov	edx, ecx

loc_22729:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_22730:
		or	byte ptr [si+29h], 8

loc_22734:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_22778
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_22778
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_22778
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_22778
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_22778
		nop
		nop
		mov	cx, 0

loc_22778:
		or	ss:1227h, cx
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		sar	eax, 1
		push	seg dseg
		pop	gs
		mov	gs:63F8h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_2279A:
		mov	ax, 0
		pop	ds
		pop	di
		pop	si
sub_22028		endp
seg055		ends
