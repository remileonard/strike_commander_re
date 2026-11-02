seg048		segment	para public 'CODE' use16
		assume cs:seg048
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D7h, 0FEh, 0E9h, 49h, 0FFh

loc_1E565:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E569		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_1E5A3
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 371Eh
		test	si, 1
		jz	short loc_1E5A3
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_1E5A3:
		pop	si
		leave
		retf
sub_1E569		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E5A6		proc far

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
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		or	ax, dx
		jz	short loc_1E5FF
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 36F2h
		push	[bp+var_A]
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		push	[bp+var_C]
		push	[bp+var_E]
		call	sub_1E90E
		add	sp, 0Ah
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		jmp	short loc_1E605

loc_1E5FF:
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]

loc_1E605:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		leave
		retf
sub_1E5A6		endp

; START OF FUNCTION CHUNK FOR sub_1E5A6
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1E5A6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E615		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_1E615		endp

; START OF FUNCTION CHUNK FOR sub_1E615
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E615

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E61E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1E61E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E623		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1E623		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E628		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1E628		endp

; START OF FUNCTION CHUNK FOR sub_1E628
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E628

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E631		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_1E631		endp

; START OF FUNCTION CHUNK FOR sub_1E631
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E631

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E63A		proc far
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 6AC4h
		pop	bp
		retf
sub_1E63A		endp

; START OF FUNCTION CHUNK FOR sub_1E63A
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E63A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E646		proc far
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 6AC4h
		pop	bp
		retf
sub_1E646		endp

; START OF FUNCTION CHUNK FOR sub_1E646
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E646

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E652		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1E652		endp

; START OF FUNCTION CHUNK FOR sub_1E652
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1E652

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E65B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1E65B		endp
seg048		ends
