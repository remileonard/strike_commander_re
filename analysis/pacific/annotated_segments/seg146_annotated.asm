seg146		segment	para public 'CODE' use16
		assume cs:seg146
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 0E7h, 6Ah, 0, 66h, 0C7h, 6, 0E8h, 6Ah, 0, 0, 0, 0

loc_6435D:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6435F		proc far
		push	bp
		mov	bp, sp

loc_64362:
		pushf

loc_64363:
		cmp	byte_7AC28, 0
		jnz	short loc_64363
		cli
		cmp	byte_7AC28, 0
		jz	short loc_64373
		popf

loc_64373:
		cmp	byte_7AC28, 0
		jnz	short loc_64362
		mov	byte_7AC28, 1
		popf
		pop	bp
		retf
sub_6435F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64382		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		cmp	dword_7AC1B, 0
		jnz	short loc_643B9
		mov	eax, [bp+arg_0]
		mov	dword_7AC1B, eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	loc_644B7

loc_643B9:
		mov	eax, dword_7AC1B
		mov	[bp+var_8], eax
		push	1
		push	large [bp+arg_0]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		push	1
		push	large dword_7AC1B
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jbe	short loc_6440C
		mov	eax, [bp+arg_0]
		mov	dword_7AC1B, eax
		jmp	short loc_64442

loc_6440C:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	eax, [bp+var_8]
		cmp	eax, dword_7AC1B
		jz	short loc_64442
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jb	short loc_6440C

loc_64442:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_C]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]

loc_644B7:
		mov	es:[bx+8], eax
		leave
		retf
sub_64382		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_644BE		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+arg_0]
		jnz	short loc_644F1
		mov	dword_7AC1B, 0
		jmp	short loc_64557

loc_644F1:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		cmp	eax, dword_7AC1B
		jnz	short loc_64519
		mov	eax, [bp+var_C]
		mov	dword_7AC1B, eax

loc_64519:
		push	1
		push	large [bp+var_8]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax

loc_64557:
		leave
		retf
sub_644BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64559		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	1
		push	large [bp+arg_0]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jnz	short loc_645D6
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_10]
		jnz	short loc_645A7
		jmp	loc_6478C

loc_645A7:
		mov	dword_7AC1B, eax
		push	1
		push	large [bp+var_10]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_645CF
		jmp	loc_6478C

loc_645CF:
		mov	eax, [bp+var_10]
		jmp	loc_64788

loc_645D6:
		mov	al, 1
		mov	[bp+var_12], al
		mov	[bp+var_11], al
		push	1
		push	large [bp+var_10]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jnb	short loc_6460A
		mov	eax, [bp+var_10]
		cmp	eax, dword_7AC1B
		jnz	short loc_64640

loc_6460A:
		push	1
		push	large [bp+var_C]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jbe	short loc_64636
		mov	eax, [bp+arg_0]
		cmp	eax, dword_7AC1B
		jnz	short loc_6463C

loc_64636:
		mov	[bp+var_12], 0
		jmp	short loc_64640

loc_6463C:
		mov	[bp+var_11], 0

loc_64640:
		cmp	[bp+var_12], 0
		jnz	short loc_64649
		jmp	loc_6478C

loc_64649:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_644BE
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_646AF
		push	1
		push	large [bp+var_10]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_6466E:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_7AC1B
		jz	short loc_646FE
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_6466E
		jmp	short loc_646FE

loc_646AF:
		push	1
		push	large [bp+var_C]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_646C3:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		cmp	eax, dword_7AC1B
		jz	short loc_646FE
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		ja	short loc_646C3

loc_646FE:
		push	1
		push	large [bp+var_16]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_1A]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		push	1
		push	large [bp+arg_0]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_1A]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_16]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_7AC1B
		jnz	short loc_6478C
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_1E]
		jnb	short loc_6478C
		mov	eax, [bp+arg_0]

loc_64788:
		mov	dword_7AC1B, eax

loc_6478C:
		leave
		retf
sub_64559		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6478E		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		mov	[bp+var_4], 0
		cmp	byte_7AC1A, 0
		jz	short loc_647A7
		jmp	loc_64939

loc_647A7:
		cmp	[bp+arg_4], 0
		jnz	short loc_647B7
		push	1504h
		call	sub_1DDFE
		pop	cx

loc_647B7:
		push	cs
		call	near ptr sub_6435F
		mov	byte_7AC1F, 0
		add	[bp+arg_4], 1Fh
		and	[bp+arg_4], 0FFFFFFF0h
		mov	eax, dword_7AC1B
		mov	[bp+var_C], eax
		mov	[bp+var_D], 0
		cmp	dword_7AC1B, 0
		jz	short loc_64822

loc_647DE:
		push	1
		push	large [bp+var_C]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnb	short loc_6480A
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		jmp	short loc_6480E

loc_6480A:
		mov	[bp+var_D], 1

loc_6480E:
		mov	eax, [bp+var_C]
		cmp	eax, dword_7AC1B
		jz	short loc_64822
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_647DE

loc_64822:
		cmp	[bp+var_D], 0
		jnz	short loc_6482B
		jmp	loc_64925

loc_6482B:
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnz	short loc_6484B
		or	dword ptr es:[bx], 1
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_644BE
		add	sp, 4
		jmp	loc_648D9

loc_6484B:
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		sub	eax, [bp+arg_4]
		mov	[bp+var_1A], eax
		mov	eax, es:[bx]
		add	eax, [bp+var_C]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_C]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx], eax
		push	1
		push	large [bp+var_12]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		mov	eax, [bp+arg_4]
		or	eax, 1
		les	bx, [bp+var_8]
		mov	es:[bx], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+4], eax
		push	1
		push	large [bp+var_16]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_12]
		mov	es:[bx+4], eax
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_64559
		add	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax

loc_648D9:
		mov	eax, [bp+var_C]
		add	eax, [bp+arg_4]
		dec	eax
		shr	eax, 0Eh
		inc	ax
		mov	edx, [bp+var_C]
		add	edx, 10h
		shr	edx, 0Eh
		sub	ax, dx
		mov	si, ax
		cmp	si, 4
		jbe	short loc_64906
		push	1513h
		call	sub_1DDFE
		pop	cx

loc_64906:
		movzx	eax, si
		shl	eax, 18h
		mov	edx, 1
		or	edx, eax
		or	[bp+var_C], edx
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_64934

loc_64925:
		cmp	[bp+arg_8], 0
		jz	short loc_64934
		push	1503h
		call	sub_1DDFE
		pop	cx

loc_64934:
		mov	byte_7AC28, 0

loc_64939:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_6478E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6494D		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_64969
		jmp	loc_64A63

loc_64969:
		cmp	byte_7AC1A, 0
		jz	short loc_64973
		jmp	loc_64A63

loc_64973:
		push	large [bp+arg_0]
		call	sub_63E78
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64993
		mov	byte_7AC1A, 1
		push	1509h
		call	sub_1DDFE
		pop	cx

loc_64993:
		push	cs
		call	near ptr sub_6435F
		mov	byte_7AC1F, 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_8], eax
		push	eax
		nop
		push	cs
		call	near ptr sub_64A65
		add	sp, 4
		push	1
		push	large [bp+var_8]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		and	dword ptr es:[bx], 0FFFFFFFEh
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jz	short loc_64A40
		push	1
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		test	dword ptr es:[bx], 1
		jnz	short loc_64A40
		mov	eax, [bp+var_C]
		add	es:[bx], eax
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		push	eax
		push	cs
		call	near ptr sub_64559
		jmp	short loc_64A48

loc_64A40:
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_64382

loc_64A48:
		add	sp, 4
		mov	[bp+var_14], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_14]
		mov	es:[bx], eax
		mov	byte_7AC28, 0

loc_64A63:
		leave
		retf
sub_6494D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64A65		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		mov	edx, [bp+arg_0]
		add	edx, eax
		mov	[bp+var_8], edx
		push	1
		push	edx
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		test	[bp+var_C], 1
		jnz	short loc_64B0C
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_644BE
		add	sp, 4
		push	1
		push	large [bp+arg_0]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		add	es:[bx], eax

loc_64B0C:
		leave
		retf
sub_64A65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64B0E		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, byte_7AC1F
		mov	ah, 0
		or	ax, ax
		jz	short loc_64B21
		jmp	loc_64BB3

loc_64B21:
		mov	al, byte_7AC1A
		mov	ah, 0
		or	ax, ax
		jz	short loc_64B2D
		jmp	loc_64BB3

loc_64B2D:
		mov	eax, dword_7AC1B
		mov	[bp+var_8], eax
		mov	si, 4E20h
		mov	byte_7AC1F, 1
		xor	eax, eax
		mov	dword_7AC24, eax
		mov	dword_7AC20, eax
		cmp	dword_7AC1B, 0
		jz	short loc_64BB3

loc_64B50:
		push	1
		push	large [bp+var_8]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, dword_7AC24
		jbe	short loc_64B76
		mov	dword_7AC24, eax

loc_64B76:
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		add	dword_7AC20, eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		cmp	eax, dword_7AC1B
		jz	short loc_64B99
		mov	ax, si
		dec	si
		or	ax, ax
		jg	short loc_64B50

loc_64B99:
		sub	dword_7AC24, 10h
		or	si, si
		jg	short loc_64BB3
		mov	byte_7AC1A, 1
		xor	eax, eax
		mov	dword_7AC20, eax
		mov	dword_7AC24, eax

loc_64BB3:
		mov	eax, dword_7AC20
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_64B0E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64BBF		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_7AC1F
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64C26
		mov	al, byte_7AC1A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64C26
		cmp	dword_7AC1B, 0
		jz	short loc_64C1D
		push	1
		push	large dword_7AC1B
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	1
		les	bx, [bp+var_4]
		push	large es:[bx+8]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		sub	eax, 10h
		mov	dword_7AC24, eax
		jmp	short loc_64C26

loc_64C1D:
		mov	dword_7AC24, 0

loc_64C26:
		mov	eax, dword_7AC24
		shld	edx, eax, 10h
		leave
		retf
sub_64BBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64C31		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bl, [bp+arg_0]
		mov	eax, dword_7AC1B
		mov	[bp+var_14], eax
		movzx	eax, bl
		shl	eax, 8
		movzx	edx, bl
		or	eax, edx
		shl	edx, 8
		movzx	ebx, bl
		or	edx, ebx
		shl	edx, 10h
		or	eax, edx
		mov	[bp+var_10], eax
		cmp	dword_7AC1B, 0
		jnz	short loc_64C73
		jmp	loc_64D23

loc_64C73:
		mov	al, byte_7AC1A
		mov	ah, 0
		or	ax, ax
		jz	short loc_64C7F
		jmp	loc_64D23

loc_64C7F:
		push	1
		push	large [bp+var_14]
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		sub	eax, 10h
		mov	[bp+var_1C], eax
		jmp	short loc_64D0A

loc_64CB1:
		cmp	[bp+var_1C], 0FFF0h
		jnb	short loc_64CC5
		mov	eax, [bp+var_1C]
		shr	eax, 2
		jmp	short loc_64CC8

loc_64CC5:
		mov	ax, 3FFCh

loc_64CC8:
		mov	si, ax
		push	4
		mov	eax, [bp+var_14]
		add	eax, [bp+var_C]
		sub	eax, [bp+var_1C]
		push	eax
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		movzx	eax, si
		shl	eax, 2
		sub	[bp+var_1C], eax
		jmp	short loc_64D06

loc_64CF6:
		les	bx, [bp+var_18]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		dec	si
		add	[bp+var_18], 4

loc_64D06:
		or	si, si
		ja	short loc_64CF6

loc_64D0A:
		cmp	[bp+var_1C], 0
		ja	short loc_64CB1
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	eax, dword_7AC1B
		jz	short loc_64D23
sub_64C31		endp
seg146		ends
