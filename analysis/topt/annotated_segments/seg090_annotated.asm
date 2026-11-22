seg090		segment	para public 'CODE' use16
		assume cs:seg090
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 0FFh, 0Ah, 0C0h, 75h, 0D0h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FA49		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2FA62
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2FABD

loc_2FA62:
		mov	word ptr [si], 4511h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg123
		mov	word ptr [si+2], 7
		mov	word ptr [si], 44FDh
		mov	word ptr [si+17h], 0
		mov	word ptr [si+19h], 0
		mov	word ptr [si+1Bh], 0
		mov	word ptr [si+1Dh], 0
		mov	ax, [bp+arg_2]
		mov	[si+1Fh], ax
		mov	al, [bp+arg_6]
		mov	[si+15h], al
		push	ds
		push	[bp+arg_4]
		mov	ax, si
		add	ax, 1Bh
		push	ax
		call	DisplaySurface_Construct_2F5AC
		add	sp, 6
		mov	byte ptr [si+16h], 0
		mov	word ptr [si+13h], 0
		mov	byte ptr [si+12h], 4

loc_2FABD:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_2FA49		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FAC2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2FB33
		mov	word ptr [si], 44FDh
		cmp	word ptr [si+13h], 0
		jz	short loc_2FAF4
		cmp	word ptr [si+13h], 0
		jz	short loc_2FAF4

loc_2FAE1:
		push	word ptr [si+13h]
		call	sub_39C
		pop	cx
		jmp	short loc_2FAF4
		jmp	short loc_2FAF4

loc_2FAEE:
		cmp	word ptr [si+13h], 0
		jnz	short loc_2FAE1

loc_2FAF4:
		push	si
		nop
		push	cs
		call	near ptr sub_2FB37
		pop	cx
		mov	[si+13h], ax
		or	ax, ax
		jnz	short loc_2FAEE
		mov	ax, si
		add	ax, 1Bh
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		mov	ax, si
		add	ax, 17h
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		mov	ax, si
		add	ax, 6
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		test	di, 1
		jz	short loc_2FB33
		push	si
		call	sub_39C
		pop	cx

loc_2FB33:
		pop	di
		pop	si
		pop	bp
		retf
sub_2FAC2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FB37		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+12h], 4
		jnb	short loc_2FB55
		mov	al, [si+12h]
		inc	byte ptr [si+12h]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	ax, [bx+si+0Ah]
		jmp	short loc_2FB57

loc_2FB55:
		xor	ax, ax

loc_2FB57:
		pop	si
		pop	bp
		retf
sub_2FB37		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FB5A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+12h], 0
		jz	short loc_2FB7F
		mov	al, [si+12h]
		add	al, 0FFh
		mov	[si+12h], al
		mov	ah, 0
		shl	ax, 1
		mov	dx, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0Ah], dx
		mov	al, 1
		jmp	short loc_2FB81

loc_2FB7F:
		mov	al, 0

loc_2FB81:
		pop	si
		pop	bp
		retf
sub_2FB5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FB84		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	ds
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 17h
		push	ax
		call	DisplaySurface_Construct_2F5AC
		add	sp, 6
		mov	ax, [si+17h]
		pop	si
		pop	bp
		retf
sub_2FB84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FBA3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_4CE02
		jz	short loc_2FBC9
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_2FBC9:
		push	word_4CE02
		call	sub_2FA06
		pop	cx
		leave
		retf
sub_2FBA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FBD5		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2FC15
		mov	word ptr [di], 44EDh
		mov	word ptr [di], 44F5h
		push	[bp+var_6]
		push	[bp+var_4]
		push	ax
		call	sub_2FEC0
		add	sp, 6
		mov	ax, di
		jmp	short loc_2FC17

loc_2FC15:
		mov	ax, di

loc_2FC17:
		mov	[si+13h], ax
		cmp	word ptr [si+13h], 0
		jz	short loc_2FC34
		push	word ptr [si+13h]
		mov	bx, [si+13h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr sub_2FB84
		add	sp, 4

loc_2FC34:
		mov	[bp+var_2], 0
		jmp	loc_2FD14

loc_2FC3C:
		push	word ptr [si+13h]
		mov	bx, [si+13h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_2FC6A
		cmp	word ptr [si+13h], 0
		jz	short loc_2FC5E
		push	word ptr [si+13h]
		call	sub_39C
		pop	cx
		jmp	short loc_2FC5E

loc_2FC5E:
		push	si
		push	cs
		call	near ptr sub_2FB37
		pop	cx
		mov	[si+13h], ax
		jmp	loc_2FD14

loc_2FC6A:
		inc	[bp+var_2]
		mov	al, [di]
		cmp	al, [si+15h]
		jnz	short loc_2FCD9
		push	word ptr [si+13h]
		push	si
		push	cs
		call	near ptr sub_2FB5A
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2FC96
		mov	ax, di
		inc	ax
		push	ax
		push	442Ah
		push	si
		push	cs
		call	near ptr sub_2FBA3
		add	sp, 6
		jmp	short loc_2FD14

loc_2FC96:
		mov	ax, di
		inc	ax
		mov	[bp+var_8], ax
		push	10Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2FCD2
		mov	word ptr [di], 44EDh
		add	ax, 2
		push	ax
		call	sub_30801
		pop	cx
		mov	word ptr [di], 44C5h
		mov	word ptr [di+2], 44D5h
		push	[bp+var_8]
		push	di
		call	sub_2FF28
		add	sp, 4
		mov	ax, di
		jmp	short loc_2FCD4

loc_2FCD2:
		mov	ax, di

loc_2FCD4:
		mov	[si+13h], ax
		jmp	short loc_2FD14

loc_2FCD9:
		mov	al, [di]
		cbw
		push	ax
		push	4426h
		call	CRT_Strchr_WordAligned
		add	sp, 4
		or	ax, ax
		jz	short loc_2FD03
		push	[bp+var_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_2FD48
		add	sp, 6
		or	ax, ax
		jnz	short loc_2FD14

loc_2FCFD:
		mov	byte ptr [si+16h], 1
		jmp	short loc_2FD1D

loc_2FD03:
		push	[bp+var_2]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		add	sp, 6
		or	ax, ax
		jz	short loc_2FCFD

loc_2FD14:
		cmp	word ptr [si+13h], 0
		jz	short loc_2FD1D
		jmp	loc_2FC3C

loc_2FD1D:
		mov	ax, [si+1Fh]
		cmp	ax, [bp+var_2]
		jle	short loc_2FD29
		mov	byte ptr [si+16h], 1

loc_2FD29:
		cmp	byte ptr [si+16h], 0
		jz	short loc_2FD44
		mov	al, [si+16h]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	0
		call	PagedResourceC_RefreshAndFinalize_35E0F
		pop	cx

loc_2FD44:
		pop	di
		pop	si
		leave
		retf
sub_2FBD5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FD48		proc far

var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_7], 0
		mov	ax, di
		inc	ax
		mov	[bp+var_6], ax
		mov	ax, [bp+var_6]
		inc	[bp+var_6]
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_2], 1
		jmp	short loc_2FDB9

loc_2FD77:
		push	[bp+arg_4]
		push	[bp+var_6]
		mov	bx, [bp+var_2]
		mov	al, [bx+di]
		push	ax
		mov	al, [di]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 0Ah
		neg	ax
		sbb	ax, ax
		inc	ax
		or	[bp+var_7], al
		cmp	word ptr [si+1Bh], 0
		jz	short loc_2FDC1
		mov	bx, [bp+var_2]
		mov	al, [bx+di]
		cbw
		push	ax
		push	word ptr [si+1Bh]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		or	ax, ax
		jz	short loc_2FDC1
		inc	[bp+var_2]
		inc	[bp+var_6]

loc_2FDB9:
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jle	short loc_2FD77

loc_2FDC1:
		mov	al, [bp+var_7]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
sub_2FD48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FDCF		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 1
		jnz	short loc_2FDEC
		push	word ptr [si+17h]
		push	4462h
		push	si
		push	cs
		call	near ptr sub_2FBA3
		add	sp, 6
		jmp	short loc_2FDF7

loc_2FDEC:
		push	4478h
		push	si
		push	cs
		call	near ptr sub_2FBA3
		add	sp, 4

loc_2FDF7:
		pop	si
		pop	bp
		retf
sub_2FDCF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FDFA		proc far

arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, 1
		mov	al, [bp+arg_4]
		cbw
		cmp	ax, 3Fh
		jz	short loc_2FE17
		cmp	ax, 48h
		jz	short loc_2FE17
		cmp	ax, 68h
		jnz	short loc_2FE1D

loc_2FE17:
		mov	byte ptr [si+16h], 2
		jmp	short loc_2FE1F

loc_2FE1D:
		xor	dx, dx

loc_2FE1F:
		mov	ax, dx
		pop	si
		pop	bp
		retf
sub_2FDFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FE24		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 1
		push	448Ch
		push	[bp+arg_2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_2FE47
		mov	byte ptr [si+16h], 2
		jmp	short loc_2FE49

loc_2FE47:
		xor	di, di

loc_2FE49:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_2FE24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FE4F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	4491h
		mov	ax, dx
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		pop	bp
		retf
sub_2FE4F		endp

; ----------------------------------------------------------------------

sub_2FE68		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFEh
		jmp	sub_2FF72
sub_2FE68		endp

; ----------------------------------------------------------------------

sub_2FE74		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFEh
		jmp	sub_2FF0F
sub_2FE74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FE80		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2FEAA
		mov	ax, si
		add	ax, 6
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		test	di, 1
sub_2FE80		endp

; START OF FUNCTION CHUNK FOR sub_2FE80
		db 74h
; END OF FUNCTION CHUNK FOR sub_2FE80
seg090		ends
