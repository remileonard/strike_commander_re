seg037		segment	para public 'CODE' use16
		assume cs:seg037
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Ah, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15F84		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_15F9D
		mov	ax, [si+4]
		pop	di
		pop	si
		pop	bp
		retf
		jmp	short loc_15FA5

loc_15F9D:
		dec	word ptr [di]
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_15F84		endp

; START OF FUNCTION CHUNK FOR sub_15F84

loc_15FA5:
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_15F84

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15FA9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	word ptr [si+4]
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_15FCE
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf
		jmp	short loc_15FD6

loc_15FCE:
		inc	word ptr [di]
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_15FA9		endp

; START OF FUNCTION CHUNK FOR sub_15FA9

loc_15FD6:
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_15FA9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15FDA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si+8]
		jl	short loc_15FF7
		mov	ax, [si+8]
		sub	[di], ax
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf

loc_15FF7:
		mov	dx, [si+4]
		jmp	short loc_16001

loc_15FFC:
		add	dx, [si+0Ah]
		dec	word ptr [di]

loc_16001:
		cmp	word ptr [di], 0
		jg	short loc_15FFC
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
sub_15FDA		endp

; START OF FUNCTION CHUNK FOR sub_15FDA
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_15FDA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16010		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+4]
		mov	[bp+var_2], 0
		jmp	short loc_16046

loc_16025:
		push	di
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_1603B
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_1603B:
		mov	bx, [bp+arg_4]
		inc	word ptr [bx]
		inc	[bp+var_2]
		add	di, [si+0Ah]

loc_16046:
		mov	ax, [si+8]
		cmp	ax, [bp+var_2]
		jg	short loc_16025
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_16010		endp

; START OF FUNCTION CHUNK FOR sub_16010
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_16010

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16058		proc far

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	word ptr [si+6], 0
		jnz	short loc_16085
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_16289
		add	sp, 4
		cmp	ax, 0FFFFh
		jz	short loc_16085
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_16085:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	al, [bp+arg_4]
		mov	[bp+var_5], al
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_160CA
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 3416h
		mov	al, [bp+var_5]
		mov	[di+7], al
		push	[bp+var_4]
		call	CRT_Strdup
		add	sp, 2
		mov	[di+4], ax
		mov	byte ptr [di+6], 1
		mov	ax, di
		jmp	short loc_160CC

loc_160CA:
		mov	ax, di

loc_160CC:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_160E1
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4

loc_160E1:
		cmp	[bp+var_2], 0
		jz	short loc_160EC
		mov	ax, 1
		jmp	short loc_160EE

loc_160EC:
		xor	ax, ax

loc_160EE:
		pop	di
		pop	si
		leave
		retf
sub_16058		endp

; START OF FUNCTION CHUNK FOR sub_16058
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_16058

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_160F6		proc far

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
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_1615C
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 3416h
		mov	word ptr [di+4], 0
		mov	byte ptr [di+6], 0
		mov	word ptr [di], 340Ah
		mov	ax, [bp+var_6]
		mov	[di+8], ax
		mov	ax, [bp+var_8]
		mov	[di+0Ah], ax
		mov	ax, [bp+var_4]
		mov	[di+4], ax
		mov	byte ptr [di+6], 0
		mov	ax, di
		jmp	short loc_1615E

loc_1615C:
		mov	ax, di

loc_1615E:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_16173
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4

loc_16173:
		cmp	[bp+var_2], 0
		jz	short loc_1617E
		mov	ax, 1
		jmp	short loc_16180

loc_1617E:
		xor	ax, ax

loc_16180:
		pop	di
		pop	si
		leave
		retf
sub_160F6		endp

; START OF FUNCTION CHUNK FOR sub_160F6
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_160F6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16188		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_161C4

loc_1619D:
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_161C4
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_161C4:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_1619D
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_16188		endp

; START OF FUNCTION CHUNK FOR sub_16188
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_16188

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_161DF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_16223

loc_161F4:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jbe	short loc_16223
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_16223
		mov	bx, [bp+var_2]
		mov	al, [bx+7]
		pop	di
		pop	si
		leave
		retf

loc_16223:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_161F4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_161DF		endp

; START OF FUNCTION CHUNK FOR sub_161DF
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_161DF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1623E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1626E

loc_16250:
		lea	ax, [bp+arg_2]
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_1626E
		mov	ax, di
		pop	di
		pop	si
		leave
		retf

loc_1626E:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_16250
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_1623E		endp

; START OF FUNCTION CHUNK FOR sub_1623E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1623E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16289		proc far

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
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_162C1

loc_162A3:
		lea	ax, [bp+var_4]
		push	ax
		push	di
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_162C1
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf

loc_162C1:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_162A3
		mov	ax, 0FFFFh
		pop	di
		pop	si
		leave
		retf
sub_16289		endp

; START OF FUNCTION CHUNK FOR sub_16289
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_16289

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_162DD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_162DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_162E5		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [si+1Eh]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+1Eh]
		mov	di, ax
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp+var_4], ax
		push	si
		call	sub_143DD
		add	sp, 2
		mov	[bp+var_A], 0
		jmp	loc_163A3

loc_1631B:
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp+var_A]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		mov	ax, si
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_1623E
		add	sp, 4
		mov	[bp+var_E], ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_16355
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_E]
		jnz	short loc_16355
		mov	ax, word_4BC90
		mov	[bp+var_6], ax
		mov	ax, word_4BCAE
		mov	[bp+var_8], ax
		jmp	short loc_16361

loc_16355:
		mov	ax, word_4BCB8
		mov	[bp+var_6], ax
		mov	ax, word_4BCB2
		mov	[bp+var_8], ax

loc_16361:
		mov	al, byte ptr [bp+var_6]
		push	ax
		mov	ax, di
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	[bp+var_4]
		push	di
		push	[bp+var_2]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		cmp	[bp+var_E], 0
		jz	short loc_1639D
		push	word_4BD04
		push	[bp+var_8]
		push	[bp+var_E]
		push	di
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah

loc_1639D:
		inc	[bp+var_A]
		add	di, [si+20h]

loc_163A3:
		mov	ax, [si+30h]
		cmp	ax, [bp+var_A]
		jle	short loc_163AE
		jmp	loc_1631B

loc_163AE:
		mov	al, byte ptr word_4BCBA
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		mov	ax, [si+0Ah]
		dec	ax
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		mov	ax, [si+6]
		inc	ax
		push	ax
		push	word ptr [si+8]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_162E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1642F		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		sub	ax, [si+1Eh]
		cwd
		idiv	word ptr [si+20h]
		mov	di, ax
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, di
		mov	[bp+var_2], ax
		mov	ax, [si+22h]
		cmp	ax, [bp+var_2]
		jle	short loc_164BE
		mov	ax, [si+4]
		add	ax, [si+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		add	ax, [si+1Eh]
		push	ax
		mov	ax, di
		imul	word ptr [si+20h]
		pop	dx
		add	dx, ax
		mov	[bp+var_6], dx
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		add	ax, [si+20h]
		dec	ax
		mov	[bp+var_A], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_1623E
		add	sp, 4
		mov	[bp+var_C], ax
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_C]
		jnz	short loc_164AE
		mov	bx, [si+32h]
		mov	word ptr [bx], 1
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_164B4

loc_164AE:
		mov	ax, [bp+var_C]
		mov	[si+2Ch], ax

loc_164B4:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_164BE:
		pop	di
		pop	si
		leave
		retf
sub_1642F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_164C2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+83h], 0
		pop	si
		pop	bp
		retf
sub_164C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_164D2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+35h], 0
		jz	short loc_164E8
		push	si
		call	sub_12910
		add	sp, 2

loc_164E8:
		pop	si
		pop	bp
		retf
sub_164D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_164EB		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+79h], 0
		jz	short loc_1654F
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	di, ax
		push	word ptr [si+79h]
		call	sub_15E48
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [si+1Ah]
		sub	ax, di
		sub	ax, di
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_6]
		jge	short loc_16531
		mov	ax, [bp+var_6]
		sub	ax, [bp+var_4]
		sar	ax, 1
		add	di, ax

loc_16531:
		push	word_4BD04
		push	0FFFFh
		push	word ptr [si+79h]
		mov	ax, [si+6]
		add	ax, [bp+var_2]
		push	ax
		mov	ax, [si+4]
		add	ax, di
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah

loc_1654F:
		pop	di
		pop	si
		leave
		retf
sub_164EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16553		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_14D4C
		add	sp, 2
		cmp	word ptr [si+79h], 0
		jz	short loc_16571
		push	si
		push	cs
		call	near ptr sub_164EB
		add	sp, 2

loc_16571:
		push	si
		nop
		push	cs
		call	near ptr sub_168DE
		add	sp, 2
		push	si
		call	sub_122DE
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_16553		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16586		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		jmp	short loc_1659E

loc_16593:
		push	1
		push	si
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_1659E:
		cmp	word ptr [si+7Bh], 0
		jz	short loc_16593
		mov	bx, [si+83h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_165C9
		mov	bx, [si+83h]
		push	word ptr [bx+2Ch]
		push	di
		call	CRT_Strcpy
		add	sp, 4
		push	di
		call	CRT_Strupr_2E71
		add	sp, 2
		jmp	short loc_165CC

loc_165C9:
		mov	byte ptr [di], 0

loc_165CC:
		pop	di
		pop	si
		pop	bp
		retf
sub_16586		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_165D0		proc far

var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
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
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	GaugeWidget_AllocateRenderBufferWrapper_129FD
		add	sp, 2
		mov	[bp+var_A], 2
		mov	[bp+var_C], 0Ah
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp+var_E], ax
		mov	ax, [si+1Ch]
		add	ax, 0FFE2h
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_C]
		add	ax, [bp+var_10]
		add	ax, 8
		mov	[bp+var_14], ax
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp+var_16], ax
		mov	ax, [si+1Ch]
		sub	ax, [bp+var_14]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_A]
		add	ax, 0Bh
		mov	[bp+var_2], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_E]
		add	ax, 0FFF5h
		mov	[bp+var_6], ax
		mov	ax, [bp+var_8]
		add	ax, 0FFFEh
		mov	bx, 8
		cwd
		idiv	bx
		mov	[si+75h], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_20], ax
		mov	ax, [si+75h]
		mov	[bp+var_22], ax
		mov	ax, si
		add	ax, 73h
		mov	[bp+var_24], ax
		mov	ax, si
		add	ax, 7Bh
		mov	[bp+var_26], ax
		push	34h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_166EE
		push	[bp+var_20]
		push	[bp+var_1E]
		push	[bp+var_1C]
		push	[bp+var_1A]
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A4h
		mov	word ptr [di+24h], 1E4h
		xor	ax, ax
		mov	[di+28h], ax
		mov	[di+26h], ax
		mov	word ptr [di+24h], 7A0h
		mov	word ptr [di+2Ah], 0
		mov	word ptr [di+2Ch], 0
		and	byte ptr [di+10h], 0FDh
		mov	word ptr [di+16h], 0
		mov	ax, [bp+var_22]
		mov	[di+30h], ax
		mov	ax, [bp+var_26]
		mov	[di+32h], ax
		mov	ax, [bp+var_24]
		mov	[di+2Eh], ax
		mov	word ptr [di+1Eh], 2
		mov	word ptr [di+20h], 8
		mov	ax, di
		jmp	short loc_166F0

loc_166EE:
		mov	ax, di

loc_166F0:
		mov	[si+83h], ax
		push	0
		push	word ptr [si+83h]
		push	si
		call	sub_12B45
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0Bh
		mov	ax, [bp+var_10]
		mov	[bp+var_8], ax
		push	0
		mov	ax, [bp+var_2]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_2C], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_2E], ax
		push	58h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jz	short loc_1679B
		push	[bp+var_2E]
		push	[bp+var_2C]
		push	[bp+var_2A]
		push	[bp+var_28]
		push	[bp+var_30]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 3392h
		push	[bp+var_30]
		call	sub_134F0
		add	sp, 2
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 33CEh
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+1Eh], 1
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_2C]
		mov	[bx+1Fh], ax
		mov	bx, [bp+var_30]
		mov	ax, [bx+1Fh]
		add	ax, 0FFFEh
		mov	bx, [bp+var_30]
		mov	[bx+45h], ax
		mov	ax, [bp+var_30]
		jmp	short loc_1679E

loc_1679B:
		mov	ax, [bp+var_30]

loc_1679E:
		mov	[si+7Dh], ax
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		push	word ptr [si+83h]
		mov	ax, si
		add	ax, 73h
		push	ax
		push	word ptr [si+75h]
		push	word ptr [si+77h]
		push	word ptr [si+7Dh]
		mov	bx, [si+7Dh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	ax, [bp+var_12]
		add	ax, [bp+var_16]
		add	ax, 0FFE7h
		mov	[bp+var_2], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 18h
		mov	[bp+var_8], 0Ah
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_167F2
		jmp	loc_168AC

loc_167F2:
		push	1
		mov	ax, [bp+var_2]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_36], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_38], ax
		mov	ax, si
		add	ax, 7Bh
		mov	[bp+var_3A], ax
		push	2Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3C], ax
		or	ax, ax
		jz	short loc_1689F
		push	[bp+var_38]
		push	[bp+var_36]
		push	[bp+var_34]
		push	[bp+var_32]
		push	[bp+var_3C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 332Ah
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+24h], 0
		push	3326h
		push	[bp+var_3C]
		call	sub_15ABF
		add	sp, 4
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+1Eh], 0
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+20h], 0
		mov	bx, [bp+var_3C]
		mov	ax, word_4BCB2
		mov	[bx+28h], ax
		mov	bx, [bp+var_3C]
		mov	[bx+26h], ax
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+22h], 0FFFFh
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 335Eh
		mov	bx, [bp+var_3C]
		mov	ax, [bp+var_3A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+2Ch], 1
		mov	ax, [bp+var_3C]
		jmp	short loc_168A2

loc_1689F:
		mov	ax, [bp+var_3C]

loc_168A2:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6

loc_168AC:
		pop	di
		pop	si
		leave
		retf
sub_165D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_168B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+83h]
		mov	ax, si
		add	ax, 73h
		push	ax
		push	word ptr [si+75h]
		push	word ptr [si+77h]
		push	word ptr [si+7Dh]
		mov	bx, [si+7Dh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_168B0		endp

; START OF FUNCTION CHUNK FOR sub_168B0
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_168B0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_168DE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+83h], 0
		jz	short loc_168FD
		push	word ptr [si+83h]
		mov	bx, [si+83h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_168FD:
		pop	si
		pop	bp
		retf
sub_168DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16900		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_16058
		add	sp, 6
		or	al, al
		jz	short loc_16925
		inc	word ptr [si+77h]

loc_16925:
		mov	ax, [si+77h]
		mov	[bp+var_2], ax
		mov	bx, [si+83h]
		mov	ax, [bp+var_2]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_168B0
		add	sp, 2
		pop	si
		leave
		retf
sub_16900		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16940		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_16188
		add	sp, 4
		or	al, al
		jz	short loc_16963
		dec	word ptr [si+77h]

loc_16963:
		mov	ax, [si+77h]
		mov	[bp+var_2], ax
		mov	bx, [si+83h]
		mov	ax, [bp+var_2]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_168B0
		add	sp, 2
		pop	si
		leave
		retf
sub_16940		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1697E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	[bp+arg_6]
		push	di
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_160F6
		add	sp, 8
		or	al, al
		jz	short loc_169A9
		add	[si+77h], di

loc_169A9:
		mov	ax, [si+77h]
		mov	[bp+var_2], ax
		mov	bx, [si+83h]
		mov	ax, [bp+var_2]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_168B0
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_1697E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_169C5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+83h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_16289
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_169C5		endp

; START OF FUNCTION CHUNK FOR sub_169C5
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_169C5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_169E4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16A20
		mov	word ptr [si+0Eh], 332Ah
		push	word ptr [si+24h]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_16A20
		push	si
		call	sub_39C
		add	sp, 2

loc_16A20:
		pop	di
		pop	si
		pop	bp
		retf
sub_169E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16A24		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16A64
		mov	word ptr [si+0Eh], 332Ah
		push	word ptr [si+24h]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_16A62
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_16A62

loc_16A62:
		jmp	short loc_16A64

loc_16A64:
		pop	di
		pop	si
		pop	bp
		retf
sub_16A24		endp

; START OF FUNCTION CHUNK FOR sub_16A24
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_16A24

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16A6C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16A97
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_16A95
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_16A95

loc_16A95:
		jmp	short loc_16A97

loc_16A97:
		pop	di
		pop	si
		pop	bp
		retf
sub_16A6C		endp

; START OF FUNCTION CHUNK FOR sub_16A6C
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_16A6C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16A9F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16ACA
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_16AC8
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_16AC8

loc_16AC8:
		jmp	short loc_16ACA

loc_16ACA:
		pop	di
		pop	si
		pop	bp
		retf
sub_16A9F		endp

; START OF FUNCTION CHUNK FOR sub_16A9F
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_16A9F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16AD2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16B10
		mov	word ptr [si], 340Ah
		mov	word ptr [si], 3416h
		cmp	byte ptr [si+6], 0
		jz	short loc_16AFC
		push	word ptr [si+4]
		call	sub_39C
		add	sp, 2
		jmp	short loc_16AFC

loc_16AFC:
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_16B10
		push	si
		call	sub_39C
		add	sp, 2

loc_16B10:
		pop	di
		pop	si
		pop	bp
		retf
sub_16AD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16B14		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16B4E
		mov	word ptr [si], 3416h
		cmp	byte ptr [si+6], 0
		jz	short loc_16B3A
		push	word ptr [si+4]
		call	sub_39C
		add	sp, 2
		jmp	short loc_16B3A

loc_16B3A:
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_16B4E
		push	si
		call	sub_39C
		add	sp, 2

loc_16B4E:
		pop	di
		pop	si
sub_16B14		endp
seg037		ends
