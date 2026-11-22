seg050		segment	para public 'CODE' use16
		assume cs:seg050
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 2

loc_1E8A3:
		db 8Bh, 56h, 0FEh, 8Bh, 46h, 0FCh, 5Eh, 0C9h, 0CBh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E8AF		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_1E8E9
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 36F2h
		test	si, 1
		jz	short loc_1E8E9
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_1E8E9:
		pop	si
		leave
		retf
sub_1E8AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E8EC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
sub_1E8EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E90E		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		pop	bp
sub_1E90E		endp
seg050		ends
