ovr215		segment	para public 'OVERLAY' use16
		assume cs:ovr215
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5750		proc far

var_192		= word ptr -192h
var_135		= dword ptr -135h
var_131		= dword ptr -131h
var_12D		= dword ptr -12Dh
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_102		= word ptr -102h
var_EA		= word ptr -0EAh
var_DC		= word ptr -0DCh
var_CA		= word ptr -0CAh
var_C8		= word ptr -0C8h
var_B6		= word ptr -0B6h
var_B4		= byte ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A2		= word ptr -0A2h
var_52		= word ptr -52h
var_50		= byte ptr -50h
var_4F		= word ptr -4Fh
var_4E		= dword ptr -4Eh
var_4C		= dword ptr -4Ch
var_4A		= dword ptr -4Ah
var_48		= dword ptr -48h
var_46		= dword ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= byte ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= word ptr -2Ah
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
var_3		= word ptr -3
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 192h
		push	si
		push	di
		mov	byte_4F55C, 0
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_B0], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_AC], 0
		mov	[bp+var_AA], 0
		mov	[bp+var_A8], 13Fh
		mov	[bp+var_A6], 0C7h
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		mov	[bp+var_A], 0
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	[bp+var_F], 0
		push	0
		push	word_4D36C
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_B4], 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	[bp+var_16], 0
		mov	[bp+var_18], 0Ah
		mov	[bp+var_1A], 8
		mov	[bp+var_1C], 8
		mov	[bp+var_1E], 8
		mov	[bp+var_20], 0Ah
		mov	[bp+var_22], 0Ah
		mov	[bp+var_24], 0Fh
		mov	[bp+var_26], 0Ah
		mov	[bp+var_28], 96h
		mov	[bp+var_2A], 0AAh
		mov	[bp+var_2B], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_2D], 0
		push	ds
		push	offset aIff
		push	ds
		push	offset aTocredts
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_192], 480h
		mov	[bp+var_131], 100h
		mov	[bp+var_135], 0
		mov	[bp+var_192], 498h
		push	1
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		mov	bx, [bp+var_192]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 44455243h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_B58C2
		jmp	loc_B599C

loc_B58C2:
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_18], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_1E], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_20], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_22], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_24], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_26], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_28], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2A], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2B], al
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2C], al
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2D], al
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax

loc_B599C:
		push	0
		push	large 544C4150h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_B59B8
		jmp	loc_B5B2E

loc_B59B8:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_3C+3], al
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		xor	di, di
		jmp	loc_B5AFE

loc_B59EC:
		push	1
		push	large 41544144h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		mov	eax, [bp+var_120]
		mov	[bp+var_48], eax
		push	1
		push	0
		push	2
		push	large [bp+var_48]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_4A], dx
		mov	word ptr [bp+var_4C], ax
		mov	eax, [bp+var_4C]
		mov	[bp+var_44], eax
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1], 1
		mov	[bp+var_3E], 0
		mov	eax, [bp+var_48]
		mov	[bp+var_3E], eax
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		push	word ptr [bp+var_44+2]
		push	word ptr [bp+var_44]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		mov	[bp+var_4F], 0
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_52]
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_40+1], 0
		jz	short loc_B5AE9
		cmp	[bp+var_44], 0
		jz	short loc_B5AE9
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B5AE9

loc_B5AE9:
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		inc	di

loc_B5AFE:
		mov	al, byte ptr [bp+var_3C+3]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_B5B0A
		jmp	loc_B59EC

loc_B5B0A:
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		jmp	short loc_B5B39

loc_B5B2E:
		push	2F9Dh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_B5B39:
		push	0
		push	large 544E4F46h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_B5B55
		jmp	loc_B5CE0

loc_B5B55:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_F], al
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		push	seg stub192
		push	offset sub_479E5
		push	11h
		mov	al, [bp+var_F]
		mov	ah, 0
		push	ax
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_12], ax
		push	seg seg125
		push	offset GlyphObject_AllocateBuffer_36D18
		push	11h
		mov	al, [bp+var_F]
		mov	ah, 0
		push	ax
		push	17h
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_14], ax
		xor	di, di
		jmp	loc_B5CC5

loc_B5BC3:
		push	1
		push	large 41544144h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	eax, [bp+var_120]
		mov	[bp+var_3C], eax
		push	1
		push	0
		push	2
		push	large [bp+var_3C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_3E], dx
		mov	word ptr [bp+var_40], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	ax, word ptr [bp+var_3E]
		mov	dx, word ptr [bp+var_40]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	byte ptr [bx+4], 2
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	byte ptr [bx+5], 1
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	eax, [bp+var_3C]
		mov	[bx+6], eax
		push	0
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_12]
		add	dx, ax
		push	dx
		mov	ax, di
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_14]
		add	dx, ax
		push	dx
		call	sub_36C9D
		add	sp, 4
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		inc	di

loc_B5CC5:
		mov	al, [bp+var_F]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_B5CD1
		jmp	loc_B5BC3

loc_B5CD1:
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_B5CEB

loc_B5CE0:
		push	2FA8h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_B5CEB:
		cmp	[bp+arg_0], 1
		jz	short loc_B5CF4
		jmp	loc_B5E9E

loc_B5CF4:
		mov	byte ptr [bp+var_3C], 0
		mov	byte ptr [bp+var_3C+1], 0
		mov	byte ptr [bp+var_3C+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_44+2]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	word ptr [bp+var_44+2]
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_44+2]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	word ptr [bp+var_44+2]
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44+2]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	ax, word_4D36E
		mov	word ptr [bp+var_44], ax
		push	word ptr [bp+var_44]
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, [bp+var_14]
		mov	word ptr [bp+var_46], ax
		mov	ax, word ptr [bp+var_46]
		mov	[bp+var_B6], ax
		mov	[bp+var_B4], 2
		push	61h
		push	0A0h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	2FB2h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		xor	eax, eax
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 12Ch
		mov	eax, dword_4DE15
		mov	[bp+var_4E], eax
		call	Input_Flush_116D1
		jmp	short loc_B5DCB

loc_B5DC0:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B5DCB
		jmp	short loc_B5DE7

loc_B5DCB:
		mov	eax, [bp+var_4E]
		add	eax, [bp+var_4A]
		cmp	eax, dword_4DE15
		ja	short loc_B5DDF
		mov	ax, 1
		jmp	short loc_B5DE1

loc_B5DDF:
		xor	ax, ax

loc_B5DE1:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B5DC0

loc_B5DE7:
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	seg seg125
		push	offset GlyphObject_ScalarDeletingDtorA_36F5D
		push	19h
		push	0
		push	17h
		push	[bp+var_14]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_12]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, word ptr [bp+var_44+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		mov	[bp+var_192], 498h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_E]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_B0]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

loc_B5E9E:
		mov	[bp+var_35], 0
		jmp	short loc_B5EB5

loc_B5EA4:
		mov	[bp+var_35], 1
		inc	[bp+var_A]
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax

loc_B5EB5:
		mov	al, [bp+var_35]
		mov	ah, 0
		push	ax
		push	large 454E494Ch
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_B5EA4
		push	seg stub215
		push	offset sub_47FB5
		push	11h
		push	[bp+var_A]
		push	16h
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_8], ax
		mov	si, [bp+var_8]
		mov	[bp+var_35], 0
		mov	[bp+var_38], 0
		jmp	loc_B622E

loc_B5EFB:
		mov	al, [bp+var_35]
		mov	ah, 0
		push	ax
		push	large 454E494Ch
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		mov	[bp+var_35], 1
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_3C+3], al
		cmp	byte ptr [bp+var_3C+3], 2
		jnb	short loc_B5F63
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word ptr [bp+var_3C], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word ptr [bp+var_3E], ax
		mov	ax, word ptr [bp+var_3C]
		add	[bp+var_16], ax
		mov	ax, [bp+var_16]
		mov	[si+2], ax
		mov	ax, [bp+var_16]
		add	ax, word ptr [bp+var_3E]
		mov	[si+4], ax

loc_B5F63:
		cmp	byte ptr [bp+var_3C+3], 0
		jz	short loc_B5F6C
		jmp	loc_B600E

loc_B5F6C:
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_120]
		add	eax, 0FFFFFFF9h
		mov	[bp+var_44], eax
		push	1
		push	0
		push	2
		push	large [bp+var_44]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_46], dx
		mov	word ptr [bp+var_48], ax
		mov	eax, [bp+var_48]
		mov	[si+0Bh], eax
		mov	byte ptr [si+0Fh], 2
		mov	byte ptr [si+10h], 1
		mov	dword ptr [si+11h], 0
		mov	eax, [bp+var_44]
		mov	[si+11h], eax
		push	0
		mov	al, [si+0Fh]
		push	ax
		push	word ptr [si+0Dh]
		push	word ptr [si+0Bh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	0
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	di, ax
		mov	ax, word ptr [bp+var_40]
		mov	[di+0Ch], ax
		mov	ax, [si+2]
		mov	[di+0Eh], ax
		mov	[si+7], di
		jmp	loc_B621E

loc_B600E:
		cmp	byte ptr [bp+var_3C+3], 8
		jnz	short loc_B6040
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	word ptr [bp+var_3C], ax
		mov	ax, word ptr [bp+var_3C]
		add	[bp+var_16], ax
		mov	ax, [bp+var_16]
		mov	[si+2], ax
		mov	ax, [bp+var_16]
		add	ax, 0Fh
		mov	[si+4], ax
		mov	byte ptr [si+15h], 1
		jmp	loc_B621E

loc_B6040:
		mov	ax, word ptr [bp+var_120]
		add	ax, 0FFFFh
		mov	word ptr [bp+var_44+2], ax
		mov	al, byte ptr [bp+var_3C+3]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 6
		jbe	short loc_B605A
		jmp	loc_B613F

loc_B605A:
		shl	bx, 1
		jmp	cs:off_B6767[bx]	; switch jump

loc_B6061:
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_40+1], al
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_40], al
		mov	ax, word ptr [bp+var_120]
		add	ax, 0FFF8h
		mov	word ptr [bp+var_44+2], ax
		jmp	loc_B613F

loc_B609D:
		mov	byte ptr [bp+var_40+1], 1
		mov	di, [bp+var_28]
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_20]
		mov	word ptr [bp+var_3C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_3E], ax
		jmp	loc_B613F

loc_B60B9:
		mov	byte ptr [bp+var_40+1], 2
		mov	di, [bp+var_2A]
		mov	al, [bp+var_2C]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_22]
		mov	word ptr [bp+var_3C], ax
		mov	ax, [bp+var_1C]
		mov	word ptr [bp+var_3E], ax
		jmp	short loc_B613F

loc_B60D4:
		mov	byte ptr [bp+var_40+1], 2
		mov	di, [bp+var_2A]
		mov	al, [bp+var_2C]
		mov	byte ptr [bp+var_40], al
		mov	word ptr [bp+var_3C], 0
		mov	ax, [bp+var_1C]
		mov	word ptr [bp+var_3E], ax
		jmp	short loc_B613F

loc_B60EE:
		mov	byte ptr [bp+var_40+1], 1
		mov	di, [bp+var_28]
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_22]
		mov	word ptr [bp+var_3C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_3E], ax
		jmp	short loc_B613F

loc_B6109:
		mov	byte ptr [bp+var_40+1], 1
		mov	di, [bp+var_28]
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_24]
		mov	word ptr [bp+var_3C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_3E], ax
		jmp	short loc_B613F

loc_B6124:
		mov	byte ptr [bp+var_40+1], 0
		mov	di, 0A0h
		mov	al, [bp+var_2D]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_26]
		mov	word ptr [bp+var_3C], ax
		mov	ax, [bp+var_1E]
		mov	word ptr [bp+var_3E], ax
		jmp	short loc_B613F

loc_B613F:
		push	word ptr [bp+var_44+2]
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+9], ax
		push	ds
		push	word ptr [si+9]
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadViaHelper_42AEC
		add	sp, 6
		mov	al, byte ptr [bp+var_40]
		mov	ah, 0
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_14]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_CA]
		push	ax
		push	0
		call	sub_F745
		add	sp, 6
		mov	word ptr [bp+var_44], ax
		cmp	byte ptr [bp+var_40+1], 0
		jnz	short loc_B61B5
		mov	al, byte ptr [bp+var_40]
		mov	ah, 0
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	word ptr [bp+var_46], dx
		mov	ax, word ptr [bp+var_46]
		mov	[bp+var_B6], ax
		push	word ptr [si+9]
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_375EF
		add	sp, 4
		sar	ax, 1
		sub	di, ax
		jmp	short loc_B61E6

loc_B61B5:
		cmp	byte ptr [bp+var_40+1], 1
		jnz	short loc_B61E6
		mov	al, byte ptr [bp+var_40]
		mov	ah, 0
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	word ptr [bp+var_48], dx
		mov	ax, word ptr [bp+var_48]
		mov	[bp+var_B6], ax
		push	word ptr [si+9]
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_375EF
		add	sp, 4
		sub	di, ax

loc_B61E6:
		mov	ax, word ptr [bp+var_3C]
		add	[bp+var_16], ax
		mov	ax, [bp+var_16]
		mov	[si+2], ax
		mov	ax, [bp+var_16]
		add	ax, word ptr [bp+var_3E]
		mov	[si+4], ax
		mov	bx, word ptr [bp+var_44]
		mov	[bx+0Ch], di
		mov	ax, [si+2]
		mov	bx, word ptr [bp+var_44]
		mov	[bx+0Eh], ax
		push	word ptr [si+9]
		push	word ptr [bp+var_44]
		call	TextLayer_SetText_F608
		add	sp, 4
		mov	ax, word ptr [bp+var_44]
		mov	[si+7], ax

loc_B621E:
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		inc	[bp+var_38]
		add	si, 16h

loc_B622E:
		mov	ax, [bp+var_38]
		cmp	ax, [bp+var_A]
		jnb	short loc_B6239
		jmp	loc_B5EFB

loc_B6239:
		mov	[bp+var_192], 498h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	[bp+var_2E], 0
		mov	al, byte_4CA58
		mov	[bp+var_30], al
		mov	al, [bp+var_30]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_B62D6
		shl	bx, 1
		jmp	cs:off_B675D[bx]	; switch jump

loc_B6279:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_2E], 1
		jmp	short loc_B62D6

loc_B6298:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_2E], 1
		jmp	short loc_B62D6

loc_B62B7:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_2E], 1
		jmp	short loc_B62D6

loc_B62D6:
		cmp	[bp+var_2E], 0
		jz	short loc_B62EB
		push	18h
		lea	ax, [bp+var_A2]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4

loc_B62EB:
		push	word_4D36E
		push	0
		push	[bp+var_18]
		lea	ax, [bp+var_EA]
		push	ax
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	[bp+var_DC], 0C8h
		mov	[bp+var_31], 0
		mov	[bp+var_34], 0
		call	Input_Flush_116D1
		jmp	loc_B649A

loc_B6318:
		mov	[bp+var_35], 0
		mov	[bp+var_36], 0
		mov	ax, [bp+var_34]
		mov	dx, 16h
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		mov	si, dx
		mov	byte ptr [bp+var_38], 0
		mov	di, [bp+var_34]
		jmp	short loc_B63B2

loc_B6338:
		cmp	[bp+var_36], 0
		jz	short loc_B6342
		jmp	short loc_B63B7
		jmp	short loc_B63A8

loc_B6342:
		cmp	byte ptr [si+6], 0
		jnz	short loc_B637C
		mov	ax, [bp+var_DC]
		add	ax, [si+2]
		cmp	ax, 0C8h
		jge	short loc_B6376
		cmp	byte ptr [si+15h], 0
		jz	short loc_B6360
		mov	[bp+var_35], 1
		jmp	short loc_B6370

loc_B6360:
		push	word ptr [si+7]
		lea	ax, [bp+var_EA]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_B6370:
		mov	byte ptr [si+6], 1
		jmp	short loc_B637A

loc_B6376:
		mov	[bp+var_36], 1

loc_B637A:
		jmp	short loc_B63A8

loc_B637C:
		cmp	byte ptr [si+6], 1
		jnz	short loc_B63A8
		mov	ax, [bp+var_DC]
		add	ax, [si+4]
		jge	short loc_B63A8
		cmp	word ptr [si+7], 0
		jz	short loc_B63A1
		push	word ptr [si+7]
		lea	ax, [bp+var_EA]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4

loc_B63A1:
		mov	byte ptr [si+6], 2
		mov	[bp+var_34], di

loc_B63A8:
		mov	al, [si+6]
		mov	byte ptr [bp+var_38], al
		inc	di
		add	si, 16h

loc_B63B2:
		cmp	di, [bp+var_A]
		jb	short loc_B6338

loc_B63B7:
		call	sub_11A88
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B63C9
		mov	[bp+var_31], 1

loc_B63C9:
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_33DD2
		add	sp, 2
		cmp	[bp+var_35], 0
		jnz	short loc_B63DF
		jmp	loc_B648C

loc_B63DF:
		xor	eax, eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 4B0h
		mov	eax, dword_4DE15
		mov	[bp+var_40], eax
		jmp	short loc_B6407

loc_B63FC:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_B6407
		jmp	short loc_B6423

loc_B6407:
		mov	eax, [bp+var_40]
		add	eax, [bp+var_3C]
		cmp	eax, dword_4DE15
		ja	short loc_B641B
		mov	ax, 1
		jmp	short loc_B641D

loc_B641B:
		xor	ax, ax

loc_B641D:
		mov	ah, 0
		or	ax, ax
		jz	short loc_B63FC

loc_B6423:
		mov	byte ptr [bp+var_44], 0
		mov	byte ptr [bp+var_44+1], 0
		mov	byte ptr [bp+var_44+2], 0
		push	100h
		push	0
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	[bp+var_31], 1
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2

loc_B648C:
		cmp	byte ptr [bp+var_38], 2
		jnz	short loc_B6496
		mov	[bp+var_31], 1

loc_B6496:
		dec	[bp+var_DC]

loc_B649A:
		mov	al, [bp+var_31]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B64A6
		jmp	loc_B6318

loc_B64A6:
		mov	byte ptr [bp+var_38], 0
		mov	byte ptr [bp+var_38+1], 0
		mov	[bp+var_36], 0
		mov	ax, [bp+var_3]
		mov	word ptr [bp+var_3C], ax
		push	32h
		push	32h
		push	32h
		push	ds
		push	word ptr [bp+var_3C]
		call	sub_145E3
		add	sp, 0Ah
		mov	word ptr [bp+var_3C+2], ax
		push	ds
		push	offset aShp
		push	ds
		push	offset aConvfont_4
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+2], 2
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_48], dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_46], eax
		mov	byte ptr [bp+var_44+2], 2
		mov	byte ptr [bp+var_44+3], 1
		mov	[bp+var_40], 0
		lea	ax, word ptr [bp+var_46]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	al, byte ptr [bp+var_3C+2]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	MidgameEngine_3139A_36F21
		add	sp, 4
		lea	ax, [bp+var_102]
		mov	[bp+var_B6], ax
		mov	ax, word_4D36E
		mov	word ptr [bp+var_4C], ax
		push	word ptr [bp+var_4C]
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	[bp+var_B4], 2
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_52]
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	[bp+var_52]
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	3Ch
		push	2FC3h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 6
		push	4Bh
		push	2FD8h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 6
		push	large dword_4EEA0
		push	5Ah
		push	2FFAh
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	7Dh
		push	3000h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 6
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_FadeFromColor_34EEE
		add	sp, 0Ah
		mov	byte_4F55C, 0
		call	Input_Flush_116D1
		jmp	short loc_B6642

loc_B6642:
		call	Input_CheckSkip_11B90
		mov	ah, 0
		or	ax, ax
		jz	short loc_B6642
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_FadeToColor_34E29
		add	sp, 0Ah
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_102]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_B66BA
		cmp	[bp+var_46], 0
		jz	short loc_B66BA
		push	0
		mov	al, byte ptr [bp+var_44+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B66BA

loc_B66BA:
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_44+3], 0
		mov	[bp+var_40], 0
		push	seg seg125
		push	offset GlyphObject_ScalarDeletingDtorA_36F5D
		push	19h
		push	0
		push	17h
		push	[bp+var_14]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_12]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub215
		push	offset sub_47FB0
		push	19h
		push	0
		push	16h
		push	[bp+var_8]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		call	sub_2DA30
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_E]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_B0]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_B5750		endp

; START OF FUNCTION CHUNK FOR sub_B5750
off_B675D	dw offset loc_B6279
		dw offset loc_B62B7
		dw offset loc_B6298
		dw offset loc_B62B7
		dw offset loc_B62B7
off_B6767	dw offset loc_B6061
		dw offset loc_B609D
		dw offset loc_B60B9
		dw offset loc_B60D4
		dw offset loc_B60EE
		dw offset loc_B6109
		dw offset loc_B6124
; END OF FUNCTION CHUNK FOR sub_B5750

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6775		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B6790
		push	16h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B67BE

loc_B6790:
		mov	word ptr [si], 3013h
		mov	dword ptr [si+0Bh], 0
		mov	byte ptr [si+0Fh], 2
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+6], 0
		mov	word ptr [si+7], 0
		mov	word ptr [si+9], 0
		mov	byte ptr [si+15h], 0

loc_B67BE:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B6775		endp

; START OF FUNCTION CHUNK FOR sub_B6775
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B6775

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B67C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B67D8
		jmp	loc_B6859

loc_B67D8:
		mov	word ptr [si], 3013h
		cmp	word ptr [si+7], 0
		jz	short loc_B67FF
		cmp	byte ptr [si+6], 1
		jz	short loc_B67FF
		cmp	word ptr [si+7], 0
		jz	short loc_B67FF
		push	3
		push	word ptr [si+7]
		mov	bx, [si+7]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_B67FF

loc_B67FF:
		cmp	word ptr [si+9], 0
		jz	short loc_B6810
		push	word ptr [si+9]
		call	sub_39C
		add	sp, 2

loc_B6810:
		cmp	byte ptr [si+10h], 0
		jz	short loc_B6836
		cmp	dword ptr [si+0Bh], 0
		jz	short loc_B6836
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B6836

loc_B6836:
		mov	dword ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		test	di, 1
		jz	short loc_B6859
		push	si
		call	sub_39C
		add	sp, 2

loc_B6859:
		pop	di
		pop	si
		pop	bp
		retf
sub_B67C6		endp
ovr215		ends
