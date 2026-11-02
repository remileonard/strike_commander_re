seg097		segment	para public 'CODE' use16
		assume cs:seg097
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_319C1		proc far
		push	bp
		mov	bp, sp

loc_319C4:
		pushf

loc_319C5:
		cmp	byte_4D048, 0
		jnz	short loc_319C5
		cli
		cmp	byte_4D048, 0
		jz	short loc_319D5
		popf

loc_319D5:
		cmp	byte_4D048, 0
		jnz	short loc_319C4
		mov	byte_4D048, 1
		popf
		pop	bp
		retf
sub_319C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_319E4		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		cmp	dword_4D03B, 0
		jnz	short loc_31A1B
		mov	eax, [bp+arg_0]
		mov	dword_4D03B, eax
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	loc_31B19

loc_31A1B:
		mov	eax, dword_4D03B
		mov	[bp+var_8], eax
		push	1
		push	large [bp+arg_0]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		push	1
		push	large dword_4D03B
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jbe	short loc_31A6E
		mov	eax, [bp+arg_0]
		mov	dword_4D03B, eax
		jmp	short loc_31AA4

loc_31A6E:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	eax, [bp+var_8]
		cmp	eax, dword_4D03B
		jz	short loc_31AA4
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jb	short loc_31A6E

loc_31AA4:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	sub_31186
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
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]

loc_31B19:
		mov	es:[bx+8], eax
		leave
		retf
sub_319E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31B20		proc far

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
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+arg_0]
		jnz	short loc_31B53
		mov	dword_4D03B, 0
		jmp	short loc_31BB9

loc_31B53:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		cmp	eax, dword_4D03B
		jnz	short loc_31B7B
		mov	eax, [bp+var_C]
		mov	dword_4D03B, eax

loc_31B7B:
		push	1
		push	large [bp+var_8]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax

loc_31BB9:
		leave
		retf
sub_31B20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31BBB		proc far

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
		call	sub_31186
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
		jnz	short loc_31C38
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_10]
		jnz	short loc_31C09
		jmp	loc_31DEE

loc_31C09:
		mov	dword_4D03B, eax
		push	1
		push	large [bp+var_10]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_31C31
		jmp	loc_31DEE

loc_31C31:
		mov	eax, [bp+var_10]
		jmp	loc_31DEA

loc_31C38:
		mov	al, 1
		mov	[bp+var_12], al
		mov	[bp+var_11], al
		push	1
		push	large [bp+var_10]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jnb	short loc_31C6C
		mov	eax, [bp+var_10]
		cmp	eax, dword_4D03B
		jnz	short loc_31CA2

loc_31C6C:
		push	1
		push	large [bp+var_C]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jbe	short loc_31C98
		mov	eax, [bp+arg_0]
		cmp	eax, dword_4D03B
		jnz	short loc_31C9E

loc_31C98:
		mov	[bp+var_12], 0
		jmp	short loc_31CA2

loc_31C9E:
		mov	[bp+var_11], 0

loc_31CA2:
		cmp	[bp+var_12], 0
		jnz	short loc_31CAB
		jmp	loc_31DEE

loc_31CAB:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_31B20
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_31D11
		push	1
		push	large [bp+var_10]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_31CD0:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_4D03B
		jz	short loc_31D60
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_31CD0
		jmp	short loc_31D60

loc_31D11:
		push	1
		push	large [bp+var_C]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_31D25:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		cmp	eax, dword_4D03B
		jz	short loc_31D60
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		ja	short loc_31D25

loc_31D60:
		push	1
		push	large [bp+var_16]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_1A]
		call	sub_31186
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
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_1A]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_16]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_4D03B
		jnz	short loc_31DEE
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_1E]
		jnb	short loc_31DEE
		mov	eax, [bp+arg_0]

loc_31DEA:
		mov	dword_4D03B, eax

loc_31DEE:
		leave
		retf
sub_31BBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31DF0		proc far

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
		cmp	byte_4D03A, 0
		jz	short loc_31E09
		jmp	loc_31F9B

loc_31E09:
		cmp	[bp+arg_4], 0
		jnz	short loc_31E19
		push	1504h
		call	sub_13451
		pop	cx

loc_31E19:
		push	cs
		call	near ptr sub_319C1
		mov	byte_4D03F, 0
		add	[bp+arg_4], 1Fh
		and	[bp+arg_4], 0FFFFFFF0h
		mov	eax, dword_4D03B
		mov	[bp+var_C], eax
		mov	[bp+var_D], 0
		cmp	dword_4D03B, 0
		jz	short loc_31E84

loc_31E40:
		push	1
		push	large [bp+var_C]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnb	short loc_31E6C
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		jmp	short loc_31E70

loc_31E6C:
		mov	[bp+var_D], 1

loc_31E70:
		mov	eax, [bp+var_C]
		cmp	eax, dword_4D03B
		jz	short loc_31E84
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_31E40

loc_31E84:
		cmp	[bp+var_D], 0
		jnz	short loc_31E8D
		jmp	loc_31F87

loc_31E8D:
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnz	short loc_31EAD
		or	dword ptr es:[bx], 1
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_31B20
		add	sp, 4
		jmp	loc_31F3B

loc_31EAD:
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
		call	sub_31186
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
		call	sub_31186
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_12]
		mov	es:[bx+4], eax
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_31BBB
		add	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax

loc_31F3B:
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
		jbe	short loc_31F68
		push	1513h
		call	sub_13451
		pop	cx

loc_31F68:
		movzx	eax, si
		shl	eax, 18h
		mov	edx, 1
		or	edx, eax
		or	[bp+var_C], edx
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_31F96

loc_31F87:
		cmp	[bp+arg_8], 0
		jz	short loc_31F96
		push	1503h
		call	sub_13451
		pop	cx

loc_31F96:
		mov	byte_4D048, 0

loc_31F9B:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_31DF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31FAF		proc far

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
		jnz	short loc_31FCB
		jmp	loc_320C5

loc_31FCB:
		cmp	byte_4D03A, 0
		jz	short loc_31FD5
		jmp	loc_320C5

loc_31FD5:
		push	large [bp+arg_0]
		call	sub_313D0
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31FF5
		mov	byte_4D03A, 1
		push	1509h
		call	sub_13451
		pop	cx

loc_31FF5:
		push	cs
		call	near ptr sub_319C1
		mov	byte_4D03F, 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_8], eax
		push	eax
		nop
		push	cs
		call	near ptr sub_320C7
		add	sp, 4
		push	1
		push	large [bp+var_8]
		call	sub_31186
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
		jz	short loc_320A2
		push	1
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		test	dword ptr es:[bx], 1
		jnz	short loc_320A2
		mov	eax, [bp+var_C]
		add	es:[bx], eax
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		push	eax
		push	cs
		call	near ptr sub_31BBB
		jmp	short loc_320AA

loc_320A2:
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_319E4

loc_320AA:
		add	sp, 4
		mov	[bp+var_14], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_14]
		mov	es:[bx], eax
		mov	byte_4D048, 0

loc_320C5:
		leave
		retf
sub_31FAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_320C7		proc far

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
		call	sub_31186
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
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		test	[bp+var_C], 1
		jnz	short loc_3216E
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_31B20
		add	sp, 4
		push	1
		push	large [bp+arg_0]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		add	es:[bx], eax

loc_3216E:
		leave
		retf
sub_320C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32170		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, byte_4D03F
		mov	ah, 0
		or	ax, ax
		jz	short loc_32183
		jmp	loc_32215

loc_32183:
		mov	al, byte_4D03A
		mov	ah, 0
		or	ax, ax
		jz	short loc_3218F
		jmp	loc_32215

loc_3218F:
		mov	eax, dword_4D03B
		mov	[bp+var_8], eax
		mov	si, 4E20h
		mov	byte_4D03F, 1
		xor	eax, eax
		mov	dword_4D044, eax
		mov	dword_4D040, eax
		cmp	dword_4D03B, 0
		jz	short loc_32215

loc_321B2:
		push	1
		push	large [bp+var_8]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, dword_4D044
		jbe	short loc_321D8
		mov	dword_4D044, eax

loc_321D8:
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		add	dword_4D040, eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		cmp	eax, dword_4D03B
		jz	short loc_321FB
		mov	ax, si
		dec	si
		or	ax, ax
		jg	short loc_321B2

loc_321FB:
		sub	dword_4D044, 10h
		or	si, si
		jg	short loc_32215
		mov	byte_4D03A, 1
		xor	eax, eax
		mov	dword_4D040, eax
		mov	dword_4D044, eax

loc_32215:
		mov	eax, dword_4D040
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_32170		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32221		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_4D03F
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32288
		mov	al, byte_4D03A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32288
		cmp	dword_4D03B, 0
		jz	short loc_3227F
		push	1
		push	large dword_4D03B
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	1
		les	bx, [bp+var_4]
		push	large es:[bx+8]
		call	sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		sub	eax, 10h
		mov	dword_4D044, eax
		jmp	short loc_32288

loc_3227F:
		mov	dword_4D044, 0

loc_32288:
		mov	eax, dword_4D044
		shld	edx, eax, 10h
		leave
		retf
sub_32221		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32293		proc far

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
		mov	eax, dword_4D03B
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
		cmp	dword_4D03B, 0
		jnz	short loc_322D5
		jmp	loc_32385

loc_322D5:
		mov	al, byte_4D03A
		mov	ah, 0
		or	ax, ax
		jz	short loc_322E1
		jmp	loc_32385

loc_322E1:
		push	1
		push	large [bp+var_14]
		call	sub_31186
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
		jmp	short loc_3236C

loc_32313:
		cmp	[bp+var_1C], 0FFF0h
		jnb	short loc_32327
		mov	eax, [bp+var_1C]
		shr	eax, 2
		jmp	short loc_3232A

loc_32327:
		mov	ax, 3FFCh

loc_3232A:
		mov	si, ax
		push	4
		mov	eax, [bp+var_14]
		add	eax, [bp+var_C]
		sub	eax, [bp+var_1C]
		push	eax
		call	sub_31186
		add	sp, 6
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		movzx	eax, si
		shl	eax, 2
		sub	[bp+var_1C], eax
		jmp	short loc_32368

loc_32358:
		les	bx, [bp+var_18]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		dec	si
		add	[bp+var_18], 4

loc_32368:
		or	si, si
		ja	short loc_32358

loc_3236C:
		cmp	[bp+var_1C], 0
		ja	short loc_32313
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	eax, dword_4D03B
sub_32293		endp
seg097		ends
