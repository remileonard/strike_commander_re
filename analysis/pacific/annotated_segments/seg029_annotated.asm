seg029		segment	para public 'CODE' use16
		assume cs:seg029
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 4

loc_13793:
		mov	al, 1
		leave
		retf

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13797		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_13797		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1379C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1379C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_137A1		proc far

var_14		= word ptr -14h
var_12		= byte ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+arg_4]
		xor	si, si
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+46h], 1
		cmp	word ptr [di], 0
		jz	short loc_137BF
		mov	si, [di]
		jmp	short loc_137E9

loc_137BF:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_137D5
		mov	si, es:[bx+123h]
		jmp	short loc_137E9

loc_137D5:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	word ptr es:[bx+1F1h], 0
		jz	short loc_137E9
		mov	si, es:[bx+1F1h]

loc_137E9:
		mov	[bp+var_A], si
		push	[bp+var_A]
		mov	ax, [bp+arg_0]
		add	ax, 33h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		or	si, si
		jz	short loc_1380D
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		jmp	short loc_13811

loc_1380D:
		xor	dx, dx
		xor	ax, ax

loc_13811:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_13823

loc_1381E:
		mov	al, 0
		jmp	loc_13952

loc_13823:
		les	bx, word ptr [bp+var_8]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_1381E
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	ax, es:[bx+0D8h]
		mov	dx, es:[bx+0D6h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		add	ax, 1Ah
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	bx, [bp+arg_0]
		mov	es:[bx+1Dh], eax
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+65h]
		mov	[bp+var_12], al
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+24h], 1
		jge	short loc_13899
		cmp	[bp+var_12], 4
		jz	short loc_13905
		cmp	byte ptr [di+0Ah], 0
		jz	short loc_1381E
		jmp	short loc_13905
		jmp	short loc_1381E

loc_13899:
		mov	[bp+var_14], si
		push	[bp+var_14]
		push	6090h
		call	SetReference16
		add	sp, 4
		push	large [bp+var_8]
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jz	short loc_138D2
		push	large [bp+var_8]
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_1390C

loc_138D2:
		push	1Fh
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		or	al, al
		jnz	short loc_13950
		push	40h
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		or	al, al
		jnz	short loc_13945
		cmp	[bp+var_12], 4
		jz	short loc_13905
		cmp	byte ptr [di+0Ah], 0
		jnz	short loc_13905
		jmp	loc_1381E

loc_13905:
		mov	al, 0Ah
		jmp	short loc_13952
		jmp	loc_1381E

loc_1390C:
		push	77h
		push	large [bp+var_4]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		or	al, al
		jnz	short loc_13921
		jmp	loc_1381E

loc_13921:
		push	0FFB7h
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		or	al, al
		jnz	short loc_13950
		push	40h
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		or	al, al
		jz	short loc_13949

loc_13945:
		mov	al, 7
		jmp	short loc_13952

loc_13949:
		mov	al, 1
		jmp	short loc_13952
		jmp	loc_1381E

loc_13950:
		mov	al, 9

loc_13952:
		pop	di
		pop	si
		leave
		retf
sub_137A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13956		proc far

var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+65h]
		mov	[bp+var_6], al
		push	si
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1399F

loc_13993:
		push	large [bp+arg_0]
		call	sub_10381
		jmp	loc_13C84

loc_1399F:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	ax, es:[bx+0D8h]
		mov	dx, es:[bx+0D6h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	si
		push	large [bp+arg_0]
		call	sub_10409
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	word ptr es:[bx+1F1h], 0
		jz	short loc_139DD
		mov	ax, es:[bx+1F1h]
		mov	[bp+var_8], ax
		push	ax
		jmp	short loc_139F5

loc_139DD:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_13A07
		mov	ax, es:[bx+123h]
		mov	[bp+var_A], ax
		push	ax

loc_139F5:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 33h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_13A07:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+33h], 0
		jnz	short loc_13A13
		jmp	short loc_13993

loc_13A13:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+33h]
		mov	[bp+var_C], ax
		push	ax
		push	6090h
		call	SetReference16
		add	sp, 4
		cmp	[bp+var_6], 4
		jz	short loc_13A35
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_13A62

loc_13A35:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 6
		mov	[bp+var_10], 400h
		mov	eax, [bp+var_10]
		mov	es:[bx+2Dh], eax

loc_13A4E:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	ax, [bx+1Bh]

loc_13A58:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+44h], ax
		jmp	loc_13C77

loc_13A62:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+18h], 0
		jnz	short loc_13A70
		jmp	loc_13C77

loc_13A70:
		mov	si, word_7C7C0
		add	si, 1Ah
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bx+1Ah]
		sub	eax, [si]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	si, word ptr [bp+var_1A+1]
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_13AB3
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_13AB5

loc_13AB3:
		mov	al, 1Ch

loc_13AB5:
		mov	ah, 0
		mov	[bp+var_12], ax
		mov	cx, 4
		mov	bx, offset word_13C8B

loc_13AC0:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_12]
		jz	short loc_13AD0
		add	bx, 2
		loop	short loc_13AC0
		jmp	loc_13C52

loc_13AD0:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_13AD4:
		cmp	[bp+var_6], 0
		jnz	short loc_13B55
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 3
		mov	[bp+var_1E], 200h
		mov	eax, [bp+var_1E]
		mov	es:[bx+2Dh], eax
		cmp	si, 0CE4h
		jge	short loc_13B16
		mov	di, word_7C7C0
		add	di, 1Ah
		mov	eax, [di]
		add	eax, 0CE400h
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		jmp	short loc_13B20

loc_13B16:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	ax, [bx+1Bh]

loc_13B20:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+44h], ax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+44h]
		add	ax, 0FE0Ch
		mov	[bp+var_28], ax
		movsx	eax, [bp+var_28]
		shl	eax, 8
		mov	bx, es:[bx+0Ah]
		cmp	eax, [bx+1Ah]
		jle	short loc_13B4C
		mov	ax, 1
		jmp	short loc_13B4E

loc_13B4C:
		xor	ax, ax

loc_13B4E:
		or	al, al
		jnz	short loc_13B55
		jmp	loc_13C77

loc_13B55:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 2
		mov	[bp+var_2C], 300h
		mov	eax, [bp+var_2C]
		mov	es:[bx+2Dh], eax
		cmp	si, 1F4h
		jl	short loc_13B77
		jmp	loc_13A4E

loc_13B77:
		mov	si, word_7C7C0
		add	si, 1Ah
		mov	eax, [si]
		add	eax, 1F400h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	ax, word ptr [bp+var_34+1]
		jmp	loc_13A58
		jmp	loc_13A4E

loc_13B98:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 5
		mov	[bp+var_38], 300h
		mov	eax, [bp+var_38]
		mov	es:[bx+2Dh], eax
		cmp	si, 15Eh
		jle	short loc_13BD5
		mov	si, word_7C7C0
		add	si, 1Ah
		mov	eax, [si]
		add	eax, 15E00h
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	ax, word ptr [bp+var_40+1]
		jmp	loc_13A58

loc_13BD5:
		cmp	si, 0FAh
		jl	short loc_13BDE
		jmp	loc_13A4E

loc_13BDE:
		mov	si, word_7C7C0
		add	si, 1Ah
		mov	eax, [si]
		add	eax, 0FA00h
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	ax, word ptr [bp+var_48+1]
		jmp	loc_13A58
		jmp	loc_13A4E

loc_13BFF:
		mov	si, word_7C7C0
		add	si, 1Ah
		mov	eax, [si]
		add	eax, 1F400h
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	ax, word ptr [bp+var_50+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+44h], ax
		mov	byte ptr es:[bx+32h], 0
		mov	[bp+var_54], 200h
		mov	eax, [bp+var_54]
		jmp	short loc_13C48

loc_13C34:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 1
		mov	[bp+var_58], 200h
		mov	eax, [bp+var_58]

loc_13C48:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Dh], eax
		jmp	short loc_13C77

loc_13C52:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 9
		mov	[bp+var_5C], 0
		mov	eax, [bp+var_5C]
		mov	es:[bx+2Dh], eax
		push	large [bp+var_4]
		call	sub_3EE7E
		add	sp, 4

loc_13C77:
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]

loc_13C84:
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_13956		endp

; START OF FUNCTION CHUNK FOR sub_13956
word_13C8B	dw 8
		dw 9
		dw 0Dh
		dw 1Ah
off_13C93	dw offset loc_13C34
		dw offset loc_13AD4
		dw offset loc_13BFF
		dw offset loc_13B98
; END OF FUNCTION CHUNK FOR sub_13956

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13C9B		proc far

var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
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
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	byte ptr es:[bx+169h], 1
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_7976E
		sub	es:[bx+2Dh], eax
		mov	al, es:[bx+47h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_13CC8
		jmp	loc_13DD4

loc_13CC8:
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_3C], eax
		mov	eax, [si+4]
		mov	[bp+var_38], eax
		mov	eax, [si+8]
		mov	[bp+var_34], eax
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_48]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_48]
		imul	eax, eax, 28h
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_44]
		imul	eax, eax, 28h
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_40]
		imul	eax, eax, 28h
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_50]
		add	[bp+var_38], eax
		mov	eax, [bp+var_4C]
		add	[bp+var_34], eax
		push	0
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_60], eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_5C], eax
		mov	[bp+var_24], 100h
		mov	eax, [bp+var_24]
		mov	[bp+var_58], eax
		lea	ax, word ptr [bp+var_60]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_28]
		cmp	eax, [bp+var_34]
		jl	short loc_13DB5
		mov	ax, 1
		jmp	short loc_13DB7

loc_13DB5:
		xor	ax, ax

loc_13DB7:
		or	al, al
		jz	short loc_13DD4
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_2C], 400h
		mov	eax, [bp+var_2C]
		mov	es:[bx+2Dh], eax

loc_13DD4:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+47h], 0
		mov	eax, es:[bx+2Dh]
		sar	eax, 8
		cmp	eax, 0
		jge	short loc_13E2A
		cmp	byte ptr es:[bx+32h], 5
		jz	short loc_13E16
		cmp	byte ptr es:[bx+32h], 3
		jz	short loc_13E16
		cmp	byte ptr es:[bx+32h], 7
		jz	short loc_13E16
		cmp	byte ptr es:[bx+32h], 4
		jz	short loc_13E16

loc_13E07:
		push	large [bp+arg_0]
		call	sub_10381

loc_13E10:
		add	sp, 4
		jmp	loc_13F24

loc_13E16:
		mov	[bp+var_30], 500h
		mov	eax, [bp+var_30]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Dh], eax

loc_13E2A:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+33h], 0
		jnz	short loc_13E36
		jmp	short loc_13E07

loc_13E36:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+33h]
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 18h
		jnz	short loc_13E70
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+33h]
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 17h
		jnz	short loc_13E70
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+33h]
		cmp	byte ptr [bx+116h], 0
		jz	short loc_13E70
		jmp	short loc_13E07

loc_13E70:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+33h]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_9D0A
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 0Bh
		jbe	short loc_13E96
		jmp	loc_13F24

loc_13E96:
		shl	bx, 1
		jmp	cs:off_13F27[bx]	; switch jump

loc_13E9D:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_13F3F
		jmp	loc_13E10

loc_13EA9:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14135
		jmp	loc_13E10

loc_13EB5:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_143BE
		jmp	loc_13E10

loc_13EC1:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14A59
		jmp	loc_13E10

loc_13ECD:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14EDF
		jmp	loc_13E10

loc_13ED9:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14325
		jmp	loc_13E10

loc_13EE5:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14353
		jmp	loc_13E10

loc_13EF1:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_154B0
		jmp	loc_13E10

loc_13EFD:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14FBE
		jmp	loc_13E10

loc_13F09:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1542B
		jmp	loc_13E10

loc_13F15:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_157BA
		jmp	loc_13E10

loc_13F21:
		jmp	loc_13E07

loc_13F24:
		pop	si
		leave
		retf
sub_13C9B		endp

; START OF FUNCTION CHUNK FOR sub_13C9B
off_13F27	dw offset loc_13E9D
		dw offset loc_13EA9
		dw offset loc_13EB5
		dw offset loc_13EC1
		dw offset loc_13ECD
		dw offset loc_13EF1
		dw offset loc_13EFD
		dw offset loc_13F09
		dw offset loc_13F15
		dw offset loc_13F21
		dw offset loc_13ED9
		dw offset loc_13EE5
; END OF FUNCTION CHUNK FOR sub_13C9B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13F3F		proc far

var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		lea	ax, [bp+var_44]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+33h], 0
		jnz	short loc_13F76
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_4], 300h
		mov	eax, [bp+var_4]

loc_13F6B:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Dh], eax
		jmp	loc_14132

loc_13F76:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	6093h
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_8]
		or	eax, eax
		jge	short loc_13FA7
		neg	eax

loc_13FA7:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	dx, word ptr [bp+var_10+1]
		mov	eax, dword_7C7C3
		mov	dword_7C811, eax
		mov	eax, dword_7C7C7
		mov	dword_7C815, eax
		mov	eax, dword_7C7CB
		mov	dword_7C819, eax
		cmp	dx, 5
		jl	short loc_13FD6
		jmp	loc_14094

loc_13FD6:
		mov	eax, dword_7C7DF
		add	eax, 1F4h
		cmp	eax, dword_7C7D9
		jge	short loc_13FEA
		jmp	loc_1406F

loc_13FEA:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	6093h
		call	Vector_Normalize3D_57796
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_38], eax
		mov	eax, [si+4]
		mov	[bp+var_34], eax
		mov	eax, [si+8]
		mov	[bp+var_30], eax
		lea	ax, [bp+var_44]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, [bp+var_44]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	[bp+var_14], 200h
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Dh], eax

loc_1406F:
		cmp	dword_7C7D9, 258h
		jl	short loc_1407D
		jmp	loc_14132

loc_1407D:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_18], 0A00h
		mov	eax, [bp+var_18]
		jmp	loc_13F6B

loc_14094:
		cmp	dx, 23h
		jg	short loc_1409C
		jmp	loc_14132

loc_1409C:
		cmp	dword_7C7D9, 7D0h
		jl	short loc_140AA
		jmp	loc_14132

loc_140AA:
		mov	eax, dword_7C7C3
		neg	eax
		mov	[bp+var_5C], eax
		mov	eax, dword_7C7C7
		neg	eax
		mov	[bp+var_58], eax
		mov	eax, dword_7C7CB
		neg	eax
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_48], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 1Ah
		mov	eax, [si]
		add	eax, 1F400h
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	dword_7C811, eax
		mov	eax, [bp+var_4C]
		mov	dword_7C815, eax
		mov	eax, [bp+var_48]
		mov	dword_7C819, eax

loc_14132:
		pop	si
		leave
		retf
sub_13F3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14135		proc far

var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		lea	ax, [bp+var_44]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+33h], 0
		jnz	short loc_1416C
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_4], 300h
		mov	eax, [bp+var_4]

loc_14161:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Dh], eax
		jmp	loc_14322

loc_1416C:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	6093h
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_8]
		or	eax, eax
		jge	short loc_1419D
		neg	eax

loc_1419D:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	dx, word ptr [bp+var_10+1]
		mov	eax, dword_7C7C3
		mov	dword_7C811, eax
		mov	eax, dword_7C7C7
		mov	dword_7C815, eax
		mov	eax, dword_7C7CB
		mov	dword_7C819, eax
		cmp	dx, 5
		jl	short loc_141CC
		jmp	loc_14284

loc_141CC:
		cmp	dword_7C7D9, 9C4h
		jle	short loc_141DA
		jmp	loc_1425F

loc_141DA:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	6093h
		call	Vector_Normalize3D_57796
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_38], eax
		mov	eax, [si+4]
		mov	[bp+var_34], eax
		mov	eax, [si+8]
		mov	[bp+var_30], eax
		lea	ax, [bp+var_44]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, [bp+var_44]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	[bp+var_14], 200h
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Dh], eax

loc_1425F:
		cmp	dword_7C7D9, 3E8h
		jl	short loc_1426D
		jmp	loc_14322

loc_1426D:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_18], 0A00h
		mov	eax, [bp+var_18]
		jmp	loc_14161

loc_14284:
		cmp	dx, 23h
		jg	short loc_1428C
		jmp	loc_14322

loc_1428C:
		cmp	dword_7C7D9, 9C4h
		jl	short loc_1429A
		jmp	loc_14322

loc_1429A:
		mov	eax, dword_7C7C3
		neg	eax
		mov	[bp+var_5C], eax
		mov	eax, dword_7C7C7
		neg	eax
		mov	[bp+var_58], eax
		mov	eax, dword_7C7CB
		neg	eax
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_48], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 1Ah
		mov	eax, [si]
		add	eax, 1F400h
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	dword_7C811, eax
		mov	eax, [bp+var_4C]
		mov	dword_7C815, eax
		mov	eax, [bp+var_48]
		mov	dword_7C819, eax

loc_14322:
		pop	si
		leave
		retf
sub_14135		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14325		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	word_7C835, 0
		mov	word_7C82F, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		mov	word_7C833, 0
		mov	byte_7C848, 1
		pop	bp
		retf
sub_14325		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14353		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		mov	eax, dword_7C7C3
		neg	eax
		mov	[bp+var_C], eax
		mov	eax, dword_7C7C7
		neg	eax
		mov	[bp+var_8], eax
		mov	eax, dword_7C7CB
		neg	eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	dword_7C811, eax
		mov	eax, [bp+var_14]
		mov	dword_7C815, eax
		mov	eax, [bp+var_10]
		mov	dword_7C819, eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		mov	word_7C82B, ax
		leave
		retf
sub_14353		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_143BE		proc far

var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_10E		= dword ptr -10Eh
var_10A		= dword ptr -10Ah
var_106		= dword ptr -106h
var_102		= dword ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= dword ptr -0FAh
var_F6		= dword ptr -0F6h
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
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
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= word ptr -58h
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
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
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 152h
		push	si
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_92], eax
		mov	eax, [si+4]
		mov	[bp+var_8E], eax
		mov	eax, [si+8]
		mov	[bp+var_8A], eax
		mov	eax, dword_7C7D9
		mov	[bp+var_C], eax
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_CE]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		push	large [bp+var_C6]
		push	large [bp+var_CA]
		push	large [bp+var_CE]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+33h]
		test	byte ptr [bx+2], 4
		jnz	short loc_1446D
		jmp	loc_1451B

loc_1446D:
		add	[bp+var_8], 400h
		push	bx
		push	ss
		lea	ax, word ptr [bp+var_DA]
		push	ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_DA]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_D6]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_D2]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_E6]
		add	[bp+var_92], eax
		mov	eax, [bp+var_E2]
		add	[bp+var_8E], eax
		mov	eax, [bp+var_DE]
		add	[bp+var_8A], eax

loc_1451B:
		mov	eax, [bp+var_92]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+44h]
		mov	[bp+var_3A], ax
		movsx	eax, [bp+var_3A]
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_8A], eax
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [bp+var_92]
		sub	eax, [si]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_8E]
		sub	eax, [si+4]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_8A]
		sub	eax, [si+8]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_F2]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_EE]
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_EA]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_FE]
		mov	dword_7C811, eax
		mov	eax, [bp+var_FA]
		mov	dword_7C815, eax
		mov	eax, [bp+var_F6]
		mov	dword_7C819, eax
		push	eax
		push	large dword_7C815
		push	large dword_7C811
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		mov	ax, word ptr [bp+var_46+1]
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bx+1Ah]
		sub	eax, [bp+var_96]
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		mov	ax, word ptr [bp+var_4E+1]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+33h]
		mov	[bp+var_50], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_52], ax
		movsx	eax, [bp+var_52]
		shl	eax, 8
		mov	[bp+var_56], eax
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_14694
		push	0
		lea	ax, word ptr [bp+var_56]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		les	bx, es:[bx+18h]
		push	word ptr es:[bx+0Dh]
		push	[bp+var_50]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		les	bx, es:[bx+18h]
		push	large es:[bx]
		push	ss
		lea	ax, word ptr [bp+var_10A]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 10h
		mov	dx, ss
		lea	ax, word ptr [bp+var_10A]
		jmp	short loc_146B5

loc_14694:
		mov	eax, dword_79CD4
		mov	[bp+var_10A], eax
		mov	eax, dword_79CD8
		mov	[bp+var_106], eax
		mov	eax, dword_79CDC
		mov	[bp+var_102], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_10A]

loc_146B5:
		mov	eax, [bp+var_10A]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_102]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_AA]
		sub	eax, [bp+var_9E]
		mov	[bp+var_116], eax
		mov	eax, [bp+var_A6]
		sub	eax, [bp+var_9A]
		mov	[bp+var_112], eax
		mov	eax, [bp+var_A2]
		sub	eax, [bp+var_96]
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_BA], eax
		push	60E1h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_58], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 46h
		jl	short loc_1476C
		jmp	loc_14970

loc_1476C:
		push	large [bp+var_BA]
		push	large [bp+var_BE]
		push	large [bp+var_C2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B8h]
		cbw
		shl	ax, 2
		add	ax, 32h
		mov	[bp+var_62], ax
		movsx	eax, [bp+var_62]
		shl	eax, 8
		cmp	eax, [bp+var_60]
		jl	short loc_147B9
		mov	ax, 1
		jmp	short loc_147BB

loc_147B9:
		xor	ax, ax

loc_147BB:
		or	al, al
		jnz	short loc_147C2
		jmp	loc_14A07

loc_147C2:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 21h
		mov	[bp+var_64], ax
		mov	[bp+var_66], dx
		les	si, [bp+var_66]
		mov	eax, es:[si]
		mov	[bp+var_13A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_136], eax
		mov	eax, es:[si+8]
		mov	[bp+var_132], eax
		mov	eax, [bp+var_13A]
		sub	eax, [bp+var_9E]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_136]
		sub	eax, [bp+var_9A]
		mov	[bp+var_142], eax
		mov	eax, [bp+var_132]
		sub	eax, [bp+var_96]
		mov	[bp+var_13E], eax
		mov	eax, [bp+var_146]
		mov	[bp+var_152], eax
		mov	eax, [bp+var_142]
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_13E]
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_152]
		mov	[bp+var_12E], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_14A]
		mov	[bp+var_126], eax
		push	eax
		push	large [bp+var_12A]
		push	large [bp+var_12E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6A], eax
		mov	[bp+var_6E], eax
		push	large [bp+var_BA]
		push	large [bp+var_BE]
		push	large [bp+var_C2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		mov	eax, [bp+var_6E]
		cmp	eax, [bp+var_76]
		jge	short loc_148AC
		mov	ax, 1
		jmp	short loc_148AE

loc_148AC:
		xor	ax, ax

loc_148AE:
		or	al, al
		jnz	short loc_148ED
		push	large [bp+var_BA]
		push	large [bp+var_BE]
		push	large [bp+var_C2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_7A], eax
		mov	[bp+var_7E], eax
		cmp	[bp+var_7E], 0A00h
		jge	short loc_148E4
		mov	ax, 1
		jmp	short loc_148E6

loc_148E4:
		xor	ax, ax

loc_148E6:
		or	al, al
		jnz	short loc_148ED
		jmp	loc_14A07

loc_148ED:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		push	large es:[bx+18h]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		push	large es:[bx+0D6h]
		call	sub_3F17A
		add	sp, 8
		or	ax, ax
		jz	short loc_1492A
		jmp	loc_14A07

loc_1492A:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		cmp	[bp+var_8], 1400h
		jge	short loc_14941
		mov	ax, 1
		jmp	short loc_14943

loc_14941:
		xor	ax, ax

loc_14943:
		or	al, al
		jz	short loc_14960
		mov	eax, [bp+var_8]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_82]

loc_14955:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Dh], eax
		jmp	loc_14A07

loc_14960:
		mov	[bp+var_86], 1700h
		mov	eax, [bp+var_86]
		jmp	short loc_14955

loc_14970:
		movsx	eax, [bp+var_4]
		mov	edx, dword_7C837
		shl	edx, 1
		add	edx, 5DCh
		cmp	eax, edx
		jge	short loc_14A07
		mov	ax, word_7C81A
		mov	[bp+var_64], ax
		mov	eax, dword_7C811
		neg	eax
		mov	[bp+var_12E], eax
		mov	eax, dword_7C815
		neg	eax
		mov	[bp+var_12A], eax
		mov	eax, dword_7C819
		neg	eax
		mov	[bp+var_126], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_136], eax
		mov	eax, [bp+var_126]
		mov	[bp+var_132], eax
		mov	eax, [bp+var_13A]
		mov	dword_7C811, eax
		mov	eax, [bp+var_136]
		mov	dword_7C815, eax
		mov	eax, [bp+var_132]
		mov	dword_7C819, eax
		mov	ax, [bp+var_64]
		mov	[bp+var_66], ax
		movsx	eax, [bp+var_66]
		shl	eax, 8
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6A]
		mov	dword_7C819, eax

loc_14A07:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_AA]
		mov	es:[bx+21h], eax
		mov	eax, [bp+var_A6]
		mov	es:[bx+25h], eax
		mov	eax, [bp+var_A2]
		mov	es:[bx+29h], eax
		pop	si
		leave
		retf
sub_143BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A2B		proc far

arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		call	CRT_Rand
		and	ax, 1Fh
		inc	ax
		mov	bx, ax
		mov	ax, si
		shl	ax, 1
		sub	bx, ax
		or	bx, bx
		jge	short loc_14A4B
		xor	ax, ax
		jmp	short loc_14A56

loc_14A4B:
		mov	ax, 10h
		sub	ax, si
		push	ax
		mov	ax, bx
		pop	dx
		sub	ax, dx

loc_14A56:
		pop	si
		pop	bp
		retf
sub_14A2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A59		proc far

var_106		= dword ptr -106h
var_102		= dword ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= dword ptr -0FAh
var_F6		= dword ptr -0F6h
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
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
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 106h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_6A], eax
		mov	eax, [si+4]
		mov	[bp+var_66], eax
		mov	eax, [si+8]
		mov	[bp+var_62], eax
		mov	ax, es:[bx+44h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_62], eax
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [bp+var_6A]
		sub	eax, [si]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_66]
		sub	eax, [si+4]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		sub	eax, [si+8]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	dword_7C811, eax
		mov	eax, [bp+var_8A]
		mov	dword_7C815, eax
		mov	eax, [bp+var_86]
		mov	dword_7C819, eax
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [si]
		sub	eax, [bp+var_6A]
		mov	[bp+var_9A], eax
		mov	eax, [si+4]
		sub	eax, [bp+var_66]
		mov	[bp+var_96], eax
		mov	eax, [si+8]
		sub	eax, [bp+var_62]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_6E], eax
		push	eax
		push	large [bp+var_72]
		push	large [bp+var_76]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 1Ah
		mov	bx, es:[bx+0Ah]
		mov	eax, [bx+1Ah]
		sub	eax, [si]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+33h]
		test	byte ptr [bx+2], 4
		jnz	short loc_14BBE
		jmp	loc_14D6A

loc_14BBE:
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0B8h], 4
		jg	short loc_14BD0
		jmp	loc_14D6A

loc_14BD0:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	di, es:[bx+0Ah]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_D6], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_D2], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_E2]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_C2], eax
		push	eax
		push	large [bp+var_C6]
		push	large [bp+var_CA]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_EE]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		push	large [bp+var_E6]
		push	large [bp+var_EA]
		push	large [bp+var_EE]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_36]
		mov	edx, eax
		mov	ecx, [bp+var_3E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	[bp+var_2E], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+33h]
		push	ss
		lea	ax, word ptr [bp+var_FA]
		push	ax
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_FA]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_F6]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_F2]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_106], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_102], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_106]
		add	[bp+var_6A], eax
		mov	eax, [bp+var_102]
		add	[bp+var_66], eax
		mov	eax, [bp+var_FE]
		add	[bp+var_62], eax

loc_14D6A:
		push	60E1h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_1C], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5
		jl	short loc_14D9A
		jmp	loc_14E25

loc_14D9A:
		mov	ax, [bp+var_4]
		sar	ax, 1
		add	ax, 0FAh
		cmp	ax, [bp+var_2]
		jge	short loc_14DAA
		jmp	loc_14EDB

loc_14DAA:
		mov	ax, word_7C831
		mov	[bp+var_1E], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 2
		jl	short loc_14DBD
		jmp	loc_14EDB

loc_14DBD:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 4
		mov	[bp+var_22], 1900h
		mov	eax, [bp+var_22]
		mov	es:[bx+2Dh], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		xor	al, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 3
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		jmp	loc_14EDB

loc_14E25:
		push	60E1h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_24], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 3Ch
		jg	short loc_14E55
		jmp	loc_14EDB

loc_14E55:
		mov	ax, [bp+var_4]
		shl	ax, 1
		cmp	ax, [bp+var_2]
		jl	short loc_14EDB
		mov	eax, dword_7C811
		neg	eax
		mov	[bp+var_B2], eax
		mov	eax, dword_7C815
		neg	eax
		mov	[bp+var_AE], eax
		mov	eax, dword_7C819
		neg	eax
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_BE]
		mov	dword_7C811, eax
		mov	eax, [bp+var_BA]
		mov	dword_7C815, eax
		mov	eax, [bp+var_B6]
		mov	dword_7C819, eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+44h]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	dword_7C819, eax

loc_14EDB:
		pop	di
		pop	si
		leave
		retf
sub_14A59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14EDF		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	[bp+var_4], 500h
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+47h], 1
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		sub	sp, 0Ch
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_1E], eax
		mov	eax, [si+4]
		mov	[bp+var_1A], eax
		mov	eax, [si+8]
		mov	[bp+var_16], eax
		push	large es:[bx+0Dh]
		call	sub_AF37
		add	sp, 14h
		or	al, al
		jz	short loc_14F97
		cmp	dword_7C837, 29Ah
		jg	short loc_14F69
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_8], 0F00h
		mov	eax, [bp+var_8]
		mov	es:[bx+2Dh], eax
		jmp	short loc_14FBB

loc_14F69:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		xor	al, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al

loc_14F97:
		cmp	dword_7C837, 258h
		jg	short loc_14FBB
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_C], 800h
		mov	eax, [bp+var_C]
		mov	es:[bx+2Dh], eax

loc_14FBB:
		pop	si
		leave
		retf
sub_14EDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14FBE		proc far

var_106		= dword ptr -106h
var_102		= dword ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= dword ptr -0FAh
var_F6		= dword ptr -0F6h
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
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
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 106h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_6A], eax
		mov	eax, [si+4]
		mov	[bp+var_66], eax
		mov	eax, [si+8]
		mov	[bp+var_62], eax
		mov	ax, es:[bx+44h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_62], eax
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [bp+var_6A]
		sub	eax, [si]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_66]
		sub	eax, [si+4]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		sub	eax, [si+8]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	dword_7C811, eax
		mov	eax, [bp+var_8A]
		mov	dword_7C815, eax
		mov	eax, [bp+var_86]
		mov	dword_7C819, eax
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [si]
		sub	eax, [bp+var_6A]
		mov	[bp+var_9A], eax
		mov	eax, [si+4]
		sub	eax, [bp+var_66]
		mov	[bp+var_96], eax
		mov	eax, [si+8]
		sub	eax, [bp+var_62]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_6E], eax
		push	eax
		push	large [bp+var_72]
		push	large [bp+var_76]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 1Ah
		mov	bx, es:[bx+0Ah]
		mov	eax, [bx+1Ah]
		sub	eax, [si]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+33h]
		test	byte ptr [bx+2], 4
		jnz	short loc_15123
		jmp	loc_152BD

loc_15123:
		mov	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	di, es:[bx+0Ah]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_D6], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_D2], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_E2]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_C2], eax
		push	eax
		push	large [bp+var_C6]
		push	large [bp+var_CA]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_EE]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		push	large [bp+var_E6]
		push	large [bp+var_EA]
		push	large [bp+var_EE]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_36]
		mov	edx, eax
		mov	ecx, [bp+var_3E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	[bp+var_2E], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+33h]
		push	ss
		lea	ax, word ptr [bp+var_FA]
		push	ax
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_FA]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_F6]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_F2]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_106], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_102], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_106]
		add	[bp+var_6A], eax
		mov	eax, [bp+var_102]
		add	[bp+var_66], eax
		mov	eax, [bp+var_FE]
		add	[bp+var_62], eax

loc_152BD:
		push	60E1h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_1C], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5
		jl	short loc_152ED
		jmp	loc_15371

loc_152ED:
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jle	short loc_152F8
		jmp	loc_15427

loc_152F8:
		mov	ax, word_7C831
		mov	[bp+var_1E], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 2
		jl	short loc_1530B
		jmp	loc_15427

loc_1530B:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 7
		mov	[bp+var_22], 1900h
		mov	eax, [bp+var_22]
		mov	es:[bx+2Dh], eax
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		jmp	loc_15427

loc_15371:
		push	60E1h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_24], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 3Ch
		jg	short loc_153A1
		jmp	loc_15427

loc_153A1:
		mov	ax, [bp+var_4]
		shl	ax, 1
		cmp	ax, [bp+var_2]
		jl	short loc_15427
		mov	eax, dword_7C811
		neg	eax
		mov	[bp+var_B2], eax
		mov	eax, dword_7C815
		neg	eax
		mov	[bp+var_AE], eax
		mov	eax, dword_7C819
		neg	eax
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_BE]
		mov	dword_7C811, eax
		mov	eax, [bp+var_BA]
		mov	dword_7C815, eax
		mov	eax, [bp+var_B6]
		mov	dword_7C819, eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+44h]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	dword_7C819, eax

loc_15427:
		pop	di
		pop	si
		leave
		retf
sub_14FBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1542B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+47h], 1
		les	bx, es:[bx+0Dh]
		mov	byte ptr es:[bx+169h], 1
		mov	eax, dword_7C7C3
		mov	dword_7C811, eax
		mov	eax, dword_7C7C7
		mov	dword_7C815, eax
		mov	eax, dword_7C7CB
		mov	dword_7C819, eax
		cmp	dword_7C837, 0FAh
		jge	short loc_154AE
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		add	byte ptr es:[bx+3Eh], 14h
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		mov	al, es:[bx+3Eh]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		cmp	al, es:[bx+3]
		jbe	short loc_154AE
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		mov	es:[bx+3Eh], al
		jmp	short loc_154AE

loc_154AE:
		pop	bp
		retf
sub_1542B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_154B0		proc far

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
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 9Ah
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	si, es:[bx+33h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_5E], eax
		mov	eax, [si+4]
		mov	[bp+var_5A], eax
		mov	eax, [si+8]
		mov	[bp+var_56], eax
		mov	ax, es:[bx+44h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_56], eax
		mov	bx, es:[bx+33h]
		test	byte ptr [bx+2], 4
		jnz	short loc_15503
		jmp	loc_1560E

loc_15503:
		mov	eax, dword_7C7D9
		mov	[bp+var_26], eax
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		les	bx, es:[bx+0D6h]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		add	dx, 6Eh
		mov	[bp+var_28], ax
		mov	[bp+var_2A], dx
		les	bx, [bp+var_2A]
		mov	eax, es:[bx]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	edx, eax
		mov	ecx, [bp+var_2E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	[bp+var_22], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+33h]
		push	ss
		lea	ax, word ptr [bp+var_8E]
		push	ax
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_8E]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_8A]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_86]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		add	[bp+var_5E], eax
		mov	eax, [bp+var_96]
		add	[bp+var_5A], eax
		mov	eax, [bp+var_92]
		add	[bp+var_56], eax

loc_1560E:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [bp+var_5E]
		sub	eax, [si]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_5A]
		sub	eax, [si+4]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_56]
		sub	eax, [si+8]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_82]
		mov	dword_7C811, eax
		mov	eax, [bp+var_7E]
		mov	dword_7C815, eax
		mov	eax, [bp+var_7A]
		mov	dword_7C819, eax
		push	60E1h
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	di, ax
		push	large dword_7C819
		push	large dword_7C815
		push	large dword_7C811
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	si, word ptr [bp+var_10+1]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+33h]
		add	ax, 1Ah
		mov	[bp+var_12], ax
		mov	bx, es:[bx+0Ah]
		mov	eax, [bx+1Ah]
		mov	bx, [bp+var_12]
		sub	eax, [bx]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		cmp	di, 46h
		jge	short loc_15732
		cmp	si, 2BCh
		jg	short loc_156EB
		jmp	loc_157B6

loc_156EB:
		cmp	si, 5F5h
		jl	short loc_156F4
		jmp	loc_157B6

loc_156F4:
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B8h]
		cbw
		mov	dx, 14h
		sub	dx, ax
		cmp	dx, di
		jg	short loc_1570D
		jmp	loc_157B6

loc_1570D:
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0Ah
		mov	[bp+var_1E], 200h
		mov	eax, [bp+var_1E]
		mov	es:[bx+2Dh], eax
		jmp	loc_157B6

loc_15732:
		cmp	si, 9C4h
		jge	short loc_157B6
		mov	ax, word_7C81A
		mov	word ptr [bp+var_22+2], ax
		mov	eax, dword_7C811
		neg	eax
		mov	[bp+var_8E], eax
		mov	eax, dword_7C815
		neg	eax
		mov	[bp+var_8A], eax
		mov	eax, dword_7C819
		neg	eax
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	dword_7C811, eax
		mov	eax, [bp+var_96]
		mov	dword_7C815, eax
		mov	eax, [bp+var_92]
		mov	dword_7C819, eax
		mov	ax, word ptr [bp+var_22+2]
		mov	word ptr [bp+var_22], ax
		movsx	eax, word ptr [bp+var_22]
		shl	eax, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	dword_7C819, eax

loc_157B6:
		pop	di
		pop	si
		leave
		retf
sub_154B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_157BA		proc far

var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 24h
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+65h]
		mov	[bp+var_6], al
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+33h], 0
		jz	short loc_157F4
		push	word ptr es:[bx+33h]
		mov	bx, es:[bx+33h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		jmp	short loc_157F8

loc_157F4:
		xor	dx, dx
		xor	ax, ax

loc_157F8:
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_15808
		jmp	loc_159B9

loc_15808:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	ax, es:[bx+0D8h]
		mov	dx, es:[bx+0D6h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	large [bp+var_A]
		les	bx, word ptr [bp+var_A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jz	short loc_15847
		push	large [bp+var_A]
		les	bx, word ptr [bp+var_A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_1586B

loc_15847:
		push	1Fh
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1588D
		push	40h
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		jmp	short loc_1588D

loc_1586B:
		push	0FFB7h
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1588D
		push	40h
		push	large [bp+var_4]
		call	sub_3F219
		add	sp, 6

loc_1588D:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+18h], 0
		jnz	short loc_1589B
		jmp	loc_159AD

loc_1589B:
		push	large es:[bx+18h]
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_3F17A
		add	sp, 8
		or	ax, ax
		jnz	short loc_158B3
		jmp	loc_159AD

loc_158B3:
		les	bx, word ptr [bp+var_4]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_158D6
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_158D8

loc_158D6:
		mov	al, 1Ch

loc_158D8:
		mov	ah, 0
		mov	[bp+var_24], ax
		mov	cx, 4
		mov	bx, 222Bh

loc_158E3:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_24]
		jz	short loc_158F3
		add	bx, 2
		loop	short loc_158E3
		jmp	loc_15986

loc_158F3:
		jmp	word ptr cs:[bx+8]
		cmp	[bp+var_6], 0
		jnz	short loc_15919
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 3
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	es:[bx+2Dh], eax
		jmp	loc_159B9

loc_15919:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 2
		mov	[bp+var_12], 300h
		mov	eax, [bp+var_12]
		mov	es:[bx+2Dh], eax
		jmp	loc_159B9
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 5
		mov	[bp+var_16], 300h
		mov	eax, [bp+var_16]
		mov	es:[bx+2Dh], eax
		jmp	short loc_159B9
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0
		mov	[bp+var_1A], 200h
		mov	eax, [bp+var_1A]
		mov	es:[bx+2Dh], eax
		jmp	short loc_159B9
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 1
		mov	[bp+var_1E], 200h
		mov	eax, [bp+var_1E]
		mov	es:[bx+2Dh], eax
		jmp	short loc_159B9

loc_15986:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+32h], 9
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	es:[bx+2Dh], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_10381
		add	sp, 4
		jmp	short loc_159B9

loc_159AD:
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4

loc_159B9:
		leave
		retf
sub_157BA		endp

; START OF FUNCTION CHUNK FOR sub_157BA
		db 8
		add	[bx+di], cl
		add	[di], cl
; END OF FUNCTION CHUNK FOR sub_157BA
seg029		ends
