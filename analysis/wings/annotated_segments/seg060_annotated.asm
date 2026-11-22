seg060		segment	para public 'CODE' use16
		assume cs:seg060
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh, 8Bh, 44h, 10h, 0C1h, 0E8h, 8, 8Bh, 5Ch, 12h, 0C1h, 0EBh, 8
		db 8Bh, 4Dh, 10h, 0C1h, 0E9h, 8, 8Bh, 55h, 12h, 0C1h, 0EAh, 8, 8Bh, 74h, 0Ah, 8Bh
		db 7Dh, 0Ah, 87h, 0F7h, 2Bh, 0F7h, 46h, 3, 3Eh, 0C2h, 24h, 8Eh, 6, 0B4h, 24h, 89h
		db 36h, 2Ah, 25h, 50h, 52h, 0Fh, 0B4h, 36h, 0C8h, 24h, 3, 0F0h, 0A1h, 0C4h, 24h, 0F7h
		db 0E3h, 3, 0F0h, 5Ah, 2Bh, 0D3h, 8Bh, 0DAh, 8Bh, 16h, 0C4h, 24h, 79h, 6, 90h, 90h
		db 0F7h, 0DAh, 0F7h, 0DBh, 58h, 2Bh, 0C8h, 8Bh, 0C1h, 0B9h, 1, 0, 79h, 6, 90h, 90h
		db 0F7h, 0D9h, 0F7h, 0D8h, 3Bh, 0C3h, 7Eh, 3, 93h, 87h, 0CAh, 89h, 1Eh, 3Eh, 25h, 0A3h
		db 42h, 25h, 89h, 16h, 40h, 25h, 89h, 0Eh, 44h, 25h, 8Bh, 0D3h, 8Bh, 0Eh, 2Ah, 25h
		db 55h, 33h, 0DBh, 8Bh, 0E9h, 64h, 8Ah, 4, 3Ch, 0FFh, 74h, 3, 26h, 88h, 5, 47h
		db 49h, 7Eh, 25h, 0A1h, 42h, 25h, 3, 1Eh, 3Eh, 25h, 7Eh, 0E9h, 3, 36h, 40h, 25h
		db 2Bh, 0D0h, 7Eh, 6, 2Bh, 0DDh, 7Eh, 0DDh, 0EBh, 0F2h, 3, 16h, 3Eh, 25h, 3, 36h
		db 44h, 25h, 2Bh, 0DDh, 7Eh, 0CFh, 0EBh, 0E4h, 5Dh, 0C3h, 8Bh, 44h, 0Ah, 3Bh, 6, 0BCh
		db 24h, 0Fh, 8Fh, 0ABh, 0, 8Bh, 4Dh, 0Ah, 3Bh, 0Eh, 0B8h, 24h, 0Fh, 8Ch, 0A0h, 0
		db 8Bh, 0D1h, 2Bh, 0D0h, 42h, 89h, 16h, 38h, 25h, 8Bh, 54h, 10h, 0C1h, 0EAh, 8, 89h
		db 16h, 30h, 25h, 8Bh, 55h, 10h, 0C1h, 0EAh, 8, 89h, 16h, 32h, 25h, 2Bh, 16h, 30h
		db 25h, 89h, 16h, 3Ah, 25h, 8Bh, 54h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 34h, 25h, 8Bh
		db 55h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 36h, 25h, 2Bh, 16h, 34h, 25h, 89h, 16h, 3Ch
		db 25h, 3Bh, 6, 0B8h, 24h, 7Dh, 27h, 90h, 90h, 8Bh, 1Eh, 0B8h, 24h, 2Bh, 0D8h, 53h
		db 8Bh, 0C3h, 0F7h, 2Eh, 3Ah, 25h, 0F7h, 3Eh, 38h, 25h, 1, 6, 30h, 25h, 58h, 0F7h
		db 2Eh, 3Ch, 25h, 0F7h, 3Eh, 38h, 25h, 1, 6, 34h, 25h, 0A1h, 0B8h, 24h, 0A3h, 2Ch
		db 25h, 3Bh, 0Eh, 0BCh, 24h, 7Eh, 2Ch, 90h, 90h, 8Bh, 0C1h, 2Bh, 6, 0BCh, 24h, 50h
		db 0F7h, 2Eh, 3Ah, 25h, 0F7h, 3Eh, 38h, 25h, 29h, 6, 32h, 25h, 58h, 0F7h, 2Eh, 3Ch
		db 25h, 0F7h, 3Eh, 38h, 25h, 29h, 6, 36h, 25h, 8Bh, 0Eh, 0BCh, 24h, 0EBh, 4, 90h
		db 0EBh, 28h, 90h, 89h, 0Eh, 2Eh, 25h, 8Bh, 0F1h, 8Bh, 3Eh, 2Ch, 25h, 2Bh, 0F7h, 46h
		db 3, 3Eh, 0C2h, 24h, 8Eh, 6, 0B4h, 24h, 0A1h, 30h, 25h, 8Bh, 1Eh, 34h, 25h, 8Bh
		db 0Eh, 32h, 25h, 8Bh, 16h, 36h, 25h, 0E9h, 95h, 0FEh, 0C3h, 8Bh, 44h, 10h, 0C1h, 0E8h
		db 8, 8Bh, 5Ch, 12h, 0C1h, 0EBh, 8, 8Bh, 4Dh, 10h, 0C1h, 0E9h, 8, 8Bh, 55h, 12h
		db 0C1h, 0EAh, 8, 8Bh, 74h, 0Ah, 8Bh, 7Dh, 0Ah, 87h, 0F7h, 2Bh, 0F7h, 46h, 83h, 0FEh
		db 0, 7Fh, 3, 90h, 90h, 90h, 3, 3Eh, 0C2h, 24h, 8Eh, 6, 0B4h, 24h, 89h, 36h
		db 2Ah, 25h, 50h, 52h, 0Fh, 0B4h, 36h, 0C8h, 24h, 3, 0F0h, 0A1h, 0C4h, 24h, 0F7h, 0E3h
		db 3, 0F0h, 5Ah, 2Bh, 0D3h, 8Bh, 0DAh, 8Bh, 16h, 0C4h, 24h, 79h, 6, 90h, 90h, 0F7h
		db 0DAh, 0F7h, 0DBh, 58h, 2Bh, 0C8h, 8Bh, 0C1h, 0B9h, 1, 0, 79h, 6, 90h, 90h, 0F7h
		db 0D9h, 0F7h, 0D8h, 3Bh, 0C3h, 7Eh, 3, 93h, 87h, 0CAh, 89h, 1Eh, 3Eh, 25h, 0A3h, 42h
		db 25h, 89h, 16h, 40h, 25h, 89h, 0Eh, 44h, 25h, 8Bh, 0D3h, 8Bh, 0Eh, 2Ah, 25h, 0Fh
		db 0B5h, 1Eh, 46h, 25h, 55h, 33h, 0EDh, 0B4h, 0FFh, 3, 2Eh, 3Eh, 25h, 64h, 8Ah, 4
		db 3Ah, 0C4h, 74h, 5, 65h, 0D7h, 26h, 88h, 5, 47h, 49h, 7Eh, 1Ch, 0Bh, 0EDh, 7Eh
		db 0E8h, 2Bh, 2Eh, 2Ah, 25h, 3, 36h, 40h, 25h, 2Bh, 16h, 42h, 25h, 7Fh, 0EEh, 3
		db 16h, 3Eh, 25h, 3, 36h, 44h, 25h, 0EBh, 0E4h, 5Dh, 0C3h, 8Bh, 44h, 0Ah, 3Bh, 6
		db 0BCh, 24h, 0Fh, 8Fh, 0ABh, 0, 8Bh, 4Dh, 0Ah, 3Bh, 0Eh, 0B8h, 24h, 0Fh, 8Ch, 0A0h
		db 0, 8Bh, 0D1h, 2Bh, 0D0h, 42h, 89h, 16h, 38h, 25h, 8Bh, 54h, 10h, 0C1h, 0EAh, 8
		db 89h, 16h, 30h, 25h, 8Bh, 55h, 10h, 0C1h, 0EAh, 8, 89h, 16h, 32h, 25h, 2Bh, 16h
		db 30h, 25h, 89h, 16h, 3Ah, 25h, 8Bh, 54h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 34h, 25h
		db 8Bh, 55h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 36h, 25h, 2Bh, 16h, 34h, 25h, 89h, 16h
		db 3Ch, 25h, 3Bh, 6, 0B8h, 24h, 7Dh, 27h, 90h, 90h, 8Bh, 1Eh, 0B8h, 24h, 2Bh, 0D8h
		db 53h, 8Bh, 0C3h, 0F7h, 2Eh, 3Ah, 25h, 0F7h, 3Eh, 38h, 25h, 1, 6, 30h, 25h, 58h
		db 0F7h, 2Eh, 3Ch, 25h, 0F7h, 3Eh, 38h, 25h, 1, 6, 34h, 25h, 0A1h, 0B8h, 24h, 0A3h
		db 2Ch, 25h, 3Bh, 0Eh, 0BCh, 24h, 7Eh, 2Ch, 90h, 90h, 8Bh, 0C1h, 2Bh, 6, 0BCh, 24h
		db 50h, 0F7h, 2Eh, 3Ah, 25h, 0F7h, 3Eh, 38h, 25h, 29h, 6, 32h, 25h, 58h, 0F7h, 2Eh
		db 3Ch, 25h, 0F7h, 3Eh, 38h, 25h, 29h, 6, 36h, 25h, 8Bh, 0Eh, 0BCh, 24h, 0EBh, 4
		db 90h, 0EBh, 28h, 90h, 89h, 0Eh, 2Eh, 25h, 8Bh, 0F1h, 8Bh, 3Eh, 2Ch, 25h, 2Bh, 0F7h
		db 46h, 3, 3Eh, 0C2h, 24h, 8Eh, 6, 0B4h, 24h, 0A1h, 30h, 25h, 8Bh, 1Eh, 34h, 25h
		db 8Bh, 0Eh, 32h, 25h, 8Bh, 16h, 36h, 25h, 0E9h, 93h, 0FEh, 0C3h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A42C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword ptr  16h

		enter	0, 0
		push	ds
		push	bp
		push	si
		push	di
		cld
		mov	eax, [bp+arg_8]
		mov	dword_5C1E8, eax
		mov	ax, [bp+arg_C]
		mov	word_5C1E4, ax
		mov	ax, [bp+arg_E]
		mov	word_5C1E6, ax
		mov	eax, [bp+arg_10]
		mov	dword_5C266, eax
		mov	ax, [bp+arg_2]
		mov	word_5C1EC, ax
		mov	ax, [bp+arg_4]
		mov	word_5C1EE, ax
		mov	ax, [bp+arg_6]
		mov	word_5C1F0, ax
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		mov	di, 24B4h
		mov	cx, 6
		rep movsw
		mov	bx, word_5C1EC
		mov	si, word_5C1EE
		mov	di, word_5C1F0
		mov	ax, [bx+2]
		cmp	ax, [di+2]
		jl	short loc_2A48E
		jnz	short loc_2A48C
		mov	ax, [bx]
		cmp	ax, [di]
		jle	short loc_2A48E

loc_2A48C:
		xchg	di, bx

loc_2A48E:
		mov	ax, [bx+2]
		cmp	ax, [si+2]
		jl	short loc_2A4A0
		jnz	short loc_2A49E
		mov	ax, [bx]
		cmp	ax, [si]
		jle	short loc_2A4A0

loc_2A49E:
		xchg	si, bx

loc_2A4A0:
		mov	ax, [si+2]
		cmp	ax, [di+2]
		jl	short loc_2A4B2
		jnz	short loc_2A4B0
		mov	ax, [si]
		cmp	ax, [di]
		jle	short loc_2A4B2

loc_2A4B0:
		xchg	di, si

loc_2A4B2:
		mov	word_5C1EC, bx
		mov	word_5C1EE, si
		mov	word_5C1F0, di
		mov	ax, [bx+2]
		cmp	ax, word_5C1DE
		jle	short loc_2A4CA
		jmp	loc_2A6EB

loc_2A4CA:
		mov	ax, [di+2]
		cmp	ax, word_5C1DA
		jge	short loc_2A4D6
		jmp	loc_2A6EB

loc_2A4D6:
		mov	si, word_5C1D8
		mov	di, word_5C1DC
		mov	bx, word_5C1EC
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_5C242, ax
		mov	bx, word_5C1EE
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_5C244, ax
		mov	bx, word_5C1F0
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_5C246, ax
		or	ax, word_5C244
		or	ax, word_5C242
		mov	word_5C248, ax
		jz	short loc_2A55A
		nop
		nop
		mov	ax, word_5C242
		or	ax, ax
		jz	short loc_2A55A
		nop
		nop
		cmp	word_5C244, ax
		jnz	short loc_2A55A
		nop
		nop
		cmp	word_5C246, ax
		jnz	short loc_2A55A
		nop
		nop
		jmp	loc_2A6EB

loc_2A55A:
		mov	bx, 24EAh
		mov	si, word_5C1EC
		mov	di, word_5C1F0
		call	sub_2A6F1
		mov	bx, 2502h
		mov	si, word_5C1EE
		mov	di, word_5C1F0
		call	sub_2A6F1
		mov	bx, 24D2h
		mov	si, word_5C1EC
		mov	di, word_5C1EE
		call	sub_2A6F1
		mov	ax, word_5C1F2
		and	ax, word_5C222
		jz	short loc_2A599
		dec	word_5C1F8
		jg	short loc_2A599
		mov	word_5C1F2, 0

loc_2A599:
		cmp	word_5C20A, 0
		jnz	short loc_2A5D6
		mov	word_5C1F2, 1
		mov	word_5C20A, 1
		xor	eax, eax
		mov	dword_5C1FE, eax
		mov	dword_5C216, eax
		mov	si, word_5C1F0
		mov	ax, [si]
		shl	eax, 10h
		mov	ax, 8000h
		mov	dword_5C212, eax
		mov	al, 80h
		mov	ah, [si+6]
		mov	word_5C21A, ax
		mov	ah, [si+8]
		mov	word_5C21C, ax

loc_2A5D6:
		mov	ax, 24D2h
		mov	bx, 2502h
		mov	cx, 24EAh
		cmp	word_5C1F2, 0
		jz	short loc_2A618
		mov	edx, dword_5C1FE
		cmp	edx, dword_5C216
		jg	short loc_2A605
		mov	word_5C23A, ax
		mov	word_5C23E, bx
		mov	word_5C23C, cx
		mov	word_5C240, 0
		jmp	short loc_2A64E

loc_2A605:
		mov	word_5C23A, cx
		mov	word_5C23E, 0
		mov	word_5C23C, ax
		mov	word_5C240, bx
		jmp	short loc_2A64E

loc_2A618:
		mov	edx, dword_5C22E
		cmp	edx, dword_5C216
		jl	short loc_2A63A
		mov	word_5C23A, bx
		mov	word_5C23E, 0
		mov	word_5C23C, cx
		mov	word_5C240, 0
		jmp	short loc_2A64E

loc_2A63A:
		mov	word_5C23A, cx
		mov	word_5C23E, 0
		mov	word_5C23C, bx
		mov	word_5C240, 0

loc_2A64E:
		mov	ax, 4
		mov	si, 0BAh
		cmp	dword_5C266, 0
		jz	short loc_2A662
		mov	ax, 19Bh
		mov	si, 25Bh

loc_2A662:
		cmp	word_5C248, 0
		jz	short loc_2A66B
		mov	ax, si

loc_2A66B:
		mov	word_5C26A, ax
		mov	bx, word_5C1D6
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	word_5C1E0, ax
		mov	si, word_5C23A
		mov	di, word_5C23C
		mov	ax, si
		or	ax, di
		jz	short loc_2A6EB
		mov	bx, [si+2]
		shl	bx, 1
		add	bx, word_5C1D6
		mov	ax, [bx]
		mov	word_5C1E2, ax

loc_2A696:
		push	si
		push	di
		call	word ptr word_5C26A
		pop	di
		pop	si
		mov	ax, word_5C1E0
		add	word_5C1E2, ax
		mov	eax, [si+0Ch]
		add	[si+8], eax
		mov	ax, [si+14h]
		add	[si+10h], ax
		mov	ax, [si+16h]
		add	[si+12h], ax
		dec	word ptr [si+6]
		jg	short loc_2A6C8
		xor	si, si
		xchg	word_5C23E, si
		or	si, si
		jz	short loc_2A6EB

loc_2A6C8:
		mov	eax, [di+0Ch]
		add	[di+8], eax
		mov	ax, [di+14h]
		add	[di+10h], ax
		mov	ax, [di+16h]
		add	[di+12h], ax
		dec	word ptr [di+6]
		jg	short loc_2A696
		xor	di, di
		xchg	word_5C240, di
		or	di, di
		jnz	short loc_2A696

loc_2A6EB:
		pop	di
		pop	si
		pop	bp
		pop	ds
		leave
		retf
sub_2A42C		endp

; ----------------------------------------------------------------------

sub_2A6F1		proc near
		mov	word ptr [bx], 0
		mov	ax, [si]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bx+8], eax
		mov	al, 80h
		mov	ah, [si+6]
		mov	[bx+10h], ax
		mov	ah, [si+8]
		mov	[bx+12h], ax
		mov	ax, [si+2]
		mov	[bx+2], ax
		mov	cx, [di+2]
		mov	[bx+4], cx
		cmp	ax, word_5C1DE
		jle	short loc_2A727
		nop
		nop
		jmp	loc_2A7B4

loc_2A727:
		cmp	cx, word_5C1DA
		jge	short loc_2A732
		nop
		nop
		jmp	loc_2A7B4

loc_2A732:
		sub	cx, ax
		jz	short loc_2A7B4
		nop
		nop
		mov	word ptr [bx], 1
		mov	ax, [di+6]
		sub	ax, [si+6]
		shl	ax, 8
		cwd
		idiv	cx
		mov	[bx+14h], ax
		mov	ax, [di+8]
		sub	ax, [si+8]
		shl	ax, 8
		cwd
		idiv	cx
		mov	[bx+16h], ax
		mov	ax, [di]
		sub	ax, [si]
		shl	eax, 10h
		cdq
		movsx	ecx, cx
		idiv	ecx
		mov	[bx+0Ch], eax
		mov	ax, word_5C1DA
		mov	cx, [bx+2]
		cmp	ax, cx
		jle	short loc_2A79A
		nop
		nop
		mov	cx, ax
		sub	ax, [bx+2]
		cwde
		push	ax
		imul	dword ptr [bx+0Ch]
		add	[bx+8], eax
		pop	ax
		push	ax
		imul	word ptr [bx+14h]
		add	[bx+10h], ax
		pop	ax
		imul	word ptr [bx+16h]
		add	[bx+12h], ax

loc_2A79A:
		mov	ax, word_5C1DE
		mov	dx, [bx+4]
		cmp	ax, dx
		jge	short loc_2A7A8
		nop
		nop
		mov	dx, ax

loc_2A7A8:
		mov	[bx+2], cx
		mov	[bx+4], dx
		sub	dx, cx
sub_2A6F1		endp
seg060		ends
