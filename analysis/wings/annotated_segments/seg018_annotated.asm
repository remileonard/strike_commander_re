seg018		segment	para public 'CODE' use16
		assume cs:seg018
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 33h, 0C0h, 89h, 44h, 4, 89h, 44h, 2

loc_A338:
		db 8Bh, 0C6h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A33D		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_A33D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A342		proc far
		push	bp
		mov	bp, sp
		push	1
		push	0
		push	2
		push	large 200h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5FD3E, dx
		mov	word_5FD3C, ax
		push	large 2000000h
		push	dx
		push	ax
		call	sub_3651
		add	sp, 8
		push	1
		push	0
		push	2
		push	large 400h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5FD42, dx
		mov	word_5FD40, ax
		push	large 4000000h
		push	dx
		push	ax
		call	sub_3651
		add	sp, 8
		pop	bp
		retf
sub_A342		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3A3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr sub_A33D
		mov	eax, [si+72h]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	dx, ax
		cmp	dx, 100h
		jbe	short loc_A3C8
		mov	dx, 100h

loc_A3C8:
		mov	ax, dx
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large word_5FD3C
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
sub_A3A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3E3		proc far
		push	bp
		mov	bp, sp
		push	0
		push	2
		push	601Ch
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		push	0
		push	2
		push	6020h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		pop	bp
		retf
sub_A3E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A40C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFh
		jbe	short loc_A446
		sub	dx, 100h
		mov	ax, dx
		shr	ax, 3
		mov	[bp+var_4], ax
		mov	ax, dx
		and	ax, 7
		mov	[bp+var_2], ax
		les	bx, word_5FD40
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	dx, 1
		mov	cl, byte ptr [bp+var_2]
		shl	dx, cl
		and	ax, dx
		jmp	short loc_A453

loc_A446:
		mov	ax, dx
		shl	ax, 1
		les	bx, word_5FD3C
		add	bx, ax
		mov	ax, es:[bx]

loc_A453:
		leave
		retf
sub_A40C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A455		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFh
		jle	short loc_A48B
		sub	dx, 100h
		mov	ax, dx
		sar	ax, 3
		mov	[bp+var_2], ax
		mov	ax, dx
		and	ax, 7
		mov	[bp+var_4], ax
		les	bx, word_5FD40
		add	bx, [bp+var_2]
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		or	es:[bx], al
		jmp	short loc_A49A

loc_A48B:
		mov	ax, dx
		shl	ax, 1
		les	bx, word_5FD3C
		add	bx, ax
		mov	word ptr es:[bx], 1

loc_A49A:
		leave
		retf
sub_A455		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A49C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		cmp	dx, 0FFh
		jbe	short loc_A4E0
		sub	dx, 100h
		mov	si, dx
		shr	si, 3
		and	dx, 7
		or	cx, cx
		jz	short loc_A4CD
		les	bx, word_5FD40
		add	bx, si
		mov	al, 1
		mov	cl, dl
		shl	al, cl
		or	es:[bx], al
		jmp	short loc_A4ED

loc_A4CD:
		les	bx, word_5FD40
		add	bx, si
		mov	al, 1
		mov	cl, dl
		shl	al, cl
		not	al
		and	es:[bx], al
		jmp	short loc_A4ED

loc_A4E0:
		mov	ax, dx
		shl	ax, 1
		les	bx, word_5FD3C
		add	bx, ax
		mov	es:[bx], cx

loc_A4ED:
		pop	si
		pop	bp
		retf
sub_A49C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A4F0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFh
		jbe	short loc_A528
		sub	dx, 100h
		mov	ax, dx
		shr	ax, 3
		mov	[bp+var_2], ax
		mov	ax, dx
		and	ax, 7
		mov	[bp+var_4], ax
		les	bx, word_5FD40
		add	bx, [bp+var_2]
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		not	al
		and	es:[bx], al
		jmp	short loc_A537

loc_A528:
		mov	ax, dx
		shl	ax, 1
		les	bx, word_5FD3C
		add	bx, ax
		mov	word ptr es:[bx], 0

loc_A537:
		leave
		retf
sub_A4F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A539		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	si, 0FFh
		jbe	short loc_A59B
		push	si
		push	cs
		call	near ptr sub_A40C
		pop	cx
		sub	si, 100h
		mov	di, si
		shr	di, 3
		mov	ax, si
		and	ax, 7
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 100h
		push	ax
		push	cs
		call	near ptr sub_A40C
		pop	cx
		mov	byte ptr [bp+var_2+1], al
		cmp	byte ptr [bp+var_2+1], 0
		jz	short loc_A589
		les	bx, word_5FD40
		add	bx, di
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		not	al
		and	es:[bx], al
		jmp	short loc_A5CA

loc_A589:
		les	bx, word_5FD40
		add	bx, di
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		or	es:[bx], al
		jmp	short loc_A5CA

loc_A59B:
		push	si
		push	cs
		call	near ptr sub_A40C
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_A5BB
		mov	ax, si
		shl	ax, 1
		les	bx, word_5FD3C
		add	bx, ax
		mov	word ptr es:[bx], 0
		jmp	short loc_A5CA

loc_A5BB:
		mov	ax, si
		shl	ax, 1
		les	bx, word_5FD3C
		add	bx, ax
		mov	word ptr es:[bx], 1

loc_A5CA:
		pop	di
		pop	si
		leave
		retf
sub_A539		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A5CE		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large 53474C46h
		push	si
		call	sub_59C45
		add	sp, 0Ah
		mov	eax, dword ptr word_5FD3C
		mov	[bp+var_4], eax
		push	large [si+65h]
		push	large 100h
		push	large [bp+var_4]
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 100h
		mov	eax, dword ptr word_5FD40
		mov	[bp+var_8], eax
		push	large [si+65h]
		push	large 400h
		push	large [bp+var_8]
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 400h
		push	si
		call	sub_59C63
		pop	cx
		pop	si
		leave
		retf
sub_A5CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A642		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 53474C46h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_A68B
		push	large 100h
		push	large word_5FD3C
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	large 400h
		push	large word_5FD40
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	ax, 1
		jmp	short loc_A68D

loc_A68B:
		xor	ax, ax

loc_A68D:
		pop	si
		pop	bp
		retf
sub_A642		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A690		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	large 100h
		push	large word_5FD3C
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 400h
		push	large word_5FD40
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
sub_A690		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A6C8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	large 100h
		push	large word_5FD3C
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 400h
		push	large word_5FD40
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
sub_A6C8		endp
seg018		ends
