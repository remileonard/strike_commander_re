seg016		segment	para public 'CODE' use16
		assume cs:seg016
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ch, 3, 0, 0, 83h, 0C4h, 2

loc_9ED7:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9EDB		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	al, byte_49F22
		mov	ah, 0
		or	ax, ax
		jz	short loc_9EEE
		cmp	byte_49F2D, 0
		jz	short loc_9EF5

loc_9EEE:
		call	dword ptr [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf

loc_9EF5:
		mov	al, byte_4F674
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jz	short loc_9F1F
		mov	byte_49F23, 1
		or	byte_4F674, 2
		push	6C30h
		call	sub_35F71
		add	sp, 2
		jmp	short loc_9F24

loc_9F1F:
		mov	byte_49F23, 0

loc_9F24:
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_A0DC
		add	sp, 4
		pop	bp
		retf
sub_9EDB		endp

; START OF FUNCTION CHUNK FOR sub_9EDB
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_9EDB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9F36		proc far
		push	bp
		mov	bp, sp
		mov	al, byte_49F2C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9F44
		pop	bp
		retf

loc_9F44:
		cmp	byte_49F2D, 0
		jz	short loc_9F61
		call	sub_A2EF
		or	ax, ax
		jz	short loc_9F61
		cmp	word_49F2E, 0
		jle	short loc_9F5F
		dec	word_49F2E

loc_9F5F:
		pop	bp
		retf

loc_9F61:
		dec	word_49F2E
		cmp	word_49F2E, 0
		jle	short loc_9F6E
		pop	bp
		retf

loc_9F6E:
		cmp	byte_49F2D, 0
		jz	short loc_9F91
		mov	word_49F2E, 5
		mov	byte_49F2D, 0
		cmp	byte_49F34, 0
		jz	short loc_9F8F
		mov	al, 0
		mov	byte_49F2C, al
		mov	byte_49F34, al

loc_9F8F:
		jmp	short loc_9F9C

loc_9F91:
		mov	word_49F2E, 1
		mov	byte_49F2D, 1

loc_9F9C:
		mov	ax, seg seg003
		mov	es, ax
		mov	byte ptr es:3C6h, 1
		pop	bp
		retf
sub_9F36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FA9		proc far
		push	bp
		mov	bp, sp
		mov	al, byte_49F22
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FD6
		mov	byte_49F22, 1
		push	large 78h
		push	seg seg016
		push	large offset sub_9F36
		push	6D9Ch
		call	Stopwatch_RegisterTickModuleVariant_44C84
		add	sp, 0Ah
		mov	word_4EF02, ax
		call	sub_A1A3

loc_9FD6:
		pop	bp
		retf
sub_9FA9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FD8		proc far
		push	bp
		mov	bp, sp
		cmp	byte_49F22, 0
		jz	short loc_A00C
		mov	al, byte_49F2D
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FF0
		nop
		push	cs
		call	near ptr sub_A07C

loc_9FF0:
		mov	al, 0
		mov	byte_49F2C, al
		mov	byte_49F22, al
		push	word_4EF02
		push	6D9Ch
		call	Stopwatch_UnregisterTickModule_44CC1
		add	sp, 4
		call	sub_A298

loc_A00C:
		pop	bp
		retf
sub_9FD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A00E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A03F
		mov	word ptr [si], 1544h
		push	cs
		call	near ptr sub_9FD8
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_A03F
		push	si
		call	sub_39C
		add	sp, 2

loc_A03F:
		pop	di
		pop	si
		pop	bp
		retf
sub_A00E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A043		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr sub_9FD8
		pop	si
		pop	bp
		retf
sub_A043		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A051		proc far
		push	bp
		mov	bp, sp
		mov	al, byte_49F2C
		pop	bp
		retf
sub_A051		endp

; START OF FUNCTION CHUNK FOR sub_A051
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_A051

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A05B		proc far
		push	bp
		mov	bp, sp
		mov	eax, dword ptr word_49F30
		shld	edx, eax, 10h
		pop	bp
		retf
sub_A05B		endp

; START OF FUNCTION CHUNK FOR sub_A05B
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_A05B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A06B		proc far
		push	bp
		mov	bp, sp
		cmp	byte_49F2D, 0
		jz	short loc_A07A
		mov	byte_49F2C, 0

loc_A07A:
		pop	bp
		retf
sub_A06B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A07C		proc far
		push	bp
		mov	bp, sp
		mov	al, byte_49F2D
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A0A9
		jmp	short loc_A08A

loc_A08A:
		push	cs
		call	near ptr sub_A051
		or	al, al
		jnz	short loc_A08A
		cmp	byte_49F23, 0
		jz	short loc_A0A9
		and	byte_4F674, 0FDh
		push	6C30h
		call	sub_35F71
		add	sp, 2

loc_A0A9:
		pop	bp
		retf
sub_A07C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0AB		proc far
		push	bp
		mov	bp, sp
		mov	word_4EEFE, 1B4h
		mov	ax, word_4D392
		mov	word_4EF00, ax
		mov	word_4D392, 651Eh
		mov	word_4EEFE, 1544h
		pop	bp
		retf
sub_A0AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0C8		proc far
		push	bp
		mov	bp, sp
		push	2
		push	651Eh
sub_A0C8		endp
seg016		ends
