ovr297		segment	para public 'OVERLAY' use16
		assume cs:ovr297
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA750		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_AA764
		jmp	loc_AA8B4

loc_AA764:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 16A8h
		push	large es:[bx+0Dh]
		call	sub_3C0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_AA7B2
		push	large es:[bx+8]
		call	Particle_ListFreeAll
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AA7B2

loc_AA7B2:
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2Dh]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+44h], 0
		jz	short loc_AA834
		cmp	word ptr es:[bx+44h], 0
		jz	short loc_AA834
		push	3
		push	word ptr es:[bx+44h]
		mov	bx, es:[bx+44h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_AA834

loc_AA834:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+13h], 0
		jz	short loc_AA84C
		push	large es:[bx+13h]
		call	sub_3C0
		add	sp, 4

loc_AA84C:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+3Fh], 0
		jz	short loc_AA873
		push	0
		push	2
		mov	eax, es:[bx+3Fh]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_AA873:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+31h], 0
		jz	short loc_AA893
		push	3
		push	large es:[bx+31h]
		les	bx, es:[bx+31h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_AA893

loc_AA893:
		test	si, 1
		jz	short loc_AA8B4
		mov	eax, [bp+arg_0]
		mov	[bp+var_18], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_AA8B4:
		pop	si
		leave
		retf
sub_AA750		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA8B7		proc far

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
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_AA8C9
		jmp	loc_AAB88

loc_AA8C9:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 36h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[di+6], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11h], 0
		jg	short loc_AA8ED
		jmp	loc_AAB88

loc_AA8ED:
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AA913
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+9], 0
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		mov	ax, si
		jmp	short loc_AA915

loc_AA913:
		mov	ax, si

loc_AA915:
		mov	[di+1Eh], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 36h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		xor	si, si
		jmp	short loc_AA948

loc_AA92B:
		les	bx, [bp+var_12]
		add	bx, si
		cmp	byte ptr es:[bx], 0
		jz	short loc_AA943
		mov	bx, [bp+var_12]
		add	bx, si
		mov	al, es:[bx]
		mov	byte ptr [bp+si+var_E], al
		jmp	short loc_AA947

loc_AA943:
		mov	byte ptr [bp+si+var_E], 20h

loc_AA947:
		inc	si

loc_AA948:
		cmp	si, 4
		jl	short loc_AA92B
		push	di
		push	167Ah
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	8
		lea	ax, [bp+var_E]
		push	ax
		push	word ptr [di+1Eh]
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [di+1Eh]
		mov	byte ptr [bx+8], 0
		mov	[bp+var_16], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_1E], 0
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_16], eax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_1A], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_1E], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Dh]
		mov	[bp+var_22], eax
		mov	[bp+var_24], 0
		jmp	loc_AAB79

loc_AA9C8:
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_16], eax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_1A], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_28], eax
		push	1
		push	1
		push	large [bp+var_28]
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	edx, [bp+var_16]
		sub	edx, eax
		mov	[bp+var_16], edx
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		sub	[bp+var_1A], eax
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		sub	[bp+var_1E], eax
		cmp	byte_79B64, 0
		jz	short loc_AAA5C
		push	large [bp+var_1E]
		push	large [bp+var_1A]
		push	large [bp+var_16]
		push	large [bp+var_22]
		push	167Dh
		call	CRT_Msg_NullPtrAssign
		add	sp, 12h

loc_AAA5C:
		mov	ax, word ptr [bp+var_22+2]
		mov	dx, word ptr [bp+var_22]
		add	dx, 9
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	dx, [bp+var_2C]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_44], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_40], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[si+12h], eax
		mov	eax, [bp+var_40]
		mov	[si+16h], eax
		mov	eax, [bp+var_3C]
		mov	[si+1Ah], eax
		mov	ax, si
		add	ax, 12h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		lea	ax, word ptr [bp+var_68]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, word ptr [bp+var_22+2]
		mov	dx, word ptr [bp+var_22]
		add	dx, 15h
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		les	dx, [bp+var_30]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_64], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_60], eax
		mov	ax, word ptr [bp+var_22+2]
		mov	dx, word ptr [bp+var_22]
		add	dx, 21h
		mov	[bp+var_32], ax
		mov	[bp+var_34], dx
		les	dx, [bp+var_34]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_5C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_58], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_54], eax
		mov	ax, word ptr [bp+var_22+2]
		mov	dx, word ptr [bp+var_22]
		add	dx, 2Dh
		mov	[bp+var_36], ax
		mov	[bp+var_38], dx
		les	dx, [bp+var_38]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_50], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_4C], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_48], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+44h]
		add	sp, 4
		test	byte ptr [di+2], 10h
		jz	short loc_AAB68
		test	byte ptr [si+2], 10h
		jz	short loc_AAB68
		mov	al, [di+51h]
		push	ax
		push	si
		call	sub_7434A
		add	sp, 4

loc_AAB68:
		push	si
		push	di
		call	sub_7413F
		add	sp, 4
		inc	[bp+var_24]
		add	word ptr [bp+var_22], 39h

loc_AAB79:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, [bp+var_24]
		jle	short loc_AAB88
		jmp	loc_AA9C8

loc_AAB88:
		pop	di
		pop	si
		leave
		retf
sub_AA8B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AAB8C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+11h], 0
		mov	dword ptr es:[bx+0Dh], 0
		mov	byte ptr es:[bx+2], 1
		mov	byte ptr es:[bx+3], 0
		mov	word ptr es:[bx+4], 0
		mov	word ptr es:[bx+6], 0
		mov	word ptr es:[bx+46h], 0
		mov	dword ptr es:[bx+31h], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	dword ptr es:[bx+1Bh], 0
		mov	word ptr es:[bx+1Fh], 0FFFFh
		mov	word ptr es:[bx+21h], 0FFFFh
		mov	dword ptr es:[bx+27h], 0
		mov	dword ptr es:[bx+2Dh], 0
		mov	word ptr es:[bx+44h], 0
		mov	dword ptr es:[bx+13h], 0
		mov	dword ptr es:[bx+3Fh], 0
		pop	bp
		retf
sub_AAB8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AAC15		proc far

var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_22		= word ptr -22h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	byte_7975D, 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_AAB8C
		add	sp, 4
		push	1
		push	0
		push	2
		push	large 17h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_AAC8B
		mov	[bp+var_8], 5DC00h
		mov	eax, [bp+var_8]
		les	bx, [bp+var_4]
		mov	es:[bx+10h], eax
		xor	eax, eax
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		mov	word ptr es:[bx+14h], 0
		mov	byte ptr es:[bx+16h], 0
		mov	ax, [bp+var_4]
		jmp	short loc_AAC91

loc_AAC8B:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_AAC91:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		push	0
		push	large 474D4144h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AACCD
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		cmp	word ptr es:[bx+6], 0FFFFh
		jnz	short loc_AACD6
		mov	byte ptr es:[bx+3], 1
		jmp	short loc_AACD6

loc_AACCD:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+6], 64h

loc_AACD6:
		push	0
		push	large 454D4E48h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAD34
		mov	di, [si+72h]
		push	1
		push	0
		push	2
		mov	ax, di
		inc	ax
		movsx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+41h], dx
		mov	es:[bx+3Fh], ax
		movsx	eax, di
		push	eax
		push	large es:[bx+3Fh]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+3Fh]
		add	bx, di
		mov	byte ptr es:[bx], 0

loc_AAD34:
		push	0
		push	large 54475254h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAD59
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], al
		jmp	short loc_AAD61

loc_AAD59:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+17h], 0

loc_AAD61:
		push	0
		push	large 4E474953h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AADA2
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+19h], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], al
		jmp	short loc_AADB4

loc_AADA2:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+18h], 0
		mov	byte ptr es:[bx+19h], 0
		mov	byte ptr es:[bx+1Ah], 0

loc_AADB4:
		push	0
		push	large 444E494Bh
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AADD9
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+35h], al
		jmp	short loc_AADE1

loc_AADD9:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+35h], 16h

loc_AADE1:
		push	0
		push	large 554C4156h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAE06
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+46h], ax
		jmp	short loc_AAE0F

loc_AAE06:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+46h], 0

loc_AAE0F:
		push	0
		push	large 4C505845h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAE5C
		push	1
		push	0
		push	2
		push	large 0Ch
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Dh], dx
		mov	es:[bx+1Bh], ax
		cmp	dword ptr es:[bx+1Bh], 0
		jz	short loc_AAE5C
		push	large 0Ch
		push	large es:[bx+1Bh]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_AAE5C:
		push	0
		push	large 534C5053h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAE7F
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Fh], ax

loc_AAE7F:
		push	0
		push	large 4C505344h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAEA2
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+21h], ax

loc_AAEA2:
		push	0
		push	large 52424544h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAF2B
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+23h], ax
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFEh
		mov	ebx, 1Ah
		cdq
		idiv	ebx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+25h], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+25h]
		imul	ax, ax, 1Ah
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+29h], dx
		mov	es:[bx+27h], ax
		cmp	dword ptr es:[bx+27h], 0
		jz	short loc_AAF2B
		mov	ax, es:[bx+25h]
		imul	ax, ax, 1Ah
		movzx	eax, ax
		push	eax
		push	large es:[bx+27h]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_AAF2B:
		push	0
		push	large 54534544h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AAFA2
		mov	eax, [si+72h]
		mov	ebx, 0Eh
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Bh], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+2Bh]
		imul	ax, ax, 0Eh
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Fh], dx
		mov	es:[bx+2Dh], ax
		cmp	dword ptr es:[bx+2Dh], 0
		jz	short loc_AAFA2
		mov	ax, es:[bx+2Bh]
		imul	ax, ax, 0Eh
		movzx	eax, ax
		push	eax
		push	large es:[bx+2Dh]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_AAFA2:
		push	0
		push	large 444C4843h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_AAFBA
		jmp	loc_AB163

loc_AAFBA:
		mov	eax, [si+72h]
		mov	ebx, 20h
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], ax
		push	seg stub297
		push	offset sub_741C5
		push	5
		movsx	eax, word ptr es:[bx+11h]
		push	eax
		push	large 390000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], dx
		mov	es:[bx+0Dh], ax
		mov	eax, es:[bx+0Dh]
		mov	[bp+var_C], eax
		mov	[bp+var_E], 0
		jmp	loc_AB154

loc_AB00C:
		push	large 20h
		push	ss
		lea	ax, [bp+var_3A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	8
		push	ss
		lea	ax, [bp+var_3A]
		push	ax
		push	large [bp+var_C]
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+var_C]
		mov	byte ptr es:[bx+8], 0
		mov	eax, [bp+var_32]
		mov	es:[bx+9], eax
		mov	eax, [bp+var_2E]
		mov	es:[bx+0Dh], eax
		mov	eax, [bp+var_2A]
		mov	es:[bx+11h], eax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 15h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	di, [bp+var_12]
		mov	eax, es:[di]
		mov	[bp+var_5E], eax
		mov	eax, es:[di+4]
		mov	[bp+var_5A], eax
		mov	eax, es:[di+8]
		mov	[bp+var_56], eax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 21h
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		les	di, [bp+var_16]
		mov	eax, es:[di]
		mov	[bp+var_52], eax
		mov	eax, es:[di+4]
		mov	[bp+var_4E], eax
		mov	eax, es:[di+8]
		mov	[bp+var_4A], eax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 2Dh
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		les	di, [bp+var_1A]
		mov	eax, es:[di]
		mov	[bp+var_46], eax
		mov	eax, es:[di+4]
		mov	[bp+var_42], eax
		mov	eax, es:[di+8]
		mov	[bp+var_3E], eax
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	Matrix_BuildFullOrientation_5937B
		add	sp, 8
		les	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_5E]
		mov	es:[bx+15h], eax
		mov	eax, [bp+var_5A]
		mov	es:[bx+19h], eax
		mov	eax, [bp+var_56]
		mov	es:[bx+1Dh], eax
		mov	eax, [bp+var_52]
		mov	es:[bx+21h], eax
		mov	eax, [bp+var_4E]
		mov	es:[bx+25h], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+29h], eax
		mov	eax, [bp+var_46]
		mov	es:[bx+2Dh], eax
		mov	eax, [bp+var_42]
		mov	es:[bx+31h], eax
		mov	eax, [bp+var_3E]
		mov	es:[bx+35h], eax
		add	word ptr [bp+var_C], 39h
		inc	[bp+var_E]

loc_AB154:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, [bp+var_E]
		jle	short loc_AB163
		jmp	loc_AB00C

loc_AB163:
		push	0
		push	large 44414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AB1CA
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+15h], ds
		mov	es:[bx+13h], ax
		push	large 8
		push	large es:[bx+13h]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+13h]
		mov	[bp+var_C], eax
		push	1
		push	1
		push	large [bp+var_C]
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	dx, ax
		or	dx, dx
		jz	short loc_AB1DC
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+44h], dx
		jmp	short loc_AB1DC

loc_AB1CA:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+13h], 0
		mov	word ptr es:[bx+44h], 0

loc_AB1DC:
		pop	di
		pop	si
		leave
		retf
sub_AAC15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB1E0		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 45545845h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_AB203
		jmp	loc_AB2B0

loc_AB203:
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+10h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+16h], al
		mov	word ptr es:[bx+14h], 0
		xor	di, di
		jmp	short loc_AB2AB

loc_AB240:
		push	si
		call	sub_7421F
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_AB2AA
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		inc	word ptr es:[bx+14h]
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jnz	short loc_AB280
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_AB2AA

loc_AB280:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+4]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		jmp	short loc_AB2AA

loc_AB2AA:
		inc	di

loc_AB2AB:
		cmp	di, [bp+var_2]
		jl	short loc_AB240

loc_AB2B0:
		pop	di
		pop	si
		leave
		retf
sub_AB1E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ListFindAndDispatch_9BECD (sub_9BECD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine LinkedListB_FindAndDispatch_5F5A4/Helper_5F6A9 (seg159).
; ==============================================================================================
Debris_ListFindAndDispatch_AB2B4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_AB2EB

loc_AB2C0:
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+4], 0
		jz	short loc_AB2DD
		push	3
		push	large [bx+4]
		les	bx, [bx+4]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_AB2DD

loc_AB2DD:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_AB2EB:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_AB2C0
		pop	si
		leave
		retf
Debris_ListFindAndDispatch_AB2B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ListAllocateAndInsert_9BF1D (sub_9BF1D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocation et LinkedListB_InsertAtTail_5F57F (seg159).
; ==============================================================================================
Debris_ListAllocateAndInsert_AB304		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_AB33E
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 16A4h
		mov	eax, [bp+var_6]
		mov	[di+4], eax
		mov	ax, di
		jmp	short loc_AB340

loc_AB33E:
		mov	ax, di

loc_AB340:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Debris_ListAllocateAndInsert_AB304		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB351		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	eax, eax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		mov	es:[bx+8], al
		mov	ax, [bp+arg_0]
		add	ax, 9
		mov	ax, [bp+arg_0]
		add	ax, 15h
		push	[bp+arg_2]
		push	ax
		call	HUD_EncodeHelper_59C71
		add	sp, 4
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_AB351		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AB387		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_AB3A3
		test	dx, 1
		jz	short loc_AB3A3
		push	ax
		call	sub_3B2
		pop	cx
		jmp	short loc_AB3A3

loc_AB3A3:
		pop	bp
		retf
sub_AB387		endp
ovr297		ends
