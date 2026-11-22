ovr219		segment	para public 'OVERLAY' use16
		assume cs:ovr219
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7EA0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], seg seg183
		mov	[bp+var_4], 0
		xor	dx, dx
		jmp	short loc_B7EDF

loc_B7EB4:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		les	bx, [bp+var_4]
		cmp	eax, es:[bx]
		jnz	short loc_B7EDA
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		les	bx, [bp+var_4]
		cmp	eax, es:[bx+4]
		jnz	short loc_B7EDA
		mov	al, dl
		leave
		retf

loc_B7EDA:
		inc	dx
		add	[bp+var_4], 8

loc_B7EDF:
		cmp	dx, 7
		jl	short loc_B7EB4
		mov	al, 0
		leave
		retf
sub_B7EA0		endp

; START OF FUNCTION CHUNK FOR sub_B7EA0
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7EA0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7EEA		proc far

var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= byte ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= byte ptr -9Ah
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
var_68		= word ptr -68h
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= byte ptr -40h
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
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_10		= word ptr -10h
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_49DEF, cl
		mov	[bp+var_6], 0
		lea	ax, [bp+var_10]
		push	ax
		call	sub_1109C
		add	sp, 2
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1], al
		push	si
		lea	ax, [bp+var_10]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	ds
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_B7EA0
		add	sp, 4
		mov	[bp+var_12], al
		mov	al, [bp+var_1]
		cbw
		cmp	ax, 42h
		jnz	short loc_B7F4D
		jmp	loc_B80C4

loc_B7F4D:
		cmp	ax, 4Ch
		jnz	short loc_B7F55
		jmp	loc_B8328

loc_B7F55:
		cmp	ax, 53h
		jz	short loc_B7F5D
		jmp	loc_B839D

loc_B7F5D:
		mov	[bp+var_18], si
		push	[bp+var_18]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		sar	eax, 8
		mov	[bp+var_B0], eax
		mov	[bp+var_22], si
		push	[bp+var_22]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_AC]
		sar	eax, 8
		mov	[bp+var_AC], eax
		mov	[bp+var_2C], si
		push	[bp+var_2C]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		sar	eax, 8
		mov	[bp+var_A8], eax
		mov	[bp+var_36], si
		push	[bp+var_36]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		sar	eax, 8
		mov	[bp+var_16], eax
		mov	al, [bp+var_12]
		mov	[bp+var_40], al
		push	1
		push	0
		push	2
		push	large 17h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_42], dx
		mov	[bp+var_44], ax
		or	ax, dx
		jz	short loc_B80B5
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 3602h
		les	bx, [bp+var_44]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 3616h
		mov	al, [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	[bp+var_42]
		push	[bp+var_44]
		call	sub_197DE
		add	sp, 0Ah
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]
		jmp	short loc_B80BB

loc_B80B5:
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]

loc_B80BB:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	loc_B83AA

loc_B80C4:
		mov	[bp+var_5E], si
		push	[bp+var_5E]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		shl	eax, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		sar	eax, 8
		mov	[bp+var_48], eax
		mov	[bp+var_68], si
		push	[bp+var_68]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		shl	eax, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		sar	eax, 8
		mov	[bp+var_4C], eax
		mov	[bp+var_72], si
		push	[bp+var_72]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		shl	eax, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	[bp+var_7C], si
		push	[bp+var_7C]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		shl	eax, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		sar	eax, 8
		mov	[bp+var_54], eax
		mov	[bp+var_86], si
		push	[bp+var_86]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		shl	eax, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	[bp+var_90], si
		push	[bp+var_90]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		shl	eax, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		sar	eax, 8
		mov	[bp+var_5C], eax
		mov	al, [bp+var_12]
		mov	[bp+var_9A], al
		push	1
		push	0
		push	2
		push	large 2Fh
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_9C], dx
		mov	[bp+var_9E], ax
		or	ax, dx
		jnz	short loc_B825E
		jmp	loc_B8317

loc_B825E:
		les	bx, [bp+var_9E]
		mov	word ptr es:[bx], 3602h
		les	bx, [bp+var_9E]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+var_9E]
		mov	word ptr es:[bx], 35EEh
		push	seg stub219
		push	offset sub_4813A
		push	5
		push	large 2
		push	4
		mov	ax, [bp+var_9E]
		add	ax, 17h
		push	[bp+var_9C]
		push	ax
		call	sub_1474
		add	sp, 10h
		push	seg stub219
		push	offset sub_4813A
		push	5
		push	large 2
		push	4
		mov	ax, [bp+var_9E]
		add	ax, 1Fh
		push	[bp+var_9C]
		push	ax
		call	sub_1474
		add	sp, 10h
		push	seg stub219
		push	offset sub_4813A
		push	5
		push	large 2
		push	4
		mov	ax, [bp+var_9E]
		add	ax, 27h
		push	[bp+var_9C]
		push	ax
		call	sub_1474
		add	sp, 10h
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	[bp+var_9C]
		push	[bp+var_9E]
		nop
		push	cs
		call	near ptr sub_B83B6
		add	sp, 12h
		mov	dx, [bp+var_9C]
		mov	ax, [bp+var_9E]
		jmp	short loc_B831F

loc_B8317:
		mov	dx, [bp+var_9C]
		mov	ax, [bp+var_9E]

loc_B831F:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	loc_B83AA

loc_B8328:
		mov	al, [bp+var_12]
		mov	[bp+var_A0], al
		push	1
		push	0
		push	2
		push	large 23h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_A2], dx
		mov	[bp+var_A4], ax
		or	ax, dx
		jz	short loc_B838D
		les	bx, [bp+var_A4]
		mov	word ptr es:[bx], 3602h
		les	bx, [bp+var_A4]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+var_A4]
		mov	word ptr es:[bx], 35DAh
		mov	al, [bp+var_A0]
		push	ax
		push	[bp+var_A2]
		push	[bp+var_A4]
		call	sub_195D5
		add	sp, 6
		mov	dx, [bp+var_A2]
		mov	ax, [bp+var_A4]
		jmp	short loc_B8395

loc_B838D:
		mov	dx, [bp+var_A2]
		mov	ax, [bp+var_A4]

loc_B8395:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	short loc_B83AA

loc_B839D:
		push	0C008h
		call	sub_13451
		add	sp, 2
		jmp	short loc_B83AA

loc_B83AA:
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf
sub_B7EEA		endp

; START OF FUNCTION CHUNK FOR sub_B7EEA
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7EEA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B83B6		proc far

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
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= dword ptr -88h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
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
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0B8h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		cmp	eax, [si]
		jle	short loc_B83D2
		mov	ax, 1
		jmp	short loc_B83D4

loc_B83D2:
		xor	ax, ax

loc_B83D4:
		or	al, al
		jz	short loc_B840C
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	[bp+var_8], si
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], eax
		jmp	short loc_B843E

loc_B840C:
		mov	[bp+var_E], si
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	[bp+var_14], di
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], eax

loc_B843E:
		mov	bx, [bp+arg_A]
		mov	eax, [bx]
		mov	bx, [bp+arg_8]
		cmp	eax, [bx]
		jle	short loc_B8451
		mov	ax, 1
		jmp	short loc_B8453

loc_B8451:
		xor	ax, ax

loc_B8453:
		or	al, al
		jz	short loc_B8491
		mov	ax, [bp+arg_A]
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_20], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		jmp	short loc_B84C9

loc_B8491:
		mov	ax, [bp+arg_8]
		mov	[bp+var_26], ax
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	ax, [bp+arg_A]
		mov	[bp+var_2C], ax
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax

loc_B84C9:
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	bx, [bp+arg_C]
		cmp	eax, [bx]
		jle	short loc_B84DC
		mov	ax, 1
		jmp	short loc_B84DE

loc_B84DC:
		xor	ax, ax

loc_B84DE:
		or	al, al
		jz	short loc_B851C
		mov	ax, [bp+arg_E]
		mov	[bp+var_32], ax
		mov	bx, [bp+var_32]
		mov	eax, [bx]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	ax, [bp+arg_C]
		mov	[bp+var_38], ax
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax
		jmp	short loc_B8554

loc_B851C:
		mov	ax, [bp+arg_C]
		mov	[bp+var_3E], ax
		mov	bx, [bp+var_3E]
		mov	eax, [bx]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	ax, [bp+arg_E]
		mov	[bp+var_44], ax
		mov	bx, [bp+var_44]
		mov	eax, [bx]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax

loc_B8554:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Bh
		mov	[bp+var_62], ax
		mov	[bp+var_64], dx
		les	bx, [bp+var_64]
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_4C], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 17h
		mov	[bp+var_6A], ax
		mov	[bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_50], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Fh
		mov	[bp+var_72], ax
		mov	[bp+var_74], dx
		les	bx, [bp+var_74]
		mov	eax, es:[bx]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_54], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 23h
		mov	[bp+var_7A], ax
		mov	[bp+var_7C], dx
		les	bx, [bp+var_7C]
		mov	eax, es:[bx]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_58], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 27h
		mov	[bp+var_82], ax
		mov	[bp+var_84], dx
		les	bx, [bp+var_84]
		mov	eax, es:[bx]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_5C], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Bh
		mov	[bp+var_8A], ax
		mov	[bp+var_8C], dx
		les	bx, [bp+var_8C]
		mov	eax, es:[bx]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_50]
		sub	eax, [bp+var_4C]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_54]
		sub	eax, [bp+var_58]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_60]
		mov	[bp+var_A4], eax
		mov	[bp+var_94], 200h
		mov	eax, [bp+var_AC]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_A8]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A4]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_50]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_54]
		add	eax, [bp+var_58]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_60]
		mov	[bp+var_B0], eax
		mov	[bp+var_98], 200h
		mov	eax, [bp+var_B8]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B4]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B0]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B0], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_B8]
		mov	es:[bx+0Bh], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_B4]
		mov	es:[bx+0Fh], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_B0]
		mov	es:[bx+13h], eax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_9C]
		push	ax
		call	sub_28435
		add	sp, 6
		mov	eax, [bp+var_9C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_10]
		mov	es:[bx+6], al
		pop	di
		pop	si
		leave
		retf
sub_B83B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8797		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_B87B6
		push	large 4
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_B87B6

loc_B87B6:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_B8797		endp

; START OF FUNCTION CHUNK FOR sub_B8797
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B8797

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B87C0		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	eax, [si+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], eax
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		pop	si
		pop	bp
		retf
sub_B87C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B87ED		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_B87ED		endp
ovr219		ends
