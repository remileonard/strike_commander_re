ovr352		segment	para public 'OVERLAY' use16
		assume cs:ovr352
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C4440		proc far

var_18C		= word ptr -18Ch
var_12F		= dword ptr -12Fh
var_12B		= dword ptr -12Bh
var_127		= dword ptr -127h
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_E4		= word ptr -0E4h
var_D6		= word ptr -0D6h
var_C4		= word ptr -0C4h
var_C2		= word ptr -0C2h
var_B0		= word ptr -0B0h
var_AE		= byte ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9C		= word ptr -9Ch
var_4C		= word ptr -4Ch
var_4A		= byte ptr -4Ah
var_49		= word ptr -49h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18Ch
		push	si
		push	di
		mov	byte_7D13E, 0
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	[bp+var_AA], 0
		mov	[bp+var_A8], 0
		mov	[bp+var_A6], 0
		mov	[bp+var_A4], 0
		mov	[bp+var_A2], 13Fh
		mov	[bp+var_A0], 0C7h
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_A], 0
		lea	ax, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	0
		push	word_7AF7C
		lea	ax, [bp+var_C4]
		push	ax
		call	sub_75D04
		add	sp, 6
		lea	ax, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_C2]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	[bp+var_AE], 4
		cmp	[bp+arg_2], 0
		jnz	short loc_C44E6
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_C44E6:
		xor	di, di
		mov	[bp+var_16], 0Ah
		mov	[bp+var_18], 8
		mov	[bp+var_1A], 8
		mov	[bp+var_1C], 8
		mov	[bp+var_1E], 0Ah
		mov	[bp+var_20], 0Ah
		mov	[bp+var_22], 0Fh
		mov	[bp+var_24], 0Ah
		mov	[bp+var_26], 96h
		mov	[bp+var_28], 0AAh
		mov	[bp+var_29], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_2B], 0
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aCredits
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_18C]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_18C], 508h
		mov	[bp+var_12B], 100h
		mov	[bp+var_12F], 0
		mov	[bp+var_18C], 520h
		push	1
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_18C]
		push	ax
		mov	bx, [bp+var_18C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 44455243h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C45C5
		jmp	loc_C4685

loc_C45C5:
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_16], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_18], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_1E], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_20], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_22], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_24], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_26], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_28], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_29], al
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_2A], al
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_2B], al
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax

loc_C4685:
		push	0
		push	large 544C4150h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C46A1
		jmp	loc_C480D

loc_C46A1:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	byte ptr [bp+var_36+3], al
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax
		xor	si, si
		jmp	loc_C47DF

loc_C46D3:
		push	1
		push	large 41544144h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3A], 2
		mov	byte ptr [bp+var_3A+1], 0
		mov	[bp+var_38], 0
		mov	eax, [bp+var_11A]
		mov	[bp+var_42], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2], dx
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[bp+var_3E], eax
		mov	byte ptr [bp+var_3A], 2
		mov	byte ptr [bp+var_3A+1], 1
		mov	[bp+var_38], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_38], eax
		push	0
		mov	al, byte ptr [bp+var_3A]
		push	ax
		push	large [bp+var_3E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	[bp+var_49], 0
		lea	ax, word ptr [bp+var_3E]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76272
		add	sp, 8
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	byte ptr [bp+var_3A+1], 0
		jz	short loc_C47CA
		cmp	[bp+var_3E], 0
		jz	short loc_C47CA
		push	0
		mov	al, byte ptr [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C47CA

loc_C47CA:
		mov	[bp+var_3E], 0
		mov	byte ptr [bp+var_3A+1], 0
		mov	[bp+var_38], 0
		inc	si

loc_C47DF:
		mov	al, byte ptr [bp+var_36+3]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_C47EB
		jmp	loc_C46D3

loc_C47EB:
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76259
		add	sp, 8
		jmp	short loc_C4816

loc_C480D:
		push	0D99Ch
		call	sub_1DDFE
		pop	cx

loc_C4816:
		push	0
		push	large 544E4F46h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C4832
		jmp	loc_C49A6

loc_C4832:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_F], al
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax
		push	seg stub253
		push	offset sub_735A5
		push	11h
		mov	al, [bp+var_F]
		mov	ah, 0
		push	ax
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_12], ax
		push	seg seg175
		push	offset GlyphObject_AllocateBuffer_69123
		push	11h
		mov	al, [bp+var_F]
		mov	ah, 0
		push	ax
		push	large 170000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_14], ax
		xor	si, si
		jmp	loc_C498E

loc_C48A2:
		push	1
		push	large 41544144h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		mov	eax, [bp+var_11A]
		mov	[bp+var_36], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_38], dx
		mov	word ptr [bp+var_3A], ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	ax, word ptr [bp+var_38]
		mov	dx, word ptr [bp+var_3A]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	byte ptr [bx+4], 2
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	byte ptr [bx+5], 1
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	eax, [bp+var_36]
		mov	[bx+6], eax
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+var_12]
		add	bx, ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+var_12]
		add	dx, ax
		push	dx
		mov	ax, si
		imul	ax, ax, 17h
		mov	dx, [bp+var_14]
		add	dx, ax
		push	dx
		call	sub_690A8
		add	sp, 4
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax
		inc	si

loc_C498E:
		mov	al, [bp+var_F]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_C499A
		jmp	loc_C48A2

loc_C499A:
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_C49AE

loc_C49A6:
		push	0D99Dh
		call	sub_1DDFE

loc_C49AE:
		pop	cx
		mov	[bp+var_2F], 0
		jmp	short loc_C49C6

loc_C49B5:
		mov	[bp+var_2F], 1
		inc	[bp+var_A]
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax

loc_C49C6:
		mov	al, [bp+var_2F]
		mov	ah, 0
		push	ax
		push	large 454E494Ch
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C49B5
		push	seg stub352
		push	offset sub_755F5
		push	11h
		push	[bp+var_A]
		push	large 160000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_8], ax
		mov	si, [bp+var_8]
		mov	[bp+var_2F], 0
		mov	[bp+var_32], 0
		jmp	loc_C4CF8

loc_C4A0E:
		mov	al, [bp+var_2F]
		mov	ah, 0
		push	ax
		push	large 454E494Ch
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		mov	[bp+var_2F], 1
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	byte ptr [bp+var_36+3], al
		cmp	byte ptr [bp+var_36+3], 2
		jnb	short loc_C4A69
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_36], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_38], ax
		add	di, word ptr [bp+var_36]
		mov	[si+2], di
		mov	ax, di
		add	ax, word ptr [bp+var_38]
		mov	[si+4], ax

loc_C4A69:
		cmp	byte ptr [bp+var_36+3], 0
		jz	short loc_C4A72
		jmp	loc_C4B10

loc_C4A72:
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_3A], ax
		mov	eax, [bp+var_11A]
		add	eax, 0FFFFFFF9h
		mov	[bp+var_3E], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_42+2], dx
		mov	word ptr [bp+var_42], ax
		mov	eax, [bp+var_42]
		mov	[si+0Bh], eax
		mov	byte ptr [si+0Fh], 3
		mov	byte ptr [si+10h], 1
		mov	dword ptr [si+11h], 0
		mov	eax, [bp+var_3E]
		mov	[si+11h], eax
		push	0
		mov	al, [si+0Fh]
		push	ax
		push	large [si+0Bh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	0
		call	Layer_ConstructAtOrigin_6687F
		add	sp, 4
		mov	dx, ax
		mov	bx, dx
		mov	ax, word ptr [bp+var_3A]
		mov	[bx+0Ch], ax
		mov	ax, [si+2]
		mov	[bx+0Eh], ax
		mov	[si+7], dx
		jmp	loc_C4CE8

loc_C4B10:
		cmp	byte ptr [bp+var_36+3], 8
		jnz	short loc_C4B39
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_36], ax
		add	di, word ptr [bp+var_36]
		mov	[si+2], di
		mov	ax, di
		add	ax, 0Fh
		mov	[si+4], ax
		mov	byte ptr [si+15h], 1
		jmp	loc_C4CE8

loc_C4B39:
		mov	dx, word ptr [bp+var_11A]
		add	dx, 0FFFFh
		mov	al, byte ptr [bp+var_36+3]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 6
		jbe	short loc_C4B50
		jmp	loc_C4C1D

loc_C4B50:
		shl	bx, 1
		jmp	cs:off_C4F80[bx]	; switch jump

loc_C4B57:
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	byte ptr [bp+var_3A+1], al
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_3E+2], ax
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	byte ptr [bp+var_3E+1], al
		mov	dx, word ptr [bp+var_11A]
		add	dx, 0FFF8h
		jmp	loc_C4C1D

loc_C4B8B:
		mov	byte ptr [bp+var_3A+1], 1
		mov	ax, [bp+var_26]
		mov	word ptr [bp+var_3E+2], ax
		mov	al, [bp+var_29]
		mov	byte ptr [bp+var_3E+1], al
		mov	ax, [bp+var_1E]

loc_C4B9E:
		mov	word ptr [bp+var_36], ax
		mov	ax, [bp+var_18]
		jmp	short loc_C4C1A

loc_C4BA6:
		mov	byte ptr [bp+var_3A+1], 2
		mov	ax, [bp+var_28]
		mov	word ptr [bp+var_3E+2], ax
		mov	al, [bp+var_2A]
		mov	byte ptr [bp+var_3E+1], al
		mov	ax, [bp+var_20]
		mov	word ptr [bp+var_36], ax
		jmp	short loc_C4BD3

loc_C4BBE:
		mov	byte ptr [bp+var_3A+1], 2
		mov	ax, [bp+var_28]
		mov	word ptr [bp+var_3E+2], ax
		mov	al, [bp+var_2A]
		mov	byte ptr [bp+var_3E+1], al
		mov	word ptr [bp+var_36], 0

loc_C4BD3:
		mov	ax, [bp+var_1A]
		jmp	short loc_C4C1A

loc_C4BD8:
		mov	byte ptr [bp+var_3A+1], 1
		mov	ax, [bp+var_26]
		mov	word ptr [bp+var_3E+2], ax
		mov	al, [bp+var_29]
		mov	byte ptr [bp+var_3E+1], al
		mov	ax, [bp+var_20]
		jmp	short loc_C4B9E

loc_C4BED:
		mov	byte ptr [bp+var_3A+1], 1
		mov	ax, [bp+var_26]
		mov	word ptr [bp+var_3E+2], ax
		mov	al, [bp+var_29]
		mov	byte ptr [bp+var_3E+1], al
		mov	ax, [bp+var_22]
		jmp	short loc_C4B9E

loc_C4C02:
		mov	byte ptr [bp+var_3A+1], 0
		mov	word ptr [bp+var_3E+2], 0A0h
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_3E+1], al
		mov	ax, [bp+var_24]
		mov	word ptr [bp+var_36], ax
		mov	ax, [bp+var_1C]

loc_C4C1A:
		mov	word ptr [bp+var_38], ax

loc_C4C1D:
		push	dx
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+9], ax
		push	ds
		push	word ptr [si+9]
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_ReadViaHelper_6DB52
		add	sp, 6
		mov	al, byte ptr [bp+var_3E+1]
		mov	ah, 0
		imul	ax, ax, 17h
		mov	dx, [bp+var_14]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C4]
		push	ax
		push	0
		call	sub_62B53
		add	sp, 6
		mov	word ptr [bp+var_42+2], ax
		cmp	byte ptr [bp+var_3A+1], 0
		jnz	short loc_C4C89
		mov	al, byte ptr [bp+var_3E+1]
		mov	ah, 0
		imul	ax, ax, 17h
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	word ptr [bp+var_42], dx
		mov	ax, word ptr [bp+var_42]
		mov	[bp+var_B0], ax
		push	word ptr [si+9]
		lea	ax, [bp+var_C4]
		push	ax
		call	sub_75D4F
		add	sp, 4
		sar	ax, 1
		jmp	short loc_C4CB6

loc_C4C89:
		cmp	byte ptr [bp+var_3A+1], 1
		jnz	short loc_C4CB9
		mov	al, byte ptr [bp+var_3E+1]
		mov	ah, 0
		imul	ax, ax, 17h
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	word ptr [bp+var_46+2], dx
		mov	ax, word ptr [bp+var_46+2]
		mov	[bp+var_B0], ax
		push	word ptr [si+9]
		lea	ax, [bp+var_C4]
		push	ax
		call	sub_75D4F
		add	sp, 4

loc_C4CB6:
		sub	word ptr [bp+var_3E+2], ax

loc_C4CB9:
		add	di, word ptr [bp+var_36]
		mov	[si+2], di
		mov	ax, di
		add	ax, word ptr [bp+var_38]
		mov	[si+4], ax
		mov	bx, word ptr [bp+var_42+2]
		mov	ax, word ptr [bp+var_3E+2]
		mov	[bx+0Ch], ax
		mov	ax, [si+2]
		mov	[bx+0Eh], ax
		push	word ptr [si+9]
		push	bx
		call	TextLayer_SetText_62A17
		add	sp, 4
		mov	ax, word ptr [bp+var_42+2]
		mov	[si+7], ax

loc_C4CE8:
		mov	eax, [bp+var_116]
		mov	[bp+var_127], eax
		inc	[bp+var_32]
		add	si, 16h

loc_C4CF8:
		mov	ax, [bp+var_32]
		cmp	ax, [bp+var_A]
		jnb	short loc_C4D03
		jmp	loc_C4A0E

loc_C4D03:
		mov	[bp+var_18C], 520h
		lea	ax, [bp+var_18C]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_18C]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_AA]
		push	ax
		push	0FFh
		push	[bp+var_16]
		lea	ax, [bp+var_E4]
		push	ax
		call	LayerGroup_Construct_66650
		add	sp, 8
		mov	[bp+var_D6], 0C8h
		mov	[bp+var_2C], 0
		mov	[bp+var_2E], 0
		call	sub_75750
		jmp	loc_C4EE7

loc_C4D52:
		mov	[bp+var_2F], 0
		mov	[bp+var_30], 0
		mov	ax, [bp+var_2E]
		imul	ax, ax, 16h
		mov	si, [bp+var_8]
		add	si, ax
		mov	byte ptr [bp+var_32], 0
		mov	di, [bp+var_2E]
		jmp	short loc_C4DE4

loc_C4D6E:
		cmp	[bp+var_30], 0
		jnz	short loc_C4DE9
		cmp	byte ptr [si+6], 0
		jnz	short loc_C4DAE
		mov	ax, [bp+var_D6]
		add	ax, [si+2]
		cmp	ax, 0C8h
		jge	short loc_C4DA8
		cmp	byte ptr [si+15h], 0
		jz	short loc_C4D92
		mov	[bp+var_2F], 1
		jmp	short loc_C4DA2

loc_C4D92:
		push	word ptr [si+7]
		lea	ax, [bp+var_E4]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_C4DA2:
		mov	byte ptr [si+6], 1
		jmp	short loc_C4DDA

loc_C4DA8:
		mov	[bp+var_30], 1
		jmp	short loc_C4DDA

loc_C4DAE:
		cmp	byte ptr [si+6], 1
		jnz	short loc_C4DDA
		mov	ax, [bp+var_D6]
		add	ax, [si+4]
		jge	short loc_C4DDA
		cmp	word ptr [si+7], 0
		jz	short loc_C4DD3
		push	word ptr [si+7]
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_665AB
		add	sp, 4

loc_C4DD3:
		mov	byte ptr [si+6], 2
		mov	[bp+var_2E], di

loc_C4DDA:
		mov	al, [si+6]
		mov	byte ptr [bp+var_32], al
		inc	di
		add	si, 16h

loc_C4DE4:
		cmp	di, [bp+var_A]
		jb	short loc_C4D6E

loc_C4DE9:
		call	sub_75755
		call	sub_7575F
		or	al, al
		jz	short loc_C4DFB
		mov	[bp+var_2C], 1

loc_C4DFB:
		push	[bp+arg_2]
		lea	ax, [bp+var_AA]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_66770
		pop	cx
		lea	ax, [bp+var_AA]
		push	ax
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		cmp	[bp+var_2F], 0
		jnz	short loc_C4E30
		jmp	loc_C4ED9

loc_C4E30:
		xor	eax, eax
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		mov	[bp+var_36], 4B0h
		mov	eax, dword_7B29D
		mov	[bp+var_3A], eax
		jmp	short loc_C4E56

loc_C4E4D:
		call	sub_7575F
		or	al, al
		jnz	short loc_C4E72

loc_C4E56:
		mov	eax, [bp+var_3A]
		add	eax, [bp+var_36]
		cmp	eax, dword_7B29D
		ja	short loc_C4E6A
		mov	ax, 1
		jmp	short loc_C4E6C

loc_C4E6A:
		xor	ax, ax

loc_C4E6C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C4E4D

loc_C4E72:
		mov	byte ptr [bp+var_3E], 0
		mov	byte ptr [bp+var_3E+1], 0
		mov	byte ptr [bp+var_3E+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_46+2]
		push	ax
		call	sub_76245
		add	sp, 6
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_46+2]
		push	ax
		call	sub_76272
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_46+2]
		push	ax
		call	sub_76286
		add	sp, 0Ah
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	[bp+var_2C], 1
		lea	ax, word ptr [bp+var_46+2]
		push	ax
		call	sub_7627C
		pop	cx

loc_C4ED9:
		cmp	byte ptr [bp+var_32], 2
		jnz	short loc_C4EE3
		mov	[bp+var_2C], 1

loc_C4EE3:
		dec	[bp+var_D6]

loc_C4EE7:
		mov	al, [bp+var_2C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C4EF3
		jmp	loc_C4D52

loc_C4EF3:
		push	seg seg175
		push	offset sub_69368
		push	large 190000h
		push	17h
		push	[bp+var_14]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 190000h
		push	0Ah
		push	[bp+var_12]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub352
		push	offset sub_755F0
		push	large 190000h
		push	16h
		push	[bp+var_8]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		call	SoundFX_StopAll_5EE28
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		lea	ax, [bp+var_C2]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_AA]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_6]
		push	ax
		call	sub_7627C
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_C4440		endp

; START OF FUNCTION CHUNK FOR sub_C4440
off_C4F80	dw offset loc_C4B57
		dw offset loc_C4B8B
		dw offset loc_C4BA6
		dw offset loc_C4BBE
		dw offset loc_C4BD8
		dw offset loc_C4BED
		dw offset loc_C4C02
; END OF FUNCTION CHUNK FOR sub_C4440

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C4F8E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C4FA7
		push	16h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_C4FD5

loc_C4FA7:
		mov	word ptr [si], 399Ch
		mov	dword ptr [si+0Bh], 0
		mov	byte ptr [si+0Fh], 2
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+6], 0
		mov	word ptr [si+7], 0
		mov	word ptr [si+9], 0
		mov	byte ptr [si+15h], 0

loc_C4FD5:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C4F8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C4FDA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C5066
		mov	word ptr [si], 399Ch
		cmp	word ptr [si+7], 0
		jz	short loc_C5010
		cmp	byte ptr [si+6], 1
		jz	short loc_C5010
		cmp	word ptr [si+7], 0
		jz	short loc_C5010
		push	3
		push	word ptr [si+7]
		mov	bx, [si+7]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_C5010

loc_C5010:
		cmp	word ptr [si+9], 0
		jz	short loc_C501F
		push	word ptr [si+9]
		call	sub_3B2
		pop	cx

loc_C501F:
		cmp	byte ptr [si+10h], 0
		jz	short loc_C5045
		cmp	dword ptr [si+0Bh], 0
		jz	short loc_C5045
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C5045

loc_C5045:
		mov	dword ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		test	di, 1
		jz	short loc_C5066
		push	si
		call	sub_3B2
		pop	cx

loc_C5066:
		pop	di
		pop	si
		pop	bp
		retf
sub_C4FDA		endp
ovr352		ends
