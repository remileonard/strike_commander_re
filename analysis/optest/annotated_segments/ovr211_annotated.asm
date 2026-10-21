ovr211		segment	para public 'OVERLAY' use16
		assume cs:ovr211
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BDE10	proc far		; CODE XREF: sub_4268AJ

var_192		= word ptr -192h
var_135		= dword	ptr -135h
var_131		= dword	ptr -131h
var_12D		= dword	ptr -12Dh
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
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
var_4F		= dword	ptr -4Fh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
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
		mov	byte_495FC, 0
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_B0], 0
		mov	[bp+var_AE], 0
		mov	[bp+var_AC], 0
		mov	[bp+var_AA], 0
		mov	[bp+var_A8], 13Fh
		mov	[bp+var_A6], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		mov	[bp+var_A], 0
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	[bp+var_F], 0
		push	0
		push	word_46F44
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_B4], 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
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
		mov	[bp+var_28], 96h ; '�'
		mov	[bp+var_2A], 0AAh ; '�'
		mov	[bp+var_2B], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_2D], 0
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aCredits_0 ; "credits"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_192], 556h
		mov	[bp+var_131], 100h
		mov	[bp+var_135], 0
		mov	[bp+var_192], 56Eh
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
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_BDF82
		jmp	loc_BE05C
; ���������������������������������������������������������������������������

loc_BDF82:				; CODE XREF: sub_BDE10+16Dj
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_18], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_1E], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_20], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_22], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_24], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_26], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_28], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2A], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2B], al
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2C], al
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2D], al
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax

loc_BE05C:				; CODE XREF: sub_BDE10+16Fj
		push	0
		push	large 544C4150h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_BE078
		jmp	loc_BE1F0
; ���������������������������������������������������������������������������

loc_BE078:				; CODE XREF: sub_BDE10+263j
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_3A+1],	al
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		xor	di, di
		jmp	loc_BE1C0
; ���������������������������������������������������������������������������

loc_BE0AC:				; CODE XREF: sub_BDE10+3B9j
		push	1
		push	large 41544144h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	[bp+var_46+2], 0
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1],	0
		mov	[bp+var_40+2], 0
		mov	eax, [bp+var_120]
		mov	[bp+var_4A+2], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4A+2]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4A], dx
		mov	word ptr [bp+var_4F+3],	ax
		mov	eax, [bp+var_4F+3]
		mov	[bp+var_46+2], eax
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1],	1
		mov	[bp+var_40+2], 0
		mov	eax, [bp+var_4A+2]
		mov	[bp+var_40+2], eax
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		push	word ptr [bp+var_42]
		push	word ptr [bp+var_46+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		mov	word ptr [bp+var_4F], 0
		lea	ax, [bp+var_46+2]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_52]
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		push	2
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_40+1],	0
		jz	short loc_BE1AB
		cmp	[bp+var_46+2], 0
		jz	short loc_BE1AB
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_46+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BE1AB:				; CODE XREF: sub_BDE10+37Bj
					; sub_BDE10+382j
		mov	[bp+var_46+2], 0
		mov	byte ptr [bp+var_40+1],	0
		mov	[bp+var_40+2], 0
		inc	di

loc_BE1C0:				; CODE XREF: sub_BDE10+299j
		mov	al, byte ptr [bp+var_3A+1]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_BE1CC
		jmp	loc_BE0AC
; ���������������������������������������������������������������������������

loc_BE1CC:				; CODE XREF: sub_BDE10+3B7j
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		jmp	short loc_BE1FB
; ���������������������������������������������������������������������������

loc_BE1F0:				; CODE XREF: sub_BDE10+265j
		push	2974h
		call	sub_310B
		add	sp, 2

loc_BE1FB:				; CODE XREF: sub_BDE10+3DEj
		push	0
		push	large 544E4F46h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_BE217
		jmp	loc_BE3A2
; ���������������������������������������������������������������������������

loc_BE217:				; CODE XREF: sub_BDE10+402j
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_F], al
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	11h
		mov	al, [bp+var_F]
		mov	ah, 0
		push	ax
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_12], ax
		push	seg seg108
		push	offset GlyphObject_AllocateBuffer_31191
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
		jmp	loc_BE387
; ���������������������������������������������������������������������������

loc_BE285:				; CODE XREF: sub_BDE10+580j
		push	1
		push	large 41544144h
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	eax, [bp+var_120]
		mov	dword ptr [bp+var_3C], eax
		push	1
		push	0
		push	2
		push	large dword ptr	[bp+var_3C]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_40+2],	dx
		mov	word ptr [bp+var_40], ax
		mov	ax, di
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	ax, word ptr [bp+var_40+2]
		mov	dx, word ptr [bp+var_40]
		mov	[bx+2],	ax
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
		mov	eax, dword ptr [bp+var_3C]
		mov	[bx+6],	eax
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
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
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
		call	GlyphObject_ComputeMetrics_3111E
		add	sp, 4
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		inc	di

loc_BE387:				; CODE XREF: sub_BDE10+472j
		mov	al, [bp+var_F]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_BE393
		jmp	loc_BE285
; ���������������������������������������������������������������������������

loc_BE393:				; CODE XREF: sub_BDE10+57Ej
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_BE3AD
; ���������������������������������������������������������������������������

loc_BE3A2:				; CODE XREF: sub_BDE10+404j
		push	297Fh
		call	sub_310B
		add	sp, 2

loc_BE3AD:				; CODE XREF: sub_BDE10+590j
		cmp	[bp+arg_0], 1
		jz	short loc_BE3B6
		jmp	loc_BE566
; ���������������������������������������������������������������������������

loc_BE3B6:				; CODE XREF: sub_BDE10+5A1j
		mov	byte ptr [bp+var_3C], 0
		mov	byte ptr [bp+var_3C+1],	0
		mov	byte ptr [bp+var_3A], 0
		push	100h
		push	0
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	word ptr [bp+var_42]
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	word ptr [bp+var_42]
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	ax, word_46F46
		mov	word ptr [bp+var_46+2],	ax
		push	word ptr [bp+var_46+2]
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, [bp+var_14]
		mov	word ptr [bp+var_46], ax
		mov	ax, word ptr [bp+var_46]
		mov	[bp+var_B6], ax
		mov	[bp+var_B4], 2
		push	61h ; 'a'
		push	0A0h ; '�'
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	2989h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		xor	eax, eax
		mov	[bp+var_4A], eax
		mov	[bp+var_4F+1], eax
		mov	dword ptr [bp-4Ah], 12Ch
		mov	eax, dword_47ABB
		mov	[bp+var_4F+1], eax
		call	Input_Flush_CDDC
		jmp	short loc_BE48D
; ���������������������������������������������������������������������������

loc_BE482:				; CODE XREF: sub_BDE10+697j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BE48D
		jmp	short loc_BE4A9
; ���������������������������������������������������������������������������

loc_BE48D:				; CODE XREF: sub_BDE10+670j
					; sub_BDE10+679j
		mov	eax, [bp+var_4F+1]
		add	eax, [bp-4Ah]
		cmp	eax, dword_47ABB
		ja	short loc_BE4A1
		mov	ax, 1
		jmp	short loc_BE4A3
; ���������������������������������������������������������������������������

loc_BE4A1:				; CODE XREF: sub_BDE10+68Aj
		xor	ax, ax

loc_BE4A3:				; CODE XREF: sub_BDE10+68Fj
		mov	ah, 0
		or	ax, ax
		jz	short loc_BE482

loc_BE4A9:				; CODE XREF: sub_BDE10+67Bj
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	seg seg108
		push	offset GlyphObject_ScalarDeletingDtorA_313D6
		push	19h
		push	0
		push	17h
		push	[bp+var_14]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_12]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		mov	[bp+var_192], 56Eh
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_E]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_B0]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BE566:				; CODE XREF: sub_BDE10+5A3j
		mov	[bp+var_35], 0
		jmp	short loc_BE57D
; ���������������������������������������������������������������������������

loc_BE56C:				; CODE XREF: sub_BDE10+788j
		mov	[bp+var_35], 1
		inc	[bp+var_A]
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax

loc_BE57D:				; CODE XREF: sub_BDE10+75Aj
		mov	al, [bp+var_35]
		mov	ah, 0
		push	ax
		push	large 454E494Ch
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_BE56C
		push	seg stub211
		push	offset sub_42685
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
		jmp	loc_BE8F6
; ���������������������������������������������������������������������������

loc_BE5C3:				; CODE XREF: sub_BDE10+AEEj
		mov	al, [bp+var_35]
		mov	ah, 0
		push	ax
		push	large 454E494Ch
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	[bp+var_35], 1
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_3A+1],	al
		cmp	byte ptr [bp+var_3A+1],	2
		jnb	short loc_BE62B
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3C], ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word ptr [bp+var_40+2],	ax
		mov	ax, [bp+var_3C]
		add	[bp+var_16], ax
		mov	ax, [bp+var_16]
		mov	[si+2],	ax
		mov	ax, [bp+var_16]
		add	ax, word ptr [bp+var_40+2]
		mov	[si+4],	ax

loc_BE62B:				; CODE XREF: sub_BDE10+7E4j
		cmp	byte ptr [bp+var_3A+1],	0
		jz	short loc_BE634
		jmp	loc_BE6D6
; ���������������������������������������������������������������������������

loc_BE634:				; CODE XREF: sub_BDE10+81Fj
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_120]
		add	eax, 0FFFFFFF9h
		mov	[bp+var_46+2], eax
		push	1
		push	0
		push	2
		push	large [bp+var_46+2]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_46], dx
		mov	word ptr [bp+var_4A+2],	ax
		mov	eax, [bp+var_4A+2]
		mov	[si+0Bh], eax
		mov	byte ptr [si+0Fh], 2
		mov	byte ptr [si+10h], 1
		mov	dword ptr [si+11h], 0
		mov	eax, [bp+var_46+2]
		mov	[si+11h], eax
		push	0
		mov	al, [si+0Fh]
		push	ax
		push	word ptr [si+0Dh]
		push	word ptr [si+0Bh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	0
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	di, ax
		mov	ax, word ptr [bp+var_40]
		mov	[di+0Ch], ax
		mov	ax, [si+2]
		mov	[di+0Eh], ax
		mov	[si+7],	di
		jmp	loc_BE8E6
; ���������������������������������������������������������������������������

loc_BE6D6:				; CODE XREF: sub_BDE10+821j
		cmp	byte ptr [bp+var_3A+1],	8
		jnz	short loc_BE708
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_3C]
		add	[bp+var_16], ax
		mov	ax, [bp+var_16]
		mov	[si+2],	ax
		mov	ax, [bp+var_16]
		add	ax, 0Fh
		mov	[si+4],	ax
		mov	byte ptr [si+15h], 1
		jmp	loc_BE8E6
; ���������������������������������������������������������������������������

loc_BE708:				; CODE XREF: sub_BDE10+8CAj
		mov	ax, word ptr [bp+var_120]
		add	ax, 0FFFFh
		mov	word ptr [bp+var_42], ax
		mov	al, byte ptr [bp+var_3A+1]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 6		; switch 7 cases
		jbe	short loc_BE722
		jmp	loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE722:				; CODE XREF: sub_BDE10+90Dj
		shl	bx, 1
		jmp	cs:off_BEE0B[bx] ; switch jump

loc_BE729:				; DATA XREF: ovr211:off_BEE0Bo
		lea	ax, [bp+var_192] ; case	0x0
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_40+1],	al
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	di, ax
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_40], al
		mov	ax, word ptr [bp+var_120]
		add	ax, 0FFF8h
		mov	word ptr [bp+var_42], ax
		jmp	loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE765:				; CODE XREF: sub_BDE10+914j
					; DATA XREF: ovr211:off_BEE0Bo
		mov	byte ptr [bp+var_40+1],	1 ; case 0x1
		mov	di, [bp+var_28]
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_20]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_40+2],	ax
		jmp	loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE781:				; CODE XREF: sub_BDE10+914j
					; DATA XREF: ovr211:off_BEE0Bo
		mov	byte ptr [bp+var_40+1],	2 ; case 0x2
		mov	di, [bp+var_2A]
		mov	al, [bp+var_2C]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_22]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_1C]
		mov	word ptr [bp+var_40+2],	ax
		jmp	short loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE79C:				; CODE XREF: sub_BDE10+914j
					; DATA XREF: ovr211:off_BEE0Bo
		mov	byte ptr [bp+var_40+1],	2 ; case 0x3
		mov	di, [bp+var_2A]
		mov	al, [bp+var_2C]
		mov	byte ptr [bp+var_40], al
		mov	[bp+var_3C], 0
		mov	ax, [bp+var_1C]
		mov	word ptr [bp+var_40+2],	ax
		jmp	short loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE7B6:				; CODE XREF: sub_BDE10+914j
					; DATA XREF: ovr211:off_BEE0Bo
		mov	byte ptr [bp+var_40+1],	1 ; case 0x4
		mov	di, [bp+var_28]
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_22]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_40+2],	ax
		jmp	short loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE7D1:				; CODE XREF: sub_BDE10+914j
					; DATA XREF: ovr211:off_BEE0Bo
		mov	byte ptr [bp+var_40+1],	1 ; case 0x5
		mov	di, [bp+var_28]
		mov	al, [bp+var_2B]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_24]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_40+2],	ax
		jmp	short loc_BE807	; default
; ���������������������������������������������������������������������������

loc_BE7EC:				; CODE XREF: sub_BDE10+914j
					; DATA XREF: ovr211:off_BEE0Bo
		mov	byte ptr [bp+var_40+1],	0 ; case 0x6
		mov	di, 0A0h ; '�'
		mov	al, [bp+var_2D]
		mov	byte ptr [bp+var_40], al
		mov	ax, [bp+var_26]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_1E]
		mov	word ptr [bp+var_40+2],	ax
		jmp	short $+2

loc_BE807:				; CODE XREF: sub_BDE10+90Fj
					; sub_BDE10+952j ...
		push	word ptr [bp+var_42] ; default
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+9],	ax
		push	ds
		push	word ptr [si+9]
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_ReadViaHelper_3C349
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
		call	sub_AEF4
		add	sp, 6
		mov	word ptr [bp+var_46+2],	ax
		cmp	byte ptr [bp+var_40+1],	0
		jnz	short loc_BE87D
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
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		sar	ax, 1
		sub	di, ax
		jmp	short loc_BE8AE
; ���������������������������������������������������������������������������

loc_BE87D:				; CODE XREF: sub_BDE10+A3Cj
		cmp	byte ptr [bp+var_40+1],	1
		jnz	short loc_BE8AE
		mov	al, byte ptr [bp+var_40]
		mov	ah, 0
		mov	dx, 17h
		imul	dx
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	word ptr [bp+var_4A+2],	dx
		mov	ax, word ptr [bp+var_4A+2]
		mov	[bp+var_B6], ax
		push	word ptr [si+9]
		lea	ax, [bp+var_CA]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		sub	di, ax

loc_BE8AE:				; CODE XREF: sub_BDE10+A6Bj
					; sub_BDE10+A71j
		mov	ax, [bp+var_3C]
		add	[bp+var_16], ax
		mov	ax, [bp+var_16]
		mov	[si+2],	ax
		mov	ax, [bp+var_16]
		add	ax, word ptr [bp+var_40+2]
		mov	[si+4],	ax
		mov	bx, word ptr [bp+var_46+2]
		mov	[bx+0Ch], di
		mov	ax, [si+2]
		mov	bx, word ptr [bp+var_46+2]
		mov	[bx+0Eh], ax
		push	word ptr [si+9]
		push	word ptr [bp+var_46+2]
		call	TextLayer_SetText_ADB7
		add	sp, 4
		mov	ax, word ptr [bp+var_46+2]
		mov	[si+7],	ax

loc_BE8E6:				; CODE XREF: sub_BDE10+8C3j
					; sub_BDE10+8F5j
		mov	eax, [bp+var_11C]
		mov	[bp+var_12D], eax
		inc	[bp+var_38]
		add	si, 16h

loc_BE8F6:				; CODE XREF: sub_BDE10+7B0j
		mov	ax, [bp+var_38]
		cmp	ax, [bp+var_A]
		jnb	short loc_BE901
		jmp	loc_BE5C3
; ���������������������������������������������������������������������������

loc_BE901:				; CODE XREF: sub_BDE10+AECj
		mov	[bp+var_192], 56Eh
		lea	ax, [bp+var_192]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	[bp+var_2E], 0
		mov	al, byte_46848
		mov	[bp+var_30], al
		mov	al, [bp+var_30]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_BE93E
		cmp	ax, 2
		jz	short loc_BE95D
		jmp	short loc_BE97C
; ���������������������������������������������������������������������������

loc_BE93E:				; CODE XREF: sub_BDE10+B25j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_2E], 1
		jmp	short loc_BE97C
; ���������������������������������������������������������������������������

loc_BE95D:				; CODE XREF: sub_BDE10+B2Aj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_2E], 1
		jmp	short $+2

loc_BE97C:				; CODE XREF: sub_BDE10+B2Cj
					; sub_BDE10+B4Bj
		cmp	[bp+var_2E], 0
		jz	short loc_BE991
		push	18h
		lea	ax, [bp+var_A2]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4

loc_BE991:				; CODE XREF: sub_BDE10+B70j
		push	word_46F46
		push	0
		push	[bp+var_18]
		lea	ax, [bp+var_EA]
		push	ax
		call	LayerGroup_Construct_2DC66
		add	sp, 8
		mov	[bp+var_DC], 0C8h ; '�'
		mov	[bp+var_31], 0
		mov	[bp+var_34], 0
		call	Input_Flush_CDDC
		jmp	loc_BEB42
; ���������������������������������������������������������������������������

loc_BE9BE:				; CODE XREF: sub_BDE10+D3Bj
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
		jmp	short loc_BEA58
; ���������������������������������������������������������������������������

loc_BE9DE:				; CODE XREF: sub_BDE10+C4Bj
		cmp	[bp+var_36], 0
		jz	short loc_BE9E8
		jmp	short loc_BEA5D
; ���������������������������������������������������������������������������
		jmp	short loc_BEA4E
; ���������������������������������������������������������������������������

loc_BE9E8:				; CODE XREF: sub_BDE10+BD2j
		cmp	byte ptr [si+6], 0
		jnz	short loc_BEA22
		mov	ax, [bp+var_DC]
		add	ax, [si+2]
		cmp	ax, 0C8h ; '�'
		jge	short loc_BEA1C
		cmp	byte ptr [si+15h], 0
		jz	short loc_BEA06
		mov	[bp+var_35], 1
		jmp	short loc_BEA16
; ���������������������������������������������������������������������������

loc_BEA06:				; CODE XREF: sub_BDE10+BEEj
		push	word ptr [si+7]
		lea	ax, [bp+var_EA]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_BEA16:				; CODE XREF: sub_BDE10+BF4j
		mov	byte ptr [si+6], 1
		jmp	short loc_BEA20
; ���������������������������������������������������������������������������

loc_BEA1C:				; CODE XREF: sub_BDE10+BE8j
		mov	[bp+var_36], 1

loc_BEA20:				; CODE XREF: sub_BDE10+C0Aj
		jmp	short loc_BEA4E
; ���������������������������������������������������������������������������

loc_BEA22:				; CODE XREF: sub_BDE10+BDCj
		cmp	byte ptr [si+6], 1
		jnz	short loc_BEA4E
		mov	ax, [bp+var_DC]
		add	ax, [si+4]
		jge	short loc_BEA4E
		cmp	word ptr [si+7], 0
		jz	short loc_BEA47
		push	word ptr [si+7]
		lea	ax, [bp+var_EA]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4

loc_BEA47:				; CODE XREF: sub_BDE10+C25j
		mov	byte ptr [si+6], 2
		mov	[bp+var_34], di

loc_BEA4E:				; CODE XREF: sub_BDE10+BD6j
					; sub_BDE10:loc_BEA20j	...
		mov	al, [si+6]
		mov	byte ptr [bp+var_38], al
		inc	di
		add	si, 16h

loc_BEA58:				; CODE XREF: sub_BDE10+BCCj
		cmp	di, [bp+var_A]
		jb	short loc_BE9DE

loc_BEA5D:				; CODE XREF: sub_BDE10+BD4j
		call	sub_D157
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BEA6F
		mov	[bp+var_31], 1

loc_BEA6F:				; CODE XREF: sub_BDE10+C59j
		lea	ax, [bp+var_EA]
		push	ax
		call	sub_2DD86
		add	sp, 2
		cmp	[bp+var_35], 0
		jnz	short loc_BEA85
		jmp	loc_BEB34
; ���������������������������������������������������������������������������

loc_BEA85:				; CODE XREF: sub_BDE10+C70j
		xor	eax, eax
		mov	dword ptr [bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	dword ptr [bp-3Ch], 4B0h
		mov	eax, dword_47ABB
		mov	[bp+var_40], eax
		jmp	short loc_BEAAD
; ���������������������������������������������������������������������������

loc_BEAA2:				; CODE XREF: sub_BDE10+CB7j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BEAAD
		jmp	short loc_BEAC9
; ���������������������������������������������������������������������������

loc_BEAAD:				; CODE XREF: sub_BDE10+C90j
					; sub_BDE10+C99j
		mov	eax, [bp+var_40]
		add	eax, [bp-3Ch]
		cmp	eax, dword_47ABB
		ja	short loc_BEAC1
		mov	ax, 1
		jmp	short loc_BEAC3
; ���������������������������������������������������������������������������

loc_BEAC1:				; CODE XREF: sub_BDE10+CAAj
		xor	ax, ax

loc_BEAC3:				; CODE XREF: sub_BDE10+CAFj
		mov	ah, 0
		or	ax, ax
		jz	short loc_BEAA2

loc_BEAC9:				; CODE XREF: sub_BDE10+C9Bj
		mov	byte ptr [bp+var_46+2],	0
		mov	byte ptr [bp+var_46+3],	0
		mov	[bp+var_42], 0
		push	100h
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_46+2]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_31], 1
		push	0
		lea	ax, [bp+var_4A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4

loc_BEB34:				; CODE XREF: sub_BDE10+C72j
		cmp	byte ptr [bp+var_38], 2
		jnz	short loc_BEB3E
		mov	[bp+var_31], 1

loc_BEB3E:				; CODE XREF: sub_BDE10+D28j
		dec	[bp+var_DC]

loc_BEB42:				; CODE XREF: sub_BDE10+BABj
		mov	al, [bp+var_31]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BEB4E
		jmp	loc_BE9BE
; ���������������������������������������������������������������������������

loc_BEB4E:				; CODE XREF: sub_BDE10+D39j
		mov	byte ptr [bp+var_38], 0
		mov	byte ptr [bp+var_38+1],	0
		mov	[bp+var_36], 0
		mov	ax, [bp+var_3]
		mov	[bp+var_3C], ax
		push	32h ; '2'
		push	32h ; '2'
		push	32h ; '2'
		push	ds
		push	[bp+var_3C]
		call	sub_FA5F
		add	sp, 0Ah
		mov	[bp+var_3A], ax
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aConvfont_4 ; "convfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], ax
		mov	eax, [bp+var_4A]
		mov	[bp-46h], eax
		mov	[bp+var_42], 2
		mov	[bp+var_41], 1
		mov	[bp+var_40], 0
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	al, byte ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	sub_3139A
		add	sp, 4
		lea	ax, [bp+var_102]
		mov	[bp+var_B6], ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_4F+3],	ax
		push	word ptr [bp+var_4F+3]
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_B4], 2
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_52]
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	[bp+var_52]
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	3Ch ; '<'
		push	299Ah
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 6
		push	4Bh ; 'K'
		push	29AFh
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 6
		push	large [dword_48E19]
		push	5Ah ; 'Z'
		push	29D1h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		push	7Dh ; '}'
		push	29D7h
		lea	ax, [bp+var_CA]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 6
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		mov	byte_495FC, 0
		call	Input_Flush_CDDC
		jmp	short $+2

loc_BECEA:				; CODE XREF: sub_BDE10+EE3j
		call	Input_CheckSkip_D24A
		mov	ah, 0
		or	ax, ax
		jz	short loc_BECEA
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_52]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_102]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_BED64
		cmp	[bp+var_46], 0
		jz	short loc_BED64
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BED64:				; CODE XREF: sub_BDE10+F34j
					; sub_BDE10+F3Bj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	seg seg108
		push	offset GlyphObject_ScalarDeletingDtorA_313D6
		push	19h
		push	0
		push	17h
		push	[bp+var_14]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_12]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub211
		push	offset sub_42680
		push	19h
		push	0
		push	16h
		push	[bp+var_8]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		call	sub_28D49
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C8]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_E]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_B0]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BDE10	endp

; ���������������������������������������������������������������������������
off_BEE0B	dw offset loc_BE729	; DATA XREF: sub_BDE10+914r
		dw offset loc_BE765	; jump table for switch	statement
		dw offset loc_BE781
		dw offset loc_BE79C
		dw offset loc_BE7B6
		dw offset loc_BE7D1
		dw offset loc_BE7EC

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BEE19	proc far		; CODE XREF: sub_42685J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_BEE34
		push	16h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BEE62

loc_BEE34:				; CODE XREF: sub_BEE19+9j
		mov	word ptr [si], 29EAh
		mov	dword ptr [si+0Bh], 0
		mov	byte ptr [si+0Fh], 2
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+6], 0
		mov	word ptr [si+7], 0
		mov	word ptr [si+9], 0
		mov	byte ptr [si+15h], 0

loc_BEE62:				; CODE XREF: sub_BEE19+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_BEE19	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BEE6A	proc far		; CODE XREF: sub_42680J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_BEE7C
		jmp	loc_BEEFD
; ���������������������������������������������������������������������������

loc_BEE7C:				; CODE XREF: sub_BEE6A+Dj
		mov	word ptr [si], 29EAh
		cmp	word ptr [si+7], 0
		jz	short loc_BEEA3
		cmp	byte ptr [si+6], 1
		jz	short loc_BEEA3
		cmp	word ptr [si+7], 0
		jz	short loc_BEEA3
		push	3
		push	word ptr [si+7]
		mov	bx, [si+7]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_BEEA3:				; CODE XREF: sub_BEE6A+1Aj
					; sub_BEE6A+20j ...
		cmp	word ptr [si+9], 0
		jz	short loc_BEEB4
		push	word ptr [si+9]
		call	sub_308
		add	sp, 2

loc_BEEB4:				; CODE XREF: sub_BEE6A+3Dj
		cmp	byte ptr [si+10h], 0
		jz	short loc_BEEDA
		cmp	dword ptr [si+0Bh], 0
		jz	short loc_BEEDA
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BEEDA:				; CODE XREF: sub_BEE6A+4Ej
					; sub_BEE6A+55j
		mov	dword ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		test	di, 1
		jz	short loc_BEEFD
		push	si
		call	sub_308
		add	sp, 2

loc_BEEFD:				; CODE XREF: sub_BEE6A+Fj
					; sub_BEE6A+88j
		pop	di
		pop	si
		pop	bp
		retf
sub_BEE6A	endp

ovr211		ends
