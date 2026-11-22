seg064		segment	para public 'CODE' use16
		assume cs:seg064
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_264C2		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_264C2		endp

; START OF FUNCTION CHUNK FOR sub_264C2
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_264C2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_264CB		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	2Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_2651B
		mov	word ptr [si], 3884h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 37F8h
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	si
		call	sub_25CEB
		add	sp, 6
		mov	ax, si
		jmp	short loc_2651D

loc_2651B:
		mov	ax, si

loc_2651D:
		mov	di, ax
		push	di
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_48319
		add	sp, 6
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_264CB		endp

; START OF FUNCTION CHUNK FOR sub_264CB
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_264CB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26538		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2657F
		push	si
		push	di
		mov	bx, [di]
		call	dword ptr [bx+84h]
		add	sp, 4
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		add	[si+2Ah], ax
		mov	ax, [si+2Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+6]
		jb	short loc_2657F
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_2657F:
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_26538		endp

; START OF FUNCTION CHUNK FOR sub_26538
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_26538

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26589		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26589		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2658E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+3], 0
		jz	short loc_2659F
		mov	al, 0
		pop	bp
		retf

loc_2659F:
		mov	al, 1
		pop	bp
		retf
sub_2658E		endp

; START OF FUNCTION CHUNK FOR sub_2658E
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2658E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_265A5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_265D4
		mov	word ptr [si], 37ECh
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_265D4
		push	si
		call	sub_39C
		add	sp, 2

loc_265D4:
		pop	di
		pop	si
		pop	bp
		retf
sub_265A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_265D8		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_265EC

loc_265EC:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_26605
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jl	short loc_265EC

loc_26605:
		cmp	[bp+var_2], 0
		jz	short loc_26617
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr sub_2665F
		add	sp, 4

loc_26617:
		pop	di
		pop	si
		leave
		retf
sub_265D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2661B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2662C

loc_2662C:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_2664A
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_2662C

loc_2664A:
		cmp	[bp+var_2], 0
		jz	short loc_2665C
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr sub_2665F
		add	sp, 4

loc_2665C:
		pop	si
		leave
		retf
sub_2661B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2665F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_266BF
		mov	eax, [di+4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		dec	word ptr es:[bx+4]
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_266BF
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+2], 0
		jz	short loc_266BF
		cmp	[bp+var_4], 0
		jz	short loc_266B3
		push	3
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_266B3

loc_266B3:
		push	0
		push	di
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6

loc_266BF:
		pop	di
		pop	si
		leave
		retf
sub_2665F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_266C3		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_2]
		mov	[bp+var_14], eax
		push	8
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	ds
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		mov	[bp+var_8], 0
		jmp	short loc_26730

loc_266F5:
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_6], eax
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+19h]
		cmp	eax, [bp+var_10]
		jnz	short loc_26721
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+1Dh]
		cmp	eax, [bp+var_C]
		jnz	short loc_26721
		mov	ax, 1
		jmp	short loc_26723

loc_26721:
		xor	ax, ax

loc_26723:
		or	al, al
		jz	short loc_26730
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf

loc_26730:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_266F5
		xor	dx, dx
		xor	ax, ax
		pop	si
		leave
		retf
sub_266C3		endp

; START OF FUNCTION CHUNK FOR sub_266C3
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_266C3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2674B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2676E

loc_2675C:
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_2676E
		mov	al, 1
		pop	si
		leave
		retf

loc_2676E:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_2675C
		mov	al, 0
		pop	si
		leave
		retf
sub_2674B		endp

; START OF FUNCTION CHUNK FOR sub_2674B
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2674B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26787		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_267B0

loc_2679B:
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jnz	short loc_267B0
		mov	bx, [bp+var_2]
		mov	dx, [bx+6]
		mov	ax, [bx+4]
		pop	di
		pop	si
		leave
		retf

loc_267B0:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_2679B
		xor	dx, dx
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_26787		endp

; START OF FUNCTION CHUNK FOR sub_26787
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_26787

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_267CD		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_266C3
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2680C
		mov	al, [bp+arg_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_48365
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2680C:
		cmp	[bp+var_4], 0
		jz	short loc_26881
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+arg_6]
		mov	es:[bx+22h], al
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_26879
		mov	[bp+var_8], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_2686A
		push	di
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+17h]
		push	word ptr es:[bx+15h]
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_2686A:
		mov	eax, [bp+var_8]
		mov	[di+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]

loc_26879:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_26887

loc_26881:
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_267CD		endp

; START OF FUNCTION CHUNK FOR sub_267CD

loc_26887:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_267CD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2688B		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_266C3
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_268CA
		mov	al, [bp+arg_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_48365
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_268CA:
		cmp	[bp+var_4], 0
		jz	short loc_2694A
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	0
		call	sub_26B54
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_26942
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 19h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[di+6], eax
		mov	[bp+var_C], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_26933
		push	di
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+17h]
		push	word ptr es:[bx+15h]
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax

loc_26933:
		mov	eax, [bp+var_C]
		mov	[di+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]

loc_26942:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_26950

loc_2694A:
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_2688B		endp

; START OF FUNCTION CHUNK FOR sub_2688B

loc_26950:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2688B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26954		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		or	di, di
		jnz	short loc_2696E
		jmp	loc_26A4A

loc_2696E:
		mov	eax, [di+0Eh]
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jnz	short loc_26980
		jmp	loc_26A4A

loc_26980:
		les	bx, word ptr [bp+var_6]
		mov	al, [bp+arg_4]
		mov	es:[bx+22h], al
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_26A1F
		mov	eax, [di+0Ah]
		mov	bx, [bp+var_2]
		mov	[bx+0Ah], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_2]
		les	bx, [bx+0Ah]
		mov	ax, [bp+var_8]
		mov	es:[bx+6], ax
		mov	dword ptr [di+0Ah], 0
		les	bx, word ptr [bp+var_6]
		inc	word ptr es:[bx+4]
		push	di
		call	sub_25FAC
		add	sp, 2
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	bx, [bp+var_2]
		mov	[bx+12h], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+4]
		mov	bx, [bp+var_2]
		mov	[bx+16h], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+8]
		mov	bx, [bp+var_2]
		mov	[bx+1Ah], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_26A1F:
		mov	ax, [di+24h]
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_26A39
		push	di
		push	[bp+var_C]
		call	sub_48284
		add	sp, 4
		jmp	short loc_26A4A

loc_26A39:
		or	di, di
		jz	short loc_26A4A
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_26A4A

loc_26A4A:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
sub_26954		endp
seg064		ends
