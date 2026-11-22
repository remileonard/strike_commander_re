ovr230		segment	para public 'OVERLAY' use16
		assume cs:ovr230
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0F0h, 0F0h, 0F0h, 0F1h, 0F1h, 0F1h, 0F2h, 0F2h, 0F2h, 0F3h, 0F3h, 0F3h, 0F4h, 0F4h, 0F4h, 0F5h
		db 0F5h, 0F5h, 0F6h, 0F6h, 0F6h, 0F7h, 0F7h, 0F7h, 0F8h, 0F8h, 0F8h, 0F9h, 0F9h, 0F9h, 0FAh, 0F9h
		db 0FAh, 0FCh, 0FAh, 0FCh, 0FBh, 0FDh, 0FDh, 0FCh, 0FDh, 0FEh, 0FCh, 0FEh, 0FEh, 0FDh, 0FFh, 0FEh
		db 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F1h, 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h, 0F5h
		db 0F6h, 0F5h, 0F6h, 0F7h, 0F6h, 0F7h, 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh, 0FBh
		db 0FAh, 0FBh, 0FCh, 0FBh, 0FDh, 0FCh, 0FBh, 0FDh, 0FEh, 0FDh, 0FEh, 0FDh, 0FEh, 0FFh, 0FEh, 0FFh
		db 0F1h, 0F1h, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F2h, 0F3h, 0F3h, 0F2h, 0F4h, 0F3h, 0F3h, 0F4h, 0F4h
		db 0F6h, 0F5h, 0F5h, 0F5h, 0F7h, 0F6h, 0F7h, 0F9h, 0F8h, 0F8h, 0F9h, 0F9h, 0F9h, 0FAh, 0FBh, 0FAh
		db 0FBh, 0FAh, 0FBh, 0FBh, 0FCh, 0FCh, 0FCh, 0FDh, 0FCh, 0FDh, 0FEh, 0FDh, 0FDh, 0FEh, 0FEh, 0FFh
		db 0F0h, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F1h, 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h
		db 0F5h, 0F6h, 0F5h, 0F6h, 0F7h, 0F6h, 0F7h, 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh
		db 0FAh, 0FBh, 0FBh, 0FCh, 0FDh, 0FBh, 0FDh, 0FCh, 0FDh, 0FEh, 0FDh, 0FEh, 0FFh, 0FEh, 0FFh, 0FFh
		db 0, 0, 30h, 0, 60h, 0, 90h, 0

; ----------------------------------------------------------------------

sub_BBE98		proc near
		push	si
		push	di
		cmp	cx, word_4C8EE
		jg	short loc_BBF17
		cmp	dx, word_4C8EA
		jl	short loc_BBF17
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C0h]
		shl	bx, 1
		add	bx, word_4C8E8
		mov	di, ss:[bx]
		mov	bx, cx
		mov	cx, 30h
		or	ax, ax
		jz	short loc_BBEEF
		add	si, 2Fh
		mov	ax, word_4C8EA
		sub	ax, bx
		js	short loc_BBED4
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_BBED4:
		mov	ax, dx
		sub	ax, word_4C8EE
		jle	short loc_BBEE0
		sub	cx, ax
		sub	dx, ax

loc_BBEE0:
		add	di, bx
		or	cx, cx
		jle	short loc_BBF17

loc_BBEE6:
		mov	al, cs:[si]
		dec	si
		stosb
		loop	short loc_BBEE6
		jmp	short loc_BBF17

loc_BBEEF:
		mov	ax, word_4C8EA
		sub	ax, bx
		js	short loc_BBEFC
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_BBEFC:
		mov	ax, dx
		sub	ax, word_4C8EE
		jle	short loc_BBF08
		sub	cx, ax
		sub	dx, ax

loc_BBF08:
		add	di, bx
		or	cx, cx
		jle	short loc_BBF17
		nop
		nop

loc_BBF10:
		mov	al, cs:[si]
		inc	si
		stosb
		loop	short loc_BBF10

loc_BBF17:
		pop	di
		pop	si
		ret
sub_BBE98		endp

; ----------------------------------------------------------------------

sub_BBF1A		proc near
		push	si
		push	di
		cmp	cx, word_4C8F0
		jg	loc_BBFB5
		cmp	dx, word_4C8EC
		jl	loc_BBFB5
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C0h]
		mov	di, bx
		mov	bx, cx
		mov	dx, dx
		mov	cx, 30h
		or	ax, ax
		jz	short loc_BBF80
		add	si, 2Fh
		mov	ax, word_4C8EC
		sub	ax, bx
		js	short loc_BBF55
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_BBF55:
		mov	ax, dx
		sub	ax, word_4C8F0
		jle	short loc_BBF61
		sub	cx, ax
		sub	dx, ax

loc_BBF61:
		shl	bx, 1
		add	bx, word_4C8E8
		add	di, ss:[bx]
		mov	dx, word_4C8F2
		or	cx, cx
		jle	short loc_BBFB5

loc_BBF72:
		mov	al, cs:[si]
		dec	si
		mov	es:[di], al
		add	di, dx
		loop	short loc_BBF72
		jmp	short loc_BBFB5
		nop

loc_BBF80:
		mov	ax, word_4C8EC
		sub	ax, bx
		js	short loc_BBF8D
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_BBF8D:
		mov	ax, dx
		sub	ax, word_4C8F0
		jle	short loc_BBF99
		sub	cx, ax
		sub	dx, ax

loc_BBF99:
		shl	bx, 1
		add	bx, word_4C8E8
		add	di, ss:[bx]
		mov	dx, word_4C8F2
		or	cx, cx
		jle	short loc_BBFB5

loc_BBFAA:
		mov	al, cs:[si]
		inc	si
		mov	es:[di], al
		add	di, dx
		loop	short loc_BBFAA

loc_BBFB5:
		pop	di
		pop	si
		ret
sub_BBF1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBFB8		proc far

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
		mov	di, 3F06h
		mov	cx, 3
		rep movsd
		mov	si, word_4C8E8
		mov	bx, word_4C8EC
		shl	bx, 1
		mov	ax, [bx+si+2]
		sub	ax, [bx+si]
		mov	word_4C8F2, ax
		mov	di, [bx+si]
		add	di, word_4C8EA
		mov	[bp+var_2E], di
		mov	ax, word_4C8EE
		sub	ax, word_4C8EA
		inc	ax
		mov	[bp+var_30], ax
		mov	ax, word_4C8F0
		sub	ax, word_4C8EC
		inc	ax
		mov	[bp+var_32], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwde
		mov	[bp+var_8], eax
		jge	short loc_BC00D
		neg	ax

loc_BC00D:
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		cwde
		mov	[bp+var_C], eax
		jge	short loc_BC020
		neg	ax

loc_BC020:
		mov	word ptr [bp+var_5+1], ax
		mov	ax, [bp+var_2]
		or	ax, word ptr [bp+var_5+1]
		jnz	short loc_BC02E
		jmp	loc_BC21F

loc_BC02E:
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_BC065
		movzx	ebx, word_4C8F2
		shl	ebx, 8
		mov	ax, [bp+arg_4]
		sub	ax, word_4C8EC
		cwde
		imul	ebx
		test	word ptr [bp+var_8], 0FFFFh
		js	short loc_BC057
		neg	ebx
		neg	eax

loc_BC057:
		neg	eax
		mov	[bp+var_20], ebx
		mov	[bp+var_24], eax
		jmp	short loc_BC09D
		nop

loc_BC065:
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
		sub	ax, word_4C8EC
		cwde
		imul	[bp+var_20]
		sub	ecx, eax
		mov	[bp+var_24], ecx

loc_BC09D:
		mov	al, byte_4C8F6
		mov	ah, al
		mov	dl, byte_4C8F4
		mov	dh, dl
		test	word ptr [bp+var_C], 0FFFFh
		js	short loc_BC0B0
		xchg	dx, ax

loc_BC0B0:
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	es, word_4C8E6
		mov	di, [bp+var_2E]
		mov	si, [bp+var_32]
		mov	edx, [bp+var_24]

loc_BC0C4:
		push	di
		mov	bx, [bp+var_30]
		mov	eax, edx
		sar	eax, 8
		movzx	ecx, word_4C8EA
		sub	eax, ecx
		jl	short loc_BC0F0
		mov	cx, bx
		cmp	eax, ecx
		jg	short loc_BC0E3
		mov	cx, ax

loc_BC0E3:
		sub	bx, cx
		mov	ax, [bp+var_26]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_BC0F0:
		or	bx, bx
		jle	short loc_BC101
		mov	cx, bx
		mov	ax, [bp+var_28]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_BC101:
		pop	di
		add	di, word_4C8F2
		add	edx, [bp+var_20]
		dec	si
		jnz	short loc_BC0C4
		mov	es, word_4C8E6
		mov	ax, word ptr [bp+var_5+1]
		cmp	[bp+var_2], ax
		jl	short loc_BC11C
		jmp	loc_BC19E

loc_BC11C:
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		idiv	[bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_4]
		sub	ax, word_4C8EC
		imul	word ptr [bp+var_8]
		idiv	word ptr [bp+var_C]
		cwde
		movsx	edx, [bp+arg_2]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_4C8EC
		jmp	short loc_BC195
		nop

loc_BC154:
		mov	edi, [bp+var_14]
		sar	edi, 8
		test	[bp+var_9], 80h
		jnz	short loc_BC17A
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_BBE98
		jmp	short loc_BC18C
		nop

loc_BC17A:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_BBE98

loc_BC18C:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_BC195:
		cmp	si, word_4C8F0
		jle	short loc_BC154
		jmp	loc_BC21F

loc_BC19E:
		mov	eax, [bp+var_C]
		shl	eax, 8
		cdq
		idiv	[bp+var_8]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_2]
		sub	ax, word_4C8EA
		imul	word ptr [bp+var_C]
		idiv	word ptr [bp+var_8]
		cwde
		movsx	edx, [bp+arg_4]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_4C8EA
		jmp	short loc_BC217
		nop

loc_BC1D6:
		mov	edi, [bp+var_14]
		shr	edi, 8
		test	[bp+var_5], 80h
		jnz	short loc_BC1FC
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_BBF1A
		jmp	short loc_BC20E
		nop

loc_BC1FC:
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_BBF1A

loc_BC20E:
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_BC217:
		cmp	word_4C8EE, si
		jl	short loc_BC21F
		jmp	short loc_BC1D6

loc_BC21F:
		pop	di
		pop	si
		leave
		retf
sub_BBFB8		endp
ovr230		ends
