ovr301		segment	para public 'OVERLAY' use16
		assume cs:ovr301
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AC220		proc far

var_16E		= word ptr -16Eh
var_11E		= word ptr -11Eh
var_C1		= dword ptr -0C1h
var_BD		= dword ptr -0BDh
var_B9		= dword ptr -0B9h
var_B1		= dword ptr -0B1h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 16Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_11E], 508h
		mov	[bp+var_BD], 100h
		mov	[bp+var_C1], 0
		mov	[bp+var_11E], 520h
		mov	[bp+var_A2], 0
		xor	ax, ax
		mov	[bp+var_A4], ax
		movsx	eax, ax
		mov	[bp+var_B9], eax
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	large [bp+var_12]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_6], 0
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	si
		call	Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jz	short loc_AC2A6
		jmp	loc_AD1EE

loc_AC2A6:
		mov	byte_7975D, 0
		push	seg seg225
		push	0
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_16E]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		mov	bx, [bp+var_11E]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_B1], 4C414552h
		jnz	short loc_AC2ED
		mov	ax, 1
		jmp	short loc_AC2EF

loc_AC2ED:
		xor	ax, ax

loc_AC2EF:
		or	ax, ax
		jnz	short loc_AC2F6
		jmp	loc_AD1E5

loc_AC2F6:
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 544A424Fh
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC31D
		jmp	loc_AD1BB

loc_AC31D:
		push	0
		push	large 4A424F42h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AC39E
		push	1
		push	0
		push	2
		push	large 48h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], ax
		or	ax, dx
		jz	short loc_AC385
		les	bx, [bp+var_1E]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		lea	ax, [bp+var_11E]
		push	ax
		push	dx
		push	bx
		call	sub_741CF
		add	sp, 6
		mov	dx, [bp+var_1C]
		mov	ax, [bp+var_1E]
		jmp	loc_AD155

loc_AC385:
		mov	dx, [bp+var_1C]
		mov	ax, [bp+var_1E]

loc_AC38B:
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax

loc_AC391:
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	loc_AD169

loc_AC39E:
		push	0
		push	large 544E524Fh
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AC423
		push	1
		push	0
		push	2
		push	large 49h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		or	ax, dx
		jz	short loc_AC41A
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 1F1Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_20]
		push	bx
		call	sub_3B14C
		add	sp, 6
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	loc_AD155

loc_AC41A:
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	loc_AC38B

loc_AC423:
		push	0
		push	large 52435254h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC43F
		jmp	loc_AC4C8

loc_AC43F:
		push	1
		push	0
		push	2
		push	large 8Bh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		or	ax, dx
		jz	short loc_AC4BF
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1EDCh
		mov	word ptr es:[bx], 1EFCh
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_24]
		push	bx
		call	sub_75090
		add	sp, 6
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]
		jmp	loc_AD155

loc_AC4BF:
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]
		jmp	loc_AC38B

loc_AC4C8:
		push	0
		push	large 4C424F4Dh
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AC553
		push	1
		push	0
		push	2
		push	large 4Ah
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_28], dx
		mov	[bp+var_2A], ax
		or	ax, dx
		jz	short loc_AC54A
		les	bx, [bp+var_2A]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_2A]
		mov	word ptr es:[bx+48h], 0
		mov	word ptr es:[bx], 1EACh
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_28]
		push	bx
		call	sub_74370
		add	sp, 6
		mov	dx, [bp+var_28]
		mov	ax, [bp+var_2A]
		jmp	loc_AD155

loc_AC54A:
		mov	dx, [bp+var_28]
		mov	ax, [bp+var_2A]
		jmp	loc_AC38B

loc_AC553:
		push	0
		push	large 424F4D4Fh
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AC5E8
		push	1
		push	0
		push	2
		push	large 59h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2C], dx
		mov	[bp+var_2E], ax
		or	ax, dx
		jz	short loc_AC5DF
		les	bx, [bp+var_2E]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_2E]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_2C]
		push	bx
		call	sub_7437A
		add	sp, 6
		mov	dx, [bp+var_2C]
		mov	ax, [bp+var_2E]
		jmp	loc_AD155

loc_AC5DF:
		mov	dx, [bp+var_2C]
		mov	ax, [bp+var_2E]
		jmp	loc_AC38B

loc_AC5E8:
		push	0
		push	large 44495547h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC604
		jmp	loc_AC68E

loc_AC604:
		push	1
		push	0
		push	2
		push	large 5Dh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_30], dx
		mov	[bp+var_32], ax
		or	ax, dx
		jz	short loc_AC685
		les	bx, [bp+var_32]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_32]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	dword ptr es:[bx+59h], 0
		mov	word ptr es:[bx], 1E94h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_30]
		push	bx
		call	sub_74384
		add	sp, 6
		mov	dx, [bp+var_30]
		mov	ax, [bp+var_32]
		jmp	loc_AD155

loc_AC685:
		mov	dx, [bp+var_30]
		mov	ax, [bp+var_32]
		jmp	loc_AC38B

loc_AC68E:
		push	0
		push	large 474D5241h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC6AA
		jmp	loc_AC742

loc_AC6AA:
		push	1
		push	0
		push	2
		push	large 61h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_34], dx
		mov	[bp+var_36], ax
		or	ax, dx
		jz	short loc_AC739
		les	bx, [bp+var_36]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_36]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	dword ptr es:[bx+59h], 0
		mov	word ptr es:[bx], 1E94h
		mov	dword ptr es:[bx+5Dh], 0
		mov	word ptr es:[bx], 1E7Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_34]
		push	bx
		call	sub_743B0
		add	sp, 6
		mov	dx, [bp+var_34]
		mov	ax, [bp+var_36]
		jmp	loc_AD155

loc_AC739:
		mov	dx, [bp+var_34]
		mov	ax, [bp+var_36]
		jmp	loc_AC38B

loc_AC742:
		push	0
		push	large 5054454Ah
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC75E
		jmp	loc_AC82F

loc_AC75E:
		push	1
		push	0
		push	2
		push	large 99h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_38], dx
		mov	[bp+var_3A], ax
		or	ax, dx
		jnz	short loc_AC782
		jmp	loc_AC826

loc_AC782:
		les	bx, [bp+var_3A]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_3A]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	dword ptr es:[bx+59h], 0
		mov	word ptr es:[bx], 1E94h
		mov	dword ptr es:[bx+5Dh], 0
		mov	word ptr es:[bx], 1E7Ch
		mov	dword ptr es:[bx+61h], 0
		mov	word ptr es:[bx], 1E64h
		xor	eax, eax
		mov	es:[bx+73h], eax
		mov	es:[bx+6Fh], eax
		mov	es:[bx+77h], al
		xor	eax, eax
		mov	es:[bx+94h], eax
		mov	es:[bx+90h], eax
		mov	es:[bx+98h], al
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_38]
		push	bx
		call	sub_74410
		add	sp, 6
		mov	dx, [bp+var_38]
		mov	ax, [bp+var_3A]
		jmp	loc_AD155

loc_AC826:
		mov	dx, [bp+var_38]
		mov	ax, [bp+var_3A]
		jmp	loc_AC38B

loc_AC82F:
		push	0
		push	large 54494D58h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AC8B9
		push	1
		push	0
		push	2
		push	large 49h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_3C], dx
		mov	[bp+var_3E], ax
		or	ax, dx
		jz	short loc_AC8B0
		les	bx, [bp+var_3E]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_3E]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx], 1E4Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_3C]
		push	bx
		call	sub_747D0
		add	sp, 6
		mov	dx, [bp+var_3C]
		mov	ax, [bp+var_3E]
		jmp	loc_AD155

loc_AC8B0:
		mov	dx, [bp+var_3C]
		mov	ax, [bp+var_3E]
		jmp	loc_AC38B

loc_AC8B9:
		push	0
		push	large 52524143h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC8D5
		jmp	loc_AC96C

loc_AC8D5:
		push	1
		push	0
		push	2
		push	large 87h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_40], dx
		mov	[bp+var_42], ax
		or	ax, dx
		jz	short loc_AC963
		les	bx, [bp+var_42]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_42]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1E04h
		mov	dword ptr es:[bx+59h], 0
		mov	word ptr es:[bx], 1E1Ch
		mov	word ptr es:[bx], 1E34h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_40]
		push	bx
		call	sub_74800
		add	sp, 6
		mov	dx, [bp+var_40]
		mov	ax, [bp+var_42]
		jmp	loc_AD155

loc_AC963:
		mov	dx, [bp+var_40]
		mov	ax, [bp+var_42]
		jmp	loc_AC38B

loc_AC96C:
		push	0
		push	large 50494853h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AC988
		jmp	loc_ACA1A

loc_AC988:
		push	1
		push	0
		push	2
		push	large 87h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_44], dx
		mov	[bp+var_46], ax
		or	ax, dx
		jz	short loc_ACA11
		les	bx, [bp+var_46]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_46]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1E04h
		mov	dword ptr es:[bx+59h], 0
		mov	word ptr es:[bx], 1E1Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_44]
		push	bx
		call	sub_74940
		add	sp, 6
		mov	dx, [bp+var_44]
		mov	ax, [bp+var_46]
		jmp	loc_AD155

loc_ACA11:
		mov	dx, [bp+var_44]
		mov	ax, [bp+var_46]
		jmp	loc_AC38B

loc_ACA1A:
		push	0
		push	large 50414557h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_ACA36
		jmp	loc_ACAB7

loc_ACA36:
		push	1
		push	0
		push	2
		push	large 67h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_48], dx
		mov	[bp+var_4A], ax
		or	ax, dx
		jz	short loc_ACAAE
		les	bx, [bp+var_4A]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_4A]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1EDCh
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_48]
		push	bx
		call	sub_746D5
		add	sp, 6
		mov	dx, [bp+var_48]
		mov	ax, [bp+var_4A]
		jmp	loc_AD155

loc_ACAAE:
		mov	dx, [bp+var_48]
		mov	ax, [bp+var_4A]
		jmp	loc_AC38B

loc_ACAB7:
		push	0
		push	large 5353494Dh
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_ACAD3
		jmp	loc_ACB59

loc_ACAD3:
		push	1
		push	0
		push	2
		push	large 6Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_4C], dx
		mov	[bp+var_4E], ax
		or	ax, dx
		jz	short loc_ACB50
		les	bx, [bp+var_4E]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_4E]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1EDCh
		mov	word ptr es:[bx], 1DE4h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_4C]
		push	bx
		call	sub_745F0
		add	sp, 6
		mov	dx, [bp+var_4C]
		mov	ax, [bp+var_4E]
		jmp	loc_AD155

loc_ACB50:
		mov	dx, [bp+var_4C]
		mov	ax, [bp+var_4E]
		jmp	loc_AC38B

loc_ACB59:
		push	0
		push	large 424D4F42h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_ACB75
		jmp	loc_ACBFB

loc_ACB75:
		push	1
		push	0
		push	2
		push	large 6Ch
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_50], dx
		mov	[bp+var_52], ax
		or	ax, dx
		jz	short loc_ACBF2
		les	bx, [bp+var_52]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_52]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1EDCh
		mov	word ptr es:[bx], 1DC4h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_50]
		push	bx
		call	sub_745A5
		add	sp, 6
		mov	dx, [bp+var_50]
		mov	ax, [bp+var_52]
		jmp	loc_AD155

loc_ACBF2:
		mov	dx, [bp+var_50]
		mov	ax, [bp+var_52]
		jmp	loc_AC38B

loc_ACBFB:
		push	0
		push	large 4D4C504Eh
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_ACC17
		jmp	loc_ACCA2

loc_ACC17:
		push	1
		push	0
		push	2
		push	large 6Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_54], dx
		mov	[bp+var_56], ax
		or	ax, dx
		jz	short loc_ACC99
		les	bx, [bp+var_56]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_56]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1EDCh
		mov	word ptr es:[bx], 1DC4h
		mov	word ptr es:[bx], 1DA4h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_54]
		push	bx
		call	sub_745BE
		add	sp, 6
		mov	dx, [bp+var_54]
		mov	ax, [bp+var_56]
		jmp	loc_AD155

loc_ACC99:
		mov	dx, [bp+var_54]
		mov	ax, [bp+var_56]
		jmp	loc_AC38B

loc_ACCA2:
		push	0
		push	large 50524F54h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_ACCD4
		lea	ax, [bp+var_11E]
		push	ax
		push	large 0
		call	sub_4498B
		add	sp, 6
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		jmp	loc_AC391

loc_ACCD4:
		push	0
		push	large 4E505753h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_ACD5E
		push	1
		push	0
		push	2
		push	large 76h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_58], dx
		mov	[bp+var_5A], ax
		or	ax, dx
		jz	short loc_ACD55
		les	bx, [bp+var_5A]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_5A]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx], 1D8Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_58]
		push	bx
		call	sub_74710
		add	sp, 6
		mov	dx, [bp+var_58]
		mov	ax, [bp+var_5A]
		jmp	loc_AD155

loc_ACD55:
		mov	dx, [bp+var_58]
		mov	ax, [bp+var_5A]
		jmp	loc_AC38B

loc_ACD5E:
		push	0
		push	large 444E5247h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_ACD7A
		jmp	loc_ACDFB

loc_ACD7A:
		push	1
		push	0
		push	2
		push	large 59h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_5C], dx
		mov	[bp+var_5E], ax
		or	ax, dx
		jz	short loc_ACDF2
		les	bx, [bp+var_5E]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_5E]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1E04h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_5C]
		push	bx
		call	sub_747A0
		add	sp, 6
		mov	dx, [bp+var_5C]
		mov	ax, [bp+var_5E]
		jmp	loc_AD155

loc_ACDF2:
		mov	dx, [bp+var_5C]
		mov	ax, [bp+var_5E]
		jmp	loc_AC38B

loc_ACDFB:
		push	0
		push	large 4C505845h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_ACE85
		push	1
		push	0
		push	2
		push	large 57h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_60], dx
		mov	[bp+var_62], ax
		or	ax, dx
		jz	short loc_ACE7C
		les	bx, [bp+var_62]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_62]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx], 1D74h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_60]
		push	bx
		call	sub_4BAD1
		add	sp, 6
		mov	dx, [bp+var_60]
		mov	ax, [bp+var_62]
		jmp	loc_AD155

loc_ACE7C:
		mov	dx, [bp+var_60]
		mov	ax, [bp+var_62]
		jmp	loc_AC38B

loc_ACE85:
		push	0
		push	large 52424544h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_ACF15
		push	1
		push	0
		push	2
		push	large 4Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_64], dx
		mov	[bp+var_66], ax
		or	ax, dx
		jz	short loc_ACF0C
		les	bx, [bp+var_66]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_66]
		mov	word ptr es:[bx+48h], 0
		mov	word ptr es:[bx], 1EACh
		mov	word ptr es:[bx], 1D5Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_64]
		push	bx
		call	IFF_LoadInfoChunk
		add	sp, 6
		mov	dx, [bp+var_64]
		mov	ax, [bp+var_66]
		jmp	loc_AD155

loc_ACF0C:
		mov	dx, [bp+var_64]
		mov	ax, [bp+var_66]
		jmp	loc_AC38B

loc_ACF15:
		push	0
		push	large 474B4D53h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_ACF9F
		push	1
		push	0
		push	2
		push	large 59h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_68], dx
		mov	[bp+var_6A], ax
		or	ax, dx
		jz	short loc_ACF96
		les	bx, [bp+var_6A]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_6A]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx], 1D44h
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_68]
		push	bx
		call	sub_7500A
		add	sp, 6
		mov	dx, [bp+var_68]
		mov	ax, [bp+var_6A]
		jmp	loc_AD155

loc_ACF96:
		mov	dx, [bp+var_68]
		mov	ax, [bp+var_6A]
		jmp	loc_AC38B

loc_ACF9F:
		push	0
		push	large 44414853h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AD029
		push	1
		push	0
		push	2
		push	large 49h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_6C], dx
		mov	[bp+var_6E], ax
		or	ax, dx
		jz	short loc_AD020
		les	bx, [bp+var_6E]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_6E]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx], 1D2Ch
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_6C]
		push	bx
		call	sub_748C5
		add	sp, 6
		mov	dx, [bp+var_6C]
		mov	ax, [bp+var_6E]
		jmp	loc_AD155

loc_AD020:
		mov	dx, [bp+var_6C]
		mov	ax, [bp+var_6E]
		jmp	loc_AC38B

loc_AD029:
		push	0
		push	large 43454A45h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_AD045
		jmp	loc_AD0D7

loc_AD045:
		push	1
		push	0
		push	2
		push	large 6Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_70], dx
		mov	[bp+var_72], ax
		or	ax, dx
		jz	short loc_AD0CE
		les	bx, [bp+var_72]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_72]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1D14h
		xor	eax, eax
		mov	es:[bx+61h], eax
		mov	es:[bx+5Dh], eax
		mov	es:[bx+65h], al
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_70]
		push	bx
		call	sub_750C0
		add	sp, 6
		mov	dx, [bp+var_70]
		mov	ax, [bp+var_72]
		jmp	loc_AD155

loc_AD0CE:
		mov	dx, [bp+var_70]
		mov	ax, [bp+var_72]
		jmp	loc_AC38B

loc_AD0D7:
		push	0
		push	large 4E4F534Ch
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AD161
		push	1
		push	0
		push	2
		push	large 6Dh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_74], dx
		mov	[bp+var_76], ax
		or	ax, dx
		jz	short loc_AD158
		les	bx, [bp+var_76]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	dx
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, [bp+var_76]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx], 1CFCh
		lea	ax, [bp+var_11E]
		push	ax
		push	[bp+var_74]
		push	bx
		call	sub_74905
		add	sp, 6
		mov	dx, [bp+var_74]
		mov	ax, [bp+var_76]

loc_AD155:
		jmp	loc_AC38B

loc_AD158:
		mov	dx, [bp+var_74]
		mov	ax, [bp+var_76]
		jmp	loc_AC38B

loc_AD161:
		push	0C015h
		call	sub_1DDFE

loc_AD169:
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_AD1B2
		lea	ax, [bp+var_11E]
		push	ax
		push	large [bp+var_16]
		call	sub_741D4
		add	sp, 6
		push	large [bp+var_16]
		push	si
		call	sub_741E3
		add	sp, 6
		push	8
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, word ptr [bp+var_16]
		add	ax, 36h
		push	word ptr [bp+var_16+2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+var_16]
		mov	byte ptr es:[bx+3Eh], 0
		jmp	short loc_AD1BB

loc_AD1B2:
		push	0C014h
		call	sub_1DDFE
		pop	cx

loc_AD1BB:
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_AD1EE
		lea	ax, [bp+var_11E]
		push	ax
		call	sub_73A3A
		pop	cx
		les	bx, word ptr [bp+var_16]
		mov	es:[bx+33h], dx
		mov	es:[bx+31h], ax
		jmp	short loc_AD1EE

loc_AD1E5:
		push	0C016h
		call	sub_1DDFE
		pop	cx

loc_AD1EE:
		les	bx, word ptr [bp+var_16]
		mov	al, [bp+arg_6]
		mov	es:[bx+2], al
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_11E], 520h
		lea	ax, [bp+var_11E]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_11E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		pop	si
		leave
		retf
sub_AC220		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD229		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_AD26B
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_AD26B
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AD26B

loc_AD26B:
		pop	si
		leave
		retf
sub_AD229		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD26E		proc far
		push	bp
		mov	bp, sp
		mov	al, 1Bh
		pop	bp
		retf
sub_AD26E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD275		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_AD275		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD27A		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_AD2BC
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_AD2BC
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AD2BC

loc_AD2BC:
		pop	si
		leave
		retf
sub_AD27A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD2BF		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_AD301
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_AD301
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AD301

loc_AD301:
		pop	si
		leave
		retf
sub_AD2BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD304		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_AD346
		push	0
		push	large [bp+arg_0]
		call	sub_3FC93
		add	sp, 6
		test	si, 1
		jz	short loc_AD346
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AD346

loc_AD346:
		pop	si
		leave
		retf
sub_AD304		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD349		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_AD38B
		push	0
		push	large [bp+arg_0]
		call	sub_74945
		add	sp, 6
		test	si, 1
		jz	short loc_AD38B
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AD38B

loc_AD38B:
		pop	si
		leave
		retf
sub_AD349		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD38E		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_AD3D0
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_AD3D0
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AD3D0

loc_AD3D0:
		pop	si
		leave
		retf
sub_AD38E		endp
ovr301		ends
