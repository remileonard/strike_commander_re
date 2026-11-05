seg056		segment	para public 'CODE' use16
		assume cs:seg056
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 68h, 0C4h, 62h, 9Ah, 0C2h, 1Eh, 66h, 39h, 59h, 5Dh, 0CBh, 0, 3, 0, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27900		proc far

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
		jnz	short loc_2796C
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
		jns	loc_2847B

loc_2796C:
		push	ds
		pop	gs
		push	ds
		pop	es
		mov	bx, si
		lds	si, [bx+10h]
		mov	di, [bp+arg_4]
		test	byte ptr [si+29h], 2
		jnz	loc_27B5A
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
		jnz	short loc_279FA
		nop
		nop
		mov	eax, 101h

loc_279FA:
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
		jz	short loc_27AC2
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
		jle	short loc_27A73
		mov	eax, ecx

loc_27A73:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_27A7E
		mov	eax, ecx

loc_27A7E:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_27AAB
		mov	edx, ecx

loc_27AAB:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_27AB6
		mov	edx, ecx

loc_27AB6:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_27B54

loc_27AC2:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_27B54
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_27B54
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_27B08
		mov	eax, ecx

loc_27B08:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_27B13
		mov	eax, ecx

loc_27B13:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_27B40
		mov	edx, ecx

loc_27B40:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_27B4B
		mov	edx, ecx

loc_27B4B:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_27B54:
		rol	cl, 3
		or	[si+29h], cl

loc_27B5A:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_27B9E
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_27B9E
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_27B9E
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_27B9E
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_27B9E
		nop
		nop
		mov	cx, 0

loc_27B9E:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_4], eax
		mov	si, [bp+var_E]
		mov	si, es:[si+14h]
		test	byte ptr [si+29h], 2
		jnz	loc_27D93
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
		jnz	short loc_27C33
		nop
		nop
		mov	eax, 101h

loc_27C33:
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
		jz	short loc_27CFB
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
		jle	short loc_27CAC
		mov	eax, ecx

loc_27CAC:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_27CB7
		mov	eax, ecx

loc_27CB7:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_27CE4
		mov	edx, ecx

loc_27CE4:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_27CEF
		mov	edx, ecx

loc_27CEF:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_27D8D

loc_27CFB:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_27D8D
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_27D8D
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_27D41
		mov	eax, ecx

loc_27D41:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_27D4C
		mov	eax, ecx

loc_27D4C:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_27D79
		mov	edx, ecx

loc_27D79:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_27D84
		mov	edx, ecx

loc_27D84:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_27D8D:
		rol	cl, 3
		or	[si+29h], cl

loc_27D93:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_27DD7
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_27DD7
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_27DD7
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_27DD7
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_27DD7
		nop
		nop
		mov	cx, 0

loc_27DD7:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_8], eax
		mov	si, [bp+var_E]
		mov	si, es:[si+18h]
		test	byte ptr [si+29h], 2
		jnz	loc_27FCC
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
		jnz	short loc_27E6C
		nop
		nop
		mov	eax, 101h

loc_27E6C:
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
		jz	short loc_27F34
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
		jle	short loc_27EE5
		mov	eax, ecx

loc_27EE5:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_27EF0
		mov	eax, ecx

loc_27EF0:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_27F1D
		mov	edx, ecx

loc_27F1D:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_27F28
		mov	edx, ecx

loc_27F28:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0
		jmp	loc_27FC6

loc_27F34:
		mov	cl, 1
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jl	loc_27FC6
		sar	eax, 8
		cmp	eax, ss:6454h
		jg	short loc_27FC6
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_27F7A
		mov	eax, ecx

loc_27F7A:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_27F85
		mov	eax, ecx

loc_27F85:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_27FB2
		mov	edx, ecx

loc_27FB2:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_27FBD
		mov	edx, ecx

loc_27FBD:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		mov	cl, 0

loc_27FC6:
		rol	cl, 3
		or	[si+29h], cl

loc_27FCC:
		mov	cx, 1
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_28010
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_28010
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_28010
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_28010
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_28010
		nop
		nop
		mov	cx, 0

loc_28010:
		or	ss:2625h, cx
		mov	eax, [si+20h]
		mov	[bp+var_C], eax
		mov	di, [bp+arg_0]
		cmp	byte ptr ss:2634h, 0
		jz	short loc_28050
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		mov	edx, 0
		div	dword ptr cs:0Ch
		push	ss
		pop	gs
		mov	gs:6334h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_28050:
		mov	bx, [bp+var_E]
		mov	al, [si+29h]
		mov	si, es:[bx+14h]
		and	al, [si+29h]
		mov	si, es:[bx+10h]
		and	al, [si+29h]
		test	al, 8
		jnz	loc_2847B
		test	byte ptr [si+29h], 4
		jnz	loc_28169
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_280F1
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_280A7
		mov	eax, ecx

loc_280A7:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_280B2
		mov	eax, ecx

loc_280B2:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_280DC
		mov	edx, ecx

loc_280DC:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_280E7
		mov	edx, ecx

loc_280E7:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_28165
		nop

loc_280F1:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2811B
		mov	eax, ecx

loc_2811B:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_28126
		mov	eax, ecx

loc_28126:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_28153
		mov	edx, ecx

loc_28153:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_2815E
		mov	edx, ecx

loc_2815E:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_28165:
		or	byte ptr [si+29h], 8

loc_28169:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_281AD
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_281AD
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_281AD
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_281AD
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_281AD
		nop
		nop
		mov	cx, 0

loc_281AD:
		or	ss:2625h, cx
		mov	bx, [bp+var_E]
		mov	si, es:[bx+14h]
		test	byte ptr [si+29h], 4
		jnz	loc_282B8
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_28240
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_281F6
		mov	eax, ecx

loc_281F6:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_28201
		mov	eax, ecx

loc_28201:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2822B
		mov	edx, ecx

loc_2822B:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_28236
		mov	edx, ecx

loc_28236:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_282B4
		nop

loc_28240:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_2826A
		mov	eax, ecx

loc_2826A:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_28275
		mov	eax, ecx

loc_28275:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_282A2
		mov	edx, ecx

loc_282A2:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_282AD
		mov	edx, ecx

loc_282AD:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_282B4:
		or	byte ptr [si+29h], 8

loc_282B8:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_282FC
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_282FC
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_282FC
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_282FC
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_282FC
		nop
		nop
		mov	cx, 0

loc_282FC:
		or	ss:2625h, cx
		mov	bx, [bp+var_E]
		mov	si, es:[bx+18h]
		test	byte ptr [si+29h], 4
		jnz	loc_28407
		mov	eax, [si+20h]
		cmp	eax, ss:2662h
		jge	short loc_2838F
		nop
		nop
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_28345
		mov	eax, ecx

loc_28345:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_28350
		mov	eax, ecx

loc_28350:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		shrd	eax, edx, 10h
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_2837A
		mov	edx, ecx

loc_2837A:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_28385
		mov	edx, ecx

loc_28385:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4
		jmp	short loc_28403
		nop

loc_2838F:
		mov	eax, [si+1Ch]
		imul	dword ptr ss:6242h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:623Eh
		add	eax, edx
		mov	ecx, 7D00h
		cmp	eax, ecx
		jle	short loc_283B9
		mov	eax, ecx

loc_283B9:
		neg	ecx
		cmp	eax, ecx
		jge	short loc_283C4
		mov	eax, ecx

loc_283C4:
		mov	[si+18h], ax
		mov	eax, [si+24h]
		imul	dword ptr ss:6246h
		idiv	dword ptr [si+20h]
		sar	eax, 8
		movsx	edx, word ptr ss:6240h
		sub	edx, eax
		mov	ecx, 7D00h
		cmp	edx, ecx
		jle	short loc_283F1
		mov	edx, ecx

loc_283F1:
		neg	ecx
		cmp	edx, ecx
		jge	short loc_283FC
		mov	edx, ecx

loc_283FC:
		mov	[si+1Ah], dx
		or	byte ptr [si+29h], 4

loc_28403:
		or	byte ptr [si+29h], 8

loc_28407:
		mov	cx, 0Ah
		mov	ax, [si+18h]
		cmp	ax, ss:647Ah
		jl	short loc_2844B
		nop
		nop
		nop
		nop
		nop
		cmp	ax, ss:647Ch
		jg	short loc_2844B
		nop
		nop
		nop
		nop
		nop
		mov	ax, [si+1Ah]
		cmp	ax, ss:6476h
		jl	short loc_2844B
		nop
		nop
		cmp	ax, ss:6478h
		jg	short loc_2844B
		nop
		nop
		mov	eax, [si+20h]
		cmp	eax, ss:647Eh
		jl	short loc_2844B
		nop
		nop
		mov	cx, 0

loc_2844B:
		or	ss:2625h, cx
		mov	eax, [bp+var_4]
		add	eax, [bp+var_8]
		add	eax, [bp+var_C]
		sar	eax, 2
		mov	edx, eax
		sar	eax, 1
		add	eax, edx
		push	seg dseg
		pop	gs
		mov	gs:6334h, eax
		mov	ax, 1
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_2847B:
		mov	ax, 0
		pop	ds
		pop	di
sub_27900		endp
seg056		ends
