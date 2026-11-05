seg142		segment	para public 'CODE' use16
		assume cs:seg142
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 3Bh, 66h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60273		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6028C
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_602BA

loc_6028C:
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_66650
		add	sp, 8
		mov	word ptr [si], 39A0h
		mov	word ptr [si+0Ah], 39C0h
		mov	byte ptr [si+1Fh], 0
		mov	byte ptr [si+20h], 0
		call	Keyboard_DrainBufferBIOS_701E1
		call	sub_75750

loc_602BA:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_60273		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_602BF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_602EF
		mov	word ptr [si], 39A0h
		mov	word ptr [si+0Ah], 39C0h
		push	0
		push	si
		call	Scene_Destruct_666E6
		add	sp, 4
		test	di, 1
		jz	short loc_602EF
		push	si
		call	sub_3B2
		pop	cx

loc_602EF:
		pop	di
		pop	si
		pop	bp
		retf
sub_602BF		endp

; ----------------------------------------------------------------------

sub_602F3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66729
sub_602F3		endp

; ----------------------------------------------------------------------

sub_602FF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_6674B
sub_602FF		endp

; ----------------------------------------------------------------------

sub_6030B		proc far
		mov	bx, sp
sub_6030B		endp

; START OF FUNCTION CHUNK FOR sub_6030B
		db 36h, 83h
		inc	di
; END OF FUNCTION CHUNK FOR sub_6030B
seg142		ends
