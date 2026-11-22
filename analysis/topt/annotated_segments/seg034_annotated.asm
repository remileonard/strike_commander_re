seg034		segment	para public 'CODE' use16
		assume cs:seg034
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_134F0		proc far

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
		mov	al, byte ptr word_4BCB8
		mov	[si+51h], al
		mov	al, byte ptr word_4BCBA
		mov	[si+52h], al
		mov	al, byte ptr word_4BCB4
		mov	[si+53h], al
		mov	al, byte ptr word_4BCB6
		mov	[si+4Fh], al
		mov	al, byte ptr word_4BCB0
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
sub_134F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1354D		proc far

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
		mov	cx, ax
		or	cx, cx
		jge	short loc_1356D
		xor	cx, cx

loc_1356D:
		cmp	[si+2Fh], cx
		jge	short loc_13575
		mov	cx, [si+2Fh]

loc_13575:
		mov	bx, [si+2Dh]
		mov	[bx], cx
		pop	si
		pop	bp
		retf
sub_1354D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1357D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		add	ax, [bp+arg_2]
		mov	dx, ax
		or	dx, dx
		jge	short loc_13594
		xor	dx, dx

loc_13594:
		cmp	[si+2Fh], dx
		jge	short loc_1359C
		mov	dx, [si+2Fh]

loc_1359C:
		mov	bx, [si+2Dh]
		mov	[bx], dx
		pop	si
		pop	bp
		retf
sub_1357D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_135A4		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	di, di
		cmp	word ptr [si+2Dh], 0
		jz	short loc_13617
		cmp	word ptr [si+39h], 0
		jz	short loc_13617
		mov	ax, [si+2Bh]
		add	ax, 0FFFEh
		mov	[bp+var_2], ax
		movsx	eax, word ptr [si+39h]
		mov	[bp+var_6], eax
		or	cx, cx
		jge	short loc_135DA
		xor	cx, cx
		jmp	short loc_135EC

loc_135DA:
		mov	ax, [bp+var_2]
		sub	ax, [si+56h]
		cmp	ax, cx
		jge	short loc_135EC
		mov	ax, [bp+var_2]
		sub	ax, [si+56h]
		mov	cx, ax

loc_135EC:
		movsx	eax, cx
		imul	eax, [bp+var_6]
		push	eax
		mov	ax, [bp+var_2]
		cwd
		sub	ax, dx
		sar	ax, 1
		movsx	eax, ax
		mov	edx, eax
		pop	eax
		add	eax, edx
		movsx	ebx, [bp+var_2]
		cdq
		idiv	ebx
		mov	di, ax

loc_13617:
		cmp	[si+2Fh], di
		jge	short loc_1361F
		mov	di, [si+2Fh]

loc_1361F:
		mov	bx, [si+2Dh]
		mov	[bx], di
		pop	di
		pop	si
		leave
		retf
sub_135A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13628		proc far

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
		jz	short loc_13675
		cmp	word ptr [si+39h], 1
		jle	short loc_13675
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
		mov	dx, cx
		add	dx, ax
		mov	cx, dx

loc_13675:
		mov	ax, cx
		pop	si
		leave
		retf
sub_13628		endp

; START OF FUNCTION CHUNK FOR sub_13628
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_13628

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1367D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		add	[si+23h], di
		mov	ax, [bp+arg_4]
		add	[si+25h], ax
		add	[si+27h], di
		mov	ax, [bp+arg_4]
		add	[si+29h], ax
		add	[si+31h], di
		mov	ax, [bp+arg_4]
		add	[si+33h], ax
		add	[si+35h], di
		mov	ax, [bp+arg_4]
		add	[si+37h], ax
		add	[si+3Dh], di
		mov	ax, [bp+arg_4]
		add	[si+3Fh], ax
		add	[si+41h], di
		mov	ax, [bp+arg_4]
		add	[si+43h], ax
		push	[bp+arg_4]
		push	di
		push	si
		call	Widget_TranslateBounds_14438
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_1367D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_136CF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+54h], 0
		jz	short loc_13703
		push	si
		call	sub_143DD
		add	sp, 2
		push	0FFFFh
		push	0FFFFh
		push	1
		push	word ptr [si+54h]
		mov	bx, [si+54h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		push	si
		call	sub_143FC
		add	sp, 2

loc_13703:
		pop	si
		pop	bp
		retf
sub_136CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13706		proc far

var_16		= word ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
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
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Dh], 0
		jnz	short loc_1371B
		pop	di
		pop	si
		leave
		retf

loc_1371B:
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		mov	[bp+var_6], ax
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		mov	[bp+var_C], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_8], ax
		push	si
		call	sub_143FC
		add	sp, 2

loc_13759:
		cmp	word ptr [si+4Dh], 0
		jz	short loc_137C5
		mov	di, 0FFFFh
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_13782
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		sub	ax, [si+3Dh]
		mov	di, ax
		mov	ax, [si+41h]
		sub	ax, [si+3Dh]
		cmp	ax, di
		jnz	short loc_13780
		mov	di, 0FFFFh

loc_13780:
		jmp	short loc_1379A

loc_13782:
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_4]
		sub	ax, [si+3Fh]
		mov	di, ax
		mov	ax, [si+43h]
		sub	ax, [si+3Fh]
		cmp	ax, di
		jnz	short loc_1379A
		mov	di, 0FFFFh

loc_1379A:
		cmp	di, 0FFFFh
		jz	short loc_137C2
		push	di
		push	si
		push	cs
		call	near ptr sub_135A4
		add	sp, 4
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_136CF
		add	sp, 2
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		mov	[bp+var_6], ax

loc_137C2:
		jmp	loc_13953

loc_137C5:
		mov	ax, [si+31h]
		cmp	ax, [bp+var_A]
		jg	short loc_137F0
		mov	ax, [si+31h]
		add	ax, [si+1Fh]
		cmp	ax, [bp+var_A]
		jle	short loc_137F0
		mov	ax, [si+33h]
		cmp	ax, [bp+var_8]
		jg	short loc_137F0
		mov	ax, [si+33h]
		add	ax, [si+21h]
		cmp	ax, [bp+var_8]
		jle	short loc_137F0
		mov	ax, 1
		jmp	short loc_137F2

loc_137F0:
		xor	ax, ax

loc_137F2:
		or	ax, ax
		jz	short loc_13812
		mov	word ptr [si+49h], 1
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		push	0FFFFh
		push	si
		push	cs
		call	near ptr sub_1357D
		add	sp, 4
		jmp	loc_1392F

loc_13812:
		mov	ax, [si+35h]
		cmp	ax, [bp+var_A]
		jg	short loc_1383D
		mov	ax, [si+35h]
		add	ax, [si+1Fh]
		cmp	ax, [bp+var_A]
		jle	short loc_1383D
		mov	ax, [si+37h]
		cmp	ax, [bp+var_8]
		jg	short loc_1383D
		mov	ax, [si+37h]
		add	ax, [si+21h]
		cmp	ax, [bp+var_8]
		jle	short loc_1383D
		mov	ax, 1
		jmp	short loc_1383F

loc_1383D:
		xor	ax, ax

loc_1383F:
		or	ax, ax
		jz	short loc_1385F
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 1
		mov	word ptr [si+4Dh], 0
		push	1
		push	si
		push	cs
		call	near ptr sub_1357D
		add	sp, 4
		jmp	loc_1392F

loc_1385F:
		mov	ax, [si+23h]
		cmp	ax, [bp+var_A]
		jg	short loc_13892
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		add	ax, [si+23h]
		inc	ax
		cmp	ax, [bp+var_A]
		jle	short loc_13892
		mov	ax, [si+25h]
		cmp	ax, [bp+var_8]
		jg	short loc_13892
		mov	ax, [si+29h]
		sub	ax, [si+25h]
		add	ax, [si+25h]
		inc	ax
		cmp	ax, [bp+var_8]
		jle	short loc_13892
		mov	ax, 1
		jmp	short loc_13894

loc_13892:
		xor	ax, ax

loc_13894:
		or	ax, ax
		jnz	short loc_1389B
		jmp	loc_1392F

loc_1389B:
		mov	ax, [si+41h]
		cmp	ax, [bp+var_A]
		jg	short loc_138C6
		mov	ax, [si+41h]
		add	ax, [si+45h]
		cmp	ax, [bp+var_A]
		jle	short loc_138C6
		mov	ax, [si+43h]
		cmp	ax, [bp+var_8]
		jg	short loc_138C6
		mov	ax, [si+43h]
		add	ax, [si+47h]
		cmp	ax, [bp+var_8]
		jle	short loc_138C6
		mov	ax, 1
		jmp	short loc_138C8

loc_138C6:
		xor	ax, ax

loc_138C8:
		or	ax, ax
		jz	short loc_138F9
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 1
		mov	ax, [bp+var_A]
		sub	ax, [si+41h]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_8]
		sub	ax, [si+43h]
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		jmp	short loc_1392F

loc_138F9:
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		xor	di, di
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_13918
		mov	ax, [bp+var_A]
		sub	ax, [si+3Dh]
		mov	di, ax

loc_13918:
		cmp	byte ptr [si+1Eh], 1
		jnz	short loc_13926
		mov	ax, [bp+var_8]
		sub	ax, [si+3Fh]
		mov	di, ax

loc_13926:
		push	di
		push	si
		push	cs
		call	near ptr sub_135A4
		add	sp, 4

loc_1392F:
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		cmp	ax, [bp+var_6]
		jz	short loc_13953
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_136CF
		add	sp, 2
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		mov	[bp+var_6], ax

loc_13953:
		mov	[bp+var_12], 0
		jmp	short loc_13961

loc_1395D:
		inc	[bp+var_12]

loc_13961:
		cmp	[bp+var_12], 2710h
		jl	short loc_1395D
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_139A1
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1399F
		lea	ax, [bp+var_16]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_1399F

loc_1399F:
		jmp	short loc_139A1

loc_139A1:
		mov	al, byte_4F04A
		mov	ah, 0
		or	ax, ax
		jz	short loc_139B8
		mov	ax, word_4F04C
		sar	ax, 1
		mov	[bp+var_A], ax
		mov	ax, word_4F04E
		mov	[bp+var_8], ax

loc_139B8:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_139C5
		jmp	loc_13759

loc_139C5:
		cmp	word ptr [si+49h], 0
		jnz	short loc_139D7
		cmp	word ptr [si+4Bh], 0
		jnz	short loc_139D7
		cmp	word ptr [si+4Dh], 0
		jz	short loc_139EC

loc_139D7:
		xor	ax, ax
		mov	[si+4Dh], ax
		mov	[si+4Bh], ax
		mov	[si+49h], ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2

loc_139EC:
		pop	di
		pop	si
		leave
		retf
sub_13706		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_139F0		proc far

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
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_6]
		mov	[si+2Bh], di
		mov	[si+39h], cx
		mov	ax, [bp+arg_4]
		mov	[si+3Bh], ax
		mov	ax, di
		add	ax, 0FFFEh
		movsx	eax, ax
		mov	[bp+var_4], eax
		or	cx, cx
		jz	short loc_13A37
		movsx	eax, word ptr [si+3Bh]
		imul	eax, [bp+var_4]
		movsx	ebx, word ptr [si+39h]
		cdq
		idiv	ebx
		mov	[si+56h], ax
		jmp	short loc_13A3D

loc_13A37:
		mov	ax, word ptr [bp+var_4]
		mov	[si+56h], ax

loc_13A3D:
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
		pop	di
		pop	si
		leave
		retf
sub_139F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13A74		proc far

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
		push	1
		push	1
		push	1
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		call	sub_14EDD
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
		call	sub_14C94
		add	sp, 0Eh
		pop	di
		pop	si
		pop	bp
		retf
sub_13A74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13AC6		proc far

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
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], di
		jle	short loc_13AD9
		mov	[bp+arg_4], di

loc_13AD9:
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
		mov	ax, [si+6]
		add	ax, [si+21h]
		dec	ax
		mov	[si+29h], ax
		mov	ax, [si+6]
		mov	[si+37h], ax
		mov	[si+33h], ax
		push	word ptr [si+2Bh]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_139F0
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
sub_13AC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13B5C		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+41h]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		add	ax, [si+45h]
		dec	ax
		mov	[bp+var_4], ax
		push	si
		push	cs
		call	near ptr sub_13628
		add	sp, 2
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
		call	sub_143DD
		add	sp, 2
		mov	ax, [si+41h]
		cmp	ax, [bp+var_2]
		jle	short loc_13C12
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [si+41h]
		cmp	ax, [bp+var_8]
		jge	short loc_13BC6
		mov	ax, [si+41h]
		dec	ax
		mov	[bp+var_8], ax

loc_13BC6:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		push	word ptr [si+43h]
		push	[bp+var_2]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [si+41h]
		cmp	ax, [bp+var_A]
		jle	short loc_13BF6
		mov	ax, [si+41h]
		mov	[bp+var_A], ax

loc_13BF6:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	[bp+var_A]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		jmp	short loc_13C6C

loc_13C12:
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		cmp	[bp+var_8], di
		jg	short loc_13C23
		mov	ax, di
		inc	ax
		mov	[bp+var_8], ax

loc_13C23:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	word ptr [si+43h]
		push	[bp+var_8]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	[bp+var_A], di
		mov	ax, [bp+var_A]
		cmp	ax, [bp+var_2]
		jle	short loc_13C50
		mov	ax, [bp+var_2]
		mov	[bp+var_A], ax

loc_13C50:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	[bp+var_A]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch

loc_13C6C:
		cmp	word ptr [si+4Dh], 0
		jz	short loc_13CDC
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		jmp	short loc_13D44

loc_13CDC:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch

loc_13D44:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_13B5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13D51		proc far

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
		mov	ax, [si+31h]
		sub	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+33h]
		sub	ax, [si+6]
		mov	[bp+var_4], ax
		push	word ptr [si+49h]
		push	3
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_13A74
		add	sp, 0Eh
		mov	ax, [si+35h]
		sub	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+37h]
		sub	ax, [si+6]
		mov	[bp+var_4], ax
		push	word ptr [si+4Bh]
		push	1
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_13A74
		add	sp, 0Eh
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_13628
		add	sp, 2
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
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_13E74
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		jmp	short loc_13EDC

loc_13E74:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch

loc_13EDC:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_13D51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13EE9		proc far

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
		call	near ptr sub_13AC6
		add	sp, 0Ah
		mov	ax, [si+23h]
		dec	ax
		mov	[si+35h], ax
		mov	ax, [si+1Fh]
		add	[si+23h], ax
		dec	word ptr [si+27h]
		mov	ax, [si+1Fh]
		add	[si+27h], ax
		pop	si
		pop	bp
		retf
sub_13EE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13F1D		proc far

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
		call	near ptr sub_13AC6
		add	sp, 0Ah
		mov	ax, [si+1Fh]
		sub	[si+23h], ax
		mov	ax, [si+1Fh]
		sub	[si+27h], ax
		inc	word ptr [si+27h]
		mov	ax, [si+27h]
		inc	ax
		mov	[si+31h], ax
		pop	si
		pop	bp
		retf
sub_13F1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13F51		proc far

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
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], di
		jle	short loc_13F64
		mov	[bp+arg_4], di

loc_13F64:
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
		mov	ax, [si+4]
		add	ax, [si+1Fh]
		dec	ax
		mov	[si+27h], ax
		mov	ax, [si+4]
		mov	[si+35h], ax
		mov	[si+31h], ax
		push	word ptr [si+2Bh]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_139F0
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
sub_13F51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13FE7		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+43h]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		add	ax, [si+47h]
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_13628
		add	sp, 2
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
		call	sub_143DD
		add	sp, 2
		mov	ax, [si+43h]
		cmp	ax, [bp+var_2]
		jle	short loc_1409B
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [si+43h]
		cmp	ax, [bp+var_8]
		jge	short loc_14051
		mov	ax, [si+43h]
		dec	ax
		mov	[bp+var_8], ax

loc_14051:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_8]
		push	di
		push	[bp+var_2]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [si+43h]
		cmp	ax, [bp+var_A]
		jle	short loc_1407F
		mov	ax, [si+43h]
		mov	[bp+var_A], ax

loc_1407F:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_A]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		jmp	short loc_140F8

loc_1409B:
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_6]
		jg	short loc_140B0
		mov	ax, [bp+var_6]
		inc	ax
		mov	[bp+var_8], ax

loc_140B0:
		mov	al, [si+4Fh]
		push	ax
		push	[bp+var_4]
		push	di
		push	[bp+var_8]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		cmp	ax, [bp+var_2]
		jle	short loc_140DE
		mov	ax, [bp+var_2]
		mov	[bp+var_A], ax

loc_140DE:
		mov	al, [si+51h]
		push	ax
		push	[bp+var_A]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch

loc_140F8:
		cmp	word ptr [si+4Dh], 0
		jz	short loc_14168
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		jmp	short loc_141D0

loc_14168:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch

loc_141D0:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_13FE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_141DD		proc far

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
		mov	ax, [si+31h]
		sub	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+33h]
		sub	ax, [si+6]
		mov	[bp+var_4], ax
		push	word ptr [si+49h]
		push	0
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_13A74
		add	sp, 0Eh
		mov	ax, [si+35h]
		sub	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+37h]
		sub	ax, [si+6]
		mov	[bp+var_4], ax
		push	word ptr [si+4Bh]
		push	2
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_13A74
		add	sp, 0Eh
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_13628
		add	sp, 2
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
		mov	al, [si+51h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_14300
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		jmp	short loc_14368

loc_14300:
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_6]
		push	word ptr [si+41h]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch

loc_14368:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_141DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14375		proc far

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
		call	near ptr sub_13F51
		add	sp, 0Ah
		mov	ax, [si+25h]
		dec	ax
		mov	[si+37h], ax
		mov	ax, [si+21h]
		add	[si+25h], ax
		dec	word ptr [si+29h]
		mov	ax, [si+21h]
		add	[si+29h], ax
		pop	si
		pop	bp
		retf
sub_14375		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_143A9		proc far

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
		call	near ptr sub_13F51
		add	sp, 0Ah
		mov	ax, [si+21h]
		sub	[si+25h], ax
		mov	ax, [si+21h]
		sub	[si+29h], ax
sub_143A9		endp
seg034		ends
