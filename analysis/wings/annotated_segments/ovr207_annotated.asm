ovr207		segment	para public 'OVERLAY' use16
		assume cs:ovr207
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0F0h, 0F0h, 0F0h, 0F1h, 0F1h, 0F1h, 0F2h, 0F2h, 0F2h, 0F3h, 0F3h, 0F3h, 0F4h, 0F4h, 0F4h, 0F5h
		db 0F5h, 0F5h, 0F6h, 0F6h, 0F6h, 0F7h, 0F7h, 0F7h, 0F8h, 0F8h, 0F8h, 0F9h, 0F9h, 0F9h, 0FAh, 0F9h
		db 0FAh, 0FCh, 0FAh, 0FCh, 0FBh, 0FDh, 0FDh, 0FCh, 0FDh, 0FEh, 0FCh, 0FEh, 0FEh, 0FDh, 7Fh, 0FEh
		db 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F1h, 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h, 0F5h
		db 0F6h, 0F5h, 0F6h, 0F7h, 0F6h, 0F7h, 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh, 0FBh
		db 0FAh, 0FBh, 0FCh, 0FBh, 0FDh, 0FCh, 0FBh, 0FDh, 0FEh, 0FDh, 0FEh, 0FDh, 0FEh, 7Fh, 0FEh, 7Fh
		db 0F1h, 0F1h, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F2h, 0F3h, 0F3h, 0F2h, 0F4h, 0F3h, 0F3h, 0F4h, 0F4h
		db 0F6h, 0F5h, 0F5h, 0F5h, 0F7h, 0F6h, 0F7h, 0F9h, 0F8h, 0F8h, 0F9h, 0F9h, 0F9h, 0FAh, 0FBh, 0FAh
		db 0FBh, 0FAh, 0FBh, 0FBh, 0FCh, 0FCh, 0FCh, 0FDh, 0FCh, 0FDh, 0FEh, 0FDh, 0FDh, 0FEh, 0FEh, 7Fh
		db 0F0h, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F1h, 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h
		db 0F5h, 0F6h, 0F5h, 0F6h, 0F7h, 0F6h, 0F7h, 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh
		db 0FAh, 0FBh, 0FBh, 0FCh, 0FDh, 0FBh, 0FDh, 0FCh, 0FDh, 0FEh, 0FDh, 0FEh, 7Fh, 0FEh, 7Fh, 7Fh
		db 0, 0, 30h, 0, 60h, 0, 90h, 0

; ----------------------------------------------------------------------

sub_74B08		proc near
		push	si
		push	di
		cmp	cx, word_5CCD8
		jg	short loc_74B87
		cmp	dx, word_5CCD4
		jl	short loc_74B87
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C0h]
		shl	bx, 1
		add	bx, word_5CCD2
		mov	di, ss:[bx]
		mov	bx, cx
		mov	cx, 30h
		or	ax, ax
		jz	short loc_74B5F
		add	si, 2Fh
		mov	ax, word_5CCD4
		sub	ax, bx
		js	short loc_74B44
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_74B44:
		mov	ax, dx
		sub	ax, word_5CCD8
		jle	short loc_74B50
		sub	cx, ax
		sub	dx, ax

loc_74B50:
		add	di, bx
		or	cx, cx
		jle	short loc_74B87

loc_74B56:
		mov	al, cs:[si]
		dec	si
		stosb
		loop	short loc_74B56
		jmp	short loc_74B87

loc_74B5F:
		mov	ax, word_5CCD4
		sub	ax, bx
		js	short loc_74B6C
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_74B6C:
		mov	ax, dx
		sub	ax, word_5CCD8
		jle	short loc_74B78
		sub	cx, ax
		sub	dx, ax

loc_74B78:
		add	di, bx
		or	cx, cx
		jle	short loc_74B87
		nop
		nop

loc_74B80:
		mov	al, cs:[si]
		inc	si
		stosb
		loop	short loc_74B80

loc_74B87:
		pop	di
		pop	si
		ret
sub_74B08		endp

; ----------------------------------------------------------------------

sub_74B8A		proc near
		push	si
		push	di
		cmp	cx, word_5CCDA
		jg	loc_74C25
		cmp	dx, word_5CCD6
		jl	loc_74C25
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C0h]
		mov	di, bx
		mov	bx, cx
		mov	dx, dx
		mov	cx, 30h
		or	ax, ax
		jz	short loc_74BF0
		add	si, 2Fh
		mov	ax, word_5CCD6
		sub	ax, bx
		js	short loc_74BC5
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_74BC5:
		mov	ax, dx
		sub	ax, word_5CCDA
		jle	short loc_74BD1
		sub	cx, ax
		sub	dx, ax

loc_74BD1:
		shl	bx, 1
		add	bx, word_5CCD2
		add	di, ss:[bx]
		mov	dx, word_5CCDC
		or	cx, cx
		jle	short loc_74C25

loc_74BE2:
		mov	al, cs:[si]
		dec	si
		mov	es:[di], al
		add	di, dx
		loop	short loc_74BE2
		jmp	short loc_74C25
		nop

loc_74BF0:
		mov	ax, word_5CCD6
		sub	ax, bx
		js	short loc_74BFD
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_74BFD:
		mov	ax, dx
		sub	ax, word_5CCDA
		jle	short loc_74C09
		sub	cx, ax
		sub	dx, ax

loc_74C09:
		shl	bx, 1
		add	bx, word_5CCD2
		add	di, ss:[bx]
		mov	dx, word_5CCDC
		or	cx, cx
		jle	short loc_74C25

loc_74C1A:
		mov	al, cs:[si]
		inc	si
		mov	es:[di], al
		add	di, dx
		loop	short loc_74C1A

loc_74C25:
		pop	di
		pop	si
		ret
sub_74B8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74C28		proc far

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
		mov	di, 2FB0h
		mov	cx, 3
		rep movsd
		mov	si, word_5CCD2
		mov	bx, word_5CCD6
		shl	bx, 1
		mov	ax, [bx+si+2]
		sub	ax, [bx+si]
		mov	word_5CCDC, ax
		mov	di, [bx+si]
		add	di, word_5CCD4
		mov	[bp+var_2E], di
		mov	ax, word_5CCD8
		sub	ax, word_5CCD4
		inc	ax
		mov	[bp+var_30], ax
		mov	ax, word_5CCDA
		sub	ax, word_5CCD6
		inc	ax
		mov	[bp+var_32], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwde
		mov	[bp+var_8], eax
		jge	short loc_74C7D
		neg	ax

loc_74C7D:
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		cwde
		mov	[bp+var_C], eax
		jge	short loc_74C90
		neg	ax

loc_74C90:
		mov	word ptr [bp+var_5+1], ax
		mov	ax, [bp+var_2]
		or	ax, word ptr [bp+var_5+1]
		jnz	short loc_74C9E
		jmp	loc_74E8F

loc_74C9E:
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_74CD5
		movzx	ebx, word_5CCDC
		shl	ebx, 8
		mov	ax, [bp+arg_4]
		sub	ax, word_5CCD6
		cwde
		imul	ebx
		test	word ptr [bp+var_8], 0FFFFh
		js	short loc_74CC7
		neg	ebx
		neg	eax

loc_74CC7:
		neg	eax
		mov	[bp+var_20], ebx
		mov	[bp+var_24], eax
		jmp	short loc_74D0D
		nop

loc_74CD5:
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
		sub	ax, word_5CCD6
		cwde
		imul	[bp+var_20]
		sub	ecx, eax
		mov	[bp+var_24], ecx

loc_74D0D:
		mov	al, byte_5CCE0
		mov	ah, al
		mov	dl, byte_5CCDE
		mov	dh, dl
		test	word ptr [bp+var_C], 0FFFFh
		js	short loc_74D20
		xchg	dx, ax

loc_74D20:
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	es, word_5CCD0
		mov	di, [bp+var_2E]
		mov	si, [bp+var_32]
		mov	edx, [bp+var_24]

loc_74D34:
		push	di
		mov	bx, [bp+var_30]
		mov	eax, edx
		sar	eax, 8
		movzx	ecx, word_5CCD4
		sub	eax, ecx
		jl	short loc_74D60
		mov	cx, bx
		cmp	eax, ecx
		jg	short loc_74D53
		mov	cx, ax

loc_74D53:
		sub	bx, cx
		mov	ax, [bp+var_26]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_74D60:
		or	bx, bx
		jle	short loc_74D71
		mov	cx, bx
		mov	ax, [bp+var_28]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_74D71:
		pop	di
		add	di, word_5CCDC
		add	edx, [bp+var_20]
		dec	si
		jnz	short loc_74D34
		mov	es, word_5CCD0
		mov	ax, word ptr [bp+var_5+1]
		cmp	[bp+var_2], ax
		jl	short loc_74D8C
		jmp	loc_74E0E

loc_74D8C:
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		idiv	[bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_4]
		sub	ax, word_5CCD6
		imul	word ptr [bp+var_8]
		idiv	word ptr [bp+var_C]
		cwde
		movsx	edx, [bp+arg_2]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_5CCD6
		jmp	short loc_74E05
		nop

loc_74DC4:
		mov	edi, [bp+var_14]
		sar	edi, 8
		test	[bp+var_9], 80h
		jnz	short loc_74DEA
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_74B08
		jmp	short loc_74DFC
		nop

loc_74DEA:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_74B08

loc_74DFC:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_74E05:
		cmp	si, word_5CCDA
		jle	short loc_74DC4
		jmp	loc_74E8F

loc_74E0E:
		mov	eax, [bp+var_C]
		shl	eax, 8
		cdq
		idiv	[bp+var_8]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_2]
		sub	ax, word_5CCD4
		imul	word ptr [bp+var_C]
		idiv	word ptr [bp+var_8]
		cwde
		movsx	edx, [bp+arg_4]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_5CCD4
		jmp	short loc_74E87
		nop

loc_74E46:
		mov	edi, [bp+var_14]
		shr	edi, 8
		test	[bp+var_5], 80h
		jnz	short loc_74E6C
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_74B8A
		jmp	short loc_74E7E
		nop

loc_74E6C:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_74B8A

loc_74E7E:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_74E87:
		cmp	word_5CCD8, si
		jl	short loc_74E8F
		jmp	short loc_74E46

loc_74E8F:
		pop	di
		pop	si
		leave
		retf
sub_74C28		endp
ovr207		ends
