seg066		segment	para public 'CODE' use16
		assume cs:seg066
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 80h, 67h, 11h, 0FEh

loc_292B4:
		db 8Bh, 56h, 8, 8Bh, 46h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_292BC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		mov	ax, [si+14h]
		mov	[si+16h], ax
		mov	eax, [si+4]
		mov	[si+18h], eax
		pop	si
		pop	bp
		retf
sub_292BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_292D9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+0Ch]
		mov	dword_7CB7A, eax
		movsx	eax, word ptr [si+2]
		mov	dword_7CB7E, eax
		push	large dword_77554
		call	sub_2CD83
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_292D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29301		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+14h], ax
		cmp	dword_7748F, 0
		jz	short loc_29323
		mov	eax, dword_7748F
		mov	[si+4], eax
		jmp	short loc_2932C

loc_29323:
		push	0D034h
		call	sub_1DDFE
		pop	cx

loc_2932C:
		push	2
		push	large [si+4]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+0Ch], eax
		mov	ax, [si+14h]
		shr	ax, 7
		mov	[si], ax
		push	si
		push	cs
		call	near ptr sub_292BC
		pop	cx
		cmp	[bp+arg_4], 0
		jz	short loc_293A3
		mov	[bp+var_4], 0FFFCh
		push	1
		push	0
		push	3
		push	large [bp+var_4]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+1Eh], dx
		mov	[si+1Ch], ax
		push	3
		push	large [si+1Ch]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+10h], eax
		push	1
		push	ds
		push	si
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	dword_76A3C, eax

loc_293A3:
		pop	si
		leave
		retf
sub_29301		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_293A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_293A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_293AE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+1Ch], 0
		jz	short loc_293D1
		push	0
		push	3
		mov	ax, si
		add	ax, 1Ch
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_293D1:
		pop	si
		pop	bp
		retf
sub_293AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_293D4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	6496h
		nop
		push	cs
		call	near ptr sub_29411
		add	sp, 4
		pop	bp
		retf
sub_293D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_293E7		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	2
		push	large [bp+arg_2]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [si+18h]
		mov	es:[bx], eax
		inc	word ptr [si+2]
		add	word ptr [si+18h], 4
		pop	si
		pop	bp
		retf
sub_293E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29411		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		shl	ax, 2
		mov	dx, [si+16h]
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_29431
		mov	ax, 1
		jmp	short loc_29433

loc_29431:
		xor	ax, ax

loc_29433:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29456
		mov	ax, [bp+arg_2]
		sub	[si+16h], ax
		mov	ax, [si+6]
		mov	dx, [si+4]
		add	dx, [si+16h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
sub_29411		endp

; START OF FUNCTION CHUNK FOR sub_29411
		db 8Bh
		push	si
; END OF FUNCTION CHUNK FOR sub_29411
seg066		ends
