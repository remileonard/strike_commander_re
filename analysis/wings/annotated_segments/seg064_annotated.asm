seg064		segment	para public 'CODE' use16
		assume cs:seg064
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

loc_2F2E6:
		db 0B8h, 0, 0, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F2EE		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2F326
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 260Ch
		test	ax, 1
		jz	short loc_2F326
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_2F326:
		leave
		retf
sub_2F2EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F328		proc far

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
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		or	ax, dx
		jz	short loc_2F37B
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 25E0h
		push	[bp+var_A]
		push	large [bp+var_8]
		push	dx
		push	bx
		call	sub_2F64A
		add	sp, 0Ah
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		jmp	short loc_2F381

loc_2F37B:
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]

loc_2F381:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_2F328		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F389		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2F389		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F390		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2F390		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F395		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2F395		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F39A		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2F39A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3A1		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2F3A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3A8		proc far
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 665Ah
		pop	bp
		retf
sub_2F3A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3B2		proc far
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 665Ah
		pop	bp
		retf
sub_2F3B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3BC		proc far
		push	bp
		mov	bp, sp
sub_2F3BC		endp

; START OF FUNCTION CHUNK FOR sub_2F3BC
		db 0B0h
; END OF FUNCTION CHUNK FOR sub_2F3BC
seg064		ends
