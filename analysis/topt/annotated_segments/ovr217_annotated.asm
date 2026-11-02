ovr217		segment	para public 'OVERLAY' use16
		assume cs:ovr217
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B6A00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A08		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B6A08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A10		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B6A10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A18		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		mov	ax, [si+39h]
		or	ax, ax
		jz	short loc_B6A37
		cmp	ax, 1
		jz	short loc_B6A48
		cmp	ax, 2
		jz	short loc_B6A9D
		jmp	short loc_B6AAC

loc_B6A37:
		cmp	dx, 30h
		jl	short loc_B6A46
		cmp	dx, 39h
		jg	short loc_B6A46
		mov	cx, 1
		jmp	short loc_B6A48

loc_B6A46:
		jmp	short loc_B6AAC

loc_B6A48:
		cmp	dx, 30h
		jl	short loc_B6A57
		cmp	dx, 39h
		jg	short loc_B6A57
		mov	cx, 1
		jmp	short loc_B6A9B

loc_B6A57:
		cmp	dx, 41h
		jl	short loc_B6A66
		cmp	dx, 5Ah
		jg	short loc_B6A66
		mov	cx, 1
		jmp	short loc_B6A9B

loc_B6A66:
		cmp	dx, 61h
		jl	short loc_B6A75
		cmp	dx, 7Ah
		jg	short loc_B6A75
		mov	cx, 1
		jmp	short loc_B6A9B

loc_B6A75:
		cmp	dx, 2Eh
		jz	short loc_B6A98
		cmp	dx, 2Dh
		jz	short loc_B6A98
		cmp	dx, 3Ah
		jz	short loc_B6A98
		cmp	dx, 5Ch
		jz	short loc_B6A98
		cmp	dx, 2Ah
		jz	short loc_B6A98
		cmp	dx, 24h
		jz	short loc_B6A98
		cmp	dx, 5Fh
		jnz	short loc_B6A9B

loc_B6A98:
		mov	cx, 1

loc_B6A9B:
		jmp	short loc_B6AAC

loc_B6A9D:
		cmp	dx, 20h
		jl	short loc_B6AAA
		cmp	dx, 7Fh
		jge	short loc_B6AAA
		mov	cx, 1

loc_B6AAA:
		jmp	short loc_B6AAC

loc_B6AAC:
		mov	ax, cx
		pop	si
		pop	bp
		retf
sub_B6A18		endp

; START OF FUNCTION CHUNK FOR sub_B6A18
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B6A18

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6AB4		proc far

var_4C		= word ptr -4Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+33h], 0
		jz	short loc_B6ACB
		mov	byte ptr [si+30h], 5Fh
		jmp	short loc_B6ACF

loc_B6ACB:
		mov	byte ptr [si+30h], 23h

loc_B6ACF:
		push	si
		call	sub_14D4C
		add	sp, 2
		lea	ax, [bp+var_4C]
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		cmp	word ptr [si+2Eh], 0FFFFh
		jz	short loc_B6B48
		push	word ptr [si+1Eh]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [si+2Eh]
		cmp	ax, [bp+var_4]
		jle	short loc_B6B0F
		mov	ax, [bp+var_4]
		mov	[si+2Eh], ax

loc_B6B0F:
		push	word ptr [si+2Eh]
		push	word ptr [si+1Eh]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	al, [si+30h]
		mov	bx, [si+2Eh]
		mov	[bx+di], al
		mov	bx, [si+2Eh]
		add	bx, di
		mov	byte ptr [bx+1], 0
		mov	ax, [bp+var_4]
		sub	ax, [si+2Eh]
		push	ax
		mov	ax, [si+1Eh]
		add	ax, [si+2Eh]
		push	ax
		push	di
		call	sub_2CC5
		add	sp, 6
		jmp	short loc_B6B8B

loc_B6B48:
		cmp	word ptr [si+22h], 0
		jz	short loc_B6B63
		mov	bx, [si+22h]
		push	word ptr [bx]
		push	3310h
		push	word ptr [si+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_B6B7F

loc_B6B63:
		cmp	word ptr [si+24h], 0
		jz	short loc_B6B7F
		mov	bx, [si+24h]
		push	large [bx]
		push	3313h
		push	word ptr [si+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_B6B7F

loc_B6B7F:
		push	word ptr [si+1Eh]
		push	di
		call	CRT_Strcpy
		add	sp, 4

loc_B6B8B:
		mov	word ptr [si+31h], 0
		push	di
		call	sub_15E48
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jg	short loc_B6BA7
		jmp	loc_B6C76

loc_B6BA7:
		cmp	word ptr [si+2Eh], 0FFFFh
		jnz	short loc_B6BE9
		push	di
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_6], ax
		jmp	short loc_B6BD8

loc_B6BBC:
		mov	bx, [bp+var_6]
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		mov	al, [bx+6676h]
		cbw
		add	ax, 2
		sub	[bp+var_4], ax
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+di], 0
		dec	[bp+var_6]

loc_B6BD8:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jle	short loc_B6BE6
		cmp	[bp+var_6], 0
		jge	short loc_B6BBC

loc_B6BE6:
		jmp	loc_B6C76

loc_B6BE9:
		mov	bx, [si+2Eh]
		add	bx, di
		mov	al, [bx+1]
		cbw
		mov	[bp+var_6], ax
		mov	bx, [si+2Eh]
		add	bx, di
		mov	byte ptr [bx+1], 0
		push	di
		call	sub_15E48
		add	sp, 2
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_2]
		jle	short loc_B6C35

loc_B6C12:
		inc	word ptr [si+31h]
		mov	ax, [si+31h]
		mov	dx, di
		add	dx, ax
		push	dx
		call	sub_15E48
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jg	short loc_B6C12
		add	di, [si+31h]
		jmp	short loc_B6C76

loc_B6C35:
		mov	ax, [si+2Eh]
		inc	ax
		mov	[bp+var_C], ax

loc_B6C3C:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		inc	[bp+var_C]
		mov	bx, [bp+var_A]
		mov	al, byte ptr [bp+var_6]
		mov	[bx+di], al
		mov	bx, [bp+var_C]
		mov	al, [bx+di]
		cbw
		mov	[bp+var_6], ax
		mov	bx, [bp+var_C]
		mov	byte ptr [bx+di], 0
		push	di
		call	sub_15E48
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_B6C3C
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+di], 0

loc_B6C76:
		push	si
		call	sub_143DD
		add	sp, 2
		push	word_4BD04
		push	0FFFFh
		push	di
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+6]
		push	ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+4]
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_B6AB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6CAF		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+31h]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+4]
		add	dx, ax
		inc	dx
		mov	di, dx
		add	[bp+arg_2], 2

loc_B6CD3:
		mov	bx, [si+1Eh]
		inc	[bp+var_2]
		mov	ax, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cbw
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_B6CEC
		jmp	short loc_B6D1B

loc_B6CEC:
		mov	ax, [si+2Eh]
		cmp	ax, [bp+var_2]
		jnz	short loc_B6D05
		mov	al, [si+30h]
		push	ax
		call	PaletteScreen_LookupByteTable_15E87
		add	sp, 2
		add	ax, 2
		add	di, ax

loc_B6D05:
		mov	al, byte ptr [bp+var_4]
		push	ax
		call	PaletteScreen_LookupByteTable_15E87
		add	sp, 2
		add	ax, 2
		add	di, ax
		cmp	di, [bp+arg_2]
		jl	short loc_B6CD3

loc_B6D1B:
		mov	ax, [bp+var_2]
		mov	[si+2Eh], ax
		mov	ax, [si+2Eh]
		cmp	ax, [si+20h]
		jle	short loc_B6D2F
		mov	ax, [si+20h]
		mov	[si+2Eh], ax

loc_B6D2F:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_B6CAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6D3D		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_B6D52
		pop	di
		pop	si
		leave
		retf

loc_B6D52:
		push	di
		call	sub_143FC
		add	sp, 2
		mov	word ptr [di+37h], 0
		mov	ax, [di+4]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [di+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr sub_B6CAF
		add	sp, 4
		mov	[bp+arg_6], 0
		mov	[bp+var_6], 0

loc_B6D87:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_B6DBC
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B6DBA
		push	6671h
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_B6DBA

loc_B6DBA:
		jmp	short loc_B6DBC

loc_B6DBC:
		mov	al, byte_4F04A
		mov	ah, 0
		or	ax, ax
		jz	short loc_B6E2F
		mov	ax, word_4F04C
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	ax, word_4F04E
		mov	[bp+var_4], ax
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_B6DE2
		mov	[bp+arg_6], 1

loc_B6DE2:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_B6E1B
		mov	[bp+arg_6], 0
		mov	ax, [di+4]
		cmp	ax, [bp+var_2]
		jg	short loc_B6E11
		mov	ax, [di+6]
		cmp	ax, [bp+var_4]
		jg	short loc_B6E11
		mov	ax, [di+8]
		cmp	ax, [bp+var_2]
		jl	short loc_B6E11
		mov	ax, [di+0Ah]
		cmp	ax, [bp+var_4]
		jge	short loc_B6E1B

loc_B6E11:
		mov	word ptr [di+37h], 1
		mov	[bp+var_6], 0FFFFh

loc_B6E1B:
		cmp	[bp+arg_6], 0
		jz	short loc_B6E2C
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr sub_B6CAF
		add	sp, 4

loc_B6E2C:
		jmp	loc_B70A1

loc_B6E2F:
		mov	al, byte_4F051
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_B6E3C
		jmp	loc_B70A1

loc_B6E3C:
		mov	ax, 0C00h
		int	21h
		mov	al, byte_4F052
		mov	ah, 0
		mov	[bp+arg_8], ax
		mov	[bp+var_A], 0
		push	word ptr [di+1Eh]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_C], ax
		mov	bx, [bp+arg_8]
		cmp	bx, 4Fh
		jnz	short loc_B6E67
		jmp	loc_B6FA9

loc_B6E67:
		jg	short loc_B6EAD
		cmp	bx, 3Ah
		jz	short loc_B6EC2
		jg	short loc_B6E9B
		cmp	bx, 1Dh
		jz	short loc_B6EC2
		jg	short loc_B6E89
		cmp	bx, 1
		jz	short loc_B6EC5
		cmp	bx, 0Eh
		jz	short loc_B6EFB
		cmp	bx, 1Ch
		jz	short loc_B6EF3
		jmp	loc_B6FCB

loc_B6E89:
		cmp	bx, 2Ah
		jz	short loc_B6EC2
		cmp	bx, 36h
		jz	short loc_B6EC2
		cmp	bx, 38h
		jz	short loc_B6EC2
		jmp	loc_B6FCB

loc_B6E9B:
		sub	bx, 42h
		cmp	bx, 0Bh
		jbe	short loc_B6EA6
		jmp	loc_B6FCB

loc_B6EA6:
		shl	bx, 1
		jmp	cs:off_B71FE[bx]	; switch jump

loc_B6EAD:
		sub	bx, 50h
		cmp	bx, 2Ah
		jbe	short loc_B6EB8
		jmp	loc_B6FCB

loc_B6EB8:
		shl	bx, 1
		jmp	cs:off_B71A8[bx]	; switch jump

loc_B6EBF:
		jmp	loc_B6FD2

loc_B6EC2:
		jmp	loc_B6FD2

loc_B6EC5:
		mov	bx, [di+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_B6EE6
		mov	bx, [di+1Eh]
		xor	ax, ax
		mov	[di+2Eh], ax
		add	bx, ax
		mov	byte ptr [bx], 0
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B6EF0

loc_B6EE6:
		mov	word ptr [di+37h], 1
		mov	[bp+var_6], 1

loc_B6EF0:
		jmp	loc_B6FD2

loc_B6EF3:
		mov	word ptr [di+37h], 1
		jmp	loc_B6FD2

loc_B6EFB:
		cmp	word ptr [di+2Eh], 0
		jle	short loc_B6F32
		mov	si, [di+2Eh]
		jmp	short loc_B6F14

loc_B6F06:
		mov	bx, [di+1Eh]
		add	bx, si
		mov	al, [bx]
		mov	bx, [di+1Eh]
		mov	[bx+si-1], al
		inc	si

loc_B6F14:
		cmp	si, [bp+var_C]
		jl	short loc_B6F06
		dec	[bp+var_C]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_C]
		mov	byte ptr [bx], 0
		dec	word ptr [di+2Eh]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_B6F32:
		jmp	loc_B6FD2

loc_B6F35:
		cmp	[bp+var_C], 0
		jle	short loc_B6F69
		mov	si, [di+2Eh]
		jmp	short loc_B6F4E

loc_B6F40:
		mov	bx, [di+1Eh]
		mov	al, [bx+si+1]
		mov	bx, [di+1Eh]
		add	bx, si
		mov	[bx], al
		inc	si

loc_B6F4E:
		cmp	si, [bp+var_C]
		jl	short loc_B6F40
		dec	[bp+var_C]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_C]
		mov	byte ptr [bx], 0
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_B6F69:
		jmp	short loc_B6FD2

loc_B6F6B:
		cmp	word ptr [di+2Eh], 0
		jle	short loc_B6F74
		dec	word ptr [di+2Eh]

loc_B6F74:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B6FD2

loc_B6F80:
		mov	ax, [di+20h]
		dec	ax
		cmp	[di+2Eh], ax
		jge	short loc_B6F8C
		inc	word ptr [di+2Eh]

loc_B6F8C:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B6FD2

loc_B6F98:
		mov	word ptr [di+2Eh], 0
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B6FD2

loc_B6FA9:
		mov	ax, [bp+var_C]
		mov	[di+2Eh], ax
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B6FD2

loc_B6FBB:
		xor	word ptr [di+33h], 1
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B6FD2

loc_B6FCB:
		mov	[bp+var_A], 1
		jmp	short loc_B6FD2

loc_B6FD2:
		cmp	[bp+var_A], 0
		jnz	short loc_B6FDB
		jmp	loc_B70A1

loc_B6FDB:
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		cmp	byte_4F053, 0
		jz	short loc_B6FED
		add	[bp+var_E], 100h

loc_B6FED:
		mov	bx, [bp+var_E]
		mov	al, [bx+5468h]
		cbw
		mov	[bp+var_10], ax
		cmp	word ptr [di+35h], 0
		jz	short loc_B700E
		cmp	[bp+var_10], 61h
		jl	short loc_B700E
		cmp	[bp+var_10], 7Ah
		jg	short loc_B700E
		sub	[bp+var_10], 20h

loc_B700E:
		push	[bp+var_10]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7022
		jmp	loc_B70A1

loc_B7022:
		cmp	word ptr [di+33h], 0
		jz	short loc_B706D
		mov	ax, [di+20h]
		dec	ax
		cmp	[di+2Eh], ax
		jl	short loc_B703A
		mov	ax, [di+20h]
		dec	ax
		mov	[di+2Eh], ax
		jmp	short loc_B706B

loc_B703A:
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		mov	dx, ax
		jmp	short loc_B7056

loc_B7044:
		mov	ax, dx
		add	ax, [di+1Eh]
		mov	bx, ax
		mov	al, [bx-1]
		mov	bx, [di+1Eh]
		add	bx, dx
		mov	[bx], al
		dec	dx

loc_B7056:
		cmp	[di+2Eh], dx
		jl	short loc_B7044
		mov	ax, [di+2Eh]
		inc	word ptr [di+2Eh]
		mov	bx, [di+1Eh]
		add	bx, ax
		mov	al, byte ptr [bp+var_10]
		mov	[bx], al

loc_B706B:
		jmp	short loc_B7097

loc_B706D:
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		cmp	[di+2Eh], ax
		jl	short loc_B7081
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		mov	[di+2Eh], ax

loc_B7081:
		cmp	word ptr [di+2Eh], 0
		jl	short loc_B7094
		mov	ax, [di+1Eh]
		add	ax, [di+2Eh]
		mov	dl, byte ptr [bp+var_10]
		mov	bx, ax
		mov	[bx], dl

loc_B7094:
		inc	word ptr [di+2Eh]

loc_B7097:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_B70A1:
		cmp	word ptr [di+37h], 0
		jnz	short loc_B70AA
		jmp	loc_B6D87

loc_B70AA:
		push	di
		call	sub_143DD
		add	sp, 2
		mov	word ptr [di+2Eh], 0FFFFh
		cmp	word ptr [di+22h], 0
		jnz	short loc_B70C7
		cmp	word ptr [di+24h], 0
		jnz	short loc_B70C7
		jmp	loc_B714F

loc_B70C7:
		cmp	[bp+var_6], 1
		jnz	short loc_B7106
		cmp	word ptr [di+22h], 0
		jz	short loc_B70E8
		mov	bx, [di+22h]
		push	word ptr [bx]
		push	3317h
		push	word ptr [di+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_B7104

loc_B70E8:
		cmp	word ptr [di+24h], 0
		jz	short loc_B7104
		mov	bx, [di+24h]
		push	large [bx]
		push	331Ah
		push	word ptr [di+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_B7104

loc_B7104:
		jmp	short loc_B714F

loc_B7106:
		cmp	word ptr [di+22h], 0
		jz	short loc_B7124
		mov	ax, [di+1Eh]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		call	sub_2193
		add	sp, 2
		mov	bx, [di+22h]
		mov	[bx], ax
		jmp	short loc_B7146

loc_B7124:
		cmp	word ptr [di+24h], 0
		jz	short loc_B7146
		push	word ptr [di+1Eh]
		call	sub_2193
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	bx, [di+24h]
		mov	[bx], eax
		jmp	short loc_B7146

loc_B7146:
		push	di
		nop
		push	cs
		call	near ptr sub_B7295
		add	sp, 2

loc_B714F:
		cmp	[bp+var_6], 0
		jnz	short loc_B7191
		cmp	word ptr [di+22h], 0
		jz	short loc_B716C
		mov	bx, [di+22h]
		push	word ptr [bx]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+3Ch]
		add	sp, 4
		jmp	short loc_B7191

loc_B716C:
		cmp	word ptr [di+24h], 0
		jz	short loc_B7184
		mov	bx, [di+24h]
		push	large [bx]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short loc_B7191

loc_B7184:
		push	word ptr [di+1Eh]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 4

loc_B7191:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	di
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_B6D3D		endp

; START OF FUNCTION CHUNK FOR sub_B6D3D
off_B71A8	dw offset loc_B6F80
		dw offset loc_B6FCB
		dw offset loc_B6FBB
		dw offset loc_B6F35
		dw offset loc_B6FCB
		dw offset loc_B6EC2
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6EC2
		dw offset loc_B6F98
		dw offset loc_B6F6B
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6F6B
		dw offset loc_B6FCB
		dw offset loc_B6F80
		dw offset loc_B6FCB
		dw offset loc_B6FA9
		dw offset loc_B6F80
		dw offset loc_B6FCB
		dw offset loc_B6FBB
		dw offset loc_B6F35
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6EC2
off_B71FE	dw offset loc_B6EBF
		dw offset loc_B6EBF
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6F98
		dw offset loc_B6F6B
		dw offset loc_B6FCB
		dw offset loc_B6FCB
		dw offset loc_B6F6B
		dw offset loc_B6FCB
		dw offset loc_B6F80
; END OF FUNCTION CHUNK FOR sub_B6D3D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7216		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+22h], 0
		jz	short loc_B724D
		mov	word ptr [bp+var_4], di
		push	word ptr [bp+var_4]
		call	sub_2193
		add	sp, 2
		mov	word ptr [bp+var_4+2], ax
		movsx	eax, word ptr [bp+var_4+2]
		push	eax
		push	si
		nop
		push	cs
		call	near ptr sub_B7307
		add	sp, 6
		jmp	short loc_B7291

loc_B724D:
		cmp	word ptr [si+24h], 0
		jz	short loc_B7278
		push	di
		call	sub_2193
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B7307
		add	sp, 6
		jmp	short loc_B7291

loc_B7278:
		push	word ptr [si+20h]
		push	di
		push	word ptr [si+1Eh]
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_B7291:
		pop	di
		pop	si
		leave
		retf
sub_B7216		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7295		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0
		jz	short loc_B72D0
		mov	bx, [si+22h]
		movsx	eax, word ptr [bx]
		cmp	eax, [si+26h]
		jge	short loc_B72B9
		mov	ax, [si+26h]
		mov	bx, [si+22h]
		mov	[bx], ax
		jmp	short loc_B72CE

loc_B72B9:
		mov	bx, [si+22h]
		movsx	eax, word ptr [bx]
		cmp	eax, [si+2Ah]
		jle	short loc_B72CE
		mov	ax, [si+2Ah]
		mov	bx, [si+22h]
		mov	[bx], ax

loc_B72CE:
		jmp	short loc_B7304

loc_B72D0:
		cmp	word ptr [si+24h], 0
		jz	short loc_B7304
		mov	bx, [si+24h]
		mov	eax, [bx]
		cmp	eax, [si+26h]
		jge	short loc_B72EE
		mov	eax, [si+26h]
		mov	bx, [si+24h]
		mov	[bx], eax
		jmp	short loc_B7304

loc_B72EE:
		mov	bx, [si+24h]
		mov	eax, [bx]
		cmp	eax, [si+2Ah]
		jle	short loc_B7304
		mov	eax, [si+2Ah]
		mov	bx, [si+24h]
		mov	[bx], eax

loc_B7304:
		pop	si
		pop	bp
		retf
sub_B7295		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7307		proc far

var_10		= word ptr -10h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0
		jz	short loc_B7333
		mov	bx, [si+22h]
		mov	ax, word ptr [bp+arg_2]
		mov	[bx], ax
		push	si
		push	cs
		call	near ptr sub_B7295
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B7376

loc_B7333:
		cmp	word ptr [si+24h], 0
		jz	short loc_B7357
		mov	bx, [si+24h]
		mov	eax, [bp+arg_2]
		mov	[bx], eax
		push	si
		push	cs
		call	near ptr sub_B7295
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_B7376

loc_B7357:
		push	large [bp+arg_2]
		push	331Eh
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_10]
		push	ax
		push	si
		push	cs
		call	near ptr sub_B7216
		add	sp, 4

loc_B7376:
		pop	si
		leave
		retf
sub_B7307		endp
ovr217		ends
