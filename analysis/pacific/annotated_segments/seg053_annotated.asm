seg053		segment	para public 'CODE' use16
		assume cs:seg053
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 47h, 22h

loc_20562:
		db 8Bh, 56h, 8, 8Bh, 46h, 6, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2056A		proc far

var_E		= word ptr -0Eh
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
		mov	[bp+var_E], si
		test	byte ptr [si+2], 1
		jnz	short loc_205D6
		mov	di, [bp+arg_6]
		movsx	eax, word ptr [si+0Ah]
		add	ax, ax
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
		jns	loc_210E6

loc_205D6:
		push	ds
		pop	gs
		push	ds
		pop	es
		mov	bx, si
		lds	si, [bx+10h]
		mov	di, [bp+arg_4]
		test	byte ptr [si+29h], 2
		jnz	loc_207C4
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
		jnz	short loc_20664
		nop
		nop
		mov	eax, 101h

loc_20664:
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
		jz	short loc_2072C
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
		jle	short loc_206DD
		mov	eax, ecx

loc_206DD:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_206E8
		mov	eax, ecx

loc_206E8:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20715
		mov	edx, ecx

loc_20715:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20720
		mov	edx, ecx

loc_20720:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_207BE

loc_2072C:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_207BE
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_207BE
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20772
		mov	eax, ecx

loc_20772:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2077D
		mov	eax, ecx

loc_2077D:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_207AA
		mov	edx, ecx

loc_207AA:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_207B5
		mov	edx, ecx

loc_207B5:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_207BE:
		rol	cl, 3
		or	[si+29h], cl

loc_207C4:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_20808
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_20808
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_20808
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_20808
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_20808
		nop
		nop
		mov	cx, 0

loc_20808:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_4], eax
		mov	si, [bp+var_E]
		mov	si, es:[si+14h]
		test	byte ptr [si+29h], 2
		jnz	loc_209FD
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
		jnz	short loc_2089D
		nop
		nop
		mov	eax, 101h

loc_2089D:
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
		jz	short loc_20965
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
		jle	short loc_20916
		mov	eax, ecx

loc_20916:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20921
		mov	eax, ecx

loc_20921:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2094E
		mov	edx, ecx

loc_2094E:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20959
		mov	edx, ecx

loc_20959:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_209F7

loc_20965:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_209F7
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_209F7
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_209AB
		mov	eax, ecx

loc_209AB:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_209B6
		mov	eax, ecx

loc_209B6:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_209E3
		mov	edx, ecx

loc_209E3:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_209EE
		mov	edx, ecx

loc_209EE:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_209F7:
		rol	cl, 3
		or	[si+29h], cl

loc_209FD:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_20A41
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_20A41
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_20A41
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_20A41
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_20A41
		nop
		nop
		mov	cx, 0

loc_20A41:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_8], eax
		mov	si, [bp+var_E]
		mov	si, es:[si+18h]
		test	byte ptr [si+29h], 2
		jnz	loc_20C36
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
		jnz	short loc_20AD6
		nop
		nop
		mov	eax, 101h

loc_20AD6:
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
		jz	short loc_20B9E
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
		jle	short loc_20B4F
		mov	eax, ecx

loc_20B4F:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20B5A
		mov	eax, ecx

loc_20B5A:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20B87
		mov	edx, ecx

loc_20B87:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20B92
		mov	edx, ecx

loc_20B92:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_20C30

loc_20B9E:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jl	loc_20C30
		sar	eax, 8
		cmp	eax, ss:6554h
		jg	short loc_20C30
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20BE4
		mov	eax, ecx

loc_20BE4:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20BEF
		mov	eax, ecx

loc_20BEF:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20C1C
		mov	edx, ecx

loc_20C1C:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20C27
		mov	edx, ecx

loc_20C27:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_20C30:
		rol	cl, 3
		or	[si+29h], cl

loc_20C36:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_20C7A
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_20C7A
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_20C7A
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_20C7A
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_20C7A
		nop
		nop
		mov	cx, 0

loc_20C7A:
		or	ss:1227h, cx
		mov	eax, [si+20h]
		mov	[bp+var_C], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:11CCh, 0
		jz	short loc_20CBB
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		sar	eax, 2
		mov	edx, eax
		sar	eax, 1
		add	eax, edx
		push	ss
		pop	gs
		mov	gs:63F8h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_20CBB:
		mov	bx, [bp+var_E]
		mov	al, [si+29h]
		mov	si, es:[bx+14h]
		and	al, [si+29h]
		mov	si, es:[bx+10h]
		and	al, [si+29h]
		test	al, 8
		jnz	loc_210E6
		test	byte ptr [si+29h], 4
		jnz	loc_20DD4
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_20D5C
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20D12
		mov	eax, ecx

loc_20D12:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20D1D
		mov	eax, ecx

loc_20D1D:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20D47
		mov	edx, ecx

loc_20D47:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20D52
		mov	edx, ecx

loc_20D52:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_20DD0
		nop

loc_20D5C:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20D86
		mov	eax, ecx

loc_20D86:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20D91
		mov	eax, ecx

loc_20D91:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20DBE
		mov	edx, ecx

loc_20DBE:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20DC9
		mov	edx, ecx

loc_20DC9:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_20DD0:
		or	byte ptr [si+29h], 8

loc_20DD4:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_20E18
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_20E18
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_20E18
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_20E18
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_20E18
		nop
		nop
		mov	cx, 0

loc_20E18:
		or	ss:1227h, cx
		mov	bx, [bp+var_E]
		mov	si, es:[bx+14h]
		test	byte ptr [si+29h], 4
		jnz	loc_20F23
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_20EAB
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20E61
		mov	eax, ecx

loc_20E61:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20E6C
		mov	eax, ecx

loc_20E6C:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20E96
		mov	edx, ecx

loc_20E96:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20EA1
		mov	edx, ecx

loc_20EA1:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_20F1F
		nop

loc_20EAB:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20ED5
		mov	eax, ecx

loc_20ED5:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20EE0
		mov	eax, ecx

loc_20EE0:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20F0D
		mov	edx, ecx

loc_20F0D:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20F18
		mov	edx, ecx

loc_20F18:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_20F1F:
		or	byte ptr [si+29h], 8

loc_20F23:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_20F67
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_20F67
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_20F67
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_20F67
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_20F67
		nop
		nop
		mov	cx, 0

loc_20F67:
		or	ss:1227h, cx
		mov	bx, [bp+var_E]
		mov	si, es:[bx+18h]
		test	byte ptr [si+29h], 4
		jnz	loc_21072
		mov	eax, [si+20h]
		cmp	eax, ss:13DEh
		jge	short loc_20FFA
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_20FB0
		mov	eax, ecx

loc_20FB0:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_20FBB
		mov	eax, ecx

loc_20FBB:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_20FE5
		mov	edx, ecx

loc_20FE5:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_20FF0
		mov	edx, ecx

loc_20FF0:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_2106E
		nop

loc_20FFA:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:62E0h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DCh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_21024
		mov	eax, ecx

loc_21024:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2102F
		mov	eax, ecx

loc_2102F:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:62E4h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:62DEh
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2105C
		mov	edx, ecx

loc_2105C:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_21067
		mov	edx, ecx

loc_21067:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_2106E:
		or	byte ptr [si+29h], 8

loc_21072:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:62CCh
		jl	short loc_210B6
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:62CEh
		jg	short loc_210B6
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:62C8h
		jl	short loc_210B6
		nop
		nop
		cmp	ax, ss:62CAh
		jg	short loc_210B6
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:62D0h
		jl	short loc_210B6
		nop
		nop
		mov	cx, 0

loc_210B6:
		or	ss:1227h, cx
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		sar	eax, 2
		mov	edx, eax
		sar	eax, 1
		add	eax, edx
		push	seg dseg
		pop	gs
		mov	gs:63F8h, eax
sub_2056A		endp

; START OF FUNCTION CHUNK FOR sub_2056A
		db 0B8h, 1
; END OF FUNCTION CHUNK FOR sub_2056A
seg053		ends
