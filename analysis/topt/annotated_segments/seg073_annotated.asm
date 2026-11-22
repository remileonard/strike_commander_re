seg073		segment	para public 'CODE' use16
		assume cs:seg073
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C122		proc far

var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		enter	38h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_2C15E
		mov	cx, 8
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr sub_2C122
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2C15E:
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_12], bx
		mov	[bp+var_14], ax
		mov	[bp+var_10], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_2C1AB:
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		add	ax, ax
		adc	cl, cl
		or	byte ptr [bp+var_10], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_8]
		sub	ax, [bx+2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_2C1E1
		mov	si, ax
		mov	dx, bx

loc_2C1E1:
		cmp	ax, di
		jl	short loc_2C1E7
		mov	di, ax

loc_2C1E7:
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_2C1AB
		or	ch, ch
		jnz	loc_2C3EC
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_24], si
		cmp	di, si
		jnz	short loc_2C263
		mov	bx, [bp+var_1A]

loc_2C207:
		mov	si, bx
		mov	ax, [si]

loc_2C20B:
		cmp	bx, [bp+var_12]
		ja	short loc_2C213
		mov	bx, [bp+var_14]

loc_2C213:
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_2C221
		cmp	ax, [bx]
		jle	short loc_2C20B
		jmp	short loc_2C207

loc_2C221:
		mov	bx, [bp+var_1C]

loc_2C224:
		mov	di, bx
		mov	ax, [di]

loc_2C228:
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_2C233
		mov	bx, [bp+var_12]

loc_2C233:
		cmp	bx, [bp+var_1C]
		jz	short loc_2C23E
		cmp	ax, [bx]
		jge	short loc_2C228
		jmp	short loc_2C224

loc_2C23E:
		mov	dx, [si]
		shl	edx, 10h
		mov	[bp+var_28], edx
		mov	dx, [di]
		shl	edx, 10h
		mov	[bp+var_2C], edx
		xor	eax, eax
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_22], ax
		jmp	loc_2C369

loc_2C263:
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2C273
		mov	si, [bp+var_14]

loc_2C273:
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2C289
		cmp	cx, [bp+var_4]
		jle	short loc_2C263

loc_2C289:
		sub	cx, dx
		jz	short loc_2C263
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_28], 8000h
		mov	word ptr [bp+var_28+2], dx

loc_2C2B7:
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2C2CA
		mov	si, [bp+var_12]

loc_2C2CA:
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2C2DD
		cmp	cx, [bp+var_4]
		jle	short loc_2C2B7

loc_2C2DD:
		sub	cx, dx
		jz	short loc_2C2B7
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2C], 8000h
		mov	word ptr [bp+var_2C+2], dx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_2C318
		add	ax, di

loc_2C318:
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	short loc_2C369
		sub	[bp+var_22], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_24], cx
		mov	bx, [bp+var_16]
		sub	cx, [bx+2]
		sub	[bp+var_1E], cx
		shl	ecx, 10h
		mov	eax, [bp+var_30]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_28], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_34]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_2C], eax

loc_2C369:
		mov	bx, [bp+arg_4]
		mov	ax, [bx+4]
		mov	ah, al
		mov	dx, ax
		shl	eax, 10h
		mov	ax, dx
		mov	[bp+var_38], eax
		mov	di, [bp+var_C]
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_28]
		mov	ebx, [bp+var_2C]
		cmp	[bp+var_10], 0
		jnz	short loc_2C3FC

loc_2C396:
		push	eax
		push	edi
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_2C3A4
		xchg	edx, eax

loc_2C3A4:
		shr	eax, 10h
		shr	edx, 10h
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	di, ax
		mov	eax, [bp+var_38]
		mov	dx, cx
		and	cx, 3
		rep stosb
		mov	cx, dx
		shr	cx, 2
		rep stosd
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_2C3EC
		jz	short loc_2C3F1
		dec	[bp+var_1E]
		jz	loc_2C477
		add	eax, [bp+var_30]

loc_2C3DF:
		dec	[bp+var_20]
		jz	loc_2C4D1
		add	ebx, [bp+var_34]
		jmp	short loc_2C396

loc_2C3EC:
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2C3F1:
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_2C396
		nop

loc_2C3FC:
		push	eax
		push	edi
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_2C40A
		xchg	edx, eax

loc_2C40A:
		shr	eax, 10h
		shr	edx, 10h
		cmp	ax, [bp+var_6]
		jg	short loc_2C441
		cmp	dx, [bp+var_2]
		jl	short loc_2C441
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	edi, eax
		sub	ax, [bp+var_2]
		jl	short loc_2C46D

loc_2C429:
		sub	dx, [bp+var_6]
		jg	short loc_2C473

loc_2C42E:
		mov	eax, [bp+var_38]
		mov	dx, cx
		and	cx, 3
		rep stosb
		mov	cx, dx
		shr	cx, 2
		rep stosd

loc_2C441:
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_2C3EC
		jz	short loc_2C463
		dec	[bp+var_1E]
		jz	short loc_2C477
		add	eax, [bp+var_30]

loc_2C458:
		dec	[bp+var_20]
		jz	short loc_2C4D1
		add	ebx, [bp+var_34]
		jmp	short loc_2C3FC

loc_2C463:
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_2C3FC

loc_2C46D:
		sub	di, ax
		add	cx, ax
		jmp	short loc_2C429

loc_2C473:
		sub	cx, dx
		jmp	short loc_2C42E

loc_2C477:
		push	ebx
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2C489
		mov	si, [bp+var_14]

loc_2C489:
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	ax, [bx]
		shl	eax, 10h
		mov	ah, 80h
		pop	ebx
		cmp	[bp+var_10], 0
		jz	loc_2C3DF
		jmp	short loc_2C458

loc_2C4D1:
		push	eax
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2C4E6
		mov	si, [bp+var_12]

loc_2C4E6:
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bh, 80h
		pop	eax
		cmp	[bp+var_10], 0
		jz	loc_2C396
		jmp	loc_2C3FC
sub_2C122		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C52C		proc far

var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	38h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_2C568
		mov	cx, 0Ch
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr sub_2C52C
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2C568:
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_12], bx
		mov	[bp+var_14], ax
		mov	[bp+var_10], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_2C5B5:
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		add	ax, ax
		adc	cl, cl
		or	byte ptr [bp+var_10], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_8]
		sub	ax, [bx+2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_2C5EB
		mov	si, ax
		mov	dx, bx

loc_2C5EB:
		cmp	ax, di
		jl	short loc_2C5F1
		mov	di, ax

loc_2C5F1:
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_2C5B5
		or	ch, ch
		jnz	loc_2C7FE
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_24], si
		cmp	di, si
		jnz	short loc_2C66D
		mov	bx, [bp+var_1A]

loc_2C611:
		mov	si, bx
		mov	ax, [si]

loc_2C615:
		cmp	bx, [bp+var_12]
		ja	short loc_2C61D
		mov	bx, [bp+var_14]

loc_2C61D:
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_2C62B
		cmp	ax, [bx]
		jle	short loc_2C615
		jmp	short loc_2C611

loc_2C62B:
		mov	bx, [bp+var_1C]

loc_2C62E:
		mov	di, bx
		mov	ax, [di]

loc_2C632:
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_2C63D
		mov	bx, [bp+var_12]

loc_2C63D:
		cmp	bx, [bp+var_1C]
		jz	short loc_2C648
		cmp	ax, [bx]
		jge	short loc_2C632
		jmp	short loc_2C62E

loc_2C648:
		mov	dx, [si]
		shl	edx, 10h
		mov	[bp+var_28], edx
		mov	dx, [di]
		shl	edx, 10h
		mov	[bp+var_2C], edx
		xor	eax, eax
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_22], ax
		jmp	loc_2C773

loc_2C66D:
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2C67D
		mov	si, [bp+var_14]

loc_2C67D:
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2C693
		cmp	cx, [bp+var_4]
		jle	short loc_2C66D

loc_2C693:
		sub	cx, dx
		jz	short loc_2C66D
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_28], 8000h
		mov	word ptr [bp+var_28+2], dx

loc_2C6C1:
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2C6D4
		mov	si, [bp+var_12]

loc_2C6D4:
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2C6E7
		cmp	cx, [bp+var_4]
		jle	short loc_2C6C1

loc_2C6E7:
		sub	cx, dx
		jz	short loc_2C6C1
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2C], 8000h
		mov	word ptr [bp+var_2C+2], dx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_2C722
		add	ax, di

loc_2C722:
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	short loc_2C773
		sub	[bp+var_22], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_24], cx
		mov	bx, [bp+var_16]
		sub	cx, [bx+2]
		sub	[bp+var_1E], cx
		shl	ecx, 10h
		mov	eax, [bp+var_30]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_28], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_34]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_2C], eax

loc_2C773:
		mov	fs, [bp+arg_A]
		mov	di, [bp+var_C]
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_28]
		mov	ebx, [bp+var_2C]
		cmp	[bp+var_10], 0
		jnz	short loc_2C80E
		nop
		nop
		nop

loc_2C792:
		push	eax
		push	edi
		push	ebx
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_2C7A2
		xchg	edx, eax

loc_2C7A2:
		shr	eax, 10h
		shr	edx, 10h
		mov	cx, dx
		sub	cx, ax
		add	edi, eax
		mov	si, [bp+arg_8]
		xor	bx, bx
		shr	cx, 1
		jz	short loc_2C7D6
		jnb	short loc_2C7C5
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		stosb
		jcxz	short loc_2C7D6

loc_2C7C5:
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		mov	bl, es:[di+1]
		mov	ah, fs:[bx+si]
		stosw
		dec	cx
		jnz	short loc_2C7C5

loc_2C7D6:
		pop	ebx
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_2C7FE
		jz	short loc_2C803
		dec	[bp+var_1E]
		jz	loc_2C8A2
		add	eax, [bp+var_30]

loc_2C7F1:
		dec	[bp+var_20]
		jz	loc_2C8FC
		add	ebx, [bp+var_34]
		jmp	short loc_2C792

loc_2C7FE:
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2C803:
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	short loc_2C792
		nop

loc_2C80E:
		push	eax
		push	edi
		push	ebx
		mov	edx, ebx
		cmp	edx, eax
		jg	short loc_2C81E
		xchg	edx, eax

loc_2C81E:
		shr	eax, 10h
		shr	edx, 10h
		cmp	ax, [bp+var_6]
		jg	short loc_2C867
		cmp	dx, [bp+var_2]
		jl	short loc_2C867
		mov	cx, dx
		sub	cx, ax
		inc	cx
		add	edi, eax
		sub	ax, [bp+var_2]
		jl	short loc_2C898

loc_2C83D:
		sub	dx, [bp+var_6]
		jg	short loc_2C89E

loc_2C842:
		mov	si, [bp+arg_8]
		xor	bx, bx
		shr	cx, 1
		jnb	short loc_2C856
		jz	short loc_2C867
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		stosb
		jcxz	short loc_2C867

loc_2C856:
		mov	bl, es:[di]
		mov	al, fs:[bx+si]
		mov	bl, es:[di+1]
		mov	ah, fs:[bx+si]
		stosw
		dec	cx
		jnz	short loc_2C856

loc_2C867:
		pop	ebx
		pop	edi
		pop	eax
		add	di, [bp+var_A]
		dec	[bp+var_22]
		js	short loc_2C7FE
		jz	short loc_2C88D
		nop
		nop
		dec	[bp+var_1E]
		jz	short loc_2C8A2
		add	eax, [bp+var_30]

loc_2C882:
		dec	[bp+var_20]
		jz	short loc_2C8FC
		add	ebx, [bp+var_34]
		jmp	short loc_2C80E

loc_2C88D:
		add	eax, [bp+var_30]
		add	ebx, [bp+var_34]
		jmp	loc_2C80E

loc_2C898:
		sub	di, ax
		add	cx, ax
		jmp	short loc_2C83D

loc_2C89E:
		sub	cx, dx
		jmp	short loc_2C842

loc_2C8A2:
		push	ebx
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2C8B4
		mov	si, [bp+var_14]

loc_2C8B4:
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_30], eax
		mov	ax, [bx]
		shl	eax, 10h
		mov	ah, 80h
		pop	ebx
		cmp	[bp+var_10], 0
		jz	loc_2C7F1
		jmp	short loc_2C882

loc_2C8FC:
		push	eax
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2C911
		mov	si, [bp+var_12]

loc_2C911:
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_34], eax
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bh, 80h
		pop	eax
		cmp	[bp+var_10], 0
		jz	loc_2C792
		jmp	loc_2C80E
sub_2C52C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C957		proc far

var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		enter	54h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_2C993
		mov	cx, 8
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr sub_2C957
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2C993:
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_12], bx
		mov	[bp+var_14], ax
		mov	[bp+var_2E], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_2C9E0:
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		add	ax, ax
		adc	cl, cl
		or	byte ptr [bp+var_2E], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_8]
		sub	ax, [bx+2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_2CA16
		mov	si, ax
		mov	dx, bx

loc_2CA16:
		cmp	ax, di
		jl	short loc_2CA1C
		mov	di, ax

loc_2CA1C:
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jnz	short loc_2C9E0
		or	ch, ch
		jnz	loc_2CD4A
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], dx
		mov	[bp+var_26], si
		cmp	di, si
		jnz	loc_2CABC
		mov	bx, [bp+var_1C]

loc_2CA3E:
		mov	si, bx
		mov	ax, [si]

loc_2CA42:
		cmp	bx, [bp+var_12]
		ja	short loc_2CA4A
		mov	bx, [bp+var_14]

loc_2CA4A:
		sub	bx, 16h
		cmp	bx, [bp+var_1C]
		jz	short loc_2CA58
		cmp	ax, [bx]
		jle	short loc_2CA42
		jmp	short loc_2CA3E

loc_2CA58:
		mov	bx, [bp+var_1E]

loc_2CA5B:
		mov	di, bx
		mov	ax, [di]

loc_2CA5F:
		add	bx, 16h
		cmp	bx, [bp+var_14]
		jb	short loc_2CA6A
		mov	bx, [bp+var_12]

loc_2CA6A:
		cmp	bx, [bp+var_1E]
		jz	short loc_2CA75
		cmp	ax, [bx]
		jge	short loc_2CA5F
		jmp	short loc_2CA5B

loc_2CA75:
		mov	dx, [si]
		shl	edx, 10h
		mov	[bp+var_32], edx
		movsx	edx, word ptr [si+4]
		shl	edx, 8
		mov	[bp+var_3A], edx
		mov	dx, [di]
		shl	edx, 10h
		mov	[bp+var_36], edx
		movsx	edx, word ptr [di+4]
		shl	edx, 8
		mov	[bp+var_3E], edx
		xor	eax, eax
		mov	[bp+var_42], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_46], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_24], ax
		jmp	loc_2CC40

loc_2CABC:
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2CACC
		mov	si, [bp+var_14]

loc_2CACC:
		sub	si, 16h
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2CAE2
		cmp	cx, [bp+var_4]
		jle	short loc_2CABC

loc_2CAE2:
		sub	cx, dx
		jz	short loc_2CABC
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_42], eax
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4A], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_32], 8000h
		mov	word ptr [bp+var_32+2], dx
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	[bp+var_3A], edx

loc_2CB3F:
		mov	bx, [bp+var_1E]
		mov	[bp+var_1A], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2CB52
		mov	si, [bp+var_12]

loc_2CB52:
		mov	[bp+var_1E], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2CB65
		cmp	cx, [bp+var_4]
		jle	short loc_2CB3F

loc_2CB65:
		sub	cx, dx
		jz	short loc_2CB3F
		mov	[bp+var_22], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_36], 8000h
		mov	word ptr [bp+var_36+2], dx
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	[bp+var_3E], edx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_26]
		sub	di, [bp+var_8]
		jg	short loc_2CBCF
		add	ax, di

loc_2CBCF:
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_26]
		jle	short loc_2CC40
		sub	[bp+var_24], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_26], cx
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_42]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_32], eax
		mov	eax, [bp+var_4A]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3A], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_1A]
		sub	cx, [bx+2]
		sub	[bp+var_22], cx
		shl	ecx, 10h
		mov	eax, [bp+var_46]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_36], eax
		mov	eax, [bp+var_4E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3E], eax

loc_2CC40:
		mov	di, [bp+var_C]
		mov	ax, [bp+var_26]
		mov	ss:4016h, ax
		mul	[bp+var_A]
		add	di, ax
		mov	eax, [bp+var_32]
		mov	ebx, [bp+var_36]
		mov	ecx, [bp+var_3A]
		mov	edx, [bp+var_3E]
		cmp	[bp+var_2E], 0
		jnz	loc_2CD62
		nop

loc_2CC68:
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	edi
		cmp	ebx, eax
		jg	short loc_2CC7C
		xchg	ebx, eax
		xchg	edx, ecx

loc_2CC7C:
		shr	eax, 10h
		shr	ebx, 10h
		mov	ss:4018h, ax
		add	di, ax
		sub	bx, ax
		mov	si, bx
		jz	short loc_2CCAB
		sub	edx, ecx
		shl	ebx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		shld	edx, eax, 10h
		mov	bx, si

loc_2CCAB:
		add	bx, di
		mov	[bp+var_2C], bx
		inc	si
		mov	bx, cx
		shr	ecx, 10h
		push	bp
		mov	bp, bx
		mov	ch, cl
		push	ax
		mov	ax, ss:4018h
		xor	ax, ss:4016h
		shl	ax, 0Fh
		add	bp, ax
		adc	ch, al
		xor	ah, 80h
		add	bx, ax
		adc	cl, al
		pop	ax
		test	di, 1
		jz	short loc_2CCEE
		mov	es:[di], cl
		inc	di
		dec	si
		jz	short loc_2CD0F
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		xchg	bp, bx
		xchg	ch, cl

loc_2CCEE:
		add	ax, ax
		adc	dl, dl
		shr	si, 1
		jz	short loc_2CD0C
		pushf
		nop

loc_2CCF8:
		mov	es:[di], cx
		add	di, 2
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		dec	si
		jnz	short loc_2CCF8
		popf
		jnb	short loc_2CD0F

loc_2CD0C:
		mov	es:[di], cl

loc_2CD0F:
		pop	bp
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		add	di, [bp+var_A]
		inc	word ptr ss:4016h
		dec	[bp+var_24]
		js	short loc_2CD4A
		jz	short loc_2CD4F
		dec	[bp+var_20]
		jz	loc_2CEAE
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]

loc_2CD38:
		dec	[bp+var_22]
		jz	loc_2CF38
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2CC68

loc_2CD4A:
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2CD4F:
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2CC68

loc_2CD62:
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	edi
		cmp	ebx, eax
		jg	short loc_2CD76
		xchg	ebx, eax
		xchg	edx, ecx

loc_2CD76:
		shr	eax, 10h
		cmp	ax, [bp+var_6]
		jg	loc_2CE3A
		shr	ebx, 10h
		cmp	bx, [bp+var_2]
		jl	loc_2CE3A
		mov	ss:4018h, ax
		mov	[bp+var_28], ax
		mov	[bp+var_2A], bx
		add	di, ax
		sub	bx, ax
		mov	si, bx
		inc	si
		cmp	si, 1
		jz	short loc_2CDBA
		sub	edx, ecx
		shl	ebx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_52], eax

loc_2CDBA:
		mov	bx, cx
		shr	ecx, 10h
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_28]
		jg	loc_2CE87

loc_2CDCA:
		mov	ax, [bp+var_2A]
		sub	ax, [bp+var_6]
		jg	loc_2CEA9

loc_2CDD4:
		mov	ax, di
		add	ax, si
		dec	ax
		mov	[bp+var_2C], ax
		mov	ax, word ptr [bp+var_52]
		mov	dx, word ptr [bp+var_52+2]
		push	bp
		mov	bp, bx
		mov	ch, cl
		push	ax
		mov	ax, ss:4018h
		xor	ax, ss:4016h
		shl	ax, 0Fh
		add	bp, ax
		adc	ch, al
		xor	ah, 80h
		add	bx, ax
		adc	cl, al
		pop	ax
		test	di, 1
		jz	short loc_2CE19
		mov	es:[di], cl
		inc	di
		dec	si
		jz	short loc_2CE39
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		xchg	bp, bx
		xchg	ch, cl

loc_2CE19:
		add	ax, ax
		adc	dl, dl
		shr	si, 1
		jz	short loc_2CE36
		pushf

loc_2CE22:
		mov	es:[di], cx
		add	di, 2
		add	bx, ax
		adc	cl, dl
		add	bp, ax
		adc	ch, dl
		dec	si
		jg	short loc_2CE22
		popf
		jnb	short loc_2CE39

loc_2CE36:
		mov	es:[di], cl

loc_2CE39:
		pop	bp

loc_2CE3A:
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		add	di, [bp+var_A]
		inc	word ptr ss:4016h
		dec	[bp+var_24]
		js	loc_2CD4A
		jz	short loc_2CE74
		dec	[bp+var_20]
		jz	short loc_2CEAE
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]

loc_2CE62:
		dec	[bp+var_22]
		jz	loc_2CF38
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2CD62

loc_2CE74:
		add	eax, [bp+var_42]
		add	ecx, [bp+var_4A]
		add	ebx, [bp+var_46]
		add	edx, [bp+var_4E]
		jmp	loc_2CD62

loc_2CE87:
		add	di, ax
		sub	si, ax
		add	ss:4018h, ax
		shl	eax, 10h
		imul	[bp+var_52]
		shrd	eax, edx, 10h
		shld	edx, eax, 10h
		add	bx, ax
		adc	cx, dx
		jmp	loc_2CDCA

loc_2CEA9:
		sub	si, ax
		jmp	loc_2CDD4

loc_2CEAE:
		push	ebx
		push	edx
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		cmp	si, [bp+var_12]
		ja	short loc_2CEC2
		mov	si, [bp+var_14]

loc_2CEC2:
		sub	si, 16h
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx
		shl	ecx, 10h
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4A], eax
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_42], eax
		movzx	ecx, word ptr [bx+4]
		shl	ecx, 8
		mov	ax, [bx]
		shl	eax, 10h
		mov	ah, 80h
		pop	edx
		pop	ebx
		cmp	[bp+var_2E], 0
		jz	loc_2CD38
		jmp	loc_2CE62

loc_2CF38:
		push	eax
		push	ecx
		mov	bx, [bp+var_1E]
		mov	[bp+var_1A], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_14]
		jb	short loc_2CF4F
		mov	si, [bp+var_12]

loc_2CF4F:
		mov	[bp+var_1E], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_22], cx
		shl	ecx, 10h
		movzx	edx, word ptr [si+4]
		movzx	eax, word ptr [bx+4]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [bx+4]
		shl	edx, 8
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bh, 80h
		pop	ecx
		pop	eax
		cmp	[bp+var_2E], 0
		jz	loc_2CC68
		jmp	loc_2CD62
sub_2C957		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CFC2		proc far

var_68		= word ptr -68h
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= dword ptr  14h

		enter	68h, 0
		push	ds
		push	si
		push	di
		cld
		test	sp, 3
		jz	short loc_2CFFE
		mov	cx, 12h
		and	cx, 0FFFCh
		add	cx, 4
		mov	bx, sp
		and	sp, 0FFFCh
		sub	sp, cx
		mov	di, sp
		lea	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		mov	ds, ax
		shr	cx, 2
		rep movsd
		mov	si, bx
		push	cs
		call	near ptr sub_2CFC2
		mov	sp, si
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2CFFE:
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	es, [si]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		lds	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, 16h
		mul	dx
		add	ax, bx
		mov	[bp+var_10], bx
		mov	[bp+var_12], ax
		mov	word ptr [bp+var_2E], 0
		mov	si, 7FFFh
		mov	di, 8000h
		mov	ch, 0Fh

loc_2D04B:
		xor	cl, cl
		mov	ax, [bx]
		sub	ax, [bp+var_2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_6]
		sub	ax, [bx]
		add	ax, ax
		adc	cl, cl
		or	byte ptr [bp+var_2E], cl
		mov	ax, [bx+2]
		sub	ax, [bp+var_4]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bp+var_8]
		sub	ax, [bx+2]
		add	ax, ax
		adc	cl, cl
		mov	ax, [bx+2]
		cmp	ax, si
		jg	short loc_2D081
		mov	si, ax
		mov	dx, bx

loc_2D081:
		cmp	ax, di
		jl	short loc_2D087
		mov	di, ax

loc_2D087:
		and	ch, cl
		add	bx, 16h
		cmp	bx, [bp+var_12]
		jnz	short loc_2D04B
		or	ch, ch
		jnz	loc_2D53F
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], dx
		mov	[bp+var_68], ds
		mov	[bp+var_24], si
		cmp	di, si
		jnz	loc_2D14C
		mov	bx, [bp+var_1A]

loc_2D0AC:
		mov	si, bx
		mov	ax, [si]

loc_2D0B0:
		cmp	bx, [bp+var_10]
		ja	short loc_2D0B8
		mov	bx, [bp+var_12]

loc_2D0B8:
		sub	bx, 16h
		cmp	bx, [bp+var_1A]
		jz	short loc_2D0C6
		cmp	ax, [bx]
		jle	short loc_2D0B0
		jmp	short loc_2D0AC

loc_2D0C6:
		mov	bx, [bp+var_1C]

loc_2D0C9:
		mov	di, bx
		mov	ax, [di]

loc_2D0CD:
		add	bx, 16h
		cmp	bx, [bp+var_12]
		jb	short loc_2D0D8
		mov	bx, [bp+var_10]

loc_2D0D8:
		cmp	bx, [bp+var_1C]
		jz	short loc_2D0E3
		cmp	ax, [bx]
		jge	short loc_2D0CD
		jmp	short loc_2D0C9

loc_2D0E3:
		mov	dx, [si]
		shl	edx, 10h
		mov	[bp+var_2E], edx
		movzx	edx, word ptr [si+6]
		shl	edx, 8
		mov	[bp+var_36], edx
		movzx	edx, word ptr [si+8]
		shl	edx, 8
		mov	[bp+var_3E], edx
		mov	dx, [di]
		shl	edx, 10h
		mov	[bp+var_32], edx
		movzx	edx, word ptr [di+6]
		shl	edx, 8
		mov	[bp+var_3A], edx
		movzx	edx, word ptr [di+8]
		shl	edx, 8
		mov	[bp+var_42], edx
		xor	eax, eax
		mov	[bp+var_46], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_56], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_52], eax
		mov	[bp+var_5A], eax
		mov	[bp+var_22], ax
		jmp	loc_2D350

loc_2D14C:
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_10]
		ja	short loc_2D15C
		mov	si, [bp+var_12]

loc_2D15C:
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2D172
		cmp	cx, [bp+var_4]
		jle	short loc_2D14C

loc_2D172:
		sub	cx, dx
		jz	short loc_2D14C
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		movzx	edx, word ptr [si+8]
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_56], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_2E], 8000h
		mov	word ptr [bp+var_2E+2], dx
		movzx	edx, word ptr [bx+6]
		shl	edx, 8
		mov	[bp+var_36], edx
		movzx	edx, word ptr [bx+8]
		shl	edx, 8
		mov	[bp+var_3E], edx

loc_2D1FE:
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_12]
		jb	short loc_2D211
		mov	si, [bp+var_10]

loc_2D211:
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		cmp	dx, [bp+var_4]
		jge	short loc_2D224
		cmp	cx, [bp+var_4]
		jle	short loc_2D1FE

loc_2D224:
		sub	cx, dx
		jz	short loc_2D1FE
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4A], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_52], eax
		movzx	edx, word ptr [si+8]
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_5A], eax
		mov	dx, [bx]
		mov	word ptr [bp+var_32], 8000h
		mov	word ptr [bp+var_32+2], dx
		movzx	edx, word ptr [bx+6]
		shl	edx, 8
		mov	[bp+var_3A], edx
		movzx	edx, word ptr [bx+8]
		shl	edx, 8
		mov	[bp+var_42], edx
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_24]
		sub	di, [bp+var_8]
		jg	short loc_2D2BD
		add	ax, di

loc_2D2BD:
		mov	[bp+var_22], ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_24]
		jle	loc_2D350
		sub	[bp+var_22], ax
		mov	cx, [bp+var_4]
		mov	[bp+var_24], cx
		mov	bx, [bp+var_16]
		sub	cx, [bx+2]
		sub	[bp+var_1E], cx
		shl	ecx, 10h
		mov	eax, [bp+var_46]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_2E], eax
		mov	eax, [bp+var_4E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_36], eax
		mov	eax, [bp+var_56]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3E], eax
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_18]
		sub	cx, [bx+2]
		sub	[bp+var_20], cx
		shl	ecx, 10h
		mov	eax, [bp+var_4A]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_32], eax
		mov	eax, [bp+var_52]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_3A], eax
		mov	eax, [bp+var_5A]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_42], eax

loc_2D350:
		mov	ax, [bp+var_24]
		mul	[bp+var_A]
		add	ax, [bp+var_C]
		mov	[bp+var_2A], ax
		mov	ax, 13BAh
		cmp	[bp+arg_E], 0
		jz	short loc_2D372
		lfs	bx, word ptr [bp+arg_E]
		mov	ss:401Ah, bx
		mov	ax, 138Ch

loc_2D372:
		mov	ss:400Ch, ax
		mov	eax, [bp+var_2E]
		mov	ebx, [bp+var_32]
		mov	ecx, [bp+var_36]
		mov	edx, [bp+var_3A]
		mov	esi, [bp+var_3E]
		mov	edi, [bp+var_42]
		mov	ds, [bp+arg_A]

loc_2D391:
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	edi
		cmp	ebx, eax
		jg	short loc_2D3AA
		xchg	ebx, eax
		xchg	edx, ecx
		xchg	edi, esi

loc_2D3AA:
		shr	eax, 10h
		cmp	ax, [bp+var_6]
		jg	loc_2D4FF
		shr	ebx, 10h
		cmp	bx, [bp+var_2]
		jl	loc_2D4FF
		mov	[bp+var_26], ax
		mov	[bp+var_28], bx
		mov	[bp+var_66], ecx
		sub	bx, ax
		jz	loc_2D462
		shl	ebx, 10h
		sub	edx, ecx
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_5E], eax
		shld	edx, eax, 10h
		mov	cx, 1
		or	dx, dx
		jns	short loc_2D3FC
		neg	cx
		cmp	ax, 1
		sbb	dx, 0FFFFh

loc_2D3FC:
		add	cx, dx
		push	cx
		push	dx
		sub	edi, esi
		mov	edx, edi
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ebx
		mov	[bp+var_62], eax
		shld	edx, eax, 10h
		mov	cx, [bp+arg_C]
		or	dx, dx
		jns	short loc_2D42B
		neg	cx
		cmp	ax, 1
		sbb	dx, 0FFFFh

loc_2D42B:
		mov	ax, [bp+arg_C]
		imul	dx
		pop	dx
		pop	bx
		add	dx, ax
		mov	ss:400Eh, dx
		add	dx, cx
		mov	ss:4010h, dx
		add	bx, ax
		mov	ss:4012h, bx
		add	bx, cx
		mov	ss:4014h, bx
		mov	cx, [bp+var_2]
		sub	cx, [bp+var_26]
		jg	loc_2D55F

loc_2D458:
		mov	ax, [bp+var_28]
		sub	ax, [bp+var_6]
		jg	loc_2D588

loc_2D462:
		mov	ecx, esi
		shr	esi, 10h
		mov	ax, si
		mul	[bp+arg_C]
		add	ax, [bp+arg_8]
		add	ax, word ptr [bp+var_66+2]
		mov	si, ax
		mov	ax, [bp+var_26]
		mov	di, [bp+var_2A]
		add	di, ax
		mov	bx, [bp+var_28]
		sub	bx, ax
		push	ebp
		mov	edx, [bp+var_66]
		mov	eax, [bp+var_5E]
		or	eax, eax
		jns	short loc_2D496
		neg	ax
		not	dx

loc_2D496:
		mov	ebp, [bp+var_62]
		or	ebp, ebp
		jns	short loc_2D4A3
		neg	bp
		not	cx

loc_2D4A3:
		inc	bx
		push	bx
		xor	bx, bx
		jmp	word ptr ss:400Ch

loc_2D4AC:
		mov	bl, [si]
		cmp	bl, 0FFh
		jz	short loc_2D4BE
		add	bx, ss:401Ah
		mov	bl, fs:[bx]
		mov	es:[di], bl

loc_2D4BE:
		inc	di
		xor	bx, bx
		add	dx, ax
		adc	bx, bx
		add	cx, bp
		adc	bx, bx
		add	bx, bx
		add	si, ss:[bx+400Eh]
		dec	word ptr [esp]
		jg	short loc_2D4AC
		jmp	short loc_2D4FC
		nop
		nop

loc_2D4DA:
		mov	bl, [si]
		cmp	bl, 0FFh
		jz	short loc_2D4E4
		mov	es:[di], bl

loc_2D4E4:
		inc	di
		xor	bx, bx
		add	dx, ax
		adc	bx, bx
		add	cx, bp
		adc	bx, bx
		add	bx, bx
		add	si, ss:[bx+400Eh]
		dec	word ptr [esp]
		jg	short loc_2D4DA

loc_2D4FC:
		pop	di
		pop	ebp

loc_2D4FF:
		mov	di, [bp+var_A]
		add	[bp+var_2A], di
		pop	edi
		pop	esi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		dec	[bp+var_22]
		js	short loc_2D53F
		jz	short loc_2D544
		dec	[bp+var_1E]
		jz	short loc_2D58E
		add	eax, [bp+var_46]
		add	ecx, [bp+var_4E]
		add	esi, [bp+var_56]

loc_2D529:
		dec	[bp+var_20]
		jz	loc_2D641
		add	ebx, [bp+var_4A]
		add	edx, [bp+var_52]
		add	edi, [bp+var_5A]
		jmp	loc_2D391

loc_2D53F:
		pop	di
		pop	si
		pop	ds
		leave
		retf

loc_2D544:
		add	eax, [bp+var_46]
		add	ecx, [bp+var_4E]
		add	esi, [bp+var_56]
		add	ebx, [bp+var_4A]
		add	edx, [bp+var_52]
		add	edi, [bp+var_5A]
		jmp	loc_2D391

loc_2D55F:
		add	[bp+var_26], cx
		shl	ecx, 10h
		mov	eax, [bp+var_5E]
		imul	ecx
		shrd	eax, edx, 10h
		add	[bp+var_66], eax
		mov	eax, [bp+var_62]
		imul	ecx
		shrd	eax, edx, 10h
		add	esi, eax
		jmp	loc_2D458

loc_2D588:
		sub	[bp+var_28], ax
		jmp	loc_2D462

loc_2D58E:
		push	ebx
		push	edx
		mov	ds, [bp+var_68]
		mov	bx, [bp+var_1A]
		mov	[bp+var_16], bx
		mov	si, bx
		cmp	si, [bp+var_10]
		ja	short loc_2D5A5
		mov	si, [bp+var_12]

loc_2D5A5:
		sub	si, 16h
		mov	[bp+var_1A], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_1E], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_46], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4E], eax
		movzx	edx, word ptr [si+8]
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_56], eax
		mov	ax, [bx]
		shl	eax, 10h
		mov	ah, 80h
		movzx	ecx, word ptr [bx+6]
		shl	ecx, 8
		movzx	esi, word ptr [bx+8]
		shl	esi, 8
		mov	ds, [bp+arg_A]
		pop	edx
		pop	ebx
		jmp	loc_2D529

loc_2D641:
		push	eax
		push	ecx
		push	esi
		mov	ds, [bp+var_68]
		mov	bx, [bp+var_1C]
		mov	[bp+var_18], bx
		mov	si, bx
		add	si, 16h
		cmp	si, [bp+var_12]
		jb	short loc_2D65D
		mov	si, [bp+var_10]

loc_2D65D:
		mov	[bp+var_1C], si
		mov	cx, [si+2]
		mov	dx, [bx+2]
		sub	cx, dx
		cmp	cx, 1
		adc	cx, 0
		mov	[bp+var_20], cx
		shl	ecx, 10h
		mov	dx, [si]
		sub	dx, [bx]
		shl	edx, 10h
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_4A], eax
		movzx	edx, word ptr [si+6]
		movzx	eax, word ptr [bx+6]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_52], eax
		movzx	edx, word ptr [si+8]
		movzx	eax, word ptr [bx+8]
		sub	edx, eax
		shl	edx, 8
		mov	ax, dx
		shl	eax, 10h
		sar	edx, 10h
		idiv	ecx
		mov	[bp+var_5A], eax
		movzx	edx, word ptr [bx+6]
		shl	edx, 8
		movzx	edi, word ptr [bx+8]
		shl	edi, 8
		mov	bx, [bx]
		shl	ebx, 10h
		mov	bh, 80h
		mov	ds, [bp+arg_A]
sub_2CFC2		endp

; START OF FUNCTION CHUNK FOR sub_2CFC2
		db 66h
; END OF FUNCTION CHUNK FOR sub_2CFC2
seg073		ends
