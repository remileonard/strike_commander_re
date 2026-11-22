ovr373		segment	para public 'OVERLAY' use16
		assume cs:ovr373
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0660		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	al, [si+1Fh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D06D2
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_D06A7
		mov	al, [si+12h]
		push	ax
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		jmp	short loc_D06A7

loc_D0690:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_D06A7:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_D0690
		cmp	[bp+arg_2], 0
		jz	short loc_D06D2
		push	word_7AF7C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4

loc_D06D2:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		call	sub_7575F
		or	al, al
		jz	short loc_D06E6
		mov	byte ptr [si+1Fh], 1

loc_D06E6:
		pop	si
		leave
		retf
sub_D0660		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D06E9		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	bx, [bx+13h]
		mov	ax, [bx]
		mov	bx, [bp+arg_0]
		mov	bx, [bx+13h]
		mov	bx, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	bx, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	ds
		push	es
		push	si
		push	di
		les	di, [bp+var_4]
		lds	si, [bp+var_8]
		mov	cx, 0FA00h

loc_D0727:
		mov	al, [si]
		cmp	al, 0E0h
		jz	short loc_D0730
		mov	es:[di], al

loc_D0730:
		inc	si
		inc	di
		dec	cx
		jnz	short loc_D0727
		pop	di
		pop	si
		pop	es
		pop	ds
		pop	di
		pop	si
		leave
		retf
sub_D06E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D073D		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	bx, [bx+13h]
		mov	ax, [bx]
		mov	bx, [bp+arg_0]
		mov	bx, [bx+13h]
		mov	bx, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	bx, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	ds
		push	es
		push	si
		push	di
		les	di, [bp+var_4]
		lds	si, [bp+var_8]
		mov	cx, 0FA00h

loc_D077B:
		mov	al, [si]
		cmp	al, 0E0h
		jz	short loc_D0784
		mov	es:[di], al

loc_D0784:
		inc	si
		inc	di
		dec	cx
		jnz	short loc_D077B
		pop	di
		pop	si
		pop	es
		pop	ds
		pop	di
		pop	si
		leave
		retf
sub_D073D		endp
ovr373		ends
