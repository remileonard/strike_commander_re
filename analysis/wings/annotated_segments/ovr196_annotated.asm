ovr196		segment	para public 'OVERLAY' use16
		assume cs:ovr196
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FB90		proc far

var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B2		= word ptr -0B2h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= word ptr -72h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_66		= word ptr -66h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0CCh
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_6], 0
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_8], al
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_1], al
		cbw
		cmp	ax, 42h
		jnz	short loc_6FBC4
		jmp	loc_6FD32

loc_6FBC4:
		cmp	ax, 4Ch
		jnz	short loc_6FBCC
		jmp	loc_6FF73

loc_6FBCC:
		cmp	ax, 53h
		jz	short loc_6FBD4
		jmp	loc_7001A

loc_6FBD4:
		mov	[bp+var_16], si
		push	[bp+var_16]
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_1F05F
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		mov	[bp+var_22], si
		push	[bp+var_22]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_26], eax
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_CC], eax
		sar	eax, 8
		mov	[bp+var_CC], eax
		mov	[bp+var_2C], si
		push	[bp+var_2C]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_30], eax
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_C8], eax
		sar	eax, 8
		mov	[bp+var_C8], eax
		mov	[bp+var_36], si
		push	[bp+var_36]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3A], eax
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_C4], eax
		sar	eax, 8
		mov	[bp+var_C4], eax
		mov	[bp+var_40], si
		push	[bp+var_40]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_44], eax
		shl	eax, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_14], eax
		sar	eax, 8
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	large 1Fh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_4A], dx
		mov	[bp+var_4C], ax
		or	ax, dx
		jz	short loc_6FD16
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx], 248Ch
		xor	eax, eax
		mov	es:[bx+0Ah], eax
		mov	es:[bx+6], eax
		mov	es:[bx+0Eh], al
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 24A0h
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_CC]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	dx
		push	bx
		call	sub_26658
		add	sp, 0Ch
		mov	dx, [bp+var_4A]
		mov	ax, [bp+var_4C]
		jmp	short loc_6FD1C

loc_6FD16:
		mov	dx, [bp+var_4A]
		mov	ax, [bp+var_4C]

loc_6FD1C:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_6FD2C
		jmp	loc_70023

loc_6FD2C:
		push	0C006h
		jmp	loc_7001D

loc_6FD32:
		mov	[bp+var_66], si
		push	[bp+var_66]
		lea	ax, word ptr [bp+var_70]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	eax, [bp+var_70]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		mov	[bp+var_72], si
		push	[bp+var_72]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_76], eax
		shl	eax, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_50], eax
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	[bp+var_7C], si
		push	[bp+var_7C]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_80], eax
		shl	eax, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_54], eax
		sar	eax, 8
		mov	[bp+var_54], eax
		mov	[bp+var_86], si
		push	[bp+var_86]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8A], eax
		shl	eax, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_58], eax
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	[bp+var_90], si
		push	[bp+var_90]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_94], eax
		shl	eax, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_5C], eax
		sar	eax, 8
		mov	[bp+var_5C], eax
		mov	[bp+var_9A], si
		push	[bp+var_9A]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_9E], eax
		shl	eax, 8
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_60], eax
		sar	eax, 8
		mov	[bp+var_60], eax
		mov	[bp+var_A4], si
		push	[bp+var_A4]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_A8], eax
		shl	eax, 8
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_64], eax
		sar	eax, 8
		mov	[bp+var_64], eax
		push	1
		push	0
		push	2
		push	large 37h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_B0+2], dx
		mov	word ptr [bp+var_B0], ax
		or	ax, dx
		jnz	short loc_6FE99
		jmp	loc_6FF55

loc_6FE99:
		les	bx, word ptr [bp+var_B0]
		mov	word ptr es:[bx], 248Ch
		xor	eax, eax
		mov	es:[bx+0Ah], eax
		mov	es:[bx+6], eax
		mov	es:[bx+0Eh], al
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 2478h
		push	seg stub196
		push	offset sub_58E30
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 1Fh
		push	dx
		push	ax
		call	sub_3846
		add	sp, 10h
		push	seg stub196
		push	offset sub_58E30
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 27h
		push	word ptr [bp+var_B0+2]
		push	ax
		call	sub_3846
		add	sp, 10h
		push	seg stub196
		push	offset sub_58E30
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 2Fh
		push	word ptr [bp+var_B0+2]
		push	ax
		call	sub_3846
		add	sp, 10h
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	large [bp+var_B0]
		nop
		push	cs
		call	near ptr sub_7002C
		add	sp, 14h
		mov	dx, word ptr [bp+var_B0+2]
		mov	ax, word ptr [bp+var_B0]
		jmp	short loc_6FF5D

loc_6FF55:
		mov	dx, word ptr [bp+var_B0+2]
		mov	ax, word ptr [bp+var_B0]

loc_6FF5D:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_6FF6D
		jmp	loc_70023

loc_6FF6D:
		push	0C007h
		jmp	loc_7001D

loc_6FF73:
		mov	[bp+var_B2], si
		push	[bp+var_B2]
		push	ss
		lea	ax, word ptr [bp+var_BC]
		push	ax
		call	sub_1F05F
		add	sp, 6
		mov	eax, [bp+var_BC]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	0
		push	2
		push	large 2Bh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_BE], dx
		mov	[bp+var_C0], ax
		or	ax, dx
		jz	short loc_70000
		les	bx, [bp+var_C0]
		mov	word ptr es:[bx], 248Ch
		xor	eax, eax
		mov	es:[bx+0Ah], eax
		mov	es:[bx+6], eax
		mov	es:[bx+0Eh], al
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 2464h
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	dx
		push	bx
		call	sub_2698B
		add	sp, 8
		mov	dx, [bp+var_BE]
		mov	ax, [bp+var_C0]
		jmp	short loc_70008

loc_70000:
		mov	dx, [bp+var_BE]
		mov	ax, [bp+var_C0]

loc_70008:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_70023
		push	0C023h
		jmp	short loc_7001D

loc_7001A:
		push	0C008h

loc_7001D:
		call	sub_9D47
		pop	cx

loc_70023:
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf
sub_6FB90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7002C		proc far

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
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= dword ptr -60h
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		cmp	eax, [si]
		jle	short loc_70048
		mov	ax, 1
		jmp	short loc_7004A

loc_70048:
		xor	ax, ax

loc_7004A:
		or	al, al
		jz	short loc_7006E
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		jmp	short loc_7008E

loc_7006E:
		mov	eax, [si]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	si, di
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]

loc_7008E:
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		mov	bx, [bp+arg_A]
		mov	eax, [bx]
		mov	bx, [bp+arg_8]
		cmp	eax, [bx]
		jle	short loc_700A9
		mov	ax, 1
		jmp	short loc_700AB

loc_700A9:
		xor	ax, ax

loc_700AB:
		or	al, al
		jz	short loc_700D5
		mov	si, [bp+arg_A]
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	si, [bp+arg_8]
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		jmp	short loc_700F9

loc_700D5:
		mov	si, [bp+arg_8]
		mov	eax, [si]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	si, [bp+arg_A]
		mov	eax, [si]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]

loc_700F9:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	bx, [bp+arg_C]
		cmp	eax, [bx]
		jle	short loc_70114
		mov	ax, 1
		jmp	short loc_70116

loc_70114:
		xor	ax, ax

loc_70116:
		or	al, al
		jz	short loc_70140
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	si, [bp+arg_C]
		mov	eax, [si]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		jmp	short loc_70164

loc_70140:
		mov	si, [bp+arg_C]
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]

loc_70164:
		les	bx, [bp+arg_0]
		mov	es:[bx+33h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 23h
		mov	[bp+var_4A], ax
		mov	[bp+var_4C], dx
		les	bx, [bp+var_4C]
		mov	eax, es:[bx]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_34], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Fh
		mov	[bp+var_52], ax
		mov	[bp+var_54], dx
		les	bx, [bp+var_54]
		mov	eax, es:[bx]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_38], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 27h
		mov	[bp+var_5A], ax
		mov	[bp+var_5C], dx
		les	bx, [bp+var_5C]
		mov	eax, es:[bx]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_3C], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Bh
		mov	[bp+var_62], ax
		mov	[bp+var_64], dx
		les	bx, [bp+var_64]
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_40], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Fh
		mov	[bp+var_6A], ax
		mov	[bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_44], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 33h
		mov	[bp+var_72], ax
		mov	[bp+var_74], dx
		les	bx, [bp+var_74]
		mov	eax, es:[bx]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		sub	eax, [bp+var_34]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_3C]
		sub	eax, [bp+var_40]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_44]
		sub	eax, [bp+var_48]
		mov	[bp+var_90], eax
		mov	[bp+var_7C], 200h
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_90], eax
		mov	eax, [bp+var_34]
		add	eax, [bp+var_38]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_3C]
		add	eax, [bp+var_40]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_48]
		mov	[bp+var_9C], eax
		mov	[bp+var_80], 200h
		mov	eax, [bp+var_A4]
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A0]
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_9C], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_A4]
		mov	es:[bx+13h], eax
		mov	eax, [bp+var_A0]
		mov	es:[bx+17h], eax
		mov	eax, [bp+var_9C]
		mov	es:[bx+1Bh], eax
		lea	ax, word ptr [bp+var_98]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_84]
		push	ax
		call	Math_VectorLength3D_Scaled_396F9
		add	sp, 6
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	eax, [bp+arg_10]
		mov	[bp+var_8C], eax
		push	8
		push	large [bp+var_8C]
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		pop	di
		pop	si
		leave
		retf
sub_7002C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_AllocateExtended_ABD24 (sub_ABD24 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_AllocateExtended_9C7BA (sub_9C7BA de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
Debris_AllocateExtended_703B7		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_703D4
		push	large 4
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_703D4:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
Debris_AllocateExtended_703B7		endp
ovr196		ends
