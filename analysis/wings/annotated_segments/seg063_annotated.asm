seg063		segment	para public 'CODE' use16
		assume cs:seg063
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0ECh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E3B4		proc far

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
sub_2E3B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E3E4		proc far

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
		jnz	short loc_2E451
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
		jns	loc_2F2E6

loc_2E451:
		push	ds
		pop	gs
		push	ds
		pop	es
		mov	bx, si
		lds	si, [bx+10h]
		mov	di, [bp+arg_4]
		test	byte ptr [si+29h], 2
		jnz	loc_2E63F
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
		jnz	short loc_2E4DF
		nop
		nop
		mov	eax, 101h

loc_2E4DF:
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
		cmp	byte ptr ss:2634h, 0
		jz	short loc_2E5A7
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2E558
		mov	eax, ecx

loc_2E558:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2E563
		mov	eax, ecx

loc_2E563:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2E590
		mov	edx, ecx

loc_2E590:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2E59B
		mov	edx, ecx

loc_2E59B:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_2E639

loc_2E5A7:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_2E639
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_2E639
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2E5ED
		mov	eax, ecx

loc_2E5ED:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2E5F8
		mov	eax, ecx

loc_2E5F8:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2E625
		mov	edx, ecx

loc_2E625:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2E630
		mov	edx, ecx

loc_2E630:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_2E639:
		rol	cl, 3
		or	[si+29h], cl

loc_2E63F:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2E683
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2E683
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2E683
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2E683
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2E683
		nop
		nop
		mov	cx, 0

loc_2E683:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_4], eax
		mov	si, [bp+var_12]
		mov	si, es:[si+14h]
		test	byte ptr [si+29h], 2
		jnz	loc_2E878
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
		jnz	short loc_2E718
		nop
		nop
		mov	eax, 101h

loc_2E718:
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
		cmp	byte ptr ss:2634h, 0
		jz	short loc_2E7E0
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2E791
		mov	eax, ecx

loc_2E791:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2E79C
		mov	eax, ecx

loc_2E79C:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2E7C9
		mov	edx, ecx

loc_2E7C9:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2E7D4
		mov	edx, ecx

loc_2E7D4:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_2E872

loc_2E7E0:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_2E872
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_2E872
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2E826
		mov	eax, ecx

loc_2E826:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2E831
		mov	eax, ecx

loc_2E831:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2E85E
		mov	edx, ecx

loc_2E85E:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2E869
		mov	edx, ecx

loc_2E869:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_2E872:
		rol	cl, 3
		or	[si+29h], cl

loc_2E878:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2E8BC
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2E8BC
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2E8BC
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2E8BC
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2E8BC
		nop
		nop
		mov	cx, 0

loc_2E8BC:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_8], eax
		mov	si, [bp+var_12]
		mov	si, es:[si+18h]
		test	byte ptr [si+29h], 2
		jnz	loc_2EAB1
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
		jnz	short loc_2E951
		nop
		nop
		mov	eax, 101h

loc_2E951:
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
		cmp	byte ptr ss:2634h, 0
		jz	short loc_2EA19
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2E9CA
		mov	eax, ecx

loc_2E9CA:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2E9D5
		mov	eax, ecx

loc_2E9D5:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EA02
		mov	edx, ecx

loc_2EA02:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EA0D
		mov	edx, ecx

loc_2EA0D:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_2EAAB

loc_2EA19:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_2EAAB
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_2EAAB
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EA5F
		mov	eax, ecx

loc_2EA5F:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2EA6A
		mov	eax, ecx

loc_2EA6A:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EA97
		mov	edx, ecx

loc_2EA97:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EAA2
		mov	edx, ecx

loc_2EAA2:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_2EAAB:
		rol	cl, 3
		or	[si+29h], cl

loc_2EAB1:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2EAF5
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2EAF5
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2EAF5
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2EAF5
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2EAF5
		nop
		nop
		mov	cx, 0

loc_2EAF5:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_C], eax
		mov	si, [bp+var_12]
		mov	si, es:[si+1Ch]
		test	byte ptr [si+29h], 2
		jnz	loc_2ECEA
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
		jnz	short loc_2EB8A
		nop
		nop
		mov	eax, 101h

loc_2EB8A:
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
		cmp	byte ptr ss:2634h, 0
		jz	short loc_2EC52
		nop
		nop
		nop
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EC03
		mov	eax, ecx

loc_2EC03:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2EC0E
		mov	eax, ecx

loc_2EC0E:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EC3B
		mov	edx, ecx

loc_2EC3B:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EC46
		mov	edx, ecx

loc_2EC46:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_2ECE4

loc_2EC52:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_2ECE4
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_2ECE4
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EC98
		mov	eax, ecx

loc_2EC98:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2ECA3
		mov	eax, ecx

loc_2ECA3:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2ECD0
		mov	edx, ecx

loc_2ECD0:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2ECDB
		mov	edx, ecx

loc_2ECDB:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_2ECE4:
		rol	cl, 3
		or	[si+29h], cl

loc_2ECEA:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2ED2E
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2ED2E
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2ED2E
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2ED2E
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2ED2E
		nop
		nop
		mov	cx, 0

loc_2ED2E:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_10], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:2634h, 0
		jz	short loc_2ED6A
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		add	eax, [bp+var_10]
		sar	eax, 2
		push	ss
		pop	gs
		mov	gs:6334h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_2ED6A:
		mov	bx, [bp+var_12]
		mov	al, [si+29h]
		mov	si, es:[bx+18h]
		and	al, [si+29h]
		mov	si, es:[bx+14h]
		and	al, [si+29h]
		mov	si, es:[bx+10h]
		and	al, [si+29h]
		test	al, 8
		jnz	loc_2F2E6
		test	byte ptr [si+29h], 4
		jnz	loc_2EE8A
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_2EE12
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EDC8
		mov	eax, ecx

loc_2EDC8:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2EDD3
		mov	eax, ecx

loc_2EDD3:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EDFD
		mov	edx, ecx

loc_2EDFD:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EE08
		mov	edx, ecx

loc_2EE08:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_2EE86
		nop

loc_2EE12:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EE3C
		mov	eax, ecx

loc_2EE3C:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2EE47
		mov	eax, ecx

loc_2EE47:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EE74
		mov	edx, ecx

loc_2EE74:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EE7F
		mov	edx, ecx

loc_2EE7F:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_2EE86:
		or	byte ptr [si+29h], 8

loc_2EE8A:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2EECE
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2EECE
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2EECE
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2EECE
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2EECE
		nop
		nop
		mov	cx, 0

loc_2EECE:
		or	ss:2625h, cx
		mov	bx, [bp+var_12]
		mov	si, es:[bx+14h]
		test	byte ptr [si+29h], 4
		jnz	loc_2EFD9
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_2EF61
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EF17
		mov	eax, ecx

loc_2EF17:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2EF22
		mov	eax, ecx

loc_2EF22:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EF4C
		mov	edx, ecx

loc_2EF4C:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EF57
		mov	edx, ecx

loc_2EF57:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_2EFD5
		nop

loc_2EF61:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2EF8B
		mov	eax, ecx

loc_2EF8B:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2EF96
		mov	eax, ecx

loc_2EF96:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2EFC3
		mov	edx, ecx

loc_2EFC3:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2EFCE
		mov	edx, ecx

loc_2EFCE:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_2EFD5:
		or	byte ptr [si+29h], 8

loc_2EFD9:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2F01D
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2F01D
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2F01D
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2F01D
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2F01D
		nop
		nop
		mov	cx, 0

loc_2F01D:
		or	ss:2625h, cx
		mov	bx, [bp+var_12]
		mov	si, es:[bx+18h]
		test	byte ptr [si+29h], 4
		jnz	loc_2F128
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_2F0B0
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2F066
		mov	eax, ecx

loc_2F066:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2F071
		mov	eax, ecx

loc_2F071:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2F09B
		mov	edx, ecx

loc_2F09B:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2F0A6
		mov	edx, ecx

loc_2F0A6:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_2F124
		nop

loc_2F0B0:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2F0DA
		mov	eax, ecx

loc_2F0DA:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2F0E5
		mov	eax, ecx

loc_2F0E5:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2F112
		mov	edx, ecx

loc_2F112:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2F11D
		mov	edx, ecx

loc_2F11D:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_2F124:
		or	byte ptr [si+29h], 8

loc_2F128:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2F16C
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2F16C
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2F16C
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2F16C
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2F16C
		nop
		nop
		mov	cx, 0

loc_2F16C:
		or	ss:2625h, cx
		mov	bx, [bp+var_12]
		mov	si, es:[bx+1Ch]
		test	byte ptr [si+29h], 4
		jnz	loc_2F277
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_2F1FF
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2F1B5
		mov	eax, ecx

loc_2F1B5:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2F1C0
		mov	eax, ecx

loc_2F1C0:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2F1EA
		mov	edx, ecx

loc_2F1EA:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2F1F5
		mov	edx, ecx

loc_2F1F5:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_2F273
		nop

loc_2F1FF:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2F229
		mov	eax, ecx

loc_2F229:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_2F234
		mov	eax, ecx

loc_2F234:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2F261
		mov	edx, ecx

loc_2F261:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2F26C
		mov	edx, ecx

loc_2F26C:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_2F273:
		or	byte ptr [si+29h], 8

loc_2F277:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2F2BB
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2F2BB
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2F2BB
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2F2BB
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2F2BB
		nop
		nop
		mov	cx, 0

loc_2F2BB:
		or	ss:2625h, cx
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		add	eax, [bp+var_10]
		sar	eax, 2
		push	seg dseg
		pop	gs
		mov	gs:6334h, eax
sub_2E3E4		endp

; START OF FUNCTION CHUNK FOR sub_2E3E4
		db 0B8h, 1
; END OF FUNCTION CHUNK FOR sub_2E3E4
seg063		ends
