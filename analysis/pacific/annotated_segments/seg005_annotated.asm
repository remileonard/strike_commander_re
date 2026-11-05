seg005		segment	para public 'CODE' use16
		assume cs:seg005
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0B4h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C52		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+19h], ax
		mov	ax, [bp+arg_4]
		mov	[si+1Dh], ax
		push	large 0
		push	si
		call	sub_75D27
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_4C52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C74		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Bh], ax
		mov	ax, [bp+arg_4]
		mov	[si+1Fh], ax
		push	large 0
		push	si
		call	sub_75D27
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_4C74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C96		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+19h], ax
		mov	ax, [bp+var_4]
		mov	[si+1Bh], ax
		mov	ax, [bp+var_6]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_8]
		mov	[si+1Fh], ax
		push	large 0
		push	si
		call	sub_75D27
		add	sp, 6
		pop	si
		leave
		retf
sub_4C96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4CDF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+19h]
		pop	si
		pop	bp
		retf
sub_4CDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4CEC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Bh]
		pop	si
		pop	bp
		retf
sub_4CEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4CF9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_4CF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D06		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
sub_4D06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D13		proc far

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
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4D2F
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4D77

loc_4D2F:
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	si
		call	sub_75D04
		add	sp, 6
		mov	word ptr [si], 1C4h
		mov	ax, si
		add	ax, 19h
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+19h], ax
		mov	ax, [bp+var_4]
		mov	[si+1Bh], ax
		mov	ax, [bp+var_6]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_8]
		mov	[si+1Fh], ax

loc_4D77:
		mov	ax, si
		pop	si
		leave
		retf
sub_4D13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D7C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4D95
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4DC1

loc_4D95:
		push	0
		push	word_7AF7C
		push	si
		call	sub_75D04
		add	sp, 6
		mov	word ptr [si], 1C4h
		mov	ax, si
		add	ax, 19h
		mov	word ptr [si+19h], 0
		mov	word ptr [si+1Bh], 0
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0

loc_4DC1:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_4D7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DC6		proc far

var_C		= word ptr -0Ch
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_C], 168h
		mov	[bp+var_C], 174h
		mov	[bp+var_C], 184h
		mov	[bp+var_C], 194h
		mov	[bp+var_C], 1A8h
		mov	ax, si
		add	ax, 2
		push	ax
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	word ptr [si+1Bh]
		push	word ptr [si+19h]
		lea	ax, [bp+var_C]
		push	ax
		call	sub_764CA
		add	sp, 0Eh
		pop	si
		leave
		retf
sub_4DC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E0E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4E0E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E16		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4E16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E1E		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+2], ax
		mov	ax, [bp+var_4]
		add	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_4E1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E50		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_4E50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E7B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4E7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E83		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4EAD
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_4EAD
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_4EAD

loc_4EAD:
		pop	di
		pop	si
		pop	bp
sub_4E83		endp
seg005		ends
