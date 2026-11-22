ovr223		segment	para public 'OVERLAY' use16
		assume cs:ovr223
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9F10		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B9F22
		jmp	loc_B9FA4

loc_B9F22:
		mov	word ptr [si], 37F8h
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_B9F43
		push	3
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 6
		jmp	short loc_B9F43

loc_B9F43:
		mov	dword ptr [si+0Ah], 0
		push	3
		push	word ptr [si+1Eh]
		call	sub_25945
		add	sp, 4
		mov	word ptr [si+1Eh], 0
		push	word ptr [si+26h]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+26h], 0
		push	si
		push	6941h
		call	sub_26E7C
		add	sp, 4
		push	word ptr [si+10h]
		push	word ptr [si+0Eh]
		push	692Eh
		call	sub_2661B
		add	sp, 6
		push	0
		push	si
		call	sub_2D732
		add	sp, 4
		test	di, 1
		jz	short loc_B9FA4
		push	si
		call	sub_39C
		add	sp, 2

loc_B9FA4:
		pop	di
		pop	si
		pop	bp
		retf
sub_B9F10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9FA8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_4C34C, 0
		push	[bp+arg_2]
		push	si
		push	word ptr [si+10h]
		push	word ptr [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_B9FDA
		push	si
		push	6947h
		call	sub_24F92
		add	sp, 4

loc_B9FDA:
		pop	si
		pop	bp
		retf
sub_B9FA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9FDD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B9FDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9FE5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_B9FE5		endp

; START OF FUNCTION CHUNK FOR sub_B9FE5
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B9FE5
ovr223		ends
