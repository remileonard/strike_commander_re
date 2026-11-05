seg148		segment	para public 'CODE' use16
		assume cs:seg148
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0DCh, 36h, 83h, 47h, 4, 0FCh, 90h, 90h, 0E9h, 92h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64EAC		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_64EAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64EB1		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_64F05
		cmp	[bp+arg_8], 0
		jz	short loc_64F05
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_64F05
		push	cs
		call	near ptr sub_64EAC
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_64F05:
		cmp	[bp+var_4], 0
		jnz	short loc_64F49
		cmp	[bp+arg_8], 0
		jz	short loc_64F43
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	sub_65097
		add	sp, 0Ch
		push	4586h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_76670
		add	sp, 4
		jmp	short loc_64F49

loc_64F43:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_64F4F

loc_64F49:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_64F4F:
		pop	si
		leave
		retf
sub_64EB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64F52		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_64FA6
		cmp	[bp+arg_8], 0
		jz	short loc_64FA6
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_64FA6
		push	cs
		call	near ptr sub_64EAC
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_64FA6:
		cmp	[bp+var_4], 0
		jnz	short loc_64FEA
		cmp	[bp+arg_8], 0
		jz	short loc_64FE4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	sub_65097
		add	sp, 0Ch
		push	[bp+arg_A]
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_76675
		add	sp, 4
		jmp	short loc_64FEA

loc_64FE4:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_64FF0

loc_64FEA:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_64FF0:
		pop	si
		leave
		retf
sub_64F52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64FF3		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_65047
		cmp	[bp+arg_8], 0
		jz	short loc_65047
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_65047
		push	cs
		call	near ptr sub_64EAC
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_65047:
		cmp	[bp+var_4], 0
		jnz	short loc_6508E
		cmp	[bp+arg_8], 0
		jz	short loc_65088
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	sub_65097
		add	sp, 0Ch
		push	[bp+arg_A]
		push	4588h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_76670
		add	sp, 6
		jmp	short loc_6508E

loc_65088:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_65094

loc_6508E:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_65094:
		pop	si
		leave
		retf
sub_64FF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65097		proc near

var_4		= word ptr -4
var_2		= word ptr -2
arg_2		= word ptr  6
arg_4		= byte ptr  8
arg_6		= dword ptr  0Ah
arg_A		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_2]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		cmp	[bp+arg_4], 1
		jnz	short loc_650CD
		push	458Dh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765AF
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	459Dh
		jmp	short loc_6510F

loc_650CD:
		cmp	[bp+arg_4], 2
		jnz	short loc_650EF
		push	45BCh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765AF
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	45CCh
		jmp	short loc_6510F

loc_650EF:
		cmp	[bp+arg_4], 3
		jnz	short loc_6512C
		push	45EAh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765AF
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	45FAh

loc_6510F:
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765B4
		add	sp, 6
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765AF
		add	sp, 4

loc_6512C:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	4618h
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765B4
		add	sp, 0Ch
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765AF
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765E5
		pop	cx
		pop	si
		leave
sub_65097		endp
seg148		ends
