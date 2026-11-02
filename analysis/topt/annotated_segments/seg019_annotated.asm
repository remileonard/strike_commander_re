seg019		segment	para public 'CODE' use16
		assume cs:seg019
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 36h, 36h, 1, 0CFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A6A5		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	dword_4A51F, 0
		jz	short loc_A6CC
		cmp	byte_4EF07, 2
		jb	short loc_A6CC
		cmp	byte_4EF07, 0Bh
		ja	short loc_A6CC
		mov	eax, dword_4A51F
		cmp	eax, [bp+arg_0]
		jz	short loc_A6CC
		xor	ax, ax
		pop	bp
		retf

loc_A6CC:
		mov	al, byte_4EF07
		mov	ah, 0
		pop	bp
		retf
sub_A6A5		endp

; START OF FUNCTION CHUNK FOR sub_A6A5
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_A6A5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A6D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_4EF07
		mov	ah, 0
		mov	word_4A515, ax
		push	1
		push	6526h
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_45C38
		pop	si
		pop	bp
		retf
sub_A6D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A6F9		proc far
		push	bp
		mov	bp, sp
		push	64h
		push	140h
		call	TextScrollDisplay_RegisterEntries_449DB
		add	sp, 4
		call	TextScroll_ApplyHelperC_44806
		call	sub_44AA3
		mov	word_4A517, ax
		call	sub_44ABB
		mov	word_4A519, ax
		pop	bp
		retf
sub_A6F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A720		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_A720		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A728		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		call	sub_450F2
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_A728		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A73C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_A6D5
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_A720
		add	sp, 2
		push	0
		call	sub_45168
		add	sp, 2
		or	al, al
		jz	short loc_A769
		push	si
		push	cs
		call	near ptr sub_A728
		add	sp, 2

loc_A769:
		pop	si
		pop	bp
		retf
sub_A73C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A76C		proc far
		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_A786

loc_A774:
		cmp	byte ptr [si+652Ah], 0
		jz	short loc_A785
		mov	byte ptr [si+652Ah], 0
		mov	ax, si
		pop	si
		pop	bp
		retf

loc_A785:
		inc	si

loc_A786:
		cmp	si, 2
		jl	short loc_A774
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		retf
sub_A76C		endp

; START OF FUNCTION CHUNK FOR sub_A76C
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_A76C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A794		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_A7B3
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		mov	byte ptr [bx+652Ah], 1
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0FFFFh

loc_A7B3:
		pop	bp
		retf
sub_A794		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7B5		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	si, si
		mov	ax, word_4A51D
		sar	ax, 2
		mov	di, ax
		push	1
		call	sub_451CD
		add	sp, 2
		mov	[bp+var_2], ax
		mov	ax, word_4A51D
		sub	ax, di
		cmp	ax, [bp+var_2]
		jle	short loc_A7E3
		mov	si, 0FFFFh
		jmp	short loc_A7F0

loc_A7E3:
		mov	ax, word_4A51D
		add	ax, di
		cmp	ax, [bp+var_2]
		jge	short loc_A7F0
		mov	si, 1

loc_A7F0:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_A7B5		endp

; START OF FUNCTION CHUNK FOR sub_A7B5
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_A7B5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7FA		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	al, byte_4EF07
		mov	ah, 0
		mov	si, ax
		or	si, si
		jz	short loc_A810
		jmp	loc_A977

loc_A810:
		push	0
		call	sub_45168
		add	sp, 2
		or	al, al
		jnz	short loc_A821
		jmp	loc_A8EB

loc_A821:
		mov	eax, dword_4EF14
		add	eax, dword_4EF18
		cmp	eax, dword_4DE15
		ja	short loc_A836
		mov	ax, 1
		jmp	short loc_A838

loc_A836:
		xor	ax, ax

loc_A838:
		or	al, al
		jnz	short loc_A83F
		jmp	loc_A8EB

loc_A83F:
		mov	dword_4EF18, 5
		mov	eax, dword_4DE15
		mov	dword_4EF14, eax
		push	0
		call	sub_450F2
		add	sp, 2
		push	2
		push	0
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		shl	ax, 1
		push	ax
		push	1
		push	0
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		pop	dx
		add	dx, ax
		mov	di, dx
		or	di, di
		jz	short loc_A892
		test	di, 1
		jz	short loc_A88D
		mov	si, 1Ch
		jmp	short loc_A890

loc_A88D:
		mov	si, 1

loc_A890:
		jmp	short loc_A8EB

loc_A892:
		push	0
		call	sub_451AF
		add	sp, 2
		mov	[bp+var_2], ax
		push	0
		call	sub_451BE
		add	sp, 2
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 10h
		jle	short loc_A8B7
		mov	si, 4Dh
		jmp	short loc_A8D6

loc_A8B7:
		cmp	[bp+var_2], 0FFF0h
		jge	short loc_A8C2
		mov	si, 4Bh
		jmp	short loc_A8D6

loc_A8C2:
		cmp	[bp+var_4], 10h
		jle	short loc_A8CD
		mov	si, 50h
		jmp	short loc_A8D6

loc_A8CD:
		cmp	[bp+var_4], 0FFF0h
		jge	short loc_A8D6
		mov	si, 48h

loc_A8D6:
		or	si, si
		jz	short loc_A8EB
		mov	dword_4EF18, 1Eh
		mov	eax, dword_4DE15
		mov	dword_4EF14, eax

loc_A8EB:
		or	si, si
		jz	short loc_A8F2
		jmp	loc_A977

loc_A8F2:
		mov	byte ptr [bp+var_8], 0
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_8], 3
		jnz	short loc_A963
		call	sub_44AA3
		mov	di, ax
		call	sub_44ABB
		mov	[bp+var_A], ax
		mov	ax, word_4A517
		add	ax, 60h
		cmp	ax, di
		jge	short loc_A926
		mov	si, 4Dh
		jmp	short loc_A953

loc_A926:
		mov	ax, word_4A517
		add	ax, 0FFA0h
		cmp	ax, di
		jle	short loc_A935
		mov	si, 4Bh
		jmp	short loc_A953

loc_A935:
		mov	ax, word_4A519
		add	ax, 30h
		cmp	ax, [bp+var_A]
		jge	short loc_A945
		mov	si, 50h
		jmp	short loc_A953

loc_A945:
		mov	ax, word_4A519
		add	ax, 0FFD0h
		cmp	ax, [bp+var_A]
		jle	short loc_A953
		mov	si, 48h

loc_A953:
		or	si, si
		jz	short loc_A961
		mov	word_4A517, di
		mov	ax, [bp+var_A]
		mov	word_4A519, ax

loc_A961:
		jmp	short loc_A977

loc_A963:
		cmp	byte ptr [bp+var_8], 2
		jnz	short loc_A977
		test	byte ptr [bp+var_8+1], 1
		jz	short loc_A974
		mov	si, 1Ch
		jmp	short loc_A977

loc_A974:
		mov	si, 1

loc_A977:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_A7FA		endp

; START OF FUNCTION CHUNK FOR sub_A7FA
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_A7FA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A981		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	di, word_4DE0E
		mov	ax, word_4DE10
		mov	[bp+var_4], ax
		mov	eax, dword_4EF0C
		add	eax, dword_4EF10
		cmp	eax, dword_4DE15
		ja	short loc_A9AF
		mov	ax, 1
		jmp	short loc_A9B1

loc_A9AF:
		xor	ax, ax

loc_A9B1:
		or	al, al
		jnz	short loc_A9B8
		jmp	loc_AB26

loc_A9B8:
		movsx	eax, word_4A523
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_4EF10, eax
		mov	eax, dword_4DE15
		mov	dword_4EF0C, eax
		push	0FFh
		push	[bp+arg_2]
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+1], 1Ch
		jz	short loc_A9EC
		jmp	loc_AA6B

loc_A9EC:
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 1
		jnz	short loc_AA2C
		mov	al, byte_4A527
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AA2C
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_A]
		mov	[si+2], ax
		mov	ax, [bp+var_C]
		mov	[si+4], ax
		mov	[bp+var_1], 1
		mov	byte_4A527, 1
		jmp	short loc_AA68

loc_AA2C:
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 2
		jnz	short loc_AA68
		cmp	byte_4A527, 0
		jz	short loc_AA68
		mov	byte ptr [si], 2
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_E], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_E]
		mov	[si+2], ax
		mov	ax, [bp+var_10]
		mov	[si+4], ax
		mov	byte_4A527, 0
		mov	[bp+var_1], 1

loc_AA68:
		jmp	loc_AB26

loc_AA6B:
		cmp	byte_4F71A, 1
		jnz	short loc_AA80
		cmp	[bp+var_4], 0
		jle	short loc_AA80
		sub	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_AA80:
		cmp	byte_4F722, 1
		jnz	short loc_AA96
		cmp	[bp+var_4], 0C7h
		jge	short loc_AA96
		add	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_AA96:
		cmp	byte_4F71D, 1
		jnz	short loc_AAA8
		or	di, di
		jle	short loc_AAA8
		sub	di, 3
		mov	[bp+var_1], 1

loc_AAA8:
		cmp	byte_4F71F, 1
		jnz	short loc_AABC
		cmp	di, 13Fh
		jge	short loc_AABC
		add	di, 3
		mov	[bp+var_1], 1

loc_AABC:
		cmp	[bp+var_1], 0
		jz	short loc_AB20
		dec	word_4A523
		cmp	word_4A523, 1
		jg	short loc_AAD3
		mov	word_4A523, 1

loc_AAD3:
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_12], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_12]
		mov	[si+2], ax
		mov	ax, [bp+var_14]
		mov	[si+4], ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_449DB
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		push	[bp+var_18]
		push	[bp+var_16]
		push	0
		push	0
		call	TextScrollDisplayB_ApplyHelperB_454C6
		add	sp, 8
		jmp	short loc_AB26

loc_AB20:
		mov	word_4A523, 5

loc_AB26:
		cmp	byte_4A527, 0
		jz	short loc_AB35
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_AB35:
		nop
		push	cs
		call	near ptr sub_AD7F
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_A981		endp

; START OF FUNCTION CHUNK FOR sub_A981
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_A981

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB45		proc far

var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	0
		call	sub_45168
		add	sp, 2
		or	al, al
		jnz	short loc_AB65
		jmp	loc_AD65

loc_AB65:
		mov	di, word_4DE0E
		mov	ax, word_4DE10
		mov	[bp+var_4], ax
		mov	eax, dword_4EF14
		add	eax, dword_4EF18
		cmp	eax, dword_4DE15
		ja	short loc_AB84
		mov	ax, 1
		jmp	short loc_AB86

loc_AB84:
		xor	ax, ax

loc_AB86:
		or	al, al
		jnz	short loc_AB8D
		jmp	loc_AD65

loc_AB8D:
		movsx	eax, word_4A525
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_4EF18, eax
		mov	eax, dword_4DE15
		mov	dword_4EF14, eax
		push	0
		call	sub_450F2
		add	sp, 2
		mov	[bp+var_A], 0
		mov	[bp+var_C], 0
		push	1
		push	0
		call	sub_45152
		add	sp, 4
		mov	[bp+var_D], al
		cmp	[bp+var_D], 0
		jz	short loc_AC09
		mov	al, byte_4A528
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC09
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_10], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_10]
		mov	[si+2], ax
		mov	ax, [bp+var_12]
		mov	[si+4], ax
		mov	[bp+var_1], 1
		mov	byte_4A528, 1
		jmp	loc_AD65

loc_AC09:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC49
		cmp	byte_4A528, 0
		jz	short loc_AC49
		mov	byte ptr [si], 2
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_14], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_14]
		mov	[si+2], ax
		mov	ax, [bp+var_16]
		mov	[si+4], ax
		mov	[bp+var_1], 1
		mov	byte_4A528, 0
		jmp	loc_AD65

loc_AC49:
		push	0
		call	sub_451AF
		add	sp, 2
		mov	[bp+var_C], ax
		push	0
		call	sub_451BE
		add	sp, 2
		mov	[bp+var_A], ax
		cmp	[bp+var_C], 0
		jnz	short loc_AC6F
		cmp	[bp+var_A], 0
		jz	short loc_AC74

loc_AC6F:
		mov	ax, 1
		jmp	short loc_AC76

loc_AC74:
		xor	ax, ax

loc_AC76:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_AC82
		jmp	loc_AD5F

loc_AC82:
		cmp	[bp+var_C], 0
		jle	short loc_AC93
		cmp	di, 13Fh
		jge	short loc_AC93
		add	di, 3
		jmp	short loc_ACA0

loc_AC93:
		cmp	[bp+var_C], 0
		jge	short loc_ACA0
		or	di, di
		jle	short loc_ACA0
		sub	di, 3

loc_ACA0:
		cmp	[bp+var_A], 0
		jle	short loc_ACB3
		cmp	[bp+var_4], 0C7h
		jge	short loc_ACB3
		add	[bp+var_4], 3
		jmp	short loc_ACC3

loc_ACB3:
		cmp	[bp+var_A], 0
		jge	short loc_ACC3
		cmp	[bp+var_4], 0
		jle	short loc_ACC3
		sub	[bp+var_4], 3

loc_ACC3:
		mov	ax, [bp+var_C]
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_1A]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1E]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_20], ax
		mov	ax, [bp+var_1C]
		cmp	ax, [bp+var_20]
		jle	short loc_ACF2
		mov	ax, [bp+var_1C]
		jmp	short loc_ACF5

loc_ACF2:
		mov	ax, [bp+var_20]

loc_ACF5:
		mov	[bp+var_18], ax
		mov	[bp+var_22], 4
		mov	ax, [bp+var_22]
		imul	[bp+var_18]
		mov	bx, 20h
		cwd
		idiv	bx
		mov	dx, 5
		sub	dx, ax
		mov	word_4A525, dx
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_26], ax
		mov	ax, [bp+var_24]
		mov	[si+2], ax
		mov	ax, [bp+var_26]
		mov	[si+4], ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_449DB
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_28], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_2A], ax
		push	[bp+var_2A]
		push	[bp+var_28]
		push	0
		push	0
		call	TextScrollDisplayB_ApplyHelperB_454C6
		add	sp, 8
		jmp	short loc_AD65

loc_AD5F:
		mov	word_4A525, 5

loc_AD65:
		cmp	byte_4A528, 0
		jz	short loc_AD74
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_AD74:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_AB45		endp

; START OF FUNCTION CHUNK FOR sub_AB45
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_AB45

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD7F		proc far
		push	bp
		mov	bp, sp
		call	sub_A051
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AD92
		call	Keyboard_DrainBufferBIOS_45C38

loc_AD92:
		pop	bp
		retf
sub_AD7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD94		proc far
		push	bp
		mov	bp, sp
		push	6524h
		call	TextScrollDisplayB_ConstructAndReset_453DB
		add	sp, 2
		xor	eax, eax
		mov	dword_4EF10, eax
		mov	dword_4EF0C, eax
		xor	eax, eax
		mov	dword_4EF18, eax
		mov	dword_4EF14, eax
		pop	bp
		retf
sub_AD94		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADBA		proc far
		push	bp
		mov	bp, sp
		push	6524h
sub_ADBA		endp
seg019		ends
