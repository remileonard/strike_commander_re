seg015		segment	para public 'CODE' use16
		assume cs:seg015
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 47h, 3, 41h

loc_9933:
		db 83h, 0F9h, 9, 7Ch, 0EAh, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_993C		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	sub_3628
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		call	StreamReader_ParseFormattedValueB_40BF9
		add	sp, 2
		or	ax, ax
		jz	short loc_996B
		mov	al, 1
		leave
		retf
		jmp	short loc_9986

loc_996B:
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_9982
		mov	ax, 1
		jmp	short loc_9984

loc_9982:
		xor	ax, ax

loc_9984:
		leave
		retf
sub_993C		endp

; START OF FUNCTION CHUNK FOR sub_993C

loc_9986:
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_993C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9988		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_9988		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_998D		proc far
		push	bp
		mov	bp, sp
		call	sub_439D0
		pop	bp
		retf
sub_998D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9997		proc far
		push	bp
		mov	bp, sp
		inc	dword_49DF4
		pop	bp
		retf
sub_9997		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	byte_49DFC, 0
		jz	short loc_99B2
		mov	al, 0
		pop	bp
		retf

loc_99B2:
		mov	al, 1
		pop	bp
		retf
sub_99A1		endp

; START OF FUNCTION CHUNK FOR sub_99A1
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_99A1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99B8		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		pushf
		cli
		mov	eax, dword_49DF4
		mov	[bp+var_4], eax
		mov	dx, 26D7h

loc_99CB:
		mov	al, 0C2h
		out	43h, al
		jmp	short loc_99D1

loc_99D1:
		in	al, 40h
		mov	ch, al
		jmp	short loc_99D7

loc_99D7:
		in	al, 40h
		mov	bl, al
		jmp	short loc_99DD

loc_99DD:
		in	al, 40h
		mov	bh, al
		jmp	short loc_99E3

loc_99E3:
		mov	al, 0Ah
		out	20h, al
		jmp	short loc_99E9

loc_99E9:
		in	al, 20h
		test	al, 1
		jz	short loc_99F3
		mov	ax, dx
		jmp	short loc_9A0A

loc_99F3:
		test	ch, 40h
		jnz	short loc_99CB
		xor	ax, ax
		shr	bx, 1
		shl	ch, 1
		jnb	short loc_9A04
		mov	ax, dx
		shr	ax, 1

loc_9A04:
		add	ax, bx
		neg	ax
		add	ax, dx

loc_9A0A:
		popf
		movzx	eax, ax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		imul	eax, eax, 26D7h
		add	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	ebx, 0C6h
		cdq
		idiv	ebx
		shld	edx, eax, 10h
		leave
		retf
sub_99B8		endp

; START OF FUNCTION CHUNK FOR sub_99B8
		leave
		retf
		push	ax
		push	bx
		push	cx
		push	dx
		push	es
		push	ds
		push	si
		push	di
		push	bp
		mov	bp, seg dseg
		mov	ds, bp
		mov	bp, sp
		pop	bp
		pop	di
		pop	si
		pop	ds
		pop	es
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		iret
; END OF FUNCTION CHUNK FOR sub_99B8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9A58		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9A73
		push	12h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_9A94

loc_9A73:
		push	si
		call	JoystickCallback_Construct_43A16
		add	sp, 2
		push	0
		push	0
		push	si
		push	seg seg015
		push	offset loc_9A3E
		push	23h
		push	6CBEh
		call	JoystickCallback_RegisterInChain_43B15
		add	sp, 0Eh

loc_9A94:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9A58		endp

; START OF FUNCTION CHUNK FOR sub_9A58
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_9A58

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9A9C		proc far

var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
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

		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 7FFFh
		xor	di, di
		xor	cx, cx
		jmp	loc_9BA3

loc_9AB8:
		mov	al, [si]
		mov	ah, 0
		mov	dx, [bp+arg_2]
		sub	dx, ax
		mov	[bp+var_6], dx
		mov	al, [si+1]
		mov	ah, 0
		mov	dx, [bp+arg_4]
		sub	dx, ax
		mov	[bp+var_8], dx
		mov	al, [si+2]
		mov	ah, 0
		mov	dx, [bp+arg_6]
		sub	dx, ax
		mov	[bp+var_A], dx
		mov	ax, [bp+var_6]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		or	eax, eax
		jge	short loc_9AFD
		neg	eax

loc_9AFD:
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, [bp+var_8]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		or	eax, eax
		jge	short loc_9B28
		neg	eax

loc_9B28:
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	ax, [bp+var_A]
		mov	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		or	eax, eax
		jge	short loc_9B67
		neg	eax

loc_9B67:
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_30]
		add	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	ax, word ptr [bp+var_46+1]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_C]
		cmp	ax, [bp+var_4]
		jge	short loc_9B9E
		mov	[bp+var_2], di
		mov	ax, [bp+var_C]
		mov	[bp+var_4], ax

loc_9B9E:
		inc	di
		add	si, 3
		inc	cx

loc_9BA3:
		cmp	cx, 100h
		jge	short loc_9BAC
		jmp	loc_9AB8

loc_9BAC:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_9A9C		endp

; START OF FUNCTION CHUNK FOR sub_9A9C
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_9A9C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9BB7		proc far

var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	[bp+var_1], 3
		inc	byte_49DF3
		cmp	byte_49DF2, 0
		jnz	short loc_9BD1
		jmp	loc_9C7A

loc_9BD1:
		push	seg seg015
		push	offset sub_9E0E
		push	1
		push	100h
		push	3
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_6], ax
		push	0
		push	100h
		push	[bp+var_6]
		call	sub_35C5F
		push	32h
		push	32h
		push	32h
		push	[bp+var_6]
		push	cs
		call	near ptr sub_9A9C
		add	sp, 8
		mov	[bp+var_4], ax
		push	[bp+var_6]
		call	sub_39C
		add	sp, 2
		call	sub_A051
		mov	[bp+var_7], al
		cmp	[bp+var_7], 0
		jz	short loc_9C29
		mov	di, 141Dh
		jmp	short loc_9C2C

loc_9C29:
		mov	di, 143Ah

loc_9C2C:
		mov	dl, 7
		mov	dh, 16h
		xor	bx, bx
		mov	ah, 2
		int	10h
		xor	si, si
		jmp	short loc_9C46

loc_9C3A:
		mov	bx, si
		mov	al, [bx+di]
		mov	ah, 0Eh
		mov	bx, [bp+var_4]
		int	10h
		inc	si

loc_9C46:
		cmp	si, 1Ch
		jl	short loc_9C3A
		mov	ah, 0
		int	16h
		mov	ah, 0
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		mov	[bp+var_2], al
		cmp	[bp+var_2], 4Eh
		jnz	short loc_9C69
		cmp	[bp+var_7], 0
		jz	short loc_9C6F

loc_9C69:
		mov	[bp+var_1], 1
		jmp	short loc_9C7A

loc_9C6F:
		mov	ax, seg seg002
		mov	es, ax
		mov	byte ptr es:6, 1

loc_9C7A:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_9BB7		endp

; START OF FUNCTION CHUNK FOR sub_9BB7
		pop	di
		pop	si
		leave
		retf
		push	ax
		push	bx
		push	cx
		push	dx
		push	es
		push	ds
		push	si
		push	di
		push	bp
		mov	bp, seg dseg
		mov	ds, bp
		mov	bp, sp
		push	cs
		call	near ptr sub_9BB7
		pop	bp
		pop	di
		pop	si
		pop	ds
		pop	es
		pop	dx
		pop	cx
		pop	bx
		add	sp, 2
		iret
		pop	bp
		pop	di
		pop	si
		pop	ds
		pop	es
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		iret
; END OF FUNCTION CHUNK FOR sub_9BB7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9CAF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9CCA
		push	12h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_9CEB

loc_9CCA:
		push	si
		call	JoystickCallback_Construct_43A16
		add	sp, 2
		push	0
		push	0
		push	si
		push	seg seg015
		push	offset loc_9C85
		push	24h
		push	6CBEh
		call	JoystickCallback_RegisterInChain_43B15
		add	sp, 0Eh

loc_9CEB:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9CAF		endp

; START OF FUNCTION CHUNK FOR sub_9CAF
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_9CAF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9CF3		proc far
		push	bp
		mov	bp, sp
		mov	word_4EEA6, 1B4h
		mov	ax, word_4D392
		mov	word_4EEA8, ax
		mov	word_4D392, 64C6h
		mov	dword_4EEAB, 0
		mov	byte_4EEAF, 2
		mov	byte_4EEB0, 0
		mov	dword_4EEB1, 0
		mov	dword_4EEB5, 0
		mov	byte_4EEB9, 2
		mov	byte_4EEBA, 0
		mov	dword_4EEBB, 0
		mov	word_4EEBF, 0
		mov	word_4EEC5, 0
		mov	word_4EECB, 0
		mov	word_4EEA6, 1467h
		mov	byte_4EECD, 3
		mov	word_4EECE, 1B4h
		mov	ax, word_4D392
		mov	word_4EED0, ax
		mov	word_4D392, 64EEh
		mov	word_4EED2, 1457h
		mov	word_4EECE, 145Fh
		mov	byte_4EED4, 1
		push	64EDh
		call	sub_2F3A2
		add	sp, 2
		push	64F8h
		push	cs
		call	near ptr sub_9A58
		add	sp, 2
		push	650Ah
		push	cs
		call	near ptr sub_9CAF
		add	sp, 2
		push	651Ch
		call	TextScrollDisplayB_ConstructAndReset_453DB
		add	sp, 2
		pop	bp
		retf
sub_9CF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DAC		proc far
		push	bp
		mov	bp, sp
		push	651Ch
		call	sub_44B7D
		add	sp, 2
		push	2
		push	650Ah
		call	sub_43A60
		add	sp, 4
		push	2
		push	64F8h
		call	sub_43A60
		add	sp, 4
		mov	word_4EEA6, 1467h
		push	64C6h
		call	sub_47B9E
		add	sp, 2
		push	0
		push	64EEh
		call	sub_35D92
		add	sp, 4
		push	0
		push	64CBh
		call	sub_47C04
		add	sp, 4
		push	0
		push	64C6h
		call	sub_35D92
		add	sp, 4
		pop	bp
		retf
sub_9DAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E0E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9E29
		push	3
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_9E29

loc_9E29:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9E0E		endp

; START OF FUNCTION CHUNK FOR sub_9E0E
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_9E0E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E31		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9E61
		push	0
		mov	ax, si
		inc	ax
		push	ax
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_9E5F
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_9E5F

loc_9E5F:
		jmp	short loc_9E61

loc_9E61:
		pop	di
		pop	si
		pop	bp
		retf
sub_9E31		endp

; START OF FUNCTION CHUNK FOR sub_9E31
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_9E31

; ----------------------------------------------------------------------

sub_9E69		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		jmp	sub_2F3F7
sub_9E69		endp

; ----------------------------------------------------------------------

sub_9E75		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		nop
		nop
		jmp	sub_9E31
sub_9E75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E81		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9ED7
		mov	word ptr [si], 1467h
		push	si
		call	sub_47B9E
		add	sp, 2
		push	0
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_35D92
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_47C04
		add	sp, 4
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_9ED7
		push	si
sub_9E81		endp

; START OF FUNCTION CHUNK FOR sub_9E81
		db 9Ah
; END OF FUNCTION CHUNK FOR sub_9E81
seg015		ends
