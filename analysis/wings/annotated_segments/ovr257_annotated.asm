ovr257		segment	para public 'OVERLAY' use16
		assume cs:ovr257
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89DB0		proc far

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
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_89DB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89DD2		proc far

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
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_89DD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89DF4		proc far

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
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		pop	si
		leave
		retf
sub_89DF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89E3D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+19h]
		pop	si
		pop	bp
		retf
sub_89E3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89E4A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Bh]
		pop	si
		pop	bp
		retf
sub_89E4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89E57		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_89E57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89E64		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
sub_89E64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89E71		proc far

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
		jnz	short loc_89E8D
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_89ED5

loc_89E8D:
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	si
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	word ptr [si], 3C30h
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

loc_89ED5:
		mov	ax, si
		pop	si
		leave
		retf
sub_89E71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89EDA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_89EF3
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_89F1F

loc_89EF3:
		push	0
		push	word_5DD42
		push	si
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	word ptr [si], 3C30h
		mov	ax, si
		add	ax, 19h
		mov	word ptr [si+19h], 0
		mov	word ptr [si+1Bh], 0
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0

loc_89F1F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_89EDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89F24		proc far

var_C		= word ptr -0Ch
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_C], 1DC3h
		mov	[bp+var_C], 1DCFh
		mov	[bp+var_C], 1DDFh
		mov	[bp+var_C], 3C00h
		mov	[bp+var_C], 3C14h
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
		call	sub_59A2A
		add	sp, 0Eh
		pop	si
		leave
		retf
sub_89F24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89F6C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_89F96
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_89F96
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_89F96

loc_89F96:
		pop	di
		pop	si
		pop	bp
		retf
sub_89F6C		endp
ovr257		ends
