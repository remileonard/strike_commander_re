seg060		segment	para public 'CODE' use16
		assume cs:seg060
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 16h, 50h, 0B9h, 10h, 0, 9Ah, 0E9h, 4, 0, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23D7C		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_23DB4
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 112Ch
		test	ax, 1
		jz	short loc_23DB4
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_23DB4:
		leave
		retf
sub_23D7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23DB6		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		push	1
		push	0
		push	2
		push	large 9
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		or	ax, dx
		jz	short loc_23E09
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1100h
		push	[bp+var_A]
		push	large [bp+var_8]
		push	dx
		push	bx
		call	Descriptor_Construct_23EB1
		add	sp, 0Ah
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		jmp	short loc_23E0F

loc_23E09:
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]

loc_23E0F:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_23DB6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E17		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_23E17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E1E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23E1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E23		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23E23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E28		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_23E28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E2F		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_23E2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E36		proc far
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 6906h
		pop	bp
		retf
sub_23E36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E40		proc far
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 6906h
		pop	bp
		retf
sub_23E40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E4A		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
sub_23E4A		endp
seg060		ends
