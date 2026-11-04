seg047		segment	para public 'CODE' use16
		assume cs:seg047
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 57h, 4, 2Bh, 0D1h, 42h, 89h, 57h, 6

loc_1D3F8:
		db 0C3h, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D3FA		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4

		enter	8, 0
		push	ax
		push	dx
		les	si, word_4C0A6
		add	si, ax
		mov	ax, word_4C0AA
		mul	bx
		add	si, ax
		pop	dx
		sub	dx, bx
		mov	bx, dx
		mov	dx, word_4C0AA
		jns	short loc_1D41C
		neg	dx
		neg	bx

loc_1D41C:
		inc	bx
		pop	ax
		sub	cx, ax
		mov	ax, cx
		mov	cx, 1
		jns	short loc_1D42B
		neg	cx
		neg	ax

loc_1D42B:
		inc	ax
		cmp	ax, bx
		jle	short loc_1D433
		xchg	bx, ax
		xchg	dx, cx

loc_1D433:
		mov	[bp+var_4], bx
		mov	[bp+var_6], cx
		mov	[bp+var_8], dx
		mov	cx, bx
		mov	dx, bx
		mov	bx, ax
		push	di
		and	cx, 0FFh
		or	cx, cx
		jz	short loc_1D463

loc_1D44B:
		mov	al, es:[si]
		mov	[di], al
		inc	di
		dec	cx
		jz	short loc_1D463
		add	si, [bp+var_8]
		sub	dx, bx
		jg	short loc_1D44B
		add	dx, [bp+var_4]
		add	si, [bp+var_6]
		jmp	short loc_1D44B

loc_1D463:
		pop	bx
		sub	di, bx
		leave
		ret
sub_1D3FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D468		proc far

var_162		= word ptr -162h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_1E		= word ptr -1Eh

		enter	162h, 0
		push	si
		push	di
		mov	ax, word_4C0C8
		sub	ax, word_4C0C0
		jge	short loc_1D47A
		jmp	loc_1D600

loc_1D47A:
		inc	ax
		mov	[bp+var_162], ax
		mov	ax, word_4C0C4
		mov	bx, word_4C0C6
		mov	cx, word_4C0CC
		mov	dx, word_4C0CE
		lea	di, [bp+var_15E]
		call	near ptr sub_1D3FA
		mov	[bp+var_160], di
		lea	di, [bp+var_1E]
		movzx	ecx, [bp+var_162]
		movzx	eax, [bp+var_160]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx
		mov	ecx, eax
		les	si, word_4C0A2
		mov	bx, word_4C0BE
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_4C0BE
		cmp	bx, 100h
		jl	short loc_1D529
		nop
		nop
		jmp	loc_1D600

loc_1D529:
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, [bp+var_162]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	ax, [bp+var_162]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		mov	di, word_4C0C2
		shl	di, 1
		add	di, word_4C0B0
		mov	di, [di]
		add	di, word_4C0C0
		mov	es, word_4C0AE
		lea	si, [bp+var_1E]
		lea	bx, [bp+var_15E]
		push	bp
		push	[bp+var_162]
		mov	dx, [si+6]
		mov	ah, [si+16h]
		or	ah, ah
		jle	short loc_1D59B
		mov	bp, [si+4]

loc_1D589:
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_1D592
		mov	es:[di], al

loc_1D592:
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1D589

loc_1D59B:
		mov	dx, [si+0Ah]
		mov	ax, [si+18h]
		sub	ax, [si+16h]
		jle	short loc_1D5BD
		mov	ah, al
		mov	bp, [si+4]

loc_1D5AB:
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_1D5B4
		mov	es:[di], al

loc_1D5B4:
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1D5AB

loc_1D5BD:
		mov	dx, [si+0Eh]
		mov	ax, [si+1Ah]
		sub	ax, [si+18h]
		jle	short loc_1D5DF
		mov	ah, al
		mov	bp, [si+0Ch]

loc_1D5CD:
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_1D5D6
		mov	es:[di], al

loc_1D5D6:
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1D5CD

loc_1D5DF:
		mov	dx, [si+12h]
		pop	ax
		sub	ax, [si+1Ah]
		jle	short loc_1D5FF
		mov	ah, al
		mov	bp, [si+10h]

loc_1D5ED:
		mov	al, [bx]
		cmp	al, 0FFh
		jz	short loc_1D5F6
		mov	es:[di], al

loc_1D5F6:
		inc	di
		add	cx, bp
		adc	bx, dx
		dec	ah
		jnz	short loc_1D5ED

loc_1D5FF:
		pop	bp

loc_1D600:
		pop	di
		pop	si
		leave
		ret
sub_1D468		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D604		proc far

var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_1E		= word ptr -1Eh

		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_4C0C0
		cmp	ax, word_4C0B6
		jg	short loc_1D61D
		mov	cx, word_4C0C8
		cmp	cx, word_4C0B2
		jge	short loc_1D620

loc_1D61D:
		jmp	loc_1D89A

loc_1D620:
		mov	ax, word_4C0C8
		sub	ax, word_4C0C0
		inc	ax
		mov	[bp+var_166], ax
		mov	ax, word_4C0C4
		mov	bx, word_4C0C6
		mov	cx, word_4C0CC
		mov	dx, word_4C0CE
		lea	di, [bp+var_162]
		call	near ptr sub_1D3FA
		mov	[bp+var_164], di
		lea	di, [bp+var_1E]
		movzx	ecx, [bp+var_166]
		movzx	eax, [bp+var_164]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx
		mov	ecx, eax
		les	si, word_4C0A2
		mov	bx, word_4C0BE
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_4C0BE
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, [bp+var_166]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	ax, [bp+var_166]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		lea	si, [bp+var_1E]
		mov	ax, [si+16h]
		mov	bx, [si+18h]
		mov	cx, [si+1Ah]
		mov	dx, [bp+var_166]
		sub	dx, cx
		mov	[bp+var_16E], dx
		sub	cx, bx
		mov	[bp+var_16C], cx
		sub	bx, ax
		mov	[bp+var_16A], bx
		mov	[bp+var_168], ax
		mov	ax, word_4C0B2
		sub	ax, word_4C0C0
		jle	short loc_1D7A9
		add	word_4C0C0, ax
		movsx	ebx, ax
		movzx	ecx, [bp+var_168]
		cmp	ebx, ecx
		jg	short loc_1D743
		mov	ecx, ebx

loc_1D743:
		mov	eax, [si+4]
		imul	ecx
		add	[si], eax
		sub	[bp+var_168], cx
		sub	ebx, ecx
		jle	short loc_1D7A9
		movzx	ecx, [bp+var_16A]
		cmp	ebx, ecx
		jg	short loc_1D764
		mov	ecx, ebx

loc_1D764:
		mov	eax, [si+8]
		imul	ecx
		add	[si], eax
		sub	[bp+var_16A], cx
		sub	ebx, ecx
		jle	short loc_1D7A9
		movzx	ecx, [bp+var_16C]
		cmp	ebx, ecx
		jg	short loc_1D785
		mov	ecx, ebx

loc_1D785:
		mov	eax, [si+0Ch]
		imul	ecx
		add	[si], eax
		sub	[bp+var_16C], cx
		sub	ebx, ecx
		jle	short loc_1D7A9
		mov	ecx, ebx
		mov	eax, [si+10h]
		imul	ecx
		add	[si], eax
		sub	[bp+var_16E], cx

loc_1D7A9:
		mov	ax, word_4C0C8
		sub	ax, word_4C0B6
		jle	short loc_1D7EC
		mov	cx, [bp+var_16E]
		cmp	ax, cx
		jg	short loc_1D7BC
		mov	cx, ax

loc_1D7BC:
		sub	[bp+var_16E], cx
		sub	ax, cx
		jle	short loc_1D7EC
		mov	cx, [bp+var_16C]
		cmp	ax, cx
		jg	short loc_1D7CE
		mov	cx, ax

loc_1D7CE:
		sub	[bp+var_16C], cx
		sub	ax, cx
		jle	short loc_1D7EC
		mov	cx, [bp+var_16A]
		cmp	ax, cx
		jg	short loc_1D7E0
		mov	cx, ax

loc_1D7E0:
		sub	[bp+var_16A], cx
		sub	ax, cx
		jle	short loc_1D7EC
		sub	[bp+var_168], ax

loc_1D7EC:
		mov	di, word_4C0C2
		shl	di, 1
		add	di, word_4C0B0
		mov	di, [di]
		add	di, word_4C0C0
		mov	es, word_4C0AE
		lea	bx, [bp+var_1E]
		lea	si, [bp+var_162]
		mov	cx, [bx]
		add	si, [bx+2]
		push	bp
		push	[bp+var_16E]
		push	[bp+var_16C]
		push	[bp+var_16A]
		push	[bp+var_168]
		mov	dx, [bx+6]
		pop	ax
		or	ax, ax
		jle	short loc_1D83C
		mov	ah, al
		mov	bp, [bx+4]

loc_1D82A:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1D833
		mov	es:[di], al

loc_1D833:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1D82A

loc_1D83C:
		mov	dx, [bx+0Ah]
		pop	ax
		or	ax, ax
		jle	short loc_1D85B
		mov	ah, al
		mov	bp, [bx+8]

loc_1D849:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1D852
		mov	es:[di], al

loc_1D852:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1D849

loc_1D85B:
		mov	dx, [bx+0Eh]
		pop	ax
		or	ax, ax
		jle	short loc_1D87A
		mov	ah, al
		mov	bp, [bx+0Ch]

loc_1D868:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1D871
		mov	es:[di], al

loc_1D871:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1D868

loc_1D87A:
		mov	dx, [bx+12h]
		pop	ax
		or	ax, ax
		jle	short loc_1D899
		mov	ah, al
		mov	bp, [bx+10h]

loc_1D887:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1D890
		mov	es:[di], al

loc_1D890:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1D887

loc_1D899:
		pop	bp

loc_1D89A:
		pop	di
		pop	si
		leave
		ret
sub_1D604		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D89E		proc far

var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_1E		= word ptr -1Eh

		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_4C0C8
		sub	ax, word_4C0C0
		jge	short loc_1D8B0
		jmp	loc_1DA79

loc_1D8B0:
		inc	ax
		mov	[bp+var_166], ax
		mov	ax, word_4C0C4
		mov	bx, word_4C0C6
		mov	cx, word_4C0CC
		mov	dx, word_4C0CE
		lea	di, [bp+var_162]
		call	near ptr sub_1D3FA
		mov	[bp+var_164], di
		lea	di, [bp+var_1E]
		movzx	ecx, [bp+var_166]
		movzx	eax, [bp+var_164]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx
		mov	ecx, eax
		les	si, word_4C0A2
		mov	bx, word_4C0BE
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_4C0BE
		cmp	bx, 100h
		jl	short loc_1D95D
		jmp	loc_1DA79

loc_1D95D:
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, [bp+var_166]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	ax, [bp+var_166]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		lea	si, [bp+var_1E]
		mov	ax, [si+16h]
		mov	bx, [si+18h]
		mov	cx, [si+1Ah]
		mov	dx, [bp+var_166]
		sub	dx, cx
		mov	[bp+var_16E], dx
		sub	cx, bx
		mov	[bp+var_16C], cx
		sub	bx, ax
		mov	[bp+var_16A], bx
		mov	[bp+var_168], ax
		push	bp
		push	dx
		push	cx
		push	bx
		push	ax
		mov	di, word_4C0C2
		shl	di, 1
		add	di, word_4C0B0
		mov	di, [di]
		add	di, word_4C0C0
		mov	es, word_4C0AE
		lea	bx, [bp+var_1E]
		lea	si, [bp+var_162]
		xor	cx, cx
		pop	ax
		or	ax, ax
		jle	short loc_1DA00
		mov	ah, al
		mov	bp, [bx+4]
		mov	dx, [bx+6]
		push	bx
		lfs	bx, word_4C0BA

loc_1D9EB:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1D9F6
		xlatb
		mov	es:[di], al

loc_1D9F6:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1D9EB
		pop	bx

loc_1DA00:
		pop	ax
		or	ax, ax
		jle	short loc_1DA28
		mov	ah, al
		mov	bp, [bx+8]
		mov	dx, [bx+0Ah]
		push	bx
		lfs	bx, word_4C0BA

loc_1DA13:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DA1E
		xlatb
		mov	es:[di], al

loc_1DA1E:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DA13
		pop	bx

loc_1DA28:
		pop	ax
		or	ax, ax
		jle	short loc_1DA50
		mov	ah, al
		mov	bp, [bx+0Ch]
		mov	dx, [bx+0Eh]
		push	bx
		lfs	bx, word_4C0BA

loc_1DA3B:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DA46
		xlatb
		mov	es:[di], al

loc_1DA46:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DA3B
		pop	bx

loc_1DA50:
		pop	ax
		or	ax, ax
		jle	short loc_1DA78
		mov	ah, al
		mov	bp, [bx+10h]
		mov	dx, [bx+12h]
		push	bx
		lfs	bx, word_4C0BA

loc_1DA63:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DA6E
		xlatb
		mov	es:[di], al

loc_1DA6E:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DA63
		pop	bx

loc_1DA78:
		pop	bp

loc_1DA79:
		pop	di
		pop	si
		leave
		ret
sub_1D89E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DA7D		proc far

var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_1E		= word ptr -1Eh

		enter	16Eh, 0
		push	si
		push	di
		mov	ax, word_4C0C0
		cmp	ax, word_4C0B6
		jg	short loc_1DA96
		mov	cx, word_4C0C8
		cmp	cx, word_4C0B2
		jge	short loc_1DA99

loc_1DA96:
		jmp	loc_1DD37

loc_1DA99:
		mov	ax, word_4C0C8
		sub	ax, word_4C0C0
		inc	ax
		mov	[bp+var_166], ax
		mov	ax, word_4C0C4
		mov	bx, word_4C0C6
		mov	cx, word_4C0CC
		mov	dx, word_4C0CE
		lea	di, [bp+var_162]
		call	near ptr sub_1D3FA
		mov	[bp+var_164], di
		lea	di, [bp+var_1E]
		movzx	ecx, [bp+var_166]
		movzx	eax, [bp+var_164]
		xor	edx, edx
		dec	eax
		shl	eax, 10h
		div	ecx
		mov	ecx, eax
		les	si, word_4C0A2
		mov	bx, word_4C0BE
		shl	bx, 1
		add	si, bx
		movzx	eax, word ptr es:[si]
		xor	edx, edx
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		mul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		add	si, 200h
		mov	bx, word_4C0BE
		shl	bx, 1
		add	si, bx
		mov	eax, es:[si]
		movzx	ecx, [bp+var_166]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	ax, [bp+var_166]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		xor	eax, eax
		mov	[di], eax
		mov	[di+14h], ax
		lea	si, [bp+var_1E]
		mov	ax, [si+16h]
		mov	bx, [si+18h]
		mov	cx, [si+1Ah]
		mov	dx, [bp+var_166]
		sub	dx, cx
		mov	[bp+var_16E], dx
		sub	cx, bx
		mov	[bp+var_16C], cx
		sub	bx, ax
		mov	[bp+var_16A], bx
		mov	[bp+var_168], ax
		mov	ax, word_4C0B2
		sub	ax, word_4C0C0
		jle	short loc_1DC22
		add	word_4C0C0, ax
		movzx	ebx, ax
		movzx	ecx, [bp+var_168]
		cmp	ebx, ecx
		jg	short loc_1DBBC
		mov	ecx, ebx

loc_1DBBC:
		mov	eax, [si+4]
		imul	ecx
		add	[si], eax
		sub	[bp+var_168], cx
		sub	ebx, ecx
		jle	short loc_1DC22
		movzx	ecx, [bp+var_16A]
		cmp	ebx, ecx
		jg	short loc_1DBDD
		mov	ecx, ebx

loc_1DBDD:
		mov	eax, [si+8]
		imul	ecx
		add	[si], eax
		sub	[bp+var_16A], cx
		sub	ebx, ecx
		jle	short loc_1DC22
		movzx	ecx, [bp+var_16C]
		cmp	ebx, ecx
		jg	short loc_1DBFE
		mov	ecx, ebx

loc_1DBFE:
		mov	eax, [si+0Ch]
		imul	ecx
		add	[si], eax
		sub	[bp+var_16C], cx
		sub	ebx, ecx
		jle	short loc_1DC22
		mov	ecx, ebx
		mov	eax, [si+10h]
		imul	ecx
		add	[si], eax
		sub	[bp+var_16E], cx

loc_1DC22:
		mov	ax, word_4C0C8
		sub	ax, word_4C0B6
		jle	short loc_1DC65
		mov	cx, [bp+var_16E]
		cmp	ax, cx
		jg	short loc_1DC35
		mov	cx, ax

loc_1DC35:
		sub	[bp+var_16E], cx
		sub	ax, cx
		jle	short loc_1DC65
		mov	cx, [bp+var_16C]
		cmp	ax, cx
		jg	short loc_1DC47
		mov	cx, ax

loc_1DC47:
		sub	[bp+var_16C], cx
		sub	ax, cx
		jle	short loc_1DC65
		mov	cx, [bp+var_16A]
		cmp	ax, cx
		jg	short loc_1DC59
		mov	cx, ax

loc_1DC59:
		sub	[bp+var_16A], cx
		sub	ax, cx
		jle	short loc_1DC65
		sub	[bp+var_168], ax

loc_1DC65:
		mov	di, word_4C0C2
		shl	di, 1
		add	di, word_4C0B0
		mov	di, [di]
		add	di, word_4C0C0
		mov	es, word_4C0AE
		lea	bx, [bp+var_1E]
		lea	si, [bp+var_162]
		mov	cx, [bx]
		add	si, [bx+2]
		push	bp
		push	[bp+var_16E]
		push	[bp+var_16C]
		push	[bp+var_16A]
		push	[bp+var_168]
		pop	ax
		or	ax, ax
		jle	short loc_1DCBE
		mov	ah, al
		mov	dx, [bx+6]
		mov	bp, [bx+4]
		push	bx
		lfs	bx, word_4C0BA

loc_1DCA9:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DCB4
		xlatb
		mov	es:[di], al

loc_1DCB4:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DCA9
		pop	bx

loc_1DCBE:
		pop	ax
		or	ax, ax
		jle	short loc_1DCE6
		mov	ah, al
		mov	dx, [bx+0Ah]
		mov	bp, [bx+8]
		push	bx
		lfs	bx, word_4C0BA

loc_1DCD1:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DCDC
		xlatb
		mov	es:[di], al

loc_1DCDC:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DCD1
		pop	bx

loc_1DCE6:
		pop	ax
		or	ax, ax
		jle	short loc_1DD0E
		mov	ah, al
		mov	dx, [bx+0Eh]
		mov	bp, [bx+0Ch]
		push	bx
		lfs	bx, word_4C0BA

loc_1DCF9:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DD04
		xlatb
		mov	es:[di], al

loc_1DD04:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DCF9
		pop	bx

loc_1DD0E:
		pop	ax
		or	ax, ax
		jle	short loc_1DD36
		mov	ah, al
		mov	dx, [bx+12h]
		mov	bp, [bx+10h]
		push	bx
		lfs	bx, word_4C0BA

loc_1DD21:
		mov	al, [si]
		cmp	al, 0FFh
		jz	short loc_1DD2C
		xlatb
		mov	es:[di], al

loc_1DD2C:
		inc	di
		add	cx, bp
		adc	si, dx
		dec	ah
		jnz	short loc_1DD21
		pop	bx

loc_1DD36:
		pop	bp

loc_1DD37:
		pop	di
		pop	si
		leave
		ret
sub_1DA7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DD3B		proc far

var_2		= word ptr -2
saved_4		= word ptr  4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		enter	2, 0
		push	si
		push	di
		mov	bx, [bp+saved_4]
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	byte ptr [bx], 0
		mov	ax, gs:[si+2]
		mov	[bx+0Dh], ax
		mov	cx, gs:[di+2]
		mov	[bx+0Fh], cx
		mov	word ptr [bx+13h], 0
		movsx	eax, word ptr gs:[si]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bx+5], eax
		mov	ax, gs:[di+2]
		sub	ax, gs:[si+2]
		jle	short loc_1DD9A
		mov	[bp+var_2], ax
		inc	ax
		mov	[bx+11h], ax
		mov	ax, gs:[si+2]
		cmp	ax, word_4C0B8
		jg	short loc_1DD95
		mov	ax, gs:[di+2]
		cmp	ax, word_4C0B4
		jge	short loc_1DD9D

loc_1DD95:
		mov	word ptr [bx+13h], 1

loc_1DD9A:
		jmp	loc_1DF62

loc_1DD9D:
		mov	byte ptr [bx], 1
		movzx	eax, word ptr gs:[di+6]
		movzx	ecx, word ptr gs:[si+6]
		sub	eax, ecx
		mov	[bx+17h], eax
		movzx	eax, word ptr gs:[di+8]
		movzx	ecx, word ptr gs:[si+8]
		sub	eax, ecx
		mov	[bx+1Dh], eax
		mov	si, [bp+saved_4]
		lea	di, [si+21h]
		movsx	ecx, [bp+var_2]
		mov	eax, [si+1Dh]
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	ecx
		push	eax
		mov	eax, [si+17h]
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	ecx
		pop	ebx
		mov	ecx, eax
		les	si, word_4C0A2
		mov	ax, [bp+arg_0]
		shl	ax, 1
		add	si, ax
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+4], eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+22h], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+8], eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+26h], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+0Ch], eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+2Ah], eax
		add	si, 200h
		movzx	eax, word ptr es:[si]
		push	eax
		imul	ecx
		shrd	eax, edx, 0Ch
		mov	[di+10h], eax
		pop	eax
		imul	ebx
		shrd	eax, edx, 0Ch
		mov	[di+2Eh], eax
		add	si, 200h
		mov	ax, [bp+arg_0]
		shl	ax, 1
		add	si, ax
		mov	eax, es:[si]
		movzx	ecx, [bp+var_2]
		mul	ecx
		shr	eax, 0Ch
		mov	[di+18h], ax
		mov	[di+36h], ax
		mov	cx, ax
		shr	ax, 1
		mov	[di+16h], ax
		mov	[di+34h], ax
		mov	ax, [bp+var_2]
		add	ax, cx
		shr	ax, 1
		mov	[di+1Ah], ax
		mov	[di+38h], ax
		mov	ax, [bp+var_2]
		inc	ax
		mov	[di+1Ch], ax
		mov	[di+3Ah], ax
		mov	bx, [bp+arg_2]
		movzx	eax, word ptr gs:[bx+6]
		shl	eax, 8
		mov	[di], eax
		movzx	eax, word ptr gs:[bx+8]
		shl	eax, 8
		mov	[di+1Eh], eax
		xor	ax, ax
		mov	[di+14h], ax
		mov	[di+32h], ax
		mov	si, [bp+saved_4]
		mov	di, [bp+arg_4]
		mov	cx, gs:[di]
		mov	di, [bp+arg_2]
		mov	ax, gs:[di]
		sub	cx, ax
		movsx	eax, cx
		shl	eax, 10h
		movzx	ecx, [bp+var_2]
		cdq
		idiv	ecx
		mov	[si+9], eax
		mov	cx, word_4C0B4
		mov	ax, [si+0Dh]
		cmp	ax, cx
		jge	short loc_1DF55
		mov	[si+0Dh], cx
		sub	cx, ax
		mov	ax, cx
		mov	[si+13h], ax
		cwde
		push	ax
		imul	dword ptr [si+9]
		add	[si+5], eax
		pop	cx
		push	cx
		lea	bx, [si+21h]
		call	sub_1DF66
		pop	cx
		lea	bx, [si+3Fh]
		call	sub_1DF66

loc_1DF55:
		mov	ax, word_4C0B8
		mov	cx, [si+0Fh]
		cmp	ax, cx
		jge	short loc_1DF62
		mov	[si+0Fh], ax

loc_1DF62:
		pop	di
		pop	si
		leave
		ret
sub_1DD3B		endp

; ----------------------------------------------------------------------

sub_1DF66		proc near
		mov	ax, [bx+14h]
		add	cx, ax
		cmp	ax, [bx+16h]
		jge	short loc_1DF91
		cmp	cx, ax
		jle	short loc_1DF91
		mov	dx, [bx+16h]
		cmp	cx, dx
		jg	short loc_1DF7D
		mov	dx, cx

loc_1DF7D:
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+4]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_1DF91:
		cmp	ax, [bx+18h]
		jge	short loc_1DFB7
		cmp	cx, ax
		jle	short loc_1DFB7
		mov	dx, [bx+18h]
		cmp	cx, dx
		jg	short loc_1DFA3
		mov	dx, cx

loc_1DFA3:
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+8]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_1DFB7:
		cmp	ax, [bx+1Ah]
		jge	short loc_1DFDD
		cmp	cx, ax
		jle	short loc_1DFDD
		mov	dx, [bx+1Ah]
		cmp	cx, dx
		jg	short loc_1DFC9
		mov	dx, cx

loc_1DFC9:
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+0Ch]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_1DFDD:
		cmp	cx, ax
		jle	short loc_1DFFE
		mov	dx, [bx+1Ch]
		cmp	cx, dx
		jg	short loc_1DFEA
		mov	dx, cx

loc_1DFEA:
		push	dx
		sub	dx, ax
		movsx	eax, dx
		cdq
		imul	dword ptr [bx+10h]
		add	[bx], eax
		pop	ax
		mov	[bx+14h], ax

loc_1DFFE:
		ret
sub_1DF66		endp

; ----------------------------------------------------------------------

sub_1DFFF		proc near
		mov	ax, [bx+14h]
		mov	ecx, [bx+4]
		cmp	ax, [bx+16h]
		jl	short loc_1E021
		mov	ecx, [bx+8]
		cmp	ax, [bx+18h]
		jl	short loc_1E021
		mov	ecx, [bx+0Ch]
		cmp	ax, [bx+1Ah]
		jl	short loc_1E021
		mov	ecx, [bx+10h]

loc_1E021:
		add	[bx], ecx
		inc	word ptr [bx+14h]
		ret
sub_1DFFF		endp

; ----------------------------------------------------------------------

sub_1E028		proc near
		mov	eax, [bx+9]
		add	[bx+5], eax
		push	bx
		lea	bx, [bx+21h]
		call	sub_1DFFF
		pop	bx
		push	bx
		lea	bx, [bx+3Fh]
		call	sub_1DFFF
		pop	bx
		mov	ax, [bx+0Dh]
		inc	word ptr [bx+0Dh]
		cmp	ax, [bx+0Fh]
		cmc
		ret
sub_1E028		endp

; ----------------------------------------------------------------------

sub_1E04B		proc near
		mov	dx, 80h
		add	ecx, eax
		jz	short loc_1E05E
		shl	eax, 8
		cdq
		idiv	ecx
		mov	dx, ax

loc_1E05E:
		mov	ax, dx
		cmp	ax, 18h
		jge	short loc_1E068
		mov	ax, 18h

loc_1E068:
		cmp	ax, 0E7h
		jle	short loc_1E070
		mov	ax, 0E7h

loc_1E070:
		ret
sub_1E04B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E071		proc far

var_131		= word ptr -131h
var_12F		= word ptr -12Fh
var_12D		= word ptr -12Dh
var_12B		= word ptr -12Bh
var_129		= word ptr -129h
var_127		= word ptr -127h
var_125		= word ptr -125h
var_123		= word ptr -123h
var_121		= word ptr -121h
var_11F		= word ptr -11Fh
var_11D		= word ptr -11Dh
var_11B		= word ptr -11Bh
var_119		= word ptr -119h
var_117		= word ptr -117h
var_106		= word ptr -106h
var_104		= word ptr -104h
var_BA		= word ptr -0BAh
var_AB		= word ptr -0ABh
var_A9		= word ptr -0A9h
var_A7		= word ptr -0A7h
var_A5		= word ptr -0A5h
var_9F		= word ptr -9Fh
var_5D		= word ptr -5Dh
var_58		= dword ptr -58h
var_3C		= dword ptr -3Ch
var_1E		= dword ptr -1Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_E		= dword ptr  14h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah
arg_16		= dword ptr  1Ch

		enter	131h, 0
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		push	ds
		pop	es
		mov	di, 36CEh
		mov	cx, 0Ch
		rep movsb
		mov	eax, [bp+arg_16]
		mov	dword ptr word_4C0BA, eax
		mov	eax, [bp+arg_E]
		mov	dword ptr word_4C0A6, eax
		mov	ax, [bp+arg_12]
		mov	word_4C0AA, ax
		mov	ax, [bp+arg_14]
		mov	word_4C0AC, ax
		lgs	bx, [bp+arg_2]
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_A]
		mov	ax, gs:[bx+2]
		cmp	ax, gs:[di+2]
		jg	short loc_1E0BF
		jl	short loc_1E0C1
		mov	ax, gs:[bx]
		cmp	ax, gs:[di]
		jle	short loc_1E0C1

loc_1E0BF:
		xchg	di, bx

loc_1E0C1:
		mov	ax, gs:[si+2]
		cmp	ax, gs:[di+2]
		jg	short loc_1E0D5
		jl	short loc_1E0D7
		mov	ax, gs:[si]
		cmp	ax, gs:[di]
		jle	short loc_1E0D7

loc_1E0D5:
		xchg	di, si

loc_1E0D7:
		mov	ax, gs:[bx+2]
		cmp	ax, gs:[si+2]
		jg	short loc_1E0EB
		jl	short loc_1E0ED
		mov	ax, gs:[bx]
		cmp	ax, gs:[si]
		jle	short loc_1E0ED

loc_1E0EB:
		xchg	si, bx

loc_1E0ED:
		mov	[bp+arg_2], bx
		mov	[bp+arg_6], si
		mov	[bp+arg_A], di
		xor	cx, cx
		mov	ax, word_4C0B2
		cmp	ax, gs:[bx]
		jle	short loc_1E102
		inc	cl

loc_1E102:
		cmp	ax, gs:[si]
		jle	short loc_1E109
		inc	cl

loc_1E109:
		cmp	ax, gs:[di]
		jle	short loc_1E110
		inc	cl

loc_1E110:
		mov	ax, word_4C0B6
		cmp	ax, gs:[bx]
		jge	short loc_1E11A
		inc	ch

loc_1E11A:
		cmp	ax, gs:[si]
		jge	short loc_1E121
		inc	ch

loc_1E121:
		cmp	ax, gs:[di]
		jge	short loc_1E128
		inc	ch

loc_1E128:
		mov	[bp+var_12F], cx
		cmp	cl, 3
		jz	short loc_1E138
		cmp	ch, 3
		jz	short loc_1E138
		jmp	short loc_1E13B

loc_1E138:
		jmp	loc_1E565

loc_1E13B:
		mov	ax, gs:[bx+2]
		cmp	ax, word_4C0B8
		jle	short loc_1E148
		jmp	loc_1E565

loc_1E148:
		mov	ax, gs:[di+2]
		cmp	ax, word_4C0B4
		jge	short loc_1E155
		jmp	loc_1E565

loc_1E155:
		mov	eax, gs:[si+0Eh]
		mov	ecx, gs:[bx+0Eh]
		call	sub_1E04B
		mov	[bp+var_121], ax
		mov	eax, gs:[di+0Eh]
		mov	ecx, gs:[si+0Eh]
		call	sub_1E04B
		mov	[bp+var_123], ax
		mov	eax, gs:[di+0Eh]
		mov	ecx, gs:[bx+0Eh]
		call	sub_1E04B
		mov	[bp+var_125], ax
		lea	si, [bp+var_5D]
		push	[bp+arg_A]
		push	[bp+arg_2]
		push	[bp+var_125]
		push	si
		call	near ptr sub_1DD3B
		add	sp, 8
		lea	si, [bp+var_BA]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	[bp+var_121]
		push	si
		call	near ptr sub_1DD3B
		add	sp, 8
		lea	si, [bp+var_117]
		push	[bp+arg_A]
		push	[bp+arg_6]
		push	[bp+var_123]
		push	si
		call	near ptr sub_1DD3B
		add	sp, 8
		cmp	byte ptr [bp+var_BA], 0
		jz	short loc_1E1E9
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_1E1E9
		mov	ax, [bp+var_AB]
		cmp	ax, word_4C0B4
		jg	short loc_1E1E5
		mov	byte ptr [bp+var_BA], 0
		jmp	short loc_1E1E9

loc_1E1E5:
		dec	[bp+var_AB]

loc_1E1E9:
		cmp	byte ptr [bp+var_5D], 0
		jnz	loc_1E272
		mov	byte ptr [bp+var_BA], 1
		mov	byte ptr [bp+var_5D], 1
		mov	bx, [bp+arg_A]
		movsx	eax, word ptr gs:[bx]
		shl	eax, 10h
		mov	[bp+var_58], eax
		movzx	eax, word ptr gs:[bx+6]
		shl	eax, 8
		mov	[bp+var_3C], eax
		movzx	eax, word ptr gs:[bx+8]
		shl	eax, 8
		mov	[bp+var_1E], eax
		lea	si, [bp+var_BA]
		mov	[bp+var_119], si
		mov	[bp+var_11D], 0
		lea	bx, [si+21h]
		movzx	eax, [bp+var_A5]
		shl	eax, 8
		mov	[bx], eax
		lea	bx, [si+3Fh]
		movzx	eax, [bp+var_9F]
		shl	eax, 8
		mov	[bx], eax
		lea	di, [bp+var_5D]
		mov	[bp+var_11B], di
		mov	[bp+var_11F], 0
		mov	ax, [bp+var_125]
		mov	[bp+var_127], ax
		mov	[bp+var_129], 0
		jmp	loc_1E485

loc_1E272:
		lea	bx, [bp+var_5D]
		lea	si, [bp+var_BA]
		lea	di, [bp+var_117]
		cmp	byte ptr [si], 0
		jz	short loc_1E2B6
		mov	edx, [si+9]
		cmp	edx, [bx+9]
		jg	short loc_1E2A1
		mov	[bp+var_119], si
		mov	[bp+var_11D], di
		mov	[bp+var_11B], bx
		mov	[bp+var_11F], 0
		jmp	short loc_1E2EB
		nop

loc_1E2A1:
		mov	[bp+var_119], bx
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], si
		mov	[bp+var_11F], di
		jmp	short loc_1E2EB
		nop

loc_1E2B6:
		mov	edx, [di+9]
		cmp	edx, [bx+9]
		jl	short loc_1E2D7
		mov	[bp+var_119], di
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], bx
		mov	[bp+var_11F], 0
		jmp	short loc_1E2EB
		nop

loc_1E2D7:
		mov	[bp+var_119], bx
		mov	[bp+var_11D], 0
		mov	[bp+var_11B], di
		mov	[bp+var_11F], 0

loc_1E2EB:
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]
		cmp	byte ptr [bp+var_BA], 0
		jnz	short loc_1E33D
		cmp	[bp+var_A7], 0
		jnz	short loc_1E33D
		mov	ax, [bp+var_121]
		shl	ax, 7
		mov	[bp+var_127], ax
		mov	ax, 4000h
		mov	[bp+var_12B], ax
		mov	cx, [si+11h]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	cx
		mov	[bp+var_129], ax
		mov	[bp+var_12D], 0
		mov	cx, [bp+var_A7]
		or	cx, cx
		jz	short loc_1E33A
		mov	ax, [bp+var_129]
		imul	cx
		add	[bp+var_127], ax

loc_1E33A:
		jmp	loc_1E485

loc_1E33D:
		cmp	byte ptr [bp+var_117], 0
		jnz	short loc_1E387
		cmp	[bp+var_104], 0
		jnz	short loc_1E387
		mov	ax, 4000h
		mov	[bp+var_127], ax
		mov	ax, [bp+var_123]
		shl	ax, 7
		mov	[bp+var_12B], ax
		mov	cx, [si+11h]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	cx
		mov	[bp+var_129], ax
		mov	[bp+var_12D], 0
		mov	cx, [bp+var_104]
		or	cx, cx
		jz	short loc_1E384
		mov	ax, [bp+var_129]
		imul	cx
		add	[bp+var_127], ax

loc_1E384:
		jmp	loc_1E485

loc_1E387:
		mov	ax, 4000h
		mov	[bp+var_127], ax
		mov	bx, [bp+arg_2]
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_A]
		mov	cx, gs:[di+2]
		sub	cx, gs:[bx+2]
		movsx	ecx, cx
		mov	ax, gs:[si+2]
		sub	ax, gs:[bx+2]
		movsx	eax, ax
		mov	edx, gs:[bx+0Eh]
		sub	edx, gs:[si+0Eh]
		imul	edx
		idiv	ecx
		add	eax, gs:[si+0Eh]
		imul	dword ptr gs:[di+0Eh]
		push	eax
		mov	ecx, eax
		mov	eax, gs:[bx+0Eh]
		imul	eax, gs:[si+0Eh]
		add	ecx, eax
		pop	edx
		mov	ax, 4000h
		jmp	short loc_1E3F9
		or	ecx, ecx
		jz	short loc_1E3F9
		mov	eax, edx
		cdq
		shld	edx, eax, 0Fh
		shl	eax, 0Fh
		idiv	ecx

loc_1E3F9:
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]
		lea	cx, [bp+var_5D]
		cmp	cx, si
		jz	short loc_1E40D
		neg	ax
		add	ax, 8000h

loc_1E40D:
		cmp	ax, 0C00h
		jge	short loc_1E415
		mov	ax, 0C00h

loc_1E415:
		cmp	ax, 7380h
		jle	short loc_1E41D
		mov	ax, 7380h

loc_1E41D:
		mov	[bp+var_12B], ax
		cmp	byte ptr [bp+var_BA], 0
		jz	short loc_1E448
		mov	ax, [bp+var_12B]
		sub	ax, [bp+var_127]
		sbb	dx, dx
		idiv	[bp+var_A9]
		mov	[bp+var_129], ax
		mov	cx, [bp+var_A7]
		or	cx, cx
		jz	short loc_1E448
		imul	cx
		add	[bp+var_127], ax

loc_1E448:
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_1E46E
		mov	ax, 4000h
		sub	ax, [bp+var_12B]
		sbb	dx, dx
		idiv	[bp+var_106]
		mov	[bp+var_12D], ax
		mov	cx, [bp+var_104]
		or	cx, cx
		jz	short loc_1E46E
		imul	cx
		add	[bp+var_12B], ax

loc_1E46E:
		cmp	byte ptr [bp+var_BA], 0
		jnz	short loc_1E485
		mov	ax, [bp+var_12B]
		mov	[bp+var_127], ax
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax

loc_1E485:
		mov	ax, 78h
		mov	cx, 214h
		cmp	dword ptr word_4C0BA, 0
		jz	short loc_1E499
		mov	ax, 4AEh
		mov	cx, 68Dh

loc_1E499:
		cmp	[bp+var_12F], 0
		jz	short loc_1E4A2
		mov	ax, cx

loc_1E4A2:
		mov	[bp+var_131], ax
		mov	si, [bp+var_119]
		mov	di, [bp+var_11B]

loc_1E4AE:
		mov	eax, [si+5]
		shr	eax, 10h
		mov	word_4C0C0, ax
		mov	ax, [si+0Dh]
		mov	word_4C0C2, ax
		lea	bx, [si+21h]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_4C0C4, ax
		lea	bx, [si+3Fh]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_4C0C6, ax
		mov	eax, [di+5]
		shr	eax, 10h
		mov	word_4C0C8, ax
		mov	ax, [di+0Dh]
		mov	word_4C0CA, ax
		lea	bx, [di+21h]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_4C0CC, ax
		lea	bx, [di+3Fh]
		mov	eax, [bx]
		add	eax, 8000h
		shr	eax, 10h
		mov	word_4C0CE, ax
		mov	ax, [bp+var_127]
		shr	ax, 7
		mov	word_4C0BE, ax
		call	word ptr [bp+var_131]
		mov	ax, [bp+var_129]
		add	[bp+var_127], ax
		mov	bx, si
		call	sub_1E028
		jnb	short loc_1E549
		mov	si, [bp+var_11D]
		or	si, si
		jz	short loc_1E565
		mov	ax, [bp+var_12D]
		mov	[bp+var_129], ax

loc_1E549:
		mov	bx, di
		call	sub_1E028
		jnb	loc_1E4AE
		mov	di, [bp+var_11F]
		or	di, di
		jz	short loc_1E565
		mov	ax, [bp+var_12D]
sub_1E071		endp

; START OF FUNCTION CHUNK FOR sub_1E071
		db 89h, 86h
; END OF FUNCTION CHUNK FOR sub_1E071
seg047		ends
