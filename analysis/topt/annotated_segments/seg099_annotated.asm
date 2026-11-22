seg099		segment	para public 'CODE' use16
		assume cs:seg099
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0FCh, 90h, 90h, 0E9h, 92h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3250E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3250E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32513		proc far

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
		jnz	short loc_32567
		cmp	[bp+arg_8], 0
		jz	short loc_32567
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_32567
		push	cs
		call	near ptr sub_3250E
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_32567:
		cmp	[bp+var_4], 0
		jnz	short loc_325AB
		cmp	[bp+arg_8], 0
		jz	short loc_325A5
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
		call	sub_326F9
		add	sp, 0Ch
		push	46F6h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_30078
		add	sp, 4
		jmp	short loc_325AB

loc_325A5:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_325B1

loc_325AB:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_325B1:
		pop	si
		leave
		retf
sub_32513		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_325B4		proc far

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
		jnz	short loc_32608
		cmp	[bp+arg_8], 0
		jz	short loc_32608
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_32608
		push	cs
		call	near ptr sub_3250E
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_32608:
		cmp	[bp+var_4], 0
		jnz	short loc_3264C
		cmp	[bp+arg_8], 0
		jz	short loc_32646
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
		call	sub_326F9
		add	sp, 0Ch
		push	[bp+arg_A]
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4
		jmp	short loc_3264C

loc_32646:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_32652

loc_3264C:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_32652:
		pop	si
		leave
		retf
sub_325B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32655		proc far

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
		jnz	short loc_326A9
		cmp	[bp+arg_8], 0
		jz	short loc_326A9
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_326A9
		push	cs
		call	near ptr sub_3250E
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_326A9:
		cmp	[bp+var_4], 0
		jnz	short loc_326F0
		cmp	[bp+arg_8], 0
		jz	short loc_326EA
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
		call	sub_326F9
		add	sp, 0Ch
		push	[bp+arg_A]
		push	46F8h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_30078
		add	sp, 6
		jmp	short loc_326F0

loc_326EA:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_326F6

loc_326F0:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_326F6:
		pop	si
		leave
		retf
sub_32655		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_326F9		proc near

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
		jnz	short loc_3272F
		push	46FDh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	470Dh
		jmp	short loc_32771

loc_3272F:
		cmp	[bp+arg_4], 2
		jnz	short loc_32751
		push	472Ch
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	473Ch
		jmp	short loc_32771

loc_32751:
		cmp	[bp+arg_4], 3
		jnz	short loc_3278E
		push	475Ah
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	476Ah

loc_32771:
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F73C
		add	sp, 6
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4

loc_3278E:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	4788h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F73C
		add	sp, 0Ch
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
sub_326F9		endp
seg099		ends
