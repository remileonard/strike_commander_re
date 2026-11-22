ovr326		segment	para public 'OVERLAY' use16
		assume cs:ovr326
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2730		proc far

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
		mov	al, byte ptr word_79220
		mov	[si+51h], al
		mov	al, byte ptr word_79222
		mov	[si+52h], al
		mov	al, byte ptr word_7921C
		mov	[si+53h], al
		mov	al, byte ptr word_7921E
		mov	[si+4Fh], al
		mov	al, byte ptr word_79218
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
sub_B2730		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B278D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		imul	word ptr [si+39h]
		mov	dx, [si+2Bh]
		sar	dx, 1
		add	ax, dx
		cwd
		idiv	word ptr [si+2Bh]
		mov	dx, ax
		or	dx, dx
		jge	short loc_B27AD
		xor	dx, dx

loc_B27AD:
		cmp	[si+2Fh], dx
		jge	short loc_B27B5
		mov	dx, [si+2Fh]

loc_B27B5:
		mov	bx, [si+2Dh]
		mov	[bx], dx
		pop	si
		pop	bp
		retf
sub_B278D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B27BD		proc far

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
		jge	short loc_B27D2
		xor	dx, dx

loc_B27D2:
		cmp	[si+2Fh], dx
		jge	short loc_B27DA
		mov	dx, [si+2Fh]

loc_B27DA:
		mov	bx, [si+2Dh]
		mov	[bx], dx
		pop	si
		pop	bp
		retf
sub_B27BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B27E2		proc far

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
		jz	short loc_B284B
		cmp	word ptr [si+39h], 0
		jz	short loc_B284B
		mov	cx, [si+2Bh]
		add	cx, 0FFFEh
		movsx	eax, word ptr [si+39h]
		mov	[bp+var_4], eax
		or	dx, dx
		jge	short loc_B2814
		xor	dx, dx
		jmp	short loc_B2822

loc_B2814:
		mov	ax, cx
		sub	ax, [si+56h]
		cmp	ax, dx
		jge	short loc_B2822
		mov	dx, cx
		sub	dx, [si+56h]

loc_B2822:
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

loc_B284B:
		cmp	[si+2Fh], cx
		jge	short loc_B2853
		mov	cx, [si+2Fh]

loc_B2853:
		mov	bx, [si+2Dh]
		mov	[bx], cx
		pop	si
		leave
		retf
sub_B27E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B285B		proc far

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
		jz	short loc_B28A4
		cmp	word ptr [si+39h], 1
		jle	short loc_B28A4
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

loc_B28A4:
		mov	ax, cx
		pop	si
		leave
		retf
sub_B285B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B28A9		proc far

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
		call	sub_74A69
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_B28A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B28E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+54h], 0
		jz	short loc_B2917
		push	si
		call	sub_74AD7
		pop	cx
		push	large 0FFFFFFFFh
		push	1
		push	word ptr [si+54h]
		mov	bx, [si+54h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		push	si
		call	sub_74ADC
		pop	cx

loc_B2917:
		pop	si
		pop	bp
		retf
sub_B28E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B291A		proc far

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
		jnz	short loc_B292E
		jmp	loc_B2BA3

loc_B292E:
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
		call	sub_74ADC
		pop	cx

loc_B2967:
		cmp	word ptr [si+4Dh], 0
		jz	short loc_B29B2
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_B2988
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_2]
		sub	dx, [si+3Dh]
		mov	ax, [si+41h]
		sub	ax, [si+3Dh]
		cmp	ax, dx
		jnz	short loc_B299E
		jmp	short loc_B299B

loc_B2988:
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_4]
		sub	dx, [si+3Fh]
		mov	ax, [si+43h]
		sub	ax, [si+3Fh]
		cmp	ax, dx
		jnz	short loc_B299E

loc_B299B:
		mov	dx, 0FFFFh

loc_B299E:
		cmp	dx, 0FFFFh
		jnz	short loc_B29A6
		jmp	loc_B2B12

loc_B29A6:
		push	dx
		push	si
		push	cs
		call	near ptr sub_B27E2
		add	sp, 4
		jmp	loc_B2AFF

loc_B29B2:
		mov	ax, [si+31h]
		cmp	ax, [bp+var_8]
		jg	short loc_B29D7
		add	ax, [si+1Fh]
		cmp	ax, [bp+var_8]
		jle	short loc_B29D7
		mov	ax, [si+33h]
		cmp	ax, [bp+var_6]
		jg	short loc_B29D7
		add	ax, [si+21h]
		cmp	ax, [bp+var_6]
		jle	short loc_B29D7
		mov	ax, 1
		jmp	short loc_B29D9

loc_B29D7:
		xor	ax, ax

loc_B29D9:
		or	ax, ax
		jz	short loc_B29F6
		mov	word ptr [si+49h], 1
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		push	0FFFFh

loc_B29EE:
		push	si
		push	cs
		call	near ptr sub_B27BD
		jmp	loc_B2AF5

loc_B29F6:
		mov	ax, [si+35h]
		cmp	ax, [bp+var_8]
		jg	short loc_B2A1B
		add	ax, [si+1Fh]
		cmp	ax, [bp+var_8]
		jle	short loc_B2A1B
		mov	ax, [si+37h]
		cmp	ax, [bp+var_6]
		jg	short loc_B2A1B
		add	ax, [si+21h]
		cmp	ax, [bp+var_6]
		jle	short loc_B2A1B
		mov	ax, 1
		jmp	short loc_B2A1D

loc_B2A1B:
		xor	ax, ax

loc_B2A1D:
		or	ax, ax
		jz	short loc_B2A34
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 1
		mov	word ptr [si+4Dh], 0
		push	1
		jmp	short loc_B29EE

loc_B2A34:
		mov	ax, [si+23h]
		cmp	ax, [bp+var_8]
		jg	short loc_B2A67
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		add	ax, [si+23h]
		inc	ax
		cmp	ax, [bp+var_8]
		jle	short loc_B2A67
		mov	ax, [si+25h]
		cmp	ax, [bp+var_6]
		jg	short loc_B2A67
		mov	ax, [si+29h]
		sub	ax, [si+25h]
		add	ax, [si+25h]
		inc	ax
		cmp	ax, [bp+var_6]
		jle	short loc_B2A67
		mov	ax, 1
		jmp	short loc_B2A69

loc_B2A67:
		xor	ax, ax

loc_B2A69:
		or	ax, ax
		jnz	short loc_B2A70
		jmp	loc_B2AF8

loc_B2A70:
		mov	ax, [si+41h]
		cmp	ax, [bp+var_8]
		jg	short loc_B2A95
		add	ax, [si+45h]
		cmp	ax, [bp+var_8]
		jle	short loc_B2A95
		mov	ax, [si+43h]
		cmp	ax, [bp+var_6]
		jg	short loc_B2A95
		add	ax, [si+47h]
		cmp	ax, [bp+var_6]
		jle	short loc_B2A95
		mov	ax, 1
		jmp	short loc_B2A97

loc_B2A95:
		xor	ax, ax

loc_B2A97:
		or	ax, ax
		jz	short loc_B2AC6
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
		jmp	short loc_B2AF8

loc_B2AC6:
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		xor	dx, dx
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_B2AE3
		mov	dx, [bp+var_8]
		sub	dx, [si+3Dh]

loc_B2AE3:
		cmp	byte ptr [si+1Eh], 1
		jnz	short loc_B2AEF
		mov	dx, [bp+var_6]
		sub	dx, [si+3Fh]

loc_B2AEF:
		push	dx
		push	si
		push	cs
		call	near ptr sub_B27E2

loc_B2AF5:
		add	sp, 4

loc_B2AF8:
		mov	bx, [si+2Dh]
		cmp	[bx], di
		jz	short loc_B2B12

loc_B2AFF:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx
		push	si
		push	cs
		call	near ptr sub_B28E8
		pop	cx
		mov	bx, [si+2Dh]
		mov	di, [bx]

loc_B2B12:
		mov	[bp+var_10], 0
		jmp	short loc_B2B20

loc_B2B1C:
		inc	[bp+var_10]

loc_B2B20:
		cmp	[bp+var_10], 2710h
		jl	short loc_B2B1C
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B2B5A
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2B5A
		lea	ax, [bp+var_14]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B2B5A

loc_B2B5A:
		mov	al, byte_7CE08
		mov	ah, 0
		or	ax, ax
		jz	short loc_B2B71
		mov	ax, word_7CE0A
		sar	ax, 1
		mov	[bp+var_8], ax
		mov	ax, word_7CE0C
		mov	[bp+var_6], ax

loc_B2B71:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_B2B7E
		jmp	loc_B2967

loc_B2B7E:
		cmp	word ptr [si+49h], 0
		jnz	short loc_B2B90
		cmp	word ptr [si+4Bh], 0
		jnz	short loc_B2B90
		cmp	word ptr [si+4Dh], 0
		jz	short loc_B2BA3

loc_B2B90:
		xor	ax, ax
		mov	[si+4Dh], ax
		mov	[si+4Bh], ax
		mov	[si+49h], ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx

loc_B2BA3:
		pop	di
		pop	si
		leave
		retf
sub_B291A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2BA7		proc far

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
		jz	short loc_B2BEA
		movsx	eax, word ptr [si+3Bh]
		imul	eax, [bp+var_4]
		movsx	ebx, word ptr [si+39h]
		cdq
		idiv	ebx
		jmp	short loc_B2BED

loc_B2BEA:
		mov	ax, word ptr [bp+var_4]

loc_B2BED:
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
sub_B2BA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2C26		proc far

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
		call	sub_74AA0
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
		call	sub_74AAF
		add	sp, 0Eh
		pop	di
		pop	si
		pop	bp
		retf
sub_B2C26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2C7A		proc far

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
		jle	short loc_B2C8E
		mov	di, cx

loc_B2C8E:
		mov	ax, [si+1Fh]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[si+2Bh], dx
		mov	ax, [si+4]
		mov	[si+31h], ax
		mov	ax, [si+31h]
		add	ax, [si+1Fh]
		mov	[si+23h], ax
		mov	ax, [si+23h]
		add	ax, [si+2Bh]
		dec	ax
		mov	[si+27h], ax
		mov	ax, [si+27h]
		inc	ax
		mov	[si+35h], ax
		dec	word ptr [si+23h]
		add	word ptr [si+2Bh], 2
		inc	word ptr [si+27h]
		mov	ax, [si+6]
		mov	[si+25h], ax
		add	ax, [si+21h]
		dec	ax
		mov	[si+29h], ax
		mov	ax, [si+6]
		mov	[si+37h], ax
		mov	[si+33h], ax
		push	word ptr [si+2Bh]
		push	di
		push	cx
		push	si
		push	cs
		call	near ptr sub_B2BA7
		add	sp, 8
		mov	ax, [si+23h]
		inc	ax
		mov	[si+3Dh], ax
		mov	ax, [si+25h]
		inc	ax
		mov	[si+3Fh], ax
		mov	ax, [si+56h]
		mov	[si+45h], ax
		mov	ax, [bp+arg_8]
		mov	[si+54h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_B2C7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2D0C		proc far

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
		mov	ax, [si+41h]
		mov	[bp+var_2], ax
		add	ax, [si+45h]
		dec	ax
		mov	[bp+var_4], ax
		push	si
		push	cs
		call	near ptr sub_B285B
		pop	cx
		mov	dx, [si+3Dh]
		add	dx, ax
		mov	[si+41h], dx
		mov	ax, [si+3Fh]
		mov	[si+43h], ax
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		call	sub_74AD7
		pop	cx
		mov	ax, [si+41h]
		cmp	ax, [bp+var_2]
		jle	short loc_B2D99
		mov	dx, [bp+var_4]
		cmp	[si+41h], dx
		jge	short loc_B2D66
		mov	dx, [si+41h]
		dec	dx

loc_B2D66:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_6]
		push	dx
		push	word ptr [si+43h]
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	dx, [bp+var_4]
		cmp	[si+41h], dx
		jle	short loc_B2D8B
		mov	dx, [si+41h]

loc_B2D8B:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	dx
		jmp	short loc_B2DD5

loc_B2D99:
		mov	dx, [bp+var_2]
		cmp	dx, di
		jg	short loc_B2DA3
		mov	dx, di
		inc	dx

loc_B2DA3:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	word ptr [si+43h]
		push	dx
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	dx, di
		cmp	dx, [bp+var_2]
		jle	short loc_B2DC7
		mov	dx, [bp+var_2]

loc_B2DC7:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	dx
		push	word ptr [si+43h]
		push	word ptr [si+41h]

loc_B2DD5:
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_B2E42
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		jmp	short loc_B2E9B

loc_B2E42:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]

loc_B2E9B:
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B2D0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B2EB5		proc far

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
		push	3
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	cx
		push	dx
		push	si
		push	cs
		call	near ptr sub_B2C26
		add	sp, 0Eh
		mov	dx, [si+35h]
		sub	dx, [si+4]
		mov	cx, [si+37h]
		sub	cx, [si+6]
		push	word ptr [si+4Bh]
		push	1
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	cx
		push	dx
		push	si
		push	cs
		call	near ptr sub_B2C26
		add	sp, 0Eh
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_B285B
		pop	cx
		mov	dx, [si+3Dh]
		add	dx, ax
		mov	[si+41h], dx
		mov	ax, [si+3Fh]
		mov	[si+43h], ax
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
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_B2FB1
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		jmp	short loc_B300A

loc_B2FB1:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]

loc_B300A:
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B2EB5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3024		proc far

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
		call	near ptr sub_B2C7A
		add	sp, 0Ah
		mov	ax, [si+23h]
		dec	ax
		mov	[si+35h], ax
		mov	ax, [si+1Fh]
		add	[si+23h], ax
		dec	word ptr [si+27h]
		add	[si+27h], ax
		pop	si
		pop	bp
		retf
sub_B3024		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3055		proc far

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
		call	near ptr sub_B2C7A
		add	sp, 0Ah
		mov	ax, [si+1Fh]
		sub	[si+23h], ax
		sub	[si+27h], ax
		inc	word ptr [si+27h]
		mov	ax, [si+27h]
		inc	ax
		mov	[si+31h], ax
		pop	si
		pop	bp
		retf
sub_B3055		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3086		proc far

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
		jle	short loc_B309A
		mov	di, cx

loc_B309A:
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
		call	near ptr sub_B2BA7
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
sub_B3086		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3118		proc far

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
		call	near ptr sub_B285B
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
		call	sub_74AD7
		pop	cx
		mov	ax, [si+43h]
		cmp	ax, [bp+var_2]
		jle	short loc_B31A0
		mov	dx, [bp+var_4]
		cmp	[si+43h], dx
		jge	short loc_B3172
		mov	dx, [si+43h]
		dec	dx

loc_B3172:
		mov	al, [si+4Fh]
		push	ax
		push	dx
		push	di
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	dx, [bp+var_4]
		cmp	[si+43h], dx
		jle	short loc_B3195
		mov	dx, [si+43h]

loc_B3195:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	dx
		jmp	short loc_B31D8

loc_B31A0:
		mov	dx, [bp+var_2]
		cmp	dx, [bp+var_6]
		jg	short loc_B31AC
		mov	dx, [bp+var_6]
		inc	dx

loc_B31AC:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_4]
		push	di
		push	dx
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	dx, [bp+var_6]
		cmp	dx, [bp+var_2]
		jle	short loc_B31CF
		mov	dx, [bp+var_2]

loc_B31CF:
		mov	al, [si+51h]
		push	ax
		push	dx
		push	di
		push	word ptr [si+43h]

loc_B31D8:
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_B3248
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		jmp	short loc_B32A1

loc_B3248:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]

loc_B32A1:
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B3118		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B32BB		proc far

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
		call	near ptr sub_B2C26
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
		call	near ptr sub_B2C26
		add	sp, 0Eh
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_B285B
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
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_B33B7
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		jmp	short loc_B3410

loc_B33B7:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]

loc_B3410:
		push	word ptr [si+41h]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B32BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B342A		proc far

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
		call	near ptr sub_B3086
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
sub_B342A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B345B		proc far

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
		call	near ptr sub_B3086
		add	sp, 0Ah
		mov	ax, [si+21h]
		sub	[si+25h], ax
		sub	[si+29h], ax
		inc	word ptr [si+29h]
		mov	ax, [si+29h]
		inc	ax
		mov	[si+33h], ax
		pop	si
		pop	bp
		retf
sub_B345B		endp
ovr326		ends
