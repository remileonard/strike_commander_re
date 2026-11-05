seg084		segment	para public 'CODE' use16
		assume cs:seg084
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7, 0E1h, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_357C7		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_357C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_357CC		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		mov	bx, es:[bx+2]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		movzx	eax, word ptr es:[bx]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+4]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		movzx	eax, word ptr es:[bx]
		mov	[bp+var_4], eax
		cmp	eax, [bp+var_8]
		jle	short loc_3583F
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+4]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_3583F:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		movzx	eax, word ptr es:[bx]
		cmp	eax, [bp+var_8]
		jle	short loc_35872
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx], al

loc_35872:
		leave
		retf
sub_357CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35874		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_35874		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35879		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_35879		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3587E		proc far
		push	bp
		mov	bp, sp
		xor	ax, ax
		mov	word_7CCEC, ax
		mov	word_7CCEA, ax
		xor	eax, eax
		mov	dword ptr word_7CCF2, eax
		mov	dword ptr word_7CCEE, eax
		mov	dword_7CCF6, 0
		mov	byte_7CCFA, 2
		mov	byte_7CCFB, 0
		mov	dword_7CCFC, 0
		mov	dword_77C22, 100h
		mov	dword_77C26, 0A00h
		pop	bp
		retf
sub_3587E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_358C4		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CCFB, 0
		jz	short loc_358EC
		cmp	dword_7CCF6, 0
		jz	short loc_358EC
		push	0
		mov	al, byte_7CCFA
		push	ax
		push	65C6h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_358EC

loc_358EC:
		mov	dword_7CCF6, 0
		mov	byte_7CCFB, 0
		mov	dword_7CCFC, 0
		push	0
		push	ds
		push	offset word_7CCEA
		call	sub_751C4
sub_358C4		endp

; START OF FUNCTION CHUNK FOR sub_358C4
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_358C4
seg084		ends
