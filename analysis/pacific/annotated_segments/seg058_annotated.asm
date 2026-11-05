seg058		segment	para public 'CODE' use16
		assume cs:seg058
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6Fh, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23584		proc far
		push	bp
		mov	bp, sp
		mov	byte_77698, 0
		mov	byte_77699, 0
		mov	byte_7769A, 0
		mov	byte_7769B, 0
		mov	byte_7769C, 0
		mov	byte_7769D, 2
		mov	byte_7769E, 0
		mov	byte_7769F, 0
		mov	byte_776A0, 0
		mov	byte_776A1, 0
		mov	byte_776B4, 0
		mov	byte_776B5, 0
		mov	byte_776B7, 0
		mov	byte_776B6, 0
		mov	byte_776B8, 0
		mov	byte_776B9, 0
		mov	byte_776BA, 0
		mov	byte_776BB, 0
		mov	byte_776BC, 1
		mov	byte_776BD, 0
		mov	byte_776BE, 0
		mov	byte_776BF, 0
		mov	byte_776C0, 0
		mov	byte_776C1, 0
		mov	byte_776C2, 0
		mov	byte_776C3, 0
		push	0
		push	63B0h
		call	SetReference16
		add	sp, 4
		push	0
		push	63B2h
		call	SetReference16
		add	sp, 4
		nop
		push	cs
		call	near ptr sub_2362F
		nop
		push	cs
		call	near ptr sub_2362F
		pop	bp
		retf
sub_23584		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2362F		proc far

var_14		= word ptr -14h
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	al, byte_776A6
		mov	byte_776B4, al
		mov	al, byte_776A7
		mov	byte_776B5, al
		mov	al, byte_776A8
		mov	byte_776B6, al
		mov	al, byte_776A9
		mov	byte_776B7, al
		mov	al, byte_776AA
		mov	byte_776B8, al
		mov	al, byte_776AB
		mov	byte_776B9, al
		mov	al, byte_776AC
		mov	byte_776BA, al
		mov	al, byte_776AD
		mov	byte_776BD, al
		mov	al, byte_776AE
		mov	byte_776BE, al
		mov	al, byte ptr dword_776AF
		mov	byte_776BF, al
		mov	al, byte_776B0
		mov	byte_776C0, al
		mov	al, byte_776B1
		mov	byte_776C1, al
		mov	al, byte_776B2
		mov	byte_776C2, al
		mov	al, byte ptr dword_776B3
		mov	byte_776C3, al
		mov	al, 0
		mov	byte ptr dword_776B3, al
		mov	byte_776B2, al
		mov	byte_776B1, al
		mov	byte ptr dword_776AF, al
		mov	byte_776AE, al
		mov	byte_776AD, al
		mov	byte_776AC, al
		mov	byte_776AB, al
		mov	byte_776AA, al
		mov	byte_776A9, al
		mov	byte_776A8, al
		mov	byte_776A7, al
		mov	byte_776A6, al
		mov	byte_776B0, al
		cmp	word_7CADA, 0
		jz	short loc_236E4
		push	1
		lea	ax, [bp+var_14]
		push	ax
		mov	ax, word_7CADA
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_8]
		mov	dword_776A2, eax
		jmp	short loc_236ED

loc_236E4:
		mov	dword_776A2, 0

loc_236ED:
		mov	al, byte_77698
		mov	ah, 0
		or	ax, ax
		jnz	short loc_23750
		cmp	word_7CAE0, 0
		jnz	short loc_23704
		cmp	word_7CADC, 0
		jz	short loc_23723

loc_23704:
		mov	ax, word_7CADC
		mov	[bp+var_2], ax
		push	ax
		push	63B0h
		call	SetReference16
		add	sp, 4
		push	0
		push	63ACh
		call	SetReference16
		add	sp, 4

loc_23723:
		cmp	word_7CAE2, 0
		jnz	short loc_23731
		cmp	word_7CADE, 0
		jz	short loc_23750

loc_23731:
		mov	ax, word_7CADE
		mov	[bp+var_4], ax
		push	ax
		push	63B2h
		call	SetReference16
		add	sp, 4
		push	0
		push	63AEh
		call	SetReference16
		add	sp, 4

loc_23750:
		leave
		retf
sub_2362F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23752		proc far
		push	bp
		mov	bp, sp
		mov	word_7CADA, 0
		mov	dword_776A2, 0
		mov	word_7CADC, 0
		mov	word_7CADE, 0
		mov	word_7CAE0, 0
		mov	word_7CAE2, 0
		pop	bp
		retf
sub_23752		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2377E		proc far
		push	bp
		mov	bp, sp
		push	63B2h
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	63B0h
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	63AEh
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	63ACh
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	63AAh
		call	WeakRef_InvalidateIfSet
		pop	cx
		pop	bp
		retf
sub_2377E		endp
seg058		ends
