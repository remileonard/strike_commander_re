ovr185		segment	para public 'OVERLAY' use16
		assume cs:ovr185
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C4A0	proc far		; CODE XREF: sub_41FCBJ

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
		mov	di, [bp+arg_6]
		or	di, di
		jz	short loc_4C4C2
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_11840
		add	sp, 0Ah

loc_4C4C2:				; CODE XREF: sub_4C4A0+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4C4A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C4C6	proc far		; CODE XREF: sub_41FD0J

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
		mov	[bp+var_A], 0
		jmp	loc_4C57C
; ���������������������������������������������������������������������������

loc_4C4F3:				; CODE XREF: sub_4C4C6+BEj
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp+var_A]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	sub_1164F
		add	sp, 4
		mov	[bp+var_E], ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_4C54C
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_E]
		jnz	short loc_4C54C
		mov	ax, word_45AE0
		mov	[bp+var_6], ax
		mov	ax, word_45AFE
		mov	[bp+var_8], ax
		mov	al, byte ptr [bp+var_6]
		push	ax
		mov	ax, di
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	[bp+var_4]
		push	di
		push	[bp+var_2]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		jmp	short loc_4C558
; ���������������������������������������������������������������������������

loc_4C54C:				; CODE XREF: sub_4C4C6+50j
					; sub_4C4C6+58j
		mov	ax, word_45B08
		mov	[bp+var_6], ax
		mov	ax, word_45B02
		mov	[bp+var_8], ax

loc_4C558:				; CODE XREF: sub_4C4C6+84j
		cmp	[bp+var_E], 0
		jz	short loc_4C576
		push	word_45B54
		push	[bp+var_8]
		push	[bp+var_E]
		push	di
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah

loc_4C576:				; CODE XREF: sub_4C4C6+96j
		inc	[bp+var_A]
		add	di, [si+20h]

loc_4C57C:				; CODE XREF: sub_4C4C6+2Aj
		mov	ax, [si+30h]
		cmp	ax, [bp+var_A]
		jle	short loc_4C587
		jmp	loc_4C4F3
; ���������������������������������������������������������������������������

loc_4C587:				; CODE XREF: sub_4C4C6+BCj
		pop	di
		pop	si
		leave
		retf
sub_4C4C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C58B	proc far		; CODE XREF: sub_41FBCJ sub_4C62A+155p

var_4E		= word ptr -4Eh
var_30		= word ptr -30h
var_22		= word ptr -22h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, 6ACh
		lea	di, [bp+var_22]
		push	ss
		pop	es
		mov	cx, 0Fh
		rep movsw
		mov	[bp+var_2], 0
		push	0
		lea	ax, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_1DD6
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_4C61F

loc_4C5C0:				; CODE XREF: sub_4C58B+92j
		lea	ax, [bp+var_30]
		push	ax
		call	sub_41F42
		add	sp, 2
		or	al, al
		jz	short loc_4C609
		inc	[bp+var_2]
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh ; '.'
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_4C5FA
		mov	byte ptr [si], 0

loc_4C5FA:				; CODE XREF: sub_4C58B+6Aj
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_0]
		call	sub_114D4
		add	sp, 4

loc_4C609:				; CODE XREF: sub_4C58B+43j
		lea	ax, [bp+var_4E]
		push	ax
		call	sub_1E09
		add	sp, 2
		or	ax, ax
		jnz	short loc_4C61F
		cmp	[bp+var_2], 64h	; 'd'
		jl	short loc_4C5C0

loc_4C61F:				; CODE XREF: sub_4C58B+33j
					; sub_4C58B+8Cj
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_4C58B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4C62A	proc far		; CODE XREF: sub_41FDFJ Gameflow_SaveRequester_4D984+C4p	...

var_B4		= word ptr -0B4h
var_63		= byte ptr -63h
var_62		= dword	ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_53		= byte ptr -53h
var_52		= dword	ptr -52h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_25		= byte ptr -25h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_433F4, 0
		jz	short loc_4C64E
		push	3D4h
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_4C64E:				; CODE XREF: sub_4C62A+11j
		push	word_443B7
		push	word_46F46
		call	sub_11233
		add	sp, 4
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aSaveload ; "saveload"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_B4]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+var_4]
		mov	[si+99h], eax
		mov	byte ptr [si+9Dh], 3
		mov	byte ptr [si+9Eh], 1
		mov	dword ptr [si+9Fh], 0
		mov	word ptr [si+77h], 0
		mov	word ptr [si+93h], 0
		mov	ax, si
		add	ax, 77h	; 'w'
		mov	[bp+var_6], ax
		mov	ax, si
		add	ax, 93h	; '�'
		mov	[bp+var_8], ax
		push	34h ; '4'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A], ax
		or	ax, ax
		jnz	short loc_4C6D7
		jmp	loc_4C766
; ���������������������������������������������������������������������������

loc_4C6D7:				; CODE XREF: sub_4C62A+A8j
		push	32h ; '2'
		push	77h ; 'w'
		push	2Bh ; '+'
		push	21h ; '!'
		push	[bp+var_A]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_A]
		mov	word ptr [bx+0Eh], 848h
		mov	bx, [bp+var_A]
		mov	word ptr [bx+24h], 2BDh
		mov	bx, [bp+var_A]
		xor	ax, ax
		mov	[bx+28h], ax
		mov	bx, [bp+var_A]
		mov	[bx+26h], ax
		mov	bx, [bp+var_A]
		mov	word ptr [bx+24h], 844h
		mov	bx, [bp+var_A]
		mov	word ptr [bx+2Ah], 0
		mov	bx, [bp+var_A]
		mov	word ptr [bx+2Ch], 0
		mov	bx, [bp+var_A]
		and	byte ptr [bx+10h], 0FDh
		mov	bx, [bp+var_A]
		mov	word ptr [bx+16h], 0
		mov	bx, [bp+var_A]
		mov	word ptr [bx+30h], 6
		mov	bx, [bp+var_A]
		mov	ax, [bp+var_8]
		mov	[bx+32h], ax
		mov	bx, [bp+var_A]
		mov	ax, [bp+var_6]
		mov	[bx+2Eh], ax
		mov	bx, [bp+var_A]
		mov	word ptr [bx+1Eh], 2
		mov	bx, [bp+var_A]
		mov	word ptr [bx+20h], 8
		mov	bx, [bp+var_A]
		mov	word ptr [bx+0Eh], 87Ch
		mov	ax, [bp+var_A]
		jmp	short loc_4C769
; ���������������������������������������������������������������������������

loc_4C766:				; CODE XREF: sub_4C62A+AAj
		mov	ax, [bp+var_A]

loc_4C769:				; CODE XREF: sub_4C62A+13Aj
		mov	[si+97h], ax
		mov	bx, [si+97h]
		mov	word ptr [bx+1Eh], 0
		mov	ax, [si+97h]
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_4C58B
		add	sp, 2
		mov	bx, [si+97h]
		mov	[bx+22h], ax
		mov	bx, [si+97h]
		mov	ax, [bx+22h]
		mov	bx, [si+97h]
		sub	ax, [bx+30h]
		mov	[si+79h], ax
		cmp	word ptr [si+35h], 0
		jnz	short loc_4C7A9
		mov	byte ptr [si+4Fh], 0
		jmp	short $+2

loc_4C7A9:				; CODE XREF: sub_4C62A+177j
		mov	word ptr [si+6Eh], 0
		mov	word ptr [si+70h], 1
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_C], ax
		mov	ax, [si+8Fh]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	bx, [bp+var_C]
		mov	al, [bx+4]
		mov	[bp+var_13], al
		mov	eax, [bp+var_12]
		mov	[si+50h], eax
		mov	al, [bp+var_13]
		mov	[si+54h], al
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		mov	bx, [bp+var_C]
		mov	eax, [bx+6]
		mov	[si+56h], eax
		mov	ax, [bp+var_E]
		mov	[si+5Ah], ax
		mov	[bp+var_16], 0
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4C813
		mov	[bp+var_16], 2

loc_4C813:				; CODE XREF: sub_4C62A+1E2j
		push	0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_18], ax
		mov	ax, [si+8Fh]
		add	ax, [bp+var_16]
		add	ax, 2
		mov	[bp+var_1A], ax
		mov	ax, [si+8Fh]
		add	ax, [bp+var_16]
		add	ax, 3
		mov	[bp+var_1C], ax
		mov	ax, si
		add	ax, 95h	; '�'
		mov	[bp+var_1E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_20], ax
		or	ax, ax
		jnz	short loc_4C853
		jmp	loc_4C911
; ���������������������������������������������������������������������������

loc_4C853:				; CODE XREF: sub_4C62A+224j
		push	0Ch
		push	4Bh ; 'K'
		push	61h ; 'a'
		push	36h ; '6'
		push	[bp+var_20]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	bx, [bp+var_18]
		mov	al, [bx+4]
		mov	[bp+var_25], al
		mov	bx, [bp+var_20]
		mov	eax, [bp+var_24]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_20]
		mov	al, [bp+var_25]
		mov	[bx+22h], al
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_18]
		mov	eax, [bx+6]
		mov	bx, [bp+var_20]
		mov	[bx+24h], eax
		mov	bx, [bp+var_20]
		mov	ax, [bp+var_1A]
		mov	[bx+28h], ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 7DCh
		mov	bx, [bp+var_20]
		mov	ax, [bp+var_1E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+2Ch], 1
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_20]
		mov	ax, [bp+var_1C]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_20]
		jmp	short loc_4C914
; ���������������������������������������������������������������������������

loc_4C911:				; CODE XREF: sub_4C62A+226j
		mov	ax, [bp+var_20]

loc_4C914:				; CODE XREF: sub_4C62A+2E5j
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_28], ax
		mov	ax, [si+8Fh]
		add	ax, 6
		mov	[bp+var_2A], ax
		mov	ax, [si+8Fh]
		add	ax, 7
		mov	[bp+var_2C], ax
		mov	ax, si
		add	ax, 95h	; '�'
		mov	[bp+var_2E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jnz	short loc_4C958
		jmp	loc_4CA16
; ���������������������������������������������������������������������������

loc_4C958:				; CODE XREF: sub_4C62A+329j
		push	0Ch
		push	50h ; 'P'
		push	70h ; 'p'
		push	0Ah
		push	[bp+var_30]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_28]
		mov	eax, [bx]
		mov	[bp+var_34], eax
		mov	bx, [bp+var_28]
		mov	al, [bx+4]
		mov	[bp+var_35], al
		mov	bx, [bp+var_30]
		mov	eax, [bp+var_34]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_30]
		mov	al, [bp+var_35]
		mov	[bx+22h], al
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_28]
		mov	eax, [bx+6]
		mov	bx, [bp+var_30]
		mov	[bx+24h], eax
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_2A]
		mov	[bx+28h], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 7DCh
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_2E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_2C]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_30]
		jmp	short loc_4CA19
; ���������������������������������������������������������������������������

loc_4CA16:				; CODE XREF: sub_4C62A+32Bj
		mov	ax, [bp+var_30]

loc_4CA19:				; CODE XREF: sub_4C62A+3EAj
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_38], ax
		mov	ax, [si+8Fh]
		add	ax, 8
		mov	[bp+var_3A], ax
		mov	ax, [si+8Fh]
		add	ax, 9
		mov	[bp+var_3C], ax
		mov	ax, si
		add	ax, 95h	; '�'
		mov	[bp+var_3E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_40], ax
		or	ax, ax
		jnz	short loc_4CA5D
		jmp	loc_4CB1B
; ���������������������������������������������������������������������������

loc_4CA5D:				; CODE XREF: sub_4C62A+42Ej
		push	0Ch
		push	50h ; 'P'
		push	70h ; 'p'
		push	5Eh ; '^'
		push	[bp+var_40]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_40]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_40]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_40]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_40]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	bx, [bp+var_38]
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	bx, [bp+var_40]
		mov	eax, [bp+var_44]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_40]
		mov	al, [bp+var_45]
		mov	[bx+22h], al
		mov	bx, [bp+var_40]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_40]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx+6]
		mov	bx, [bp+var_40]
		mov	[bx+24h], eax
		mov	bx, [bp+var_40]
		mov	ax, [bp+var_3A]
		mov	[bx+28h], ax
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 7DCh
		mov	bx, [bp+var_40]
		mov	ax, [bp+var_3E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_40]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_40]
		mov	ax, [bp+var_3C]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_40]
		jmp	short loc_4CB1E
; ���������������������������������������������������������������������������

loc_4CB1B:				; CODE XREF: sub_4C62A+430j
		mov	ax, [bp+var_40]

loc_4CB1E:				; CODE XREF: sub_4C62A+4EFj
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_48], ax
		mov	ax, [si+8Fh]
		add	ax, 0Ah
		mov	[bp+var_4A], ax
		mov	ax, [si+8Fh]
		add	ax, 0Bh
		mov	[bp+var_4C], ax
		mov	ax, si
		add	ax, 95h	; '�'
		mov	[bp+var_4E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_4CB61
		jmp	loc_4CBF1
; ���������������������������������������������������������������������������

loc_4CB61:				; CODE XREF: sub_4C62A+532j
		push	0Bh
		push	14h
		push	29h ; ')'
		push	9
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]
		mov	[bp+var_52], eax
		mov	bx, [bp+var_48]
		mov	al, [bx+4]
		mov	[bp+var_53], al
		mov	eax, [bp+var_52]
		mov	[di+1Eh], eax
		mov	al, [bp+var_53]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_4A]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 7DCh
		mov	ax, [bp+var_4E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 810h
		mov	ax, [bp+var_4C]
		mov	[di+2Eh], ax
		mov	word ptr [di+0Eh], 774h
		mov	ax, di
		jmp	short loc_4CBF3
; ���������������������������������������������������������������������������

loc_4CBF1:				; CODE XREF: sub_4C62A+534j
		mov	ax, di

loc_4CBF3:				; CODE XREF: sub_4C62A+5C5j
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0Ah
		push	5
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_56], ax
		mov	ax, [si+8Fh]
		add	ax, 0Ch
		mov	[bp+var_58], ax
		mov	ax, [si+8Fh]
		add	ax, 0Dh
		mov	[bp+var_5A], ax
		mov	ax, si
		add	ax, 95h	; '�'
		mov	[bp+var_5C], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5E], ax
		or	ax, ax
		jnz	short loc_4CC46
		jmp	loc_4CD0C
; ���������������������������������������������������������������������������

loc_4CC46:				; CODE XREF: sub_4C62A+617j
		push	0Bh
		push	14h
		push	53h ; 'S'
		push	9
		push	[bp+var_5E]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_5E]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_5E]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_5E]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_5E]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_56]
		mov	eax, [bx]
		mov	[bp+var_62], eax
		mov	bx, [bp+var_56]
		mov	al, [bx+4]
		mov	[bp+var_63], al
		mov	bx, [bp+var_5E]
		mov	eax, [bp+var_62]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_5E]
		mov	al, [bp+var_63]
		mov	[bx+22h], al
		mov	bx, [bp+var_5E]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_5E]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_56]
		mov	eax, [bx+6]
		mov	bx, [bp+var_5E]
		mov	[bx+24h], eax
		mov	bx, [bp+var_5E]
		mov	ax, [bp+var_58]
		mov	[bx+28h], ax
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 7DCh
		mov	bx, [bp+var_5E]
		mov	ax, [bp+var_5C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+2Ch], 5
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_5E]
		mov	ax, [bp+var_5A]
		mov	[bx+2Eh], ax
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 740h
		mov	ax, [bp+var_5E]
		jmp	short loc_4CD0F
; ���������������������������������������������������������������������������

loc_4CD0C:				; CODE XREF: sub_4C62A+619j
		mov	ax, [bp+var_5E]

loc_4CD0F:				; CODE XREF: sub_4C62A+6E0j
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0Ah
		push	5
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	word ptr [si+97h]
		push	si
		call	sub_E1FF
		add	sp, 6
		push	word_46F46
		mov	ax, si
		add	ax, 0A3h ; '�'
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [si+0A7h], 6Eh	; 'n'
		mov	word ptr [si+0A9h], 38h	; '8'
		mov	word ptr [si+0ABh], 0E9h ; '�'
		mov	word ptr [si+0ADh], 42h	; 'B'
		push	word_46F46
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [si+0B5h], 6Eh	; 'n'
		mov	word ptr [si+0B7h], 47h	; 'G'
		mov	word ptr [si+0B9h], 0E9h ; '�'
		mov	word ptr [si+0BBh], 79h	; 'y'
		push	word_46F46
		mov	ax, si
		add	ax, 0BFh ; '�'
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [si+0C3h], 5Dh	; ']'
		mov	word ptr [si+0C5h], 52h	; 'R'
		mov	word ptr [si+0C7h], 67h	; 'g'
		mov	word ptr [si+0C9h], 6Eh	; 'n'
		pop	di
		pop	si
		leave
		retf
sub_4C62A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4CDB9	proc far		; CODE XREF: sub_41FF3J sub_4CF3D+12p	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4CDD0
		jmp	loc_4CE51
; ���������������������������������������������������������������������������

loc_4CDD0:				; CODE XREF: sub_4CDB9+12j
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h ; 'P'
		mov	ax, si
		add	ax, 0BFh ; '�'
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	[bp+var_2], 52h	; 'R'
		cmp	word ptr [si+79h], 0
		jle	short loc_4CE1C
		mov	ax, [si+77h]
		mov	dx, 19h
		imul	dx
		cwd
		idiv	word ptr [si+79h]
		add	[bp+var_2], ax

loc_4CE1C:				; CODE XREF: sub_4CDB9+52j
		mov	ax, [si+8Fh]
		add	ax, 0Eh
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		push	5Dh ; ']'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_4CE51:				; CODE XREF: sub_4CDB9+14j
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	di, ax
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4CE6B
		or	di, di
		jnz	short loc_4CE77

loc_4CE6B:				; CODE XREF: sub_4CDB9+ACj
		mov	bx, di
		mov	byte ptr [bx+si+7Bh], 5Fh ; '_'
		mov	bx, di
		mov	byte ptr [bx+si+7Ch], 0

loc_4CE77:				; CODE XREF: sub_4CDB9+B0j
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h ; 'P'
		mov	ax, si
		add	ax, 0A3h ; '�'
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	word_45B54
		push	0
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		push	3Ah ; ':'
		push	71h ; 'q'
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4CECB
		or	di, di
		jnz	short loc_4CED1

loc_4CECB:				; CODE XREF: sub_4CDB9+10Cj
		mov	bx, di
		mov	byte ptr [bx+si+7Bh], 0

loc_4CED1:				; CODE XREF: sub_4CDB9+110j
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4CEE0
		cmp	byte ptr [si+75h], 0
		jz	short loc_4CF39

loc_4CEE0:				; CODE XREF: sub_4CDB9+11Fj
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h ; 'P'
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	word ptr [si+97h]
		mov	bx, [si+97h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4CF35
		push	si
		call	sub_F878
		add	sp, 2

loc_4CF35:				; CODE XREF: sub_4CDB9+171j
		mov	byte ptr [si+75h], 0

loc_4CF39:				; CODE XREF: sub_4CDB9+125j
		pop	di
		pop	si
		leave
		retf
sub_4CDB9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4CF3D	proc far		; CODE XREF: sub_41FE4J sub_4D95A+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+77h], 0
		jle	short loc_4CF55
		dec	word ptr [si+77h]
		push	si
		push	cs
		call	near ptr sub_4CDB9
		add	sp, 2

loc_4CF55:				; CODE XREF: sub_4CF3D+Bj
		pop	si
		pop	bp
		retf
sub_4CF3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4CF58	proc far		; CODE XREF: sub_41FE9J sub_4D96F+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+77h]
		cmp	ax, [si+79h]
		jge	short loc_4CF72
		inc	word ptr [si+77h]
		push	si
		push	cs
		call	near ptr sub_4CDB9
		add	sp, 2

loc_4CF72:				; CODE XREF: sub_4CF58+Dj
		pop	si
		pop	bp
		retf
sub_4CF58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4CF75	proc far		; CODE XREF: sub_41FEEJ Gameflow_SaveRequester_4D984+DDp	...

var_9E		= word ptr -9Eh
var_69		= word ptr -69h
var_4F		= byte ptr -4Fh
var_4E		= dword	ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 9Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4CF84:				; CODE XREF: sub_4CF75+9DEj
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D012
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h ; 'P'
		mov	ax, si
		add	ax, 0BFh ; '�'
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	di, 52h	; 'R'
		cmp	word ptr [si+79h], 0
		jle	short loc_4CFDF
		mov	ax, [si+77h]
		mov	dx, 19h
		imul	dx
		cwd
		idiv	word ptr [si+79h]
		add	di, ax

loc_4CFDF:				; CODE XREF: sub_4CF75+5Aj
		mov	ax, [si+8Fh]
		add	ax, 0Eh
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	5Dh ; ']'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_4D012:				; CODE XREF: sub_4CF75+1Fj
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D04D
		mov	ax, [si+8Fh]
		inc	ax
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	24h ; '$'
		push	72h ; 'r'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_4D04D:				; CODE XREF: sub_4CF75+A4j
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4D06A
		cmp	[bp+var_2], 0
		jnz	short loc_4D078

loc_4D06A:				; CODE XREF: sub_4CF75+EDj
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+si+7Bh], 5Fh ; '_'
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+si+7Ch], 0

loc_4D078:				; CODE XREF: sub_4CF75+F3j
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h ; 'P'
		mov	ax, si
		add	ax, 0A3h ; '�'
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	word_45B54
		push	0
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		push	3Ah ; ':'
		push	71h ; 'q'
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4D0CE
		cmp	[bp+var_2], 0
		jnz	short loc_4D0D5

loc_4D0CE:				; CODE XREF: sub_4CF75+151j
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+si+7Bh], 0

loc_4D0D5:				; CODE XREF: sub_4CF75+157j
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4D0E4
		cmp	byte ptr [si+75h], 0
		jz	short loc_4D13D

loc_4D0E4:				; CODE XREF: sub_4CF75+167j
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h ; 'P'
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	word ptr [si+97h]
		mov	bx, [si+97h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D139
		push	si
		call	sub_F878
		add	sp, 2

loc_4D139:				; CODE XREF: sub_4CF75+1B9j
		mov	byte ptr [si+75h], 0

loc_4D13D:				; CODE XREF: sub_4CF75+16Dj
		mov	word ptr [si+95h], 0
		cmp	byte ptr [si+74h], 0
		jz	short loc_4D171
		mov	byte ptr [bp+var_A], 0

loc_4D14D:				; CODE XREF: sub_4CF75+1F3j
		push	0FFh
		lea	ax, [bp+var_E]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		mov	al, byte ptr [bp+var_E+1]
		mov	ah, 0
		mov	[si+6Ch], ax
		cmp	byte ptr [bp+var_E], 2
		jnz	short loc_4D14D
		call	Keyboard_DrainBufferBIOS_3FA5E
		jmp	short loc_4D17C
; ���������������������������������������������������������������������������

loc_4D171:				; CODE XREF: sub_4CF75+1D2j
		push	1
		push	si
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_4D17C:				; CODE XREF: sub_4CF75+1FAj
		mov	[bp+var_3], 0
		cmp	word ptr [si+6Ch], 10h
		jl	short loc_4D18C
		cmp	word ptr [si+6Ch], 19h
		jle	short loc_4D1B0

loc_4D18C:				; CODE XREF: sub_4CF75+20Fj
		cmp	word ptr [si+6Ch], 1Eh
		jl	short loc_4D198
		cmp	word ptr [si+6Ch], 26h ; '&'
		jle	short loc_4D1B0

loc_4D198:				; CODE XREF: sub_4CF75+21Bj
		cmp	word ptr [si+6Ch], 2Ch ; ','
		jl	short loc_4D1A4
		cmp	word ptr [si+6Ch], 32h ; '2'
		jle	short loc_4D1B0

loc_4D1A4:				; CODE XREF: sub_4CF75+227j
		cmp	word ptr [si+6Ch], 2
		jl	short loc_4D20E
		cmp	word ptr [si+6Ch], 0Ch
		jg	short loc_4D20E

loc_4D1B0:				; CODE XREF: sub_4CF75+215j
					; sub_4CF75+221j ...
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4D1CB
		mov	byte ptr [si+7Bh], 0
		mov	bx, [si+97h]
		mov	word ptr [bx+2Ch], 0
		mov	byte ptr [si+75h], 1
		mov	byte ptr [si+74h], 1

loc_4D1CB:				; CODE XREF: sub_4CF75+23Fj
		mov	bx, [si+6Ch]
		mov	al, [bx+4ACEh]
		mov	[bp+var_3], al
		cmp	[bp+var_3], 61h	; 'a'
		jl	short loc_4D1E9
		cmp	[bp+var_3], 7Ah	; 'z'
		jg	short loc_4D1E9
		mov	al, [bp+var_3]
		add	al, 0E0h ; '�'
		mov	[bp+var_3], al

loc_4D1E9:				; CODE XREF: sub_4CF75+264j
					; sub_4CF75+26Aj
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	di, ax
		cmp	di, 8
		jge	short loc_4D20C
		mov	bx, di
		mov	al, [bp+var_3]
		mov	[bx+si+7Bh], al
		mov	bx, di
		mov	byte ptr [bx+si+7Ch], 0

loc_4D20C:				; CODE XREF: sub_4CF75+287j
		jmp	short loc_4D24E
; ���������������������������������������������������������������������������

loc_4D20E:				; CODE XREF: sub_4CF75+233j
					; sub_4CF75+239j
		cmp	word ptr [si+6Ch], 0Eh
		jnz	short loc_4D24E
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4D22B
		mov	bx, [si+97h]
		mov	word ptr [bx+2Ch], 0
		mov	byte ptr [si+75h], 1
		mov	byte ptr [si+74h], 1

loc_4D22B:				; CODE XREF: sub_4CF75+2A3j
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_4D245
		mov	bx, di
		mov	byte ptr [bx+si+7Ah], 0

loc_4D245:				; CODE XREF: sub_4CF75+2C8j
		cmp	di, 1
		jnz	short loc_4D24E
		mov	byte ptr [si+74h], 0

loc_4D24E:				; CODE XREF: sub_4CF75:loc_4D20Cj
					; sub_4CF75+29Dj ...
		cmp	word ptr [si+6Ch], 1
		jnz	short loc_4D26B
		cmp	byte ptr [si+74h], 0
		jz	short loc_4D264
		mov	byte ptr [si+7Bh], 0
		mov	byte ptr [si+74h], 0
		jmp	short loc_4D268
; ���������������������������������������������������������������������������

loc_4D264:				; CODE XREF: sub_4CF75+2E3j
		mov	byte ptr [si+73h], 1

loc_4D268:				; CODE XREF: sub_4CF75+2EDj
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D26B:				; CODE XREF: sub_4CF75+2DDj
		cmp	word ptr [si+6Ch], 1Ch
		jz	short loc_4D274
		jmp	loc_4D60F
; ���������������������������������������������������������������������������

loc_4D274:				; CODE XREF: sub_4CF75+2FAj
		cmp	byte ptr [si+74h], 0
		jnz	short loc_4D27D
		jmp	loc_4D60F
; ���������������������������������������������������������������������������

loc_4D27D:				; CODE XREF: sub_4CF75+303j
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		jmp	short loc_4D2B7
; ���������������������������������������������������������������������������

loc_4D288:				; CODE XREF: sub_4CF75+34Cj
		push	[bp+var_6]
		mov	ax, [si+97h]
		add	ax, 24h	; '$'
		push	ax
		call	sub_1164F
		add	sp, 4
		push	ax
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_4D2B4
		mov	[bp+var_4], 1
		jmp	short loc_4D2C3
; ���������������������������������������������������������������������������

loc_4D2B4:				; CODE XREF: sub_4CF75+337j
		inc	[bp+var_6]

loc_4D2B7:				; CODE XREF: sub_4CF75+311j
		mov	bx, [si+97h]
		mov	ax, [bx+22h]
		cmp	ax, [bp+var_6]
		jg	short loc_4D288

loc_4D2C3:				; CODE XREF: sub_4CF75+33Dj
		cmp	byte ptr [si+72h], 0
		jnz	short loc_4D2CC
		jmp	loc_4D5B8
; ���������������������������������������������������������������������������

loc_4D2CC:				; CODE XREF: sub_4CF75+352j
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D2DC
		mov	[bp+var_4], 1
		jmp	loc_4D5B8
; ���������������������������������������������������������������������������

loc_4D2DC:				; CODE XREF: sub_4CF75+35Ej
		push	si
		call	sub_F878
		add	sp, 2
		push	2Ch ; ','
		push	84h ; '�'
		push	55h ; 'U'
		push	65h ; 'e'
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		cmp	[bp+var_69], 0
		jnz	short loc_4D307
		mov	[bp+var_4F], 0
		jmp	short $+2

loc_4D307:				; CODE XREF: sub_4CF75+38Aj
		mov	[bp+var_8], 0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_A], ax
		mov	ax, [si+8Fh]
		add	ax, 0Fh
		mov	word ptr [bp+var_E+2], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[bp-10h], eax
		mov	bx, [bp+var_A]
		mov	al, [bx+4]
		mov	[bp+var_11], al
		mov	eax, [bp-10h]
		mov	[bp+var_4E], eax
		mov	al, [bp+var_11]
		mov	[bp+var_4A], al
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		mov	bx, [bp+var_A]
		mov	eax, [bx+6]
		mov	[bp+var_48], eax
		mov	ax, word ptr [bp+var_E+2]
		mov	[bp+var_44], ax
		push	15h
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_14], ax
		mov	ax, [si+8Fh]
		add	ax, 11h
		mov	[bp+var_16], ax
		mov	ax, [si+8Fh]
		add	ax, 12h
		mov	[bp+var_18], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_4D38D
		jmp	loc_4D418
; ���������������������������������������������������������������������������

loc_4D38D:				; CODE XREF: sub_4CF75+413j
		push	0Ch
		push	2Eh ; '.'
		push	19h
		push	12h
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	bx, [bp+var_14]
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	eax, [bp+var_1C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_1D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_16]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_8]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	ax, [bp+var_18]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_4D41A
; ���������������������������������������������������������������������������

loc_4D418:				; CODE XREF: sub_4CF75+415j
		mov	ax, di

loc_4D41A:				; CODE XREF: sub_4CF75+4A1j
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	31h ; '1'
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_20], ax
		mov	ax, [si+8Fh]
		add	ax, 13h
		mov	[bp+var_22], ax
		mov	ax, [si+8Fh]
		add	ax, 14h
		mov	[bp+var_24], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_26], ax
		or	ax, ax
		jnz	short loc_4D45A
		jmp	loc_4D518
; ���������������������������������������������������������������������������

loc_4D45A:				; CODE XREF: sub_4CF75+4E0j
		push	0Ch
		push	2Ch ; ','
		push	19h
		push	45h ; 'E'
		push	[bp+var_26]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_20]
		mov	al, [bx+4]
		mov	[bp+var_2B], al
		mov	bx, [bp+var_26]
		mov	eax, [bp+var_2A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_26]
		mov	al, [bp+var_2B]
		mov	[bx+22h], al
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx+6]
		mov	bx, [bp+var_26]
		mov	[bx+24h], eax
		mov	bx, [bp+var_26]
		mov	ax, [bp+var_22]
		mov	[bx+28h], ax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_8]
		mov	bx, [bp+var_26]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_26]
		mov	ax, [bp+var_24]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_26]
		jmp	short loc_4D51B
; ���������������������������������������������������������������������������

loc_4D518:				; CODE XREF: sub_4CF75+4E2j
		mov	ax, [bp+var_26]

loc_4D51B:				; CODE XREF: sub_4CF75+5A1j
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DF9F
		add	sp, 2
		mov	ax, [si+8Fh]
		add	ax, 10h
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	60h ; '`'
		push	77h ; 'w'
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_4D56A:				; CODE XREF: sub_4CF75+608j
		push	1
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4
		cmp	[bp+var_8], 0
		jz	short loc_4D56A
		cmp	[bp+var_8], 2
		jnz	short loc_4D589
		mov	[bp+var_4], 0

loc_4D589:				; CODE XREF: sub_4CF75+60Ej
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DFCA
		add	sp, 2
		push	si
		call	sub_F859
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DC89
		add	sp, 4

loc_4D5B8:				; CODE XREF: sub_4CF75+354j
					; sub_4CF75+364j
		cmp	[bp+var_4], 0
		jz	short loc_4D5F6
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		push	3D4h
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		push	word ptr [si+91h]
		call	CRT_Strcpy
		add	sp, 4
		push	3A7Bh
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4
		mov	byte ptr [si+73h], 1
		jmp	short loc_4D60C
; ���������������������������������������������������������������������������

loc_4D5F6:				; CODE XREF: sub_4CF75+647j
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D60C
		push	7
		push	6D5h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4

loc_4D60C:				; CODE XREF: sub_4CF75+67Fj
					; sub_4CF75+688j
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D60F:				; CODE XREF: sub_4CF75+2FCj
					; sub_4CF75+305j
		cmp	word ptr [si+6Ah], 0
		jnz	short loc_4D618
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D618:				; CODE XREF: sub_4CF75+69Ej
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4D624
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D624:				; CODE XREF: sub_4CF75+6AAj
		mov	bx, [si+97h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_4D647
		mov	byte ptr [si+76h], 1
		mov	bx, [si+97h]
		push	word ptr [bx+2Ch]
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_4D647:				; CODE XREF: sub_4CF75+6B7j
		mov	ax, [si+95h]
		cmp	ax, 1
		jz	short loc_4D65D
		cmp	ax, 2
		jz	short loc_4D69C
		cmp	ax, 3
		jz	short loc_4D6A3
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D65D:				; CODE XREF: sub_4CF75+6D9j
		cmp	byte ptr [si+7Bh], 0
		jz	short loc_4D699
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		push	3D4h
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 7Bh	; '{'
		push	ax
		push	word ptr [si+91h]
		call	CRT_Strcpy
		add	sp, 4
		push	3A7Bh
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4
		mov	byte ptr [si+73h], 1

loc_4D699:				; CODE XREF: sub_4CF75+6ECj
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D69C:				; CODE XREF: sub_4CF75+6DEj
		mov	byte ptr [si+73h], 1
		jmp	loc_4D94A
; ���������������������������������������������������������������������������

loc_4D6A3:				; CODE XREF: sub_4CF75+6E3j
		push	2Ch ; ','
		push	84h ; '�'
		push	55h ; 'U'
		push	65h ; 'e'
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		cmp	[bp+var_69], 0
		jnz	short loc_4D6C5
		mov	[bp+var_4F], 0
		jmp	short $+2

loc_4D6C5:				; CODE XREF: sub_4CF75+748j
		mov	[bp+var_6], 0
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp+var_8], ax
		mov	ax, [si+8Fh]
		add	ax, 0Fh
		mov	[bp+var_A], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_E], eax
		mov	bx, [bp+var_8]
		mov	al, [bx+4]
		mov	[bp+var_F], al
		mov	eax, [bp+var_E]
		mov	[bp+var_4E], eax
		mov	al, [bp+var_F]
		mov	[bp+var_4A], al
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		mov	bx, [bp+var_8]
		mov	eax, [bx+6]
		mov	[bp+var_48], eax
		mov	ax, [bp+var_A]
		mov	[bp+var_44], ax
		push	15h
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp-12h], ax
		mov	ax, [si+8Fh]
		add	ax, 11h
		mov	[bp+var_14], ax
		mov	ax, [si+8Fh]
		add	ax, 12h
		mov	[bp+var_16], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_4D74B
		jmp	loc_4D7D6
; ���������������������������������������������������������������������������

loc_4D74B:				; CODE XREF: sub_4CF75+7D1j
		push	0Ch
		push	2Eh ; '.'
		push	19h
		push	12h
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp-12h]
		mov	eax, [bx]
		mov	[bp+var_1C+2], eax
		mov	bx, [bp-12h]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_1C+1],	al
		mov	eax, [bp+var_1C+2]
		mov	[di+1Eh], eax
		mov	al, byte ptr [bp+var_1C+1]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp-12h]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_14]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_6]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	ax, [bp+var_16]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_4D7D8
; ���������������������������������������������������������������������������

loc_4D7D6:				; CODE XREF: sub_4CF75+7D3j
		mov	ax, di

loc_4D7D8:				; CODE XREF: sub_4CF75+85Fj
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	31h ; '1'
		mov	ax, si
		add	ax, 99h	; '�'
		mov	[bp-1Eh], ax
		mov	ax, [si+8Fh]
		add	ax, 13h
		mov	[bp+var_20], ax
		mov	ax, [si+8Fh]
		add	ax, 14h
		mov	[bp+var_22], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_24], ax
		or	ax, ax
		jnz	short loc_4D818
		jmp	loc_4D8D6
; ���������������������������������������������������������������������������

loc_4D818:				; CODE XREF: sub_4CF75+89Ej
		push	0Ch
		push	2Ch ; ','
		push	19h
		push	45h ; 'E'
		push	[bp+var_24]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_24]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp-1Eh]
		mov	eax, [bx]
		mov	[bp+var_2A+2], eax
		mov	bx, [bp-1Eh]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_2A+1],	al
		mov	bx, [bp+var_24]
		mov	eax, [bp+var_2A+2]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_24]
		mov	al, byte ptr [bp+var_2A+1]
		mov	[bx+22h], al
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp-1Eh]
		mov	eax, [bx+6]
		mov	bx, [bp+var_24]
		mov	[bx+24h], eax
		mov	bx, [bp+var_24]
		mov	ax, [bp+var_20]
		mov	[bx+28h], ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_6]
		mov	bx, [bp+var_24]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_24]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_24]
		mov	ax, [bp+var_22]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_24]
		jmp	short loc_4D8D9
; ���������������������������������������������������������������������������

loc_4D8D6:				; CODE XREF: sub_4CF75+8A0j
		mov	ax, [bp+var_24]

loc_4D8D9:				; CODE XREF: sub_4CF75+95Fj
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DF9F
		add	sp, 2

loc_4D8F4:				; CODE XREF: sub_4CF75+992j
		push	1
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4
		cmp	[bp+var_6], 0
		jz	short loc_4D8F4
		cmp	[bp+var_6], 1
		jnz	short loc_4D919
		push	1
		call	PagedResourceC_RefreshAndFinalize_2FD7D
		add	sp, 2

loc_4D919:				; CODE XREF: sub_4CF75+998j
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DFCA
		add	sp, 2
		push	si
		call	sub_F859
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_DC89
		add	sp, 4
		jmp	short $+2

loc_4D94A:				; CODE XREF: sub_4CF75+Cj
					; sub_4CF75:loc_4D268j	...
		mov	al, [si+73h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D956
		jmp	loc_4CF84
; ���������������������������������������������������������������������������

loc_4D956:				; CODE XREF: sub_4CF75+9DCj
		pop	di
		pop	si
		leave
		retf
sub_4CF75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4D95A	proc far		; CODE XREF: sub_41FD5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_436EA
		push	cs
		call	near ptr sub_4CF3D
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_4D95A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4D96F	proc far		; CODE XREF: sub_41FDAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_436EA
		push	cs
		call	near ptr sub_4CF58
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_4D96F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Commande 10h : choix du fichier de sauvegarde ; nom rendu
; dans le tampon arg.
; ==============================================================================================
Gameflow_SaveRequester_4D984	proc far		; CODE XREF: sub_41FC1J

var_D2		= word ptr -0D2h
var_C4		= word ptr -0C4h
var_60		= byte ptr -60h
var_5F		= byte ptr -5Fh
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= byte ptr -5Ch
var_5B		= word ptr -5Bh
var_59		= word ptr -59h
var_57		= byte ptr -57h
var_43		= word ptr -43h
var_41		= word ptr -41h
var_3B		= word ptr -3Bh
var_39		= dword	ptr -39h
var_35		= byte ptr -35h
var_34		= byte ptr -34h
var_33		= dword	ptr -33h
var_2F		= word ptr -2Fh
var_2D		= word ptr -2Dh
var_22		= byte ptr -22h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_14		= byte ptr -14h
var_13		= word ptr -13h
var_11		= word ptr -11h
var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0D2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		cmp	byte ptr [si+0FCh], 1Dh
		jnz	short loc_4D99C
		mov	di, 15h

loc_4D99C:				; CODE XREF: Gameflow_SaveRequester_4D984+13j
		push	96h ; '�'
		push	8Ch ; '�'
		push	1Eh
		push	50h ; 'P'
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	[bp+var_C4], 704h
		mov	[bp+var_39], 0
		mov	[bp+var_35], 2
		mov	[bp+var_34], 0
		mov	[bp+var_33], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_22], 0
		mov	[bp+var_21], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_14], 0
		mov	[bp+var_13], 0
		mov	[bp+var_11], 0
		mov	[bp+var_6], 0
		mov	[bp+var_60], 1
		lea	ax, [bp+var_D2]
		mov	word_436EA, ax
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_5D], 1
		mov	[bp+var_5C], 0
		xor	ax, ax
		mov	[bp+var_59], ax
		mov	[bp+var_5B], ax
		mov	[bp+var_57], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_2], di
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_43], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_41], ax
		mov	bx, [bp+var_41]
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_D2]
		push	ax
		push	cs
		call	near ptr sub_4C62A
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DF9F
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		push	cs
		call	near ptr sub_4CF75
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DFCA
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_3F784
		lea	ax, [bp+var_13]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_21]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_2F]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		cmp	[bp+var_34], 0
		jz	short loc_4DAC1
		cmp	[bp+var_39], 0
		jz	short loc_4DAC1
		push	0
		mov	al, [bp+var_35]
		push	ax
		lea	ax, [bp+var_39]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4DAC1:				; CODE XREF: Gameflow_SaveRequester_4D984+11Dj
					; Gameflow_SaveRequester_4D984+124j
		mov	[bp+var_39], 0
		mov	[bp+var_34], 0
		mov	[bp+var_33], 0
		push	0
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DC89
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_SaveRequester_4D984	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-25. Écrit la structure de partie dans un fichier (gensave.tmp, tmpsav.tmp,
; *.sav), champ par champ (sub_3AD47 = 1 octet, sub_3AD2A = 1 mot, sub_3AD64 = 1 dword,
; StreamReader_WriteTyped_3CEFF = n octets). Octets du fichier : 0 en-tête 7 octets
; (word_433F2) ; 7 [+249] ; 8 [+250] ; 9 [+251] ; 10 [+252] ; 11 256 drapeaux [+253] ; 267 100
; octets [+509] (résultat des missions) ; 367 9 mots stock d'armes [+609] ; 385 4 × (arme
; [+627+2i], nombre [+628+2i]) points d'emport ; 393 dword argent [+635] ; 397 dword frais
; généraux [+639] ; 401 dword achats du catalogue [+643] ; 405 dword coût des avions perdus
; [+647] ; 409 8 pilotes × 3 mots [+671+26i], [+673+26i], [+675+26i] (table de 26 octets par
; pilote : mov dx, 1Ah / imul dx) ; 457 20 octets [+920] ; 477 20 octets [+940] ; 497 20
; octets [+960] ; 517 mot total des avions perdus [+980] (testé par
; Gameflow_CheckLossConversations_50645) ; 519 61 octets [+859] ; 580 7 octets dseg 0EE6h
; (drapeaux des personnages, DIED) ; 587 octet [+982] (3e valeur STAT) ; 588 octet [+983]
; (morceau PLAY_GAMEFLOW_TUNE) ; 589 dword score [+984]. Taille 593 octets.
; ==============================================================================================
Gameflow_SaveGameFile_4DAE8	proc far		; CODE XREF: sub_41FB7J

var_68		= word ptr -68h
var_B		= dword	ptr -0Bh
var_7		= dword	ptr -7
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 0
		jnz	short loc_4DAFE
		jmp	loc_4DDD8
; ���������������������������������������������������������������������������

loc_4DAFE:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+11j
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_68], 556h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 693h
		push	0
		push	[bp+var_2]
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [bp+var_68]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 7
		push	ds
		push	word_433F2
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		mov	al, [si+0F9h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+0FAh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+0FBh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+0FCh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		xor	di, di
		jmp	short loc_4DBBE
; ���������������������������������������������������������������������������

loc_4DBA7:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+DAj
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+0FDh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		inc	di

loc_4DBBE:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+BDj
		cmp	di, 100h
		jl	short loc_4DBA7
		xor	di, di
		jmp	short loc_4DBDF
; ���������������������������������������������������������������������������

loc_4DBC8:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+FAj
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+1FDh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		inc	di

loc_4DBDF:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+DEj
		cmp	di, 64h	; 'd'
		jl	short loc_4DBC8
		xor	di, di
		jmp	short loc_4DC00
; ���������������������������������������������������������������������������

loc_4DBE8:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+11Bj
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+261h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD2A
		add	sp, 8
		inc	di

loc_4DC00:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+FEj
		cmp	di, 9
		jl	short loc_4DBE8
		xor	di, di
		jmp	short loc_4DC3A
; ���������������������������������������������������������������������������

loc_4DC09:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+155j
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+273h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+274h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		inc	di

loc_4DC3A:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+11Fj
		cmp	di, 4
		jl	short loc_4DC09
		push	large 0FFFFFFFFh
		push	large dword ptr	[si+27Bh]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD64
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		push	large dword ptr	[si+27Fh]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD64
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		push	large dword ptr	[si+283h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD64
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		push	large dword ptr	[si+287h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD64
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_4DCE8
; ���������������������������������������������������������������������������

loc_4DC93:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+203j
		push	large 0FFFFFFFFh
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+29Fh]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD2A
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+2A1h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD2A
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+2A3h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD2A
		add	sp, 8
		inc	di

loc_4DCE8:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+1A9j
		cmp	di, 8
		jl	short loc_4DC93
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 398h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3ACh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3C0h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	word ptr [si+3D4h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD2A
		add	sp, 8
		push	large 0FFFFFFFFh
		push	large 3Dh ; '='
		push	ds
		mov	ax, si
		add	ax, 35Bh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		xor	di, di
		jmp	short loc_4DD7D
; ���������������������������������������������������������������������������

loc_4DD68:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+298j
		push	large 0FFFFFFFFh
		mov	al, [di+0EE6h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		inc	di

loc_4DD7D:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+27Ej
		cmp	di, 7
		jl	short loc_4DD68
		push	large 0FFFFFFFFh
		mov	al, [si+3D6h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+3D7h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD47
		add	sp, 8
		push	large 0FFFFFFFFh
		push	large dword ptr	[si+3D8h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3AD64
		add	sp, 0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_4DDD8:				; CODE XREF: Gameflow_SaveGameFile_4DAE8+13j
		pop	di
		pop	si
		leave
		retf
Gameflow_SaveGameFile_4DAE8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Commande 11h : choix du fichier à charger (nom en
; partie+93h) ; si choisi, [partie+0E8h] = 3.
; ==============================================================================================
Gameflow_LoadRequester_4DDDC	proc far		; CODE XREF: sub_41FC6J

var_D2		= word ptr -0D2h
var_C4		= word ptr -0C4h
var_60		= byte ptr -60h
var_5F		= byte ptr -5Fh
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= byte ptr -5Ch
var_5B		= word ptr -5Bh
var_59		= word ptr -59h
var_57		= byte ptr -57h
var_43		= word ptr -43h
var_41		= word ptr -41h
var_3B		= word ptr -3Bh
var_39		= dword	ptr -39h
var_35		= byte ptr -35h
var_34		= byte ptr -34h
var_33		= dword	ptr -33h
var_2F		= word ptr -2Fh
var_2D		= word ptr -2Dh
var_22		= byte ptr -22h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_14		= byte ptr -14h
var_13		= word ptr -13h
var_11		= word ptr -11h
var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0D2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		cmp	byte ptr [si+0FCh], 1Dh
		jnz	short loc_4DDF4
		mov	di, 15h

loc_4DDF4:				; CODE XREF: Gameflow_LoadRequester_4DDDC+13j
		cmp	[bp+arg_2], 1
		jnz	short loc_4DDFD
		mov	di, 2Ah	; '*'

loc_4DDFD:				; CODE XREF: Gameflow_LoadRequester_4DDDC+1Cj
		push	96h ; '�'
		push	8Ch ; '�'
		push	1Eh
		push	50h ; 'P'
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	[bp+var_C4], 704h
		mov	[bp+var_39], 0
		mov	[bp+var_35], 2
		mov	[bp+var_34], 0
		mov	[bp+var_33], 0
		mov	[bp+var_2F], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_22], 0
		mov	[bp+var_21], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_14], 0
		mov	[bp+var_13], 0
		mov	[bp+var_11], 0
		mov	[bp+var_6], 0
		mov	[bp+var_60], 0
		lea	ax, [bp+var_D2]
		mov	word_436EA, ax
		mov	[bp+var_5F], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_5D], 1
		mov	[bp+var_5C], 0
		xor	ax, ax
		mov	[bp+var_59], ax
		mov	[bp+var_5B], ax
		mov	[bp+var_57], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_2], di
		mov	ax, si
		add	ax, 93h	; '�'
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_43], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_41], ax
		mov	bx, [bp+var_41]
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_D2]
		push	ax
		push	cs
		call	near ptr sub_4C62A
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DF9F
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		push	cs
		call	near ptr sub_4CF75
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DFCA
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_3F784
		lea	ax, [bp+var_13]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_21]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_2F]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		cmp	[bp+var_34], 0
		jz	short loc_4DF24
		cmp	[bp+var_39], 0
		jz	short loc_4DF24
		push	0
		mov	al, [bp+var_35]
		push	ax
		lea	ax, [bp+var_39]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4DF24:				; CODE XREF: Gameflow_LoadRequester_4DDDC+128j
					; Gameflow_LoadRequester_4DDDC+12Fj
		mov	[bp+var_39], 0
		mov	[bp+var_34], 0
		mov	[bp+var_33], 0
		push	0
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_DC89
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_LoadRequester_4DDDC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Lit un fichier de partie (gensave.tmp, tmpsav.tmp, *.sav)
; dans la structure de partie.
; ==============================================================================================
Gameflow_LoadGameFile_4DF4B	proc far		; CODE XREF: sub_41FB2J

var_68		= word ptr -68h
var_B		= dword	ptr -0Bh
var_7		= dword	ptr -7
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 0
		jnz	short loc_4DF61
		jmp	loc_4E27A
; ���������������������������������������������������������������������������

loc_4DF61:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+11j
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_68], 556h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 693h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [bp+var_68]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_68]
		push	ax
		call	sub_41F3D
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4DFC0
		push	word_433F2
		push	6D8h
		call	Fatal_Error_310B
		add	sp, 4

loc_4DFC0:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+64j
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[si+0F9h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[si+0FAh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[si+0FBh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[si+0FCh], al
		xor	di, di
		jmp	short loc_4E026
; ���������������������������������������������������������������������������

loc_4E010:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+DFj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	bx, di
		mov	[bx+si+0FDh], al
		inc	di

loc_4E026:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+C3j
		cmp	di, 100h
		jl	short loc_4E010
		xor	di, di
		jmp	short loc_4E046
; ���������������������������������������������������������������������������

loc_4E030:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+FEj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	bx, di
		mov	[bx+si+1FDh], al
		inc	di

loc_4E046:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+E3j
		cmp	di, 64h	; 'd'
		jl	short loc_4E030
		xor	di, di
		jmp	short loc_4E067
; ���������������������������������������������������������������������������

loc_4E04F:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+11Fj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_3AD81
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+261h], ax
		inc	di

loc_4E067:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+102j
		cmp	di, 9
		jl	short loc_4E04F
		xor	di, di
		jmp	short loc_4E09F
; ���������������������������������������������������������������������������

loc_4E070:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+157j
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+273h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+274h], al
		inc	di

loc_4E09F:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+123j
		cmp	di, 4
		jl	short loc_4E070
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3ADC7
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+27Bh], eax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3ADC7
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+27Fh], eax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3ADC7
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+283h], eax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3ADC7
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+287h], eax
		xor	di, di
		jmp	short loc_4E177
; ���������������������������������������������������������������������������

loc_4E11C:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+22Fj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_3AD81
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+29Fh], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_3AD81
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A1h], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_3AD81
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A3h], ax
		inc	di

loc_4E177:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+1CFj
		cmp	di, 8
		jl	short loc_4E11C
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 398h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3ACh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3C0h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_3AD81
		add	sp, 6
		mov	[si+3D4h], ax
		push	large 0FFFFFFFFh
		push	large 3Dh ; '='
		push	ds
		mov	ax, si
		add	ax, 35Bh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		xor	di, di
		jmp	short loc_4E20B
; ���������������������������������������������������������������������������

loc_4E1F7:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+2C3j
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[di+0EE6h], al
		inc	di

loc_4E20B:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+2AAj
		cmp	di, 7
		jl	short loc_4E1F7
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[si+3D6h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_3ADA4
		add	sp, 6
		mov	[si+3D7h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_3ADC7
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+3D8h], eax
		mov	al, [si+3D7h]
		push	ax
		call	Music_PlayGameflowTune_28CFC
		add	sp, 2
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_4E27A:				; CODE XREF: Gameflow_LoadGameFile_4DF4B+13j
		pop	di
		pop	si
		leave
		retf
Gameflow_LoadGameFile_4DF4B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E27E	proc far		; CODE XREF: sub_41FADJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_4E290
		jmp	loc_4E318
; ���������������������������������������������������������������������������

loc_4E290:				; CODE XREF: sub_4E27E+Dj
		mov	ax, si
		add	ax, 0BFh ; '�'
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		mov	ax, si
		add	ax, 0A3h ; '�'
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		cmp	byte ptr [si+9Eh], 0
		jz	short loc_4E2E3
		cmp	dword ptr [si+99h], 0
		jz	short loc_4E2E3
		push	0
		mov	al, [si+9Dh]
		push	ax
		mov	ax, si
		add	ax, 99h	; '�'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4E2E3:				; CODE XREF: sub_4E27E+41j
					; sub_4E27E+49j
		mov	dword ptr [si+99h], 0
		mov	byte ptr [si+9Eh], 0
		mov	dword ptr [si+9Fh], 0
		push	0
		push	si
		call	sub_DC89
		add	sp, 4
		test	di, 1
		jz	short loc_4E316
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E316:				; CODE XREF: sub_4E27E+8Bj
		jmp	short $+2

loc_4E318:				; CODE XREF: sub_4E27E+Fj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E27E	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E320	proc far		; CODE XREF: sub_41FA8J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E385
		cmp	byte ptr [si+23h], 0
		jz	short loc_4E355
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_4E355
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4E355:				; CODE XREF: sub_4E320+13j
					; sub_4E320+1Aj
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E383
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E383:				; CODE XREF: sub_4E320+56j
		jmp	short $+2

loc_4E385:				; CODE XREF: sub_4E320+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E320	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E38D	proc far		; CODE XREF: sub_41FA3J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E3F2
		cmp	byte ptr [si+23h], 0
		jz	short loc_4E3C2
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_4E3C2
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4E3C2:				; CODE XREF: sub_4E38D+13j
					; sub_4E38D+1Aj
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E3F0
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E3F0:				; CODE XREF: sub_4E38D+56j
		jmp	short $+2

loc_4E3F2:				; CODE XREF: sub_4E38D+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E38D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E3FA	proc far		; CODE XREF: sub_41F9EJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E45F
		cmp	byte ptr [si+23h], 0
		jz	short loc_4E42F
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_4E42F
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4E42F:				; CODE XREF: sub_4E3FA+13j
					; sub_4E3FA+1Aj
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E45D
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E45D:				; CODE XREF: sub_4E3FA+56j
		jmp	short $+2

loc_4E45F:				; CODE XREF: sub_4E3FA+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E3FA	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E467	proc far		; CODE XREF: sub_41F99J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E4CC
		cmp	byte ptr [si+23h], 0
		jz	short loc_4E49C
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_4E49C
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4E49C:				; CODE XREF: sub_4E467+13j
					; sub_4E467+1Aj
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E4CA
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E4CA:				; CODE XREF: sub_4E467+56j
		jmp	short $+2

loc_4E4CC:				; CODE XREF: sub_4E467+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E467	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E4D4	proc far		; CODE XREF: sub_41F94J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E539
		cmp	byte ptr [si+23h], 0
		jz	short loc_4E509
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_4E509
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4E509:				; CODE XREF: sub_4E4D4+13j
					; sub_4E4D4+1Aj
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E537
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E537:				; CODE XREF: sub_4E4D4+56j
		jmp	short $+2

loc_4E539:				; CODE XREF: sub_4E4D4+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E4D4	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E541	proc far		; CODE XREF: sub_41F8FJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E579
		mov	word ptr [si], 844h
		push	si
		call	sub_116EE
		add	sp, 2
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_4E579
		push	si
		call	sub_308
		add	sp, 2

loc_4E579:				; CODE XREF: sub_4E541+Dj
					; sub_4E541+2Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E541	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E57D	proc far		; CODE XREF: sub_41F8AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, 1
		jz	short loc_4E58E
		jmp	short loc_4E59E
; ���������������������������������������������������������������������������

loc_4E58E:				; CODE XREF: sub_4E57D+Dj
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		mov	ax, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4E59E:				; CODE XREF: sub_4E57D+Fj
		xor	ax, ax
		pop	si
		pop	bp
		retf
sub_4E57D	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E5A6	proc far		; CODE XREF: sub_41F85J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E5F7
		mov	word ptr [si+24h], 844h
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	sub_116EE
		add	sp, 2
		mov	word ptr [si+24h], 2BDh
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	sub_2FEE0
		add	sp, 2
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E5F5
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E5F5:				; CODE XREF: sub_4E5A6+42j
		jmp	short $+2

loc_4E5F7:				; CODE XREF: sub_4E5A6+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E5A6	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E5FF	proc far		; CODE XREF: sub_41F80J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4E650
		mov	word ptr [si+24h], 844h
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	sub_116EE
		add	sp, 2
		mov	word ptr [si+24h], 2BDh
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	sub_2FEE0
		add	sp, 2
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_4E64E
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_4E64E:				; CODE XREF: sub_4E5FF+42j
		jmp	short $+2

loc_4E650:				; CODE XREF: sub_4E5FF+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_4E5FF	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
ovr185		ends
