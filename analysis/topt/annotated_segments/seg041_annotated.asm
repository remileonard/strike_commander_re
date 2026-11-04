seg041		segment	para public 'CODE' use16
		assume cs:seg041
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 0Eh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_193F7		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, [bp+arg_4]
		mov	[bp+var_4], 0
		jmp	short loc_19419

loc_1940A:
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_19419
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf

loc_19419:
		cmp	[bp+var_4], 0
		jnz	short loc_19435
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		jmp	short loc_19435

loc_19435:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_19451
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	short loc_1947B

loc_19451:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_1947B:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_19496
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_194A0

loc_19496:
		mov	[bp+var_4], 0
		mov	al, 0

loc_194A0:
		or	al, al
		jz	short loc_194A7
		jmp	loc_1940A

loc_194A7:
		xor	dx, dx
		xor	ax, ax
		leave
		retf
sub_193F7		endp

; START OF FUNCTION CHUNK FOR sub_193F7
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_193F7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_194AF		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		jmp	short loc_194F1

loc_194C2:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_194F1:
		cmp	[bp+var_4], 0
		jnz	short loc_194C2
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+14h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+16h], 0
		leave
		retf
sub_194AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1951D		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		jmp	short loc_19544

loc_19531:
		push	si
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_19544:
		cmp	[bp+var_4], 0
		jnz	short loc_19560
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		jmp	short loc_19560

loc_19560:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_1957C
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	short loc_195A6

loc_1957C:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_195A6:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_195C1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_195CB

loc_195C1:
		mov	[bp+var_4], 0
		mov	al, 0

loc_195CB:
		or	al, al
		jz	short loc_195D2
		jmp	loc_19531

loc_195D2:
		pop	si
		leave
		retf
sub_1951D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_195D5		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+6], al
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], eax
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+13h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], eax
		leave
		retf
sub_195D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19616		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_19649
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	bp
		retf
		jmp	short loc_1964D

loc_19649:
		mov	al, 0
		pop	bp
		retf
sub_19616		endp

; START OF FUNCTION CHUNK FOR sub_19616

loc_1964D:
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_19616

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1964F		proc far

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
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		cmp	[bp+arg_4], 0
		jnz	short loc_19660
		jmp	loc_19794

loc_19660:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 17h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_38], eax
		mov	eax, es:[si+4]
		mov	[bp+var_34], eax
		mov	eax, es:[si+8]
		mov	[bp+var_30], eax
		cmp	byte_4BFB8, 0
		jz	short loc_196EB
		mov	eax, dword_4F20A
		neg	eax
		mov	[bp+var_44], eax
		mov	eax, dword_4F20E
		neg	eax
		mov	[bp+var_40], eax
		mov	eax, dword_4F212
		neg	eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_2910D
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		jmp	short loc_19707

loc_196EB:
		push	682Ah
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_2910D
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_19707:
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 7
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		push	large dword_4F212
		push	large dword_4F20E
		push	large dword_4F20A
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	sub_27C78
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		cmp	eax, [bp+var_14]
		jge	short loc_19789
		mov	ax, 1
		jmp	short loc_1978B

loc_19789:
		xor	ax, ax

loc_1978B:
		or	al, al
		jz	short loc_19794
		mov	al, 1
		pop	si
		leave
		retf

loc_19794:
		mov	al, 0
		pop	si
		leave
		retf
sub_1964F		endp

; START OF FUNCTION CHUNK FOR sub_1964F
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1964F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1979C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_197CF
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	bp
		retf
		jmp	short loc_197D3

loc_197CF:
		mov	al, 0
		pop	bp
		retf
sub_1979C		endp

; START OF FUNCTION CHUNK FOR sub_1979C

loc_197D3:
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1979C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_197D5		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_197D5		endp

; START OF FUNCTION CHUNK FOR sub_197D5
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_197D5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_197DE		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], eax
		mov	eax, [si+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_8]
		mov	es:[bx+6], al
		pop	di
		pop	si
		pop	bp
		retf
sub_197DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19825		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_19858
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		pop	bp
		retf
		jmp	short loc_1985C

loc_19858:
		mov	al, 0
		pop	bp
		retf
sub_19825		endp

; START OF FUNCTION CHUNK FOR sub_19825

loc_1985C:
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_19825

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1985E		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1985E		endp

; START OF FUNCTION CHUNK FOR sub_1985E
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1985E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19867		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_1989A
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		pop	bp
		retf
		jmp	short loc_1989E

loc_1989A:
		mov	al, 0
		pop	bp
		retf
sub_19867		endp

; START OF FUNCTION CHUNK FOR sub_19867

loc_1989E:
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_19867

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_198A0		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	[bp+arg_4], 0
		jnz	short loc_198B1
		jmp	loc_199A0

loc_198B1:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 0Bh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		cmp	byte_4BFB8, 0
		jz	short loc_19910
		push	6806h
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_2BF97
		add	sp, 4
		mov	eax, [bp+var_10]
		add	dword_4F20A, eax
		mov	eax, [bp+var_C]
		add	dword_4F20E, eax
		mov	eax, [bp+var_8]
		add	dword_4F212, eax
		jmp	short loc_19976

loc_19910:
		push	67E2h
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_2BF97
		add	sp, 4
		mov	eax, [bp+var_10]
		sub	eax, dword_4F20A
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		sub	eax, dword_4F20E
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		sub	eax, dword_4F212
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	dword_4F20A, eax
		mov	eax, [bp+var_24]
		mov	dword_4F20E, eax
		mov	eax, [bp+var_20]
		mov	dword_4F212, eax

loc_19976:
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		pop	si
		leave
		retf
		jmp	short loc_199A5

loc_199A0:
		mov	al, 0
		pop	si
		leave
		retf
sub_198A0		endp

; START OF FUNCTION CHUNK FOR sub_198A0

loc_199A5:
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_198A0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_199A8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_199DB
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		pop	bp
		retf
		jmp	short loc_199DF

loc_199DB:
		mov	al, 0
		pop	bp
		retf
sub_199A8		endp

; START OF FUNCTION CHUNK FOR sub_199A8

loc_199DF:
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_199A8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_199E1		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	[bp+arg_4], 0
		jnz	short loc_199F2
		jmp	loc_19B56

loc_199F2:
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+0Bh]
		mov	[bp+var_28], eax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+0Fh]
		mov	[bp+var_24], eax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+13h]
		mov	[bp+var_20], eax
		cmp	byte_4BFB8, 0
		jz	short loc_19A55
		push	67E2h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_2BF97
		add	sp, 4
		mov	eax, dword_4F20A
		sub	[bp+var_28], eax
		mov	eax, dword_4F20E
		sub	[bp+var_24], eax
		mov	eax, dword_4F212
		sub	[bp+var_20], eax
		push	6806h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		jmp	short loc_19A8B

loc_19A55:
		push	6806h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_2BF97
		add	sp, 4
		mov	eax, dword_4F20A
		add	[bp+var_28], eax
		mov	eax, dword_4F20E
		add	[bp+var_24], eax
		mov	eax, dword_4F212
		add	[bp+var_20], eax
		push	67E2h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4

loc_19A8B:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+17h]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_18], eax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+7]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_28]
		mov	si, ax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jg	short loc_19AFE
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_4]
		jge	short loc_19B03

loc_19AFE:
		mov	al, 0
		pop	si
		leave
		retf

loc_19B03:
		mov	eax, [bp+var_24]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_C]
		jg	short loc_19B24
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_10]
		jge	short loc_19B29

loc_19B24:
		mov	al, 0
		pop	si
		leave
		retf

loc_19B29:
		mov	eax, [bp+var_20]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_14]
		jg	short loc_19B4A
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_18]
		jge	short loc_19B4F

loc_19B4A:
		mov	al, 0
		pop	si
		leave
		retf

loc_19B4F:
		mov	al, 1
		pop	si
		leave
		retf
		jmp	short loc_19B5B

loc_19B56:
		mov	al, 0
		pop	si
		leave
		retf
sub_199E1		endp

; START OF FUNCTION CHUNK FOR sub_199E1

loc_19B5B:
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_199E1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19B5E		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 0
		jz	short loc_19BC5
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_19CA0
		add	sp, 8
		or	al, al
		jz	short loc_19B93
		mov	[bp+var_1], 1

loc_19B93:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19BC5
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		nop
		push	cs
		call	near ptr sub_19CA0
		add	sp, 8
		or	al, al
		jz	short loc_19BC5
		mov	[bp+var_1], 1

loc_19BC5:
		mov	al, [bp+var_1]
		leave
		retf
sub_19B5E		endp

; START OF FUNCTION CHUNK FOR sub_19B5E
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_19B5E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19BCC		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		cmp	[bp+arg_4], 0
		jz	short loc_19C2C
		xor	eax, eax
		mov	dword_4F21E, eax
		mov	dword_4F21A, eax
		mov	dword_4F216, eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 17h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	dword_4F222, eax
		mov	eax, es:[si+4]
		mov	dword_4F226, eax
		mov	eax, es:[si+8]
		mov	dword_4F22A, eax
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_19EB6
		add	sp, 4
		or	al, al
		jz	short loc_19C2C
		mov	al, 1
		pop	si
		leave
		retf

loc_19C2C:
		mov	al, 0
		pop	si
		leave
		retf
sub_19BCC		endp

; START OF FUNCTION CHUNK FOR sub_19BCC
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_19BCC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_BBoxClipTest (sub_157C1 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Effect_BBoxClipTest (sub_398CB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,47L — calcule un
; code de sortie combiné (Cohen-Sutherland, 3 axes) pour une bounding box vs un point : test
; de clipping bounding-box pour le rendu de débris/particules.
; ==============================================================================================
Effect_BBoxClipTest		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	cx, cx
		mov	di, [bp+arg_0]
		mov	es, [bp+arg_2]
		mov	eax, es:[di+17h]
		sub	eax, [si]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si]
		sub	eax, es:[di+1Bh]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+1Fh]
		sub	eax, [si+4]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+4]
		sub	eax, es:[di+23h]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+27h]
		sub	eax, [si+8]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+8]
		sub	eax, es:[di+2Bh]
		shl	eax, 1
		rcl	cx, 1
		mov	al, cl
		pop	di
		pop	si
		pop	bp
		retf
Effect_BBoxClipTest		endp

; START OF FUNCTION CHUNK FOR Effect_BBoxClipTest
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Effect_BBoxClipTest

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19CA0		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_10], eax
		xor	di, di
		jmp	loc_19D4C

loc_19CC5:
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+17h]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	si, si
		jmp	short loc_19D46

loc_19CE0:
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_4F216, eax
		mov	eax, [bp+var_8]
		mov	dword_4F21A, eax
		mov	eax, [bp+var_4]
		mov	dword_4F21E, eax
		mov	eax, [bp+var_18]
		mov	dword_4F222, eax
		mov	eax, [bp+var_14]
		mov	dword_4F226, eax
		mov	eax, [bp+var_10]
		mov	dword_4F22A, eax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1A695
		add	sp, 8
		or	al, al
		jz	short loc_19D45
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_19D45:
		inc	si

loc_19D46:
		cmp	si, 2
		jl	short loc_19CE0
		inc	di

loc_19D4C:
		cmp	di, 2
		jge	short loc_19D54
		jmp	loc_19CC5

loc_19D54:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_14], eax
		xor	di, di
		jmp	loc_19DF8

loc_19D71:
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+17h]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	si, si
		jmp	short loc_19DF2

loc_19D8C:
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_4F216, eax
		mov	eax, [bp+var_8]
		mov	dword_4F21A, eax
		mov	eax, [bp+var_4]
		mov	dword_4F21E, eax
		mov	eax, [bp+var_18]
		mov	dword_4F222, eax
		mov	eax, [bp+var_14]
		mov	dword_4F226, eax
		mov	eax, [bp+var_10]
		mov	dword_4F22A, eax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1A695
		add	sp, 8
		or	al, al
		jz	short loc_19DF1
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_19DF1:
		inc	si

loc_19DF2:
		cmp	si, 2
		jl	short loc_19D8C
		inc	di

loc_19DF8:
		cmp	di, 2
		jge	short loc_19E00
		jmp	loc_19D71

loc_19E00:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+17h]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_18], eax
		xor	di, di
		jmp	loc_19EA4

loc_19E1D:
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_19E9E

loc_19E38:
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_4F216, eax
		mov	eax, [bp+var_8]
		mov	dword_4F21A, eax
		mov	eax, [bp+var_4]
		mov	dword_4F21E, eax
		mov	eax, [bp+var_18]
		mov	dword_4F222, eax
		mov	eax, [bp+var_14]
		mov	dword_4F226, eax
		mov	eax, [bp+var_10]
		mov	dword_4F22A, eax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1A695
		add	sp, 8
		or	al, al
		jz	short loc_19E9D
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_19E9D:
		inc	si

loc_19E9E:
		cmp	si, 2
		jl	short loc_19E38
		inc	di

loc_19EA4:
		cmp	di, 2
		jge	short loc_19EAC
		jmp	loc_19E1D

loc_19EAC:
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_19CA0		endp

; START OF FUNCTION CHUNK FOR sub_19CA0
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_19CA0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19EB6		proc far

var_1A0		= dword ptr -1A0h
var_19C		= dword ptr -19Ch
var_198		= dword ptr -198h
var_194		= dword ptr -194h
var_190		= dword ptr -190h
var_18C		= dword ptr -18Ch
var_188		= dword ptr -188h
var_184		= dword ptr -184h
var_180		= dword ptr -180h
var_17C		= dword ptr -17Ch
var_178		= dword ptr -178h
var_174		= dword ptr -174h
var_170		= dword ptr -170h
var_16C		= dword ptr -16Ch
var_168		= dword ptr -168h
var_164		= dword ptr -164h
var_160		= dword ptr -160h
var_15C		= dword ptr -15Ch
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14C		= dword ptr -14Ch
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
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
var_5C		= dword ptr -5Ch
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
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1ACh
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	byte_4BFB8, 0
		jz	short loc_19F28
		mov	eax, dword_4F20A
		sub	dword_4F216, eax
		mov	eax, dword_4F20E
		sub	dword_4F21A, eax
		mov	eax, dword_4F212
		sub	dword_4F21E, eax
		mov	eax, dword_4F20A
		sub	dword_4F222, eax
		mov	eax, dword_4F20E
		sub	dword_4F226, eax
		mov	eax, dword_4F212
		sub	dword_4F22A, eax
		push	6806h
		push	6836h
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		push	6806h
		push	6842h
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		jmp	short loc_19F7A

loc_19F28:
		mov	eax, dword_4F20A
		add	dword_4F216, eax
		mov	eax, dword_4F20E
		add	dword_4F21A, eax
		mov	eax, dword_4F212
		add	dword_4F21E, eax
		mov	eax, dword_4F20A
		add	dword_4F222, eax
		mov	eax, dword_4F20E
		add	dword_4F226, eax
		mov	eax, dword_4F212
		add	dword_4F22A, eax
		push	67E2h
		push	6836h
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		push	67E2h
		push	6842h
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4

loc_19F7A:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+17h]
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_1C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_20], eax
		jmp	loc_1A682

loc_19FC5:
		push	6836h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_1], al
		push	6842h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		cbw
		or	ax, ax
		jz	short loc_19FFB
		mov	al, [bp+var_2]
		cbw
		or	ax, ax
		jnz	short loc_1A006

loc_19FFB:
		mov	[bp+var_3], 1
		mov	[bp+var_4], 1
		jmp	loc_1A682

loc_1A006:
		mov	al, [bp+var_2]
		test	[bp+var_1], al
		jz	short loc_1A019
		mov	[bp+var_3], 1
		mov	[bp+var_4], 0
		jmp	loc_1A682

loc_1A019:
		test	[bp+var_1], 20h
		jnz	short loc_1A022
		jmp	loc_1A113

loc_1A022:
		mov	eax, [bp+var_10]
		sub	eax, dword_4F216
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax
		mov	eax, dword_4F222
		sub	eax, dword_4F216
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	dword_4F216, eax
		mov	eax, dword_4F226
		sub	eax, dword_4F21A
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, dword_4F21A
		add	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	dword_4F21A, eax
		mov	eax, dword_4F22A
		sub	eax, dword_4F21E
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, dword_4F21E
		add	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	dword_4F21E, eax
		jmp	loc_1A682

loc_1A113:
		test	[bp+var_1], 10h
		jnz	short loc_1A11C
		jmp	loc_1A21D

loc_1A11C:
		mov	eax, [bp+var_C]
		sub	eax, dword_4F216
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_8], eax
		mov	eax, dword_4F222
		sub	eax, dword_4F216
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_4F216, eax
		mov	eax, dword_4F226
		sub	eax, dword_4F21A
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_78]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, dword_4F21A
		add	eax, [bp+var_80]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	dword_4F21A, eax
		mov	eax, dword_4F22A
		sub	eax, dword_4F21E
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_90]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, dword_4F21E
		add	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	dword_4F21E, eax
		jmp	loc_1A682

loc_1A21D:
		test	[bp+var_1], 8
		jnz	short loc_1A226
		jmp	loc_1A337

loc_1A226:
		mov	eax, [bp+var_14]
		sub	eax, dword_4F21A
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_8], eax
		mov	eax, dword_4F226
		sub	eax, dword_4F21A
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_B0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_4F222
		sub	eax, dword_4F216
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, dword_4F216
		add	eax, [bp+var_C0]
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C8]
		mov	dword_4F216, eax
		mov	eax, [bp+var_14]
		mov	dword_4F21A, eax
		mov	eax, dword_4F22A
		sub	eax, dword_4F21E
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_D0]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, dword_4F21E
		add	eax, [bp+var_D8]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E0]
		mov	dword_4F21E, eax
		jmp	loc_1A682

loc_1A337:
		test	[bp+var_1], 4
		jnz	short loc_1A340
		jmp	loc_1A451

loc_1A340:
		mov	eax, [bp+var_18]
		sub	eax, dword_4F21A
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_8], eax
		mov	eax, dword_4F226
		sub	eax, dword_4F21A
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_F0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_4F222
		sub	eax, dword_4F216
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_F4]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_F8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, dword_4F216
		add	eax, [bp+var_100]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_104]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_108]
		mov	dword_4F216, eax
		mov	eax, [bp+var_18]
		mov	dword_4F21A, eax
		mov	eax, dword_4F22A
		sub	eax, dword_4F21E
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_10C]
		mov	[bp+var_110], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_110]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_118], eax
		mov	eax, dword_4F21E
		add	eax, [bp+var_118]
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_11C]
		mov	[bp+var_120], eax
		mov	eax, [bp+var_120]
		mov	dword_4F21E, eax
		jmp	loc_1A682

loc_1A451:
		test	[bp+var_1], 2
		jnz	short loc_1A45A
		jmp	loc_1A56B

loc_1A45A:
		mov	eax, [bp+var_1C]
		sub	eax, dword_4F21E
		mov	[bp+var_124], eax
		mov	eax, [bp+var_124]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_8], eax
		mov	eax, dword_4F22A
		sub	eax, dword_4F21E
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_130], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_130]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_4F222
		sub	eax, dword_4F216
		mov	[bp+var_134], eax
		mov	eax, [bp+var_134]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_138]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_140], eax
		mov	eax, dword_4F216
		add	eax, [bp+var_140]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_148]
		mov	dword_4F216, eax
		mov	eax, dword_4F226
		sub	eax, dword_4F21A
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_14C]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_150]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_154], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	eax, dword_4F21A
		add	eax, [bp+var_158]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_160]
		mov	dword_4F21A, eax
		mov	eax, [bp+var_1C]
		mov	dword_4F21E, eax
		jmp	loc_1A682

loc_1A56B:
		test	[bp+var_1], 1
		jnz	short loc_1A574
		jmp	loc_1A682

loc_1A574:
		mov	eax, [bp+var_20]
		sub	eax, dword_4F21E
		mov	[bp+var_164], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_168]
		mov	[bp+var_8], eax
		mov	eax, dword_4F22A
		sub	eax, dword_4F21E
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_16C]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_170]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_4F222
		sub	eax, dword_4F216
		mov	[bp+var_174], eax
		mov	eax, [bp+var_174]
		mov	[bp+var_178], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_178]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_17C]
		mov	[bp+var_180], eax
		mov	eax, dword_4F216
		add	eax, [bp+var_180]
		mov	[bp+var_184], eax
		mov	eax, [bp+var_184]
		mov	[bp+var_188], eax
		mov	eax, [bp+var_188]
		mov	dword_4F216, eax
		mov	eax, dword_4F226
		sub	eax, dword_4F21A
		mov	[bp+var_18C], eax
		mov	eax, [bp+var_18C]
		mov	[bp+var_190], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_190]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_194], eax
		mov	eax, [bp+var_194]
		mov	[bp+var_198], eax
		mov	eax, dword_4F21A
		add	eax, [bp+var_198]
		mov	[bp+var_19C], eax
		mov	eax, [bp+var_19C]
		mov	[bp+var_1A0], eax
		mov	eax, [bp+var_1A0]
		mov	dword_4F21A, eax
		mov	eax, [bp+var_20]
		mov	dword_4F21E, eax

loc_1A682:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1A68E
		jmp	loc_19FC5

loc_1A68E:
		mov	al, [bp+var_4]
		leave
		retf
sub_19EB6		endp

; START OF FUNCTION CHUNK FOR sub_19EB6
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_19EB6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A695		proc far

arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_1A6FE
		cmp	byte_4BFB8, 0
		jz	short loc_1A6C4
		push	6806h
		push	6836h
		call	sub_2BF97
		add	sp, 4
		push	6806h
		push	6842h
		call	sub_2BF97
		add	sp, 4
		jmp	short loc_1A6E0

loc_1A6C4:
		push	67E2h
		push	6836h
		call	sub_2BF97
		add	sp, 4
		push	67E2h
		push	6842h
		call	sub_2BF97
		add	sp, 4

loc_1A6E0:
		mov	al, byte_4BFB8
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_4BFB8, al
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	cs
		call	near ptr sub_19EB6
		add	sp, 4
		pop	bp
		retf
		jmp	short loc_1A702

loc_1A6FE:
		mov	al, 0
		pop	bp
		retf
sub_1A695		endp

; START OF FUNCTION CHUNK FOR sub_1A695

loc_1A702:
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1A695

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A704		proc far
		push	bp
		mov	bp, sp
		push	67E2h
		call	sub_2A4FF
		add	sp, 2
		push	6806h
		call	sub_2A4FF
		add	sp, 2
		pop	bp
		retf
sub_1A704		endp

; START OF FUNCTION CHUNK FOR sub_1A704
		db 0
; END OF FUNCTION CHUNK FOR sub_1A704
seg041		ends
