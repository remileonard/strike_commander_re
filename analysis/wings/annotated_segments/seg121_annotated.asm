seg121		segment	para public 'CODE' use16
		assume cs:seg121
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48252		proc far

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
		jnz	short loc_4826B
		push	ds
		push	seg dseg
		pop	ds
		cmp	byte_5DD6A, 0
		pop	ds
		jnz	short loc_48271

loc_4826B:
		leave
		call	sub_9D47

loc_48271:
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

loc_48295:
		jmp	short loc_482C4

loc_48297:
		les	bx, [bp+var_4]
		inc	[bp+var_4]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 66h
		jz	short loc_482B3
		cmp	ax, 0F6h
		jz	short loc_482B9
		cmp	ax, 0F7h
		jz	short loc_482C2
		jmp	short loc_482C4

loc_482B3:
		mov	[bp+var_5], 1
		jmp	short loc_482C4

loc_482B9:
		mov	al, 1
		mov	[bp+var_6], al
		mov	cl, al
		jmp	short loc_48295

loc_482C2:
		mov	cl, 1

loc_482C4:
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jz	short loc_48297
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 36h
		jz	short loc_482DB
		cmp	byte ptr es:[bx], 3Eh
		jnz	short loc_482E1

loc_482DB:
		add	[bp+var_4], 3
		jmp	short loc_482E4

loc_482E1:
		inc	[bp+var_4]

loc_482E4:
		mov	ax, [bp+var_4]
		mov	[bp+saved_4], ax
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		cmp	[bp+var_6], 0
		jz	short loc_482FD
		mov	ax, 7Fh
		jmp	short loc_48313

loc_482FD:
		cmp	[bp+var_5], 0
		jz	short loc_4830E
		mov	eax, 7FFFFFFFh
		xor	edx, edx
		jmp	short loc_48313

loc_4830E:
		mov	ax, 7FFFh
		xor	dx, dx

loc_48313:
		pop	es
		pop	ds
		leave
		add	sp, 2
		iret
sub_48252		endp

; START OF FUNCTION CHUNK FOR sub_48252
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_48252

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4831C		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		mov	[bp+var_2], seg seg121
		mov	[bp+var_4], 2
		les	di, [bp+var_4]
sub_4831C		endp
seg121		ends
