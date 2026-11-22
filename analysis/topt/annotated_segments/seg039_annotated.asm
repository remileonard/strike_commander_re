seg039		segment	para public 'CODE' use16
		assume cs:seg039
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 0EBh, 0

loc_187C3:
		db 0EBh, 0

loc_187C5:
		db 5Fh, 5Eh, 5Dh, 0CBh, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_187CD		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_187FD

loc_187DF:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_187FD
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_187FD
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_187FD:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_187DF
		pop	di
		pop	si
		leave
		retf
sub_187CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18812		proc far

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	loc_188E9

loc_18825:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_18837
		jmp	loc_188E9

loc_18837:
		mov	bx, [bp+var_4]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jnz	short loc_18847
		jmp	loc_188E9

loc_18847:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_1885F
		jmp	loc_188E9

loc_1885F:
		push	[bp+var_2]
		call	sub_48089
		add	sp, 2
		mov	ax, [si+12h]
		cmp	ax, [bp+var_4]
		jnz	short loc_188E9
		cmp	word ptr [si+0Fh], 0
		jz	short loc_188CD
		mov	bx, [si+0Fh]
		cmp	byte ptr [bx+4], 7
		jz	short loc_188CD
		mov	bx, [si+0Fh]
		cmp	byte ptr [bx+4], 0Bh
		jz	short loc_188CD
		push	word ptr [si+0Fh]
		call	sub_48084
		add	sp, 2
		mov	bx, [si+0Fh]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_188CD
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		add	sp, 2
		or	al, al
		jz	short loc_188CD
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[si+11h], al
		mov	[si+12h], di
		mov	word ptr [si+0Fh], 0
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		add	sp, 2
		jmp	short loc_188E9

loc_188CD:
		push	4
		push	si
		call	sub_480ED
		add	sp, 4
		or	al, al
		jz	short loc_188E3
		mov	word ptr [si+0Fh], 0
		jmp	short loc_188E9

loc_188E3:
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_188E9:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_188FD
		jmp	loc_18825

loc_188FD:
		mov	al, byte_4C376
		mov	ah, 0
		or	ax, ax
		jnz	short loc_18921
		mov	al, byte_4EF07
		mov	ah, 0
		cmp	ax, word_4A515
		jz	short loc_18918
		mov	al, byte_4EF07
		mov	ah, 0
		jmp	short loc_1891A

loc_18918:
		xor	ax, ax

loc_1891A:
		mov	[bp+var_5], al
		mov	al, 0
		jmp	short loc_18921

loc_18921:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_18812		endp

; START OF FUNCTION CHUNK FOR sub_18812
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_18812

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1892B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1892B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18933		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_18933		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1893B		proc far
		push	bp
		mov	bp, sp
		push	6798h
		call	sub_2A4FF
		add	sp, 2
		mov	word_4F1A8, 0
		mov	word_4F1AA, 0
		mov	byte_4F1B5, 0
		pop	bp
		retf
sub_1893B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1895C		proc far
		push	bp
		mov	bp, sp
sub_1895C		endp

; START OF FUNCTION CHUNK FOR sub_1895C
		db 68h
; END OF FUNCTION CHUNK FOR sub_1895C
seg039		ends
