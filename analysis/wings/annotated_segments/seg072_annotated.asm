seg072		segment	para public 'CODE' use16
		assume cs:seg072
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 8Bh, 46h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33DF6		proc far

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
sub_33DF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33E13		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+0Ch]
		mov	dword_60086, eax
		movsx	eax, word ptr [si+2]
		mov	dword_6008A, eax
		push	large dword_5B468
		call	sub_349D3
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_33E13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33E3B		proc far

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
		push	1
		push	0
		push	2
		movzx	eax, word ptr [si+14h]
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+6], dx
		mov	[si+4], ax
		push	2
		push	large [si+4]
		call	sub_42A76
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
		call	near ptr sub_33DF6
		pop	cx
		cmp	[bp+arg_4], 0
		jz	short loc_33EE0
		mov	[bp+var_4], 0FFFCh
		push	1
		push	0
		push	3
		push	large [bp+var_4]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+1Eh], dx
		mov	[si+1Ch], ax
		push	3
		push	large [si+1Ch]
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+10h], eax
		push	1
		push	ds
		push	si
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	dword_5A34C, eax

loc_33EE0:
		pop	si
		leave
		retf
sub_33E3B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33EE3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_33EE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33EEB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+1Ch], 0
		jz	short loc_33F0E
		push	0
		push	3
		mov	ax, si
		add	ax, 1Ch
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_33F0E:
		push	0
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_33EEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33F26		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	637Ah
		nop
		push	cs
		call	near ptr sub_33F63
		add	sp, 4
		pop	bp
		retf
sub_33F26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33F39		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	2
		push	large [bp+arg_2]
		call	sub_42A76
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
sub_33F39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33F63		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	ax, [si+2]
		shl	ax, 2
		mov	dx, [si+16h]
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_33F8B
		mov	ax, 1
		jmp	short loc_33F8D

loc_33F8B:
		xor	ax, ax

loc_33F8D:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_33FA8
		mov	ax, [bp+arg_2]
		sub	[si+16h], ax
		mov	ax, [si+6]
		mov	dx, [si+4]
		add	dx, [si+16h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx

loc_33FA8:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
sub_33F63		endp
seg072		ends
