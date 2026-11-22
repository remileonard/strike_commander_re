ovr245		segment	para public 'OVERLAY' use16
		assume cs:ovr245
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE6C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_BE6DF
		push	92h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_BE6DF
		jmp	loc_BE7D0

loc_BE6DF:
		push	seg stub245
		push	offset sub_487C5
		push	1
		push	20h
		push	4
		push	si
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub245
		push	offset sub_487C0
		push	1
		push	2
		push	7
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [si+8Eh], 0FFFFh
		mov	byte ptr [si+90h], 0
		mov	byte ptr [si+91h], 1
		mov	byte ptr [si+0Ch], 3
		mov	byte ptr [si+10h], 3
		mov	byte ptr [si+8], 3
		mov	byte ptr [si+4], 8
		mov	byte ptr [si], 8
		mov	al, 9
		mov	[si+3Ch], al
		mov	[si+38h], al
		mov	[si+34h], al
		mov	al, 0Ah
		mov	[si+30h], al
		mov	[si+2Ch], al
		mov	[si+28h], al
		mov	al, 0Bh
		mov	[si+48h], al
		mov	[si+44h], al
		mov	[si+40h], al
		mov	byte ptr [si+4Ch], 4
		mov	byte ptr [si+50h], 5
		mov	byte ptr [si+54h], 0Ch
		mov	al, 0Dh
		mov	[si+78h], al
		mov	[si+74h], al
		mov	[si+70h], al
		mov	[si+6Ch], al
		mov	[si+68h], al
		mov	[si+64h], al
		mov	[si+60h], al
		mov	[si+5Ch], al
		or	byte ptr [si+63h], 1
		and	byte ptr [si+5Fh], 0FEh
		or	byte ptr [si+5Fh], 1
		or	byte ptr [si+47h], 4
		mov	al, 1
		and	byte ptr [si+43h], 0FBh
		mov	dx, ax
		shl	al, 2
		or	[si+43h], al
		and	dx, 1
		and	byte ptr [si+3], 0FBh
		mov	ax, dx
		shl	dl, 2
		or	[si+3], dl
		and	ax, 1
		and	byte ptr [si+23h], 0FBh
		mov	dx, ax
		shl	al, 2
		or	[si+23h], al
		and	dx, 1
		and	byte ptr [si+1Bh], 0FBh
		mov	ax, dx
		shl	dl, 2
		or	[si+1Bh], dl
		and	ax, 1
		and	byte ptr [si+0Bh], 0FBh
		shl	al, 2
		or	[si+0Bh], al

loc_BE7D0:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_BE6C0		endp

; START OF FUNCTION CHUNK FOR sub_BE6C0
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BE6C0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE7D8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	401Ch
		call	sub_2DADA
		add	sp, 4
		mov	byte ptr [si+91h], 0
		pop	si
		pop	bp
		retf
sub_BE7D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE7F4		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 3E8h
		jle	short loc_BE812
		mov	ax, 1
		jmp	short loc_BE814

loc_BE812:
		xor	ax, ax

loc_BE814:
		mov	[bp+var_2], al
		cmp	word ptr [si+8Eh], 0
		jl	short loc_BE823
		mov	ax, 1
		jmp	short loc_BE825

loc_BE823:
		xor	ax, ax

loc_BE825:
		or	al, al
		jz	short loc_BE833
		mov	ax, [si+8Eh]
		inc	ax
		mov	[bp+var_6], ax
		jmp	short loc_BE838

loc_BE833:
		mov	[bp+var_6], 20h

loc_BE838:
		xor	ax, ax
		mov	di, ax
		mov	[bp+var_4], ax
		jmp	loc_BE8D6

loc_BE842:
		mov	bx, [bp+var_4]
		shl	bx, 2
		mov	al, [bx+si]
		cmp	al, [bp+arg_2]
		jz	short loc_BE852
		jmp	loc_BE8D3

loc_BE852:
		mov	bx, [bp+var_4]
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 2
		and	ax, 1
		cmp	al, [bp+var_2]
		jnz	short loc_BE8D3

loc_BE866:
		inc	di
		mov	bx, [bp+var_4]
		add	bx, di
		shl	bx, 2
		mov	al, [bx+si]
		cmp	al, [bp+arg_2]
		jnz	short loc_BE896
		mov	bx, [bp+var_4]
		add	bx, di
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 2
		and	ax, 1
		cmp	al, [bp+var_2]
		jnz	short loc_BE896
		mov	ax, [bp+var_4]
		add	ax, di
		cmp	ax, [bp+var_6]
		jl	short loc_BE866

loc_BE896:
		or	di, di
		jz	short loc_BE8BC
		mov	[bp+var_8], di
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_8]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	di, ax

loc_BE8BC:
		push	[bp+arg_8]
		mov	ax, [bp+var_4]
		add	ax, di
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_BE8EC
		add	sp, 6
		mov	[bp+var_1], al
		jmp	short loc_BE8E1

loc_BE8D3:
		inc	[bp+var_4]

loc_BE8D6:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_6]
		jge	short loc_BE8E1
		jmp	loc_BE842

loc_BE8E1:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_BE7F4		endp

; START OF FUNCTION CHUNK FOR sub_BE7F4
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BE7F4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE8EC		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		push	2
		call	sub_2DB9B
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_BE911
		jmp	loc_BE9B1

loc_BE911:
		cmp	word ptr [si+8Eh], 0
		jl	short loc_BE91D
		mov	ax, 1
		jmp	short loc_BE91F

loc_BE91D:
		xor	ax, ax

loc_BE91F:
		or	al, al
		jz	short loc_BE93B
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si]
		mov	bx, [si+8Eh]
		shl	bx, 2
		cmp	al, [bx+si]
		jnz	short loc_BE93B
		mov	[bp+var_1], 1
		jmp	short loc_BE9B1

loc_BE93B:
		cmp	word ptr [si+8Eh], 0
		jl	short loc_BE947
		mov	ax, 1
		jmp	short loc_BE949

loc_BE947:
		xor	ax, ax

loc_BE949:
		mov	ah, 0
		or	ax, ax
		jz	short loc_BE955
		cmp	[si+8Eh], di
		jle	short loc_BE9B1

loc_BE955:
		cmp	di, 20h
		jge	short loc_BE9B1
		cmp	word ptr [si+8Eh], 0
		jl	short loc_BE966
		mov	ax, 1
		jmp	short loc_BE968

loc_BE966:
		xor	ax, ax

loc_BE968:
		or	al, al
		jz	short loc_BE98C
		mov	bx, [si+8Eh]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		and	ax, 1
		mov	bx, [si+8Eh]
		shl	bx, 2
		and	byte ptr [bx+si+3], 0FDh
		shl	al, 1
		or	[bx+si+3], al

loc_BE98C:
		mov	al, 1
		mov	[bp+var_1], al
		mov	[si+90h], al
		mov	[si+8Eh], di
		mov	bx, [si+8Eh]
		shl	bx, 2
		or	byte ptr [bx+si+3], 2
		mov	bx, [si+8Eh]
		shl	bx, 2
		mov	ax, [bp+arg_4]
		mov	[bx+si+1], ax

loc_BE9B1:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_BE8EC		endp

; START OF FUNCTION CHUNK FOR sub_BE8EC
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BE8EC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE9BC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_BE9BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE9C4		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		xor	di, di
		jmp	short loc_BE9F4

loc_BE9D7:
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si]
		cmp	al, [bp+arg_2]
		jnz	short loc_BE9F3
		push	[bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_BEA04
		add	sp, 6
		or	[bp+var_1], al

loc_BE9F3:
		inc	di

loc_BE9F4:
		cmp	di, 20h
		jl	short loc_BE9D7
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_BE9C4		endp

; START OF FUNCTION CHUNK FOR sub_BE9C4
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BE9C4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEA04		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	di, 20h
		jge	short loc_BEA49
		or	di, di
		jl	short loc_BEA49
		cmp	[bp+arg_4], 0
		jz	short loc_BEA2E
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+si+1]
		cmp	ax, [bp+arg_4]
		jnz	short loc_BEA49

loc_BEA2E:
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 1
		and	ax, 1
		mov	[bp+var_1], al
		mov	bx, di
		shl	bx, 2
		and	byte ptr [bx+si+3], 0FDh
		jmp	short loc_BEA4D

loc_BEA49:
		mov	[bp+var_1], 0

loc_BEA4D:
		cmp	[bp+var_1], 0
		jz	short loc_BEA94
		cmp	[si+8Eh], di
		jnz	short loc_BEA94
		cmp	word ptr [si+8Eh], 0
		jl	short loc_BEA65
		mov	ax, 1
		jmp	short loc_BEA67

loc_BEA65:
		xor	ax, ax

loc_BEA67:
		or	al, al
		jz	short loc_BEA94
		push	2
		call	sub_2DB9B
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BEA8E
		push	1
		call	sub_2DB9B
		add	sp, 2
		or	al, al
		jz	short loc_BEA8E
		call	sub_2DBC6

loc_BEA8E:
		mov	word ptr [si+8Eh], 0FFFFh

loc_BEA94:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_BEA04		endp

; START OF FUNCTION CHUNK FOR sub_BEA04
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BEA04

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEA9F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+8Eh], 0
		jl	short loc_BEAB3
		mov	ax, 1
		jmp	short loc_BEAB5

loc_BEAB3:
		xor	ax, ax

loc_BEAB5:
		or	al, al
		jz	short loc_BEAC7
		push	0
		push	word ptr [si+8Eh]
		push	si
		push	cs
		call	near ptr sub_BEA04
		add	sp, 6

loc_BEAC7:
		xor	di, di
		jmp	short loc_BEAD7

loc_BEACB:
		push	0
		push	di
		push	si
		push	cs
		call	near ptr sub_BEA04
		add	sp, 6
		inc	di

loc_BEAD7:
		cmp	di, 20h
		jl	short loc_BEACB
		pop	di
		pop	si
		pop	bp
		retf
sub_BEA9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEAE0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_BEAE0		endp

; START OF FUNCTION CHUNK FOR sub_BEAE0
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BEAE0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEAEC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BEB3D
		mov	[bp+var_2], 0
		jmp	short loc_BEB28

loc_BEB05:
		push	0
		push	3
		mov	ax, [bp+var_2]
		mov	dx, 7
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 80h
		push	dx
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		inc	[bp+var_2]

loc_BEB28:
		cmp	[bp+var_2], 2
		jl	short loc_BEB05
		test	di, 1
		jz	short loc_BEB3D
		push	si
		call	sub_39C
		add	sp, 2

loc_BEB3D:
		pop	di
		pop	si
		leave
		retf
sub_BEAEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEB41		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_BEB5C
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BEB7F

loc_BEB5C:
		and	byte ptr [si+3], 0FBh
		mov	al, 0
		and	byte ptr [si+3], 0FDh
		mov	dx, ax
		shl	al, 1
		or	[si+3], al
		and	dx, 1
		and	byte ptr [si+3], 0FEh
		or	[si+3], dl
		mov	byte ptr [si], 0FFh
		mov	word ptr [si+1], 0

loc_BEB7F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_BEB41		endp

; START OF FUNCTION CHUNK FOR sub_BEB41
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BEB41

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEB87		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_BEBA2
		push	7
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BEBA9

loc_BEBA2:
		mov	dword ptr [si], 0

loc_BEBA9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_BEB87		endp

; START OF FUNCTION CHUNK FOR sub_BEB87
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BEB87
ovr245		ends
