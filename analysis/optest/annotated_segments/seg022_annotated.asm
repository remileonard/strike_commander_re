seg022		segment	byte public 'CODE' use16
		assume cs:seg022
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E96C	proc far		; CODE XREF: seg025:0778P
					; DATA XREF: seg170:016Eo

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2Dh], 0
		mov	word ptr [si+54h], 0
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		mov	al, byte ptr word_45B08
		mov	[si+51h], al
		mov	al, byte ptr word_45B0A
		mov	[si+52h], al
		mov	al, byte ptr word_45B04
		mov	[si+53h], al
		mov	al, byte ptr word_45B06
		mov	[si+4Fh], al
		mov	al, byte ptr word_45B00
		mov	[si+50h], al
		mov	word ptr [si+1Fh], 0Bh
		mov	word ptr [si+21h], 8
		mov	ax, [si+1Fh]
		add	ax, 0FFFEh
		mov	[si+45h], ax
		mov	ax, [si+21h]
		add	ax, 0FFFEh
		mov	[si+47h], ax
		pop	si
		pop	bp
		retf
sub_E96C	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		imul	word ptr [si+39h]
		mov	dx, [si+2Bh]
		sar	dx, 1
		add	ax, dx
		cwd
		idiv	word ptr [si+2Bh]
		mov	cx, ax
		or	cx, cx
		jge	short loc_E9E9
		xor	cx, cx

loc_E9E9:				; CODE XREF: seg022:0085j
		cmp	[si+2Fh], cx
		jge	short loc_E9F1
		mov	cx, [si+2Fh]

loc_E9F1:				; CODE XREF: seg022:008Cj
		mov	bx, [si+2Dh]
		mov	[bx], cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E9F9	proc far		; CODE XREF: seg022:0325p seg022:0372p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		add	ax, [bp+arg_2]
		mov	dx, ax
		or	dx, dx
		jge	short loc_EA10
		xor	dx, dx

loc_EA10:				; CODE XREF: sub_E9F9+13j
		cmp	[si+2Fh], dx
		jge	short loc_EA18
		mov	dx, [si+2Fh]

loc_EA18:				; CODE XREF: sub_E9F9+1Aj
		mov	bx, [si+2Dh]
		mov	[bx], dx
		pop	si
		pop	bp
		retf
sub_E9F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_EA20	proc far		; CODE XREF: seg022:02BEp seg022:0445p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	di, di
		cmp	word ptr [si+2Dh], 0
		jz	short loc_EA93
		cmp	word ptr [si+39h], 0
		jz	short loc_EA93
		mov	ax, [si+2Bh]
		add	ax, 0FFFEh
		mov	[bp+var_2], ax
		movsx	eax, word ptr [si+39h]
		mov	[bp+var_6], eax
		or	cx, cx
		jge	short loc_EA56
		xor	cx, cx
		jmp	short loc_EA68
; ���������������������������������������������������������������������������

loc_EA56:				; CODE XREF: sub_EA20+30j
		mov	ax, [bp+var_2]
		sub	ax, [si+56h]
		cmp	ax, cx
		jge	short loc_EA68
		mov	ax, [bp+var_2]
		sub	ax, [si+56h]
		mov	cx, ax

loc_EA68:				; CODE XREF: sub_EA20+34j sub_EA20+3Ej
		movsx	eax, cx
		imul	eax, [bp+var_6]
		push	eax
		mov	ax, [bp+var_2]
		cwd
		sub	ax, dx
		sar	ax, 1
		movsx	eax, ax
		mov	edx, eax
		pop	eax
		add	eax, edx
		movsx	ebx, [bp+var_2]
		cdq
		idiv	ebx
		mov	di, ax

loc_EA93:				; CODE XREF: sub_EA20+14j sub_EA20+1Aj
		cmp	[si+2Fh], di
		jge	short loc_EA9B
		mov	di, [si+2Fh]

loc_EA9B:				; CODE XREF: sub_EA20+76j
		mov	bx, [si+2Dh]
		mov	[bx], di
		pop	di
		pop	si
		leave
		retf
sub_EA20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_EAA4	proc far		; CODE XREF: seg022:0695p seg022:0911p ...

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		xor	cx, cx
		cmp	word ptr [si+2Dh], 0
		jz	short loc_EAF1
		cmp	word ptr [si+39h], 1
		jle	short loc_EAF1
		mov	ax, [si+2Bh]
		add	ax, 0FFFEh
		mov	[bp+var_2], ax
		mov	bx, [si+2Dh]
		movsx	eax, word ptr [bx]
		mov	[bp+var_6], eax
		movsx	eax, [bp+var_2]
		push	eax
		mov	eax, [bp+var_6]
		pop	edx
		imul	eax, edx
		movsx	ebx, word ptr [si+39h]
		cdq
		idiv	ebx
		mov	dx, cx
		add	dx, ax
		mov	cx, dx

loc_EAF1:				; CODE XREF: sub_EAA4+10j sub_EAA4+16j
		mov	ax, cx
		pop	si
		leave
		retf
sub_EAA4	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_EAF9:				; DATA XREF: dseg:2BAAo dseg:2BE6o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		add	[si+23h], di
		mov	ax, [bp+0Ah]
		add	[si+25h], ax
		add	[si+27h], di
		mov	ax, [bp+0Ah]
		add	[si+29h], ax
		add	[si+31h], di
		mov	ax, [bp+0Ah]
		add	[si+33h], ax
		add	[si+35h], di
		mov	ax, [bp+0Ah]
		add	[si+37h], ax
		add	[si+3Dh], di
		mov	ax, [bp+0Ah]
		add	[si+3Fh], ax
		add	[si+41h], di
		mov	ax, [bp+0Ah]
		add	[si+43h], ax
		push	word ptr [bp+0Ah]
		push	di
		push	si
		call	Widget_TranslateBounds_F8B4
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_EB4B	proc far		; CODE XREF: seg022:02D0p seg022:0461p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+54h], 0
		jz	short loc_EB7F
		push	si
		call	sub_F859
		add	sp, 2
		push	0FFFFh
		push	0FFFFh
		push	1
		push	word ptr [si+54h]
		mov	bx, [si+54h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		push	si
		call	sub_F878
		add	sp, 2

loc_EB7F:				; CODE XREF: sub_EB4B+Bj
		pop	si
		pop	bp
		retf
sub_EB4B	endp

; ���������������������������������������������������������������������������

loc_EB82:				; DATA XREF: dseg:2BCAo dseg:2C06o
		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+2Dh], 0
		jnz	short loc_EB97
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_EB97:				; CODE XREF: seg022:0231j
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		mov	[bp-6],	ax
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		mov	ax, [si+4]
		add	ax, [bp+8]
		mov	[bp-0Ch], ax
		mov	ax, [si+6]
		add	ax, [bp+0Ah]
		mov	[bp-0Eh], ax
		mov	ax, [bp-0Ch]
		mov	[bp-0Ah], ax
		mov	ax, [bp-0Eh]
		mov	[bp-8],	ax
		push	si
		call	sub_F878
		add	sp, 2

loc_EBD5:				; CODE XREF: seg022:04DEj
		cmp	word ptr [si+4Dh], 0
		jz	short loc_EC41
		mov	di, 0FFFFh
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_EBFE
		mov	ax, [bp-0Ah]
		sub	ax, [bp-2]
		sub	ax, [si+3Dh]
		mov	di, ax
		mov	ax, [si+41h]
		sub	ax, [si+3Dh]
		cmp	ax, di
		jnz	short loc_EBFC
		mov	di, 0FFFFh

loc_EBFC:				; CODE XREF: seg022:0297j
		jmp	short loc_EC16
; ���������������������������������������������������������������������������

loc_EBFE:				; CODE XREF: seg022:0282j
		mov	ax, [bp-8]
		sub	ax, [bp-4]
		sub	ax, [si+3Fh]
		mov	di, ax
		mov	ax, [si+43h]
		sub	ax, [si+3Fh]
		cmp	ax, di
		jnz	short loc_EC16
		mov	di, 0FFFFh

loc_EC16:				; CODE XREF: seg022:loc_EBFCj
					; seg022:02B1j
		cmp	di, 0FFFFh
		jz	short loc_EC3E
		push	di
		push	si
		push	cs
		call	near ptr sub_EA20
		add	sp, 4
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_EB4B
		add	sp, 2
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		mov	[bp-6],	ax

loc_EC3E:				; CODE XREF: seg022:02B9j
		jmp	loc_EDCF
; ���������������������������������������������������������������������������

loc_EC41:				; CODE XREF: seg022:0279j
		mov	ax, [si+31h]
		cmp	ax, [bp-0Ah]
		jg	short loc_EC6C
		mov	ax, [si+31h]
		add	ax, [si+1Fh]
		cmp	ax, [bp-0Ah]
		jle	short loc_EC6C
		mov	ax, [si+33h]
		cmp	ax, [bp-8]
		jg	short loc_EC6C
		mov	ax, [si+33h]
		add	ax, [si+21h]
		cmp	ax, [bp-8]
		jle	short loc_EC6C
		mov	ax, 1
		jmp	short loc_EC6E
; ���������������������������������������������������������������������������

loc_EC6C:				; CODE XREF: seg022:02E7j seg022:02F2j ...
		xor	ax, ax

loc_EC6E:				; CODE XREF: seg022:030Aj
		or	ax, ax
		jz	short loc_EC8E
		mov	word ptr [si+49h], 1
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		push	0FFFFh
		push	si
		push	cs
		call	near ptr sub_E9F9
		add	sp, 4
		jmp	loc_EDAB
; ���������������������������������������������������������������������������

loc_EC8E:				; CODE XREF: seg022:0310j
		mov	ax, [si+35h]
		cmp	ax, [bp-0Ah]
		jg	short loc_ECB9
		mov	ax, [si+35h]
		add	ax, [si+1Fh]
		cmp	ax, [bp-0Ah]
		jle	short loc_ECB9
		mov	ax, [si+37h]
		cmp	ax, [bp-8]
		jg	short loc_ECB9
		mov	ax, [si+37h]
		add	ax, [si+21h]
		cmp	ax, [bp-8]
		jle	short loc_ECB9
		mov	ax, 1
		jmp	short loc_ECBB
; ���������������������������������������������������������������������������

loc_ECB9:				; CODE XREF: seg022:0334j seg022:033Fj ...
		xor	ax, ax

loc_ECBB:				; CODE XREF: seg022:0357j
		or	ax, ax
		jz	short loc_ECDB
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 1
		mov	word ptr [si+4Dh], 0
		push	1
		push	si
		push	cs
		call	near ptr sub_E9F9
		add	sp, 4
		jmp	loc_EDAB
; ���������������������������������������������������������������������������

loc_ECDB:				; CODE XREF: seg022:035Dj
		mov	ax, [si+23h]
		cmp	ax, [bp-0Ah]
		jg	short loc_ED0E
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		add	ax, [si+23h]
		inc	ax
		cmp	ax, [bp-0Ah]
		jle	short loc_ED0E
		mov	ax, [si+25h]
		cmp	ax, [bp-8]
		jg	short loc_ED0E
		mov	ax, [si+29h]
		sub	ax, [si+25h]
		add	ax, [si+25h]
		inc	ax
		cmp	ax, [bp-8]
		jle	short loc_ED0E
		mov	ax, 1
		jmp	short loc_ED10
; ���������������������������������������������������������������������������

loc_ED0E:				; CODE XREF: seg022:0381j seg022:0390j ...
		xor	ax, ax

loc_ED10:				; CODE XREF: seg022:03ACj
		or	ax, ax
		jnz	short loc_ED17
		jmp	loc_EDAB
; ���������������������������������������������������������������������������

loc_ED17:				; CODE XREF: seg022:03B2j
		mov	ax, [si+41h]
		cmp	ax, [bp-0Ah]
		jg	short loc_ED42
		mov	ax, [si+41h]
		add	ax, [si+45h]
		cmp	ax, [bp-0Ah]
		jle	short loc_ED42
		mov	ax, [si+43h]
		cmp	ax, [bp-8]
		jg	short loc_ED42
		mov	ax, [si+43h]
		add	ax, [si+47h]
		cmp	ax, [bp-8]
		jle	short loc_ED42
		mov	ax, 1
		jmp	short loc_ED44
; ���������������������������������������������������������������������������

loc_ED42:				; CODE XREF: seg022:03BDj seg022:03C8j ...
		xor	ax, ax

loc_ED44:				; CODE XREF: seg022:03E0j
		or	ax, ax
		jz	short loc_ED75
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 1
		mov	ax, [bp-0Ah]
		sub	ax, [si+41h]
		mov	[bp-2],	ax
		mov	ax, [bp-8]
		sub	ax, [si+43h]
		mov	[bp-4],	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		jmp	short loc_EDAB
; ���������������������������������������������������������������������������

loc_ED75:				; CODE XREF: seg022:03E6j
		mov	word ptr [si+49h], 0
		mov	word ptr [si+4Bh], 0
		mov	word ptr [si+4Dh], 0
		xor	di, di
		cmp	byte ptr [si+1Eh], 0
		jnz	short loc_ED94
		mov	ax, [bp-0Ah]
		sub	ax, [si+3Dh]
		mov	di, ax

loc_ED94:				; CODE XREF: seg022:042Aj
		cmp	byte ptr [si+1Eh], 1
		jnz	short loc_EDA2
		mov	ax, [bp-8]
		sub	ax, [si+3Fh]
		mov	di, ax

loc_EDA2:				; CODE XREF: seg022:0438j
		push	di
		push	si
		push	cs
		call	near ptr sub_EA20
		add	sp, 4

loc_EDAB:				; CODE XREF: seg022:032Bj seg022:0378j ...
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		cmp	ax, [bp-6]
		jz	short loc_EDCF
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_EB4B
		add	sp, 2
		mov	bx, [si+2Dh]
		mov	ax, [bx]
		mov	[bp-6],	ax

loc_EDCF:				; CODE XREF: seg022:loc_EC3Ej
					; seg022:0453j
		mov	dword ptr [bp-12h], 0
		jmp	short loc_EDDD
; ���������������������������������������������������������������������������

loc_EDD9:				; CODE XREF: seg022:0485j
		inc	dword ptr [bp-12h]

loc_EDDD:				; CODE XREF: seg022:0477j
		cmp	dword ptr [bp-12h], 2710h
		jl	short loc_EDD9
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_EE1D
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EE1B
		lea	ax, [bp-16h]
		push	ax
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_EE1B:				; CODE XREF: seg022:04A8j
		jmp	short $+2

loc_EE1D:				; CODE XREF: seg022:0497j
		mov	al, byte_48F78
		mov	ah, 0
		or	ax, ax
		jz	short loc_EE34
		mov	ax, word_48F7A
		sar	ax, 1
		mov	[bp-0Ah], ax
		mov	ax, word_48F7C
		mov	[bp-8],	ax

loc_EE34:				; CODE XREF: seg022:04C4j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_EE41
		jmp	loc_EBD5
; ���������������������������������������������������������������������������

loc_EE41:				; CODE XREF: seg022:04DCj
		cmp	word ptr [si+49h], 0
		jnz	short loc_EE53
		cmp	word ptr [si+4Bh], 0
		jnz	short loc_EE53
		cmp	word ptr [si+4Dh], 0
		jz	short loc_EE68

loc_EE53:				; CODE XREF: seg022:04E5j seg022:04EBj
		xor	ax, ax
		mov	[si+4Dh], ax
		mov	[si+4Bh], ax
		mov	[si+49h], ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2

loc_EE68:				; CODE XREF: seg022:04F1j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_EE6C	proc far		; CODE XREF: sub_EF42+6Cp sub_F3CD+6Cp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_6]
		mov	[si+2Bh], di
		mov	[si+39h], cx
		mov	ax, [bp+arg_4]
		mov	[si+3Bh], ax
		mov	ax, di
		add	ax, 0FFFEh
		movsx	eax, ax
		mov	[bp+var_4], eax
		or	cx, cx
		jz	short loc_EEB3
		movsx	eax, word ptr [si+3Bh]
		imul	eax, [bp+var_4]
		movsx	ebx, word ptr [si+39h]
		cdq
		idiv	ebx
		mov	[si+56h], ax
		jmp	short loc_EEB9
; ���������������������������������������������������������������������������

loc_EEB3:				; CODE XREF: sub_EE6C+2Cj
		mov	ax, word ptr [bp+var_4]
		mov	[si+56h], ax

loc_EEB9:				; CODE XREF: sub_EE6C+45j
		mov	ax, [si+39h]
		sub	ax, [si+3Bh]
		mov	[si+2Fh], ax
		movsx	eax, word ptr [si+56h]
		mov	edx, [bp+var_4]
		sub	edx, eax
		mov	[bp+var_8], edx
		movsx	eax, word ptr [si+39h]
		push	eax
		mov	eax, [bp+var_8]
		pop	edx
		imul	eax, edx
		cdq
		idiv	[bp+var_4]
		mov	[si+2Fh], ax
		pop	di
		pop	si
		leave
		retf
sub_EE6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_EEF0	proc far		; CODE XREF: seg022:089Dp seg022:08C8p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	1
		push	1
		push	1
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		call	sub_10359
		add	sp, 10h
		push	[bp+arg_C]
		push	[bp+arg_A]
		mov	ax, [bp+arg_8]
		add	ax, 0FFFCh
		push	ax
		mov	ax, [bp+arg_6]
		add	ax, 0FFFCh
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, 2
		push	ax
		mov	ax, di
		add	ax, 2
		push	ax
		push	si
		call	sub_10110
		add	sp, 0Eh
		pop	di
		pop	si
		pop	bp
		retf
sub_EEF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_EF42	proc far		; CODE XREF: seg022:0A1Ap seg022:0A4Ep

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], di
		jle	short loc_EF55
		mov	[bp+arg_4], di

loc_EF55:				; CODE XREF: sub_EF42+Ej
		mov	ax, [si+1Fh]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[si+2Bh], dx
		mov	ax, [si+4]
		mov	[si+31h], ax
		mov	ax, [si+31h]
		add	ax, [si+1Fh]
		mov	[si+23h], ax
		mov	ax, [si+23h]
		add	ax, [si+2Bh]
		dec	ax
		mov	[si+27h], ax
		mov	ax, [si+27h]
		inc	ax
		mov	[si+35h], ax
		dec	word ptr [si+23h]
		add	word ptr [si+2Bh], 2
		inc	word ptr [si+27h]
		mov	ax, [si+6]
		mov	[si+25h], ax
		mov	ax, [si+6]
		add	ax, [si+21h]
		dec	ax
		mov	[si+29h], ax
		mov	ax, [si+6]
		mov	[si+37h], ax
		mov	[si+33h], ax
		push	word ptr [si+2Bh]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_EE6C
		add	sp, 8
		mov	ax, [si+23h]
		inc	ax
		mov	[si+3Dh], ax
		mov	ax, [si+25h]
		inc	ax
		mov	[si+3Fh], ax
		mov	ax, [si+56h]
		mov	[si+45h], ax
		mov	ax, [bp+arg_8]
		mov	[si+54h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_EF42	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+41h]
		mov	[bp-2],	ax
		mov	ax, [bp-2]
		add	ax, [si+45h]
		dec	ax
		mov	[bp-4],	ax
		push	si
		push	cs
		call	near ptr sub_EAA4
		add	sp, 2
		mov	dx, [si+3Dh]
		add	dx, ax
		mov	[si+41h], dx
		mov	ax, [si+3Fh]
		mov	[si+43h], ax
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp-6],	ax
		push	si
		call	sub_F859
		add	sp, 2
		mov	ax, [si+41h]
		cmp	ax, [bp-2]
		jle	short loc_F08E
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		mov	ax, [si+41h]
		cmp	ax, [bp-8]
		jge	short loc_F042
		mov	ax, [si+41h]
		dec	ax
		mov	[bp-8],	ax

loc_F042:				; CODE XREF: seg022:06D9j
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word ptr [si+43h]
		push	word ptr [bp-2]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	ax, [bp-4]
		mov	[bp-0Ah], ax
		mov	ax, [si+41h]
		cmp	ax, [bp-0Ah]
		jle	short loc_F072
		mov	ax, [si+41h]
		mov	[bp-0Ah], ax

loc_F072:				; CODE XREF: seg022:070Aj
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	word ptr [bp-0Ah]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		jmp	short loc_F0E8
; ���������������������������������������������������������������������������

loc_F08E:				; CODE XREF: seg022:06CBj
		mov	ax, [bp-2]
		mov	[bp-8],	ax
		cmp	[bp-8],	di
		jg	short loc_F09F
		mov	ax, di
		inc	ax
		mov	[bp-8],	ax

loc_F09F:				; CODE XREF: seg022:0737j
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [si+43h]
		push	word ptr [bp-8]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	[bp-0Ah], di
		mov	ax, [bp-0Ah]
		cmp	ax, [bp-2]
		jle	short loc_F0CC
		mov	ax, [bp-2]
		mov	[bp-0Ah], ax

loc_F0CC:				; CODE XREF: seg022:0764j
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [bp-0Ah]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch

loc_F0E8:				; CODE XREF: seg022:072Cj
		cmp	word ptr [si+4Dh], 0
		jz	short loc_F158
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		jmp	short loc_F1C0
; ���������������������������������������������������������������������������

loc_F158:				; CODE XREF: seg022:078Cj
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch

loc_F1C0:				; CODE XREF: seg022:07F6j
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+31h]
		sub	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [si+33h]
		sub	ax, [si+6]
		mov	[bp-4],	ax
		push	word ptr [si+49h]
		push	3
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_EEF0
		add	sp, 0Eh
		mov	ax, [si+35h]
		sub	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [si+37h]
		sub	ax, [si+6]
		mov	[bp-4],	ax
		push	word ptr [si+4Bh]
		push	1
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_EEF0
		add	sp, 0Eh
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_EAA4
		add	sp, 2
		mov	dx, [si+3Dh]
		add	dx, ax
		mov	[si+41h], dx
		mov	ax, [si+3Fh]
		mov	[si+43h], ax
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp-6],	ax
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_F2F0
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		jmp	short loc_F358
; ���������������������������������������������������������������������������

loc_F2F0:				; CODE XREF: seg022:0956j
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch

loc_F358:				; CODE XREF: seg022:098Ej
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_EF42
		add	sp, 0Ah
		mov	ax, [si+23h]
		dec	ax
		mov	[si+35h], ax
		mov	ax, [si+1Fh]
		add	[si+23h], ax
		dec	word ptr [si+27h]
		mov	ax, [si+1Fh]
		add	[si+27h], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_EF42
		add	sp, 0Ah
		mov	ax, [si+1Fh]
		sub	[si+23h], ax
		mov	ax, [si+1Fh]
		sub	[si+27h], ax
		inc	word ptr [si+27h]
		mov	ax, [si+27h]
		inc	ax
		mov	[si+31h], ax
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_F3CD	proc far		; CODE XREF: seg022:0EA6p seg022:0EDAp
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], di
		jle	short loc_F3E0
		mov	[bp+arg_4], di

loc_F3E0:				; CODE XREF: sub_F3CD+Ej
		mov	ax, [si+21h]
		shl	ax, 1
		mov	dx, [si+1Ch]
		sub	dx, ax
		mov	[si+2Bh], dx
		mov	ax, [si+6]
		mov	[si+33h], ax
		mov	ax, [si+33h]
		add	ax, [si+21h]
		mov	[si+25h], ax
		mov	ax, [si+25h]
		add	ax, [si+2Bh]
		dec	ax
		mov	[si+29h], ax
		mov	ax, [si+29h]
		inc	ax
		mov	[si+37h], ax
		dec	word ptr [si+25h]
		add	word ptr [si+2Bh], 2
		inc	word ptr [si+29h]
		mov	ax, [si+4]
		mov	[si+23h], ax
		mov	ax, [si+4]
		add	ax, [si+1Fh]
		dec	ax
		mov	[si+27h], ax
		mov	ax, [si+4]
		mov	[si+35h], ax
		mov	[si+31h], ax
		push	word ptr [si+2Bh]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_EE6C
		add	sp, 8
		mov	ax, [si+23h]
		inc	ax
		mov	[si+3Dh], ax
		mov	ax, [si+25h]
		inc	ax
		mov	[si+3Fh], ax
		mov	ax, [si+56h]
		mov	[si+47h], ax
		mov	ax, [bp+arg_8]
		mov	[si+54h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_F3CD	endp

; ���������������������������������������������������������������������������

loc_F463:				; DATA XREF: dseg:2C12o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+43h]
		mov	[bp-2],	ax
		mov	ax, [bp-2]
		add	ax, [si+47h]
		dec	ax
		mov	[bp-4],	ax
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_EAA4
		add	sp, 2
		mov	dx, [si+3Fh]
		add	dx, ax
		mov	[si+43h], dx
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp-6],	ax
		push	si
		call	sub_F859
		add	sp, 2
		mov	ax, [si+43h]
		cmp	ax, [bp-2]
		jle	short loc_F517
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		mov	ax, [si+43h]
		cmp	ax, [bp-8]
		jge	short loc_F4CD
		mov	ax, [si+43h]
		dec	ax
		mov	[bp-8],	ax

loc_F4CD:				; CODE XREF: seg022:0B64j
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [bp-8]
		push	di
		push	word ptr [bp-2]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	ax, [bp-4]
		mov	[bp-0Ah], ax
		mov	ax, [si+43h]
		cmp	ax, [bp-0Ah]
		jle	short loc_F4FB
		mov	ax, [si+43h]
		mov	[bp-0Ah], ax

loc_F4FB:				; CODE XREF: seg022:0B93j
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-0Ah]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		jmp	short loc_F574
; ���������������������������������������������������������������������������

loc_F517:				; CODE XREF: seg022:0B56j
		mov	ax, [bp-2]
		mov	[bp-8],	ax
		mov	ax, [bp-8]
		cmp	ax, [bp-6]
		jg	short loc_F52C
		mov	ax, [bp-6]
		inc	ax
		mov	[bp-8],	ax

loc_F52C:				; CODE XREF: seg022:0BC3j
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [bp-4]
		push	di
		push	word ptr [bp-8]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	ax, [bp-6]
		mov	[bp-0Ah], ax
		mov	ax, [bp-0Ah]
		cmp	ax, [bp-2]
		jle	short loc_F55A
		mov	ax, [bp-2]
		mov	[bp-0Ah], ax

loc_F55A:				; CODE XREF: seg022:0BF2j
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-0Ah]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch

loc_F574:				; CODE XREF: seg022:0BB5j
		cmp	word ptr [si+4Dh], 0
		jz	short loc_F5E4
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		jmp	short loc_F64C
; ���������������������������������������������������������������������������

loc_F5E4:				; CODE XREF: seg022:0C18j
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch

loc_F64C:				; CODE XREF: seg022:0C82j
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_F659:				; DATA XREF: dseg:2BF6o
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+31h]
		sub	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [si+33h]
		sub	ax, [si+6]
		mov	[bp-4],	ax
		push	word ptr [si+49h]
		push	0
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_EEF0
		add	sp, 0Eh
		mov	ax, [si+35h]
		sub	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [si+37h]
		sub	ax, [si+6]
		mov	[bp-4],	ax
		push	word ptr [si+4Bh]
		push	2
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_EEF0
		add	sp, 0Eh
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+4Fh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		mov	al, [si+50h]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+25h]
		push	word ptr [si+23h]
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		mov	ax, [si+3Dh]
		mov	[si+41h], ax
		push	si
		push	cs
		call	near ptr sub_EAA4
		add	sp, 2
		mov	dx, [si+3Fh]
		add	dx, ax
		mov	[si+43h], dx
		mov	ax, [si+41h]
		add	ax, [si+45h]
		dec	ax
		mov	di, ax
		mov	ax, [si+43h]
		add	ax, [si+47h]
		dec	ax
		mov	[bp-6],	ax
		mov	al, [si+51h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		cmp	word ptr [si+4Dh], 0
		jz	short loc_F77C
		mov	al, [si+53h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		jmp	short loc_F7E4
; ���������������������������������������������������������������������������

loc_F77C:				; CODE XREF: seg022:0DE2j
		mov	al, [si+52h]
		push	ax
		push	word ptr [si+43h]
		push	di
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+52h]
		push	ax
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word ptr [si+43h]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [si+43h]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [si+53h]
		push	ax
		push	word ptr [bp-6]
		push	di
		push	word ptr [bp-6]
		push	word ptr [si+41h]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch

loc_F7E4:				; CODE XREF: seg022:0E1Aj
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_F3CD
		add	sp, 0Ah
		mov	ax, [si+25h]
		dec	ax
		mov	[si+37h], ax
		mov	ax, [si+21h]
		add	[si+25h], ax
		dec	word ptr [si+29h]
		mov	ax, [si+21h]
		add	[si+29h], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_F3CD
		add	sp, 0Ah
		mov	ax, [si+21h]
		sub	[si+25h], ax
		mov	ax, [si+21h]
		sub	[si+29h], ax
		inc	word ptr [si+29h]
		mov	ax, [si+29h]
		inc	ax
		mov	[si+33h], ax
		pop	si
		pop	bp
		retf
seg022		ends
