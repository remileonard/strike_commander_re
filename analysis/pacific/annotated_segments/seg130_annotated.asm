seg130		segment	para public 'CODE' use16
		assume cs:seg130
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 89h, 44h, 8, 8Bh, 0C6h, 5Fh, 5Eh, 0C9h, 0CBh, 0, 0F0h, 0F0h, 0F0h, 0F1h, 0F1h, 0F1h
		db 0F2h, 0F2h, 0F2h, 0F3h, 0F3h, 0F3h, 0F4h, 0F4h, 0F4h, 0F5h, 0F5h, 0F5h, 0F6h, 0F6h, 0F6h, 0F7h
		db 0F7h, 0F7h, 0F8h, 0F8h, 0F8h, 0F9h, 0F9h, 0F9h, 0FAh, 0F9h, 0FAh, 0FCh, 0FAh, 0FCh, 0FBh, 0FDh
		db 0FDh, 0FCh, 0FDh, 0FEh, 0FCh, 0FEh, 0FEh, 0FDh, 0FFh, 0FEh, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F1h
		db 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h, 0F5h, 0F6h, 0F5h, 0F6h, 0F7h, 0F6h, 0F7h
		db 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh, 0FBh, 0FAh, 0FBh, 0FCh, 0FBh, 0FDh, 0FCh
		db 0FBh, 0FDh, 0FEh, 0FDh, 0FEh, 0FDh, 0FEh, 0FFh, 0FEh, 0FFh, 0F1h, 0F1h, 0F0h, 0F1h, 0F0h, 0F1h
		db 0F2h, 0F2h, 0F3h, 0F3h, 0F2h, 0F4h, 0F3h, 0F3h, 0F4h, 0F4h, 0F6h, 0F5h, 0F5h, 0F5h, 0F7h, 0F6h
		db 0F7h, 0F9h, 0F8h, 0F8h, 0F9h, 0F9h, 0F9h, 0FAh, 0FBh, 0FAh, 0FBh, 0FAh, 0FBh, 0FBh, 0FCh, 0FCh
		db 0FCh, 0FDh, 0FCh, 0FDh, 0FEh, 0FDh, 0FDh, 0FEh, 0FEh, 0FFh, 0F0h, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h
		db 0F1h, 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h, 0F5h, 0F6h, 0F5h, 0F6h, 0F7h, 0F6h
		db 0F7h, 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh, 0FAh, 0FBh, 0FBh, 0FCh, 0FDh, 0FBh
		db 0FDh, 0FCh, 0FDh, 0FEh, 0FDh, 0FEh, 0FFh, 0FEh, 0FFh, 0FFh, 0Ah, 0, 3Ah, 0, 6Ah, 0
		db 9Ah, 0

; ----------------------------------------------------------------------

sub_5A7B2		proc near
		push	si
		push	di
		cmp	cx, word_79D34
		jg	short loc_5A831
		cmp	dx, word_79D30
		jl	short loc_5A831
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0CAh]
		shl	bx, 1
		add	bx, word_79D2E
		mov	di, ss:[bx]
		mov	bx, cx
		mov	cx, 30h
		or	ax, ax
		jz	short loc_5A809
		add	si, 2Fh
		mov	ax, word_79D30
		sub	ax, bx
		js	short loc_5A7EE
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_5A7EE:
		mov	ax, dx
		sub	ax, word_79D34
		jle	short loc_5A7FA
		sub	cx, ax
		sub	dx, ax

loc_5A7FA:
		add	di, bx
		or	cx, cx
		jle	short loc_5A831

loc_5A800:
		mov	al, cs:[si]
		dec	si
		stosb
		loop	short loc_5A800
		jmp	short loc_5A831

loc_5A809:
		mov	ax, word_79D30
		sub	ax, bx
		js	short loc_5A816
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_5A816:
		mov	ax, dx
		sub	ax, word_79D34
		jle	short loc_5A822
		sub	cx, ax
		sub	dx, ax

loc_5A822:
		add	di, bx
		or	cx, cx
		jle	short loc_5A831
		nop
		nop

loc_5A82A:
		mov	al, cs:[si]
		inc	si
		stosb
		loop	short loc_5A82A

loc_5A831:
		pop	di
		pop	si
		ret
sub_5A7B2		endp

; ----------------------------------------------------------------------

sub_5A834		proc near
		push	si
		push	di
		cmp	cx, word_79D36
		jg	loc_5A8CF
		cmp	dx, word_79D32
		jl	loc_5A8CF
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0CAh]
		mov	di, bx
		mov	bx, cx
		mov	dx, dx
		mov	cx, 30h
		or	ax, ax
		jz	short loc_5A89A
		add	si, 2Fh
		mov	ax, word_79D32
		sub	ax, bx
		js	short loc_5A86F
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_5A86F:
		mov	ax, dx
		sub	ax, word_79D36
		jle	short loc_5A87B
		sub	cx, ax
		sub	dx, ax

loc_5A87B:
		shl	bx, 1
		add	bx, word_79D2E
		add	di, ss:[bx]
		mov	dx, word_79D38
		or	cx, cx
		jle	short loc_5A8CF

loc_5A88C:
		mov	al, cs:[si]
		dec	si
		mov	es:[di], al
		add	di, dx
		loop	short loc_5A88C
		jmp	short loc_5A8CF
		nop

loc_5A89A:
		mov	ax, word_79D32
		sub	ax, bx
		js	short loc_5A8A7
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_5A8A7:
		mov	ax, dx
		sub	ax, word_79D36
		jle	short loc_5A8B3
		sub	cx, ax
		sub	dx, ax

loc_5A8B3:
		shl	bx, 1
		add	bx, word_79D2E
		add	di, ss:[bx]
		mov	dx, word_79D38
		or	cx, cx
		jle	short loc_5A8CF

loc_5A8C4:
		mov	al, cs:[si]
		inc	si
		mov	es:[di], al
		add	di, dx
		loop	short loc_5A8C4

loc_5A8CF:
		pop	di
		pop	si
		ret
sub_5A834		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A8D2		proc far

var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_9		= dword ptr -9
var_8		= dword ptr -8
var_5		= dword ptr -5
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	32h, 0
		push	si
		push	di
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		mov	di, 35FCh
		mov	cx, 3
		rep movsd
		mov	si, word_79D2E
		mov	bx, word_79D32
		shl	bx, 1
		mov	ax, [bx+si+2]
		sub	ax, [bx+si]
		mov	word_79D38, ax
		mov	di, [bx+si]
		add	di, word_79D30
		mov	[bp+var_2E], di
		mov	ax, word_79D34
		sub	ax, word_79D30
		inc	ax
		mov	[bp+var_30], ax
		mov	ax, word_79D36
		sub	ax, word_79D32
		inc	ax
		mov	[bp+var_32], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwde
		mov	[bp+var_8], eax
		jge	short loc_5A927
		neg	ax

loc_5A927:
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		cwde
		mov	[bp+var_C], eax
		jge	short loc_5A93A
		neg	ax

loc_5A93A:
		mov	word ptr [bp+var_5+1], ax
		mov	ax, [bp+var_2]
		or	ax, word ptr [bp+var_5+1]
		jnz	short loc_5A948
		jmp	loc_5AB39

loc_5A948:
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_5A97F
		movzx	ebx, word_79D38
		shl	ebx, 8
		mov	ax, [bp+arg_4]
		sub	ax, word_79D32
		cwde
		imul	ebx
		test	word ptr [bp+var_8], 0FFFFh
		js	short loc_5A971
		neg	ebx
		neg	eax

loc_5A971:
		neg	eax
		mov	[bp+var_20], ebx
		mov	[bp+var_24], eax
		jmp	short loc_5A9B7
		nop

loc_5A97F:
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		mov	ebx, [bp+var_C]
		neg	ebx
		idiv	ebx
		mov	[bp+var_20], eax
		mov	ax, [bp+arg_2]
		cwde
		shl	eax, 8
		mov	ecx, eax
		mov	ax, [bp+arg_4]
		sub	ax, word_79D32
		cwde
		imul	[bp+var_20]
		sub	ecx, eax
		mov	[bp+var_24], ecx

loc_5A9B7:
		mov	al, byte_79D3C
		mov	ah, al
		mov	dl, byte_79D3A
		mov	dh, dl
		test	word ptr [bp+var_C], 0FFFFh
		js	short loc_5A9CA
		xchg	dx, ax

loc_5A9CA:
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	es, word_79D2C
		mov	di, [bp+var_2E]
		mov	si, [bp+var_32]
		mov	edx, [bp+var_24]

loc_5A9DE:
		push	di
		mov	bx, [bp+var_30]
		mov	eax, edx
		sar	eax, 8
		movzx	ecx, word_79D30
		sub	eax, ecx
		jl	short loc_5AA0A
		mov	cx, bx
		cmp	eax, ecx
		jg	short loc_5A9FD
		mov	cx, ax

loc_5A9FD:
		sub	bx, cx
		mov	ax, [bp+var_26]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_5AA0A:
		or	bx, bx
		jle	short loc_5AA1B
		mov	cx, bx
		mov	ax, [bp+var_28]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_5AA1B:
		pop	di
		add	di, word_79D38
		add	edx, [bp+var_20]
		dec	si
		jnz	short loc_5A9DE
		mov	es, word_79D2C
		mov	ax, word ptr [bp+var_5+1]
		cmp	[bp+var_2], ax
		jl	short loc_5AA36
		jmp	loc_5AAB8

loc_5AA36:
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		idiv	[bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_4]
		sub	ax, word_79D32
		imul	word ptr [bp+var_8]
		idiv	word ptr [bp+var_C]
		cwde
		movsx	edx, [bp+arg_2]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_79D32
		jmp	short loc_5AAAF
		nop

loc_5AA6E:
		mov	edi, [bp+var_14]
		sar	edi, 8
		test	[bp+var_9], 80h
		jnz	short loc_5AA94
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_5A7B2
		jmp	short loc_5AAA6
		nop

loc_5AA94:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_5A7B2

loc_5AAA6:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_5AAAF:
		cmp	si, word_79D36
		jle	short loc_5AA6E
		jmp	loc_5AB39

loc_5AAB8:
		mov	eax, [bp+var_C]
		shl	eax, 8
		cdq
		idiv	[bp+var_8]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_2]
		sub	ax, word_79D30
		imul	word ptr [bp+var_C]
		idiv	word ptr [bp+var_8]
		cwde
		movsx	edx, [bp+arg_4]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_79D30
		jmp	short loc_5AB31
		nop

loc_5AAF0:
		mov	edi, [bp+var_14]
		shr	edi, 8
		test	[bp+var_5], 80h
		jnz	short loc_5AB16
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_5A834
		jmp	short loc_5AB28
		nop

loc_5AB16:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_5A834

loc_5AB28:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_5AB31:
		cmp	word_79D34, si
		jl	short loc_5AB39
		jmp	short loc_5AAF0

loc_5AB39:
		pop	di
		pop	si
		leave
		retf
sub_5A8D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5AB3D		proc far

var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_9		= dword ptr -9
var_8		= dword ptr -8
var_5		= dword ptr -5
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	32h, 0
		push	si
		push	di
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		mov	di, 35FCh
		mov	cx, 3
		rep movsd
		mov	si, word_79D2E
		mov	bx, word_79D32
		shl	bx, 1
		mov	ax, [bx+si+2]
		sub	ax, [bx+si]
		mov	word_79D38, ax
		mov	di, [bx+si]
		add	di, word_79D30
		mov	[bp+var_2E], di
		mov	ax, word_79D34
		sub	ax, word_79D30
		inc	ax
		mov	[bp+var_30], ax
		mov	ax, word_79D36
		sub	ax, word_79D32
		inc	ax
		mov	[bp+var_32], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwde
		mov	[bp+var_8], eax
		jge	short loc_5AB92
		neg	ax

loc_5AB92:
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		cwde
		mov	[bp+var_C], eax
		jge	short loc_5ABA5
		neg	ax

loc_5ABA5:
		mov	word ptr [bp+var_5+1], ax
		mov	ax, [bp+var_2]
		or	ax, word ptr [bp+var_5+1]
		jnz	short loc_5ABB3
		jmp	loc_5ADA4

loc_5ABB3:
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_5ABEA
		movzx	ebx, word_79D38
		shl	ebx, 8
		mov	ax, [bp+arg_4]
		sub	ax, word_79D32
		cwde
		imul	ebx
		test	word ptr [bp+var_8], 0FFFFh
		js	short loc_5ABDC
		neg	ebx
		neg	eax

loc_5ABDC:
		neg	eax
		mov	[bp+var_20], ebx
		mov	[bp+var_24], eax
		jmp	short loc_5AC22
		nop

loc_5ABEA:
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		mov	ebx, [bp+var_C]
		neg	ebx
		idiv	ebx
		mov	[bp+var_20], eax
		mov	ax, [bp+arg_2]
		cwde
		shl	eax, 8
		mov	ecx, eax
		mov	ax, [bp+arg_4]
		sub	ax, word_79D32
		cwde
		imul	[bp+var_20]
		sub	ecx, eax
		mov	[bp+var_24], ecx

loc_5AC22:
		mov	al, byte_79D3C
		mov	ah, al
		mov	dl, byte_79D3A
		mov	dh, dl
		test	word ptr [bp+var_C], 0FFFFh
		js	short loc_5AC35
		xchg	dx, ax

loc_5AC35:
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	es, word_79D2C
		mov	di, [bp+var_2E]
		mov	si, [bp+var_32]
		mov	edx, [bp+var_24]

loc_5AC49:
		push	di
		mov	bx, [bp+var_30]
		mov	eax, edx
		sar	eax, 8
		movzx	ecx, word_79D30
		sub	eax, ecx
		jl	short loc_5AC75
		mov	cx, bx
		cmp	eax, ecx
		jg	short loc_5AC68
		mov	cx, ax

loc_5AC68:
		sub	bx, cx
		mov	ax, [bp+var_26]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_5AC75:
		or	bx, bx
		jle	short loc_5AC86
		mov	cx, bx
		mov	ax, [bp+var_28]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_5AC86:
		pop	di
		add	di, word_79D38
		add	edx, [bp+var_20]
		dec	si
		jnz	short loc_5AC49
		mov	es, word_79D2C
		mov	ax, word ptr [bp+var_5+1]
		cmp	[bp+var_2], ax
		jl	short loc_5ACA1
		jmp	loc_5AD23

loc_5ACA1:
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		idiv	[bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_4]
		sub	ax, word_79D32
		imul	word ptr [bp+var_8]
		idiv	word ptr [bp+var_C]
		cwde
		movsx	edx, [bp+arg_2]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_79D32
		jmp	short loc_5AD1A
		nop

loc_5ACD9:
		mov	edi, [bp+var_14]
		sar	edi, 8
		test	[bp+var_9], 80h
		jnz	short loc_5ACFF
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_5A7B2
		jmp	short loc_5AD11
		nop

loc_5ACFF:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_5A7B2

loc_5AD11:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_5AD1A:
		cmp	si, word_79D36
		jle	short loc_5ACD9
		jmp	loc_5ADA4

loc_5AD23:
		mov	eax, [bp+var_C]
		shl	eax, 8
		cdq
		idiv	[bp+var_8]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_2]
		sub	ax, word_79D30
		imul	word ptr [bp+var_C]
		idiv	word ptr [bp+var_8]
		cwde
		movsx	edx, [bp+arg_4]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_79D30
		jmp	short loc_5AD9C
		nop
		mov	edi, [bp+var_14]
		shr	edi, 8
		test	[bp+var_5], 80h
		jnz	short loc_5AD81
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_5A834
		jmp	short loc_5AD93
		nop

loc_5AD81:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_5A834

loc_5AD93:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_5AD9C:
		cmp	word_79D34, si
sub_5AB3D		endp
seg130		ends
