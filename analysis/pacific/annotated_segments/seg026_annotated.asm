seg026		segment	para public 'CODE' use16
		assume cs:seg026
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10323		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_1034B
		push	1
		push	0
		push	2
		push	large 0Dh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_10379

loc_1034B:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 55Eh
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	byte ptr es:[bx+0Ch], 0
		mov	dword ptr es:[bx+2], 0

loc_10379:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_10323		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10381		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, es:[bx+6]
		mov	es:[bx+0Fh], ax
		mov	es:[bx+0Dh], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		les	bx, es:[bx+6]
		mov	es:[bx+19h], al
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+2], 0
		jnz	short loc_103C9
		push	1
		push	large es:[bx+6]
		les	bx, es:[bx+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 6

loc_103C9:
		pop	bp
		retf
sub_10381		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_103CB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+0Dh], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		les	bx, es:[bx+6]
		mov	es:[bx+19h], al
		push	0
		les	bx, [bp+arg_0]
		push	large es:[bx+6]
		les	bx, es:[bx+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 6
		pop	bp
		retf
sub_103CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10409		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+0Fh]
		mov	dx, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		mov	es:[bx+2], dx
		les	bx, es:[bx+6]
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	es:[bx+0Fh], ax
		mov	es:[bx+0Dh], dx
		pop	bp
		retf
sub_10409		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1043A		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_1043A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10441		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_10479
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 55Eh
		test	ax, 1
		jz	short loc_10479
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_10479:
		leave
		retf
sub_10441		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1047B		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		mov	di, si
		add	di, 6
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+13h], eax
		mov	ax, [si]
		cmp	ax, word_7CADA
		jnz	short loc_104B7
		mov	ax, 1
		jmp	short loc_104B9

loc_104B7:
		xor	ax, ax

loc_104B9:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], al
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		movzx	eax, word ptr [bx+60D4h]
		cmp	eax, dword_7C837
		jle	short loc_104E0
		mov	ax, 5
		jmp	short loc_104E3

loc_104E0:
		mov	ax, 8

loc_104E3:
		call	Math_RandomScale_56C2F
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], ax
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_1047B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10503		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+13h], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_1053D
		mov	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+17h], 0
		jz	short loc_1053D
		mov	byte_776B2, 1

loc_1053D:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		cmp	bx, 7
		ja	short loc_10594
		shl	bx, 1
		jmp	cs:off_105B1[bx]	; switch jump

loc_10550:
		mov	word_7C835, 0FFE2h

loc_10556:
		mov	word_7C82F, 1Eh
		jmp	short loc_10594

loc_1055E:
		jmp	short loc_10556

loc_10560:
		mov	word_7C82F, 1Eh
		jmp	short loc_1058E

loc_10568:
		mov	word_7C82F, 0
		jmp	short loc_10578

loc_10570:
		jmp	short loc_10568

loc_10572:
		mov	word_7C82F, 0FFE2h

loc_10578:
		mov	word_7C835, 0FFE2h
		jmp	short loc_10594

loc_10580:
		mov	word_7C82F, 0FFE2h
		jmp	short loc_10594

loc_10588:
		mov	word_7C82F, 0FFE2h

loc_1058E:
		mov	word_7C835, 1Eh

loc_10594:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+13h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_105AF
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_105AF:
		pop	bp
		retf
sub_10503		endp

; START OF FUNCTION CHUNK FOR sub_10503
off_105B1	dw offset loc_10550
		dw offset loc_1055E
		dw offset loc_10560
		dw offset loc_10568
		dw offset loc_10570
		dw offset loc_10572
		dw offset loc_10580
		dw offset loc_10588
; END OF FUNCTION CHUNK FOR sub_10503

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_105C1		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		mov	[bp+var_4], 800h
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+13h], eax
		mov	word ptr es:[bx+11h], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		leave
		retf
sub_105C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_105FE		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+13h], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		cmp	bx, 3
		jbe	short loc_1062E
		jmp	loc_106C9

loc_1062E:
		shl	bx, 1
		jmp	cs:off_106E6[bx]	; switch jump

loc_10635:
		mov	word_7C833, 0
		mov	ax, word_7C831
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 14h
		jge	short loc_106C9

loc_1064B:
		les	bx, word ptr [bp+arg_0]
		inc	word ptr es:[bx+11h]
		jmp	short loc_106C9

loc_10654:
		mov	word_7C833, 0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60CBh]
		mov	ah, 0
		mov	[bp+var_4], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], ax
		cmp	word_7C82D, 23h
		jle	short loc_106C9
		jmp	short loc_1064B

loc_1068A:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60CBh]
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], ax
		cmp	word_7C82D, 1Eh
		jge	short loc_106C9
		jmp	short loc_1064B

loc_106BA:
		mov	word_7C82F, 0
		cmp	word_7C82D, 0Fh
		jge	short loc_106C9
		jmp	short loc_106D9

loc_106C9:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+13h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_106E4

loc_106D9:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_106E4:
		leave
		retf
sub_105FE		endp

; START OF FUNCTION CHUNK FOR sub_105FE
off_106E6	dw offset loc_10635
		dw offset loc_10654
		dw offset loc_1068A
		dw offset loc_106BA
; END OF FUNCTION CHUNK FOR sub_105FE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_106EE		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		cmp	word ptr [si+4], 0
		jz	short loc_10774
		mov	di, si
		add	di, 6
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Dh], eax
		mov	si, [si+4]
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	eax, [si+8]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+15h], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+19h], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+85h], 0FFh
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		jmp	short loc_1077C

loc_10774:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10381

loc_1077C:
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_106EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10783		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+1Dh], eax
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 11h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	dword_7C811, eax
		mov	eax, es:[si+4]
		mov	dword_7C815, eax
		mov	eax, es:[si+8]
		mov	dword_7C819, eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Dh]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_107EA
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_107EA:
		pop	si
		leave
		retf
sub_10783		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_107ED		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Ah], 0
		add	si, 6
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
sub_107ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10839		proc far

var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+11h], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+85h], 0FFh
		jz	short loc_10871
		mov	ax, 1
		jmp	short loc_10873

loc_10871:
		xor	ax, ax

loc_10873:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_108A1
		mov	ax, word_7C82D
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0Fh
		jge	short loc_1089B
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+85h], 0
		jmp	short loc_108A1

loc_1089B:
		mov	word_7C82F, 0

loc_108A1:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+11h]
		sar	eax, 1Fh
		or	al, al
		jnz	short loc_108C0
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Ah], 0
		jz	short loc_108DB

loc_108C0:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+85h], 0FFh
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_108DB:
		leave
		retf
sub_10839		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_108DD		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		mov	di, si
		add	di, 6
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+13h], eax
		mov	ax, [si]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 11h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+85h], 0FFh
		mov	eax, dword_7C7C3
		mov	dword_7C811, eax
		mov	eax, dword_7C7C7
		mov	dword_7C815, eax
		mov	eax, dword_7C7CB
		mov	dword_7C819, eax
		mov	ax, word_7C7D3
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1Eh
		jge	short loc_1098E
		mov	eax, dword_7C7DF
		mov	ebx, 3
		cdq
		idiv	ebx
		cmp	eax, dword_7C7D9
		jle	short loc_10986
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0B2h], 0
		jz	short loc_10986
		mov	ax, word_7C7DD
		jmp	short loc_1099D

loc_10986:
		mov	ax, word_7C7DD
		add	ax, 1Eh
		jmp	short loc_1099D

loc_1098E:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]

loc_1099D:
		mov	word_7C82B, ax
		pop	di
		pop	si
		leave
		retf
sub_108DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_109A4		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+13h], eax
		cmp	word ptr es:[bx+11h], 0
		jnz	short loc_109C0
		jmp	loc_10AF7

loc_109C0:
		push	word ptr es:[bx+11h]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_9D0A
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_10A28
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, word_7CADA
		jnz	short loc_10A28
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jge	short loc_10A28
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1Eh
		jge	short loc_10A28
		mov	ax, word_7C7D5
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 1Eh
		jge	short loc_10A28
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_6], ax
		push	ax
		push	63AEh
		call	SetReference16
		add	sp, 4

loc_10A28:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_10A59
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, word_7CADA
		jnz	short loc_10A59
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jge	short loc_10A59
		cmp	word_7C7D7, 1Eh
		jge	short loc_10A59
		mov	byte_776B2, 1

loc_10A59:
		mov	eax, dword_7C7C3
		mov	dword_7C811, eax
		mov	eax, dword_7C7C7
		mov	dword_7C815, eax
		mov	eax, dword_7C7CB
		mov	dword_7C819, eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_8], ax
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jge	short loc_10AE5
		mov	eax, dword_7C7DF
		sar	eax, 1
		cmp	eax, dword_7C7D9
		jle	short loc_10ADD
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0B2h], 0
		jz	short loc_10AD5
		mov	ax, word_7C7DD
		jmp	short loc_10AF4

loc_10AD5:
		mov	ax, word_7C7DD
		add	ax, 1Eh
		jmp	short loc_10AF4

loc_10ADD:
		mov	ax, word_7C7DD
		add	ax, 19h
		jmp	short loc_10AF4

loc_10AE5:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]

loc_10AF4:
		mov	word_7C82B, ax

loc_10AF7:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+11h], 0
		jz	short loc_10B0E
		mov	eax, es:[bx+13h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_10B19

loc_10B0E:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_103CB
		add	sp, 4

loc_10B19:
		leave
		retf
sub_109A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10B1B		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		mov	[bp+var_4], 400h
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		leave
		retf
sub_10B1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10B52		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+11h], eax
		cmp	dword_7C837, 0C8h
		jge	short loc_10B92
		les	bx, es:[bx+0Dh]
		push	large es:[bx+0DAh]
		call	sub_41612
		add	sp, 4
		or	al, al
		jz	short loc_10B92
		les	bx, [bp+arg_0]
		push	large es:[bx+0Dh]
		call	sub_A58C
		add	sp, 4

loc_10B92:
		mov	word_7C82F, 14h
		mov	word_7C833, 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	byte_7C847, 1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+11h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_10BD0
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_10BD0:
		pop	bp
		retf
sub_10B52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10BD2		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		mov	[bp+var_4], 800h
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		leave
		retf
sub_10BD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10C09		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+11h], eax
		cmp	dword_7C837, 0C8h
		jge	short loc_10C49
		les	bx, es:[bx+0Dh]
		push	large es:[bx+0DAh]
		call	sub_41612
		add	sp, 4
		or	al, al
		jz	short loc_10C49
		les	bx, [bp+arg_0]
		push	large es:[bx+0Dh]
		call	sub_A58C
		add	sp, 4

loc_10C49:
		mov	word_7C82F, 5
		mov	word_7C833, 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	byte_7C847, 1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+11h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_10C87
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_10C87:
		pop	bp
		retf
sub_10C09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10C89		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+12h], 0
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	es:[bx+14h], eax
		mov	ax, [si]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+11h], 1
		cmp	word_7C82D, 0
		jge	short loc_10CF2
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		movzx	eax, word ptr [bx+60D4h]
		cmp	eax, dword_7C837
		jle	short loc_10CF2

loc_10CEE:
		mov	al, 0
		jmp	short loc_10D39

loc_10CF2:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_11393
		add	sp, 4
		or	al, al
		jz	short loc_10CEE
		cmp	byte_7C7C2, 6
		jnz	short loc_10CEE
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1125E
		add	sp, 4
		mov	dx, ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0BBh]
		cbw
		shl	ax, 1
		add	dx, ax
		cmp	dx, 64h
		jl	short loc_10D31
		mov	al, 0Ah
		jmp	short loc_10D39

loc_10D31:
		mov	ax, dx
		mov	bx, 0Ah
		cwd
		idiv	bx

loc_10D39:
		pop	si
		leave
		retf
sub_10C89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10D3C		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+11h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10D5E
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_10D5E:
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+12h], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_10D3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10D82		proc far

var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 110h
		push	si
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+14h], eax
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Bh], 0FDh
		mov	al, 0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Bh], 0BFh
		shl	al, 6
		or	es:[bx+1Bh], al
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_10DCD
		inc	byte ptr dword_776B3

loc_10DCD:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1Eh], 0
		jnz	short loc_10DDA
		jmp	loc_11237

loc_10DDA:
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 85h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_14]
		mov	[bp+var_16], ss
		mov	[bp+var_18], ax
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_80]
		push	ax
		mov	bx, es:[bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_8C]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_80]
		sub	eax, [bp+var_8C]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_7C]
		sub	eax, [bp+var_88]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_78]
		sub	eax, [bp+var_84]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_6C], eax
		cmp	word_7C7D5, 5Ah
		jge	short loc_10EDE
		push	eax
		push	large [bp+var_70]

loc_10EC0:
		push	large [bp+var_74]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		add	[bp+var_C], eax
		jmp	short loc_10F02

loc_10EDE:
		push	large [bp+var_6C]
		push	large [bp+var_70]
		push	large [bp+var_74]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		sub	[bp+var_C], eax

loc_10F02:
		push	large dword_7C7CB
		push	large dword_7C7C7
		push	large dword_7C7C3
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	[bp+var_8], eax
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+1Eh]
		add	si, 12h
		push	word ptr es:[bx+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_B0]
		push	ax
		mov	bx, es:[bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_B0]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_AC]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_A8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_B4], eax
		mov	eax, [si]
		add	eax, [bp+var_BC]
		mov	[bp+var_C8], eax
		mov	eax, [si+4]
		add	eax, [bp+var_B8]
		mov	[bp+var_C4], eax
		mov	eax, [si+8]
		add	eax, [bp+var_B4]
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_C8]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_8]
		inc	eax
		push	eax
		mov	eax, [bp+var_8]
		pop	edx
		imul	eax, edx
		mov	ebx, 2
		cdq
		idiv	ebx
		imul	eax, dword_7942B
		mov	ebx, 1000000h
		cdq
		idiv	ebx
		mov	[bp+var_58], eax
		shl	eax, 8
		sub	[bp+var_60], eax
		mov	ax, 0Ah
		call	Math_RandomJitter_56C57
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	[bp+var_5A], ax
		movsx	eax, [bp+var_5A]
		shl	eax, 8
		sub	[bp+var_60], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_E0]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, dword_7C83B
		add	eax, [bp+var_E0]
		mov	[bp+var_EC], eax
		mov	eax, dword_7C83F
		add	eax, [bp+var_DC]
		mov	[bp+var_E8], eax
		mov	eax, dword_7C843
		add	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_68]
		sub	eax, [bp+var_F8]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_64]
		sub	eax, [bp+var_F4]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_60]
		sub	eax, [bp+var_F0]
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_104]
		mov	[bp+var_110], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_110]
		mov	dword_7C811, eax
		mov	eax, [bp+var_10C]
		mov	dword_7C815, eax
		mov	eax, [bp+var_108]
		mov	dword_7C819, eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		mov	bx, es:[bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_4], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	ax, [bp+var_4]
		mov	[bp+var_5C], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jge	short loc_111DD
		mov	eax, dword_7C7DF
		sar	eax, 1
		cmp	eax, dword_7C7D9
		jle	short loc_111DD
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0B2h], 0
		jz	short loc_111D4
		mov	ax, word_7C7DD
		jmp	short loc_111DA

loc_111D4:
		mov	ax, word_7C7DD
		add	ax, 1Eh

loc_111DA:
		mov	word_7C82B, ax

loc_111DD:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1125E
		add	sp, 4
		mov	[bp+var_2], ax
		cmp	ax, 4Bh
		jle	short loc_11237
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		push	large es:[bx+0Dh]
		call	sub_A932
		add	sp, 6
		cmp	[bp+var_2], 64h
		jle	short loc_11220
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		push	large es:[bx+0D6h]
		call	sub_3F15E
		add	sp, 4

loc_11220:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		les	bx, word ptr [bp+arg_0]
		inc	byte ptr es:[bx+12h]

loc_11237:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+14h]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_11250
		cmp	word ptr es:[bx+1Eh], 0
		jnz	short loc_1125B

loc_11250:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_1125B:
		pop	si
		leave
		retf
sub_10D82		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1125E		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		xor	cx, cx
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1Eh], 0
		jnz	short loc_11274
		jmp	loc_1138E

loc_11274:
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	60E1h
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_6]
		or	eax, eax
		jge	short loc_112A2
		neg	eax

loc_112A2:
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		mov	si, word ptr [bp+var_E+1]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	6093h
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_12]
		or	eax, eax
		jge	short loc_112E2
		neg	eax

loc_112E2:
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_2], ax
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jge	short loc_1130A
		mov	ax, si
		imul	si
		mov	cx, 64h
		sub	cx, ax
		jmp	short loc_11324

loc_1130A:
		mov	eax, dword_7C7DF
		shl	eax, 1
		cmp	eax, dword_7C7D9
		jle	short loc_11322
		cmp	si, 1
		jg	short loc_11322
		mov	cx, 0Fh
		jmp	short loc_11324

loc_11322:
		xor	cx, cx

loc_11324:
		cmp	[bp+var_2], 1Eh
		jle	short loc_1133F
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 0
		jz	short loc_11356
		mov	al, es:[bx+12h]
		mov	ah, 0
		mov	dx, 14h
		jmp	short loc_11352

loc_1133F:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 0
		jz	short loc_11356
		mov	al, es:[bx+12h]
		mov	ah, 0
		mov	dx, 0Ah

loc_11352:
		sub	dx, ax
		add	cx, dx

loc_11356:
		cmp	dword_7C7D9, 1F4h
		jge	short loc_11379
		mov	eax, 1F4h
		sub	eax, dword_7C7D9
		mov	ebx, 14h
		cdq
		idiv	ebx
		add	cx, ax

loc_11379:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B4h]
		cbw
		add	cx, ax
		or	cx, cx
		jge	short loc_1138E
		xor	cx, cx

loc_1138E:
		mov	ax, cx
		pop	si
		leave
		retf
sub_1125E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11393		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	ax, es:[bx+0D8h]
		mov	dx, es:[bx+0D6h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1Eh], 0
		jnz	short loc_113BD
		jmp	loc_11479

loc_113BD:
		push	40h
		push	ax
		push	dx
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		or	al, al
		jnz	short loc_113D0
		jmp	loc_11479

loc_113D0:
		push	large [bp+var_4]
		call	sub_3EF67
		add	sp, 4
		push	40h
		push	large [bp+var_4]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		or	al, al
		jnz	short loc_113F1
		jmp	loc_11475

loc_113F1:
		cmp	dword_7C7D9, 1F4h
		jge	short loc_1140A
		push	large [bp+var_4]
		call	sub_3F15E
		add	sp, 4
		jmp	short loc_11475

loc_1140A:
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+1Eh], 0
		jz	short loc_1143E
		cmp	word ptr es:[bx+22h], 0
		jz	short loc_1143E
		jmp	short loc_11429

loc_1141D:
		push	large [bp+var_4]
		call	sub_3EF67
		add	sp, 4

loc_11429:
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+12h]
		and	al, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_1141D
		jmp	short loc_11475

loc_1143E:
		mov	[bp+var_5], 0
		jmp	short loc_1146C

loc_11444:
		push	large [bp+var_4]
		call	sub_3EF67
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+18h]
		test	byte ptr es:[bx+12h], 1
		jz	short loc_1146C
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+1Ch], 1
		jnz	short loc_1146C
		mov	[bp+var_5], 1

loc_1146C:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jz	short loc_11444

loc_11475:
		mov	al, 40h
		jmp	short loc_1147B

loc_11479:
		mov	al, 0

loc_1147B:
		leave
		retf
sub_11393		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1147D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	cl, es:[bx+0B4h]
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+13h], 40h
		jz	short loc_114DD
		cmp	cl, 0Dh
		jle	short loc_114A9
		cmp	byte ptr es:[bx+12h], 14h
		jnb	short loc_114D9

loc_114A2:
		mov	ax, 1
		jmp	short loc_114DB
		jmp	short loc_114D9

loc_114A9:
		cmp	cl, 9
		jle	short loc_114BC
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 0Ch
		jnb	short loc_114D9
		jmp	short loc_114A2
		jmp	short loc_114D9

loc_114BC:
		cmp	cl, 4
		jle	short loc_114CF
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 6
		jnb	short loc_114D9
		jmp	short loc_114A2
		jmp	short loc_114D9

loc_114CF:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 3
		jb	short loc_114A2

loc_114D9:
		xor	ax, ax

loc_114DB:
		mov	dl, al

loc_114DD:
		mov	al, dl
		pop	bp
		retf
sub_1147D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_114E1		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		add	si, 6
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
sub_114E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1151D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+11h], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		cmp	ax, word_7C829
		jbe	short loc_11546
		mov	word_7C82F, 0
		jmp	short loc_1154C

loc_11546:
		mov	word_7C82F, 1Eh

loc_1154C:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+11h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_11579
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_11579:
		pop	bp
		retf
sub_1151D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1157B		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_10409
		add	sp, 6
		mov	[bp+var_4], 800h
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+12h], eax
		mov	byte ptr es:[bx+11h], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		leave
		retf
sub_1157B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_115B7		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+12h], eax
		mov	al, es:[bx+11h]
		cbw
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_115D8
		jmp	loc_116BB

loc_115D8:
		shl	bx, 1
		jmp	cs:off_116D8[bx]	; switch jump

loc_115DF:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	word_7C833, 0B4h
		mov	ax, word_7C831
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0A0h
		jg	short loc_1160A
		jmp	loc_116BB

loc_1160A:
		les	bx, [bp+arg_0]
		inc	byte ptr es:[bx+11h]
		jmp	loc_116BB

loc_11614:
		mov	word_7C833, 0B4h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		shl	ax, 1
		mov	word_7C82B, ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60CBh]
		mov	ah, 0
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], ax
		cmp	word_7C82D, 0FFDDh
		jge	short loc_116BB
		jmp	short loc_1160A

loc_1165E:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		shl	ax, 1
		mov	word_7C82B, ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		mov	bx, ax
		mov	al, [bx+60CBh]
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], ax
		cmp	word_7C82D, 0FFDDh
		jle	short loc_116BB
		jmp	loc_1160A

loc_116A3:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	word_7C82F, 0

loc_116BB:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+12h]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_116D6
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_10381
		add	sp, 4

loc_116D6:
		leave
		retf
sub_115B7		endp

; START OF FUNCTION CHUNK FOR sub_115B7
off_116D8	dw offset loc_115DF
		dw offset loc_11614
		dw offset loc_1165E
		dw offset loc_116A3
; END OF FUNCTION CHUNK FOR sub_115B7
seg026		ends
