seg056		segment	para public 'CODE' use16
		assume cs:seg056
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 5Dh, 0CBh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22545		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		mov	ax, [si+0Ch]
		mov	[si+0Eh], ax
		mov	eax, [si+4]
		mov	[si+10h], eax
		pop	si
		pop	bp
		retf
sub_22545		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22562		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+4]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_22596

loc_22579:
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 4
		inc	di
		add	word ptr [bp+var_4], 4

loc_22596:
		cmp	[si+2], di
		jg	short loc_22579
		pop	di
		pop	si
		leave
		retf
sub_22562		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2259F		proc far

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
		mov	[si+0Ch], ax
		push	1
		push	0
		push	2
		movzx	eax, word ptr [si+0Ch]
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+6], dx
		mov	[si+4], ax
		mov	ax, [si+0Ch]
		shr	ax, 7
		mov	[si], ax
		push	si
		push	cs
		call	near ptr sub_22545
		add	sp, 2
		cmp	[bp+arg_4], 0
		jz	short loc_22606
		mov	[bp+var_4], 0FFFCh
		push	1
		push	0
		push	3
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+16h], dx
		mov	[si+14h], ax

loc_22606:
		pop	si
		leave
		retf
sub_2259F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22609		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_2261C
		jmp	loc_226C0

loc_2261C:
		cmp	dword ptr [si+14h], 0
		jz	short loc_22649
		push	0
		push	3
		push	word ptr [si+16h]
		push	word ptr [si+14h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8], ax
		push	si
		call	sub_2C058
		add	sp, 2
		jmp	short loc_226C0

loc_22649:
		mov	eax, [si+4]
		mov	[bp+var_4], eax
		jmp	short loc_226B6

loc_22653:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		jmp	short loc_226A8

loc_2265D:
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx]
		mov	eax, es:[bx+2]
		sar	eax, 8
		les	bx, word ptr [bp+var_8]
		les	bx, es:[bx]
		mov	edx, es:[bx+2]
		sar	edx, 8
		cmp	eax, edx
		jge	short loc_226A4
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, [bp+var_C]
		mov	es:[bx], eax

loc_226A4:
		add	word ptr [bp+var_8], 4

loc_226A8:
		mov	eax, [si+10h]
		cmp	eax, [bp+var_8]
		jnz	short loc_2265D
		add	word ptr [bp+var_4], 4

loc_226B6:
		mov	eax, [si+10h]
		cmp	eax, [bp+var_4]
		jnz	short loc_22653

loc_226C0:
		pop	si
		leave
		retf
sub_22609		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_226C3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+14h], 0
		jz	short loc_226E6
		push	0
		push	3
		mov	ax, si
		add	ax, 14h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_226E6:
		push	0
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_226C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_226FE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	bx, [bp+arg_0]
		movzx	eax, word_4F27A
		mov	dx, word_4F26E
		inc	dx
		shl	dx, 2
		movzx	edx, dx
		sub	eax, edx
		movzx	edx, bx
		cmp	eax, edx
		jl	short loc_22743
		sub	word_4F27A, bx
		mov	eax, dword_4F272
		mov	dx, word_4F270
		add	dx, word_4F27A
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	dx, [bp+var_2]
sub_226FE		endp

; START OF FUNCTION CHUNK FOR sub_226FE
		db 8Bh
		inc	si
; END OF FUNCTION CHUNK FOR sub_226FE
seg056		ends
