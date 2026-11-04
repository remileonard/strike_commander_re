seg095		segment	para public 'CODE' use16
		assume cs:seg095
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 8, 0C6h, 7, 0, 8Bh, 46h, 0FEh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3095C		proc far

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
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_3095C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3097E		proc far

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
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_3097E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_309A0		proc far

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
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		pop	si
		leave
		retf
sub_309A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_309E9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+19h]
		pop	si
		pop	bp
		retf
sub_309E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_309F6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Bh]
		pop	si
		pop	bp
		retf
sub_309F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A03		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_30A03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A10		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
sub_30A10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A1D		proc far

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
		jnz	short loc_30A39
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_30A81

loc_30A39:
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	si
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	word ptr [si], 459Ah
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

loc_30A81:
		mov	ax, si
		pop	si
		leave
		retf
sub_30A1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A86		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_30A9F
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_30ACB

loc_30A9F:
		push	0
		push	word_4D36C
		push	si
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	word ptr [si], 459Ah
		mov	ax, si
		add	ax, 19h
		mov	word ptr [si+19h], 0
		mov	word ptr [si+1Bh], 0
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0

loc_30ACB:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_30A86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30AD0		proc far

var_C		= word ptr -0Ch
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_C], 1FEDh
		mov	[bp+var_C], 1FF9h
		mov	[bp+var_C], 2009h
		mov	[bp+var_C], 456Ah
		mov	[bp+var_C], 457Eh
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
		call	sub_2F35C
		add	sp, 0Eh
		pop	si
		leave
		retf
sub_30AD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30B18		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_30B42
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		pop	cx
		test	di, 1
		jz	short loc_30B42
		push	si
		call	sub_39C
		pop	cx
sub_30B18		endp
seg095		ends
