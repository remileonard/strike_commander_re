seg007		segment	para public 'CODE' use16
		assume cs:seg007
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 68h, 0AAh, 52h, 0Eh, 0E8h, 8Ah, 0FCh, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_547A		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_59F32
		or	ax, ax
		jz	short loc_548B
		cmp	ax, 1
		jz	short loc_5493
		jmp	short loc_549B

loc_548B:
		mov	word_59F30, 3F8h
		jmp	short loc_54A9

loc_5493:
		mov	word_59F30, 2F8h
		jmp	short loc_54A9

loc_549B:
		push	264h
		call	CRT_Msg_NullPtrAssign
		pop	cx
		xor	ax, ax
		jmp	loc_5533

loc_54A9:
		mov	dx, word_59F30
		inc	dx
		mov	al, 0
		out	dx, al
		push	seg seg007
		push	offset loc_56D7
		mov	ax, 0Ch
		sub	ax, word_59F32
		push	ax
		call	CRT_SetVect
		add	sp, 6
		mov	dx, word_59F30
		add	dx, 3
		mov	al, 80h
		out	dx, al
		mov	eax, 1C200h
		cdq
		idiv	dword_59F38
		mov	bx, ax
		mov	al, bl
		and	al, 0FFh
		mov	dx, word_59F30
		out	dx, al
		inc	dx
		mov	ax, bx
		and	ax, 0FF00h
		shr	ax, 8
		out	dx, al
		mov	dx, word_59F30
		add	dx, 3
		mov	al, 3
		out	dx, al
		nop
		push	cs
		call	near ptr sub_560B
		mov	dx, word_59F30
		add	dx, 4
		mov	al, 9
		out	dx, al
		mov	dx, word_59F30
		inc	dx
		mov	al, 5
		out	dx, al
		mov	dx, word_59F30
		inc	dx
		out	dx, al
		mov	ax, 10h
		mov	cl, byte ptr word_59F32
		sar	ax, cl
		not	al
		push	ax
		mov	al, byte_5F10B
		pop	dx
		and	al, dl
		mov	dx, 21h
		out	dx, al
		mov	ax, 1

loc_5533:
		pop	bp
		retf
sub_547A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5535		proc far
		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		sub	ax, word_59F32
		push	ax
		call	CRT_GetVect
		pop	cx
		mov	word_5F10E, dx
		mov	word_5F10C, ax
		mov	dx, 21h
		in	al, dx
		mov	byte_5F10B, al
		mov	dx, word_59F30
		add	dx, 3
		in	al, dx
		mov	byte_5F108, al
		mov	dx, word_59F30
		add	dx, 3
		mov	al, 80h
		out	dx, al
		mov	dx, word_59F30
		in	al, dx
		mov	byte_5F106, al
		inc	dx
		in	al, dx
		mov	byte_5F107, al
		mov	dx, word_59F30
		add	dx, 3
		mov	al, byte_5F108
		and	al, 7Fh
		out	dx, al
		mov	dx, word_59F30
		inc	dx
		in	al, dx
		mov	byte_5F109, al
		mov	dx, word_59F30
		add	dx, 4
		in	al, dx
		mov	byte_5F10A, al
		mov	word_59F68, 1
		mov	ax, 1
		pop	bp
		retf
sub_5535		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55A2		proc far
		push	bp
		mov	bp, sp
		cmp	word_59F68, 0
		jz	short loc_5609
		mov	al, byte_5F10B
		or	al, 18h
		mov	dx, 21h
		out	dx, al
		mov	dx, word_59F30
		add	dx, 3
		mov	al, 80h
		out	dx, al
		mov	dx, word_59F30
		mov	al, byte_5F106
		out	dx, al
		inc	dx
		mov	al, byte_5F107
		out	dx, al
		mov	dx, word_59F30
		add	dx, 3
		mov	al, byte_5F108
		out	dx, al
		mov	dx, word_59F30
		inc	dx
		mov	al, byte_5F109
		out	dx, al
		mov	dx, word_59F30
		add	dx, 4
		mov	al, byte_5F10A
		out	dx, al
		cli
		push	large word_5F10C
		mov	ax, 0Ch
		sub	ax, word_59F32
		push	ax
		call	CRT_SetVect
		add	sp, 6
		mov	dx, 21h
		mov	al, byte_5F10B
		out	dx, al
		sti

loc_5609:
		pop	bp
		retf
sub_55A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_560B		proc far
		push	bp
		mov	bp, sp
		cli
		mov	word_59F6A, 0
		mov	word_59F6E, 0
		mov	word_59F6C, 0
		mov	ax, 53F0h
		mov	word_59F74, ax
		mov	word_59F72, ax
		sti
		pop	bp
		retf
sub_560B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_562D		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ax, word_59F76
		cmp	ax, word_59F78
		jnz	short loc_5645
		cmp	word_59F70, 0
		jnz	short loc_5645
		mov	ax, 0FFF8h
		jmp	short loc_5669

loc_5645:
		mov	bx, word_59F76
		mov	al, [bp+arg_0]
		mov	[bx], al
		inc	word_59F76
		mov	word_59F70, 0
		cmp	word_59F76, 5822h
		jnz	short loc_5666
		mov	word_59F76, 57F0h

loc_5666:
		mov	ax, 1

loc_5669:
		pop	bp
		retf
sub_562D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_566B		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_59F6E, 0
		jnz	short loc_56AF
		cmp	word_59F6C, 0
		jnz	short loc_56AF
		mov	ax, word_59F72
		cmp	ax, word_59F74
		jnz	short loc_568D
		mov	ax, 0FFFFh
		jmp	short loc_56D5

loc_568D:
		mov	bx, word_59F74
		mov	al, [bx]
		mov	ah, 0
		mov	[bp+var_2], ax
		inc	word_59F74
		cmp	word_59F74, 57F0h
		jnz	short loc_56AA
		mov	word_59F74, 53F0h

loc_56AA:
		mov	ax, [bp+var_2]
		jmp	short loc_56D5

loc_56AF:
		cmp	word_59F6E, 0
		jz	short loc_56BC
		mov	word_59F6E, 0

loc_56BC:
		cmp	word_59F6C, 0
		jz	short loc_56D2
		push	283h
		call	sub_9D78
		pop	cx
		mov	word_59F6C, 0

loc_56D2:
		mov	ax, 0FFFEh

loc_56D5:
		leave
		retf
sub_566B		endp

; START OF FUNCTION CHUNK FOR sub_566B
		db 50h, 53h, 51h, 52h, 6, 1Eh, 56h, 57h, 55h, 0BDh, 0D2h, 59h, 8Eh, 0DDh, 8Bh, 0ECh
		db 83h, 0ECh, 4, 0E9h, 0ABh, 0, 8Bh, 5Eh, 0FEh, 83h, 0FBh, 6, 76h, 3, 0E9h, 0A0h
		db 0, 0D1h, 0E3h, 2Eh, 0FFh, 0A7h, 4Dh, 3, 8Bh, 16h, 10h, 2, 83h, 0C2h, 5, 0ECh
		db 0B4h, 0, 25h, 0Eh, 0, 0A3h, 4Ah, 2, 0Bh, 0C0h, 75h, 3, 0E9h, 82h, 0, 0C7h
		db 6, 4Eh, 2, 1, 0, 0EBh, 7Ah, 8Bh, 16h, 10h, 2, 0ECh, 8Bh, 1Eh, 52h, 2
		db 88h, 7, 0FFh, 6, 52h, 2, 0A1h, 52h, 2, 3Bh, 6, 54h, 2, 75h, 6, 0C7h
		db 6, 4Ch, 2, 1, 0, 81h, 3Eh, 52h, 2, 0F0h, 57h, 75h, 54h, 0C7h, 6, 52h
		db 2, 0F0h, 53h, 0EBh, 4Ch, 8Bh, 1Eh, 58h, 2, 8Ah, 7, 0B4h, 0, 89h, 46h, 0FCh
		db 0FFh, 6, 58h, 2, 81h, 3Eh, 58h, 2, 22h, 58h, 75h, 6, 0C7h, 6, 58h, 2
		db 0F0h, 57h, 0A1h, 58h, 2, 3Bh, 6, 56h, 2, 75h, 14h, 8Bh, 16h, 10h, 2, 42h
		db 0B0h, 5, 0EEh, 8Bh, 16h, 10h, 2, 42h, 0EEh, 0C7h, 6, 50h, 2, 1, 0, 8Bh
		db 16h, 10h, 2, 8Ah, 46h, 0FCh, 0EEh, 0EBh, 8, 8Bh, 16h, 10h, 2, 83h, 0C2h, 6
		db 0ECh, 8Bh, 16h, 10h, 2, 83h, 0C2h, 2, 0ECh, 0B4h, 0, 89h, 46h, 0FEh, 0A9h, 1
		db 0, 75h, 3, 0E9h, 40h, 0FFh, 0BAh, 20h, 0, 0B0h, 20h, 0EEh, 0C9h, 5Fh, 5Eh, 1Fh
		db 7, 5Ah, 59h, 5Bh, 58h, 0CFh, 20h
		add	bp, [bx+si]
; END OF FUNCTION CHUNK FOR sub_566B
seg007		ends
