seg046		segment	para public 'CODE' use16
		assume cs:seg046
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Fh, 89h, 0D8h, 0FEh

loc_1CD34:
		db 5Fh, 5Eh, 0C9h, 0CBh, 8Bh, 44h, 10h, 0C1h, 0E8h, 8, 8Bh, 5Ch, 12h, 0C1h, 0EBh, 8
		db 8Bh, 4Dh, 10h, 0C1h, 0E9h, 8, 8Bh, 55h, 12h, 0C1h, 0EAh, 8, 8Bh, 74h, 0Ah, 8Bh
		db 7Dh, 0Ah, 87h, 0F7h, 2Bh, 0F7h, 46h, 3, 3Eh, 38h, 36h, 8Eh, 6, 2Ah, 36h, 89h
		db 36h, 0A0h, 36h, 50h, 52h, 0Fh, 0B4h, 36h, 3Eh, 36h, 3, 0F0h, 0A1h, 3Ah, 36h, 0F7h
		db 0E3h, 3, 0F0h, 5Ah, 2Bh, 0D3h, 8Bh, 0DAh, 8Bh, 16h, 3Ah, 36h, 79h, 6, 90h, 90h
		db 0F7h, 0DAh, 0F7h, 0DBh, 58h, 2Bh, 0C8h, 8Bh, 0C1h, 0B9h, 1, 0, 79h, 6, 90h, 90h
		db 0F7h, 0D9h, 0F7h, 0D8h, 3Bh, 0C3h, 7Eh, 3, 93h, 87h, 0CAh, 89h, 1Eh, 0B4h, 36h, 0A3h
		db 0B8h, 36h, 89h, 16h, 0B6h, 36h, 89h, 0Eh, 0BAh, 36h, 8Bh, 0D3h, 8Bh, 0Eh, 0A0h, 36h
		db 55h, 33h, 0DBh, 8Bh, 0E9h, 64h, 8Ah, 4, 3Ch, 0FFh, 74h, 3, 26h, 88h, 5, 47h
		db 49h, 7Eh, 25h, 0A1h, 0B8h, 36h, 3, 1Eh, 0B4h, 36h, 7Eh, 0E9h, 3, 36h, 0B6h, 36h
		db 2Bh, 0D0h, 7Eh, 6, 2Bh, 0DDh, 7Eh, 0DDh, 0EBh, 0F2h, 3, 16h, 0B4h, 36h, 3, 36h
		db 0BAh, 36h, 2Bh, 0DDh, 7Eh, 0CFh, 0EBh, 0E4h, 5Dh, 0C3h, 8Bh, 44h, 0Ah, 3Bh, 6, 32h
		db 36h, 0Fh, 8Fh, 0ABh, 0, 8Bh, 4Dh, 0Ah, 3Bh, 0Eh, 2Eh, 36h, 0Fh, 8Ch, 0A0h, 0
		db 8Bh, 0D1h, 2Bh, 0D0h, 42h, 89h, 16h, 0AEh, 36h, 8Bh, 54h, 10h, 0C1h, 0EAh, 8, 89h
		db 16h, 0A6h, 36h, 8Bh, 55h, 10h, 0C1h, 0EAh, 8, 89h, 16h, 0A8h, 36h, 2Bh, 16h, 0A6h
		db 36h, 89h, 16h, 0B0h, 36h, 8Bh, 54h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 0AAh, 36h, 8Bh
		db 55h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 0ACh, 36h, 2Bh, 16h, 0AAh, 36h, 89h, 16h, 0B2h
		db 36h, 3Bh, 6, 2Eh, 36h, 7Dh, 27h, 90h, 90h, 8Bh, 1Eh, 2Eh, 36h, 2Bh, 0D8h, 53h
		db 8Bh, 0C3h, 0F7h, 2Eh, 0B0h, 36h, 0F7h, 3Eh, 0AEh, 36h, 1, 6, 0A6h, 36h, 58h, 0F7h
		db 2Eh, 0B2h, 36h, 0F7h, 3Eh, 0AEh, 36h, 1, 6, 0AAh, 36h, 0A1h, 2Eh, 36h, 0A3h, 0A2h
		db 36h, 3Bh, 0Eh, 32h, 36h, 7Eh, 2Ch, 90h, 90h, 8Bh, 0C1h, 2Bh, 6, 32h, 36h, 50h
		db 0F7h, 2Eh, 0B0h, 36h, 0F7h, 3Eh, 0AEh, 36h, 29h, 6, 0A8h, 36h, 58h, 0F7h, 2Eh, 0B2h
		db 36h, 0F7h, 3Eh, 0AEh, 36h, 29h, 6, 0ACh, 36h, 8Bh, 0Eh, 32h, 36h, 0EBh, 4, 90h
		db 0EBh, 28h, 90h, 89h, 0Eh, 0A4h, 36h, 8Bh, 0F1h, 8Bh, 3Eh, 0A2h, 36h, 2Bh, 0F7h, 46h
		db 3, 3Eh, 38h, 36h, 8Eh, 6, 2Ah, 36h, 0A1h, 0A6h, 36h, 8Bh, 1Eh, 0AAh, 36h, 8Bh
		db 0Eh, 0A8h, 36h, 8Bh, 16h, 0ACh, 36h, 0E9h, 95h, 0FEh, 0C3h, 8Bh, 44h, 10h, 0C1h, 0E8h
		db 8, 8Bh, 5Ch, 12h, 0C1h, 0EBh, 8, 8Bh, 4Dh, 10h, 0C1h, 0E9h, 8, 8Bh, 55h, 12h
		db 0C1h, 0EAh, 8, 8Bh, 74h, 0Ah, 8Bh, 7Dh, 0Ah, 87h, 0F7h, 2Bh, 0F7h, 46h, 83h, 0FEh
		db 0, 7Fh, 3, 90h, 90h, 90h, 3, 3Eh, 38h, 36h, 8Eh, 6, 2Ah, 36h, 89h, 36h
		db 0A0h, 36h, 50h, 52h, 0Fh, 0B4h, 36h, 3Eh, 36h, 3, 0F0h, 0A1h, 3Ah, 36h, 0F7h, 0E3h
		db 3, 0F0h, 5Ah, 2Bh, 0D3h, 8Bh, 0DAh, 8Bh, 16h, 3Ah, 36h, 79h, 6, 90h, 90h, 0F7h
		db 0DAh, 0F7h, 0DBh, 58h, 2Bh, 0C8h, 8Bh, 0C1h, 0B9h, 1, 0, 79h, 6, 90h, 90h, 0F7h
		db 0D9h, 0F7h, 0D8h, 3Bh, 0C3h, 7Eh, 3, 93h, 87h, 0CAh, 89h, 1Eh, 0B4h, 36h, 0A3h, 0B8h
		db 36h, 89h, 16h, 0B6h, 36h, 89h, 0Eh, 0BAh, 36h, 8Bh, 0D3h, 8Bh, 0Eh, 0A0h, 36h, 0Fh
		db 0B5h, 1Eh, 0BCh, 36h, 55h, 33h, 0EDh, 0B4h, 0FFh, 3, 2Eh, 0B4h, 36h, 64h, 8Ah, 4
		db 3Ah, 0C4h, 74h, 5, 65h, 0D7h, 26h, 88h, 5, 47h, 49h, 7Eh, 1Ch, 0Bh, 0EDh, 7Eh
		db 0E8h, 2Bh, 2Eh, 0A0h, 36h, 3, 36h, 0B6h, 36h, 2Bh, 16h, 0B8h, 36h, 7Fh, 0EEh, 3
		db 16h, 0B4h, 36h, 3, 36h, 0BAh, 36h, 0EBh, 0E4h, 5Dh, 0C3h, 8Bh, 44h, 0Ah, 3Bh, 6
		db 32h, 36h, 0Fh, 8Fh, 0ABh, 0, 8Bh, 4Dh, 0Ah, 3Bh, 0Eh, 2Eh, 36h, 0Fh, 8Ch, 0A0h
		db 0, 8Bh, 0D1h, 2Bh, 0D0h, 42h, 89h, 16h, 0AEh, 36h, 8Bh, 54h, 10h, 0C1h, 0EAh, 8
		db 89h, 16h, 0A6h, 36h, 8Bh, 55h, 10h, 0C1h, 0EAh, 8, 89h, 16h, 0A8h, 36h, 2Bh, 16h
		db 0A6h, 36h, 89h, 16h, 0B0h, 36h, 8Bh, 54h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 0AAh, 36h
		db 8Bh, 55h, 12h, 0C1h, 0EAh, 8, 89h, 16h, 0ACh, 36h, 2Bh, 16h, 0AAh, 36h, 89h, 16h
		db 0B2h, 36h, 3Bh, 6, 2Eh, 36h, 7Dh, 27h, 90h, 90h, 8Bh, 1Eh, 2Eh, 36h, 2Bh, 0D8h
		db 53h, 8Bh, 0C3h, 0F7h, 2Eh, 0B0h, 36h, 0F7h, 3Eh, 0AEh, 36h, 1, 6, 0A6h, 36h, 58h
		db 0F7h, 2Eh, 0B2h, 36h, 0F7h, 3Eh, 0AEh, 36h, 1, 6, 0AAh, 36h, 0A1h, 2Eh, 36h, 0A3h
		db 0A2h, 36h, 3Bh, 0Eh, 32h, 36h, 7Eh, 2Ch, 90h, 90h, 8Bh, 0C1h, 2Bh, 6, 32h, 36h
		db 50h, 0F7h, 2Eh, 0B0h, 36h, 0F7h, 3Eh, 0AEh, 36h, 29h, 6, 0A8h, 36h, 58h, 0F7h, 2Eh
		db 0B2h, 36h, 0F7h, 3Eh, 0AEh, 36h, 29h, 6, 0ACh, 36h, 8Bh, 0Eh, 32h, 36h, 0EBh, 4
		db 90h, 0EBh, 28h, 90h, 89h, 0Eh, 0A4h, 36h, 8Bh, 0F1h, 8Bh, 3Eh, 0A2h, 36h, 2Bh, 0F7h
		db 46h, 3, 3Eh, 38h, 36h, 8Eh, 6, 2Ah, 36h, 0A1h, 0A6h, 36h, 8Bh, 1Eh, 0AAh, 36h
		db 8Bh, 0Eh, 0A8h, 36h, 8Bh, 16h, 0ACh, 36h, 0E9h, 93h, 0FEh, 0C3h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D070		proc far

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
		mov	dword_4C01E, eax
		mov	ax, [bp+arg_C]
		mov	word_4C01A, ax
		mov	ax, [bp+arg_E]
		mov	word_4C01C, ax
		mov	eax, [bp+arg_10]
		mov	dword_4C09C, eax
		mov	ax, [bp+arg_2]
		mov	word_4C022, ax
		mov	ax, [bp+arg_4]
		mov	word_4C024, ax
		mov	ax, [bp+arg_6]
		mov	word_4C026, ax
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		mov	di, 362Ah
		mov	cx, 6
		rep movsw
		mov	bx, word_4C022
		mov	si, word_4C024
		mov	di, word_4C026
		mov	ax, [bx+2]
		cmp	ax, [di+2]
		jl	short loc_1D0D2
		jnz	short loc_1D0D0
		mov	ax, [bx]
		cmp	ax, [di]
		jle	short loc_1D0D2

loc_1D0D0:
		xchg	di, bx

loc_1D0D2:
		mov	ax, [bx+2]
		cmp	ax, [si+2]
		jl	short loc_1D0E4
		jnz	short loc_1D0E2
		mov	ax, [bx]
		cmp	ax, [si]
		jle	short loc_1D0E4

loc_1D0E2:
		xchg	si, bx

loc_1D0E4:
		mov	ax, [si+2]
		cmp	ax, [di+2]
		jl	short loc_1D0F6
		jnz	short loc_1D0F4
		mov	ax, [si]
		cmp	ax, [di]
		jle	short loc_1D0F6

loc_1D0F4:
		xchg	di, si

loc_1D0F6:
		mov	word_4C022, bx
		mov	word_4C024, si
		mov	word_4C026, di
		mov	ax, [bx+2]
		cmp	ax, word_4C014
		jle	short loc_1D10E
		jmp	loc_1D32F

loc_1D10E:
		mov	ax, [di+2]
		cmp	ax, word_4C010
		jge	short loc_1D11A
		jmp	loc_1D32F

loc_1D11A:
		mov	si, word_4C00E
		mov	di, word_4C012
		mov	bx, word_4C022
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_4C078, ax
		mov	bx, word_4C024
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_4C07A, ax
		mov	bx, word_4C026
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_4C07C, ax
		or	ax, word_4C07A
		or	ax, word_4C078
		mov	word_4C07E, ax
		jz	short loc_1D19E
		nop
		nop
		mov	ax, word_4C078
		or	ax, ax
		jz	short loc_1D19E
		nop
		nop
		cmp	word_4C07A, ax
		jnz	short loc_1D19E
		nop
		nop
		cmp	word_4C07C, ax
		jnz	short loc_1D19E
		nop
		nop
		jmp	loc_1D32F

loc_1D19E:
		mov	bx, 3660h
		mov	si, word_4C022
		mov	di, word_4C026
		call	sub_1D335
		mov	bx, 3678h
		mov	si, word_4C024
		mov	di, word_4C026
		call	sub_1D335
		mov	bx, 3648h
		mov	si, word_4C022
		mov	di, word_4C024
		call	sub_1D335
		mov	ax, word_4C028
		and	ax, word_4C058
		jz	short loc_1D1DD
		dec	word_4C02E
		jg	short loc_1D1DD
		mov	word_4C028, 0

loc_1D1DD:
		cmp	word_4C040, 0
		jnz	short loc_1D21A
		mov	word_4C028, 1
		mov	word_4C040, 1
		xor	eax, eax
		mov	dword_4C034, eax
		mov	dword_4C04C, eax
		mov	si, word_4C026
		mov	ax, [si]
		shl	eax, 10h
		mov	ax, 8000h
		mov	dword_4C048, eax
		mov	al, 80h
		mov	ah, [si+6]
		mov	word_4C050, ax
		mov	ah, [si+8]
		mov	word_4C052, ax

loc_1D21A:
		mov	ax, 3648h
		mov	bx, 3678h
		mov	cx, 3660h
		cmp	word_4C028, 0
		jz	short loc_1D25C
		mov	edx, dword_4C034
		cmp	edx, dword_4C04C
		jg	short loc_1D249
		mov	word_4C070, ax
		mov	word_4C074, bx
		mov	word_4C072, cx
		mov	word_4C076, 0
		jmp	short loc_1D292

loc_1D249:
		mov	word_4C070, cx
		mov	word_4C074, 0
		mov	word_4C072, ax
		mov	word_4C076, bx
		jmp	short loc_1D292

loc_1D25C:
		mov	edx, dword_4C064
		cmp	edx, dword_4C04C
		jl	short loc_1D27E
		mov	word_4C070, bx
		mov	word_4C074, 0
		mov	word_4C072, cx
		mov	word_4C076, 0
		jmp	short loc_1D292

loc_1D27E:
		mov	word_4C070, cx
		mov	word_4C074, 0
		mov	word_4C072, bx
		mov	word_4C076, 0

loc_1D292:
		mov	ax, 8
		mov	si, 0BEh
		cmp	dword_4C09C, 0
		jz	short loc_1D2A6
		mov	ax, 19Fh
		mov	si, 25Fh

loc_1D2A6:
		cmp	word_4C07E, 0
		jz	short loc_1D2AF
		mov	ax, si

loc_1D2AF:
		mov	word_4C0A0, ax
		mov	bx, word_4C00C
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	word_4C016, ax
		mov	si, word_4C070
		mov	di, word_4C072
		mov	ax, si
		or	ax, di
		jz	short loc_1D32F
		mov	bx, [si+2]
		shl	bx, 1
		add	bx, word_4C00C
		mov	ax, [bx]
		mov	word_4C018, ax

loc_1D2DA:
		push	si
		push	di
		call	word ptr word_4C0A0
		pop	di
		pop	si
		mov	ax, word_4C016
		add	word_4C018, ax
		mov	eax, [si+0Ch]
		add	[si+8], eax
		mov	ax, [si+14h]
		add	[si+10h], ax
		mov	ax, [si+16h]
		add	[si+12h], ax
		dec	word ptr [si+6]
		jg	short loc_1D30C
		xor	si, si
		xchg	word_4C074, si
		or	si, si
		jz	short loc_1D32F

loc_1D30C:
		mov	eax, [di+0Ch]
		add	[di+8], eax
		mov	ax, [di+14h]
		add	[di+10h], ax
		mov	ax, [di+16h]
		add	[di+12h], ax
		dec	word ptr [di+6]
		jg	short loc_1D2DA
		xor	di, di
		xchg	word_4C076, di
		or	di, di
		jnz	short loc_1D2DA

loc_1D32F:
		pop	di
		pop	si
		pop	bp
		pop	ds
		leave
		retf
sub_1D070		endp

; ----------------------------------------------------------------------

sub_1D335		proc near
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
		cmp	ax, word_4C014
		jle	short loc_1D36B
		nop
		nop
		jmp	loc_1D3F8

loc_1D36B:
		cmp	cx, word_4C010
		jge	short loc_1D376
		nop
		nop
		jmp	loc_1D3F8

loc_1D376:
		sub	cx, ax
		jz	short loc_1D3F8
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
		mov	ax, word_4C010
		mov	cx, [bx+2]
		cmp	ax, cx
		jle	short loc_1D3DE
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

loc_1D3DE:
		mov	ax, word_4C014
		mov	dx, [bx+4]
		cmp	ax, dx
		jge	short loc_1D3EC
		nop
		nop
		mov	dx, ax

loc_1D3EC:
		mov	[bx+2], cx
sub_1D335		endp

; START OF FUNCTION CHUNK FOR sub_1D335
		db 89h
; END OF FUNCTION CHUNK FOR sub_1D335
seg046		ends
