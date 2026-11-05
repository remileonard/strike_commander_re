seg111		segment	para public 'CODE' use16
		assume cs:seg111
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 72h, 1, 16h, 65h, 83h, 0C4h, 8, 0EBh, 2

loc_44EBA:
		db 0EBh, 0

loc_44EBC:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44EBF		proc far
		push	bp
		mov	bp, sp
		mov	al, 18h
		pop	bp
		retf
sub_44EBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44EC6		proc far

var_2		= word ptr -2
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_6]
		les	bx, es:[bx]
		mov	dx, es:[bx+59h]
		cmp	byte ptr [si+51h], 1
		jnz	short loc_44F05
		mov	ax, word_7CB07
		or	ax, ax
		jz	short loc_44EF3
		cmp	ax, 1
		jz	short loc_44EF7
		cmp	ax, 2
		jz	short loc_44EFC
		jmp	short loc_44EFF

loc_44EF3:
		sar	dx, 1
		jmp	short loc_44EFF

loc_44EF7:
		sar	dx, 2
		jmp	short loc_44EFF

loc_44EFC:
		sar	dx, 4

loc_44EFF:
		or	dx, dx
		jnz	short loc_44F0E
		jmp	short loc_44F0B

loc_44F05:
		sar	dx, 1
		or	dx, dx
		jnz	short loc_44F0E

loc_44F0B:
		mov	dx, 1

loc_44F0E:
		mov	al, [bp+arg_A]
		push	ax
		push	dx
		push	large [si+6Ah]
		call	sub_3A740
		add	sp, 8
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+19h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 11Eh
		push	ax
		call	SetReference16
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+94h]
		pop	cx
		or	al, al
		jz	short loc_44F48
		mov	al, 1
		jmp	short loc_44F4A

loc_44F48:
		mov	al, 0

loc_44F4A:
		pop	si
		leave
		retf
sub_44EC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44F4D		proc far

var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= byte ptr -74h
var_72		= word ptr -72h
var_70		= byte ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= dword ptr -52h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+7Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44F72
		push	si
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	sub_736E4
		add	sp, 6

loc_44F72:
		push	large [si+6Ah]
		call	sub_414D4
		add	sp, 4
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+94h]
		pop	cx
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_44FA9
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_RegisterMessage
		add	sp, 4
		jmp	short loc_44FB7

loc_44FA9:
		mov	word ptr [si+0F4h], 0
		mov	word ptr [si+0F2h], 0
		mov	al, 0FFh

loc_44FB7:
		mov	[bp+var_2], al
		xor	cx, cx
		cmp	[bp+var_2], 0FFh
		jz	short loc_44FCA
		les	bx, [si+0F2h]
		mov	cx, es:[bx+0Dh]

loc_44FCA:
		mov	al, [bp+var_2]
		cbw
		cmp	ax, 64h
		jnz	short loc_45029
		cmp	byte ptr [si+116h], 0
		jz	short loc_44FE0
		mov	[bp+var_70], 5
		jmp	short loc_45005

loc_44FE0:
		cmp	byte ptr [si+11Ah], 0
		jnz	short loc_44FED
		mov	[bp+var_70], 2
		jmp	short loc_45005

loc_44FED:
		cmp	byte ptr [si+11Ah], 1
		jnz	short loc_44FFA
		mov	[bp+var_70], 3
		jmp	short loc_45005

loc_44FFA:
		cmp	byte ptr [si+11Ah], 2
		jnz	short loc_45005
		mov	[bp+var_70], 4

loc_45005:
		mov	[bp+var_72], cx
		mov	al, [bp+var_70]
		mov	[bp+var_74], al
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_45029
		push	ax
		push	[bp+var_72]
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_45029

loc_45029:
		cmp	byte ptr [si+117h], 0
		jnz	short loc_4503A
		cmp	byte ptr [si+116h], 0
		jnz	short loc_4503A
		jmp	loc_4526F

loc_4503A:
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_80], eax
		mov	eax, [di+4]
		mov	[bp+var_7C], eax
		mov	eax, [di+8]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_A]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_80]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 4
		mov	byte ptr [si+58h], 0
		cmp	byte ptr [si+117h], 0
		jnz	short loc_450D9
		jmp	loc_451DD

loc_450D9:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 63h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		mov	eax, [si+10Ah]
		cmp	eax, [bp+var_12]
		jge	short loc_45103
		mov	ax, 1
		jmp	short loc_45105

loc_45103:
		xor	ax, ax

loc_45105:
		or	al, al
		jz	short loc_45154
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 67h
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		les	bx, [bp+var_16]
		mov	eax, es:[bx]
		mov	[bp+var_1A], eax
		mov	eax, dword_7976E
		imul	eax, eax, 0Ah
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	eax, [bp+var_1A]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		add	[si+10Ah], eax

loc_45154:
		mov	di, si
		add	di, 106h
		mov	eax, [di]
		or	eax, eax
		jge	short loc_45165
		neg	eax

loc_45165:
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		cmp	[bp+var_32], 0B400h
		jge	short loc_45180
		mov	ax, 1
		jmp	short loc_45182

loc_45180:
		xor	ax, ax

loc_45182:
		or	al, al
		jz	short loc_451D3
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 6Bh
		mov	[bp+var_34], ax
		mov	[bp+var_36], dx
		les	bx, [bp+var_36]
		mov	eax, es:[bx]
		mov	[bp+var_3A], eax
		mov	eax, dword_7976E
		imul	eax, eax, 0Ah
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3A]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		add	[si+106h], eax
		jmp	short loc_451DD

loc_451D3:
		mov	byte ptr [si+118h], 1
		mov	al, 1
		jmp	loc_4535C

loc_451DD:
		cmp	byte ptr [si+116h], 0
		jnz	short loc_451E7
		jmp	loc_45340

loc_451E7:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 6Fh
		mov	[bp+var_4C], ax
		mov	[bp+var_4E], dx
		les	bx, [bp+var_4E]
		mov	eax, es:[bx]
		mov	[bp+var_52], eax
		mov	eax, [si+10Ah]
		cmp	eax, [bp+var_52]
		jge	short loc_45211
		mov	ax, 1
		jmp	short loc_45213

loc_45211:
		xor	ax, ax

loc_45213:
		or	al, al
		jz	short loc_45265
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 73h
		mov	[bp+var_54], ax
		mov	[bp+var_56], dx
		les	bx, [bp+var_56]
		mov	eax, es:[bx]
		mov	[bp+var_5A], eax
		mov	eax, dword_7976E
		imul	eax, eax, 28h
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		mov	eax, [bp+var_5A]
		mov	edx, [bp+var_62]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		add	[si+10Ah], eax
		jmp	loc_45340

loc_45265:
		mov	byte ptr [si+118h], 1
		mov	al, 0
		jmp	loc_4535C

loc_4526F:
		les	bx, [si+6Ah]
		cmp	byte ptr es:[bx+5Bh], 0
		jz	short loc_4527E
		mov	ax, 1
		jmp	short loc_45280

loc_4527E:
		xor	ax, ax

loc_45280:
		or	al, al
		jz	short loc_45296
		les	bx, [si+6Ah]
		mov	al, es:[bx+5Bh]
		cmp	al, es:[bx+20h]
		jb	short loc_45296
		mov	ax, 1
		jmp	short loc_45298

loc_45296:
		xor	ax, ax

loc_45298:
		mov	ah, 0
		or	ax, ax
		jz	short loc_452A1
		jmp	loc_45340

loc_452A1:
		push	si
		nop
		push	cs
		call	near ptr sub_45C1A
		pop	cx
		or	al, al
		jz	short loc_45313
		cmp	word ptr [si+11Ch], 0
		jz	short loc_452EE
		push	word ptr [si+11Ch]
		push	si
		nop
		push	cs
		call	near ptr sub_45D43
		add	sp, 4
		or	al, al
		jz	short loc_452D0
		push	word ptr [si+11Ch]
		push	si
		nop
		push	cs
		call	near ptr sub_45B68
		jmp	short loc_45334

loc_452D0:
		push	word ptr [si+11Ch]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryEWrapper_45EED
		add	sp, 4
		mov	[bp+var_6C], ax
		push	ax
		mov	ax, si
		add	ax, 11Ch
		push	ax
		call	SetReference16
		jmp	short loc_45334

loc_452EE:
		push	0
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryEWrapper_45EED
		add	sp, 4
		mov	[bp+var_6E], ax
		push	ax
		mov	ax, si
		add	ax, 11Ch
		push	ax
		call	SetReference16
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_45E83
		jmp	short loc_4533F

loc_45313:
		cmp	byte ptr [si+11Bh], 0
		jnz	short loc_45340
		cmp	word ptr [si+5Ah], 0A5h
		jnz	short loc_45339
		push	si
		call	GroundObj_AccelerateToCruise_43156
		pop	cx
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	si
		call	sub_42EF9

loc_45334:
		add	sp, 4
		jmp	short loc_45340

loc_45339:
		push	si
		call	GroundObj_Decelerate_43278

loc_4533F:
		pop	cx

loc_45340:
		cmp	byte ptr [si+118h], 0
		jz	short loc_4534D
		mov	byte ptr [si+58h], 0
		jmp	short loc_45355

loc_4534D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+90h]
		pop	cx

loc_45355:
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx

loc_4535C:
		pop	di
		pop	si
		leave
		retf
sub_44F4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45360		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 18h
		pop	bp
		retf
sub_45360		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4536A		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 1
		mov	ax, [bp+arg_2]
		mov	[si+5Ah], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	SetReference16
		add	sp, 4
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[si+5Eh], eax
		mov	eax, [di+4]
		mov	[si+62h], eax
		mov	eax, [di+8]
		mov	[si+66h], eax
		cmp	word ptr [si+5Ah], 0A5h
		jnz	short loc_4542B
		mov	di, si
		add	di, 12h
		mov	ax, si
		add	ax, 16h
		mov	[bp+var_E], ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 5Eh
		mov	ax, si
		add	ax, 62h
		mov	[bp+var_18], ax
		mov	eax, [di]
		mov	[bp+var_16], eax
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_Distance2D_58192
		add	sp, 8
		cmp	[bp+var_1C], 6400h
		jge	short loc_45416
		mov	ax, 1
		jmp	short loc_45418

loc_45416:
		xor	ax, ax

loc_45418:
		or	al, al
		jz	short loc_45426
		mov	word ptr [si+5Ah], 0
		mov	[bp+var_2], 0

loc_45426:
		mov	byte ptr [si+11Bh], 0

loc_4542B:
		cmp	word ptr [si+5Ah], 0ABh
		jnz	short loc_45478
		mov	al, [si+7Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4544B
		push	si
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	sub_736E4
		add	sp, 6

loc_4544B:
		mov	al, [bp+arg_8]
		mov	byte ptr [bp+var_8+2], al
		mov	ax, [bp+arg_4]
		mov	word ptr [bp+var_8], ax
		mov	al, byte ptr [bp+var_8+2]
		mov	byte ptr [bp+var_C+2], al
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_45478
		push	ax
		push	word ptr [bp+var_8]
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_45478

loc_45478:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_4536A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4547F		proc far

var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
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
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
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
		sub	sp, 84h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, word ptr [bp+var_54]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+48h]
		add	sp, 6
		push	large [bp+var_4C]
		push	large [bp+var_50]
		push	large [bp+var_54]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		push	0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_60], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_5C], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_58], eax
		lea	ax, word ptr [bp+var_60]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4550F
		mov	[bp+var_4], 0

loc_4550F:
		cmp	[bp+var_4], 0
		jg	short loc_45519
		jmp	loc_45626

loc_45519:
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_36], ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	si
		call	WorldObject_TranslateBy_36A6C
		add	sp, 8
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_38], ax
		mov	di, [bp+var_38]
		mov	dx, [bp+var_36]
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_78], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_74], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_64], eax
		push	1
		lea	ax, word ptr [bp+var_48]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_3C]
		mov	[si+1Ah], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_7C], eax
		lea	ax, word ptr [bp+var_84]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_84]
		mov	[si+39h], eax
		mov	eax, [bp+var_80]
		mov	[si+3Dh], eax
		mov	eax, [bp+var_7C]
		mov	[si+41h], eax
		mov	ax, si
		add	ax, 39h
		mov	eax, [bp+var_48]
		mov	[si+45h], eax
		mov	eax, [bp+var_44]
		mov	[si+49h], eax
		mov	eax, [bp+var_40]
		mov	[si+4Dh], eax
		mov	ax, si
		add	ax, 45h
		cmp	si, word_7CD76
		jnz	short loc_45626
		mov	bx, word_7CADA
		mov	eax, [bp+var_6C]
		add	[bx+12h], eax
		mov	eax, [bp+var_68]
		add	[bx+16h], eax
		mov	eax, [bp+var_64]
		add	[bx+1Ah], eax

loc_45626:
		push	1
		lea	ax, word ptr [bp+var_48]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_18]
		mov	[si+1Ah], eax
		mov	di, si
		add	di, 10Ah
		mov	eax, [di]
		sub	[si+1Ah], eax
		mov	ax, si
		add	ax, 112h
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildAxisY_58E8E
		add	sp, 4
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[si+112h], eax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_ApplyToVectorZ_594AE
		pop	cx
		cmp	byte ptr [si+116h], 0
		jz	short loc_4570B
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 77h
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_24], eax
		mov	eax, [si+10Eh]
		cmp	eax, [bp+var_24]
		jge	short loc_456BA
		mov	ax, 1
		jmp	short loc_456BC

loc_456BA:
		xor	ax, ax

loc_456BC:
		or	al, al
		jz	short loc_4570B
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 7Bh
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_2C], eax
		add	[si+10Eh], eax
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 7Bh
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		les	bx, [bp+var_30]
		mov	eax, es:[bx]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_34]
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4

loc_4570B:
		pop	di
		pop	si
		leave
		retf
sub_4547F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4570F		proc far

var_F2		= dword ptr -0F2h
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
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
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+58h], 0
		jnz	short loc_45724
		jmp	loc_45B64

loc_45724:
		mov	al, [si+116h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_45731
		jmp	loc_45B64

loc_45731:
		cmp	word_79797, 0
		jnz	short loc_4573B
		jmp	loc_45B64

loc_4573B:
		movzx	eax, word_7977C
		cmp	eax, [si+54h]
		jge	short loc_4574A
		jmp	loc_45B64

loc_4574A:
		les	bx, [si+0Eh]
		mov	ax, word_7977C
		add	ax, es:[bx+61h]
		movzx	eax, ax
		mov	[si+54h], eax
		cmp	word ptr [si+52h], 0
		jz	short loc_457DD
		mov	di, [si+52h]
		add	di, 2
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_50], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_58]
		jmp	short loc_457FA

loc_457DD:
		mov	eax, dword_79CEC
		mov	[bp+var_58], eax
		mov	eax, dword_79CF0
		mov	[bp+var_54], eax
		mov	eax, dword_79CF4
		mov	[bp+var_50], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_58]

loc_457FA:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 4Dh
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	di, [bp+var_1C]
		mov	eax, es:[di]
		mov	[bp+var_64], eax
		mov	eax, es:[di+4]
		mov	[bp+var_60], eax
		mov	eax, es:[di+8]
		mov	[bp+var_5C], eax
		cmp	[bp+var_64], 0
		jnz	short loc_45832
		mov	ax, 1
		jmp	short loc_45834

loc_45832:
		xor	ax, ax

loc_45834:
		or	al, al
		jnz	short loc_4583B
		jmp	loc_4597F

loc_4583B:
		cmp	[bp+var_5C], 0
		jnz	short loc_45847
		mov	ax, 1
		jmp	short loc_45849

loc_45847:
		xor	ax, ax

loc_45849:
		or	al, al
		jnz	short loc_45850
		jmp	loc_4597F

loc_45850:
		mov	di, si
		add	di, 39h
		mov	eax, [di]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_68], eax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_70]
		mov	[bp+var_7C], eax
		mov	eax, [di+4]
		add	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [di+8]
		add	eax, [bp+var_68]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_58]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_48]
		add	eax, [bp+var_54]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_50]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_38], eax
		jmp	loc_45B3C

loc_4597F:
		mov	ax, si
		add	ax, 2Dh
		mov	word ptr [bp+var_20+2], ax
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		cmp	word ptr [si+52h], 0
		jz	short loc_459B7
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_94]
		push	ax
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, ss
		lea	ax, word ptr [bp+var_94]
		jmp	short loc_459D8

loc_459B7:
		mov	eax, dword_79CEC
		mov	[bp+var_94], eax
		mov	eax, dword_79CF0
		mov	[bp+var_90], eax
		mov	eax, dword_79CF4
		mov	[bp+var_8C], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_94]

loc_459D8:
		lea	ax, word ptr [bp+var_94]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4
		mov	eax, [bp+var_64]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_98], eax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_64]
		mov	[bp+var_AC], eax
		mov	eax, [di+4]
		add	eax, [bp+var_60]
		mov	[bp+var_A8], eax
		mov	eax, [di+8]
		add	eax, [bp+var_5C]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_A0]
		mov	[bp+var_C4], eax
		mov	eax, [di+4]
		add	eax, [bp+var_9C]
		mov	[bp+var_C0], eax
		mov	eax, [di+8]
		add	eax, [bp+var_98]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_D0]
		add	eax, [bp+var_58]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_CC]
		add	eax, [bp+var_54]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_C8]
		add	eax, [bp+var_50]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_38], eax

loc_45B3C:
		push	0
		sub	sp, 4
		mov	eax, dword_7976E
		mov	[bp+var_F2], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	al, [si+59h]
		mov	ah, 0
		push	ax
		push	word_79797
		call	sub_4D6FB
		add	sp, 0Eh

loc_45B64:
		pop	di
		pop	si
		leave
		retf
sub_4570F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45B68		proc far

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
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	eax, [di+4]
		mov	[bp+var_20], eax
		mov	eax, [di+8]
		mov	[bp+var_1C], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_30]
		imul	eax, eax, 64h
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_2C]
		imul	eax, eax, 64h
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_28]
		imul	eax, eax, 64h
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		sub	[bp+var_24], eax
		mov	eax, [bp+var_38]
		sub	[bp+var_20], eax
		mov	eax, [bp+var_34]
		sub	[bp+var_1C], eax
		push	si
		call	GroundObj_AccelerateToCruise_43156
		pop	cx
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	si
		call	sub_42EF9
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_45B68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45C1A		proc far

var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_6], ax
		cmp	byte ptr [si+51h], 0FFh
		jnz	short loc_45C3F
		mov	[bp+var_4], 1
		jmp	loc_45D22

loc_45C3F:
		mov	[bp+var_4], 0FFh
		jmp	loc_45D22

loc_45C46:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jnz	short loc_45C58
		jmp	loc_45D22

loc_45C58:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_45C6B
		jmp	loc_45D22

loc_45C6B:
		mov	bx, [bp+var_2]
		mov	al, [bx+51h]
		cmp	al, [bp+var_4]
		jz	short loc_45C79
		jmp	loc_45D22

loc_45C79:
		mov	di, [bp+var_2]
		add	di, 12h
		mov	ax, [bp+var_6]
		mov	[bp+var_10], ax
		mov	eax, [di]
		mov	bx, [bp+var_10]
		sub	eax, [bx]
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	[bp+var_E], eax
		mov	ax, [bp+var_6]
		add	ax, 4
		mov	[bp+var_1A], ax
		mov	eax, [di+4]
		mov	bx, [bp+var_1A]
		sub	eax, [bx]
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	[bp+var_A], eax
		push	large 0
		push	eax
		push	large [bp+var_E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		cmp	[bp+var_2A], 271000h
		jg	short loc_45CE5
		mov	ax, 1
		jmp	short loc_45CE7

loc_45CE5:
		xor	ax, ax

loc_45CE7:
		or	al, al
		jz	short loc_45D22
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 0C8h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_45D19
		mov	al, [si+120h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[si+120h], al

loc_45D19:
		mov	byte ptr [si+11Bh], 2
		mov	al, 1
		jmp	short loc_45D3F

loc_45D22:
		lea	ax, [bp+var_2]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_45D38
		jmp	loc_45C46

loc_45D38:
		mov	byte ptr [si+11Bh], 0
		mov	al, 0

loc_45D3F:
		pop	di
		pop	si
		leave
		retf
sub_45C1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45D43		proc far

var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 44h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_4], ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_6], ax
		push	si
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+48h]
		add	sp, 6
		lea	ax, [bp+var_2C]
		mov	[bp+var_8], ax
		or	di, di
		jnz	short loc_45D8D
		jmp	loc_45E7D

loc_45D8D:
		mov	di, [bp+var_2]
		mov	dx, [bp+var_4]
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_34], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_C], eax
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	di, [bp+var_8]
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [di+4]
		mov	[bp+var_1C], eax
		mov	eax, [di+8]
		mov	[bp+var_18], eax
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		cmp	[bp+var_10], 0
		jle	short loc_45E2B
		mov	ax, 1
		jmp	short loc_45E2D

loc_45E2B:
		xor	ax, ax

loc_45E2D:
		or	al, al
		jz	short loc_45E79
		cmp	[bp+var_14], 0
		jle	short loc_45E3D
		mov	ax, 1
		jmp	short loc_45E3F

loc_45E3D:
		xor	ax, ax

loc_45E3F:
		or	al, al
		jz	short loc_45E5E
		cmp	[bp+var_20], 0
		jge	short loc_45E4F
		mov	ax, 1
		jmp	short loc_45E51

loc_45E4F:
		xor	ax, ax

loc_45E51:
		or	al, al
		jz	short loc_45E7D
		mov	byte ptr [si+11Bh], 1
		mov	al, 1
		jmp	short loc_45E7F

loc_45E5E:
		cmp	[bp+var_20], 0
		jl	short loc_45E6A
		mov	ax, 1
		jmp	short loc_45E6C

loc_45E6A:
		xor	ax, ax

loc_45E6C:
		or	al, al
		jz	short loc_45E7D
		mov	byte ptr [si+11Bh], 1
		mov	al, 1
		jmp	short loc_45E7F

loc_45E79:
		mov	al, 0
		jmp	short loc_45E7F

loc_45E7D:
		mov	al, 0

loc_45E7F:
		pop	di
		pop	si
		leave
		retf
sub_45D43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45E83		proc far

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
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0A00h
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	byte ptr [si+120h], 0
		jz	short loc_45EC6
		mov	[bp+var_C], 0FFFFF600h
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		jmp	short loc_45ED6

loc_45EC6:
		mov	[bp+var_10], 0A00h
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax

loc_45ED6:
		push	si
		call	GroundObj_AccelerateToCruise_43156
		pop	cx
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	si
		call	sub_42F85
		add	sp, 4
		pop	si
		leave
		retf
sub_45E83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75
; (sub_A4A75 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle AircraftDynamics_ReadMassChunk_A4A20 (lecteur du chunk DYNM/masse).
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryEWrapper_45EED		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	1Ah
		push	67ADh
		call	sub_1E73C
		add	sp, 6
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryEWrapper_45EED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45F05		proc far

var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_12		= byte ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		push	ds
		push	offset unk_791EC
		mov	cx, 7
		call	CRT_Fmemcpy
		cmp	word ptr [si+11Eh], 0
		jz	short loc_45F42
		push	word ptr [si+11Eh]
		mov	bx, [si+11Eh]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_4], ax

loc_45F42:
		xor	di, di
		jmp	loc_46073

loc_45F47:
		mov	al, byte ptr [bp+di+var_E]
		mov	[bp+var_10], al
		mov	[bp+var_12], al
		mov	ah, 0
		les	bx, [si+6Ah]
		add	bx, ax
		cmp	byte ptr es:[bx+3Bh], 0
		jz	short loc_45F63
		mov	ax, 1
		jmp	short loc_45F65

loc_45F63:
		xor	ax, ax

loc_45F65:
		or	al, al
		jz	short loc_45F8B
		mov	al, [bp+var_10]
		mov	ah, 0
		les	bx, [si+6Ah]
		add	bx, ax
		mov	al, es:[bx+3Bh]
		mov	dl, [bp+var_10]
		mov	dh, 0
		mov	bx, [si+6Ah]
		add	bx, dx
		cmp	al, es:[bx]
		jb	short loc_45F8B
		mov	ax, 1
		jmp	short loc_45F8D

loc_45F8B:
		xor	ax, ax

loc_45F8D:
		or	al, al
		jnz	short loc_45F94
		jmp	loc_46072

loc_45F94:
		mov	al, byte ptr [bp+di+var_E]
		mov	ah, 0
		les	bx, [si+6Ah]
		add	bx, ax
		mov	al, es:[bx+0B1h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_45FAC
		jmp	loc_46072

loc_45FAC:
		inc	byte ptr [si+11Ah]
		mov	al, byte ptr [bp+di+var_E]
		mov	[bp+var_14], al
		mov	ah, 0
		mov	bx, [si+6Ah]
		add	bx, ax
		mov	byte ptr es:[bx+0B1h], 1
		or	di, di
		jnz	short loc_45FCA
		jmp	loc_46061

loc_45FCA:
		cmp	di, 4
		jge	short loc_46007
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 7Fh
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[si+112h], eax
		mov	ax, si
		add	ax, 112h
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		add	[si+106h], eax
		jmp	short loc_4603D

loc_46007:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 7Fh
		mov	[bp+var_20], ax
		mov	[bp+var_22], dx
		les	bx, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[si+112h], eax
		mov	ax, si
		add	ax, 112h
		mov	[bp+var_28], ax
		mov	bx, [bp+var_28]
		mov	eax, [bx]
		sub	[si+106h], eax

loc_4603D:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 83h
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	bx, [bp+var_2C]
		mov	eax, es:[bx]
		mov	[bp+var_30], eax
		add	[si+10Ah], eax
		mov	[bp+var_1], 1

loc_46061:
		mov	al, byte ptr [bp+di+var_E]
		mov	ah, 0
		les	bx, [si+6Ah]
		add	bx, ax
		mov	al, es:[bx+76h]
		mov	[bp+var_6], al

loc_46072:
		inc	di

loc_46073:
		cmp	di, 7
		jge	short loc_4607B
		jmp	loc_45F47

loc_4607B:
		cmp	[bp+var_1], 0
		jz	short loc_46093
		mov	al, [bp+var_6]
		push	ax
		push	si
		call	sub_74968
		add	sp, 4
		mov	byte ptr [si+119h], 1

loc_46093:
		mov	al, [si+116h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_460A0
		jmp	loc_4613D

loc_460A0:
		les	bx, [si+0Eh]
		mov	ax, es:[bx+5Dh]
		mov	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		cmp	eax, [si+10Ah]
		jg	short loc_460BF
		mov	ax, 1
		jmp	short loc_460C1

loc_460BF:
		xor	ax, ax

loc_460C1:
		or	al, al
		jz	short loc_4613D
		mov	byte ptr [si+116h], 1
		push	large [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_46107
		cmp	byte ptr [si+51h], 0FFh
		jnz	short loc_46107
		mov	byte_7CE06, 1
		mov	ax, word_7CADA
		cmp	ax, [bp+var_4]
		jnz	short loc_46107
		push	890h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_46107
		push	87Ch
		call	GameVar_SetFlag_5646D
		pop	cx

loc_46107:
		push	word ptr [si+11Eh]
		push	si
		call	sub_553B6
		add	sp, 4
		mov	ax, word_7CADA
		mov	[bp+var_34], ax
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_46134
		push	5
		push	ax
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_46134

loc_46134:
		mov	byte ptr [si+119h], 1
		mov	al, 0
		jmp	short loc_4618E

loc_4613D:
		mov	di, si
		add	di, 106h
		mov	eax, [di]
		or	eax, eax
		jge	short loc_4614E
		neg	eax

loc_4614E:
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+5Fh]
		mov	[bp+var_3E], ax
		movsx	eax, [bp+var_3E]
		shl	eax, 8
		cmp	eax, [bp+var_3C]
		jg	short loc_46178
		mov	ax, 1
		jmp	short loc_4617A

loc_46178:
		xor	ax, ax

loc_4617A:
		or	al, al
		jz	short loc_4618C
		mov	byte ptr [si+117h], 1
		mov	byte ptr [si+119h], 1
		mov	al, 0
		jmp	short loc_4618E

loc_4618C:
		mov	al, 0

loc_4618E:
		pop	di
		pop	si
sub_45F05		endp
seg111		ends
