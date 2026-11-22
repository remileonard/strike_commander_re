seg120		segment	para public 'CODE' use16
		assume cs:seg120
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Eh, 0E8h, 0DBh, 0FCh, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36237		proc far
		push	bp
		mov	bp, sp
		leave
		pop	cx
		push	cx
		call	sub_13451
		pop	cx
		pop	bp
		retf
sub_36237		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36245		proc far

var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
saved_2		= word ptr  2
saved_4		= word ptr  4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		cmp	[bp+saved_2], 0FFFCh
		jnz	short loc_3625E
		push	ds
		push	seg dseg
		pop	ds
		cmp	byte_4D394, 0
		pop	ds
		jnz	short loc_36264

loc_3625E:
		leave
		push	cs
		push	7
		retf

loc_36264:
		push	ds
		push	es
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	seg dseg
		pop	ds
		mov	ax, [bp+saved_4]
		mov	dx, [bp+arg_0]
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	al, 0
		mov	[bp+var_6], al
		mov	[bp+var_5], al
		mov	cl, al

loc_36288:
		jmp	short loc_362B7

loc_3628A:
		les	bx, [bp+var_4]
		inc	[bp+var_4]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 66h
		jz	short loc_362A6
		cmp	ax, 0F6h
		jz	short loc_362AC
		cmp	ax, 0F7h
		jz	short loc_362B5
		jmp	short loc_362B7

loc_362A6:
		mov	[bp+var_5], 1
		jmp	short loc_362B7

loc_362AC:
		mov	al, 1
		mov	[bp+var_6], al
		mov	cl, al
		jmp	short loc_36288

loc_362B5:
		mov	cl, 1

loc_362B7:
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jz	short loc_3628A
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 36h
		jz	short loc_362CE
		cmp	byte ptr es:[bx], 3Eh
		jnz	short loc_362D4

loc_362CE:
		add	[bp+var_4], 3
		jmp	short loc_362D7

loc_362D4:
		inc	[bp+var_4]

loc_362D7:
		mov	ax, [bp+var_4]
		mov	[bp+saved_4], ax
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		cmp	[bp+var_6], 0
		jz	short loc_362F0
		mov	ax, 7Fh
		jmp	short loc_36306

loc_362F0:
		cmp	[bp+var_5], 0
		jz	short loc_36301
		mov	eax, 7FFFFFFFh
		xor	edx, edx
		jmp	short loc_36306

loc_36301:
		mov	ax, 7FFFh
		xor	dx, dx

loc_36306:
		pop	es
		pop	ds
		leave
		add	sp, 2
		iret
sub_36245		endp

; START OF FUNCTION CHUNK FOR sub_36245
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_36245

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3630F		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		mov	[bp+var_2], seg seg120
		mov	[bp+var_4], 15h
		les	di, [bp+var_4]
		mov	cx, word_48B44
		mov	ax, 1209h
		mov	bx, 5346h
		int	15h
		pop	di
sub_3630F		endp
seg120		ends
