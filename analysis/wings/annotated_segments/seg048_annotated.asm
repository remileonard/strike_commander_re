seg048		segment	para public 'CODE' use16
		assume cs:seg048
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 30h, 83h, 0C4h, 4, 0EBh, 0

loc_21057:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2105B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2Dh], 0
		mov	word ptr [si+54h], 0
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		mov	al, byte ptr word_5BF28
		mov	[si+51h], al
		mov	al, byte ptr word_5BF2A
		mov	[si+52h], al
		mov	al, byte ptr word_5BF24
		mov	[si+53h], al
		mov	al, byte ptr word_5BF26
		mov	[si+4Fh], al
		mov	al, byte ptr word_5BF20
		mov	[si+50h], al
		mov	word ptr [si+1Fh], 0Bh
		mov	word ptr [si+21h], 8
		mov	ax, [si+1Fh]
		add	ax, 0FFFEh
		mov	[si+45h], ax
		mov	ax, [si+21h]
		add	ax, 0FFFEh
		mov	[si+47h], ax
		pop	si
		pop	bp
		retf
sub_2105B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_210B8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Dh]
		mov	dx, [bx]
		add	dx, [bp+arg_2]
		or	dx, dx
		jge	short loc_210CD
		xor	dx, dx

loc_210CD:
		cmp	[si+2Fh], dx
		jge	short loc_210D5
		mov	dx, [si+2Fh]

loc_210D5:
		mov	bx, [si+2Dh]
		mov	[bx], dx
		pop	si
		pop	bp
		retf
sub_210B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_210DD		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		cmp	word ptr [si+2Dh], 0
		jz	short loc_21146
		cmp	word ptr [si+39h], 0
		jz	short loc_21146
		mov	cx, [si+2Bh]
		add	cx, 0FFFEh
		movsx	eax, word ptr [si+39h]
		mov	[bp+var_4], eax
		or	dx, dx
		jge	short loc_2110F
		xor	dx, dx
		jmp	short loc_2111D

loc_2110F:
		mov	ax, cx
		sub	ax, [si+56h]
		cmp	ax, dx
		jge	short loc_2111D
		mov	dx, cx
		sub	dx, [si+56h]

loc_2111D:
		movsx	eax, dx
		imul	eax, [bp+var_4]
		push	eax
		mov	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		movsx	eax, ax
		mov	edx, eax
		pop	eax
		add	eax, edx
		movsx	ebx, cx
		cdq
		idiv	ebx
		mov	cx, ax

loc_21146:
		cmp	[si+2Fh], cx
		jge	short loc_2114E
		mov	cx, [si+2Fh]

loc_2114E:
		mov	bx, [si+2Dh]
		mov	[bx], cx
		pop	si
		leave
		retf
sub_210DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21156		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		xor	cx, cx
		cmp	word ptr [si+2Dh], 0
		jz	short loc_2119F
		cmp	word ptr [si+39h], 1
		jle	short loc_2119F
		mov	ax, [si+2Bh]
		add	ax, 0FFFEh
		mov	[bp+var_2], ax
		mov	bx, [si+2Dh]
		movsx	eax, word ptr [bx]
		mov	[bp+var_6], eax
		movsx	eax, [bp+var_2]
		push	eax
		mov	eax, [bp+var_6]
		pop	edx
		imul	eax, edx
		movsx	ebx, word ptr [si+39h]
		cdq
		idiv	ebx
		add	cx, ax

loc_2119F:
		mov	ax, cx
		pop	si
		leave
		retf
sub_21156		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_211A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		add	[si+23h], dx
		add	[si+25h], cx
		add	[si+27h], dx
		add	[si+29h], cx
		add	[si+31h], dx
		add	[si+33h], cx
		add	[si+35h], dx
		add	[si+37h], cx
		add	[si+3Dh], dx
		add	[si+3Fh], cx
		add	[si+41h], dx
		add	[si+43h], cx
		push	cx
		push	dx
		push	si
		call	Widget_TranslateBounds_219D2
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_211A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_211E3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+54h], 0
		jz	short loc_21212
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	large 0FFFFFFFFh
		push	1
		push	word ptr [si+54h]
		mov	bx, [si+54h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_21212:
		pop	si
		pop	bp
		retf
sub_211E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21215		proc far

var_14		= word ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Dh], 0
		jnz	short loc_21229
		jmp	loc_2149E

loc_21229:
		mov	bx, [si+2Dh]
		mov	di, [bx]
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		mov	[bp+var_A], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_6], ax
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_21262:
		cmp	word ptr [si+4Dh], 0
		jz	short loc_212AD
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_21283
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_2]
		sub	dx, [si+3Dh]
		mov	ax, [si+41h]
		sub	ax, [si+3Dh]
		cmp	ax, dx
		jnz	short loc_21299
		jmp	short loc_21296

loc_21283:
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_4]
		sub	dx, [si+3Fh]
		mov	ax, [si+43h]
		sub	ax, [si+3Fh]
		cmp	ax, dx
		jnz	short loc_21299

loc_21296:
		mov	dx, 0FFFFh

loc_21299:
		cmp	dx, 0FFFFh
		jnz	short loc_212A1
		jmp	loc_2140D

loc_212A1:
		push	dx
		push	si
		push	cs
		call	near ptr sub_210DD
		add	sp, 4
		jmp	loc_213FA

loc_212AD:
		mov	ax, [si+31h]
		cmp	ax, [bp+var_8]
		jg	short loc_212D2
		add	ax, [si+1Fh]
		cmp	ax, [bp+var_8]
		jle	short loc_212D2
		mov	ax, [si+33h]
		cmp	ax, [bp+var_6]
		jg	short loc_212D2
		add	ax, [si+21h]
		cmp	ax, [bp+var_6]
		jle	short loc_212D2
		mov	ax, 1
		jmp	short loc_212D4

loc_212D2:
		xor	ax, ax

loc_212D4:
		or	ax, ax
		jz	short loc_212F1
		mov	word ptr [si+49h], 1
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		push	0FFFFh

loc_212E9:
		push	si
		push	cs
		call	near ptr sub_210B8
		jmp	loc_213F0

loc_212F1:
		mov	ax, [si+35h]
		cmp	ax, [bp+var_8]
		jg	short loc_21316
		add	ax, [si+1Fh]
		cmp	ax, [bp+var_8]
		jle	short loc_21316
		mov	ax, [si+37h]
		cmp	ax, [bp+var_6]
		jg	short loc_21316
		add	ax, [si+21h]
		cmp	ax, [bp+var_6]
		jle	short loc_21316
		mov	ax, 1
		jmp	short loc_21318

loc_21316:
		xor	ax, ax

loc_21318:
		or	ax, ax
		jz	short loc_2132F
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 1
		mov	word ptr [si+4Dh], 0
		push	1
		jmp	short loc_212E9

loc_2132F:
		mov	ax, [si+23h]
		cmp	ax, [bp+var_8]
		jg	short loc_21362
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		add	ax, [si+23h]
		inc	ax
		cmp	ax, [bp+var_8]
		jle	short loc_21362
		mov	ax, [si+25h]
		cmp	ax, [bp+var_6]
		jg	short loc_21362
		mov	ax, [si+29h]
		sub	ax, [si+25h]
		add	ax, [si+25h]
		inc	ax
		cmp	ax, [bp+var_6]
		jle	short loc_21362
		mov	ax, 1
		jmp	short loc_21364

loc_21362:
		xor	ax, ax

loc_21364:
		or	ax, ax
		jnz	short loc_2136B
		jmp	loc_213F3

loc_2136B:
		mov	ax, [si+41h]
		cmp	ax, [bp+var_8]
		jg	short loc_21390
		add	ax, [si+45h]
		cmp	ax, [bp+var_8]
		jle	short loc_21390
		mov	ax, [si+43h]
		cmp	ax, [bp+var_6]
		jg	short loc_21390
		add	ax, [si+47h]
		cmp	ax, [bp+var_6]
		jle	short loc_21390
		mov	ax, 1
		jmp	short loc_21392

loc_21390:
		xor	ax, ax

loc_21392:
		or	ax, ax
		jz	short loc_213C1
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 1
		mov	ax, [bp+var_8]
		sub	ax, [si+41h]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_6]
		sub	ax, [si+43h]
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_213F3

loc_213C1:
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		xor	dx, dx
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_213DE
		mov	dx, [bp+var_8]
		sub	dx, [si+3Dh]

loc_213DE:
		cmp	byte ptr [si+1Eh], 1
		jnz	short loc_213EA
		mov	dx, [bp+var_6]
		sub	dx, [si+3Fh]

loc_213EA:
		push	dx
		push	si
		push	cs
		call	near ptr sub_210DD

loc_213F0:
		add	sp, 4

loc_213F3:
		mov	bx, [si+2Dh]
		cmp	[bx], di
		jz	short loc_2140D

loc_213FA:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx
		push	si
		push	cs
		call	near ptr sub_211E3
		pop	cx
		mov	bx, [si+2Dh]
		mov	di, [bx]

loc_2140D:
		mov	[bp+var_10], 0
		jmp	short loc_2141B

loc_21417:
		inc	[bp+var_10]

loc_2141B:
		cmp	[bp+var_10], 2710h
		jl	short loc_21417
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_21455
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21455
		lea	ax, [bp+var_14]
		push	ax
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_21455

loc_21455:
		mov	al, byte_5FE46
		mov	ah, 0
		or	ax, ax
		jz	short loc_2146C
		mov	ax, word_5FE48
		sar	ax, 1
		mov	[bp+var_8], ax
		mov	ax, word_5FE4A
		mov	[bp+var_6], ax

loc_2146C:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_21479
		jmp	loc_21262

loc_21479:
		cmp	word ptr [si+49h], 0
		jnz	short loc_2148B
		cmp	word ptr [si+4Bh], 0
		jnz	short loc_2148B
		cmp	word ptr [si+4Dh], 0
		jz	short loc_2149E

loc_2148B:
		xor	ax, ax
		mov	[si+4Dh], ax
		mov	[si+4Bh], ax
		mov	[si+49h], ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx

loc_2149E:
		pop	di
		pop	si
		leave
		retf
sub_21215		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_214A2		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_6]
		mov	[si+2Bh], cx
		mov	[si+39h], dx
		mov	ax, [bp+arg_4]
		mov	[si+3Bh], ax
		mov	ax, cx
		add	ax, 0FFFEh
		movsx	eax, ax
		mov	[bp+var_4], eax
		or	dx, dx
		jz	short loc_214E5
		movsx	eax, word ptr [si+3Bh]
		imul	eax, [bp+var_4]
		movsx	ebx, word ptr [si+39h]
		cdq
		idiv	ebx
		jmp	short loc_214E8

loc_214E5:
		mov	ax, word ptr [bp+var_4]

loc_214E8:
		mov	[si+56h], ax
		mov	ax, [si+39h]
		sub	ax, [si+3Bh]
		mov	[si+2Fh], ax
		movsx	eax, word ptr [si+56h]
		mov	edx, [bp+var_4]
		sub	edx, eax
		mov	[bp+var_8], edx
		movsx	eax, word ptr [si+39h]
		push	eax
		mov	eax, [bp+var_8]
		pop	edx
		imul	eax, edx
		cdq
		idiv	[bp+var_4]
		mov	[si+2Fh], ax
		pop	si
		leave
		retf
sub_214A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21521		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	large 10001h
		push	1
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		call	PaletteScreen_DrawWidgetBorderB_223E5
		add	sp, 10h
		push	[bp+arg_C]
		push	[bp+arg_A]
		mov	ax, [bp+arg_8]
		add	ax, 0FFFCh
		push	ax
		mov	ax, [bp+arg_6]
		add	ax, 0FFFCh
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, 2
		push	ax
		mov	ax, di
		add	ax, 2
		push	ax
		push	si
		call	PaletteScreen_DrawWidgetVariantA_221AE
		add	sp, 0Eh
		pop	di
		pop	si
		pop	bp
		retf
sub_21521		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21575		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	di, cx
		jle	short loc_21589
		mov	di, cx

loc_21589:
		mov	ax, [si+21h]
		shl	ax, 1
		mov	dx, [si+1Ch]
		sub	dx, ax
		mov	[si+2Bh], dx
		mov	ax, [si+6]
		mov	[si+33h], ax
		mov	ax, [si+33h]
		add	ax, [si+21h]
		mov	[si+25h], ax
		mov	ax, [si+25h]
		add	ax, [si+2Bh]
		dec	ax
		mov	[si+29h], ax
		mov	ax, [si+29h]
		inc	ax
		mov	[si+37h], ax
		dec	word ptr [si+25h]
		add	word ptr [si+2Bh], 2
		inc	word ptr [si+29h]
		mov	ax, [si+4]
		mov	[si+23h], ax
		add	ax, [si+1Fh]
		dec	ax
		mov	[si+27h], ax
		mov	ax, [si+4]
		mov	[si+35h], ax
		mov	[si+31h], ax
		push	word ptr [si+2Bh]
		push	di
		push	cx
		push	si
		push	cs
		call	near ptr sub_214A2
		add	sp, 8
		mov	ax, [si+23h]
		inc	ax
		mov	[si+3Dh], ax
		mov	ax, [si+25h]
		inc	ax
		mov	[si+3Fh], ax
		mov	ax, [si+56h]
		mov	[si+47h], ax
		mov	ax, [bp+arg_8]
		mov	[si+54h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_21575		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21607		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+43h]
		mov	[bp+var_2], ax
		add	ax, [si+47h]
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_21156
		pop	cx
		mov	dx, [si+3Fh]
		add	dx, ax
		mov	[si+43h], dx
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+43h]
		cmp	ax, [bp+var_2]
		jle	short loc_2168F
		mov	dx, [bp+var_4]
		cmp	[si+43h], dx
		jge	short loc_21661
		mov	dx, [si+43h]
		dec	dx

loc_21661:
		mov	al, [si+4Fh]
		push	ax
		push	dx
		push	di
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		mov	dx, [bp+var_4]
		cmp	[si+43h], dx
		jle	short loc_21684
		mov	dx, [si+43h]

loc_21684:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	dx
		jmp	short loc_216C7

loc_2168F:
		mov	dx, [bp+var_2]
		cmp	dx, [bp+var_6]
		jg	short loc_2169B
		mov	dx, [bp+var_6]
		inc	dx

loc_2169B:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_4]
		push	di
		push	dx
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		mov	dx, [bp+var_6]
		cmp	dx, [bp+var_2]
		jle	short loc_216BE
		mov	dx, [bp+var_2]

loc_216BE:
		mov	al, [si+51h]
		push	ax
		push	dx
		push	di
		push	word ptr [si+43h]

loc_216C7:
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_21737
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		jmp	short loc_21790

loc_21737:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]

loc_21790:
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_21607		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_217AA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [si+31h]
		sub	dx, [si+4]
		mov	cx, [si+33h]
		sub	cx, [si+6]
		push	word ptr [si+49h]
		push	0
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	cx
		push	dx
		push	si
		push	cs
		call	near ptr sub_21521
		add	sp, 0Eh
		mov	dx, [si+35h]
		sub	dx, [si+4]
		mov	cx, [si+37h]
		sub	cx, [si+6]
		push	word ptr [si+4Bh]
		push	2
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	cx
		push	dx
		push	si
		push	cs
		call	near ptr sub_21521
		add	sp, 0Eh
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_5DD44
		call	sub_49DD0
		add	sp, 0Ch
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_21156
		pop	cx
		mov	dx, [si+3Fh]
		add	dx, ax
		mov	[si+43h], dx
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp+var_2], ax
		mov	al, [si+51h]
		push	ax
		push	[bp+var_2]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_218A6
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		jmp	short loc_218FF

loc_218A6:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]

loc_218FF:
		push	word ptr [si+41h]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_217AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21919		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_21575
		add	sp, 0Ah
		mov	ax, [si+25h]
		dec	ax
		mov	[si+37h], ax
		mov	ax, [si+21h]
		add	[si+25h], ax
		dec	word ptr [si+29h]
		add	[si+29h], ax
		pop	si
		pop	bp
		retf
sub_21919		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2194A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_21575
		add	sp, 0Ah
		mov	ax, [si+21h]
		sub	[si+25h], ax
		sub	[si+29h], ax
sub_2194A		endp

; START OF FUNCTION CHUNK FOR sub_2194A
		db 0FFh
		inc	sp
; END OF FUNCTION CHUNK FOR sub_2194A
seg048		ends
