seg023		segment	para public 'CODE' use16
		assume cs:seg023
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0, 0, 0

loc_CFD4:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CFD6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_D034

loc_CFE2:
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		cmp	word ptr [bx+si+92h], 0
		jz	short loc_D025
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+94h]
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	bx, ax
		mov	bx, [bx+si+92h]
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_D021
		mov	ax, 1
		jmp	short loc_D023

loc_D021:
		xor	ax, ax

loc_D023:
		jmp	short loc_D027

loc_D025:
		mov	al, 0

loc_D027:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D033
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf

loc_D033:
		inc	di

loc_D034:
		cmp	di, 5
		jl	short loc_CFE2
		mov	ax, 0FFFFh
		pop	di
		pop	si
		pop	bp
		retf
sub_CFD6		endp

; START OF FUNCTION CHUNK FOR sub_CFD6
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_CFD6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D044		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_CFD6
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_D063
		jmp	loc_D13C

loc_D063:
		mov	ax, [bp+var_2]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h
		mov	[bp+var_4], dx
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		mov	bx, ax
		mov	eax, [bx+si+0Ch]
		mov	[bp+var_6], ax
		cmp	[bp+arg_4], 3E8h
		jge	short loc_D0AC
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h
		sub	dx, ax
		mov	[bp+var_8], dx
		jmp	short loc_D0BB

loc_D0AC:
		cmp	[bp+arg_4], 1388h
		jge	short loc_D0BB
		mov	[bp+var_8], 5

loc_D0BB:
		cmp	[bp+var_8], 0
		jge	short loc_D0C5
		xor	ax, ax
		jmp	short loc_D0C8

loc_D0C5:
		mov	ax, [bp+var_8]

loc_D0C8:
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_D13C
		mov	di, [bp+var_4]
		push	0
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	di
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_C], ax
		cmp	word ptr [di], 0
		jz	short loc_D113
		push	0
		push	[bp+var_C]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_D113

loc_D113:
		cmp	word ptr [di], 0
		jz	short loc_D12A
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_D12A

loc_D12A:
		mov	bx, [bp+var_4]
		mov	al, [bp+arg_2]
		mov	[bx+0Eh], al
		mov	bx, [bp+var_4]
		mov	ax, [bp+arg_8]
		mov	[bx+0Fh], ax

loc_D13C:
		pop	di
		pop	si
		leave
		retf
sub_D044		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D140		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
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
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_D1FB

loc_D155:
		mov	ax, [bp+var_2]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h
		mov	di, dx
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jz	short loc_D172
		jmp	loc_D1F8

loc_D172:
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_8]
		jnz	short loc_D1F8
		cmp	[bp+arg_4], 3E8h
		jge	short loc_D19D
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h
		sub	dx, ax
		mov	[bp+var_4], dx
		jmp	short loc_D1AC

loc_D19D:
		cmp	[bp+arg_4], 1388h
		jge	short loc_D1AC
		mov	[bp+var_4], 5

loc_D1AC:
		cmp	[bp+var_4], 0
		jge	short loc_D1B6
		xor	ax, ax
		jmp	short loc_D1B9

loc_D1B6:
		mov	ax, [bp+var_4]

loc_D1B9:
		mov	[bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_D1E6
		mov	ax, [bp+var_6]
		mov	[bp+var_8], ax
		cmp	word ptr [di], 0
		jz	short loc_D1E4
		push	0
		push	[bp+var_8]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_D1E4

loc_D1E4:
		jmp	short loc_D1F8

loc_D1E6:
		push	di
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	byte ptr [di+0Eh], 0Fh
		mov	word ptr [di+0Fh], 0

loc_D1F8:
		inc	[bp+var_2]

loc_D1FB:
		cmp	[bp+var_2], 5
		jge	short loc_D204
		jmp	loc_D155

loc_D204:
		pop	di
		pop	si
		leave
		retf
sub_D140		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D208		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_D253

loc_D21C:
		mov	ax, [bp+var_2]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h
		mov	di, dx
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_D250
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_D250
		push	di
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	byte ptr [di+0Eh], 0Fh
		mov	word ptr [di+0Fh], 0

loc_D250:
		inc	[bp+var_2]

loc_D253:
		cmp	[bp+var_2], 5
		jl	short loc_D21C
		pop	di
		pop	si
		leave
		retf
sub_D208		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D25D		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		xor	si, si
		xor	di, di
		jmp	short loc_D293

loc_D26B:
		mov	ax, di
		mov	dx, 11h
		imul	dx
		mov	dx, cx
		add	dx, ax
		add	dx, 92h
		mov	si, dx
		mov	al, [si+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_D292
		mov	ax, [si+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_D292
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf

loc_D292:
		inc	di

loc_D293:
		cmp	di, 5
		jl	short loc_D26B
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_D25D		endp

; START OF FUNCTION CHUNK FOR sub_D25D
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_D25D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D2A2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_D318

loc_D2BB:
		mov	ax, [bp+var_4]
		mov	dx, 11h
		imul	dx
		mov	dx, si
		add	dx, ax
		add	dx, 92h
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0Eh], 0Fh
		jz	short loc_D315
		mov	di, [bp+var_2]
		cmp	word ptr [di], 0
		jz	short loc_D2FD
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_D2F9
		mov	ax, 1
		jmp	short loc_D2FB

loc_D2F9:
		xor	ax, ax

loc_D2FB:
		jmp	short loc_D2FF

loc_D2FD:
		mov	al, 1

loc_D2FF:
		or	al, al
		jz	short loc_D315
		push	[bp+var_2]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+0Eh], 0Fh

loc_D315:
		inc	[bp+var_4]

loc_D318:
		cmp	[bp+var_4], 5
		jl	short loc_D2BB
		pop	di
		pop	si
sub_D2A2		endp
seg023		ends
