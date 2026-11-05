seg107		segment	para public 'CODE' use16
		assume cs:seg107
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43594		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 15h
		pop	bp
		retf
sub_43594		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4359E		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+5Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_435C2
		push	si
		push	ds
		mov	ax, si
		add	ax, 52h
		push	ax
		call	sub_736E4
		add	sp, 6

loc_435C2:
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_435D9
		push	ds
		mov	ax, si
		add	ax, 52h
		push	ax
		call	RadioQueue_RegisterMessage
		add	sp, 4
		jmp	short loc_435E7

loc_435D9:
		mov	word ptr [si+0D8h], 0
		mov	word ptr [si+0D6h], 0
		mov	al, 0FFh

loc_435E7:
		mov	[bp+var_2], al
		xor	di, di
		cmp	[bp+var_2], 0FFh
		jz	short loc_435FA
		les	bx, [si+0D6h]
		mov	di, es:[bx+0Dh]

loc_435FA:
		mov	al, [bp+var_2]
		cbw
		cmp	ax, 64h
		jz	short loc_4360F
		cmp	ax, 65h
		jz	short loc_4366A
		cmp	ax, 66h
		jz	short loc_4367C
		jmp	short loc_4368C

loc_4360F:
		push	1B8h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_43629
		push	1B8h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_43658

loc_43629:
		mov	ax, ds
		cmp	[si+8], ax
		jnz	short loc_43637
		cmp	word ptr [si+6], 26ECh
		jz	short loc_43658

loc_43637:
		mov	[bp+var_4], di
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_4368C
		push	5
		push	[bp+var_4]

loc_43645:
		push	ds
		mov	ax, si
		add	ax, 52h
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_4368C
		jmp	short loc_4368C

loc_43658:
		mov	[bp+var_6], di
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_4368C
		push	2
		push	[bp+var_6]
		jmp	short loc_43645
		jmp	short loc_4368C

loc_4366A:
		mov	[bp+var_8], di
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_4368C
		push	1Dh
		push	[bp+var_8]
		jmp	short loc_43645
		jmp	short loc_4368C

loc_4367C:
		mov	[bp+var_A], di
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_4368C
		push	1Eh
		push	[bp+var_A]
		jmp	short loc_43645

loc_4368C:
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_4359E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43697		proc far

var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+5Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_436BA
		push	si
		push	ds
		mov	ax, si
		add	ax, 52h
		push	ax
		call	sub_736E4
		add	sp, 6

loc_436BA:
		mov	ax, [bp+arg_2]
		cmp	ax, 0ABh
		jnz	short loc_436F1
		mov	al, [bp+arg_8]
		mov	[bp+var_2], al
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	al, [bp+var_2]
		mov	[bp+var_6], al
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_436EF
		push	ax
		push	[bp+var_4]
		push	ds
		mov	ax, si
		add	ax, 52h
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_436FA

loc_436EF:
		jmp	short loc_436FA

loc_436F1:
		push	0C01Eh
		call	sub_1DDFE
		pop	cx

loc_436FA:
		mov	ax, 1
		pop	si
		leave
		retf
sub_43697		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43700		proc far
		push	bp
		mov	bp, sp
		mov	al, 15h
		pop	bp
		retf
sub_43700		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43707		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4374F
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1E4Ch
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_4374F
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4374F:
		pop	si
		leave
		retf
sub_43707		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43752		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	sub_36985
		add	sp, 6
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+48h]
		push	ax
		push	si
		call	sub_7434A
		add	sp, 4
		pop	si
		leave
		retf
sub_43752		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_437A0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_437B5
		jmp	loc_43839

loc_437B5:
		mov	word ptr [si], 26F5h
		mov	ax, si
		add	ax, 52h
		mov	dx, ds
		or	ax, dx
		jz	short loc_43821
		mov	word ptr [si+52h], 5BEh
		push	dx
		mov	ax, si
		add	ax, 52h
		push	ax
		call	RadioQueue_RemoveByPos
		add	sp, 4
		cmp	byte ptr [si+59h], 0
		jz	short loc_43809
		mov	ax, [si+54h]
		or	ax, [si+56h]
		jz	short loc_43809
		push	0
		mov	al, [si+58h]
		push	ax
		mov	ax, [si+56h]
		mov	dx, [si+54h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_43809

loc_43809:
		mov	word ptr [si+56h], 0
		mov	word ptr [si+54h], 0
		mov	byte ptr [si+59h], 0
		mov	dword ptr [si+5Ah], 0
		jmp	short loc_43821

loc_43821:
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
sub_437A0		endp
seg107		ends
