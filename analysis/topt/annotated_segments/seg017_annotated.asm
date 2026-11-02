seg017		segment	para public 'CODE' use16
		assume cs:seg017
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Eh, 0E8h, 3Ah, 0FFh, 83h, 0C4h, 4, 5Dh, 0CBh, 0, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0DC		proc far

var_2		= byte ptr -2
arg_0		= dword ptr  6

		enter	2, 0
		call	sub_A07C
		mov	byte ptr cs:0Bh, 0
		mov	al, byte_4DCEC
		mov	cs:0Ah, al
		mov	byte_4DCEC, 0
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	[bp+var_2], al
		pushf
		push	cs
		push	72h
		call	sub_A5F0
		mov	ax, 1B31h
		mov	sp, ax
		mov	byte_4D298, 0
		mov	word_49F2E, 1
		mov	al, 1
		mov	byte_49F2D, al
		mov	byte_49F2C, al
		sti
		call	dword ptr [bp+arg_0]
		mov	word_49F30, ax
		mov	word_49F32, dx
		mov	byte ptr cs:0Bh, 0
		mov	al, cs:0Ah
		mov	byte_4DCEC, al
		mov	byte_49F34, 1

loc_A140:
		jmp	short loc_A140
sub_A0DC		endp

; START OF FUNCTION CHUNK FOR sub_A0DC
		mov	bx, 736Dh
		cmp	[bp+var_2], 0
		jz	short loc_A150
		nop
		nop
		mov	bx, 534Dh

loc_A150:
		mov	ax, 1209h
		pushf
		int	15h
		popf
		xor	ax, ax
		leave
		retf
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_A0DC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A193		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		mov	ax, [bp+arg_0]
		mov	ah, 25h
		lds	dx, [bp+arg_2]
		int	21h
		leave
		retf
sub_A193		endp

; ----------------------------------------------------------------------

sub_A1A3		proc far
		push	ds
		push	si
		mov	si, 8Bh
		mov	dl, 0Ah

loc_A1AA:
		mov	ah, 35h
		mov	al, dl
		int	21h
		mov	cs:[si], bx
		mov	cs:[si+2], es
		add	si, 4
		inc	dl
		cmp	si, 9Fh
		jbe	short loc_A1AA
		mov	si, 0A3h
		mov	dl, 70h

loc_A1C7:
		mov	ah, 35h
		mov	al, dl
		int	21h
		mov	cs:[si], bx
		mov	cs:[si+2], es
		add	si, 4
		inc	dl
		cmp	si, 0BFh
		jbe	short loc_A1C7
		push	cs
		push	225h
		push	0Ah
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	245h
		push	0Bh
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	265h
		push	0Ch
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	285h
		push	0Dh
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	2A5h
		push	0Eh
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	2C5h
		push	0Fh
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	2E5h
		push	70h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	305h
		push	71h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	325h
		push	72h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	345h
		push	73h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	365h
		push	74h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	385h
		push	75h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	3A5h
		push	76h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		push	cs
		push	3C5h
		push	77h
		push	cs
		call	near ptr sub_A193
		add	sp, 6
		pop	si
		pop	ds
		retf
sub_A1A3		endp

; ----------------------------------------------------------------------

sub_A298		proc far
		push	ds
		push	si
		mov	si, 8Bh
		mov	cl, 0Ah

loc_A29F:
		mov	ah, 35h
		mov	al, cl
		int	21h
		mov	bx, es
		mov	dx, cs
		cmp	bx, dx
		jnz	short loc_A2B8
		nop
		nop
		mov	ah, 25h
		mov	al, cl
		lds	dx, cs:[si]
		int	21h

loc_A2B8:
		add	si, 4
		inc	cl
		cmp	si, 9Fh
		jbe	short loc_A29F
		mov	si, 0A3h
		mov	cl, 70h

loc_A2C8:
		mov	ah, 35h
		mov	al, cl
		int	21h
		mov	bx, es
		mov	dx, cs
		cmp	bx, dx
		jnz	short loc_A2E1
		nop
		nop
		mov	ah, 25h
		mov	al, cl
		lds	dx, cs:[si]
		int	21h

loc_A2E1:
		add	si, 4
		inc	cl
		cmp	si, 0BFh
		jbe	short loc_A2C8
		pop	si
		pop	ds
		retf
sub_A298		endp

; ----------------------------------------------------------------------

sub_A2EF		proc far
		mov	al, cs:0Bh
		cbw
		retf
sub_A2EF		endp

; START OF FUNCTION CHUNK FOR sub_A2EF
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 8Bh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 8Bh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 8Fh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 8Fh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 93h, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 93h, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 97h, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 97h, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 9Bh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 9Bh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 9Fh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 9Fh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0A3h, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0A3h, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0A7h, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0A7h, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0ABh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0ABh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0AFh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0AFh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0B3h, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0B3h, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0B7h, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0B7h, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0BBh, 0, 2Eh
		db 0FEh, 6, 0Bh, 0, 9Ch, 2Eh, 0FFh, 1Eh, 0BBh, 0, 2Eh, 0FEh, 0Eh, 0Bh, 0, 0CFh
		db 2Eh, 80h, 3Eh, 0Bh, 0, 0, 74h, 7, 90h, 90h, 2Eh, 0FFh, 2Eh, 0BFh, 0, 2Eh
		db 0FEh, 6, 0Bh
		add	[si-0D2h], bl
		push	ds
		mov	di, 2E00h
; END OF FUNCTION CHUNK FOR sub_A2EF
seg017		ends
