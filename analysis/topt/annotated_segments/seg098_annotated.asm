seg098		segment	para public 'CODE' use16
		assume cs:seg098
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 3, 0E9h, 5Ch, 0FFh

loc_32385:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32388		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_6]
		xor	ax, ax
		test	dl, 4
		jz	short loc_3239D
		mov	ax, 1
		jmp	short loc_323A5

loc_3239D:
		test	dl, 8
		jz	short loc_323A5
		mov	ax, 0FFFFh

loc_323A5:
		push	ax
		push	0
		push	large [bp+arg_2]
		call	sub_333D9
		add	sp, 8
		pop	bp
		retf
sub_32388		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_323B6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_323D6
		push	word ptr [si+2]
		call	sub_3351E
		pop	cx
		mov	dword ptr [si], 0

loc_323D6:
		pop	si
		pop	bp
		retf
sub_323B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_323D9		proc far

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
		call	sub_31785
		add	sp, 0Ch
		pop	bp
		retf
sub_323D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_323F5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_339D4
		pop	bp
		retf
sub_323F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32402		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_33808
		mov	ax, 2
		pop	bp
		retf
sub_32402		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32412		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_4D07C
		pop	bp
		retf
sub_32412		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3241D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3241D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32425		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3243E
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3249B

loc_3243E:
		mov	word ptr [si], 1B4h
		mov	ax, word_4D392
		mov	[si+2], ax
		mov	word_4D392, si
		mov	word ptr [si+4], 4511h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg123
		mov	word ptr [si+6], 7
		mov	word ptr [si], 466Bh
		mov	word ptr [si+4], 4693h
		mov	word ptr [si], 46C6h
		mov	word ptr [si+4], 46EEh
		cmp	byte_4D07C, 0
		jz	short loc_32491
		push	469Dh
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_30078
		add	sp, 4
		jmp	short loc_32496

loc_32491:
		call	sub_33962

loc_32496:
		mov	byte_4D07C, 1

loc_3249B:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_32425		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324A0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_324DC
		mov	word ptr [si], 46C6h
		mov	word ptr [si+4], 46EEh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_324DC
		push	si
		call	sub_39C
		pop	cx

loc_324DC:
		pop	di
		pop	si
		pop	bp
		retf
sub_324A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324E0		proc far

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
sub_324E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_324EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324F8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 2
sub_324F8		endp
seg098		ends
