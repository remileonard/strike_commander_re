seg100		segment	para public 'CODE' use16
		assume cs:seg100
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 3, 0E9h, 5Ch, 0FFh

loc_442F5:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_442F8		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_6]
		xor	ax, ax
		test	dl, 4
		jz	short loc_4430D
		mov	ax, 1
		jmp	short loc_44315

loc_4430D:
		test	dl, 8
		jz	short loc_44315
		mov	ax, 0FFFFh

loc_44315:
		push	ax
		push	0
		push	large [bp+arg_2]
		call	sub_45349
		add	sp, 8
		pop	bp
		retf
sub_442F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44326		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_44346
		push	word ptr [si+2]
		call	sub_4548E
		pop	cx
		mov	dword ptr [si], 0

loc_44346:
		pop	si
		pop	bp
		retf
sub_44326		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44349		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		call	sub_4375D
		add	sp, 0Ch
		pop	bp
		retf
sub_44349		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44365		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_45944
		pop	bp
		retf
sub_44365		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44372		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_45778
		mov	ax, 2
		pop	bp
		retf
sub_44372		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44382		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_5DA52
		pop	bp
		retf
sub_44382		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4438D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4438D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44395		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_443AE
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4440B

loc_443AE:
		mov	word ptr [si], 96Dh
		mov	ax, word_5DD68
		mov	[si+2], ax
		mov	word_5DD68, si
		mov	word ptr [si+4], 1B0h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg017
		mov	word ptr [si+6], 38h
		mov	word ptr [si], 3D01h
		mov	word ptr [si+4], 3D29h
		mov	word ptr [si], 3D5Ch
		mov	word ptr [si+4], 3D84h
		cmp	byte_5DA52, 0
		jz	short loc_44401
		push	3D33h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_59C00
		add	sp, 4
		jmp	short loc_44406

loc_44401:
		call	sub_458D2

loc_44406:
		mov	byte_5DA52, 1

loc_4440B:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_44395		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44410		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4444C
		mov	word ptr [si], 3D5Ch
		mov	word ptr [si+4], 3D84h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B75
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_4444C
		push	si
		call	sub_33B
		pop	cx

loc_4444C:
		pop	di
		pop	si
		pop	bp
		retf
sub_44410		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44450		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_44450		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4445E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_4445E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44468		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 2
sub_44468		endp
seg100		ends
