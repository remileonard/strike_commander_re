seg054		segment	para public 'CODE' use16
		assume cs:seg054
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FBh

loc_1F821:
		db 8Ah, 46h, 0FBh, 0C9h, 0CBh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F828		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1F828		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F82D		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_A]
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+3Ah]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_1F881
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_1F881:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_1F8A3
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_1F8A3:
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_1F8C5
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_1F8C5:
		mov	eax, [bp+var_4]
		add	eax, [bp+var_C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		sar	eax, 1
		mov	edx, [bp+var_14]
		sar	edx, 4
		add	eax, edx
		cmp	eax, [bp+var_4]
		jge	short loc_1F91D
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	0
		push	di
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [bp+arg_2]
		add	ax, 2Ch
		push	[bp+arg_4]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 16h
		push	[bp+arg_4]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_1E071
		add	sp, 1Ah
		jmp	short loc_1F93B

loc_1F91D:
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	di
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	3
		push	si
		call	sub_2CFC2
		add	sp, 12h

loc_1F93B:
		pop	di
		pop	si
		leave
		retf
sub_1F82D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F93F		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_0]
		les	bx, word ptr [bp+arg_4]
		mov	ax, es:[bx+4]
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		xor	si, si
		jmp	short loc_1F98D

loc_1F960:
		mov	al, byte ptr [bp+var_2]
		push	ax
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+18h]
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+16h]
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+2]
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx]
		push	di
		call	sub_37F22
		add	sp, 0Ch
		inc	si
		add	word ptr [bp+var_6], 16h

loc_1F98D:
		mov	ax, [bp+arg_2]
		dec	ax
		cmp	ax, si
		jg	short loc_1F960
		mov	al, byte ptr [bp+var_2]
		push	ax
		les	bx, word ptr [bp+arg_4]
		push	word ptr es:[bx+2]
		les	bx, word ptr [bp+arg_4]
		push	word ptr es:[bx]
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+2]
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx]
		push	di
		call	sub_37F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_1F93F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F9C0		proc far

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
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		sub	eax, es:[bx]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		sub	eax, es:[bx+4]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		sub	eax, es:[bx+8]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		sub	eax, es:[bx]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		sub	eax, es:[bx+4]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		sub	eax, es:[bx+8]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	sub_28624
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Vector_Normalize3D_28FB2
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_24]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_20]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Ah], eax
		leave
		retf
sub_1F9C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FAC9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		add	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		add	eax, es:[bx]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		add	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		add	eax, es:[bx+4]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		add	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		add	eax, es:[bx+8]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], eax
		pop	bp
		retf
sub_1FAC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FB70		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+1Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+1Eh], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_C]
		mov	es:[bx+22h], eax
		les	bx, [bp+arg_10]
		mov	al, es:[bx+7]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx], 0FEh
		or	es:[bx], al
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1F9C0
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FAC9
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		add	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		add	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+6]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		add	es:[bx+14h], eax
		pop	bp
		retf
sub_1FB70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FC7B		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_C]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_10]
		mov	es:[bx+0Eh], eax
		pop	bp
		retf
sub_1FC7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FCB0		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1FCB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FCB5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	dl, es:[bx+11h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	dl, es:[bx+11h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		pop	bp
		retf
sub_1FCB5		endp

; START OF FUNCTION CHUNK FOR sub_1FCB5
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1FCB5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FCF3		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_1FD2D
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_1FD2D

loc_1FD2D:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_4]
		jle	short loc_1FD51
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_1FD51

loc_1FD51:
		mov	eax, [bp+var_4]
		mov	dword_4F22E, eax
		mov	eax, dword_4F22E
		sar	eax, 8
		shld	edx, eax, 10h
		leave
		retf
sub_1FCF3		endp

; START OF FUNCTION CHUNK FOR sub_1FCF3
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1FCF3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FD6A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1FD6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FD6F		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_1FD6F		endp

; START OF FUNCTION CHUNK FOR sub_1FD6F
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1FD6F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FD78		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		les	si, [bp+arg_0]
		mov	es:[si+8], dx
		mov	es:[si+6], bx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		les	si, [bp+arg_0]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Eh]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		les	si, [bp+arg_0]
		mov	es:[si+10h], dx
		mov	es:[si+0Eh], bx
		pop	si
		pop	bp
		retf
sub_1FD78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FE30		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	[bp+arg_0], 0
		jnz	short loc_1FE54
		push	48h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_1FE54
		jmp	loc_1FEE9

loc_1FE54:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax

loc_1FEE9:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_1FE30		endp

; START OF FUNCTION CHUNK FOR sub_1FE30
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1FE30

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FEF3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FB70
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+26h], al
		pop	bp
		retf
sub_1FEF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF2B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1FF2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF30		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_1FF30		endp

; START OF FUNCTION CHUNK FOR sub_1FF30
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1FF30

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF39		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_1FF52
		add	sp, 8
		pop	bp
		retf
sub_1FF39		endp

; START OF FUNCTION CHUNK FOR sub_1FF39
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1FF39

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF52		proc far

var_E		= dword ptr -0Eh
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		cmp	[bp+arg_0], 0
		jnz	short loc_1FF76
		push	48h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_1FF76
		jmp	loc_20044

loc_1FF76:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3765h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_E], eax
		les	bx, word ptr [bp+var_E]
		mov	al, es:[bx+26h]
		push	ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_1F7D5
		add	sp, 6
		mov	[bp+var_9], al
		mov	al, [bp+var_9]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax

loc_20044:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_1FF52		endp

; START OF FUNCTION CHUNK FOR sub_1FF52
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1FF52

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2004E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Ch]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		push	word_4D36C
		call	sub_37F22
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+34h]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+32h]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Ch]
		push	word_4D36C
		call	sub_37F22
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+34h]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+32h]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		push	word_4D36C
		call	sub_37F22
		add	sp, 0Ch
		pop	bp
		retf
sub_2004E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_200E3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FEF3
		add	sp, 14h
		pop	bp
		retf
sub_200E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2010D		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2010D		endp

; START OF FUNCTION CHUNK FOR sub_2010D
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2010D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20116		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_2012F
		add	sp, 8
		pop	bp
		retf
sub_20116		endp

; START OF FUNCTION CHUNK FOR sub_20116
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_20116

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2012F		proc far

var_E		= dword ptr -0Eh
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		cmp	[bp+arg_0], 0
		jnz	short loc_20153
		push	48h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_20153
		jmp	loc_20229

loc_20153:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3765h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3761h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_E], eax
		les	bx, word ptr [bp+var_E]
		mov	al, es:[bx+26h]
		push	ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_1F7D5
		add	sp, 6
		mov	[bp+var_9], al
		mov	al, [bp+var_9]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax

loc_20229:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_2012F		endp

; START OF FUNCTION CHUNK FOR sub_2012F
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2012F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20233		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	al, byte_4C124
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20259
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8
		jmp	short loc_20270

loc_20259:
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8

loc_20270:
		pop	bp
		retf
sub_20233		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20272		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	si
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FB70
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_202AF
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_202C0

loc_202AF:
		mov	ax, si
		shl	ax, 8
		mov	edx, dword_4F2EE
		push	ax
		mov	ax, word_4F2EC
		pop	bx
		add	ax, bx

loc_202C0:
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], dx
		mov	es:[bx+26h], ax
		pop	si
		pop	bp
		retf
sub_20272		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_202CE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_202CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_202D3		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_202D3		endp

; START OF FUNCTION CHUNK FOR sub_202D3
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_202D3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_202DC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_202F5
		add	sp, 8
		pop	bp
		retf
sub_202DC		endp

; START OF FUNCTION CHUNK FOR sub_202DC
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_202DC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_202F5		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		cmp	[bp+arg_0], 0
		jnz	short loc_20319
		push	4Ch
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_20319
		jmp	loc_203D2

loc_20319:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 375Dh
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, es:[bx+26h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], eax

loc_203D2:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_202F5		endp

; START OF FUNCTION CHUNK FOR sub_202F5
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_202F5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_203DC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	al, byte_4C124
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2040D
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4Ah]
		push	word ptr es:[bx+48h]
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C52C
		add	sp, 0Ch
		jmp	short loc_20424

loc_2040D:
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8

loc_20424:
		pop	bp
		retf
sub_203DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20426		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		inc	dx
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	[bp+var_4]
		push	68AEh
		call	sub_23992
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_20470
		mov	ax, si
		shl	ax, 4
		mov	bx, word_4F2E8
		add	bx, ax
		mov	al, byte ptr [bp+var_4]
		sub	al, [bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx], al
		jmp	short loc_20477

loc_20470:
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0

loc_20477:
		mov	[bp+var_2], si
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_20493
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2], 0
		jmp	short loc_204A4

loc_20493:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2], 1

loc_204A4:
		pop	si
		leave
		retf
sub_20426		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_204A7		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_8]
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_12], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+6]
		mov	[bp+var_E], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+0Ah]
		mov	[bp+var_A], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx]
		and	ax, 1
		or	al, al
		jnz	short loc_204F1
		jmp	loc_205B5

loc_204F1:
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+6]
		sub	ax, es:[bx]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		sub	dx, es:[bx+2]
		imul	dx
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		push	ax
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+6]
		sub	ax, es:[bx+2]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	dx, es:[bx]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		sub	dx, es:[bx]
		imul	dx
		pop	dx
		sub	dx, ax
		jge	short loc_20553
		mov	al, 1
		jmp	short loc_20555

loc_20553:
		mov	al, 0

loc_20555:
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_2058B
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+6], 1
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	Utility_Helper_29031
		add	sp, 2
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	si
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		jmp	short loc_205B3

loc_2058B:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_205B3
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+6], 0FEh
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	si
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al

loc_205B3:
		jmp	short loc_205CC

loc_205B5:
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	si
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al

loc_205CC:
		pop	si
		leave
		retf
sub_204A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_205CF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FB70
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 26h
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_20426
		add	sp, 6
		pop	bp
		retf
sub_205CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20612		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FC7B
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+28h]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+18h], 0FBh
		shl	al, 2
		or	es:[bx+18h], al
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], al
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], al
		leave
		retf
sub_20612		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2067C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+18h], 0FDh
		pop	bp
		retf
sub_2067C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20689		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, [bp+arg_0]
		add	ax, 12h
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_204A7
		add	sp, 0Ah
		pop	bp
		retf
sub_20689		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_206A8		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_206A8		endp

; START OF FUNCTION CHUNK FOR sub_206A8
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_206A8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_206B1		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+18h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2073A
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	eax, dword_4F2EE
		mov	dx, word_4F2EC
		add	dx, word_4F2DE
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+var_6]
		dec	ah
		xor	al, 0FFh
		and	al, ah
		mov	ah, 0
		shr	ax, 4
		shl	ax, 8
		add	[bp+var_A], ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_A]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		cmp	[bp+var_4], 0
		jnz	short loc_20720
		les	bx, [bp+arg_0]
		mov	al, es:[bx+14h]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], al
		jmp	short loc_20738

loc_20720:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+14h]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], al

loc_20738:
		jmp	short loc_20787

loc_2073A:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+14h]
		mov	ah, 0
		mov	[bp+var_C], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp+var_E], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+15h]
		mov	ah, 0
		mov	[bp+var_10], ax
		mov	ax, [bp+var_C]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	si, dx
		mov	ax, [bp+var_E]
		imul	[bp+var_10]
		sar	ax, 8
		mov	dx, [si+6]
		add	dx, ax
		mov	[bp+var_12], dx
		mov	ax, [bp+var_12]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], al

loc_20787:
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_2079F
		add	sp, 8
		pop	si
		leave
		retf
sub_206B1		endp

; START OF FUNCTION CHUNK FOR sub_206B1
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_206B1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2079F		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	[bp+arg_0], 0
		jnz	short loc_207C3
		push	49h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_207C3
		jmp	loc_20880

loc_207C3:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3765h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3761h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3759h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+17h]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax

loc_20880:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_2079F		endp

; START OF FUNCTION CHUNK FOR sub_2079F
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2079F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2088A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	al, byte_4C124
		mov	ah, 0
		or	ax, ax
		jnz	short loc_208B0
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8
		jmp	short loc_208C7

loc_208B0:
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8

loc_208C7:
		pop	bp
		retf
sub_2088A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_208C9		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 27h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	[bp+var_4]
		push	68AEh
		call	sub_23992
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_20915
		mov	ax, si
		shl	ax, 4
		mov	bx, word_4F2E8
		add	bx, ax
		mov	al, byte ptr [bp+var_4]
		sub	al, [bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx], al
		jmp	short loc_2091C

loc_20915:
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0

loc_2091C:
		mov	[bp+var_2], si
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_2092A
		mov	[bp+var_2], 0

loc_2092A:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+26h], al
		pop	si
		leave
		retf
sub_208C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20937		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FB70
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_208C9
		add	sp, 6
		pop	bp
		retf
sub_20937		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20976		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FC7B
		add	sp, 14h
		pop	bp
		retf
sub_20976		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_209A0		proc far

var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+1Ah]
		mov	[bp+var_A], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20A31
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 0Ch
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	si, [bp+var_E]
		mov	eax, es:[si]
		mov	[bp+var_30], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+var_6]
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		or	byte ptr es:[bx+11h], 1
		jmp	short loc_20A31

loc_20A31:
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+1Eh]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20AAE
		mov	ax, word ptr [bp+var_14+2]
		mov	dx, word ptr [bp+var_14]
		add	dx, 0Ch
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	di, [bp+var_18]
		mov	eax, es:[di]
		mov	[bp+var_3C], eax
		mov	eax, es:[di+4]
		mov	[bp+var_38], eax
		mov	eax, es:[di+8]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	[bp+var_10]
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 1
		jmp	short loc_20AAE

loc_20AAE:
		mov	ax, [bp+arg_4]
		mov	[bp+var_1A], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+22h]
		mov	[bp+var_1E], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20B37
		mov	ax, word ptr [bp+var_1E+2]
		mov	dx, word ptr [bp+var_1E]
		add	dx, 0Ch
		mov	[bp+var_20], ax
		mov	[bp+var_22], dx
		les	ax, [bp+var_22]
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, es:[bx]
		mov	[bp+var_48], eax
		mov	bx, [bp+var_24]
		mov	eax, es:[bx+4]
		mov	[bp+var_44], eax
		mov	bx, [bp+var_24]
		mov	eax, es:[bx+8]
		mov	[bp+var_40], eax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	[bp+var_1A]
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 1
		jmp	short loc_20B37

loc_20B37:
		pop	di
		pop	si
		leave
		retf
sub_209A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20B3B		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_20B3B		endp

; START OF FUNCTION CHUNK FOR sub_20B3B
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_20B3B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20B44		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_20B5D
		add	sp, 8
		pop	bp
		retf
sub_20B44		endp

; START OF FUNCTION CHUNK FOR sub_20B44
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_20B44

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20B5D		proc far

var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_20B83
		push	48h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_20B83
		jmp	loc_20D1F

loc_20B83:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3755h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+26h]
		mov	[bp+var_D], al
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+27h]
		mov	[bp+var_E], al
		mov	al, [bp+var_D]
		mov	ah, 0
		mov	[bp+var_10], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+6]
		mov	al, es:[bx+10h]
		mov	ah, 0
		mov	[bp+var_12], ax
		mov	al, [bp+var_E]
		mov	ah, 0
		mov	[bp+var_14], ax
		mov	ax, [bp+var_10]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	si, dx
		mov	ax, [bp+var_12]
		imul	[bp+var_14]
		sar	ax, 8
		mov	dx, [si+6]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, [bp+var_16]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	al, [bp+var_D]
		mov	ah, 0
		mov	[bp+var_18], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+10h]
		mov	ah, 0
		mov	[bp+var_1A], ax
		mov	al, [bp+var_E]
		mov	ah, 0
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_18]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	di, dx
		mov	ax, [bp+var_1A]
		imul	[bp+var_1C]
		sar	ax, 8
		mov	dx, [di+6]
		add	dx, ax
		mov	[bp+var_1E], dx
		mov	ax, [bp+var_1E]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], ax
		mov	al, [bp+var_D]
		mov	ah, 0
		mov	[bp+var_20], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+10h]
		mov	ah, 0
		mov	[bp+var_22], ax
		mov	al, [bp+var_E]
		mov	ah, 0
		mov	[bp+var_24], ax
		mov	ax, [bp+var_20]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	[bp+var_26], dx
		mov	ax, [bp+var_22]
		imul	[bp+var_24]
		sar	ax, 8
		mov	bx, [bp+var_26]
		mov	dx, [bx+6]
		add	dx, ax
		mov	[bp+var_28], dx
		mov	ax, [bp+var_28]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+36h], ax

loc_20D1F:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_20B5D		endp

; START OF FUNCTION CHUNK FOR sub_20B5D
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_20B5D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20D2D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_4C122, 0
		jz	short loc_20DA3
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+20h]
		jnz	short loc_20D71
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+36h]
		jnz	short loc_20D71
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8
		jmp	short loc_20DA1

loc_20D71:
		les	bx, [bp+arg_0]
		shl	word ptr es:[bx+0Ah], 8
		les	bx, [bp+arg_0]
		shl	word ptr es:[bx+20h], 8
		les	bx, [bp+arg_0]
		shl	word ptr es:[bx+36h], 8
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C957
		add	sp, 8

loc_20DA1:
		jmp	short loc_20E0C

loc_20DA3:
		cmp	byte_4C124, 0
		jz	short loc_20DC3
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8
		jmp	short loc_20E0C

loc_20DC3:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		add	ax, es:[bx+20h]
		les	bx, [bp+arg_0]
		add	ax, es:[bx+36h]
		mov	bx, 3
		xor	dx, dx
		div	bx
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8

loc_20E0C:
		pop	bp
		retf
sub_20D2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20E0E		proc far
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
sub_20E0E		endp

; START OF FUNCTION CHUNK FOR sub_20E0E
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_20E0E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20E17		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_20E30
		add	sp, 8
		pop	bp
		retf
sub_20E17		endp

; START OF FUNCTION CHUNK FOR sub_20E17
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_20E17

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20E30		proc far

var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		cmp	[bp+arg_0], 0
		jnz	short loc_20E54
		push	4Eh
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_20E54
		jmp	loc_20FD5

loc_20E54:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3751h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, es:[bx+2]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		add	dx, 28h
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	bx, [bp+var_14]
		mov	al, es:[bx]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+1]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Eh], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+2]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+3]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+24h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+4]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+38h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+5]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Ah], ax
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+26h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4Ah], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2]
		sar	eax, 8
		mov	[bp+var_18], eax
		push	large [bp+var_18]
		push	68AEh
		call	Palette_FogTableIndex_2459A
		add	sp, 6
		push	ax
		push	68AEh
		call	sub_2391D
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ch], dx
		mov	es:[bx+4Ah], ax

loc_20FD5:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_20E30		endp

; START OF FUNCTION CHUNK FOR sub_20E30
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_20E30

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20FDF		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		jmp	short loc_20FEE
		cmp	byte_4C123, 0
		jz	short loc_21050

loc_20FEE:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+48h], 0
		jz	short loc_2104E
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4Ch]
		push	word ptr es:[bx+4Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2CFC2
		add	sp, 12h

loc_2104E:
		jmp	short loc_210AE

loc_21050:
		cmp	byte_4C124, 0
		jz	short loc_21070
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8
		jmp	short loc_210AE

loc_21070:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx]
		mov	[bp+var_1], al
		mov	al, [bp+var_1]
		mov	ah, 0
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8

loc_210AE:
		leave
		retf
sub_20FDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_210B0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FB70
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 2Eh
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_20426
		add	sp, 6
		pop	bp
		retf
sub_210B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_210F3		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FC7B
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+30h]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+18h], 0FBh
		shl	al, 2
		or	es:[bx+18h], al
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+2Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], al
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+2Fh]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], al
		leave
		retf
sub_210F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2115D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, [bp+arg_0]
		add	ax, 12h
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_204A7
		add	sp, 0Ah
		pop	bp
		retf
sub_2115D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2117C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+18h], 0FDh
		pop	bp
		retf
sub_2117C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21189		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_21189		endp

; START OF FUNCTION CHUNK FOR sub_21189
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_21189

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21192		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	eax, dword_4F2EE
		mov	dx, word_4F2EC
		add	dx, word_4F2DE
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	ax, [bp+var_4]
		dec	ah
		xor	al, 0FFh
		and	al, ah
		mov	ah, 0
		shr	ax, 4
		shl	ax, 8
		add	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	word_4F258, ax
		mov	word_4F256, dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+18h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21216
		cmp	dword ptr word_4F256, 0
		jnz	short loc_211FF
		les	bx, [bp+arg_0]
		mov	al, es:[bx+14h]
		mov	[bp+var_1], al
		jmp	short loc_21214

loc_211FF:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+14h]
		mov	ah, 0
		les	bx, word_4F256
		add	bx, ax
		mov	al, es:[bx]
		mov	[bp+var_1], al

loc_21214:
		jmp	short loc_2125F

loc_21216:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+14h]
		mov	ah, 0
		mov	[bp+var_A], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp+var_C], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+15h]
		mov	ah, 0
		mov	[bp+var_E], ax
		mov	ax, [bp+var_A]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	si, dx
		mov	ax, [bp+var_C]
		imul	[bp+var_E]
		sar	ax, 8
		mov	dx, [si+6]
		add	dx, ax
		mov	[bp+var_10], dx
		mov	ax, [bp+var_10]
		mov	[bp+var_1], al

loc_2125F:
		mov	al, [bp+var_1]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_2127B
		add	sp, 0Ah
		pop	si
		leave
		retf
sub_21192		endp

; START OF FUNCTION CHUNK FOR sub_21192
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_21192

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2127B		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 14h
		cmp	[bp+arg_0], 0
		jnz	short loc_2129F
		push	4Eh
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2129F
		jmp	loc_2140A

loc_2129F:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3751h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 374Dh
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, es:[bx+2]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		add	dx, 28h
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	bx, [bp+var_14]
		mov	al, es:[bx]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+1]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Eh], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+2]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+3]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+24h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+4]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+38h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+5]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Ah], ax
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+26h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4Ah], 0
		mov	al, [bp+arg_8]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword ptr word_4F256
		mov	es:[bx+4Ah], eax

loc_2140A:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_2127B		endp

; START OF FUNCTION CHUNK FOR sub_2127B
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2127B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21414		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	al, byte_4C124
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2143A
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8
		jmp	short loc_21451

loc_2143A:
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8

loc_21451:
		cmp	byte_4C123, 0
		jz	short loc_214B8
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+48h], 0
		jz	short loc_214B8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4Ch]
		push	word ptr es:[bx+4Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2CFC2
		add	sp, 12h

loc_214B8:
		pop	bp
		retf
sub_21414		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_214BA		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Fh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	[bp+var_4]
		push	68AEh
		call	sub_23992
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_21506
		mov	ax, si
		shl	ax, 4
		mov	bx, word_4F2E8
		add	bx, ax
		mov	al, byte ptr [bp+var_4]
		sub	al, [bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx], al
		jmp	short loc_2150D

loc_21506:
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0

loc_2150D:
		mov	[bp+var_2], si
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_2151B
		mov	[bp+var_2], 0

loc_2151B:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+2Eh], al
		pop	si
		leave
		retf
sub_214BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21528		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FB70
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_214BA
		add	sp, 6
		pop	bp
		retf
sub_21528		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21567		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1FC7B
		add	sp, 14h
		pop	bp
		retf
sub_21567		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21591		proc far

var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+1Ah]
		mov	[bp+var_A], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21622
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 0Ch
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	si, [bp+var_E]
		mov	eax, es:[si]
		mov	[bp+var_30], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+var_6]
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		or	byte ptr es:[bx+11h], 1
		jmp	short loc_21622

loc_21622:
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+1Eh]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2169F
		mov	ax, word ptr [bp+var_14+2]
		mov	dx, word ptr [bp+var_14]
		add	dx, 0Ch
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	di, [bp+var_18]
		mov	eax, es:[di]
		mov	[bp+var_3C], eax
		mov	eax, es:[di+4]
		mov	[bp+var_38], eax
		mov	eax, es:[di+8]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	[bp+var_10]
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 1
		jmp	short loc_2169F

loc_2169F:
		mov	ax, [bp+arg_4]
		mov	[bp+var_1A], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+22h]
		mov	[bp+var_1E], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21728
		mov	ax, word ptr [bp+var_1E+2]
		mov	dx, word ptr [bp+var_1E]
		add	dx, 0Ch
		mov	[bp+var_20], ax
		mov	[bp+var_22], dx
		les	ax, [bp+var_22]
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, es:[bx]
		mov	[bp+var_48], eax
		mov	bx, [bp+var_24]
		mov	eax, es:[bx+4]
		mov	[bp+var_44], eax
		mov	bx, [bp+var_24]
		mov	eax, es:[bx+8]
		mov	[bp+var_40], eax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	[bp+var_1A]
		push	6A13h
		call	LightSet_FaceIntensity_22BEF
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 1
		jmp	short loc_21728

loc_21728:
		pop	di
		pop	si
		leave
		retf
sub_21591		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2172C		proc far
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
sub_2172C		endp

; START OF FUNCTION CHUNK FOR sub_2172C
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2172C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21735		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_2174E
		add	sp, 8
		pop	bp
		retf
sub_21735		endp

; START OF FUNCTION CHUNK FOR sub_21735
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_21735

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2174E		proc far

var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_21774
		push	4Eh
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_21774
		jmp	loc_21A3E

loc_21774:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3751h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3749h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, es:[bx+2]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		add	dx, 28h
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	bx, [bp+var_14]
		mov	al, es:[bx]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+1]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Eh], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+2]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+3]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+24h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+4]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+38h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+5]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Ah], ax
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+26h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4Ah], 0
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_18], eax
		les	bx, word ptr [bp+var_18]
		mov	al, es:[bx+2Eh]
		mov	[bp+var_19], al
		les	bx, word ptr [bp+var_18]
		mov	al, es:[bx+2Fh]
		mov	[bp+var_1A], al
		mov	al, [bp+var_19]
		mov	ah, 0
		mov	[bp+var_1C], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+6]
		mov	al, es:[bx+10h]
		mov	ah, 0
		mov	[bp+var_1E], ax
		mov	al, [bp+var_1A]
		mov	ah, 0
		mov	[bp+var_20], ax
		mov	ax, [bp+var_1C]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	di, dx
		mov	ax, [bp+var_1E]
		imul	[bp+var_20]
		sar	ax, 8
		mov	dx, [di+6]
		add	dx, ax
		mov	[bp+var_22], dx
		mov	ax, [bp+var_22]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	al, [bp+var_19]
		mov	ah, 0
		mov	[bp+var_24], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+10h]
		mov	ah, 0
		mov	[bp+var_26], ax
		mov	al, [bp+var_1A]
		mov	ah, 0
		mov	[bp+var_28], ax
		mov	ax, [bp+var_24]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	[bp+var_2A], dx
		mov	ax, [bp+var_26]
		imul	[bp+var_28]
		sar	ax, 8
		mov	bx, [bp+var_2A]
		mov	dx, [bx+6]
		add	dx, ax
		mov	[bp+var_2C], dx
		mov	ax, [bp+var_2C]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], ax
		mov	al, [bp+var_19]
		mov	ah, 0
		mov	[bp+var_2E], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+10h]
		mov	ah, 0
		mov	[bp+var_30], ax
		mov	al, [bp+var_1A]
		mov	ah, 0
		mov	[bp+var_32], ax
		mov	ax, [bp+var_2E]
		shl	ax, 4
		mov	dx, word_4F2E8
		add	dx, ax
		mov	[bp+var_34], dx
		mov	ax, [bp+var_30]
		imul	[bp+var_32]
		sar	ax, 8
		mov	bx, [bp+var_34]
		mov	dx, [bx+6]
		add	dx, ax
		mov	[bp+var_36], dx
		mov	ax, [bp+var_36]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+36h], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+6]
		mov	al, es:[bx+10h]
		mov	ah, 0
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+0Ah]
		mov	dl, es:[bx+10h]
		mov	dh, 0
		add	ax, dx
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	dl, es:[bx+10h]
		mov	dh, 0
		add	ax, dx
		mov	si, ax
		mov	ax, si
		shl	ax, 1
		mov	dx, si
		add	dx, ax
		shr	dx, 3
		mov	si, dx
		mov	[bp+var_38], si
		mov	eax, dword_4F2EE
		mov	dx, word_4F2EC
		add	dx, word_4F2DE
		mov	[bp+var_3A], ax
		mov	[bp+var_3C], dx
		mov	ax, [bp+var_38]
		dec	ah
		xor	al, 0FFh
		and	al, ah
		mov	ah, 0
		shr	ax, 4
		shl	ax, 8
		add	[bp+var_3C], ax
		mov	ax, [bp+var_3A]
		mov	dx, [bp+var_3C]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ch], ax
		mov	es:[bx+4Ah], dx

loc_21A3E:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2174E		endp

; START OF FUNCTION CHUNK FOR sub_2174E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2174E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21A4C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_4C122, 0
		jz	short loc_21AC2
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+20h]
		jnz	short loc_21A90
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+36h]
		jnz	short loc_21A90
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8
		jmp	short loc_21AC0

loc_21A90:
		les	bx, [bp+arg_0]
		shl	word ptr es:[bx+0Ah], 8
		les	bx, [bp+arg_0]
		shl	word ptr es:[bx+20h], 8
		les	bx, [bp+arg_0]
		shl	word ptr es:[bx+36h], 8
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C957
		add	sp, 8

loc_21AC0:
		jmp	short loc_21B1D

loc_21AC2:
		cmp	byte_4C124, 0
		jz	short loc_21AE2
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8
		jmp	short loc_21B1D

loc_21AE2:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		add	ax, es:[bx+20h]
		les	bx, [bp+arg_0]
		add	ax, es:[bx+36h]
		mov	bx, 3
		xor	dx, dx
		div	bx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
		add	sp, 8

loc_21B1D:
		cmp	byte_4C123, 0
		jz	short loc_21B84
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+48h], 0
		jz	short loc_21B84
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4Ch]
		push	word ptr es:[bx+4Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2CFC2
		add	sp, 12h

loc_21B84:
		pop	bp
		retf
sub_21A4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21B86		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, [bp+arg_0]
		add	ax, 12h
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_204A7
		add	sp, 0Ah
		pop	bp
		retf
sub_21B86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21BA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+18h], 0FDh
		pop	bp
		retf
sub_21BA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21BB2		proc far
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
sub_21BB2		endp

; START OF FUNCTION CHUNK FOR sub_21BB2
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_21BB2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21BBB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_21BD4
		add	sp, 8
		pop	bp
		retf
sub_21BBB		endp

; START OF FUNCTION CHUNK FOR sub_21BBB
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_21BBB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21BD4		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		cmp	[bp+arg_0], 0
		jnz	short loc_21BF8
		push	4Eh
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_21BF8
		jmp	loc_21D8E

loc_21BF8:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3769h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3751h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3745h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, dword_4F22E
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, es:[bx+2]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		add	dx, 28h
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	bx, [bp+var_14]
		mov	al, es:[bx]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+1]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Eh], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+2]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+3]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+24h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+4]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+38h], ax
		les	bx, [bp+var_14]
		mov	al, es:[bx+5]
		mov	ah, 0
		shl	ax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Ah], ax
		les	bx, word ptr [bp+var_10]
		mov	ax, es:[bx+26h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4Ah], 0
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp+var_16], ax
		mov	eax, dword_4F2EE
		mov	dx, word_4F2EC
		add	dx, word_4F2DE
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		mov	ax, [bp+var_16]
		dec	ah
		xor	al, 0FFh
		and	al, ah
		mov	ah, 0
		shr	ax, 4
		shl	ax, 8
		add	[bp+var_1A], ax
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_1A]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ch], ax
		mov	es:[bx+4Ah], dx

loc_21D8E:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_21BD4		endp

; START OF FUNCTION CHUNK FOR sub_21BD4
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_21BD4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21D98		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_4C123, 0
		jz	short loc_21DFA
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4Ch]
		push	word ptr es:[bx+4Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+48h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2CFC2
		add	sp, 12h
		jmp	short loc_21E32

loc_21DFA:
		cmp	byte_4C124, 0
		jz	short loc_21E1A
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		push	cs
		call	near ptr sub_1F93F
		add	sp, 8
		jmp	short loc_21E32

loc_21E1A:
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C122
sub_21D98		endp

; START OF FUNCTION CHUNK FOR sub_21D98
		db 83h
; END OF FUNCTION CHUNK FOR sub_21D98
seg054		ends
