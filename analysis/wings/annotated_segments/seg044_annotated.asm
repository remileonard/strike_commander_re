seg044		segment	para public 'CODE' use16
		assume cs:seg044
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F142		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		push	[bp+arg_2]
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	si, [bp+var_2]
		mov	[bp+var_4], 4
		jmp	short loc_1F199

loc_1F160:
		cmp	dx, 28h
		jle	short loc_1F177
		mov	di, 28h
		jmp	short loc_1F16B

loc_1F16A:
		dec	di

loc_1F16B:
		mov	bx, di
		cmp	byte ptr [bx+si], 20h
		jnz	short loc_1F16A
		mov	byte ptr [bx+si], 0
		jmp	short loc_1F17A

loc_1F177:
		mov	di, dx
		dec	di

loc_1F17A:
		push	si
		push	2
		push	[bp+var_4]
		push	2012h
		push	[bp+arg_0]
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		add	[bp+var_4], 0Fh
		mov	ax, di
		add	ax, si
		inc	ax
		mov	si, ax

loc_1F199:
		push	si
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		or	ax, ax
		jnz	short loc_1F160
		push	[bp+var_2]
		call	sub_45058
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_1F142		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F1B3		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		lea	ax, [bp+arg_0]
		push	ax
		call	sub_46E08
		pop	cx
		pop	bp
		retf
sub_1F1B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F1E5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	[si], dx
		mov	ax, dx
		imul	[bp+arg_2]
		push	ax
		call	sub_44F3F
		pop	cx
		mov	[si+2], ax
		pop	si
		pop	bp
		retf
sub_1F1E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F203		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1F22E
		cmp	word ptr [si+2], 0
		jz	short loc_1F221
		push	word ptr [si+2]
		call	sub_45058
		pop	cx

loc_1F221:
		test	di, 1
		jz	short loc_1F22E
		push	si
		call	sub_33B
		pop	cx

loc_1F22E:
		pop	di
		pop	si
sub_1F203		endp
seg044		ends
