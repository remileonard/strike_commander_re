seg015		segment	para public 'CODE' use16
		assume cs:seg015
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 90h, 0E9h, 0B4h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88E4		proc far

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
		jnz	loc_8ADF
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
		jnz	short loc_897F
		nop
		nop
		mov	eax, 101h

loc_897F:
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
		jz	short loc_8A47
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
		jle	short loc_89F8
		mov	eax, ecx

loc_89F8:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8A03
		mov	eax, ecx

loc_8A03:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8A30
		mov	edx, ecx

loc_8A30:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8A3B
		mov	edx, ecx

loc_8A3B:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_8AD9

loc_8A47:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_8AD9
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_8AD9
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_8A8D
		mov	eax, ecx

loc_8A8D:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8A98
		mov	eax, ecx

loc_8A98:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8AC5
		mov	edx, ecx

loc_8AC5:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8AD0
		mov	edx, ecx

loc_8AD0:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_8AD9:
		rol	cl, 3
		or	[si+29h], cl

loc_8ADF:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_8B23
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_8B23
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_8B23
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_8B23
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_8B23
		nop
		nop
		mov	cx, 0

loc_8B23:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_4], eax
		mov	si, [bp+var_A]
		mov	si, es:[si+8]
		test	byte ptr [si+29h], 2
		jnz	loc_8D18
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
		jnz	short loc_8BB8
		nop
		nop
		mov	eax, 101h

loc_8BB8:
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
		jz	short loc_8C80
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
		jle	short loc_8C31
		mov	eax, ecx

loc_8C31:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8C3C
		mov	eax, ecx

loc_8C3C:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8C69
		mov	edx, ecx

loc_8C69:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8C74
		mov	edx, ecx

loc_8C74:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_8D12

loc_8C80:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_8D12
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_8D12
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_8CC6
		mov	eax, ecx

loc_8CC6:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8CD1
		mov	eax, ecx

loc_8CD1:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8CFE
		mov	edx, ecx

loc_8CFE:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8D09
		mov	edx, ecx

loc_8D09:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_8D12:
		rol	cl, 3
		or	[si+29h], cl

loc_8D18:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_8D5C
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_8D5C
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_8D5C
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_8D5C
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_8D5C
		nop
		nop
		mov	cx, 0

loc_8D5C:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_8], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:2634h, 0
		jz	short loc_8D8F
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		sar	eax, 1
		push	ss
		pop	gs
		mov	gs:6334h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_8D8F:
		mov	bx, [bp+var_A]
		mov	al, [si+29h]
		mov	si, es:[bx+4]
		and	al, [si+29h]
		test	al, 8
		jnz	loc_9056
		test	byte ptr [si+29h], 4
		jnz	loc_8EA1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_8E29
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_8DDF
		mov	eax, ecx

loc_8DDF:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8DEA
		mov	eax, ecx

loc_8DEA:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8E14
		mov	edx, ecx

loc_8E14:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8E1F
		mov	edx, ecx

loc_8E1F:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_8E9D
		nop

loc_8E29:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_8E53
		mov	eax, ecx

loc_8E53:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8E5E
		mov	eax, ecx

loc_8E5E:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8E8B
		mov	edx, ecx

loc_8E8B:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8E96
		mov	edx, ecx

loc_8E96:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_8E9D:
		or	byte ptr [si+29h], 8

loc_8EA1:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_8EE5
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_8EE5
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_8EE5
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_8EE5
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_8EE5
		nop
		nop
		mov	cx, 0

loc_8EE5:
		or	ss:2625h, cx
		mov	bx, [bp+var_A]
		mov	si, es:[bx+8]
		test	byte ptr [si+29h], 4
		jnz	loc_8FF0
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_8F78
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_8F2E
		mov	eax, ecx

loc_8F2E:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8F39
		mov	eax, ecx

loc_8F39:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8F63
		mov	edx, ecx

loc_8F63:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8F6E
		mov	edx, ecx

loc_8F6E:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_8FEC
		nop

loc_8F78:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_8FA2
		mov	eax, ecx

loc_8FA2:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_8FAD
		mov	eax, ecx

loc_8FAD:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_8FDA
		mov	edx, ecx

loc_8FDA:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_8FE5
		mov	edx, ecx

loc_8FE5:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_8FEC:
		or	byte ptr [si+29h], 8

loc_8FF0:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_9034
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_9034
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_9034
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_9034
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_9034
		nop
		nop
		mov	cx, 0

loc_9034:
		or	ss:2625h, cx
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		sar	eax, 1
		push	seg dseg
		pop	gs
		mov	gs:6334h, eax
sub_88E4		endp

; START OF FUNCTION CHUNK FOR sub_88E4
		db 0B8h, 1
; END OF FUNCTION CHUNK FOR sub_88E4
seg015		ends
