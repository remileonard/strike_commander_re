ovr246		segment	para public 'OVERLAY' use16
		assume cs:ovr246
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEBC0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 10h
		push	[bp+arg_2]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		call	sub_48892
		add	sp, 0Ch
		pop	bp
		retf
sub_BEBC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEBE6		proc far

var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	di, [bp+arg_6]
		cmp	[bp+arg_E], 0
		jnz	short loc_BEBFF
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		jmp	short loc_BEC06

loc_BEBFF:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+2]

loc_BEC06:
		or	si, si
		jnz	short loc_BEC0E
		pop	di
		pop	si
		leave
		retf

loc_BEC0E:
		cmp	[bp+arg_C], 0
		jnz	short loc_BEC17
		jmp	loc_BECAC

loc_BEC17:
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	si
		call	sub_4888D
		add	sp, 6
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48879
		add	sp, 6
		mov	[bp+var_6], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		call	sub_35BAA
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_14]
		inc	ax
		mov	bx, word_4D36E
		mov	dx, [bx+8]
		mov	bx, word_4D36E
		sub	dx, [bx+4]
		inc	dx
		sub	dx, ax
		shr	dx, 1
		mov	[bp+var_2], dx
		mov	bx, word_4D36E
		mov	ax, [bx+8]
		mov	bx, word_4D36E
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_4]
		sar	ax, 1
		mov	[bp+var_8], ax
		jmp	short loc_BECE8

loc_BECAC:
		mov	bx, word_4D36E
		mov	ax, [bx+8]
		mov	bx, word_4D36E
		sub	ax, [bx+4]
		inc	ax
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48879
		add	sp, 6
		mov	[bp+var_6], ax
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_2]
		add	ax, es:[bx+98h]
		add	ax, 2
		mov	[bp+var_8], ax

loc_BECE8:
		mov	ax, [bp+var_6]
		mov	[bp+var_18], ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_18]
		call	sub_35BAA
		mov	ax, [bp+var_1A]
		sub	ax, [bp+var_1E]
		inc	ax
		mov	[bp+var_16], ax
		mov	ax, di
		add	ax, [bp+var_16]
		dec	ax
		mov	bx, word_4D36E
		cmp	ax, [bx+0Ah]
		jle	short loc_BED47
		mov	bx, word_4D36E
		mov	ax, [bx+0Ah]
		inc	ax
		sub	ax, [bp+var_16]
		mov	di, ax

loc_BED47:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, [bp+var_16]
		sub	dx, ax
		sub	dx, [si+17h]
		shr	dx, 1
		les	bx, [bp+arg_0]
		mov	ax, di
		add	ax, es:[bx+9Ah]
		add	ax, dx
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_24], ax
		mov	[bp+var_26], di
		mov	ax, [bp+var_6]
		mov	[bp+var_28], ax
		push	[bp+var_28]
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_26]
		push	[bp+var_24]
		push	[bp+var_22]
		call	sub_38514
		add	sp, 0Ch
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_4]
		push	si
		call	sub_48892
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_BEBE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEDD1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_BEE27
		les	bx, [bp+arg_0]
		mov	eax, dword_4C35D
		add	es:[bx+0A5h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0A5h]
		les	bx, [bp+arg_0]
		cmp	eax, es:[bx+0A1h]
		jle	short loc_BEE27
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 0
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0A5h], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 1

loc_BEE27:
		pop	bp
		retf
sub_BEDD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEE29		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+9Ch], ax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_BEE48
		jmp	loc_BEEF2

loc_BEE48:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+94h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_2], ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		call	sub_35BAA
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax

loc_BEEF2:
		leave
		retf
sub_BEE29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEEF4		proc far

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
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_BEF08
		jmp	loc_BEFD8

loc_BEF08:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0ADh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_BEF19
		jmp	loc_BEFD8

loc_BEF19:
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ApplyStyleAttributeB_3582A
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+94h]
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_38514
		add	sp, 0Ch
		mov	bx, word_4D36E
		mov	ax, [bx+8]
		mov	bx, word_4D36E
		sub	ax, [bx+4]
		inc	ax
		les	bx, [bp+arg_0]
		sub	ax, es:[bx+90h]
		shr	ax, 1
		mov	[bp+var_A], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+94h]
		les	bx, [bp+arg_0]
		add	ax, es:[bx+9Eh]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_A]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_BEBC0
		add	sp, 0Ah

loc_BEFD8:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		leave
		retf
sub_BEEF4		endp
ovr246		ends
