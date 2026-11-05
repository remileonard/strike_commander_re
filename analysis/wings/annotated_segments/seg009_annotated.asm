seg009		segment	para public 'CODE' use16
		assume cs:seg009
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A12		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_6]
		or	dx, dx
		jz	short loc_5A32
		push	[bp+arg_8]
		push	dx
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ax
		call	sub_2374A
		add	sp, 0Ah

loc_5A32:
		pop	bp
		retf
sub_5A12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A34		proc far

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
		jmp	loc_5AE2

loc_5A61:
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp+var_A]
		mov	[bp+var_C], ax
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_2357F
		add	sp, 4
		mov	[bp+var_E], ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_5AB8
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_E]
		jnz	short loc_5AB8
		mov	ax, word_5BF28
		mov	[bp+var_8], ax
		mov	ax, word_5BF22
		mov	[bp+var_6], ax
		mov	al, byte ptr [bp+var_6]
		push	ax
		mov	ax, di
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	[bp+var_4]
		push	di
		push	[bp+var_2]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		jmp	short loc_5ABE

loc_5AB8:
		mov	ax, word_5BF22
		mov	[bp+var_8], ax

loc_5ABE:
		cmp	[bp+var_E], 0
		jz	short loc_5ADC
		push	word_5BF74
		push	[bp+var_8]
		push	[bp+var_E]
		push	di
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah

loc_5ADC:
		inc	[bp+var_A]
		add	di, [si+20h]

loc_5AE2:
		mov	ax, [si+30h]
		cmp	ax, [bp+var_A]
		jle	short loc_5AED
		jmp	loc_5A61

loc_5AED:
		pop	di
		pop	si
		leave
		retf
sub_5A34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5AF1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0FFFFh
		cmp	word ptr [si+2Ch], 0
		jz	short loc_5B2A
		xor	di, di
		jmp	short loc_5B25

loc_5B0B:
		push	di
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_2357F
		add	sp, 4
		cmp	ax, [si+2Ch]
		jnz	short loc_5B24
		mov	[bp+var_2], di
		jmp	short loc_5B2A

loc_5B24:
		inc	di

loc_5B25:
		cmp	[si+22h], di
		jg	short loc_5B0B

loc_5B2A:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5AF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B31		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jge	short loc_5B44
		xor	di, di
		jmp	short loc_5B4D

loc_5B44:
		cmp	[si+22h], di
		jg	short loc_5B4D
		mov	di, [si+22h]
		dec	di

loc_5B4D:
		push	di
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_2357F
		add	sp, 4
		mov	[si+2Ch], ax
		mov	bx, [si+2Eh]
		cmp	[bx], di
		jle	short loc_5B6A
		mov	[bx], di
		jmp	short loc_5B7F

loc_5B6A:
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [si+30h]
		dec	ax
		cmp	ax, di
		jge	short loc_5B7F
		mov	ax, di
		sub	ax, [si+30h]
		inc	ax
		mov	[bx], ax

loc_5B7F:
		pop	di
		pop	si
		pop	bp
		retf
sub_5B31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B83		proc far

var_DE		= word ptr -0DEh
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= word ptr -88h
var_86		= word ptr -86h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_73		= byte ptr -73h
var_72		= dword ptr -72h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
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
var_46		= word ptr -46h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2F		= byte ptr -2Fh
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
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
		sub	sp, 0DEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_5A567, 0
		jz	short loc_5BA7
		push	847h
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_5BA7:
		push	word_5B3E1
		push	word_5DD44
		call	PaletteScreen_ConstructAndBindWidget_231BC
		add	sp, 4
		mov	[bp+var_2], 12h
		mov	[bp+var_4], 58h
		mov	[bp+var_6], 5Dh
		mov	[bp+var_8], 5Dh
		mov	[bp+var_A], 30h
		mov	[bp+var_C], 2Dh
		mov	[bp+var_E], 50h
		mov	[bp+var_10], 39h
		mov	[bp+var_12], 50h
		mov	[bp+var_14], 57h
		mov	[bp+var_16], 64h
		mov	[bp+var_18], 8Ah
		mov	[bp+var_1A], 6Dh
		mov	[bp+var_1C], 7Fh
		mov	[bp+var_1E], 6Dh
		mov	word ptr [si+94h], 51h
		mov	word ptr [si+96h], 6Dh
		mov	word ptr [si+98h], 7Fh
		cmp	word ptr [si+72h], 2
		jge	short loc_5C20
		cmp	word ptr [si+78h], 0
		jz	short loc_5C2E

loc_5C20:
		push	ds
		push	offset aShp
		push	ds
		push	offset aSltp
		push	ds
		push	offset aDataGameflow
		jmp	short loc_5C55

loc_5C2E:
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jz	short loc_5C49
		push	ds
		push	offset aShp_1
		push	ds
		push	offset aSlag
		push	ds
		push	offset aDataGameflow_1
		jmp	short loc_5C55

loc_5C49:
		push	ds
		push	offset aShp_2
		push	ds
		push	offset aSlbg
		push	ds
		push	offset aDataGameflow_2

loc_5C55:
		lea	ax, [bp+var_DE]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_DE]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[si+0A4h], eax
		mov	byte ptr [si+0A8h], 3
		mov	byte ptr [si+0A9h], 1
		mov	dword ptr [si+0AAh], 0
		mov	word ptr [si+7Ah], 0
		mov	word ptr [si+9Eh], 0
		mov	ax, [bp+var_A]
		mov	[bp+var_24], ax
		mov	ax, si
		add	ax, 7Ah
		mov	[bp+var_26], ax
		mov	ax, si
		add	ax, 9Eh
		mov	[bp+var_28], ax
		push	34h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_5D24
		push	large 250062h
		push	[bp+var_24]
		push	28h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 49Ah
		mov	word ptr [di+24h], 492h
		xor	ax, ax
		mov	[di+28h], ax
		mov	[di+26h], ax
		mov	word ptr [di+24h], 496h
		mov	word ptr [di+2Ah], 0
		mov	word ptr [di+2Ch], 0
		and	byte ptr [di+10h], 0FDh
		mov	word ptr [di+16h], 0
		mov	word ptr [di+30h], 5
		mov	ax, [bp+var_28]
		mov	[di+32h], ax
		mov	ax, [bp+var_26]
		mov	[di+2Eh], ax
		mov	word ptr [di+1Eh], 2
		mov	word ptr [di+20h], 8
		mov	word ptr [di+0Eh], 4CEh
		mov	ax, di
		jmp	short loc_5D26

loc_5D24:
		mov	ax, di

loc_5D26:
		mov	[si+0A2h], ax
		mov	bx, [si+0A2h]
		mov	word ptr [bx+1Eh], 0
		cmp	word ptr [si+72h], 2
		jl	short loc_5D3D
		push	1
		jmp	short loc_5D3F

loc_5D3D:
		push	0

loc_5D3F:
		mov	ax, [si+0A2h]
		add	ax, 24h
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_62CD
		add	sp, 6
		mov	bx, [si+0A2h]
		mov	[bx+22h], ax
		mov	bx, [si+0A2h]
		mov	ax, [bx+22h]
		sub	ax, [bx+30h]
		mov	[si+7Ch], ax
		mov	word ptr [si+6Eh], 0
		mov	word ptr [si+70h], 1
		mov	di, si
		add	di, 0A4h
		mov	ax, [si+9Ah]
		mov	[bp+var_2A], ax
		mov	eax, [di]
		mov	[bp+var_2E], eax
		mov	al, [di+4]
		mov	[bp+var_2F], al
		mov	eax, [bp+var_2E]
		mov	[si+50h], eax
		mov	al, [bp+var_2F]
		mov	[si+54h], al
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		mov	eax, [di+6]
		mov	[si+56h], eax
		mov	ax, [bp+var_2A]
		mov	[si+5Ah], ax
		push	0
		mov	ax, [bp+var_2]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_34], ax
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_36], ax
		mov	ax, [si+9Ah]
		inc	ax
		mov	[bp+var_38], ax
		mov	ax, [si+9Ah]
		add	ax, 2
		mov	[bp+var_3A], ax
		mov	ax, si
		add	ax, 0A0h
		mov	[bp+var_3C], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_5DF1
		jmp	loc_5E7A

loc_5DF1:
		push	large 0C0030h
		push	[bp+var_34]
		push	[bp+var_32]
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_36]
		mov	eax, [bx]
		mov	[bp+var_40], eax
		mov	al, [bx+4]
		mov	[bp+var_41], al
		mov	eax, [bp+var_40]
		mov	[di+1Eh], eax
		mov	al, [bp+var_41]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_38]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		mov	ax, [bp+var_3C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_3A]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_5E7C

loc_5E7A:
		mov	ax, di

loc_5E7C:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	0
		mov	ax, [bp+var_4]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_46], ax
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_48], ax
		mov	ax, [si+9Ah]
		add	ax, 3
		mov	[bp+var_4A], ax
		mov	ax, [si+9Ah]
		add	ax, 4
		mov	[bp+var_4C], ax
		mov	ax, si
		add	ax, 0A0h
		mov	[bp+var_4E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_5EC9
		jmp	loc_5F52

loc_5EC9:
		push	large 0C0030h
		push	[bp+var_46]
		push	[bp+var_44]
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]
		mov	[bp+var_52], eax
		mov	al, [bx+4]
		mov	[bp+var_53], al
		mov	eax, [bp+var_52]
		mov	[di+1Eh], eax
		mov	al, [bp+var_53]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_4A]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		mov	ax, [bp+var_4E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_4C]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_5F54

loc_5F52:
		mov	ax, di

loc_5F54:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	0
		mov	ax, [bp+var_C]
		mov	[bp+var_56], ax
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_58], ax
		mov	ax, [si+9Ah]
		add	ax, 6
		mov	[bp+var_5A], ax
		mov	ax, [si+9Ah]
		add	ax, 7
		mov	[bp+var_5C], ax
		mov	ax, si
		add	ax, 0A0h
		mov	[bp+var_5E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_5F9B
		jmp	loc_6028

loc_5F9B:
		push	large 8000Fh
		push	[bp+var_56]
		push	0Fh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_58]
		mov	eax, [bx]
		mov	[bp+var_62], eax
		mov	al, [bx+4]
		mov	[bp+var_63], al
		mov	eax, [bp+var_62]
		mov	[di+1Eh], eax
		mov	al, [bp+var_63]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_5A]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		mov	ax, [bp+var_5E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 4
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_5C]
		mov	[di+2Eh], ax
		mov	word ptr [di+0Eh], 3C2h
		mov	ax, di
		jmp	short loc_602A

loc_6028:
		mov	ax, di

loc_602A:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	large 0A0005h
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		mov	ax, [bp+var_E]
		mov	[bp+var_66], ax
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_68], ax
		mov	ax, [si+9Ah]
		add	ax, 8
		mov	[bp+var_6A], ax
		mov	ax, [si+9Ah]
		add	ax, 9
		mov	[bp+var_6C], ax
		mov	ax, si
		add	ax, 0A0h
		mov	[bp+var_6E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6082
		jmp	loc_610F

loc_6082:
		push	large 8000Fh
		push	[bp+var_66]
		push	0Fh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[bp+var_72], eax
		mov	al, [bx+4]
		mov	[bp+var_73], al
		mov	eax, [bp+var_72]
		mov	[di+1Eh], eax
		mov	al, [bp+var_73]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_6A]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		mov	ax, [bp+var_6E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 5
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_6C]
		mov	[di+2Eh], ax
		mov	word ptr [di+0Eh], 38Eh
		mov	ax, di
		jmp	short loc_6111

loc_610F:
		mov	ax, di

loc_6111:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	large 0A0005h
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		mov	ax, [bp+var_10]
		mov	[bp+var_76], ax
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_78], ax
		mov	ax, [si+9Ah]
		add	ax, 5
		mov	[bp+var_7A], ax
		mov	ax, si
		add	ax, 0A0h
		mov	[bp+var_7C], ax
		push	2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_615F
		jmp	loc_61E3

loc_615F:
		push	large 130008h
		push	[bp+var_76]
		push	12h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_78]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	al, [bx+4]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[di+1Eh], eax
		mov	al, [bp+var_81]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_7A]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		mov	ax, [bp+var_7C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 6
		mov	word ptr [di+0Eh], 35Ah
		mov	ax, di
		jmp	short loc_61E5

loc_61E3:
		mov	ax, di

loc_61E5:
		push	ax
		push	si
		call	sub_208FD
		add	sp, 6
		push	large 0A0005h
		push	word ptr [si+26h]
		call	Widget_SetFlagBit4AndOffsets_22057
		add	sp, 6
		push	0
		push	word ptr [si+0A2h]
		push	si
		call	sub_208FD
		add	sp, 6
		push	word_5DD44
		mov	ax, si
		add	ax, 0AEh
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, [bp+var_12]
		mov	[bp+var_84], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_86], ax
		mov	word ptr [si+0B2h], 63h
		mov	ax, [bp+var_84]
		mov	[si+0B4h], ax
		mov	word ptr [si+0B6h], 0D2h
		mov	ax, [bp+var_86]
		mov	[si+0B8h], ax
		push	word_5DD44
		mov	ax, si
		add	ax, 0BCh
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, [bp+var_16]
		mov	[bp+var_88], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_8A], ax
		mov	word ptr [si+0C0h], 76h
		mov	ax, [bp+var_88]
		mov	[si+0C2h], ax
		mov	word ptr [si+0C4h], 0D7h
		mov	ax, [bp+var_8A]
		mov	[si+0C6h], ax
		push	word_5DD44
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, [bp+var_1A]
		mov	[bp+var_8C], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_8E], ax
		mov	word ptr [si+0CEh], 60h
		mov	ax, [bp+var_8C]
		mov	[si+0D0h], ax
		mov	word ptr [si+0D2h], 67h
		mov	ax, [bp+var_8E]
		mov	[si+0D4h], ax
		mov	ax, [bp+var_1E]
		mov	[si+7Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_5B83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62CD		proc far

var_9E		= word ptr -9Eh
var_80		= word ptr -80h
var_72		= word ptr -72h
var_22		= word ptr -22h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 9Eh
		push	si
		push	di
		mov	ax, [bp+arg_0]
		xor	si, si
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_62F2
		push	ds
		push	offset aSav
		push	ds
		push	offset a_
		push	ds
		push	offset aSaved
		jmp	short loc_62FE

loc_62F2:
		push	ds
		push	offset aTap
		push	ds
		push	offset a__1
		push	ds
		push	offset aTapes

loc_62FE:
		lea	ax, [bp+var_72]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		call	sub_23CA
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_6329
		jmp	loc_63B8

loc_6329:
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6341
		push	ds
		push	offset unk_5A05A
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		push	ds
		push	offset aSaved_1
		jmp	short loc_634E

loc_6341:
		push	ds
		push	offset unk_5A062
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		push	ds
		push	offset aTapes_1

loc_634E:
		lea	ax, [bp+var_72]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_72]
		push	ax
		call	sub_58AE0
		pop	cx
		or	al, al
		jz	short loc_63A1
		inc	si
		lea	ax, [bp+var_80]
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
		mov	di, ax
		or	di, di
		jz	short loc_6390
		mov	byte ptr [di], 0

loc_6390:
		push	0
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_2]
		call	sub_23428
		add	sp, 6

loc_63A1:
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_23FD
		pop	cx
		or	ax, ax
		jnz	short loc_63B8
		cmp	si, 64h
		jge	short loc_63B8
		jmp	loc_6329

loc_63B8:
		mov	[bp+var_4], si
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_62CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63C2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_63EE
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_63F6

loc_63EE:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_63F6:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, [si+96h]
		mov	[si+7Eh], ax
		cmp	word ptr [si+7Ch], 0
		jle	short loc_6426
		mov	ax, [si+7Ah]
		shl	ax, 4
		cwd
		idiv	word ptr [si+7Ch]
		add	[si+7Eh], ax

loc_6426:
		mov	ax, [si+9Ah]
		add	ax, 5
		push	ax
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_644E
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6456

loc_644E:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_6456:
		push	dx
		push	ax
		push	word ptr [si+7Eh]
		push	60h
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	di, ax
		cmp	byte ptr [si+75h], 0
		jnz	short loc_6483
		or	di, di
		jnz	short loc_648F

loc_6483:
		mov	bx, di
		mov	byte ptr [bx+si+80h], 5Fh
		mov	byte ptr [bx+si+81h], 0

loc_648F:
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_64B3
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_64BB

loc_64B3:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_64BB:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0AEh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		push	word_5BF74
		push	0
		mov	ax, si
		add	ax, 80h
		push	ax
		push	word ptr [si+94h]
		push	63h
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		cmp	byte ptr [si+75h], 0
		jnz	short loc_64F5
		or	di, di
		jnz	short loc_64FC

loc_64F5:
		mov	bx, di
		mov	byte ptr [bx+si+80h], 0

loc_64FC:
		mov	al, [si+75h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_650B
		cmp	byte ptr [si+76h], 0
		jz	short loc_6570

loc_650B:
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_652F
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6537

loc_652F:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_6537:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0BCh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		push	word ptr [si+0A2h]
		mov	bx, [si+0A2h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		mov	al, [si+75h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_656C
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_656C:
		mov	byte ptr [si+76h], 0

loc_6570:
		pop	di
		pop	si
		pop	bp
		retf
sub_63C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6574		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ah], 0
		jle	short loc_658A
		dec	word ptr [si+7Ah]
		push	si
		push	cs
		call	near ptr sub_63C2
		pop	cx

loc_658A:
		pop	si
		pop	bp
		retf
sub_6574		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_658D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ah]
		cmp	ax, [si+7Ch]
		jge	short loc_65A5
		inc	word ptr [si+7Ah]
		push	si
		push	cs
		call	near ptr sub_63C2
		pop	cx

loc_65A5:
		pop	si
		pop	bp
		retf
sub_658D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65A8		proc far

var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_4]
		call	sub_55FFC
		mov	[bp+var_2], ax
		push	di
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	dx, [di+7Eh]
		sub	dx, [di+96h]
		cmp	si, dx
		jge	short loc_65E5
		cmp	word ptr [di+7Ah], 5
		jge	short loc_65DE
		mov	word ptr [di+7Ah], 0
		jmp	loc_66D8

loc_65DE:
		sub	word ptr [di+7Ah], 5
		jmp	loc_66D8

loc_65E5:
		mov	ax, dx
		add	ax, 2
		cmp	ax, si
		jge	short loc_6609
		mov	ax, [di+7Ch]
		add	ax, 0FFFBh
		cmp	[di+7Ah], ax
		jle	short loc_6602
		mov	ax, [di+7Ch]
		mov	[di+7Ah], ax
		jmp	loc_66D8

loc_6602:
		add	word ptr [di+7Ah], 5
		jmp	loc_66D8

loc_6609:
		mov	si, 0FFFFh
		mov	byte ptr [bp+var_E], 0

loc_6610:
		lea	ax, [bp+var_E]
		push	ax
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte ptr [bp+var_E], 0
		jnz	short loc_6642
		lea	ax, [bp+var_E]
		push	ax
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6642
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_19979
		add	sp, 4
		jmp	short loc_6642

loc_6642:
		call	sub_56014
		mov	[di+7Eh], ax
		cmp	si, 0FFFFh
		jz	short loc_6654
		cmp	[di+7Eh], si
		jz	short loc_66A0

loc_6654:
		mov	ax, [di+7Eh]
		cmp	ax, [di+96h]
		jge	short loc_6664
		mov	ax, [di+96h]
		mov	[di+7Eh], ax

loc_6664:
		mov	ax, [di+98h]
		add	ax, 0FFFEh
		cmp	[di+7Eh], ax
		jle	short loc_667A
		mov	ax, [di+98h]
		add	ax, 0FFFEh
		mov	[di+7Eh], ax

loc_667A:
		mov	ax, [di+7Eh]
		sub	ax, [di+96h]
		mov	[di+7Ah], ax
		mov	ax, [di+7Ah]
		imul	word ptr [di+7Ch]
		mov	[di+7Ah], ax
		mov	ax, [di+7Ah]
		mov	bx, 10h
		cwd
		idiv	bx
		mov	[di+7Ah], ax
		push	di
		nop
		push	cs
		call	near ptr sub_6712
		pop	cx

loc_66A0:
		mov	si, [di+7Eh]
		cmp	byte ptr [bp+var_E], 2
		jnz	short loc_66B4
		cmp	byte ptr [bp+var_E+1], 2
		jnz	short loc_66B4
		mov	ax, 1
		jmp	short loc_66B6

loc_66B4:
		xor	ax, ax

loc_66B6:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_66D8
		cmp	byte ptr [bp+var_E], 2
		jnz	short loc_66CD
		cmp	byte ptr [bp+var_E+1], 1
		jnz	short loc_66CD
		mov	ax, 1
		jmp	short loc_66CF

loc_66CD:
		xor	ax, ax

loc_66CF:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_66D8
		jmp	loc_6610

loc_66D8:
		push	di
		push	cs
		call	near ptr sub_63C2
		pop	cx
		push	di
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		push	word ptr [di+7Eh]
		push	[bp+var_2]
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, [di+7Eh]
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
sub_65A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6712		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_673D
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6745

loc_673D:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_6745:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, [si+9Ah]
		add	ax, 5
		push	ax
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_6783
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_678B

loc_6783:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_678B:
		push	dx
		push	ax
		push	word ptr [si+7Eh]
		push	60h
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_6712		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67A3		proc far

var_96		= word ptr -96h
var_46		= dword ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	loc_71A1

loc_67B2:
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_67DD
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_67E5

loc_67DD:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_67E5:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, [si+96h]
		mov	[si+7Eh], ax
		cmp	word ptr [si+7Ch], 0
		jle	short loc_6815
		mov	ax, [si+7Ah]
		shl	ax, 4
		cwd
		idiv	word ptr [si+7Ch]
		add	[si+7Eh], ax

loc_6815:
		mov	ax, [si+9Ah]
		add	ax, 5
		push	ax
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_683D
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6845

loc_683D:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_6845:
		push	dx
		push	ax
		push	word ptr [si+7Eh]
		push	60h
		mov	ax, si
		add	ax, 0CAh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	di, ax
		cmp	byte ptr [si+75h], 0
		jnz	short loc_6872
		or	di, di
		jnz	short loc_687E

loc_6872:
		mov	bx, di
		mov	byte ptr [bx+si+80h], 5Fh
		mov	byte ptr [bx+si+81h], 0

loc_687E:
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_68A2
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_68AA

loc_68A2:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_68AA:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0AEh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		push	word_5BF74
		push	0
		mov	ax, si
		add	ax, 80h
		push	ax
		push	word ptr [si+94h]
		push	63h
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		cmp	byte ptr [si+75h], 0
		jnz	short loc_68E4
		or	di, di
		jnz	short loc_68EB

loc_68E4:
		mov	bx, di
		mov	byte ptr [bx+si+80h], 0

loc_68EB:
		mov	al, [si+75h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_68FA
		cmp	byte ptr [si+76h], 0
		jz	short loc_695F

loc_68FA:
		push	word ptr [si+9Ah]
		cmp	byte ptr [si+0A8h], 3
		jnz	short loc_691E
		push	0
		mov	al, [si+0A8h]
		push	ax
		push	large [si+0A4h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6926

loc_691E:
		mov	dx, [si+0A6h]
		mov	ax, [si+0A4h]

loc_6926:
		push	dx
		push	ax
		push	large 34004Eh
		mov	ax, si
		add	ax, 0BCh
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		push	word ptr [si+0A2h]
		mov	bx, [si+0A2h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		mov	al, [si+75h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_695B
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_695B:
		mov	byte ptr [si+76h], 0

loc_695F:
		mov	word ptr [si+0A0h], 0
		cmp	byte ptr [si+75h], 0
		jz	short loc_69AC
		mov	byte ptr [bp+var_A+2], 0

loc_696F:
		push	0FFh
		lea	ax, [bp+var_C]
		push	ax
		call	sub_55996
		add	sp, 4
		mov	al, byte ptr [bp+var_C+1]
		mov	ah, 0
		mov	[si+6Ch], ax
		cmp	byte_605C0, 1
		jz	short loc_6994
		cmp	byte_605CC, 1
		jnz	short loc_6999

loc_6994:
		mov	ax, 1
		jmp	short loc_699B

loc_6999:
		xor	ax, ax

loc_699B:
		mov	ah, 0
		mov	di, ax
		cmp	byte ptr [bp+var_C], 2
		jnz	short loc_696F
		call	Keyboard_DrainBufferBIOS_578C9
		jmp	short loc_69B9

loc_69AC:
		push	1
		push	si
		call	GaugeWidget_QueryAndFormat_2094E
		add	sp, 4
		xor	di, di

loc_69B9:
		cmp	word ptr [si+6Ch], 10h
		jl	short loc_69C5
		cmp	word ptr [si+6Ch], 19h
		jle	short loc_69E9

loc_69C5:
		cmp	word ptr [si+6Ch], 1Eh
		jl	short loc_69D1
		cmp	word ptr [si+6Ch], 26h
		jle	short loc_69E9

loc_69D1:
		cmp	word ptr [si+6Ch], 2Ch
		jl	short loc_69DD
		cmp	word ptr [si+6Ch], 32h
		jle	short loc_69E9

loc_69DD:
		cmp	word ptr [si+6Ch], 2
		jl	short loc_6A57
		cmp	word ptr [si+6Ch], 0Ch
		jg	short loc_6A57

loc_69E9:
		cmp	byte ptr [si+75h], 0
		jnz	short loc_6A05
		mov	byte ptr [si+80h], 0
		mov	bx, [si+0A2h]
		mov	word ptr [bx+2Ch], 0
		mov	byte ptr [si+76h], 1
		mov	byte ptr [si+75h], 1

loc_6A05:
		or	di, di
		jz	short loc_6A12
		mov	bx, [si+6Ch]
		mov	al, [bx+4B6Ah]
		jmp	short loc_6A19

loc_6A12:
		mov	bx, [si+6Ch]
		mov	al, [bx+4AEAh]

loc_6A19:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 61h
		jl	short loc_6A30
		cmp	[bp+var_1], 7Ah
		jg	short loc_6A30
		mov	al, [bp+var_1]
		add	al, 0E0h
		mov	[bp+var_1], al

loc_6A30:
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		cmp	dx, 8
		jl	short loc_6A46
		jmp	loc_71A1

loc_6A46:
		mov	bx, dx
		mov	al, [bp+var_1]
		mov	[bx+si+80h], al
		mov	byte ptr [bx+si+81h], 0
		jmp	loc_71A1

loc_6A57:
		cmp	word ptr [si+6Ch], 0Eh
		jnz	short loc_6A96
		cmp	byte ptr [si+75h], 0
		jnz	short loc_6A74
		mov	bx, [si+0A2h]
		mov	word ptr [bx+2Ch], 0
		mov	byte ptr [si+76h], 1
		mov	byte ptr [si+75h], 1

loc_6A74:
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		or	dx, dx
		jz	short loc_6A8C
		mov	bx, dx
		mov	byte ptr [bx+si+7Fh], 0

loc_6A8C:
		cmp	dx, 1
		jle	short loc_6A94
		jmp	loc_71A1

loc_6A94:
		jmp	short loc_6AAA

loc_6A96:
		cmp	word ptr [si+6Ch], 1
		jnz	short loc_6AB4
		cmp	byte ptr [si+75h], 0
		jnz	short loc_6AA5
		jmp	loc_719D

loc_6AA5:
		mov	byte ptr [si+80h], 0

loc_6AAA:
		mov	byte ptr [si+75h], 0
		jmp	loc_71A1
		jmp	loc_719D

loc_6AB4:
		cmp	word ptr [si+6Ch], 48h
		jnz	short loc_6AFC
		push	word ptr [si+0A2h]
		push	cs
		call	near ptr sub_5AF1
		pop	cx
		dec	ax
		push	ax
		push	word ptr [si+0A2h]
		push	cs
		call	near ptr sub_5B31
		add	sp, 4
		mov	bx, [si+0A2h]
		cmp	word ptr [bx+2Ch], 0
		jnz	short loc_6ADD
		jmp	loc_6B7F

loc_6ADD:
		mov	bx, [si+0A2h]
		push	word ptr [bx+2Ch]
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [si+75h], 1
		jmp	loc_6B84
		jmp	loc_6B7F

loc_6AFC:
		cmp	word ptr [si+6Ch], 50h
		jnz	short loc_6B26
		push	word ptr [si+0A2h]
		push	cs
		call	near ptr sub_5AF1
		pop	cx
		inc	ax
		push	ax
		push	word ptr [si+0A2h]
		push	cs
		call	near ptr sub_5B31
		add	sp, 4
		mov	bx, [si+0A2h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_6B7F
		jmp	short loc_6ADD
		jmp	short loc_6B7F

loc_6B26:
		cmp	word ptr [si+6Ch], 49h
		jnz	short loc_6B53
		push	word ptr [si+0A2h]
		push	cs
		call	near ptr sub_5AF1
		pop	cx
		mov	bx, [si+0A2h]
		sub	ax, [bx+30h]
		push	ax
		push	bx
		push	cs
		call	near ptr sub_5B31
		add	sp, 4
		mov	bx, [si+0A2h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_6B7F
		jmp	short loc_6ADD
		jmp	short loc_6B7F

loc_6B53:
		cmp	word ptr [si+6Ch], 51h
		jnz	short loc_6B8B
		push	word ptr [si+0A2h]
		push	cs
		call	near ptr sub_5AF1
		pop	cx
		mov	bx, [si+0A2h]
		add	ax, [bx+30h]
		push	ax
		push	bx
		push	cs
		call	near ptr sub_5B31
		add	sp, 4
		mov	bx, [si+0A2h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_6B7F
		jmp	loc_6ADD

loc_6B7F:
		mov	byte ptr [si+80h], 0

loc_6B84:
		mov	byte ptr [si+76h], 1
		jmp	loc_71A1

loc_6B8B:
		cmp	word ptr [si+6Ch], 1Ch
		jz	short loc_6B94
		jmp	loc_6EAA

loc_6B94:
		cmp	byte ptr [si+75h], 0
		jnz	short loc_6B9D
		jmp	loc_6EAA

loc_6B9D:
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_6BD0

loc_6BA5:
		push	di
		mov	ax, [si+0A2h]
		add	ax, 24h
		push	ax
		call	sub_2357F
		add	sp, 4
		push	ax
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_6BCF
		mov	[bp+var_2], 1
		jmp	short loc_6BD9

loc_6BCF:
		inc	di

loc_6BD0:
		mov	bx, [si+0A2h]
		cmp	[bx+22h], di
		jg	short loc_6BA5

loc_6BD9:
		cmp	word ptr [si+72h], 0
		jz	short loc_6BE8
		cmp	word ptr [si+72h], 3
		jz	short loc_6BE8
		jmp	loc_6E45

loc_6BE8:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6BF8
		mov	[bp+var_2], 1
		jmp	loc_6E45

loc_6BF8:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		push	large 410096h
		push	large 430055h
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_4], 0
		mov	di, si
		add	di, 0A4h
		mov	ax, [si+9Ah]
		add	ax, 0Ah
		mov	[bp+var_6], ax
		mov	eax, [di]
		mov	[bp+var_A], eax
		mov	al, [di+4]
		mov	byte ptr [bp+var_C+1], al
		mov	eax, [bp+var_A]
		mov	[bp+var_46], eax
		mov	al, byte ptr [bp+var_C+1]
		mov	[bp+var_42], al
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		mov	eax, [di+6]
		mov	[bp+var_40], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_3C], ax
		push	15h
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_E], ax
		mov	ax, [si+9Ah]
		add	ax, 0Bh
		mov	[bp+var_10], ax
		mov	ax, [si+9Ah]
		add	ax, 0Ch
		mov	[bp+var_12], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6C91
		jmp	loc_6D1A

loc_6C91:
		push	large 0C0027h
		push	large 2B0014h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	al, [bx+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	[di+1Eh], eax
		mov	al, [bp+var_17]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_10]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_4]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_12]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_6D1C

loc_6D1A:
		mov	ax, di

loc_6D1C:
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	31h
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_1A], ax
		mov	ax, [si+9Ah]
		add	ax, 0Dh
		mov	[bp+var_1C], ax
		mov	ax, [si+9Ah]
		add	ax, 0Eh
		mov	[bp+var_1E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6D59
		jmp	loc_6DE2

loc_6D59:
		push	large 0C0027h
		push	large 2B005Bh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	al, [bx+4]
		mov	[bp+var_23], al
		mov	eax, [bp+var_22]
		mov	[di+1Eh], eax
		mov	al, [bp+var_23]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_1C]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_4]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_1E]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_6DE4

loc_6DE2:
		mov	ax, di

loc_6DE4:
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	sub_208FD
		add	sp, 6
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx

loc_6DFD:
		push	1
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_QueryAndFormat_2094E
		add	sp, 4
		cmp	[bp+var_4], 0
		jz	short loc_6DFD
		cmp	[bp+var_4], 2
		jnz	short loc_6E1C
		mov	[bp+var_2], 0

loc_6E1C:
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4

loc_6E45:
		cmp	[bp+var_2], 0
		jz	short loc_6E8B
		mov	ax, si
		add	ax, 80h
		push	ax
		push	847h
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 80h
		push	ax
		push	word ptr [si+9Ch]
		call	CRT_Strcpy
		add	sp, 4
		cmp	word ptr [si+72h], 2
		jl	short loc_6E79
		push	343h
		jmp	short loc_6E7C

loc_6E79:
		push	348h

loc_6E7C:
		push	word ptr [si+9Ch]
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_719D

loc_6E8B:
		cmp	word ptr [si+72h], 1
		jz	short loc_6E9A
		cmp	word ptr [si+72h], 2
		jz	short loc_6E9A
		jmp	loc_71A1

loc_6E9A:
		push	7
		push	34Dh
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		jmp	loc_71A1

loc_6EAA:
		cmp	word ptr [si+6Ah], 0
		jnz	short loc_6EB3
		jmp	loc_71A1

loc_6EB3:
		mov	al, [si+75h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_6EBF
		jmp	loc_71A1

loc_6EBF:
		mov	bx, [si+0A2h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_6EDE
		mov	byte ptr [si+77h], 1
		push	word ptr [bx+2Ch]
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_6EDE:
		cmp	word ptr [si+9Eh], 0
		jz	short loc_6EEB
		mov	word ptr [si+0A0h], 1

loc_6EEB:
		mov	ax, [si+0A0h]
		cmp	ax, 1
		jz	short loc_6EFF
		cmp	ax, 2
		jnz	short loc_6EFC
		jmp	loc_719D

loc_6EFC:
		jmp	loc_71A1

loc_6EFF:
		mov	al, [si+80h]
		mov	[bp+var_2], al
		cmp	word ptr [si+72h], 0
		jz	short loc_6F15
		cmp	word ptr [si+72h], 3
		jz	short loc_6F15
		jmp	loc_7162

loc_6F15:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		push	large 410096h
		push	large 430055h
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		mov	[bp+var_4], 0
		mov	di, si
		add	di, 0A4h
		mov	ax, [si+9Ah]
		add	ax, 0Ah
		mov	[bp+var_6], ax
		mov	eax, [di]
		mov	[bp+var_A], eax
		mov	al, [di+4]
		mov	byte ptr [bp+var_C+1], al
		mov	eax, [bp+var_A]
		mov	[bp+var_46], eax
		mov	al, byte ptr [bp+var_C+1]
		mov	[bp+var_42], al
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		mov	eax, [di+6]
		mov	[bp+var_40], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_3C], ax
		push	15h
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_E], ax
		mov	ax, [si+9Ah]
		add	ax, 0Bh
		mov	[bp+var_10], ax
		mov	ax, [si+9Ah]
		add	ax, 0Ch
		mov	[bp+var_12], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6FAE
		jmp	loc_7037

loc_6FAE:
		push	large 0C0027h
		push	large 2B0014h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	al, [bx+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	[di+1Eh], eax
		mov	al, [bp+var_17]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_10]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_4]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_12]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_7039

loc_7037:
		mov	ax, di

loc_7039:
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	31h
		mov	ax, si
		add	ax, 0A4h
		mov	[bp+var_1A], ax
		mov	ax, [si+9Ah]
		add	ax, 0Dh
		mov	[bp+var_1C], ax
		mov	ax, [si+9Ah]
		add	ax, 0Eh
		mov	[bp+var_1E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_7076
		jmp	loc_70FF

loc_7076:
		push	large 0C0027h
		push	large 2B005Bh
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3F6h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	al, [bx+4]
		mov	[bp+var_23], al
		mov	eax, [bp+var_22]
		mov	[di+1Eh], eax
		mov	al, [bp+var_23]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	ax, [bp+var_1C]
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 42Ah
		lea	ax, [bp+var_4]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 45Eh
		mov	ax, [bp+var_1E]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_7101

loc_70FF:
		mov	ax, di

loc_7101:
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	sub_208FD
		add	sp, 6
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx

loc_711A:
		push	1
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_QueryAndFormat_2094E
		add	sp, 4
		cmp	[bp+var_4], 0
		jz	short loc_711A
		cmp	[bp+var_4], 2
		jnz	short loc_7139
		mov	[bp+var_2], 0

loc_7139:
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4

loc_7162:
		cmp	[bp+var_2], 0
		jz	short loc_71A1
		mov	ax, si
		add	ax, 80h
		push	ax
		push	847h
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 80h
		push	ax
		push	word ptr [si+9Ch]
		call	CRT_Strcpy
		add	sp, 4
		cmp	word ptr [si+72h], 2
		jl	short loc_7197
		push	350h
		jmp	loc_6E7C

loc_7197:
		push	355h
		jmp	loc_6E7C

loc_719D:
		mov	byte ptr [si+74h], 1

loc_71A1:
		mov	al, [si+74h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_71AD
		jmp	loc_67B2

loc_71AD:
		pop	di
		pop	si
		leave
		retf
sub_67A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71B1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	word_59FD8
		push	cs
		call	near ptr sub_6574
		pop	cx
		pop	bp
		retf
sub_71B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71C2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	word_59FD8
		push	cs
		call	near ptr sub_658D
		pop	cx
		pop	bp
		retf
sub_71C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71D3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_59FD8
		push	cs
		call	near ptr sub_65A8
		add	sp, 6
		pop	bp
		retf
sub_71D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71EC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_71EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_71F4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7253
		cmp	byte ptr [si+23h], 0
		jz	short loc_7229
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_7229
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7229

loc_7229:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_7253
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_7253

loc_7253:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_71F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_7257		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_72B6
		cmp	byte ptr [si+23h], 0
		jz	short loc_728C
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_728C
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_728C

loc_728C:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_72B6
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_72B6

loc_72B6:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_7257		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_72BA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7319
		cmp	byte ptr [si+23h], 0
		jz	short loc_72EF
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_72EF
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_72EF

loc_72EF:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_7319
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_7319

loc_7319:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_72BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_731D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_737C
		cmp	byte ptr [si+23h], 0
		jz	short loc_7352
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_7352
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7352

loc_7352:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_737C
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_737C

loc_737C:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_731D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_7380		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_73DF
		cmp	byte ptr [si+23h], 0
		jz	short loc_73B5
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_73B5
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_73B5

loc_73B5:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_73DF
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_73DF

loc_73DF:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_7380		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_CFE95 (sub_CFE95 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_73E3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7442
		cmp	byte ptr [si+23h], 0
		jz	short loc_7418
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_7418
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7418

loc_7418:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_7442
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_7442

loc_7442:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_73E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_63455 (sub_63455 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_85DCA (sub_85DCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_7446		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_746D
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_746D
		push	si
		call	sub_33B
		pop	cx

loc_746D:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_7446		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7471		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_74A3
		mov	word ptr [si], 496h
		push	si
		call	sub_23609
		pop	cx
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_74A3
		push	si
		call	sub_33B
		pop	cx

loc_74A3:
		pop	di
		pop	si
		pop	bp
		retf
sub_7471		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74A7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, 1
		jnz	short loc_74C3
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		mov	ax, 1
		jmp	short loc_74C5

loc_74C3:
		xor	ax, ax

loc_74C5:
		pop	si
		pop	bp
		retf
sub_74A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_750F
		mov	word ptr [si+24h], 496h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_23609
		pop	cx
		mov	word ptr [si+24h], 492h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_4870F
		pop	cx
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_750F
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_750F

loc_750F:
		pop	di
		pop	si
		pop	bp
		retf
sub_74C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7513		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_755A
		mov	word ptr [si+24h], 496h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_23609
		pop	cx
		mov	word ptr [si+24h], 492h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_4870F
		pop	cx
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
sub_7513		endp

; START OF FUNCTION CHUNK FOR sub_7513
		db 74h
; END OF FUNCTION CHUNK FOR sub_7513
seg009		ends
