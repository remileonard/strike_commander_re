ovr189		segment	para public 'OVERLAY' use16
		assume cs:ovr189
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51DB0		proc far

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
		jz	short loc_51DD2
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_1642F
		add	sp, 0Ah

loc_51DD2:
		pop	di
		pop	si
		pop	bp
		retf
sub_51DB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51DD6		proc far

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
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp+var_6], ax
		mov	[bp+var_C], 0
		jmp	loc_51EB8

loc_51E04:
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp+var_C]
		mov	[bp+var_E], ax
		push	[bp+var_E]
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_1623E
		add	sp, 4
		mov	di, ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_51E75
		cmp	[si+2Ch], di
		jnz	short loc_51E75
		mov	ax, word_4BC90
		mov	[bp+var_8], ax
		push	di
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_161DF
		add	sp, 4
		or	al, al
		jnz	short loc_51E4D
		mov	[bp+var_A], 0D9h
		jmp	short loc_51E52

loc_51E4D:
		mov	[bp+var_A], 0B2h

loc_51E52:
		mov	al, byte ptr [bp+var_8]
		push	ax
		mov	ax, [bp+var_4]
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		jmp	short loc_51E93

loc_51E75:
		mov	ax, word_4BCB8
		mov	[bp+var_8], ax
		or	di, di
		jz	short loc_51E93
		push	di
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_161DF
		add	sp, 4
		mov	ah, 0
		mov	[bp+var_A], ax

loc_51E93:
		or	di, di
		jz	short loc_51EAF
		push	word_4BD04
		push	[bp+var_A]
		push	di
		push	[bp+var_4]
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah

loc_51EAF:
		inc	[bp+var_C]
		mov	ax, [si+20h]
		add	[bp+var_4], ax

loc_51EB8:
		mov	ax, [si+30h]
		cmp	ax, [bp+var_C]
		jle	short loc_51EC3
		jmp	loc_51E04

loc_51EC3:
		pop	di
		pop	si
		leave
		retf
sub_51DD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51EC7		proc far

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
		mov	si, 5D6h
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
		call	sub_22AC
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_51F6D

loc_51EFC:
		lea	ax, [bp+var_30]
		push	ax
		call	sub_47892
		add	sp, 2
		or	al, al
		jz	short loc_51F57
		inc	[bp+var_2]
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_51F36
		mov	byte ptr [si], 0

loc_51F36:
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_51F57
		push	0
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_0]
		call	sub_16058
		add	sp, 6

loc_51F57:
		lea	ax, [bp+var_4E]
		push	ax
		call	sub_22DF
		add	sp, 2
		or	ax, ax
		jnz	short loc_51F6D
		cmp	[bp+var_2], 64h
		jl	short loc_51EFC

loc_51F6D:
		cmp	byte_4EBC0, 0Eh
		jnz	short loc_51F77
		jmp	loc_5201D

loc_51F77:
		cmp	byte_4EBC0, 1Dh
		jnz	short loc_51F81
		jmp	loc_5201D

loc_51F81:
		push	5F6h
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0
		lea	ax, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_22AC
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_5201D

loc_51FAB:
		lea	ax, [bp+var_30]
		push	ax
		call	sub_47892
		add	sp, 2
		or	al, al
		jz	short loc_52007
		inc	[bp+var_2]
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_51FE5
		mov	byte ptr [si], 0

loc_51FE5:
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_52007
		push	0BEh
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_0]
		call	sub_16058
		add	sp, 6

loc_52007:
		lea	ax, [bp+var_4E]
		push	ax
		call	sub_22DF
		add	sp, 2
		or	ax, ax
		jnz	short loc_5201D
		cmp	[bp+var_2], 64h
		jl	short loc_51FAB

loc_5201D:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_51EC7		endp

; START OF FUNCTION CHUNK FOR sub_51EC7
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_51EC7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52028		proc far

var_B4		= word ptr -0B4h
var_63		= byte ptr -63h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_53		= byte ptr -53h
var_52		= dword ptr -52h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_48CDA, 0
		jz	short loc_5204C
		push	2FAh
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_5204C:
		push	word_49DF8
		push	word_4D36E
		call	sub_15DB7
		add	sp, 4
		push	ds
		push	offset aShp
		push	ds
		push	offset aSaveload
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_B4]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
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
		add	ax, 77h
		mov	[bp+var_6], ax
		mov	ax, si
		add	ax, 93h
		mov	[bp+var_8], ax
		push	34h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A], ax
		or	ax, ax
		jnz	short loc_520D5
		jmp	loc_52164

loc_520D5:
		push	32h
		push	77h
		push	2Bh
		push	21h
		push	[bp+var_A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_A]
		mov	word ptr [bx+0Eh], 7A4h
		mov	bx, [bp+var_A]
		mov	word ptr [bx+24h], 1E4h
		mov	bx, [bp+var_A]
		xor	ax, ax
		mov	[bx+28h], ax
		mov	bx, [bp+var_A]
		mov	[bx+26h], ax
		mov	bx, [bp+var_A]
		mov	word ptr [bx+24h], 7A0h
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
		mov	word ptr [bx+0Eh], 7D8h
		mov	ax, [bp+var_A]
		jmp	short loc_52167

loc_52164:
		mov	ax, [bp+var_A]

loc_52167:
		mov	[si+97h], ax
		mov	bx, [si+97h]
		mov	word ptr [bx+1Eh], 0
		mov	ax, [si+97h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_51EC7
		add	sp, 2
		mov	bx, [si+97h]
		mov	[bx+22h], ax
		mov	bx, [si+97h]
		mov	ax, [bx+22h]
		mov	bx, [si+97h]
		sub	ax, [bx+30h]
		mov	[si+79h], ax
		cmp	word ptr [si+35h], 0
		jnz	short loc_521A7
		mov	byte ptr [si+4Fh], 0
		jmp	short loc_521A7

loc_521A7:
		mov	word ptr [si+6Eh], 0
		mov	word ptr [si+70h], 1
		mov	ax, si
		add	ax, 99h
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
		jnz	short loc_52211
		mov	[bp+var_16], 2

loc_52211:
		push	0
		mov	ax, si
		add	ax, 99h
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
		add	ax, 95h
		mov	[bp+var_1E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_20], ax
		or	ax, ax
		jnz	short loc_52251
		jmp	loc_5230F

loc_52251:
		push	0Ch
		push	4Bh
		push	61h
		push	36h
		push	[bp+var_20]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		mov	bx, [bp+var_20]
		mov	ax, [bp+var_1E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+2Ch], 1
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_20]
		mov	ax, [bp+var_1C]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_20]
		jmp	short loc_52312

loc_5230F:
		mov	ax, [bp+var_20]

loc_52312:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_28], ax
		mov	ax, [si+8Fh]
		add	ax, 6
		mov	[bp+var_2A], ax
		mov	ax, [si+8Fh]
		add	ax, 7
		mov	[bp+var_2C], ax
		mov	ax, si
		add	ax, 95h
		mov	[bp+var_2E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jnz	short loc_52356
		jmp	loc_52414

loc_52356:
		push	0Ch
		push	50h
		push	70h
		push	0Ah
		push	[bp+var_30]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_2E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_2C]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_30]
		jmp	short loc_52417

loc_52414:
		mov	ax, [bp+var_30]

loc_52417:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_38], ax
		mov	ax, [si+8Fh]
		add	ax, 8
		mov	[bp+var_3A], ax
		mov	ax, [si+8Fh]
		add	ax, 9
		mov	[bp+var_3C], ax
		mov	ax, si
		add	ax, 95h
		mov	[bp+var_3E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_40], ax
		or	ax, ax
		jnz	short loc_5245B
		jmp	loc_52519

loc_5245B:
		push	0Ch
		push	50h
		push	70h
		push	5Eh
		push	[bp+var_40]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		mov	bx, [bp+var_40]
		mov	ax, [bp+var_3E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_40]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_40]
		mov	ax, [bp+var_3C]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_40]
		jmp	short loc_5251C

loc_52519:
		mov	ax, [bp+var_40]

loc_5251C:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_48], ax
		mov	ax, [si+8Fh]
		add	ax, 0Ah
		mov	[bp+var_4A], ax
		mov	ax, [si+8Fh]
		add	ax, 0Bh
		mov	[bp+var_4C], ax
		mov	ax, si
		add	ax, 95h
		mov	[bp+var_4E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5255F
		jmp	loc_525EF

loc_5255F:
		push	0Bh
		push	14h
		push	29h
		push	9
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+0Eh], 738h
		mov	ax, [bp+var_4E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 76Ch
		mov	ax, [bp+var_4C]
		mov	[di+2Eh], ax
		mov	word ptr [di+0Eh], 6D0h
		mov	ax, di
		jmp	short loc_525F1

loc_525EF:
		mov	ax, di

loc_525F1:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		push	0Ah
		push	5
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_56], ax
		mov	ax, [si+8Fh]
		add	ax, 0Ch
		mov	[bp+var_58], ax
		mov	ax, [si+8Fh]
		add	ax, 0Dh
		mov	[bp+var_5A], ax
		mov	ax, si
		add	ax, 95h
		mov	[bp+var_5C], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5E], ax
		or	ax, ax
		jnz	short loc_52644
		jmp	loc_5270A

loc_52644:
		push	0Bh
		push	14h
		push	53h
		push	9
		push	[bp+var_5E]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		mov	bx, [bp+var_5E]
		mov	ax, [bp+var_5C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+2Ch], 5
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_5E]
		mov	ax, [bp+var_5A]
		mov	[bx+2Eh], ax
		mov	bx, [bp+var_5E]
		mov	word ptr [bx+0Eh], 69Ch
		mov	ax, [bp+var_5E]
		jmp	short loc_5270D

loc_5270A:
		mov	ax, [bp+var_5E]

loc_5270D:
		push	ax
		push	si
		call	sub_12B45
		add	sp, 6
		push	0Ah
		push	5
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_14B1A
		add	sp, 6
		push	0
		push	word ptr [si+97h]
		push	si
		call	sub_12B45
		add	sp, 6
		push	word_4D36E
		mov	ax, si
		add	ax, 0A3h
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [si+0A7h], 6Eh
		mov	word ptr [si+0A9h], 38h
		mov	word ptr [si+0ABh], 0E9h
		mov	word ptr [si+0ADh], 42h
		push	word_4D36E
		mov	ax, si
		add	ax, 0B1h
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [si+0B5h], 6Eh
		mov	word ptr [si+0B7h], 47h
		mov	word ptr [si+0B9h], 0E9h
		mov	word ptr [si+0BBh], 79h
		push	word_4D36E
		mov	ax, si
		add	ax, 0BFh
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [si+0C3h], 5Dh
		mov	word ptr [si+0C5h], 52h
		mov	word ptr [si+0C7h], 67h
		mov	word ptr [si+0C9h], 6Eh
		pop	di
		pop	si
		leave
		retf
sub_52028		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_527B7		proc far

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
		jz	short loc_527CE
		jmp	loc_5284F

loc_527CE:
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h
		mov	ax, si
		add	ax, 0BFh
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		mov	[bp+var_2], 52h
		cmp	word ptr [si+79h], 0
		jle	short loc_5281A
		mov	ax, [si+77h]
		mov	dx, 19h
		imul	dx
		cwd
		idiv	word ptr [si+79h]
		add	[bp+var_2], ax

loc_5281A:
		mov	ax, [si+8Fh]
		add	ax, 0Eh
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		push	5Dh
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch

loc_5284F:
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	di, ax
		cmp	byte ptr [si+74h], 0
		jnz	short loc_52869
		or	di, di
		jnz	short loc_52875

loc_52869:
		mov	bx, di
		mov	byte ptr [bx+si+7Bh], 5Fh
		mov	bx, di
		mov	byte ptr [bx+si+7Ch], 0

loc_52875:
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h
		mov	ax, si
		add	ax, 0A3h
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	word_4BD04
		push	0
		mov	ax, si
		add	ax, 7Bh
		push	ax
		push	3Ah
		push	71h
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		cmp	byte ptr [si+74h], 0
		jnz	short loc_528C9
		or	di, di
		jnz	short loc_528CF

loc_528C9:
		mov	bx, di
		mov	byte ptr [bx+si+7Bh], 0

loc_528CF:
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_528DE
		cmp	byte ptr [si+75h], 0
		jz	short loc_52937

loc_528DE:
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h
		mov	ax, si
		add	ax, 0B1h
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	word ptr [si+97h]
		mov	bx, [si+97h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52933
		push	si
		call	sub_143FC
		add	sp, 2

loc_52933:
		mov	byte ptr [si+75h], 0

loc_52937:
		pop	di
		pop	si
		leave
		retf
sub_527B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5293B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+77h], 0
		jle	short loc_52953
		dec	word ptr [si+77h]
		push	si
		push	cs
		call	near ptr sub_527B7
		add	sp, 2

loc_52953:
		pop	si
		pop	bp
		retf
sub_5293B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52956		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+77h]
		cmp	ax, [si+79h]
		jge	short loc_52970
		inc	word ptr [si+77h]
		push	si
		push	cs
		call	near ptr sub_527B7
		add	sp, 2

loc_52970:
		pop	si
		pop	bp
		retf
sub_52956		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52973		proc far

var_9E		= word ptr -9Eh
var_69		= word ptr -69h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_E		= dword ptr -0Eh
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
		jmp	loc_533E1

loc_52982:
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52A10
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h
		mov	ax, si
		add	ax, 0BFh
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		mov	di, 52h
		cmp	word ptr [si+79h], 0
		jle	short loc_529DD
		mov	ax, [si+77h]
		mov	dx, 19h
		imul	dx
		cwd
		idiv	word ptr [si+79h]
		add	di, ax

loc_529DD:
		mov	ax, [si+8Fh]
		add	ax, 0Eh
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	5Dh
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch

loc_52A10:
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52A4B
		mov	ax, [si+8Fh]
		inc	ax
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	24h
		push	72h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch

loc_52A4B:
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	byte ptr [si+74h], 0
		jnz	short loc_52A68
		cmp	[bp+var_2], 0
		jnz	short loc_52A76

loc_52A68:
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+si+7Bh], 5Fh
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+si+7Ch], 0

loc_52A76:
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h
		mov	ax, si
		add	ax, 0A3h
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	word_4BD04
		push	0
		mov	ax, si
		add	ax, 7Bh
		push	ax
		push	3Ah
		push	71h
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		cmp	byte ptr [si+74h], 0
		jnz	short loc_52ACC
		cmp	[bp+var_2], 0
		jnz	short loc_52AD3

loc_52ACC:
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+si+7Bh], 0

loc_52AD3:
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_52AE2
		cmp	byte ptr [si+75h], 0
		jz	short loc_52B3B

loc_52AE2:
		push	word ptr [si+8Fh]
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	1Eh
		push	50h
		mov	ax, si
		add	ax, 0B1h
		push	ax
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	word ptr [si+97h]
		mov	bx, [si+97h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52B37
		push	si
		call	sub_143FC
		add	sp, 2

loc_52B37:
		mov	byte ptr [si+75h], 0

loc_52B3B:
		mov	word ptr [si+95h], 0
		cmp	byte ptr [si+74h], 0
		jz	short loc_52B6F
		mov	byte ptr [bp+var_A], 0

loc_52B4B:
		push	0FFh
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		mov	al, byte ptr [bp+var_E+1]
		mov	ah, 0
		mov	[si+6Ch], ax
		cmp	byte ptr [bp+var_E], 2
		jnz	short loc_52B4B
		call	Keyboard_DrainBufferBIOS_45C38
		jmp	short loc_52B7A

loc_52B6F:
		push	1
		push	si
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_52B7A:
		mov	[bp+var_3], 0
		cmp	word ptr [si+6Ch], 10h
		jl	short loc_52B8A
		cmp	word ptr [si+6Ch], 19h
		jle	short loc_52BAE

loc_52B8A:
		cmp	word ptr [si+6Ch], 1Eh
		jl	short loc_52B96
		cmp	word ptr [si+6Ch], 26h
		jle	short loc_52BAE

loc_52B96:
		cmp	word ptr [si+6Ch], 2Ch
		jl	short loc_52BA2
		cmp	word ptr [si+6Ch], 32h
		jle	short loc_52BAE

loc_52BA2:
		cmp	word ptr [si+6Ch], 2
		jl	short loc_52C0C
		cmp	word ptr [si+6Ch], 0Ch
		jg	short loc_52C0C

loc_52BAE:
		cmp	byte ptr [si+74h], 0
		jnz	short loc_52BC9
		mov	byte ptr [si+7Bh], 0
		mov	bx, [si+97h]
		mov	word ptr [bx+2Ch], 0
		mov	byte ptr [si+75h], 1
		mov	byte ptr [si+74h], 1

loc_52BC9:
		mov	bx, [si+6Ch]
		mov	al, [bx+5468h]
		mov	[bp+var_3], al
		cmp	[bp+var_3], 61h
		jl	short loc_52BE7
		cmp	[bp+var_3], 7Ah
		jg	short loc_52BE7
		mov	al, [bp+var_3]
		add	al, 0E0h
		mov	[bp+var_3], al

loc_52BE7:
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	di, ax
		cmp	di, 8
		jge	short loc_52C0A
		mov	bx, di
		mov	al, [bp+var_3]
		mov	[bx+si+7Bh], al
		mov	bx, di
		mov	byte ptr [bx+si+7Ch], 0

loc_52C0A:
		jmp	short loc_52C4C

loc_52C0C:
		cmp	word ptr [si+6Ch], 0Eh
		jnz	short loc_52C4C
		cmp	byte ptr [si+74h], 0
		jnz	short loc_52C29
		mov	bx, [si+97h]
		mov	word ptr [bx+2Ch], 0
		mov	byte ptr [si+75h], 1
		mov	byte ptr [si+74h], 1

loc_52C29:
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_52C43
		mov	bx, di
		mov	byte ptr [bx+si+7Ah], 0

loc_52C43:
		cmp	di, 1
		jnz	short loc_52C4C
		mov	byte ptr [si+74h], 0

loc_52C4C:
		cmp	word ptr [si+6Ch], 1
		jnz	short loc_52C69
		cmp	byte ptr [si+74h], 0
		jz	short loc_52C62
		mov	byte ptr [si+7Bh], 0
		mov	byte ptr [si+74h], 0
		jmp	short loc_52C66

loc_52C62:
		mov	byte ptr [si+73h], 1

loc_52C66:
		jmp	loc_533E1

loc_52C69:
		cmp	word ptr [si+6Ch], 1Ch
		jz	short loc_52C72
		jmp	loc_53048

loc_52C72:
		cmp	byte ptr [si+74h], 0
		jnz	short loc_52C7B
		jmp	loc_53048

loc_52C7B:
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		jmp	short loc_52CB5

loc_52C86:
		push	[bp+var_6]
		mov	ax, [si+97h]
		add	ax, 24h
		push	ax
		call	sub_1623E
		add	sp, 4
		push	ax
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_52CB2
		mov	[bp+var_4], 1
		jmp	short loc_52CC1

loc_52CB2:
		inc	[bp+var_6]

loc_52CB5:
		mov	bx, [si+97h]
		mov	ax, [bx+22h]
		cmp	ax, [bp+var_6]
		jg	short loc_52C86

loc_52CC1:
		cmp	byte ptr [si+72h], 0
		jnz	short loc_52CCA
		jmp	loc_52FB6

loc_52CCA:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52CDA
		mov	[bp+var_4], 1
		jmp	loc_52FB6

loc_52CDA:
		push	si
		call	sub_143FC
		add	sp, 2
		push	2Ch
		push	84h
		push	55h
		push	65h
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		cmp	[bp+var_69], 0
		jnz	short loc_52D05
		mov	[bp+var_4F], 0
		jmp	short loc_52D05

loc_52D05:
		mov	[bp+var_8], 0
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_A], ax
		mov	ax, [si+8Fh]
		add	ax, 0Fh
		mov	word ptr [bp+var_E+2], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	bx, [bp+var_A]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_12+1], al
		mov	eax, [bp+var_10]
		mov	[bp+var_4E], eax
		mov	al, byte ptr [bp+var_12+1]
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
		add	ax, 99h
		mov	[bp+var_14], ax
		mov	ax, [si+8Fh]
		add	ax, 11h
		mov	[bp+var_16], ax
		mov	ax, [si+8Fh]
		add	ax, 12h
		mov	word ptr [bp+var_1A+2], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_52D8B
		jmp	loc_52E16

loc_52D8B:
		push	0Ch
		push	2Eh
		push	19h
		push	12h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	bx, [bp+var_14]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_1E+1], al
		mov	eax, [bp+var_1C]
		mov	[di+1Eh], eax
		mov	al, byte ptr [bp+var_1E+1]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_16]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_8]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	ax, word ptr [bp+var_1A+2]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_52E18

loc_52E16:
		mov	ax, di

loc_52E18:
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	31h
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_20], ax
		mov	ax, [si+8Fh]
		add	ax, 13h
		mov	[bp+var_22], ax
		mov	ax, [si+8Fh]
		add	ax, 14h
		mov	[bp+var_24], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_28+2], ax
		or	ax, ax
		jnz	short loc_52E58
		jmp	loc_52F16

loc_52E58:
		push	0Ch
		push	2Ch
		push	19h
		push	45h
		push	word ptr [bp+var_28+2]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_28+2]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, word ptr [bp+var_28+2]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, word ptr [bp+var_28+2]
		mov	byte ptr [bx+22h], 2
		mov	bx, word ptr [bp+var_28+2]
		mov	byte ptr [bx+23h], 0
		mov	bx, word ptr [bp+var_28+2]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_20]
		mov	al, [bx+4]
		mov	[bp+var_2B], al
		mov	bx, word ptr [bp+var_28+2]
		mov	eax, [bp+var_2A]
		mov	[bx+1Eh], eax
		mov	bx, word ptr [bp+var_28+2]
		mov	al, [bp+var_2B]
		mov	[bx+22h], al
		mov	bx, word ptr [bp+var_28+2]
		mov	byte ptr [bx+23h], 0
		mov	bx, word ptr [bp+var_28+2]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx+6]
		mov	bx, word ptr [bp+var_28+2]
		mov	[bx+24h], eax
		mov	bx, word ptr [bp+var_28+2]
		mov	ax, [bp+var_22]
		mov	[bx+28h], ax
		mov	bx, word ptr [bp+var_28+2]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_8]
		mov	bx, word ptr [bp+var_28+2]
		mov	[bx+2Ah], ax
		mov	bx, word ptr [bp+var_28+2]
		mov	word ptr [bx+2Ch], 2
		mov	bx, word ptr [bp+var_28+2]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, word ptr [bp+var_28+2]
		mov	ax, [bp+var_24]
		mov	[bx+2Eh], ax
		mov	ax, word ptr [bp+var_28+2]
		jmp	short loc_52F19

loc_52F16:
		mov	ax, word ptr [bp+var_28+2]

loc_52F19:
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_128E5
		add	sp, 2
		mov	ax, [si+8Fh]
		add	ax, 10h
		push	ax
		push	0
		mov	al, [si+9Dh]
		push	ax
		push	word ptr [si+9Bh]
		push	word ptr [si+99h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	60h
		push	77h
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch

loc_52F68:
		push	1
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4
		cmp	[bp+var_8], 0
		jz	short loc_52F68
		cmp	[bp+var_8], 2
		jnz	short loc_52F87
		mov	[bp+var_4], 0

loc_52F87:
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12910
		add	sp, 2
		push	si
		call	sub_143DD
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_125CF
		add	sp, 4

loc_52FB6:
		cmp	[bp+var_4], 0
		jz	short loc_5302F
		mov	ax, si
		add	ax, 7Bh
		push	ax
		push	2FAh
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 7Bh
		push	ax
		push	word ptr [si+91h]
		call	CRT_Strcpy
		add	sp, 4
		push	word ptr [si+91h]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_53029
		push	word ptr [si+91h]
		mov	ax, [si+97h]
		add	ax, 24h
		push	ax
		call	sub_161DF
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5301A
		push	42D8h
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_53029

loc_5301A:
		push	42D3h
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4

loc_53029:
		mov	byte ptr [si+73h], 1
		jmp	short loc_53045

loc_5302F:
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53045
		push	7
		push	605h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4

loc_53045:
		jmp	loc_533E1

loc_53048:
		cmp	word ptr [si+6Ah], 0
		jnz	short loc_53051
		jmp	loc_533E1

loc_53051:
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_5305D
		jmp	loc_533E1

loc_5305D:
		mov	bx, [si+97h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_53080
		mov	byte ptr [si+76h], 1
		mov	bx, [si+97h]
		push	word ptr [bx+2Ch]
		mov	ax, si
		add	ax, 7Bh
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_53080:
		mov	ax, [si+95h]
		cmp	ax, 1
		jz	short loc_5309C
		cmp	ax, 2
		jnz	short loc_53091
		jmp	loc_53133

loc_53091:
		cmp	ax, 3
		jnz	short loc_53099
		jmp	loc_5313A

loc_53099:
		jmp	loc_533E1

loc_5309C:
		cmp	byte ptr [si+7Bh], 0
		jnz	short loc_530A5
		jmp	loc_53130

loc_530A5:
		mov	ax, si
		add	ax, 7Bh
		push	ax
		push	2FAh
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 7Bh
		push	ax
		push	word ptr [si+91h]
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5311D
		push	word ptr [si+91h]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_5311B
		push	word ptr [si+91h]
		mov	ax, [si+97h]
		add	ax, 24h
		push	ax
		call	sub_161DF
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5310C
		push	42D8h
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_5311B

loc_5310C:
		push	42D3h
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4

loc_5311B:
		jmp	short loc_5312C

loc_5311D:
		push	42D8h
		push	word ptr [si+91h]
		call	CRT_Strcat
		add	sp, 4

loc_5312C:
		mov	byte ptr [si+73h], 1

loc_53130:
		jmp	loc_533E1

loc_53133:
		mov	byte ptr [si+73h], 1
		jmp	loc_533E1

loc_5313A:
		push	2Ch
		push	84h
		push	55h
		push	65h
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		cmp	[bp+var_69], 0
		jnz	short loc_5315C
		mov	[bp+var_4F], 0
		jmp	short loc_5315C

loc_5315C:
		mov	[bp+var_6], 0
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_8], ax
		mov	ax, [si+8Fh]
		add	ax, 0Fh
		mov	[bp+var_A], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_E], eax
		mov	bx, [bp+var_8]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_10+1], al
		mov	eax, [bp+var_E]
		mov	[bp+var_4E], eax
		mov	al, byte ptr [bp+var_10+1]
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
		add	ax, 99h
		mov	[bp+var_12], ax
		mov	ax, [si+8Fh]
		add	ax, 11h
		mov	[bp+var_14], ax
		mov	ax, [si+8Fh]
		add	ax, 12h
		mov	[bp+var_16], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_531E2
		jmp	loc_5326D

loc_531E2:
		push	0Ch
		push	2Eh
		push	19h
		push	12h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		mov	bx, [bp+var_12]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_1C+1], al
		mov	eax, [bp+var_1A]
		mov	[di+1Eh], eax
		mov	al, byte ptr [bp+var_1C+1]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_12]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_14]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_6]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	ax, [bp+var_16]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_5326F

loc_5326D:
		mov	ax, di

loc_5326F:
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	31h
		mov	ax, si
		add	ax, 99h
		mov	[bp+var_1E], ax
		mov	ax, [si+8Fh]
		add	ax, 13h
		mov	[bp+var_20], ax
		mov	ax, [si+8Fh]
		add	ax, 14h
		mov	[bp+var_22], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_24], ax
		or	ax, ax
		jnz	short loc_532AF
		jmp	loc_5336D

loc_532AF:
		push	0Ch
		push	2Ch
		push	19h
		push	45h
		push	[bp+var_24]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_24]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	bx, [bp+var_1E]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_2A+1], al
		mov	bx, [bp+var_24]
		mov	eax, [bp+var_28]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_24]
		mov	al, byte ptr [bp+var_2A+1]
		mov	[bx+22h], al
		mov	bx, [bp+var_24]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_24]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_24]
		mov	[bx+24h], eax
		mov	bx, [bp+var_24]
		mov	ax, [bp+var_20]
		mov	[bx+28h], ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_6]
		mov	bx, [bp+var_24]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_24]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_24]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_24]
		mov	ax, [bp+var_22]
		mov	[bx+2Eh], ax
		mov	ax, [bp+var_24]
		jmp	short loc_53370

loc_5336D:
		mov	ax, [bp+var_24]

loc_53370:
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_128E5
		add	sp, 2

loc_5338B:
		push	1
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4
		cmp	[bp+var_6], 0
		jz	short loc_5338B
		cmp	[bp+var_6], 1
		jnz	short loc_533B0
		push	1
		call	PagedResourceC_RefreshAndFinalize_35E0F
		add	sp, 2

loc_533B0:
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_12910
		add	sp, 2
		push	si
		call	sub_143DD
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_125CF
		add	sp, 4
		jmp	short loc_533E1

loc_533E1:
		mov	al, [si+73h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_533ED
		jmp	loc_52982

loc_533ED:
		pop	di
		pop	si
		leave
		retf
sub_52973		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_533F1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_48FD4
		push	cs
		call	near ptr sub_5293B
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_533F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53406		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_48FD4
		push	cs
		call	near ptr sub_52956
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_53406		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gameflow_SaveRequester_4D984 (sub_4D984 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE en surface 2026-10-22. Commande 10h : choix du fichier de sauvegarde ; nom rendu dans le
; tampon arg.
; ==============================================================================================
Gameflow_SaveRequester_5341B		proc far

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
var_39		= dword ptr -39h
var_35		= byte ptr -35h
var_34		= byte ptr -34h
var_33		= dword ptr -33h
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
		cmp	byte ptr [si+0FDh], 1Dh
		jnz	short loc_53433
		mov	di, 15h

loc_53433:
		push	96h
		push	8Ch
		push	1Eh
		push	50h
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		mov	[bp+var_C4], 660h
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
		mov	word_48FD4, ax
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
		call	near ptr sub_52028
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_128E5
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		push	cs
		call	near ptr sub_52973
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_12910
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_4555C
		lea	ax, [bp+var_13]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_21]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_2F]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		cmp	[bp+var_34], 0
		jz	short loc_53558
		cmp	[bp+var_39], 0
		jz	short loc_53558
		push	0
		mov	al, [bp+var_35]
		push	ax
		lea	ax, word ptr [bp+var_39]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_53558

loc_53558:
		mov	[bp+var_39], 0
		mov	[bp+var_34], 0
		mov	[bp+var_33], 0
		push	0
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_125CF
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_SaveRequester_5341B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-07 (par comparaison avec Gameflow_SaveGameFile_4DAE8 d'OPTEST). Écrit la
; structure de partie dans un fichier (appelée par le stub sub_47907, entre autres depuis
; Gameflow_SaveTmpState_5140A pour tmpsav.tm1), champ par champ : sub_40430 = 1 octet,
; sub_40413 = 1 mot, sub_4044D = 1 dword, StreamReader_WriteTyped_42F91 = n octets. Octets 0 à
; 579 comme OPTEST, champs de la partie décalés d'un octet en mémoire : 0 en-tête 7 octets
; (word_48CD8 = 0414h, « SCB1.22 ») ; 7 [+250] ; 8 [+251] ; 9 [+252] ; 10 [+253] ; 11 256
; drapeaux [+254] ; 267 100 octets [+510] ; 367 9 mots [+610] ; 385 4 × (octet [+628+2i],
; octet [+629+2i]) ; 393 dword [+636] ; 397 dword [+640] ; 401 dword [+644] ; 405 dword [+648]
; ; 409 8 pilotes × 3 mots [+672+26i], [+674+26i], [+676+26i] ; 457 20 octets [+921] ; 477 20
; octets [+941] ; 497 20 octets [+961] ; 517 mot [+981] ; 519 61 octets [+860]. Différences
; avec OPTEST : 580 8 octets dseg 0EB6h (drapeaux des personnages, 7 dans OPTEST) ; 588 4
; octets [+984] à [+987] (3e à 6e valeurs de STAT ; OPTEST : 1 octet) ; 592 octet [+983] (7e
; valeur de STAT) ; 593 octet [+988] (morceau PLAY_GAMEFLOW_TUNE) ; 594 dword score [+989].
; Taille 598 octets.
; ==============================================================================================
Gameflow_SaveGameFile_5357F		proc far

var_68		= word ptr -68h
var_B		= dword ptr -0Bh
var_7		= dword ptr -7
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
		jnz	short loc_53595
		jmp	loc_5388F

loc_53595:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_68], 480h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 5BDh
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
		push	word_48CD8
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		mov	al, [si+0FAh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+0FBh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+0FCh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+0FDh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		xor	di, di
		jmp	short loc_53655

loc_5363E:
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+0FEh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		inc	di

loc_53655:
		cmp	di, 100h
		jl	short loc_5363E
		xor	di, di
		jmp	short loc_53676

loc_5365F:
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+1FEh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		inc	di

loc_53676:
		cmp	di, 64h
		jl	short loc_5365F
		xor	di, di
		jmp	short loc_53697

loc_5367F:
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+262h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40413
		add	sp, 8
		inc	di

loc_53697:
		cmp	di, 9
		jl	short loc_5367F
		xor	di, di
		jmp	short loc_536D1

loc_536A0:
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+274h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	bx, di
		shl	bx, 1
		mov	al, [bx+si+275h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		inc	di

loc_536D1:
		cmp	di, 4
		jl	short loc_536A0
		push	large 0FFFFFFFFh
		push	large [si+27Ch]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4044D
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		push	large [si+280h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4044D
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		push	large [si+284h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4044D
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		push	large [si+288h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4044D
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_5377F

loc_5372A:
		push	large 0FFFFFFFFh
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+2A0h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40413
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+2A2h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40413
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		push	word ptr [bx+si+2A4h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40413
		add	sp, 8
		inc	di

loc_5377F:
		cmp	di, 8
		jl	short loc_5372A
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 399h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3ADh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3C1h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	word ptr [si+3D5h]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40413
		add	sp, 8
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 35Ch
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		xor	di, di
		jmp	short loc_53814

loc_537FF:
		push	large 0FFFFFFFFh
		mov	al, [di+0EB6h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		inc	di

loc_53814:
		cmp	di, 8
		jl	short loc_537FF
		xor	di, di
		jmp	short loc_53834

loc_5381D:
		push	large 0FFFFFFFFh
		mov	bx, di
		mov	al, [bx+si+3D8h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		inc	di

loc_53834:
		cmp	di, 4
		jl	short loc_5381D
		push	large 0FFFFFFFFh
		mov	al, [si+3D7h]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		push	large 0FFFFFFFFh
		mov	al, [si+3DCh]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	sub_40430
		add	sp, 8
		push	large 0FFFFFFFFh
		push	large [si+3DDh]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4044D
		add	sp, 0Ah
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_5388F:
		pop	di
		pop	si
		leave
		retf
Gameflow_SaveGameFile_5357F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gameflow_LoadRequester_4DDDC (sub_4DDDC de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE en surface 2026-10-22. Commande 11h : choix du fichier à charger (nom en partie+93h) ;
; si choisi, [partie+0E8h] = 3.
; ==============================================================================================
Gameflow_LoadRequester_53893		proc far

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
var_39		= dword ptr -39h
var_35		= byte ptr -35h
var_34		= byte ptr -34h
var_33		= dword ptr -33h
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
		cmp	byte ptr [si+0FDh], 1Dh
		jnz	short loc_538AB
		mov	di, 15h

loc_538AB:
		cmp	[bp+arg_2], 1
		jnz	short loc_538B4
		mov	di, 2Ah

loc_538B4:
		push	96h
		push	8Ch
		push	1Eh
		push	50h
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		mov	[bp+var_C4], 660h
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
		mov	word_48FD4, ax
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
		add	ax, 94h
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
		call	near ptr sub_52028
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_128E5
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		push	cs
		call	near ptr sub_52973
		add	sp, 2
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_12910
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_4555C
		lea	ax, [bp+var_13]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_21]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_2F]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		cmp	[bp+var_34], 0
		jz	short loc_539DB
		cmp	[bp+var_39], 0
		jz	short loc_539DB
		push	0
		mov	al, [bp+var_35]
		push	ax
		lea	ax, word ptr [bp+var_39]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_539DB

loc_539DB:
		mov	[bp+var_39], 0
		mov	[bp+var_34], 0
		mov	[bp+var_33], 0
		push	0
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_125CF
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_LoadRequester_53893		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53A02		proc far

var_68		= word ptr -68h
var_B		= dword ptr -0Bh
var_7		= dword ptr -7
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
		jnz	short loc_53A18
		jmp	loc_53D50

loc_53A18:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_68], 480h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 5BDh
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [bp+var_68]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4788D
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53A77
		push	word_48CD8
		push	608h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_53A77:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[si+0FAh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[si+0FBh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[si+0FCh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[si+0FDh], al
		xor	di, di
		jmp	short loc_53ADD

loc_53AC7:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	bx, di
		mov	[bx+si+0FEh], al
		inc	di

loc_53ADD:
		cmp	di, 100h
		jl	short loc_53AC7
		xor	di, di
		jmp	short loc_53AFD

loc_53AE7:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	bx, di
		mov	[bx+si+1FEh], al
		inc	di

loc_53AFD:
		cmp	di, 64h
		jl	short loc_53AE7
		xor	di, di
		jmp	short loc_53B1E

loc_53B06:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+262h], ax
		inc	di

loc_53B1E:
		cmp	di, 9
		jl	short loc_53B06
		xor	di, di
		jmp	short loc_53B56

loc_53B27:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+274h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	bx, di
		shl	bx, 1
		mov	[bx+si+275h], al
		inc	di

loc_53B56:
		cmp	di, 4
		jl	short loc_53B27
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_404B0
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+27Ch], eax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_404B0
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+280h], eax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_404B0
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+284h], eax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_404B0
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+288h], eax
		xor	di, di
		jmp	short loc_53C2E

loc_53BD3:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A0h], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A2h], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A4h], ax
		inc	di

loc_53C2E:
		cmp	di, 8
		jl	short loc_53BD3
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 399h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3ADh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3C1h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		mov	[si+3D5h], ax
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 35Ch
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		xor	di, di
		jmp	short loc_53CC2

loc_53CAE:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[di+0EB6h], al
		inc	di

loc_53CC2:
		cmp	di, 8
		jl	short loc_53CAE
		xor	di, di
		jmp	short loc_53CE1

loc_53CCB:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	bx, di
		mov	[bx+si+3D8h], al
		inc	di

loc_53CE1:
		cmp	di, 4
		jl	short loc_53CCB
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[si+3D7h], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[si+3DCh], al
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_404B0
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[si+3DDh], eax
		mov	al, [si+3DCh]
		push	ax
		call	Music_PlayGameflowTune_2D9E3
		add	sp, 2
		lea	ax, [bp+var_68]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_53D50:
		pop	di
		pop	si
		leave
		retf
sub_53A02		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53D54		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 0
		jnz	short loc_53D6A
		jmp	loc_53EAF

loc_53D6A:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_6A], 480h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 5BDh
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_4788D
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53DC9
		push	word_48CD8
		push	634h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_53DC9:
		xor	di, di
		jmp	short loc_53DE0

loc_53DCD:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[bp+var_3], al
		inc	di

loc_53DE0:
		cmp	di, 192h
		jl	short loc_53DCD
		xor	di, di
		jmp	short loc_53E45

loc_53DEA:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A0h], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A2h], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	Handle_ReadWordField_4046A
		add	sp, 6
		push	ax
		mov	ax, di
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		pop	ax
		mov	[bx+si+2A4h], ax
		inc	di

loc_53E45:
		cmp	di, 8
		jl	short loc_53DEA
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 399h
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3ADh
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		mov	ax, si
		add	ax, 3C1h
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_53EAF:
		pop	di
		pop	si
		leave
		retf
sub_53D54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53EB3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_53EC5
		jmp	loc_53F4D

loc_53EC5:
		mov	ax, si
		add	ax, 0BFh
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		mov	ax, si
		add	ax, 0B1h
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		mov	ax, si
		add	ax, 0A3h
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		cmp	byte ptr [si+9Eh], 0
		jz	short loc_53F18
		cmp	dword ptr [si+99h], 0
		jz	short loc_53F18
		push	0
		mov	al, [si+9Dh]
		push	ax
		mov	ax, si
		add	ax, 99h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_53F18

loc_53F18:
		mov	dword ptr [si+99h], 0
		mov	byte ptr [si+9Eh], 0
		mov	dword ptr [si+9Fh], 0
		push	0
		push	si
		call	sub_125CF
		add	sp, 4
		test	di, 1
		jz	short loc_53F4B
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_53F4B

loc_53F4B:
		jmp	short loc_53F4D

loc_53F4D:
		pop	di
		pop	si
		pop	bp
		retf
sub_53EB3		endp

; START OF FUNCTION CHUNK FOR sub_53EB3
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_53EB3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53F55		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_53FBA
		cmp	byte ptr [si+23h], 0
		jz	short loc_53F8A
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_53F8A
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_53F8A

loc_53F8A:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_53FB8
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_53FB8

loc_53FB8:
		jmp	short loc_53FBA

loc_53FBA:
		pop	di
		pop	si
		pop	bp
		retf
sub_53F55		endp

; START OF FUNCTION CHUNK FOR sub_53F55
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_53F55

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53FC2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_54027
		cmp	byte ptr [si+23h], 0
		jz	short loc_53FF7
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_53FF7
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_53FF7

loc_53FF7:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_54025
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_54025

loc_54025:
		jmp	short loc_54027

loc_54027:
		pop	di
		pop	si
		pop	bp
		retf
sub_53FC2		endp

; START OF FUNCTION CHUNK FOR sub_53FC2
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_53FC2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5402F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_54094
		cmp	byte ptr [si+23h], 0
		jz	short loc_54064
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_54064
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_54064

loc_54064:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_54092
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_54092

loc_54092:
		jmp	short loc_54094

loc_54094:
		pop	di
		pop	si
		pop	bp
		retf
sub_5402F		endp

; START OF FUNCTION CHUNK FOR sub_5402F
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_5402F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5409C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_54101
		cmp	byte ptr [si+23h], 0
		jz	short loc_540D1
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_540D1
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_540D1

loc_540D1:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_540FF
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_540FF

loc_540FF:
		jmp	short loc_54101

loc_54101:
		pop	di
		pop	si
		pop	bp
		retf
sub_5409C		endp

; START OF FUNCTION CHUNK FOR sub_5409C
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_5409C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54109		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5416E
		cmp	byte ptr [si+23h], 0
		jz	short loc_5413E
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_5413E
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5413E

loc_5413E:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_5416C
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_5416C

loc_5416C:
		jmp	short loc_5416E

loc_5416E:
		pop	di
		pop	si
		pop	bp
		retf
sub_54109		endp

; START OF FUNCTION CHUNK FOR sub_54109
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_54109

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54176		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_541AE
		mov	word ptr [si], 7A0h
		push	si
		call	sub_162DD
		add	sp, 2
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_541AE
		push	si
		call	sub_39C
		add	sp, 2

loc_541AE:
		pop	di
		pop	si
		pop	bp
		retf
sub_54176		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_541B2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, 1
		jz	short loc_541C3
		jmp	short loc_541D3

loc_541C3:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		mov	ax, 1
		pop	si
		pop	bp
		retf

loc_541D3:
		xor	ax, ax
		pop	si
		pop	bp
		retf
sub_541B2		endp

; START OF FUNCTION CHUNK FOR sub_541B2
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_541B2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_541DB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5422C
		mov	word ptr [si+24h], 7A0h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_162DD
		add	sp, 2
		mov	word ptr [si+24h], 1E4h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_36702
		add	sp, 2
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_5422A
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_5422A

loc_5422A:
		jmp	short loc_5422C

loc_5422C:
		pop	di
		pop	si
		pop	bp
		retf
sub_541DB		endp

; START OF FUNCTION CHUNK FOR sub_541DB
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_541DB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54234		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_54285
		mov	word ptr [si+24h], 7A0h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_162DD
		add	sp, 2
		mov	word ptr [si+24h], 1E4h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_36702
		add	sp, 2
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_54283
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_54283

loc_54283:
		jmp	short loc_54285

loc_54285:
		pop	di
		pop	si
		pop	bp
		retf
sub_54234		endp

; START OF FUNCTION CHUNK FOR sub_54234
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_54234
ovr189		ends
