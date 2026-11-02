ovr190		segment	para public 'OVERLAY' use16
		assume cs:ovr190
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54290		proc far

var_2EE		= word ptr -2EEh
var_276		= word ptr -276h
var_23A		= word ptr -23Ah
var_239		= word ptr -239h
var_226		= word ptr -226h
var_224		= word ptr -224h
var_222		= word ptr -222h
var_220		= word ptr -220h
var_21E		= dword ptr -21Eh
var_21A		= byte ptr -21Ah
var_218		= word ptr -218h
var_216		= word ptr -216h
var_202		= byte ptr -202h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F8		= word ptr -1F8h
var_1F6		= word ptr -1F6h
var_1F4		= word ptr -1F4h
var_1F0		= word ptr -1F0h
var_1E0		= word ptr -1E0h
var_1DE		= word ptr -1DEh
var_1DC		= word ptr -1DCh
var_1D8		= word ptr -1D8h
var_160		= word ptr -160h
var_E8		= word ptr -0E8h
var_98		= word ptr -98h
var_97		= word ptr -97h
var_84		= word ptr -84h
var_83		= word ptr -83h
var_70		= word ptr -70h
var_6F		= word ptr -6Fh
var_5B		= byte ptr -5Bh
var_5A		= word ptr -5Ah
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= word ptr -56h
var_52		= word ptr -52h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_40		= word ptr -40h
var_3E		= byte ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= byte ptr -38h
var_37		= word ptr -37h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2EEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	Input_Flush_116D1
		mov	byte ptr [bp+var_70], 0
		mov	byte ptr [bp+var_84], 0
		mov	byte ptr [bp+var_98], 0
		mov	[bp+var_2], 5Bh
		mov	[bp+var_4], 61h
		mov	[bp+var_6], 39h
		mov	[bp+var_8], 0AEh
		mov	[bp+var_A], 61h
		mov	[bp+var_C], 32h
		mov	[bp+var_E], 7Ch
		mov	[bp+var_10], 67h
		mov	[bp+var_12], 62h
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_54341
		shl	bx, 1
		jmp	cs:off_54DED[bx]	; switch jump

loc_542F0:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_54341

loc_5430B:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_54341

loc_54326:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_54341

loc_54341:
		push	1Ah
		lea	ax, [bp+var_E8]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1D8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0A0h
		lea	ax, [bp+var_160]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	1Eh
		lea	ax, [bp+var_1D8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	ds
		push	offset aShp
		push	ds
		push	offset aFormfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_E8]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_34+2], dx
		mov	word ptr [bp+var_34], ax
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 1
		mov	[bp+var_2A], 0
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_1F0]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_1E0], 1
		mov	[bp+var_1DE], 0
		push	2Dh
		lea	ax, [bp+var_1F0]
		push	ax
		mov	bx, [bp+var_1F0]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_1DC], ax
		mov	[bp+var_37], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_40]
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_1FE], 0
		mov	[bp+var_1FC], 0
		mov	[bp+var_1FA], 0
		mov	[bp+var_1F8], 0
		mov	[bp+var_1F6], 13Fh
		mov	[bp+var_1F4], 0C7h
		push	0
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	sub_3499B
		add	sp, 4
		lea	ax, [bp+var_1F0]
		push	ax
		lea	ax, [bp+var_1FE]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	[bp+var_202], 4
		mov	[bp+var_4E], 0
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		mov	[bp+var_222], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_220], ax
		lea	ax, [bp+var_222]
		mov	word_4D392, ax
		mov	[bp+var_222], 1BCh
		mov	[bp+var_21E], 0
		mov	[bp+var_21A], 0
		mov	[bp+var_226], 0
		mov	[bp+var_224], 0FFFFh
		cmp	word_4CA5D, 0
		jnz	short loc_54593
		jmp	loc_54640

loc_54593:
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_545DD
		shl	bx, 1
		jmp	cs:off_54DE3[bx]	; switch jump

loc_545A7:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_276]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_545DD

loc_545C2:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAsoundfx
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_276]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_545DD

loc_545DD:
		cmp	word_4CA5D, 0
		jz	short loc_54640
		push	1
		lea	ax, [bp+var_276]
		push	ax
		lea	ax, [bp+var_2EE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	6Ah
		lea	ax, [bp+var_2EE]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	word_4CA5D
		lea	ax, [bp+var_226]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_226]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		push	2
		lea	ax, [bp+var_2EE]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_54640:
		xor	di, di
		jmp	loc_54B60

loc_54645:
		push	0
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1FE]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		or	di, di
		jnz	short loc_546C8
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	815h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	81Dh
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_98]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	824h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		jmp	loc_5476F

loc_546C8:
		cmp	di, 1
		jnz	short loc_5471F
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	82Bh
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	832h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_98]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	83Ah
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		jmp	short loc_5476F

loc_5471F:
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	841h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	848h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_98]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	84Fh
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah

loc_5476F:
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_45C38
		mov	[bp+var_57], 0

loc_54788:
		call	sub_11A88
		push	0FFh
		lea	ax, [bp+var_56]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte ptr [bp+var_56], 0
		jz	short loc_547B6
		cmp	byte_4F6FC, 1
		jz	short loc_547B0
		cmp	byte_4F708, 1
		jnz	short loc_547B4

loc_547B0:
		mov	[bp+var_57], 1

loc_547B4:
		jmp	short loc_547B8

loc_547B6:
		jmp	short loc_54788

loc_547B8:
		mov	al, byte ptr [bp+var_56+1]
		mov	[bp+var_58], al
		cmp	[bp+var_58], 0Eh
		jz	short loc_547C7
		jmp	loc_54849

loc_547C7:
		cmp	byte ptr [bp+var_56], 1
		jz	short loc_547D3
		cmp	byte ptr [bp+var_56], 4
		jnz	short loc_54849

loc_547D3:
		or	di, di
		jnz	short loc_547F6
		cmp	byte ptr [bp+var_70], 0
		jz	short loc_547F4
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_70]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_547F4:
		jmp	short loc_54846

loc_547F6:
		cmp	di, 1
		jnz	short loc_54821
		cmp	byte ptr [bp+var_84], 0
		jz	short loc_5481D
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_84]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_5481F

loc_5481D:
		xor	di, di

loc_5481F:
		jmp	short loc_54846

loc_54821:
		cmp	byte ptr [bp+var_98], 0
		jz	short loc_54843
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_98]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_54846

loc_54843:
		mov	di, 1

loc_54846:
		jmp	loc_54B60

loc_54849:
		cmp	[bp+var_58], 1Ch
		jz	short loc_54855
		cmp	[bp+var_58], 0Fh
		jnz	short loc_54893

loc_54855:
		cmp	byte ptr [bp+var_56], 2
		jnz	short loc_54893
		or	di, di
		jnz	short loc_5486A
		cmp	byte ptr [bp+var_70], 0
		jz	short loc_5486A
		mov	di, 1
		jmp	short loc_54890

loc_5486A:
		cmp	di, 1
		jnz	short loc_5487B
		cmp	byte ptr [bp+var_84], 0
		jz	short loc_5487B
		mov	di, 2
		jmp	short loc_54890

loc_5487B:
		cmp	di, 2
		jnz	short loc_54890
		cmp	byte ptr [bp+var_98], 0
		jz	short loc_54890
		cmp	[bp+var_58], 1Ch
		jnz	short loc_54890
		mov	di, 3

loc_54890:
		jmp	loc_54B60

loc_54893:
		cmp	byte ptr [bp+var_56], 1
		jz	short loc_548A2
		cmp	byte ptr [bp+var_56], 4
		jz	short loc_548A2
		jmp	loc_54B60

loc_548A2:
		cmp	[bp+var_58], 10h
		jb	short loc_548AE
		cmp	[bp+var_58], 19h
		jbe	short loc_548CF

loc_548AE:
		cmp	[bp+var_58], 1Eh
		jb	short loc_548BA
		cmp	[bp+var_58], 26h
		jbe	short loc_548CF

loc_548BA:
		cmp	[bp+var_58], 2Ch
		jb	short loc_548C6
		cmp	[bp+var_58], 32h
		jbe	short loc_548CF

loc_548C6:
		cmp	[bp+var_58], 39h
		jz	short loc_548CF
		jmp	loc_54B60

loc_548CF:
		mov	al, [bp+var_58]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+5468h]
		cbw
		mov	[bp+var_5A], ax
		cmp	[bp+var_5A], 61h
		jl	short loc_548EA
		cmp	[bp+var_5A], 7Ah
		jle	short loc_548FF

loc_548EA:
		cmp	[bp+var_5A], 41h
		jl	short loc_548F6
		cmp	[bp+var_5A], 5Ah
		jle	short loc_548FF

loc_548F6:
		cmp	[bp+var_5A], 20h
		jz	short loc_548FF
		jmp	loc_54B60

loc_548FF:
		cmp	[bp+var_57], 0
		jz	short loc_5490F
		cmp	[bp+var_5A], 20h
		jz	short loc_5490F
		sub	[bp+var_5A], 20h

loc_5490F:
		or	di, di
		jz	short loc_54916
		jmp	loc_549D1

loc_54916:
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		cmp	ax, 0Fh
		jb	short loc_5492A
		jmp	loc_549D1

loc_5492A:
		cmp	byte ptr [bp+var_70], 0
		jnz	short loc_54939
		cmp	[bp+var_5A], 20h
		jnz	short loc_54939
		jmp	loc_549CE

loc_54939:
		cmp	[bp+var_226], 0
		jz	short loc_54955
		push	[bp+var_224]
		mov	bx, [bp+var_226]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_54955

loc_54955:
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_5B], al
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_23A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_23A]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_239]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	sub_375EF
		add	sp, 4
		cmp	ax, [bp+var_6]
		jg	short loc_549CE
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_70]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_6F]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_549CE:
		jmp	loc_54B60

loc_549D1:
		cmp	di, 1
		jz	short loc_549D9
		jmp	loc_54A9A

loc_549D9:
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		cmp	ax, 0Fh
		jb	short loc_549EE
		jmp	loc_54A9A

loc_549EE:
		cmp	byte ptr [bp+var_84], 0
		jnz	short loc_549FE
		cmp	[bp+var_5A], 20h
		jnz	short loc_549FE
		jmp	loc_54A97

loc_549FE:
		cmp	[bp+var_226], 0
		jz	short loc_54A1A
		push	[bp+var_224]
		mov	bx, [bp+var_226]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_54A1A

loc_54A1A:
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_5B], al
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_23A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_23A]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_239]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	sub_375EF
		add	sp, 4
		cmp	ax, [bp+var_C]
		jg	short loc_54A97
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_84]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_83]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_54A97:
		jmp	loc_54B60

loc_54A9A:
		cmp	di, 2
		jz	short loc_54AA2
		jmp	loc_54B60

loc_54AA2:
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		cmp	ax, 0Fh
		jb	short loc_54AB7
		jmp	loc_54B60

loc_54AB7:
		cmp	byte ptr [bp+var_98], 0
		jnz	short loc_54AC7
		cmp	[bp+var_5A], 20h
		jnz	short loc_54AC7
		jmp	loc_54B60

loc_54AC7:
		cmp	[bp+var_226], 0
		jz	short loc_54AE3
		push	[bp+var_224]
		mov	bx, [bp+var_226]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_54AE3

loc_54AE3:
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_5B], al
		lea	ax, [bp+var_98]
		push	ax
		lea	ax, [bp+var_23A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_23A]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_239]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	sub_375EF
		add	sp, 4
		cmp	ax, [bp+var_12]
		jg	short loc_54B60
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_98]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_97]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_54B60:
		cmp	di, 3
		jz	short loc_54B68
		jmp	loc_54645

loc_54B68:
		mov	[bp+var_4F], 1
		jmp	short loc_54B9C

loc_54B6E:
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_52], ax
		lea	ax, [bp+var_70]
		mov	bx, [bp+var_52]
		add	bx, ax
		cmp	byte ptr [bx], 20h
		jnz	short loc_54B98
		lea	ax, [bp+var_70]
		mov	bx, [bp+var_52]
		add	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_54B9C

loc_54B98:
		mov	[bp+var_4F], 0

loc_54B9C:
		cmp	[bp+var_4F], 0
		jnz	short loc_54B6E
		mov	[bp+var_4F], 1
		jmp	short loc_54BD9

loc_54BA8:
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_52], ax
		lea	ax, [bp+var_84]
		mov	bx, [bp+var_52]
		add	bx, ax
		cmp	byte ptr [bx], 20h
		jnz	short loc_54BD5
		lea	ax, [bp+var_84]
		mov	bx, [bp+var_52]
		add	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_54BD9

loc_54BD5:
		mov	[bp+var_4F], 0

loc_54BD9:
		cmp	[bp+var_4F], 0
		jnz	short loc_54BA8
		mov	[bp+var_4F], 1
		jmp	short loc_54C16

loc_54BE5:
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_52], ax
		lea	ax, [bp+var_98]
		mov	bx, [bp+var_52]
		add	bx, ax
		cmp	byte ptr [bx], 20h
		jnz	short loc_54C12
		lea	ax, [bp+var_98]
		mov	bx, [bp+var_52]
		add	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_54C16

loc_54C12:
		mov	[bp+var_4F], 0

loc_54C16:
		cmp	[bp+var_4F], 0
		jnz	short loc_54BE5
		lea	ax, [bp+var_70]
		push	ax
		mov	ax, si
		add	ax, 399h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_84]
		push	ax
		mov	ax, si
		add	ax, 3ADh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_98]
		push	ax
		mov	ax, si
		add	ax, 3C1h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		call	sub_4123E
		add	sp, 2
		lea	ax, [bp+var_1D8]
		push	ax
		call	sub_4123E
		add	sp, 2
		call	sub_2DA30
		call	Input_Flush_116D1
		lea	ax, [bp+var_226]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_222]
		push	ax
		call	sub_5C1C
		add	sp, 4
		cmp	[bp+var_49], 0
		jz	short loc_54CB8
		cmp	[bp+var_4E], 0
		jz	short loc_54CB8
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_54CB8

loc_54CB8:
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		lea	ax, [bp+var_216]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_44]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_1F0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_54D3D
		cmp	[bp+var_30], 0
		jz	short loc_54D3D
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_54D3D

loc_54D3D:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_54D75
		cmp	[bp+var_26], 0
		jz	short loc_54D75
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_54D75

loc_54D75:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_54DAD
		cmp	[bp+var_1C], 0
		jz	short loc_54DAD
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_54DAD

loc_54DAD:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_1D8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_160]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_54290		endp

; START OF FUNCTION CHUNK FOR sub_54290
off_54DE3	dw offset loc_545A7
		dw offset loc_545C2
		dw offset loc_545C2
		dw offset loc_545C2
		dw offset loc_545C2
off_54DED	dw offset loc_542F0
		dw offset loc_54326
		dw offset loc_5430B
		dw offset loc_54326
		dw offset loc_54326
; END OF FUNCTION CHUNK FOR sub_54290

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54DF7		proc far

var_4CC		= word ptr -4CCh
var_47C		= word ptr -47Ch
var_46F		= dword ptr -46Fh
var_46B		= dword ptr -46Bh
var_466		= word ptr -466h
var_41F		= dword ptr -41Fh
var_41B		= dword ptr -41Bh
var_416		= word ptr -416h
var_39E		= word ptr -39Eh
var_39A		= word ptr -39Ah
var_398		= word ptr -398h
var_34E		= dword ptr -34Eh
var_34A		= byte ptr -34Ah
var_349		= byte ptr -349h
var_348		= dword ptr -348h
var_344		= word ptr -344h
var_338		= word ptr -338h
var_336		= word ptr -336h
var_334		= word ptr -334h
var_332		= word ptr -332h
var_330		= word ptr -330h
var_32E		= word ptr -32Eh
var_32C		= word ptr -32Ch
var_32A		= word ptr -32Ah
var_328		= word ptr -328h
var_326		= word ptr -326h
var_324		= word ptr -324h
var_322		= word ptr -322h
var_31E		= word ptr -31Eh
var_2A6		= word ptr -2A6h
var_22E		= word ptr -22Eh
var_1B6		= word ptr -1B6h
var_13E		= word ptr -13Eh
var_120		= word ptr -120h
var_112		= word ptr -112h
var_C2		= word ptr -0C2h
var_C0		= byte ptr -0C0h
var_BF		= byte ptr -0BFh
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= word ptr -0B6h
var_B4		= byte ptr -0B4h
var_B2		= byte ptr -0B2h
var_B1		= byte ptr -0B1h
var_B0		= byte ptr -0B0h
var_AF		= byte ptr -0AFh
var_AE		= dword ptr -0AEh
var_AA		= word ptr -0AAh
var_A7		= byte ptr -0A7h
var_A6		= dword ptr -0A6h
var_A2		= word ptr -0A2h
var_9F		= byte ptr -9Fh
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_97		= byte ptr -97h
var_96		= dword ptr -96h
var_92		= word ptr -92h
var_8F		= byte ptr -8Fh
var_8E		= dword ptr -8Eh
var_8A		= word ptr -8Ah
var_87		= byte ptr -87h
var_86		= dword ptr -86h
var_82		= word ptr -82h
var_80		= byte ptr -80h
var_7F		= word ptr -7Fh
var_7C		= dword ptr -7Ch
var_78		= byte ptr -78h
var_77		= byte ptr -77h
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= byte ptr -6Eh
var_6D		= byte ptr -6Dh
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= byte ptr -64h
var_63		= byte ptr -63h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= byte ptr -5Ah
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3C		= word ptr -3Ch
var_3A		= byte ptr -3Ah
var_39		= word ptr -39h
var_36		= word ptr -36h
var_34		= byte ptr -34h
var_33		= word ptr -33h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= word ptr -2Dh
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4CCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	Input_Flush_116D1
		mov	byte_4F55C, 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	ds
		push	offset aTm1
		push	ds
		push	offset aGensave
		push	ds
		push	offset a_
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	sub_22AC
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_54EB0
		lea	ax, [bp+var_47C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_47C], 480h
		mov	[bp+var_41B], 100h
		mov	[bp+var_41F], 0
		mov	[bp+var_47C], 5BDh
		push	1
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_47C]
		push	ax
		mov	bx, [bp+var_47C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_47C]
		push	ax
		call	sub_4788D
		add	sp, 2
		or	al, al
		jz	short loc_54EA1
		mov	[bp+var_1], 1

loc_54EA1:
		push	0
		lea	ax, [bp+var_47C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_54EB0:
		push	ds
		push	offset unk_4923D
		push	ds
		push	offset aSav
		push	ds
		push	offset a__3
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	sub_22AC
		add	sp, 6
		mov	[bp+var_4], ax
		push	ds
		push	offset unk_49244
		push	ds
		push	offset aTo1
		push	ds
		push	offset a__3
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	sub_22AC
		add	sp, 6
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jz	short loc_54F1F
		cmp	[bp+var_6], 0
		jz	short loc_54F1F
		jmp	loc_54FC4

loc_54F1F:
		push	ds
		push	offset unk_49245
		push	ss
		lea	ax, [bp+var_120]
		push	ax
		push	ds
		push	offset a__3
		lea	ax, [bp+var_466]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_4CC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_4CC], 480h
		mov	[bp+var_46B], 100h
		mov	[bp+var_46F], 0
		mov	[bp+var_4CC], 5BDh
		push	1
		lea	ax, [bp+var_466]
		push	ax
		lea	ax, [bp+var_4CC]
		push	ax
		mov	bx, [bp+var_4CC]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4CC]
		push	ax
		call	sub_4788D
		add	sp, 2
		or	al, al
		jz	short loc_54FA1
		mov	[bp+var_2], 1
		push	0
		lea	ax, [bp+var_4CC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	short loc_54FC4

loc_54FA1:
		push	0
		lea	ax, [bp+var_4CC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		lea	ax, [bp+var_13E]
		push	ax
		call	sub_22DF
		add	sp, 2
		or	ax, ax
		jnz	short loc_54FC4
		jmp	loc_54F1F

loc_54FC4:
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55046
		call	sub_2DA30
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_55037
		shl	bx, 1
		jmp	cs:off_55DF7[bx]	; switch jump

loc_54FE6:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_466]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_55037

loc_55001:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_466]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_55037

loc_5501C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_466]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_55037

loc_55037:
		push	17h
		lea	ax, [bp+var_466]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4

loc_55046:
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	ds
		push	offset aPak
		push	ds
		push	large offset aOptpals_1
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1B6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps_1
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_22E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	15h
		lea	ax, [bp+var_1B6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	18h
		lea	ax, [bp+var_1B6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	ds
		push	offset aPak
		push	ds
		push	offset aMid1
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_2A6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	2
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	3Bh
		lea	ax, [bp+var_2A6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	ds
		push	offset aPak
		push	ds
		push	offset aMidgames
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_31E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_2D], 0
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_33], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_39], 0
		lea	ax, word ptr [bp+var_2A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_32C], 0
		mov	[bp+var_32A], 0
		mov	[bp+var_328], 0
		mov	[bp+var_326], 0
		mov	[bp+var_324], 13Fh
		mov	[bp+var_322], 0C7h
		push	0
		lea	ax, [bp+var_32C]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_32C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	[bp+var_4A], 0
		mov	[bp+var_46], 2
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	3
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	74h
		lea	ax, [bp+var_22E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_54], 0
		mov	[bp+var_50], 2
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		push	3
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	2Ch
		lea	ax, [bp+var_22E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_5E], 0
		mov	[bp+var_5A], 2
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		push	3
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	14h
		lea	ax, [bp+var_31E]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	68h
		push	0E9h
		push	18h
		push	2Dh
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		mov	[bp+var_330], 0
		mov	[bp+var_32E], 1
		push	ds
		push	offset aPak
		push	ds
		push	offset aMainmenu
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_112]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_416]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_68], 0
		mov	[bp+var_64], 2
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	1
		lea	ax, [bp+var_416]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_72], 0
		mov	[bp+var_6E], 2
		mov	[bp+var_6D], 0
		mov	[bp+var_6C], 0
		push	2
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	0
		lea	ax, [bp+var_416]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_7C], 0
		mov	[bp+var_78], 2
		mov	[bp+var_77], 0
		mov	[bp+var_76], 0
		push	2
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	2
		lea	ax, [bp+var_416]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_7F], 0
		lea	ax, word ptr [bp+var_7C]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	eax, [bp+var_68]
		mov	[bp+var_86], eax
		mov	al, [bp+var_64]
		mov	[bp+var_87], al
		mov	eax, [bp+var_86]
		mov	[bp+var_34E], eax
		mov	al, [bp+var_87]
		mov	[bp+var_34A], al
		mov	[bp+var_349], 0
		mov	[bp+var_348], 0
		mov	eax, [bp+var_62]
		mov	[bp+var_348], eax
		mov	[bp+var_344], 0
		mov	[bp+var_8A], 5
		cmp	[bp+var_1], 0
		jnz	short loc_553D6
		jmp	loc_55482

loc_553D6:
		push	2Eh
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_553EB
		jmp	loc_55472

loc_553EB:
		push	0Eh
		push	0D2h
		push	0Ah
		push	0Bh
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_72]
		mov	[bp+var_8E], eax
		mov	al, [bp+var_6E]
		mov	[bp+var_8F], al
		mov	eax, [bp+var_8E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_6C]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_8A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 5
		mov	ax, di
		jmp	short loc_55474

loc_55472:
		mov	ax, di

loc_55474:
		push	ax
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_55482:
		cmp	[bp+var_2], 0
		jnz	short loc_5548B
		jmp	loc_55580

loc_5548B:
		push	26h
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_92], ax
		or	ax, ax
		jnz	short loc_554A2
		jmp	loc_5556E

loc_554A2:
		push	0Eh
		push	0D2h
		push	1Bh
		push	0Bh
		push	[bp+var_92]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_92]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_92]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_92]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_92]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_92]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	al, [bp+var_6E]
		mov	[bp+var_97], al
		mov	bx, [bp+var_92]
		mov	eax, [bp+var_96]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_92]
		mov	al, [bp+var_97]
		mov	[bx+22h], al
		mov	bx, [bp+var_92]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_92]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_92]
		mov	eax, [bp+var_6C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_92]
		mov	word ptr [bx+28h], 1
		mov	bx, [bp+var_92]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_8A]
		mov	bx, [bp+var_92]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_92]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_92]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_92]
		mov	word ptr [bx+2Eh], 6
		mov	ax, [bp+var_92]
		jmp	short loc_55572

loc_5556E:
		mov	ax, [bp+var_92]

loc_55572:
		push	ax
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_55580:
		push	1Fh
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_9A], ax
		or	ax, ax
		jnz	short loc_55597
		jmp	loc_55663

loc_55597:
		push	0Eh
		push	0D2h
		push	2Ch
		push	0Bh
		push	[bp+var_9A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_9A]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_9A]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_9A]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_9A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_9A]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_72]
		mov	[bp+var_9E], eax
		mov	al, [bp+var_6E]
		mov	[bp+var_9F], al
		mov	bx, [bp+var_9A]
		mov	eax, [bp+var_9E]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_9A]
		mov	al, [bp+var_9F]
		mov	[bx+22h], al
		mov	bx, [bp+var_9A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_9A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_9A]
		mov	eax, [bp+var_6C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_9A]
		mov	word ptr [bx+28h], 2
		mov	bx, [bp+var_9A]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_8A]
		mov	bx, [bp+var_9A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_9A]
		mov	word ptr [bx+2Ch], 0
		mov	bx, [bp+var_9A]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_9A]
		mov	word ptr [bx+2Eh], 7
		mov	ax, [bp+var_9A]
		jmp	short loc_55667

loc_55663:
		mov	ax, [bp+var_9A]

loc_55667:
		push	ax
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	14h
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A2], ax
		or	ax, ax
		jnz	short loc_5568C
		jmp	loc_55758

loc_5568C:
		push	0Eh
		push	0D2h
		push	3Dh
		push	0Bh
		push	[bp+var_A2]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_A2]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_A2]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_A2]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A2]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_72]
		mov	[bp+var_A6], eax
		mov	al, [bp+var_6E]
		mov	[bp+var_A7], al
		mov	bx, [bp+var_A2]
		mov	eax, [bp+var_A6]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_A2]
		mov	al, [bp+var_A7]
		mov	[bx+22h], al
		mov	bx, [bp+var_A2]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A2]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_A2]
		mov	eax, [bp+var_6C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+28h], 3
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_8A]
		mov	bx, [bp+var_A2]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+2Eh], 8
		mov	ax, [bp+var_A2]
		jmp	short loc_5575C

loc_55758:
		mov	ax, [bp+var_A2]

loc_5575C:
		push	ax
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	2Fh
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_AA], ax
		or	ax, ax
		jnz	short loc_55781
		jmp	loc_5584D

loc_55781:
		push	0Eh
		push	0D2h
		push	4Eh
		push	0Bh
		push	[bp+var_AA]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 704h
		mov	bx, [bp+var_AA]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_AA]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_AA]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_AA]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_72]
		mov	[bp+var_AE], eax
		mov	al, [bp+var_6E]
		mov	[bp+var_AF], al
		mov	bx, [bp+var_AA]
		mov	eax, [bp+var_AE]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_AA]
		mov	al, [bp+var_AF]
		mov	[bx+22h], al
		mov	bx, [bp+var_AA]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_AA]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_AA]
		mov	eax, [bp+var_6C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+28h], 4
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_8A]
		mov	bx, [bp+var_AA]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+2Eh], 9
		mov	ax, [bp+var_AA]
		jmp	short loc_55851

loc_5584D:
		mov	ax, [bp+var_AA]

loc_55851:
		push	ax
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12B45
		add	sp, 6
		mov	[bp+var_B2], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		cmp	[bp+arg_2], 0
		jnz	short loc_55877
		jmp	loc_558FA

loc_55877:
		push	[bp+var_30]
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_36]
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_82]
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	loc_55A45

loc_558FA:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	byte ptr [bp+var_B6], 0
		mov	byte ptr [bp+var_B6+1], 0
		mov	[bp+var_B4], 0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	[bp+var_30]
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_36]
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_82]
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	0
		mov	al, [bp+var_46]
		push	ax
		push	word ptr [bp+var_4A+2]
		push	word ptr [bp+var_4A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5A]
		push	ax
		push	word ptr [bp+var_5E+2]
		push	word ptr [bp+var_5E]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_50]
		push	ax
		push	word ptr [bp+var_54+2]
		push	word ptr [bp+var_54]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_128E5
		add	sp, 2
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8

loc_55A45:
		xor	eax, eax
		mov	[bp+var_BA], eax
		mov	[bp+var_BE], eax
		mov	[bp+var_BF], 0
		mov	al, byte_4F554
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55A6E
		mov	[bp+var_BF], 1
		mov	eax, dword_4DE15
		mov	[bp+var_BE], eax

loc_55A6E:
		jmp	loc_55AFA

loc_55A71:
		call	sub_11A88
		cmp	[bp+var_BF], 0
		jz	short loc_55A9C
		mov	eax, dword_4DE15
		sub	eax, [bp+var_BE]
		mov	ebx, 3Ch
		xor	edx, edx
		div	ebx
		cmp	eax, 1Eh
		jbe	short loc_55A9A
		jmp	short loc_55B04

loc_55A9A:
		jmp	short loc_55AA9

loc_55A9C:
		call	sub_2DA4F
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55AA9
		jmp	short loc_55B04

loc_55AA9:
		push	0
		push	1
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12C6E
		add	sp, 6
		mov	[bp+var_C2], ax
		cmp	[bp+var_C2], 0
		jz	short loc_55AFA
		cmp	[bp+var_334], 0
		jnz	short loc_55AD3
		cmp	[bp+var_332], 0
		jz	short loc_55AFA

loc_55AD3:
		push	[bp+var_332]
		push	[bp+var_334]
		mov	ax, [bp+var_336]
		sub	ax, [bp+var_398]
		push	ax
		mov	ax, [bp+var_338]
		sub	ax, [bp+var_39A]
		push	ax
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12BF8
		add	sp, 0Ah

loc_55AFA:
		cmp	[bp+var_8A], 5
		jnz	short loc_55B04
		jmp	loc_55A71

loc_55B04:
		cmp	[bp+var_8A], 2
		jnz	short loc_55B16
		push	1
		push	si
		call	sub_4791B
		add	sp, 4

loc_55B16:
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_12910
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_4555C
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		call	sub_2DA30
		mov	al, byte ptr [bp+var_8A]
		mov	[bp+var_C0], al
		lea	ax, [bp+var_82]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_77], 0
		jz	short loc_55B74
		cmp	[bp+var_7C], 0
		jz	short loc_55B74
		push	0
		mov	al, [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55B74

loc_55B74:
		mov	[bp+var_7C], 0
		mov	[bp+var_77], 0
		mov	[bp+var_76], 0
		cmp	[bp+var_6D], 0
		jz	short loc_55BAC
		cmp	[bp+var_72], 0
		jz	short loc_55BAC
		push	0
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55BAC

loc_55BAC:
		mov	[bp+var_72], 0
		mov	[bp+var_6D], 0
		mov	[bp+var_6C], 0
		cmp	[bp+var_63], 0
		jz	short loc_55BE4
		cmp	[bp+var_68], 0
		jz	short loc_55BE4
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55BE4

loc_55BE4:
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_416]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_39E]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_59], 0
		jz	short loc_55C3A
		cmp	[bp+var_5E], 0
		jz	short loc_55C3A
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55C3A

loc_55C3A:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_55C72
		cmp	[bp+var_54], 0
		jz	short loc_55C72
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55C72

loc_55C72:
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		cmp	[bp+var_45], 0
		jz	short loc_55CAA
		cmp	[bp+var_4A], 0
		jz	short loc_55CAA
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55CAA

loc_55CAA:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		lea	ax, [bp+var_40]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_32C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_36]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_31E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_2A6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_22E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_1B6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_25], 0
		jz	short loc_55D5B
		cmp	[bp+var_2A], 0
		jz	short loc_55D5B
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55D5B

loc_55D5B:
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		cmp	[bp+var_1B], 0
		jz	short loc_55D93
		cmp	[bp+var_20], 0
		jz	short loc_55D93
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55D93

loc_55D93:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		cmp	[bp+var_11], 0
		jz	short loc_55DCB
		cmp	[bp+var_16], 0
		jz	short loc_55DCB
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_55DCB

loc_55DCB:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		lea	ax, [bp+var_C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		mov	al, [bp+var_C0]
		pop	di
		pop	si
		leave
		retf
sub_54DF7		endp

; START OF FUNCTION CHUNK FOR sub_54DF7
		pop	di
		pop	si
		leave
		retf
off_55DF7	dw offset loc_54FE6
		dw offset loc_5501C
		dw offset loc_55001
		dw offset loc_5501C
		dw offset loc_5501C
; END OF FUNCTION CHUNK FOR sub_54DF7
ovr190		ends
