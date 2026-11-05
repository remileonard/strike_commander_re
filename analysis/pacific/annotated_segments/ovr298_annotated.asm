ovr298		segment	para public 'OVERLAY' use16
		assume cs:ovr298
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB3B0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], seg seg227
		mov	[bp+var_4], 0
		xor	dx, dx
		jmp	short loc_AB3EF

loc_AB3C4:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		les	bx, [bp+var_4]
		cmp	eax, es:[bx]
		jnz	short loc_AB3EA
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+4]
		les	bx, [bp+var_4]
		cmp	eax, es:[bx+4]
		jnz	short loc_AB3EA
		mov	al, dl
		jmp	short loc_AB40C

loc_AB3EA:
		inc	dx
		add	[bp+var_4], 8

loc_AB3EF:
		cmp	dx, 24h
		jl	short loc_AB3C4
		cmp	byte_79B64, 0
		jz	short loc_AB40A
		push	large [bp+arg_0]
		push	16FEh
		call	CRT_Msg_NullPtrAssign
		add	sp, 6

loc_AB40A:
		mov	al, 0Bh

loc_AB40C:
		leave
		retf
sub_AB3B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB40E		proc far

var_102		= word ptr -102h
var_A5		= dword ptr -0A5h
var_A1		= dword ptr -0A1h
var_90		= dword ptr -90h
var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 102h
		push	si
		push	di
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	dx
		push	ax
		push	ds
		push	offset aExtents
		push	ds
		push	offset aDataObjects
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_102]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_102], 508h
		mov	[bp+var_A1], 100h
		mov	[bp+var_A5], 0
		mov	[bp+var_102], 520h
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		mov	bx, [bp+var_102]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E545845h
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AB49A
		jmp	loc_AB59D

loc_AB49A:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AB4C2
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	di, ax
		jmp	short loc_AB4C5

loc_AB4C2:
		mov	di, 24h

loc_AB4C5:
		cmp	di, 24h
		jle	short loc_AB4D3
		push	0B020h
		call	sub_1DDFE
		pop	cx

loc_AB4D3:
		push	0
		push	large 454D414Eh
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AB53E
		mov	eax, [bp+var_90]
		mov	ebx, 9
		cdq
		idiv	ebx
		mov	di, ax
		mov	word ptr [bp+var_8+2], seg seg227
		mov	word ptr [bp+var_8], 0
		xor	si, si
		jmp	short loc_AB53A

loc_AB50C:
		push	large 8
		push	large [bp+var_8]
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		add	word ptr [bp+var_8], 8
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	dx, seg seg227
		mov	es, dx
		mov	es:[si+120h], al
		inc	si

loc_AB53A:
		cmp	si, di
		jl	short loc_AB50C

loc_AB53E:
		push	0
		push	large 4E535953h
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AB598
		mov	word ptr [bp+var_8+2], seg seg228
		mov	word ptr [bp+var_8], 0
		mov	eax, [bp+var_90]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_A], ax
		xor	si, si
		jmp	short loc_AB591

loc_AB578:
		push	large 8
		push	large [bp+var_8]
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		add	word ptr [bp+var_8], 8
		inc	si

loc_AB591:
		cmp	si, [bp+var_A]
		jl	short loc_AB578
		jmp	short loc_AB5A6

loc_AB598:
		push	0B021h
		jmp	short loc_AB5A0

loc_AB59D:
		push	0B022h

loc_AB5A0:
		call	sub_1DDFE
		pop	cx

loc_AB5A6:
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_102], 520h
		lea	ax, [bp+var_102]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_102]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_AB40E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB5D5		proc far

var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= byte ptr -0A0h
var_9E		= dword ptr -9Eh
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
		mov	[bp+var_6], 0
		lea	ax, [bp+var_10]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
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
		call	near ptr sub_AB3B0
		add	sp, 4
		mov	[bp+var_12], al
		mov	al, [bp+var_1]
		cbw
		cmp	ax, 42h
		jnz	short loc_AB624
		jmp	loc_AB752

loc_AB624:
		cmp	ax, 4Ch
		jnz	short loc_AB62C
		jmp	loc_AB947

loc_AB62C:
		cmp	ax, 53h
		jz	short loc_AB634
		jmp	loc_AB9AA

loc_AB634:
		mov	[bp+var_18], si
		push	[bp+var_18]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_B0], eax
		sar	eax, 8
		mov	[bp+var_B0], eax
		mov	[bp+var_22], si
		push	[bp+var_22]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_26], eax
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_AC], eax
		sar	eax, 8
		mov	[bp+var_AC], eax
		mov	[bp+var_2C], si
		push	[bp+var_2C]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_30], eax
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_A8], eax
		sar	eax, 8
		mov	[bp+var_A8], eax
		mov	[bp+var_36], si
		push	[bp+var_36]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3A], eax
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_16], eax
		sar	eax, 8
		mov	[bp+var_16], eax
		mov	al, [bp+var_12]
		mov	[bp+var_40], al
		push	1
		push	0
		push	2
		push	large 17h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_42], dx
		mov	[bp+var_44], ax
		or	ax, dx
		jz	short loc_AB743
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 16D5h
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 16E9h
		mov	al, [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	dx
		push	bx
		call	sub_38570
		add	sp, 0Ah
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]
		jmp	short loc_AB749

loc_AB743:
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]

loc_AB749:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	loc_AB9B3

loc_AB752:
		mov	[bp+var_5E], si
		push	[bp+var_5E]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_62], eax
		shl	eax, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_48], eax
		sar	eax, 8
		mov	[bp+var_48], eax
		mov	[bp+var_68], si
		push	[bp+var_68]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6C], eax
		shl	eax, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_4C], eax
		sar	eax, 8
		mov	[bp+var_4C], eax
		mov	[bp+var_72], si
		push	[bp+var_72]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
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
		call	ResourceRecord_ReadFieldGroupC_6DAF7
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
		call	ResourceRecord_ReadFieldGroupC_6DAF7
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
		call	ResourceRecord_ReadFieldGroupC_6DAF7
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
		mov	al, [bp+var_12]
		mov	[bp+var_9A], al
		push	1
		push	0
		push	2
		push	large 2Fh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_9E+2], dx
		mov	word ptr [bp+var_9E], ax
		or	ax, dx
		jnz	short loc_AB890
		jmp	loc_AB93C

loc_AB890:
		les	bx, word ptr [bp+var_9E]
		mov	word ptr es:[bx], 16D5h
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 1731h
		push	seg stub298
		push	offset sub_74210
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_9E]
		add	ax, 17h
		push	dx
		push	ax
		call	sub_149D
		add	sp, 10h
		push	seg stub298
		push	offset sub_74210
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_9E]
		add	ax, 1Fh
		push	word ptr [bp+var_9E+2]
		push	ax
		call	sub_149D
		add	sp, 10h
		push	seg stub298
		push	offset sub_74210
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_9E]
		add	ax, 27h
		push	word ptr [bp+var_9E+2]
		push	ax
		call	sub_149D
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
		push	large [bp+var_9E]
		nop
		push	cs
		call	near ptr sub_AB9BC
		add	sp, 12h
		mov	dx, word ptr [bp+var_9E+2]
		mov	ax, word ptr [bp+var_9E]
		jmp	loc_AB749

loc_AB93C:
		mov	dx, word ptr [bp+var_9E+2]
		mov	ax, word ptr [bp+var_9E]
		jmp	loc_AB749

loc_AB947:
		mov	al, [bp+var_12]
		mov	[bp+var_A0], al
		push	1
		push	0
		push	2
		push	large 23h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_A2], dx
		mov	[bp+var_A4], ax
		or	ax, dx
		jz	short loc_AB99F
		les	bx, [bp+var_A4]
		mov	word ptr es:[bx], 16D5h
		mov	dword ptr es:[bx+2], 0
		mov	word ptr es:[bx], 16C1h
		mov	al, [bp+var_A0]
		push	ax
		push	dx
		push	bx
		call	sub_3839A
		add	sp, 6
		mov	dx, [bp+var_A2]
		mov	ax, [bp+var_A4]
		jmp	loc_AB749

loc_AB99F:
		mov	dx, [bp+var_A2]
		mov	ax, [bp+var_A4]
		jmp	loc_AB749

loc_AB9AA:
		push	0C008h
		call	sub_1DDFE
		pop	cx

loc_AB9B3:
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf
sub_AB5D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB9BC		proc far

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
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		cmp	eax, [si]
		jle	short loc_AB9D8
		mov	ax, 1
		jmp	short loc_AB9DA

loc_AB9D8:
		xor	ax, ax

loc_AB9DA:
		or	al, al
		jz	short loc_AB9FE
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		jmp	short loc_ABA1E

loc_AB9FE:
		mov	eax, [si]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	si, di
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]

loc_ABA1E:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Bh], eax
		mov	bx, [bp+arg_A]
		mov	eax, [bx]
		mov	bx, [bp+arg_8]
		cmp	eax, [bx]
		jle	short loc_ABA39
		mov	ax, 1
		jmp	short loc_ABA3B

loc_ABA39:
		xor	ax, ax

loc_ABA3B:
		or	al, al
		jz	short loc_ABA65
		mov	si, [bp+arg_A]
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	si, [bp+arg_8]
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		jmp	short loc_ABA89

loc_ABA65:
		mov	si, [bp+arg_8]
		mov	eax, [si]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	si, [bp+arg_A]
		mov	eax, [si]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]

loc_ABA89:
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	bx, [bp+arg_C]
		cmp	eax, [bx]
		jle	short loc_ABAA4
		mov	ax, 1
		jmp	short loc_ABAA6

loc_ABAA4:
		xor	ax, ax

loc_ABAA6:
		or	al, al
		jz	short loc_ABAD0
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	si, [bp+arg_C]
		mov	eax, [si]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		jmp	short loc_ABAF4

loc_ABAD0:
		mov	si, [bp+arg_C]
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	si, [bp+arg_E]
		mov	eax, [si]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]

loc_ABAF4:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Bh
		mov	[bp+var_4A], ax
		mov	[bp+var_4C], dx
		les	bx, [bp+var_4C]
		mov	eax, es:[bx]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_34], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 17h
		mov	[bp+var_52], ax
		mov	[bp+var_54], dx
		les	bx, [bp+var_54]
		mov	eax, es:[bx]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_38], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Fh
		mov	[bp+var_5A], ax
		mov	[bp+var_5C], dx
		les	bx, [bp+var_5C]
		mov	eax, es:[bx]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_3C], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 23h
		mov	[bp+var_62], ax
		mov	[bp+var_64], dx
		les	bx, [bp+var_64]
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_40], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 27h
		mov	[bp+var_6A], ax
		mov	[bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_44], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Bh
		mov	[bp+var_72], ax
		mov	[bp+var_74], dx
		les	bx, [bp+var_74]
		mov	eax, es:[bx]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		sub	eax, [bp+var_34]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_3C]
		sub	eax, [bp+var_40]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_44]
		sub	eax, [bp+var_48]
		mov	[bp+var_8C], eax
		mov	[bp+var_7C], 200h
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
		mov	eax, [bp+var_8C]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_34]
		add	eax, [bp+var_38]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_3C]
		add	eax, [bp+var_40]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_48]
		mov	[bp+var_98], eax
		mov	[bp+var_80], 200h
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
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [bp+var_80]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_98], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_A0]
		mov	es:[bx+0Bh], eax
		mov	eax, [bp+var_9C]
		mov	es:[bx+0Fh], eax
		mov	eax, [bp+var_98]
		mov	es:[bx+13h], eax
		lea	ax, word ptr [bp+var_94]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_84]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], eax
		mov	al, [bp+arg_10]
		mov	es:[bx+6], al
		pop	di
		pop	si
		leave
		retf
sub_AB9BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_AllocateExtended_9C7BA (sub_9C7BA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
Debris_AllocateExtended_ABD24		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_ABD41
		push	large 4
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_ABD41:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
Debris_AllocateExtended_ABD24		endp
ovr298		ends
