seg040		segment	para public 'CODE' use16
		assume cs:seg040
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C8h, 67h, 9Ah, 57h, 2, 7Dh, 35h, 83h, 0C4h, 2, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1896C		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_C]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], al
		pop	bp
		retf
sub_1896C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18997		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_C]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		pop	bp
		retf
sub_18997		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_189C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_189F1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_189F1
		mov	al, 1
		jmp	short loc_189F3

loc_189F1:
		mov	al, 0

loc_189F3:
		pop	bp
		retf
sub_189C0		endp

; START OF FUNCTION CHUNK FOR sub_189C0
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_189C0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_189F7		proc far

var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_28], eax
		mov	eax, es:[si+4]
		mov	[bp+var_24], eax
		mov	eax, es:[si+8]
		mov	[bp+var_20], eax
		lea	ax, word ptr [bp+var_28]
		add	ax, 4
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 4
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	di, [bp+var_A]
		mov	eax, es:[di]
		mov	[bp+var_34], eax
		mov	eax, es:[di+4]
		mov	[bp+var_30], eax
		mov	eax, es:[di+8]
		mov	[bp+var_2C], eax
		lea	ax, word ptr [bp+var_34]
		add	ax, 4
		mov	[bp+var_C], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	bx, [bp+var_C]
		add	eax, [bx]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		sar	eax, 1
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	dword_4F22E, eax
		mov	eax, dword_4F22E
		sar	eax, 8
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_189F7		endp

; START OF FUNCTION CHUNK FOR sub_189F7
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_189F7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18ABB		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_18ABB		endp

; START OF FUNCTION CHUNK FOR sub_18ABB
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18ABB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18AC4		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_18AC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18AC9		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		les	si, [bp+arg_0]
		mov	es:[si+8], dx
		mov	es:[si+6], bx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		les	si, [bp+arg_0]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		pop	si
		pop	bp
		retf
sub_18AC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18B46		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		mov	al, [bp+var_1]
		leave
		retf
sub_18B46		endp

; START OF FUNCTION CHUNK FOR sub_18B46
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_18B46

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18B57		proc far

var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+2]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		call	sub_2201D
		add	sp, 8
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ch]
		push	word ptr es:[bx+0Ah]
		call	sub_2201D
		add	sp, 8
		mov	[bp+var_5], 0
		cmp	byte_4C120, 0
		jnz	short loc_18BB5
		jmp	loc_18C63

loc_18BB5:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	si, [bp+var_A]
		mov	eax, es:[si]
		mov	[bp+var_4E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_4A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_46], eax
		lea	ax, word ptr [bp+var_4E]
		add	ax, 4
		mov	[bp+var_C], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 4
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	di, [bp+var_10]
		mov	eax, es:[di]
		mov	[bp+var_5A], eax
		mov	eax, es:[di+4]
		mov	[bp+var_56], eax
		mov	eax, es:[di+8]
		mov	[bp+var_52], eax
		lea	ax, word ptr [bp+var_5A]
		add	ax, 4
		mov	[bp+var_12], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	bx, [bp+var_12]
		add	eax, [bx]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		sar	eax, 1
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	dword_4F22E, eax
		mov	[bp+var_5], 1
		jmp	loc_18D85

loc_18C63:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_18C91
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_18C91
		mov	al, 1
		jmp	short loc_18C93

loc_18C91:
		mov	al, 0

loc_18C93:
		mov	ah, 0
		or	ax, ax
		jz	short loc_18C9C
		jmp	loc_18D85

loc_18C9C:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		call	sub_22218
		add	sp, 4
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ch]
		push	word ptr es:[bx+0Ah]
		call	sub_22218
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+6]
		add	dx, 4
		mov	[bp+var_24], ax
		mov	[bp+var_26], dx
		les	ax, [bp+var_26]
		mov	[bp+var_28], ax
		mov	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_66], eax
		mov	bx, [bp+var_28]
		mov	eax, es:[bx+4]
		mov	[bp+var_62], eax
		mov	bx, [bp+var_28]
		mov	eax, es:[bx+8]
		mov	[bp+var_5E], eax
		lea	ax, word ptr [bp+var_66]
		add	ax, 4
		mov	[bp+var_2A], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 4
		mov	[bp+var_2C], ax
		mov	[bp+var_2E], dx
		les	ax, [bp+var_2E]
		mov	[bp+var_30], ax
		mov	bx, [bp+var_30]
		mov	eax, es:[bx]
		mov	[bp+var_72], eax
		mov	bx, [bp+var_30]
		mov	eax, es:[bx+4]
		mov	[bp+var_6E], eax
		mov	bx, [bp+var_30]
		mov	eax, es:[bx+8]
		mov	[bp+var_6A], eax
		lea	ax, word ptr [bp+var_72]
		add	ax, 4
		mov	[bp+var_32], ax
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	bx, [bp+var_32]
		add	eax, [bx]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		sar	eax, 1
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	dword_4F22E, eax
		mov	[bp+var_5], 1

loc_18D85:
		mov	al, [bp+var_5]
		pop	di
		pop	si
		leave
		retf
sub_18B57		endp

; START OF FUNCTION CHUNK FOR sub_18B57
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_18B57

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18D90		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_18DB1
		push	32h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_18E1B

loc_18DB1:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D0h
		mov	eax, dword_4F22E
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+6]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax

loc_18E1B:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_18D90		endp

; START OF FUNCTION CHUNK FOR sub_18D90
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_18D90

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E25		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1896C
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], al
		pop	bp
		retf
sub_18E25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18E57		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0Ah], 0
		jz	short loc_18E92
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Bh]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1F7D5
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		jmp	short loc_18EA0

loc_18E92:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Bh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al

loc_18EA0:
		leave
		retf
sub_18E57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18EA2		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_18EA2		endp

; START OF FUNCTION CHUNK FOR sub_18EA2
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18EA2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18EAB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_18EC4
		add	sp, 8
		pop	bp
		retf
sub_18EAB		endp

; START OF FUNCTION CHUNK FOR sub_18EAB
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18EAB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18EC4		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_18EE2
		push	32h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_18F1D

loc_18EE2:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_18D90
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35CCh
		les	bx, [bp+arg_4]
		mov	al, es:[bx+0Eh]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+0Eh]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], ax

loc_18F1D:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_18EC4		endp

; START OF FUNCTION CHUNK FOR sub_18EC4
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18EC4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F27		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Ch]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		push	word_4D36C
		call	sub_37F22
		add	sp, 0Ch
		pop	bp
		retf
sub_18F27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F5C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1896C
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		cbw
		push	ax
		push	68AEh
		call	sub_2391D
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], dx
		mov	es:[bx+0Bh], ax
		pop	bp
		retf
sub_18F5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F9F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_18997
		add	sp, 10h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+0Bh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], eax
		leave
		retf
sub_18F9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18FDE		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_18FDE		endp

; START OF FUNCTION CHUNK FOR sub_18FDE
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18FDE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18FE7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_19000
		add	sp, 8
		pop	bp
		retf
sub_18FE7		endp

; START OF FUNCTION CHUNK FOR sub_18FE7
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_18FE7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19000		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_19021
		push	36h
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_19068

loc_19021:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_18D90
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35C8h
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+0Bh]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], eax
		les	bx, word ptr [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+20h], ax
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax

loc_19068:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_19000		endp

; START OF FUNCTION CHUNK FOR sub_19000
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_19000

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19072		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_19072		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19077		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1896C
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], al
		les	bx, [bp+arg_C]
		mov	al, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], al
		pop	bp
		retf
sub_19077		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_190B7		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0Ah], 0
		jz	short loc_1910F
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Bh]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1F7D5
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Ch]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1F7D5
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al
		jmp	short loc_1912B

loc_1910F:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Bh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+0Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al

loc_1912B:
		leave
		retf
sub_190B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1912D		proc far
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
sub_1912D		endp

; START OF FUNCTION CHUNK FOR sub_1912D
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1912D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19136		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	0
		nop
		push	cs
		call	near ptr sub_1914F
		add	sp, 8
		pop	bp
		retf
sub_19136		endp

; START OF FUNCTION CHUNK FOR sub_19136
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_19136

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1914F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_19170
		push	3Ch
		call	sub_226FE
		add	sp, 2
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_191E0

loc_19170:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35D0h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35CCh
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 35C4h
		mov	eax, dword_4F22E
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+6]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], eax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+0Ah]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+38h], eax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+0Eh]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+32h], al
		les	bx, [bp+arg_4]
		mov	al, es:[bx+0Fh]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+33h], al

loc_191E0:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_1914F		endp

; START OF FUNCTION CHUNK FOR sub_1914F
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1914F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_191EA		proc far

var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8Eh
		push	si
		push	di
		mov	eax, dword_4F158
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shl	eax, 1
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+34h]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+38h]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 4
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_40], eax
		mov	eax, es:[si+4]
		mov	[bp+var_3C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 4
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	di, [bp+var_1C]
		mov	eax, es:[di]
		mov	[bp+var_4C], eax
		mov	eax, es:[di+4]
		mov	[bp+var_48], eax
		mov	eax, es:[di+8]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		or	eax, eax
		jge	short loc_19292
		neg	eax

loc_19292:
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		or	eax, eax
		jge	short loc_192B2
		neg	eax

loc_192B2:
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_4]
		jge	short loc_192D5
		mov	ax, 1
		jmp	short loc_192D7

loc_192D5:
		xor	ax, ax

loc_192D7:
		or	al, al
		jnz	short loc_192F3
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_4]
		jge	short loc_192EA
		mov	ax, 1
		jmp	short loc_192EC

loc_192EA:
		xor	ax, ax

loc_192EC:
		or	al, al
		jnz	short loc_192F3
		jmp	loc_193B9

loc_192F3:
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx]
		mov	[bp+var_8E], ax
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+2]
		mov	[bp+var_8C], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp+var_8A], ax
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx]
		mov	[bp+var_78], ax
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+2]
		mov	[bp+var_76], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+33h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp+var_74], ax
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_18]
		jge	short loc_19349
		mov	ax, 1
		jmp	short loc_1934B

loc_19349:
		xor	ax, ax

loc_1934B:
		or	al, al
		jz	short loc_19379
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx]
		add	ax, 0FFFCh
		mov	[bp+var_62], ax
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+2]
		add	ax, 0FFFCh
		mov	[bp+var_60], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp+var_5E], ax
		jmp	short loc_193A1

loc_19379:
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx]
		add	ax, 0FFFCh
		mov	[bp+var_62], ax
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+2]
		add	ax, 0FFFCh
		mov	[bp+var_60], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+33h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp+var_5E], ax

loc_193A1:
		push	ss
		lea	ax, [bp+var_8E]
		push	ax
		push	3
		push	word_4D36C
		call	sub_2C957
		add	sp, 8
		pop	di
		pop	si
		leave
		retf

loc_193B9:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+33h]
		mov	ah, 0
		push	ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		push	ax
		les	bx, word ptr [bp+var_C]
		push	word ptr es:[bx+2]
		les	bx, word ptr [bp+var_C]
		push	word ptr es:[bx]
		les	bx, word ptr [bp+var_8]
		push	word ptr es:[bx+2]
		les	bx, word ptr [bp+var_8]
		push	word ptr es:[bx]
		push	word_4D36C
		call	sub_1B40C
sub_191EA		endp
seg040		ends
