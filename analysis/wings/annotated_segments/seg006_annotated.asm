seg006		segment	para public 'CODE' use16
		assume cs:seg006
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0, 0, 59h, 0EBh, 0

loc_4FF6:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FFA		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	bl, [si]
		mov	dx, 3C2h
		mov	al, bl
		out	dx, al
		mov	dx, 3C4h
		mov	al, 0
		out	dx, al
		mov	dx, 3C5h
		mov	al, 0
		out	dx, al
		mov	[bp+var_1], 1
		jmp	short loc_503A

loc_501E:
		mov	cl, [bp+var_1]
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	bx, ax
		mov	bl, [bx+si+4]
		mov	dx, 3C4h
		mov	al, cl
		out	dx, al
		mov	dx, 3C5h
		mov	al, bl
		out	dx, al
		inc	[bp+var_1]

loc_503A:
		cmp	[bp+var_1], 4
		jbe	short loc_501E
		mov	dx, 3C4h
		mov	al, 0
		out	dx, al
		mov	dx, 3C5h
		mov	al, 3
		out	dx, al
		mov	dx, 3D4h
		mov	al, 11h
		out	dx, al
		mov	dx, 3D5h
		mov	ax, 0FF00h
		out	dx, ax
		mov	[bp+var_1], 0
		jmp	short loc_5087

loc_505F:
		cmp	[bp+var_1], 1
		jz	short loc_5084
		cmp	[bp+var_1], 2
		jz	short loc_5084
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	bx, ax
		mov	bl, [bx+si+9]
		mov	cl, [bp+var_1]
		mov	dx, 3D4h
		mov	al, cl
		out	dx, al
		mov	dx, 3D5h
		mov	al, bl
		out	dx, al

loc_5084:
		inc	[bp+var_1]

loc_5087:
		cmp	[bp+var_1], 7
		jbe	short loc_505F
		mov	dx, 3D4h
		mov	al, 11h
		out	dx, al
		mov	dx, 3D5h
		mov	al, 80h
		out	dx, al
		mov	[bp+var_1], 9
		jmp	short loc_50BB

loc_509F:
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	bx, ax
		mov	bl, [bx+si+9]
		mov	cl, [bp+var_1]
		mov	dx, 3D4h
		mov	al, cl
		out	dx, al
		mov	dx, 3D5h
		mov	al, bl
		out	dx, al
		inc	[bp+var_1]

loc_50BB:
		cmp	[bp+var_1], 17h
		jb	short loc_509F
		pop	si
		leave
		retf
sub_4FFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50C4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_50FB
		movsx	eax, [bp+arg_4]
		mov	dword_59F38, eax
		mov	ax, [bp+arg_2]
		mov	word_59F32, ax
		call	sub_5535
		or	ax, ax
		jnz	short loc_50EF

loc_50EB:
		xor	ax, ax
		jmp	short loc_50FE

loc_50EF:
		call	sub_547A
		or	ax, ax
		jz	short loc_50EB
		mov	byte ptr [si], 1

loc_50FB:
		mov	ax, 1

loc_50FE:
		pop	si
		pop	bp
		retf
sub_50C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5101		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_5112
		call	sub_55A2

loc_5112:
		mov	byte ptr [si], 0
		pop	si
		pop	bp
		retf
sub_5101		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5118		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_5129
		call	sub_560B

loc_5129:
		pop	si
		pop	bp
		retf
sub_5118		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_512C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jnz	short loc_513F
		jmp	loc_5202

loc_513F:
		call	sub_566B
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_5150
		cmp	dx, 59h
		jnz	short loc_513F

loc_5150:
		cmp	dx, 0FFFFh
		jnz	short loc_5158
		jmp	loc_5202

loc_5158:
		mov	di, si
		inc	di
		mov	[di], dl
		inc	di
		mov	[bp+var_2], 0
		jmp	short loc_517F

loc_5165:
		call	sub_566B
		mov	dx, ax
		cmp	ax, 0FFFFh
		jz	short loc_5165
		cmp	dx, 20h
		jge	short loc_5179
		mov	dx, 20h

loc_5179:
		mov	[di], dl
		inc	[bp+var_2]
		inc	di

loc_517F:
		cmp	[bp+var_2], 11h
		jl	short loc_5165
		cmp	word_59F2A, 0
		jz	short loc_519B
		mov	ax, si
		inc	ax
		push	ax
		push	20Ch
		call	CRT_Msg_NullPtrAssign
		add	sp, 4

loc_519B:
		cmp	byte ptr [si+1], 59h
		jnz	short loc_51B2
		cmp	byte ptr [si+7], 50h
		jnz	short loc_51B2
		cmp	byte ptr [si+0Dh], 52h
		jnz	short loc_51B2
		mov	ax, 1
		jmp	short loc_51B4

loc_51B2:
		xor	ax, ax

loc_51B4:
		or	ax, ax
		jz	short loc_5202
		push	large 0A0000h
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_2E60
		add	sp, 6
		mov	[si+14h], ax
		push	large 0A0000h
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_2E60
		add	sp, 6
		mov	[si+16h], ax
		push	large 0A0000h
		mov	ax, si
		add	ax, 0Eh
		push	ax
		call	sub_2E60
		add	sp, 6
		mov	[si+18h], ax
		mov	ax, 1
		jmp	short loc_5204

loc_5202:
		xor	ax, ax

loc_5204:
		pop	di
		pop	si
		leave
		retf
sub_512C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5208		proc far

var_108		= word ptr -108h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_5366
		pop	cx
		mov	[si+1], ax
		or	ax, ax
		jnz	short loc_5227

loc_5222:
		xor	ax, ax
		jmp	loc_52D2

loc_5227:
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_53D2
		add	sp, 6
		or	ax, ax
		jnz	short loc_5222
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		xor	di, di
		jmp	short loc_52B2

loc_524B:
		mov	al, byte ptr [bp+di+var_108]
		cbw
		mov	[bp+var_8], ax
		mov	al, byte ptr [bp+di+var_108+1]
		cbw
		or	ax, ax
		jz	short loc_5268
		cmp	ax, 6
		jz	short loc_526D
		cmp	ax, 7
		jz	short loc_528D
		jmp	short loc_52AF

loc_5268:
		mov	di, [bp+var_2]
		jmp	short loc_52AF

loc_526D:
		cmp	[bp+var_4], 1
		jge	short loc_52AF
		lea	ax, [bp+var_108]
		push	ax
		mov	ax, di
		pop	dx
		add	ax, dx
		mov	bx, ax
		or	byte ptr [bx+0Ah], 80h
		or	byte ptr [bx+12h], 80h
		or	byte ptr [bx+1Ah], 80h
		jmp	short loc_52AF

loc_528D:
		cmp	[bp+var_6], 1
		jge	short loc_52AF
		lea	ax, [bp+var_108]
		push	ax
		mov	ax, di
		pop	dx
		add	ax, dx
		mov	bx, ax
		or	byte ptr [bx+0Ah], 80h
		or	byte ptr [bx+12h], 80h
		or	byte ptr [bx+1Ah], 80h
		or	byte ptr [bx+1Dh], 80h

loc_52AF:
		add	di, [bp+var_8]

loc_52B2:
		cmp	di, [bp+var_2]
		jl	short loc_524B
		lea	ax, [bp+var_108]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_541C
		add	sp, 4
		or	ax, ax
		jz	short loc_52CC
		jmp	loc_5222

loc_52CC:
		mov	byte ptr [si], 1
		mov	ax, 1

loc_52D2:
		pop	di
		pop	si
		leave
		retf
sub_5208		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52D6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 1Bh
		mov	ax, [si+1]
		or	ax, 5
		mov	[si+3], ax
		mov	word ptr [si+7], 0
		mov	ax, si
		add	ax, 1Bh
		mov	[si+9], ax
		mov	ax, si
		add	ax, 1Bh
		mov	[si+13h], ds
		mov	ax, si
		add	ax, 13h
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		push	33h
		call	sub_1B5E
		add	sp, 8
		cmp	word ptr [si+3], 0
		jz	short loc_5327
		xor	ax, ax
		jmp	short loc_5362

loc_5327:
		mov	ax, [di]
		mov	[si+11Bh], ax
		mov	ax, [si+11Bh]
		mov	bx, 0B6h
		cwd
		idiv	bx
		mov	[si+11Bh], ax
		mov	ax, [di+2]
		mov	[si+11Dh], ax
		mov	ax, [si+11Dh]
		cwd
		idiv	bx
		mov	[si+11Dh], ax
		mov	ax, [di+4]
		mov	[si+11Fh], ax
		mov	ax, [si+11Fh]
		cwd
		idiv	bx
		mov	[si+11Fh], ax
		mov	ax, 1

loc_5362:
		pop	di
		pop	si
		pop	bp
		retf
sub_52D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5366		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 60h
		jmp	short loc_53C7

loc_5376:
		mov	[bp+var_4], di
		or	[bp+var_4], 7F00h
		mov	[bp+var_2], 7Fh
		mov	ax, di
		shl	ax, 8
		or	[bp+var_2], ax
		mov	word ptr [si+7], 0
		mov	word ptr [si+9], 0
		mov	word ptr [si+5], 0
		mov	ax, [bp+var_2]
		mov	[si+3], ax
		mov	ax, si
		add	ax, 3
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		push	33h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	ax, [si+3]
		cmp	ax, [bp+var_4]
		jnz	short loc_53C6
		mov	ax, [bp+var_2]
		and	ax, 0FF00h
		jmp	short loc_53CE

loc_53C6:
		inc	di

loc_53C7:
		cmp	di, 70h
		jle	short loc_5376
		xor	ax, ax

loc_53CE:
		pop	di
		pop	si
		leave
		retf
sub_5366		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53D2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+1]
		or	ax, 3
		mov	[si+3], ax
		mov	word ptr [si+7], 0
		mov	ax, [bp+arg_4]
		mov	[si+9], ax
		mov	[si+13h], ds
		mov	ax, si
		add	ax, 13h
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		push	33h
		call	sub_1B5E
		add	sp, 8
		mov	ax, [si+7]
		mov	[di], ax
		mov	ax, [si+3]
		pop	di
		pop	si
		pop	bp
		retf
sub_53D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_541C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+1]
		or	ax, 4
		mov	[si+3], ax
		mov	word ptr [si+7], 0
		mov	[si+9], di
		mov	[si+13h], ds
		mov	ax, si
		add	ax, 13h
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		mov	ax, si
		add	ax, 3
		push	ax
		push	33h
		call	sub_1B5E
		add	sp, 8
		mov	ax, [si+3]
		pop	di
		pop	si
		pop	bp
		retf
sub_541C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_545E		proc far
		push	bp
		mov	bp, sp
		mov	byte_5EFDD, 0
		mov	byte_5EFE4, 0
		pop	bp
		retf
sub_545E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_546D		proc far
		push	bp
		mov	bp, sp
sub_546D		endp
seg006		ends
