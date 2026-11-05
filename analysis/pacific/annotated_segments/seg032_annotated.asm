seg032		segment	para public 'CODE' use16
		assume cs:seg032
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0ECh, 8Bh, 46h, 6, 0B0h, 5, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16738		proc far

var_8		= word ptr -8
var_7		= word ptr -7
var_4		= word ptr -4
var_3		= word ptr -3
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
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_16750
		or	di, di
		jz	short loc_167AB

loc_16750:
		cmp	byte ptr [si+17Ch], 0
		jz	short loc_16790
		mov	ax, si
		add	ax, 104h
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	ax, [bp+var_3]
		mov	[si+148h], ax
		mov	ax, si
		add	ax, 104h
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	sub_59B4A
		add	sp, 6
		mov	ax, [bp+var_7]
		mov	[si+14Ah], ax
		mov	byte ptr [si+17Ch], 0

loc_16790:
		mov	byte ptr [si+17Dh], 1
		mov	al, [si+17Bh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_167AB
		push	[bp+arg_6]
		push	si
		call	sub_73110
		add	sp, 4

loc_167AB:
		mov	ax, [bp+arg_4]
		sub	[si+14Ah], ax
		mov	ax, [si+14Ah]
		cmp	ax, [si+146h]
		jle	short loc_167C4
		mov	ax, [si+146h]
		mov	[si+14Ah], ax

loc_167C4:
		mov	ax, [si+14Ah]
		cmp	ax, [si+144h]
		jge	short loc_167D6
		mov	ax, [si+144h]
		mov	[si+14Ah], ax

loc_167D6:
		add	[si+148h], di
		mov	ax, [si+148h]
		cmp	ax, [si+140h]
		jge	short loc_167EC
		mov	ax, [si+140h]
		mov	[si+148h], ax

loc_167EC:
		mov	ax, [si+148h]
		cmp	ax, [si+142h]
		jle	short loc_167FE
		mov	ax, [si+142h]
		mov	[si+148h], ax

loc_167FE:
		pop	di
		pop	si
		leave
		retf
sub_16738		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16802		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0F6h], 0
		jz	short loc_16816
		mov	ax, 1
		jmp	short loc_16818

loc_16816:
		xor	ax, ax

loc_16818:
		or	ax, ax
		jz	short loc_1684B
		cmp	byte_7709E, 0
		jz	short loc_1684B
		push	large 0
		mov	al, [si+0FAh]
		push	ax
		push	large [si+0F6h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	[bp+arg_2]
		call	sub_6A514
		add	sp, 0Ch

loc_1684B:
		pop	si
		pop	bp
		retf
sub_16802		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1684E		proc far

var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_16862
		jmp	loc_16981

loc_16862:
		mov	al, [si+17Bh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1686F
		jmp	loc_16911

loc_1686F:
		cmp	byte_7CAF8, 0
		jnz	short loc_16888
		cmp	byte_7C9F0, 2
		jnz	short loc_16882
		mov	ax, 1
		jmp	short loc_16884

loc_16882:
		xor	ax, ax

loc_16884:
		or	ax, ax
		jz	short loc_16892

loc_16888:
		mov	byte_7CAF8, 0
		mov	byte ptr [si+1E0h], 1

loc_16892:
		mov	ax, [si+1Ah]
		mov	word ptr [bp+var_4+2], ax
		cmp	byte ptr [si+1E0h], 0
		jz	short loc_168BA
		mov	bx, word_7AF7E
		mov	ax, [bx+0Ah]
		mov	[si+0Ch], ax
		mov	[si+1Ah], ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	si
		push	cs
		call	near ptr sub_16802
		add	sp, 4

loc_168BA:
		cmp	byte ptr [si+1DFh], 0
		jz	short loc_168FD
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_17AD7
		pop	cx
		mov	ax, si
		add	ax, 32h
		push	ax
		mov	bx, [si+32h]
		call	dword ptr [bx+10h]
		pop	cx
		cmp	word ptr [si+0E2h], 0
		jz	short loc_168EB
		push	word ptr [si+0E2h]
		call	sub_1BDF4
		pop	cx

loc_168EB:
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	sub_1602C
		add	sp, 6

loc_168FD:
		push	62B0h
		call	sub_1E055
		pop	cx
		mov	ax, word ptr [bp+var_4+2]
		mov	[si+0Ch], ax
		mov	[si+1Ah], ax
		jmp	short loc_16939

loc_16911:
		mov	ax, si
		add	ax, 32h
		push	ax
		mov	bx, [si+32h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	sub_1602C
		add	sp, 6
		push	62B0h
		call	sub_1E055
		pop	cx

loc_16939:
		mov	di, word_7CADA
		add	di, 6Ch
		mov	eax, [di]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_16953
		mov	ax, 1
		jmp	short loc_16955

loc_16953:
		xor	ax, ax

loc_16955:
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_16981
		mov	eax, [bp+var_4]
		shl	eax, 3
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		mov	bx, word ptr [bp+var_A+1]
		shl	bx, 1
		mov	ax, [bx+si+1B7h]
		mov	[bp+var_10], ax
		push	ax
		call	sub_1B9E8
		pop	cx

loc_16981:
		cmp	byte ptr [si+1DBh], 0FFh
		jnz	short loc_1698D
		mov	byte ptr [si+1E0h], 0

loc_1698D:
		pop	di
		pop	si
		leave
		retf
sub_1684E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16991		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_16991		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16996		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_16996		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1699B		proc far

var_CA		= dword ptr -0CAh
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_50		= dword ptr -50h
var_4E		= dword ptr -4Eh
var_4C		= dword ptr -4Ch
var_4A		= dword ptr -4Ah
var_48		= dword ptr -48h
var_46		= dword ptr -46h
var_44		= dword ptr -44h
var_42		= dword ptr -42h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0C2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], 0
		mov	[bp+var_A], 6400h
		mov	[bp+var_E], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_72], eax
		mov	ax, [di+89h]
		mov	[bp+var_10], ax
		push	ax
		mov	bx, [bp+var_10]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		mov	[bp+var_12], ax
		push	[bp+var_10]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[di+14h], eax
		mov	eax, [bx+4]
		mov	[di+18h], eax
		mov	eax, [bx+8]
		mov	[di+1Ch], eax
		mov	bx, [bp+var_10]
		les	bx, [bx+5Fh]
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_16], ax
		cmp	byte ptr [si+17Ah], 0
		jnz	short loc_16A2B
		jmp	loc_16C97

loc_16A2B:
		cmp	[bp+var_16], 0
		jnz	short loc_16A34
		jmp	loc_16C8D

loc_16A34:
		add	ax, 12h
		mov	[bp+var_32], ax
		mov	ax, di
		add	ax, 14h
		mov	word ptr [bp+var_36+2], ax
		mov	bx, [bp+var_32]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_36+2]
		sub	eax, [bx]
		mov	[bp+var_B6], eax
		mov	bx, [bp+var_32]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_36+2]
		sub	eax, [bx+4]
		mov	[bp+var_B2], eax
		mov	bx, [bp+var_32]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_36+2]
		sub	eax, [bx+8]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_A2], eax
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_AA]
		push	ax
		call	sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_AA]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, [bp+var_12]
		add	ax, 0Ch
		push	ax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		cmp	[bp+var_38], 100h
		jle	short loc_16ADF
		mov	ax, 1
		jmp	short loc_16AE1

loc_16ADF:
		xor	ax, ax

loc_16AE1:
		or	al, al
		jz	short loc_16AF7
		mov	[bp+var_3C], 100h
		mov	eax, [bp+var_3C]
		mov	[bp+var_38], eax
		jmp	short loc_16B1C

loc_16AF7:
		cmp	[bp+var_38], 0FFFFFF00h
		jge	short loc_16B06
		mov	ax, 1
		jmp	short loc_16B08

loc_16B06:
		xor	ax, ax

loc_16B08:
		or	al, al
		jz	short loc_16B1C
		mov	[bp+var_40], 0FFFFFF00h
		mov	eax, [bp+var_40]
		mov	[bp+var_38], eax

loc_16B1C:
		mov	eax, [di+60h]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_48]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_48]
		cmp	eax, [bp+var_44]
		jl	short loc_16B44
		mov	ax, 1
		jmp	short loc_16B46

loc_16B44:
		xor	ax, ax

loc_16B46:
		or	al, al
		jnz	short loc_16B4D
		jmp	loc_16C86

loc_16B4D:
		push	[bp+var_12]
		lea	ax, word ptr [bp+var_AA]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4C]
		push	ax
		call	sub_5720C
		add	sp, 6
		lea	ax, word ptr [bp+var_AA]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_50]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	byte_770B3, 0
		cmp	[bp+var_50], 0
		jle	short loc_16B92
		mov	ax, 1
		jmp	short loc_16B94

loc_16B92:
		xor	ax, ax

loc_16B94:
		or	al, al
		jnz	short loc_16B9B
		jmp	loc_16C97

loc_16B9B:
		mov	ax, [si+142h]
		mov	word ptr [bp+var_52], ax
		movsx	eax, word ptr [bp+var_52]
		shl	eax, 8
		cmp	eax, [bp+var_50]
		jle	short loc_16BB6
		mov	ax, 1
		jmp	short loc_16BB8

loc_16BB6:
		xor	ax, ax

loc_16BB8:
		or	al, al
		jnz	short loc_16BBF
		jmp	loc_16C97

loc_16BBF:
		mov	ax, [si+144h]
		mov	word ptr [bp+var_56+2], ax
		movsx	eax, word ptr [bp+var_56+2]
		shl	eax, 8
		cmp	eax, [bp+var_4C]
		jge	short loc_16BDA
		mov	ax, 1
		jmp	short loc_16BDC

loc_16BDA:
		xor	ax, ax

loc_16BDC:
		or	al, al
		jnz	short loc_16BE3
		jmp	loc_16C97

loc_16BE3:
		mov	ax, [si+146h]
		mov	word ptr [bp+var_56], ax
		movsx	eax, word ptr [bp+var_56]
		shl	eax, 8
		cmp	eax, [bp+var_4C]
		jle	short loc_16BFE
		mov	ax, 1
		jmp	short loc_16C00

loc_16BFE:
		xor	ax, ax

loc_16C00:
		or	al, al
		jnz	short loc_16C07
		jmp	loc_16C97

loc_16C07:
		mov	eax, [bp+var_AA]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_72], eax
		mov	[bp+var_5A], 6400h
		mov	eax, [bp+var_7A]
		mov	edx, [bp+var_5A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_76]
		mov	edx, [bp+var_5A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_72]
		mov	edx, [bp+var_5A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_72], eax
		mov	byte ptr [si+17Ch], 1
		mov	byte_770B3, 1
		mov	al, [si+17Bh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16C97
		push	di
		push	si
		call	sub_73110
		add	sp, 4
		jmp	short loc_16C97

loc_16C86:
		mov	byte_770B3, 1
		jmp	short loc_16C97

loc_16C8D:
		mov	byte_770B3, 0
		mov	byte ptr [si+17Ah], 0

loc_16C97:
		push	[bp+var_10]
		push	si
		nop
		push	cs
		call	sub_174B8
		add	sp, 4
		cmp	byte ptr [si+1E3h], 0
		jz	short loc_16CEE
		mov	byte ptr [bp+var_3C], 0

loc_16CAE:
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_3C], 0
		jnz	short loc_16CE2
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16CE0
		lea	ax, word ptr [bp+var_36+2]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_16CE2

loc_16CE0:
		jmp	short loc_16CE2

loc_16CE2:
		cmp	byte ptr [bp+var_3C], 0
		jnz	short loc_16CAE
		cmp	byte ptr [bp+var_36+2], 0
		jnz	short loc_16CAE

loc_16CEE:
		mov	ax, word_7CADA
		mov	[bp+var_18], ax
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx+5Ah]
		mov	[bp+var_1E], eax
		les	bx, word ptr [bp+var_1E]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_16D10
		jmp	loc_16EF6

loc_16D10:
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	byte ptr [bp+var_32+1], al
		mov	[bp+var_36], 100h
		mov	ah, 0
		mov	[bp+var_30], ax
		mov	cx, 4
		mov	bx, offset word_17403

loc_16D2B:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_30]
		jz	short loc_16D3B
		add	bx, 2
		loop	short loc_16D2B
		jmp	loc_16EAC

loc_16D3B:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_16D3F:
		cmp	[bp+var_16], 0
		jnz	short loc_16D48
		jmp	loc_16EF6

loc_16D48:
		cmp	byte_7CAC2, 1
		jnz	short loc_16D8E
		test	byte_7CAC5, 0C0h
		jz	short loc_16D5B
		mov	ax, 1
		jmp	short loc_16D5D

loc_16D5B:
		xor	ax, ax

loc_16D5D:
		or	al, al
		jnz	short loc_16D85
		test	byte_7CAC5, 30h
		jz	short loc_16D6D
		mov	ax, 1
		jmp	short loc_16D6F

loc_16D6D:
		xor	ax, ax

loc_16D6F:
		or	al, al
		jnz	short loc_16D85
		test	byte_7CAC5, 0Ch
		jz	short loc_16D7F
		mov	ax, 1
		jmp	short loc_16D81

loc_16D7F:
		xor	ax, ax

loc_16D81:
		or	al, al
		jz	short loc_16D8A

loc_16D85:
		mov	ax, 1
		jmp	short loc_16D8C

loc_16D8A:
		xor	ax, ax

loc_16D8C:
		jmp	short loc_16DE0

loc_16D8E:
		cmp	byte_7D32D, 1
		jz	short loc_16D9C
		cmp	byte_7D365, 1
		jnz	short loc_16DA1

loc_16D9C:
		mov	ax, 1
		jmp	short loc_16DA3

loc_16DA1:
		xor	ax, ax

loc_16DA3:
		or	al, al
		jnz	short loc_16DD9
		cmp	byte_7D348, 1
		jz	short loc_16DB5
		cmp	byte_7D369, 1
		jnz	short loc_16DBA

loc_16DB5:
		mov	ax, 1
		jmp	short loc_16DBC

loc_16DBA:
		xor	ax, ax

loc_16DBC:
		or	al, al
		jnz	short loc_16DD9
		cmp	byte_7D33A, 1
		jz	short loc_16DCE
		cmp	byte_7D346, 1
		jnz	short loc_16DD3

loc_16DCE:
		mov	ax, 1
		jmp	short loc_16DD5

loc_16DD3:
		xor	ax, ax

loc_16DD5:
		or	al, al
		jz	short loc_16DDE

loc_16DD9:
		mov	ax, 1
		jmp	short loc_16DE0

loc_16DDE:
		xor	ax, ax

loc_16DE0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_16DE9
		jmp	loc_16EF6

loc_16DE9:
		xor	byte ptr [si+17Ah], 1
		cmp	byte ptr [si+17Ah], 0
		jz	short loc_16E14
		sub	sp, 4
		mov	[bp+var_CA], 100h
		push	ds
		push	offset aEyesLockedOnTarget
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_16EF6

loc_16E14:
		sub	sp, 4
		mov	[bp+var_CA], 100h
		push	ds
		push	offset aTargetTrackingOFF
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_16EF6

loc_16E33:
		xor	byte_7709E, 1
		push	si
		call	sub_73495
		pop	cx
		jmp	loc_16EF6

loc_16E42:
		cmp	byte ptr [si+17Bh], 0
		jz	short loc_16E7A
		cmp	byte ptr [si+17Ah], 0
		jz	short loc_16E6C
		sub	sp, 4
		mov	[bp+var_CA], 100h
		push	ds
		push	offset aTargetTrackingOFF
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_16E6C:
		mov	byte ptr [si+17Ah], 0
		push	si
		call	sub_73115
		pop	cx
		jmp	short loc_16EF6

loc_16E7A:
		mov	al, [si+1E3h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16EF6
		push	si
		call	sub_73490
		pop	cx
		jmp	short loc_16EF6

loc_16E8D:
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 5
		jnz	short loc_16EF6
		mov	al, [si+1E3h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16EF6
		push	si
		call	sub_73490
		pop	cx
		jmp	short loc_16EF6

loc_16EAC:
		mov	[bp+var_2], 0
		jmp	short loc_16EED

loc_16EB3:
		mov	ax, [bp+var_2]
		imul	ax, ax, 1Dh
		mov	bx, [si+0F4h]
		add	bx, ax
		cmp	byte ptr [bx], 0FFh
		jz	short loc_16EEA
		mov	ax, [bp+var_2]
		imul	ax, ax, 1Dh
		mov	bx, [si+0F4h]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_32+1]
		jnz	short loc_16EEA
		push	[bp+var_2]
		push	si
		call	sub_7349A
		add	sp, 4
		mov	byte ptr [si+1DFh], 0
		jmp	short loc_16EF6

loc_16EEA:
		inc	[bp+var_2]

loc_16EED:
		mov	ax, [si+0E4h]
		cmp	ax, [bp+var_2]
		jg	short loc_16EB3

loc_16EF6:
		cmp	byte ptr [si+1E3h], 0
		jz	short loc_16F02
		mov	byte ptr [si+1E3h], 0

loc_16F02:
		cmp	word_7CB05, 3
		jz	short loc_16F5D
		cmp	word_7CB05, 4
		jz	short loc_16F5D
		push	2
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_16F4E
		push	0
		call	sub_5292
		pop	cx
		sar	ax, 1
		mov	[bp+var_32], ax
		push	0
		call	sub_52A1
		pop	cx
		sar	ax, 1
		mov	word ptr [bp+var_36+2], ax
		push	di
		push	[bp+var_32]
		push	ax
		push	si
		push	cs
		call	near ptr sub_16738
		add	sp, 8
		mov	byte ptr [si+17Dh], 0
		jmp	short loc_16F5D

loc_16F4E:
		mov	al, [si+17Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16F5D
		mov	byte ptr [si+17Ch], 1

loc_16F5D:
		mov	bx, word_7CB05
		cmp	bx, 5
		ja	short loc_16F9B
		shl	bx, 1
		jmp	cs:off_173F7[bx]	; switch jump

loc_16F6D:
		push	di
		push	si
		call	sub_73170
		add	sp, 4
		jmp	short loc_16F9B

loc_16F79:
		push	di
		push	si
		call	sub_73140
		add	sp, 4
		jmp	short loc_16F9B

loc_16F85:
		push	di
		push	si
		call	sub_74290
		add	sp, 4
		jmp	short loc_16F9B

loc_16F91:
		push	di
		push	si
		call	sub_74295
		add	sp, 4

loc_16F9B:
		cmp	byte ptr [si+17Bh], 0
		jnz	short loc_16FA5
		jmp	loc_1722C

loc_16FA5:
		mov	al, [si+17Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_17016
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	ax, [si+14Ah]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4
		mov	ax, [si+148h]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		jmp	loc_1722C

loc_17016:
		mov	ax, si
		add	ax, 110h
		mov	[bp+var_32], ax
		mov	[bp+var_36], 6400h
		mov	bx, [bp+var_32]
		mov	eax, [bx]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_7A]
		sub	eax, [bp+var_AA]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_76]
		sub	eax, [bp+var_A6]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_72]
		sub	eax, [bp+var_A2]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_AE], eax
		push	eax
		push	large [bp+var_B2]
		push	large [bp+var_B6]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		mov	[bp+var_5A], 600h
		cmp	eax, [bp+var_5A]
		jle	short loc_17112
		mov	ax, 1
		jmp	short loc_17114

loc_17112:
		xor	ax, ax

loc_17114:
		or	al, al
		jnz	short loc_1711B
		jmp	loc_171CC

loc_1711B:
		mov	[bp+var_5E], 600h
		mov	eax, [bp+var_B6]
		mov	edx, eax
		mov	ecx, [bp+var_5E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B2]
		mov	edx, eax
		mov	ecx, [bp+var_5E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_AE]
		mov	edx, eax
		mov	ecx, [bp+var_5E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_AE], eax
		push	large [bp+var_AE]
		push	large [bp+var_B2]
		push	large [bp+var_B6]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_62], eax
		mov	[bp+var_66], eax
		mov	[bp+var_6A], 600h
		cmp	eax, [bp+var_6A]
		jge	short loc_171AD
		mov	ax, 1
		jmp	short loc_171AF

loc_171AD:
		xor	ax, ax

loc_171AF:
		or	al, al
		jz	short loc_171CC
		mov	[bp+var_6E], 600h
		lea	ax, word ptr [bp+var_6E]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4

loc_171CC:
		mov	eax, [bp+var_B6]
		add	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		add	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		add	[bp+var_A2], eax
		cmp	[bp+var_AA], 0
		jnz	short loc_171F7
		mov	ax, 1
		jmp	short loc_171F9

loc_171F7:
		xor	ax, ax

loc_171F9:
		or	al, al
		jz	short loc_17219
		cmp	[bp+var_A2], 0
		jnz	short loc_1720A
		mov	ax, 1
		jmp	short loc_1720C

loc_1720A:
		xor	ax, ax

loc_1720C:
		or	al, al
		jz	short loc_17219
		push	si
		call	sub_73115
		pop	cx
		jmp	short loc_1722C

loc_17219:
		lea	ax, word ptr [bp+var_AA]
		push	ax
		mov	ax, si
		add	ax, 104h
		push	ax
		call	sub_59B77
		add	sp, 4

loc_1722C:
		mov	ax, si
		add	ax, 104h
		push	ax
		mov	ax, di
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	[bp+var_12]
		mov	ax, di
		add	ax, 20h
		push	ax
		call	sub_59563
		add	sp, 4
		mov	ax, si
		add	ax, 128h
		mov	[bp+var_2C], ax
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[bp+var_86], eax
		mov	eax, [bx+4]
		mov	[bp+var_82], eax
		mov	eax, [bx+8]
		mov	[bp+var_7E], eax
		push	[bp+var_12]
		lea	ax, word ptr [bp+var_86]
		push	ax
		call	sub_5A629
		add	sp, 4
		push	[bp+var_10]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	[bp+var_2E], ax
		mov	bx, [bp+var_2E]
		mov	eax, [bx]
		add	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bx+4]
		add	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bx+8]
		add	eax, [bp+var_7E]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_9E]
		mov	[di+14h], eax
		mov	eax, [bp+var_9A]
		mov	[di+18h], eax
		mov	eax, [bp+var_96]
		mov	[di+1Ch], eax
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_17A7B
		pop	cx
		push	si
		mov	ax, si
		add	ax, 32h
		push	ax
		call	sub_1B7E4
		add	sp, 4
		mov	ax, si
		add	ax, 32h
		push	ax
		mov	bx, [si+32h]
		call	dword ptr [bx+0Ch]
		pop	cx
		cmp	word ptr [si+0E2h], 0
		jz	short loc_1732E
		push	word ptr [si+0E2h]
		call	sub_1BD2A
		pop	cx

loc_1732E:
		cmp	byte ptr [si+17Bh], 0
		jnz	short loc_17344
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 5
		jz	short loc_17344
		jmp	loc_173E0

loc_17344:
		mov	bx, [bp+var_10]
		cmp	word ptr [bx+24h], 0
		jz	short loc_1735C
		push	word ptr [bx+24h]
		mov	bx, [bx+24h]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		mov	[bp+var_12], ax

loc_1735C:
		push	[bp+var_12]
		push	word ptr [si+1DCh]
		mov	bx, [si+1DCh]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	di, si
		add	di, 134h
		mov	eax, [di]
		mov	[bp+var_AA], eax
		mov	eax, [di+4]
		mov	[bp+var_A6], eax
		mov	eax, [di+8]
		mov	[bp+var_A2], eax
		push	[bp+var_12]
		lea	ax, word ptr [bp+var_AA]
		push	ax
		call	sub_5A629
		add	sp, 4
		push	[bp+var_10]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+1DCh]
		mov	[bx+12h], eax
		mov	eax, [di+4]
		mov	[bx+16h], eax
		mov	eax, [di+8]
		mov	[bx+1Ah], eax
		mov	eax, [bp+var_AA]
		add	[bx+12h], eax
		mov	eax, [bp+var_A6]
		add	[bx+16h], eax
		mov	eax, [bp+var_A2]
		add	[bx+1Ah], eax

loc_173E0:
		cmp	byte_7CFAB, 0
		jnz	short loc_173EE
		cmp	byte_7C99A, 0
		jz	short loc_173F3

loc_173EE:
		mov	byte ptr [si+1E0h], 1

loc_173F3:
		pop	di
		pop	si
		leave
		retf
sub_1699B		endp

; START OF FUNCTION CHUNK FOR sub_1699B
off_173F7	dw offset loc_16F79
		dw offset loc_16F6D
		dw offset loc_16F9B
		dw offset loc_16F85
		dw offset loc_16F91
		dw offset loc_16F9B
word_17403	dw 15h
		dw 2Eh
		dw 3Bh
		dw 41h
off_1740B	dw offset loc_16D3F
		dw offset loc_16E33
		dw offset loc_16E42
		dw offset loc_16E8D
; END OF FUNCTION CHUNK FOR sub_1699B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17413		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_1745D

loc_1741E:
		mov	ax, dx
		imul	ax, ax, 1Dh
		mov	bx, [si+0F4h]
		add	bx, ax
		cmp	byte ptr [bx], 0FFh
		jz	short loc_1745C
		mov	ax, dx
		imul	ax, ax, 1Dh
		mov	bx, [si+0F4h]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+arg_2]
		jnz	short loc_1745C
		mov	byte ptr [si+1DFh], 0
		mov	[si+1E1h], dx
		mov	[si+0E6h], dx
		push	4
		push	67B7h
		call	sub_737CD
		add	sp, 4
		jmp	short loc_17463

loc_1745C:
		inc	dx

loc_1745D:
		cmp	[si+0E4h], dx
		jg	short loc_1741E

loc_17463:
		pop	si
		pop	bp
		retf
sub_17413		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Radar_ToggleTracking (sub_15B15 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,45L — bascule le suivi
; radar : affiche 'Target tracking OFF' (sub_6AEF3) si conditions remplies, appelle sub_6ACB5
; ou sub_6B085 selon l'état : handler ON/OFF du suivi de cible radar (UI cockpit).
; ==============================================================================================
Radar_ToggleTracking		proc far

var_6		= dword ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+17Bh], 0
		jz	short loc_174A4
		cmp	byte ptr [si+17Ah], 0
		jz	short loc_17496
		sub	sp, 4
		mov	[bp+var_6], 100h
		push	ds
		push	offset aTargetTrackingOFF
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_17496:
		mov	byte ptr [si+17Ah], 0
		push	si
		call	sub_73115
		pop	cx
		jmp	short loc_174B5

loc_174A4:
		mov	al, [si+1DFh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_174B5
		push	si
		call	sub_73495
		pop	cx

loc_174B5:
		pop	si
		pop	bp
		retf
Radar_ToggleTracking		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_174B8		proc near

var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	al, byte_7750D
		mov	ah, 0
		or	ax, ax
		jz	short loc_174D2
		jmp	loc_17920

loc_174D2:
		mov	byte_7750D, 1
		cmp	byte_776BB, 0
		jz	short loc_17506
		cmp	byte ptr [si+1B3h], 0
		jz	short loc_17506
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		mov	byte ptr [si+1B3h], 0
		mov	byte_776BB, 0

loc_17506:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_17514
		jmp	loc_177CA

loc_17514:
		mov	al, [si+1A3h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_17521
		jmp	loc_177CA

loc_17521:
		cmp	byte_7CB14, 0
		jnz	short loc_1752B
		jmp	loc_177CA

loc_1752B:
		mov	word ptr [bp+var_C+2], di
		mov	bx, word ptr [bp+var_C+2]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 99h
		mov	word ptr [bp+var_10], ax
		mov	bx, word ptr [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_E], eax
		mov	eax, [si+17Eh]
		cmp	eax, [bp+var_E]
		jge	short loc_1755D
		mov	ax, 1
		jmp	short loc_1755F

loc_1755D:
		xor	ax, ax

loc_1755F:
		or	al, al
		jnz	short loc_17566
		jmp	loc_17654

loc_17566:
		cmp	byte ptr [si+19Fh], 0
		jz	short loc_175C3
		mov	eax, [si+196h]
		cmp	eax, [si+192h]
		jge	short loc_1757E
		mov	ax, 1
		jmp	short loc_17580

loc_1757E:
		xor	ax, ax

loc_17580:
		or	al, al
		jz	short loc_17595
		push	si
		call	sub_734A9
		pop	cx
		push	si
		call	sub_734A4
		pop	cx
		jmp	loc_177CA

loc_17595:
		mov	eax, [si+192h]
		mov	[si+196h], eax
		mov	byte ptr [si+19Eh], 1
		mov	byte ptr [si+19Fh], 0
		mov	[bp+var_14], 100h
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		jmp	loc_177CA

loc_175C3:
		mov	ax, si
		add	ax, 182h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	ax, si
		add	ax, 17Eh
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bp+var_E]
		sub	eax, [bx]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		sub	[si+196h], eax
		cmp	dword ptr [si+196h], 0
		jge	short loc_1762E
		mov	ax, 1
		jmp	short loc_17630

loc_1762E:
		xor	ax, ax

loc_17630:
		or	al, al
		jz	short loc_17645
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	[si+196h], eax

loc_17645:
		push	si
		call	sub_7349F
		pop	cx
		mov	byte ptr [si+19Eh], 1
		jmp	loc_177CA

loc_17654:
		mov	eax, [si+186h]
		cmp	eax, [bp+var_E]
		jle	short loc_17664
		mov	ax, 1
		jmp	short loc_17666

loc_17664:
		xor	ax, ax

loc_17666:
		or	al, al
		jnz	short loc_1766D
		jmp	loc_1775A

loc_1766D:
		cmp	byte ptr [si+19Eh], 0
		jz	short loc_176CA
		mov	eax, [si+196h]
		cmp	eax, [si+192h]
		jge	short loc_17685
		mov	ax, 1
		jmp	short loc_17687

loc_17685:
		xor	ax, ax

loc_17687:
		or	al, al
		jz	short loc_1769C
		push	si
		call	sub_734A9
		pop	cx
		push	si
		call	sub_7349F
		pop	cx
		jmp	loc_177CA

loc_1769C:
		mov	eax, [si+192h]
		mov	[si+196h], eax
		mov	byte ptr [si+19Eh], 0
		mov	byte ptr [si+19Fh], 1
		mov	[bp+var_18], 100h
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		jmp	loc_177CA

loc_176CA:
		mov	ax, si
		add	ax, 18Ah
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	ax, si
		add	ax, 186h
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bp+var_E]
		sub	eax, [bx]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		sub	[si+196h], eax
		cmp	dword ptr [si+196h], 0
		jge	short loc_17735
		mov	ax, 1
		jmp	short loc_17737

loc_17735:
		xor	ax, ax

loc_17737:
		or	al, al
		jz	short loc_1774C
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	[si+196h], eax

loc_1774C:
		push	si
		call	sub_734A4
		pop	cx
		mov	byte ptr [si+19Fh], 1
		jmp	short loc_177CA

loc_1775A:
		cmp	byte ptr [si+19Eh], 0
		jnz	short loc_17768
		cmp	byte ptr [si+19Fh], 0
		jz	short loc_177CA

loc_17768:
		mov	eax, [si+196h]
		cmp	eax, [si+192h]
		jge	short loc_17779
		mov	ax, 1
		jmp	short loc_1777B

loc_17779:
		xor	ax, ax

loc_1777B:
		or	al, al
		jz	short loc_1779F
		push	si
		call	sub_734A9
		pop	cx
		cmp	byte ptr [si+19Eh], 0
		jz	short loc_17796
		push	si
		call	sub_7349F
		pop	cx
		jmp	short loc_177CA

loc_17796:
		push	si
		call	sub_734A4
		pop	cx
		jmp	short loc_177CA

loc_1779F:
		mov	eax, [si+192h]
		mov	[si+196h], eax
		mov	byte ptr [si+19Eh], 0
		mov	byte ptr [si+19Fh], 0
		mov	[bp+var_1C], 100h
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4

loc_177CA:
		cmp	byte_7978B, 0
		jnz	short loc_177D4
		jmp	loc_178CD

loc_177D4:
		mov	al, [si+19Eh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_177E1
		jmp	loc_178CD

loc_177E1:
		mov	al, [si+19Fh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_177EE
		jmp	loc_178CD

loc_177EE:
		cmp	byte_7CB14, 0
		jnz	short loc_177F8
		jmp	loc_178CD

loc_177F8:
		mov	cx, si
		add	cx, 110h
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	eax, [bx+4]
		mov	[bp+var_38], eax
		mov	eax, [bx+8]
		mov	[bp+var_34], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	sub_5A629
		add	sp, 4
		push	688Fh
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [si+1ABh]
		cmp	eax, [bp+var_C]
		jl	short loc_1784F
		mov	ax, 1
		jmp	short loc_17851

loc_1784F:
		xor	ax, ax

loc_17851:
		or	al, al
		jz	short loc_178AA
		mov	di, si
		add	di, 1AFh
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 1A7h
		mov	eax, [di]
		add	[bp+var_14], eax
		mov	di, si
		add	di, 1A4h
		mov	al, [di+2]
		push	ax
		mov	al, [di+1]
		push	ax
		mov	al, [di]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	64DEh
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		mov	byte ptr [si+1A3h], 1
		jmp	short loc_178CD

loc_178AA:
		cmp	byte ptr [si+1A3h], 0
		jz	short loc_178CD
		mov	[bp+var_10], 100h
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		mov	byte ptr [si+1A3h], 0

loc_178CD:
		cmp	byte_776BB, 0
		jz	short loc_17920
		mov	[bp+var_8], 100h
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		mov	[bp+var_10], 4Ch
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	di, si
		add	di, 1B4h
		mov	al, [di+2]
		push	ax
		mov	al, [di+1]
		push	ax
		mov	al, [di]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	64DEh
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		mov	byte ptr [si+1B3h], 1
sub_174B8		endp
seg032		ends
