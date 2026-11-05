ovr194		segment	para public 'OVERLAY' use16
		assume cs:ovr194
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E8C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_6E8C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E8C8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_6E8C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E8D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_6E8D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E8D8		proc far

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
		jz	short loc_6E8F7
		cmp	ax, 1
		jz	short loc_6E904
		cmp	ax, 2
		jz	short loc_6E94C
		jmp	short loc_6E956

loc_6E8F7:
		cmp	dx, 30h
		jl	short loc_6E956
		cmp	dx, 39h
		jg	short loc_6E956
		mov	cx, 1

loc_6E904:
		cmp	dx, 30h
		jl	short loc_6E913
		cmp	dx, 39h
		jg	short loc_6E913

loc_6E90E:
		mov	cx, 1
		jmp	short loc_6E956

loc_6E913:
		cmp	dx, 41h
		jl	short loc_6E91D
		cmp	dx, 5Ah
		jle	short loc_6E90E

loc_6E91D:
		cmp	dx, 61h
		jl	short loc_6E927
		cmp	dx, 7Ah
		jle	short loc_6E90E

loc_6E927:
		cmp	dx, 2Eh
		jz	short loc_6E90E
		cmp	dx, 2Dh
		jz	short loc_6E90E
		cmp	dx, 3Ah
		jz	short loc_6E90E
		cmp	dx, 5Ch
		jz	short loc_6E90E
		cmp	dx, 2Ah
		jz	short loc_6E90E
		cmp	dx, 24h
		jz	short loc_6E90E
		cmp	dx, 5Fh
		jnz	short loc_6E956
		jmp	short loc_6E90E

loc_6E94C:
		cmp	dx, 20h
		jl	short loc_6E956
		cmp	dx, 7Fh
		jl	short loc_6E90E

loc_6E956:
		mov	ax, cx
		pop	si
		pop	bp
		retf
sub_6E8D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E95B		proc far

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
		jz	short loc_6E972
		mov	byte ptr [si+30h], 5Fh
		jmp	short loc_6E976

loc_6E972:
		mov	byte ptr [si+30h], 23h

loc_6E976:
		push	si
		call	PaletteScreen_DrawWidgetBorderA_22259
		pop	cx
		lea	di, [bp+var_4C]
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		cmp	word ptr [si+2Eh], 0FFFFh
		jz	short loc_6E9E6
		push	word ptr [si+1Eh]
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [si+2Eh]
		cmp	ax, [bp+var_4]
		jle	short loc_6E9B0
		mov	ax, [bp+var_4]
		mov	[si+2Eh], ax

loc_6E9B0:
		push	word ptr [si+2Eh]
		push	word ptr [si+1Eh]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	al, [si+30h]
		mov	bx, [si+2Eh]
		mov	[bx+di], al
		add	bx, di
		mov	byte ptr [bx+1], 0
		mov	ax, [bp+var_4]
		sub	ax, [si+2Eh]
		push	ax
		mov	ax, [si+1Eh]
		add	ax, [si+2Eh]
		push	ax
		push	di
		call	sub_2D7D
		add	sp, 6
		jmp	short loc_6EA29

loc_6E9E6:
		cmp	word ptr [si+22h], 0
		jz	short loc_6EA01
		mov	bx, [si+22h]
		push	word ptr [bx]
		push	2240h
		push	word ptr [si+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_6EA1D

loc_6EA01:
		cmp	word ptr [si+24h], 0
		jz	short loc_6EA1D
		mov	bx, [si+24h]
		push	large [bx]
		push	2243h
		push	word ptr [si+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_6EA1D

loc_6EA1D:
		push	word ptr [si+1Eh]
		push	di
		call	CRT_Strcpy
		add	sp, 4

loc_6EA29:
		mov	word ptr [si+31h], 0
		push	di
		call	sub_23243
		pop	cx
		mov	[bp+var_4], ax
		cmp	ax, [bp+var_2]
		jg	short loc_6EA40
		jmp	loc_6EAF6

loc_6EA40:
		cmp	word ptr [si+2Eh], 0FFFFh
		jnz	short loc_6EA7B
		push	di
		call	CRT_Strlen
		pop	cx
		dec	ax
		mov	dx, ax
		jmp	short loc_6EA6A

loc_6EA52:
		mov	bx, dx
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		mov	al, [bx+6132h]
		cbw
		add	ax, 2
		sub	[bp+var_4], ax
		mov	bx, dx
		mov	byte ptr [bx+di], 0
		dec	dx

loc_6EA6A:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jg	short loc_6EA75
		jmp	loc_6EAF6

loc_6EA75:
		or	dx, dx
		jge	short loc_6EA52
		jmp	short loc_6EAF6

loc_6EA7B:
		mov	bx, [si+2Eh]
		add	bx, di
		mov	al, [bx+1]
		cbw
		mov	[bp+var_6], ax
		mov	bx, [si+2Eh]
		add	bx, di
		mov	byte ptr [bx+1], 0
		push	di
		call	sub_23243
		pop	cx
		mov	[bp+var_8], ax
		cmp	ax, [bp+var_2]
		jle	short loc_6EABD

loc_6EA9F:
		inc	word ptr [si+31h]
		mov	ax, [si+31h]
		mov	dx, di
		add	dx, ax
		push	dx
		call	sub_23243
		pop	cx
		mov	[bp+var_4], ax
		cmp	ax, [bp+var_2]
		jg	short loc_6EA9F
		add	di, [si+31h]
		jmp	short loc_6EAF6

loc_6EABD:
		mov	ax, [si+2Eh]
		inc	ax
		mov	[bp+var_C], ax

loc_6EAC4:
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
		mov	byte ptr [bx+di], 0
		push	di
		call	sub_23243
		pop	cx
		mov	[bp+var_4], ax
		cmp	ax, [bp+var_2]
		jl	short loc_6EAC4
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+di], 0

loc_6EAF6:
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word_5BF74
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
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_6E95B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EB2B		proc far

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
		mov	di, [si+4]
		add	di, ax
		inc	di
		add	[bp+arg_2], 2

loc_6EB4D:
		mov	bx, [si+1Eh]
		inc	[bp+var_2]
		mov	ax, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cbw
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_6EB8F
		mov	ax, [si+2Eh]
		cmp	ax, [bp+var_2]
		jnz	short loc_6EB7B
		mov	al, [si+30h]
		push	ax
		call	PaletteScreen_LookupByteTable_23279
		pop	cx
		add	ax, 2
		add	di, ax

loc_6EB7B:
		mov	al, byte ptr [bp+var_4]
		push	ax
		call	PaletteScreen_LookupByteTable_23279
		pop	cx
		add	ax, 2
		add	di, ax
		cmp	di, [bp+arg_2]
		jl	short loc_6EB4D

loc_6EB8F:
		mov	ax, [bp+var_2]
		mov	[si+2Eh], ax
		mov	ax, [si+2Eh]
		cmp	ax, [si+20h]
		jle	short loc_6EBA3
		mov	ax, [si+20h]
		mov	[si+2Eh], ax

loc_6EBA3:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_6EB2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EBAF		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
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
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_6EBC3
		jmp	loc_6EF89

loc_6EBC3:
		push	di
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
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
		call	near ptr sub_6EB2B
		add	sp, 4
		mov	[bp+arg_6], 0
		mov	[bp+var_6], 0

loc_6EBF6:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_6EC25
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6EC25
		push	612Dh
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_6EC25

loc_6EC25:
		mov	al, byte_5FE46
		mov	ah, 0
		or	ax, ax
		jz	short loc_6EC9B
		mov	ax, word_5FE48
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	ax, word_5FE4A
		mov	[bp+var_4], ax
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_6EC4B
		mov	[bp+arg_6], 1

loc_6EC4B:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_6EC84
		mov	[bp+arg_6], 0
		mov	ax, [di+4]
		cmp	ax, [bp+var_2]
		jg	short loc_6EC7A
		mov	ax, [di+6]
		cmp	ax, [bp+var_4]
		jg	short loc_6EC7A
		mov	ax, [di+8]
		cmp	ax, [bp+var_2]
		jl	short loc_6EC7A
		mov	ax, [di+0Ah]
		cmp	ax, [bp+var_4]
		jge	short loc_6EC84

loc_6EC7A:
		mov	word ptr [di+37h], 1
		mov	[bp+var_6], 0FFFFh

loc_6EC84:
		cmp	[bp+arg_6], 0
		jnz	short loc_6EC8D
		jmp	loc_6EE9F

loc_6EC8D:
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr sub_6EB2B
		add	sp, 4
		jmp	loc_6EE9F

loc_6EC9B:
		mov	al, byte_5FE4D
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_6ECA8
		jmp	loc_6EE9F

loc_6ECA8:
		mov	ax, 0C00h
		int	21h
		mov	al, byte_5FE4E
		mov	ah, 0
		mov	[bp+arg_8], ax
		mov	[bp+var_C], 0
		push	word ptr [di+1Eh]
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_E], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		mov	cx, 1Dh
		mov	bx, offset word_6EF8D

loc_6ECD2:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_6ECE2
		add	bx, 2
		loop	short loc_6ECD2
		jmp	loc_6EDC5

loc_6ECE2:
		jmp	word ptr cs:[bx+3Ah] ; switch jump
		jmp	loc_6EDCA

loc_6ECE9:
		mov	bx, [di+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_6ECFE
		xor	ax, ax
		mov	[di+2Eh], ax
		add	bx, ax

loc_6ECF8:
		mov	byte ptr [bx], 0
		jmp	loc_6EDBB

loc_6ECFE:
		mov	word ptr [di+37h], 1
		mov	[bp+var_6], 1
		jmp	loc_6EDCA

loc_6ED0B:
		mov	word ptr [di+37h], 1
		jmp	loc_6EDCA

loc_6ED13:
		cmp	word ptr [di+2Eh], 0
		jg	short loc_6ED1C
		jmp	loc_6EDCA

loc_6ED1C:
		mov	ax, [di+2Eh]
		mov	[bp+var_10], ax
		jmp	short loc_6ED3A

loc_6ED24:
		mov	bx, [di+1Eh]
		add	bx, [bp+var_10]
		mov	al, [bx]
		mov	dx, [bp+var_10]
		add	dx, [di+1Eh]
		mov	bx, dx
		mov	[bx-1], al
		inc	[bp+var_10]

loc_6ED3A:
		mov	ax, [bp+var_10]
		cmp	ax, [bp+var_E]
		jl	short loc_6ED24
		dec	[bp+var_E]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_E]
		mov	byte ptr [bx], 0
		dec	word ptr [di+2Eh]
		jmp	short loc_6EDBB

loc_6ED53:
		cmp	[bp+var_E], 0
		jle	short loc_6EDCA
		mov	ax, [di+2Eh]
		mov	[bp+var_10], ax
		jmp	short loc_6ED77

loc_6ED61:
		mov	ax, [bp+var_10]
		add	ax, [di+1Eh]
		mov	bx, ax
		mov	al, [bx+1]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_10]
		mov	[bx], al
		inc	[bp+var_10]

loc_6ED77:
		mov	ax, [bp+var_10]
		cmp	ax, [bp+var_E]
		jl	short loc_6ED61
		dec	[bp+var_E]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_E]
		jmp	loc_6ECF8

loc_6ED8B:
		cmp	word ptr [di+2Eh], 0
		jle	short loc_6EDBB
		dec	word ptr [di+2Eh]
		jmp	short loc_6EDBB
		jmp	short loc_6EDBB

loc_6ED98:
		mov	ax, [di+20h]
		dec	ax
		cmp	[di+2Eh], ax
		jge	short loc_6EDBB
		inc	word ptr [di+2Eh]
		jmp	short loc_6EDBB
		jmp	short loc_6EDBB

loc_6EDA8:
		mov	word ptr [di+2Eh], 0
		jmp	short loc_6EDBB

loc_6EDAF:
		mov	ax, [bp+var_E]
		mov	[di+2Eh], ax
		jmp	short loc_6EDBB

loc_6EDB7:
		xor	word ptr [di+33h], 1

loc_6EDBB:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		jmp	short loc_6EDCA

loc_6EDC5:
		mov	[bp+var_C], 1

loc_6EDCA:
		cmp	[bp+var_C], 0
		jnz	short loc_6EDD3
		jmp	loc_6EE9F

loc_6EDD3:
		mov	ax, [bp+arg_8]
		mov	[bp+var_10], ax
		cmp	byte_5FE4F, 0
		jz	short loc_6EDE5
		add	[bp+var_10], 100h

loc_6EDE5:
		mov	bx, [bp+var_10]
		mov	al, [bx+4AEAh]
		cbw
		mov	[bp+var_12], ax
		cmp	word ptr [di+35h], 0
		jz	short loc_6EE06
		cmp	[bp+var_12], 61h
		jl	short loc_6EE06
		cmp	[bp+var_12], 7Ah
		jg	short loc_6EE06
		sub	[bp+var_12], 20h

loc_6EE06:
		push	[bp+var_12]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 4
		or	ax, ax
		jnz	short loc_6EE1A
		jmp	loc_6EE9F

loc_6EE1A:
		cmp	word ptr [di+33h], 0
		jz	short loc_6EE6D
		mov	ax, [di+20h]
		dec	ax
		cmp	[di+2Eh], ax
		jl	short loc_6EE32
		mov	ax, [di+20h]
		dec	ax
		mov	[di+2Eh], ax
		jmp	short loc_6EE97

loc_6EE32:
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		mov	[bp+var_14], ax
		jmp	short loc_6EE53

loc_6EE3D:
		mov	ax, [bp+var_14]
		add	ax, [di+1Eh]
		mov	bx, ax
		mov	al, [bx-1]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_14]
		mov	[bx], al
		dec	[bp+var_14]

loc_6EE53:
		mov	ax, [di+2Eh]
		cmp	ax, [bp+var_14]
		jl	short loc_6EE3D
		mov	ax, [di+2Eh]
		inc	word ptr [di+2Eh]
		mov	bx, [di+1Eh]
		add	bx, ax
		mov	al, byte ptr [bp+var_12]
		mov	[bx], al
		jmp	short loc_6EE97

loc_6EE6D:
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		cmp	[di+2Eh], ax
		jl	short loc_6EE81
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		mov	[di+2Eh], ax

loc_6EE81:
		cmp	word ptr [di+2Eh], 0
		jl	short loc_6EE94
		mov	ax, [di+1Eh]
		add	ax, [di+2Eh]
		mov	dl, byte ptr [bp+var_12]
		mov	bx, ax
		mov	[bx], dl

loc_6EE94:
		inc	word ptr [di+2Eh]

loc_6EE97:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_6EE9F:
		cmp	word ptr [di+37h], 0
		jnz	short loc_6EEA8
		jmp	loc_6EBF6

loc_6EEA8:
		push	di
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	word ptr [di+2Eh], 0FFFFh
		cmp	word ptr [di+22h], 0
		jnz	short loc_6EEC0
		cmp	word ptr [di+24h], 0
		jz	short loc_6EF3B

loc_6EEC0:
		cmp	[bp+var_6], 1
		jnz	short loc_6EEFF
		cmp	word ptr [di+22h], 0
		jz	short loc_6EEE1
		mov	bx, [di+22h]
		push	word ptr [bx]
		push	2247h
		push	word ptr [di+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_6EF3B

loc_6EEE1:
		cmp	word ptr [di+24h], 0
		jz	short loc_6EEFD
		mov	bx, [di+24h]
		push	large [bx]
		push	224Ah
		push	word ptr [di+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_6EF3B

loc_6EEFD:
		jmp	short loc_6EF3B

loc_6EEFF:
		cmp	word ptr [di+22h], 0
		jz	short loc_6EF19
		mov	ax, [di+1Eh]
		mov	[bp+var_8], ax
		push	ax
		call	sub_22B1
		pop	cx
		mov	bx, [di+22h]
		mov	[bx], ax
		jmp	short loc_6EF34

loc_6EF19:
		cmp	word ptr [di+24h], 0
		jz	short loc_6EF34
		push	word ptr [di+1Eh]
		call	sub_22B1
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	bx, [di+24h]
		mov	[bx], eax
		jmp	short loc_6EF34

loc_6EF34:
		push	di
		nop
		push	cs
		call	near ptr sub_6F068
		pop	cx

loc_6EF3B:
		cmp	[bp+var_6], 0
		jnz	short loc_6EF7A
		cmp	word ptr [di+22h], 0
		jz	short loc_6EF55
		mov	bx, [di+22h]
		push	word ptr [bx]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+3Ch]
		jmp	short loc_6EF77

loc_6EF55:
		cmp	word ptr [di+24h], 0
		jz	short loc_6EF6D
		mov	bx, [di+24h]
		push	large [bx]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short loc_6EF7A

loc_6EF6D:
		push	word ptr [di+1Eh]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+38h]

loc_6EF77:
		add	sp, 4

loc_6EF7A:
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	di
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_6EF89:
		pop	di
		pop	si
		leave
		retf
sub_6EBAF		endp

; START OF FUNCTION CHUNK FOR sub_6EBAF
word_6EF8D	dw 1
		dw 0Eh
		dw 1Ch
		dw 1Dh
		dw 2Ah
		dw 36h
		dw 38h
		dw 3Ah
		dw 42h
		dw 43h
		dw 47h
		dw 48h
		dw 4Bh
		dw 4Dh
		dw 4Fh
		dw 50h
		dw 52h
		dw 53h
		dw 55h
		dw 59h
		dw 5Ah
		dw 5Bh
		dw 5Eh
		dw 60h
		dw 62h
		dw 63h
		dw 65h
		dw 66h
		dw 7Ah
off_6EFC7	dw offset loc_6ECE9
		dw offset loc_6ED13
		dw offset loc_6ED0B
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDA8
		dw offset loc_6ED8B
		dw offset loc_6ED8B
		dw offset loc_6ED98
		dw offset loc_6EDAF
		dw offset loc_6ED98
		dw offset loc_6EDB7
		dw offset loc_6ED53
		dw offset loc_6EDCA
		dw offset loc_6EDCA
		dw offset loc_6EDA8
		dw offset loc_6ED8B
		dw offset loc_6ED8B
		dw offset loc_6ED98
		dw offset loc_6EDAF
		dw offset loc_6ED98
		dw offset loc_6EDB7
		dw offset loc_6ED53
		dw offset loc_6EDCA
; END OF FUNCTION CHUNK FOR sub_6EBAF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F001		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	word ptr [si+22h], 0
		jz	short loc_6F035
		mov	word ptr [bp+var_4], dx
		push	word ptr [bp+var_4]
		call	sub_22B1
		pop	cx
		mov	word ptr [bp+var_4+2], ax
		movsx	eax, word ptr [bp+var_4+2]
		push	eax

loc_6F02A:
		push	si
		nop
		push	cs
		call	near ptr sub_6F0CE
		add	sp, 6
		jmp	short loc_6F065

loc_6F035:
		cmp	word ptr [si+24h], 0
		jz	short loc_6F04E
		push	dx
		call	sub_22B1
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		push	eax
		jmp	short loc_6F02A

loc_6F04E:
		push	word ptr [si+20h]
		push	dx
		push	word ptr [si+1Eh]
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_6F065:
		pop	si
		leave
		retf
sub_6F001		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F068		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0
		jz	short loc_6F09D
		mov	bx, [si+22h]
		movsx	eax, word ptr [bx]
		cmp	eax, [si+26h]
		jge	short loc_6F089
		mov	ax, [si+26h]
		mov	[bx], ax
		jmp	short loc_6F0CB

loc_6F089:
		mov	bx, [si+22h]
		movsx	eax, word ptr [bx]
		cmp	eax, [si+2Ah]
		jle	short loc_6F0CB
		mov	ax, [si+2Ah]
		mov	[bx], ax
		jmp	short loc_6F0CB

loc_6F09D:
		cmp	word ptr [si+24h], 0
		jz	short loc_6F0CB
		mov	bx, [si+24h]
		mov	eax, [bx]
		cmp	eax, [si+26h]
		jge	short loc_6F0B5
		mov	eax, [si+26h]
		jmp	short loc_6F0C5

loc_6F0B5:
		mov	bx, [si+24h]
		mov	eax, [bx]
		cmp	eax, [si+2Ah]
		jle	short loc_6F0CB
		mov	eax, [si+2Ah]

loc_6F0C5:
		mov	bx, [si+24h]
		mov	[bx], eax

loc_6F0CB:
		pop	si
		pop	bp
		retf
sub_6F068		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0CE		proc far

var_10		= word ptr -10h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0
		jz	short loc_6F0F6
		mov	bx, [si+22h]
		mov	ax, word ptr [bp+arg_2]
		mov	[bx], ax

loc_6F0E6:
		push	si
		push	cs
		call	near ptr sub_6F068
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		jmp	short loc_6F127

loc_6F0F6:
		cmp	word ptr [si+24h], 0
		jz	short loc_6F108
		mov	bx, [si+24h]
		mov	eax, [bp+arg_2]
		mov	[bx], eax
		jmp	short loc_6F0E6

loc_6F108:
		push	large [bp+arg_2]
		push	224Eh
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_10]
		push	ax
		push	si
		push	cs
		call	near ptr sub_6F001
		add	sp, 4

loc_6F127:
		pop	si
		leave
		retf
sub_6F0CE		endp
ovr194		ends
