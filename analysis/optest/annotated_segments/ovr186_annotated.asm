ovr186		segment	para public 'OVERLAY' use16
		assume cs:ovr186
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4E660	proc far		; CODE XREF: sub_42020J

var_2EE		= word ptr -2EEh
var_276		= word ptr -276h
var_23A		= word ptr -23Ah
var_226		= word ptr -226h
var_224		= word ptr -224h
var_222		= dword	ptr -222h
var_21E		= byte ptr -21Eh
var_21D		= byte ptr -21Dh
var_21C		= dword	ptr -21Ch
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
var_84		= word ptr -84h
var_70		= word ptr -70h
var_5B		= byte ptr -5Bh
var_5A		= word ptr -5Ah
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= word ptr -56h
var_52		= word ptr -52h
var_4F		= byte ptr -4Fh
var_4E		= dword	ptr -4Eh
var_4A		= byte ptr -4Ah
var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_40		= word ptr -40h
var_3E		= byte ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= byte ptr -38h
var_37		= word ptr -37h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
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
		call	Input_Flush_CDDC
		mov	byte ptr [bp+var_70], 0
		mov	byte ptr [bp+var_84], 0
		mov	byte ptr [bp+var_98], 0
		mov	[bp+var_2], 5Bh	; '['
		mov	[bp+var_4], 61h	; 'a'
		mov	[bp+var_6], 39h	; '9'
		mov	[bp+var_8], 0AEh ; '�'
		mov	[bp+var_A], 61h	; 'a'
		mov	[bp+var_C], 32h	; '2'
		mov	[bp+var_E], 7Ch	; '|'
		mov	[bp+var_10], 67h ; 'g'
		mov	[bp+var_12], 62h ; 'b'
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		cmp	byte_46848, 2
		jnz	short loc_4E6E5
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh

loc_4E6E5:				; CODE XREF: sub_4E660+6Aj
		push	1Ah
		lea	ax, [bp+var_E8]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_1D8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	3
		lea	ax, [bp+var_1C]
		push	ax
		push	0A0h ; '�'
		lea	ax, [bp+var_160]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_26]
		push	ax
		push	1Eh
		lea	ax, [bp+var_1D8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aFormfont ; "formfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_E8]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_34+2],	dx
		mov	word ptr [bp+var_34], ax
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 1
		mov	[bp+var_2A], 0
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_1F0]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_1E0], 1
		mov	[bp+var_1DE], 0
		push	2Dh ; '-'
		lea	ax, [bp+var_1F0]
		push	ax
		mov	bx, [bp+var_1F0]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_1DC], ax
		mov	[bp+var_37], 0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_40]
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_1FE], 0
		mov	[bp+var_1FC], 0
		mov	[bp+var_1FA], 0
		mov	[bp+var_1F8], 0
		mov	[bp+var_1F6], 13Fh
		mov	[bp+var_1F4], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		lea	ax, [bp+var_1F0]
		push	ax
		lea	ax, [bp+var_1FE]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_202], 4
		mov	[bp+var_4E], 0
		mov	[bp+var_4A], 2
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		mov	[bp+var_222], 0
		mov	[bp+var_21E], 2
		mov	[bp+var_21D], 0
		mov	[bp+var_21C], 0
		mov	[bp+var_226], 0
		mov	[bp+var_224], 0FFFFh
		cmp	word_46849, 0
		jnz	short loc_4E92B
		jmp	loc_4E9CE
; ���������������������������������������������������������������������������

loc_4E92B:				; CODE XREF: sub_4E660+2C6j
		mov	al, byte_46848
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_4E93C
		cmp	ax, 2
		jz	short loc_4E957
		jmp	short loc_4E972
; ���������������������������������������������������������������������������

loc_4E93C:				; CODE XREF: sub_4E660+2D3j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_276]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short loc_4E972
; ���������������������������������������������������������������������������

loc_4E957:				; CODE XREF: sub_4E660+2D8j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_276]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short $+2

loc_4E972:				; CODE XREF: sub_4E660+2DAj
					; sub_4E660+2F5j
		push	1
		lea	ax, [bp+var_276]
		push	ax
		lea	ax, [bp+var_2EE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	3
		lea	ax, [bp+var_4E]
		push	ax
		push	6Ah ; 'j'
		lea	ax, [bp+var_2EE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_226]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_226]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_2EE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_4E9CE:				; CODE XREF: sub_4E660+2C8j
		xor	di, di
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4E9D3:				; CODE XREF: sub_4E660+893j
		push	0
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1FE]
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		or	di, di
		jnz	short loc_4EA56
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	8B9h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	8C1h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_98]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	8C8h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		jmp	loc_4EAFD
; ���������������������������������������������������������������������������

loc_4EA56:				; CODE XREF: sub_4E660+3A1j
		cmp	di, 1
		jnz	short loc_4EAAD
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	8CFh
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	8D6h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_98]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	8DEh
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		jmp	short loc_4EAFD
; ���������������������������������������������������������������������������

loc_4EAAD:				; CODE XREF: sub_4E660+3F9j
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	8E5h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+var_A]
		push	[bp+var_8]
		push	8ECh
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_98]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	8F3h
		lea	ax, [bp+var_218]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah

loc_4EAFD:				; CODE XREF: sub_4E660+3F3j
					; sub_4E660+44Bj
		push	word_46F44
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_3FA5E
		mov	[bp+var_57], 0

loc_4EB16:				; CODE XREF: sub_4E660:loc_4EB44j
		call	sub_D157
		push	0FFh
		lea	ax, [bp+var_56]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		cmp	byte ptr [bp+var_56], 0
		jz	short loc_4EB44
		cmp	byte_49742, 1
		jz	short loc_4EB3E
		cmp	byte_4974E, 1
		jnz	short loc_4EB42

loc_4EB3E:				; CODE XREF: sub_4E660+4D5j
		mov	[bp+var_57], 1

loc_4EB42:				; CODE XREF: sub_4E660+4DCj
		jmp	short loc_4EB46
; ���������������������������������������������������������������������������

loc_4EB44:				; CODE XREF: sub_4E660+4CEj
		jmp	short loc_4EB16
; ���������������������������������������������������������������������������

loc_4EB46:				; CODE XREF: sub_4E660:loc_4EB42j
		mov	al, byte ptr [bp+var_56+1]
		mov	[bp+var_58], al
		cmp	[bp+var_58], 0Eh
		jz	short loc_4EB55
		jmp	loc_4EBD7
; ���������������������������������������������������������������������������

loc_4EB55:				; CODE XREF: sub_4E660+4F0j
		cmp	byte ptr [bp+var_56], 1
		jz	short loc_4EB61
		cmp	byte ptr [bp+var_56], 4
		jnz	short loc_4EBD7

loc_4EB61:				; CODE XREF: sub_4E660+4F9j
		or	di, di
		jnz	short loc_4EB84
		cmp	byte ptr [bp+var_70], 0
		jz	short loc_4EB82
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_70]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_4EB82:				; CODE XREF: sub_4E660+509j
		jmp	short loc_4EBD4
; ���������������������������������������������������������������������������

loc_4EB84:				; CODE XREF: sub_4E660+503j
		cmp	di, 1
		jnz	short loc_4EBAF
		cmp	byte ptr [bp+var_84], 0
		jz	short loc_4EBAB
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_84]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_4EBAD
; ���������������������������������������������������������������������������

loc_4EBAB:				; CODE XREF: sub_4E660+52Ej
		xor	di, di

loc_4EBAD:				; CODE XREF: sub_4E660+549j
		jmp	short loc_4EBD4
; ���������������������������������������������������������������������������

loc_4EBAF:				; CODE XREF: sub_4E660+527j
		cmp	byte ptr [bp+var_98], 0
		jz	short loc_4EBD1
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_98]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_4EBD4
; ���������������������������������������������������������������������������

loc_4EBD1:				; CODE XREF: sub_4E660+554j
		mov	di, 1

loc_4EBD4:				; CODE XREF: sub_4E660:loc_4EB82j
					; sub_4E660:loc_4EBADj	...
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EBD7:				; CODE XREF: sub_4E660+4F2j
					; sub_4E660+4FFj
		cmp	[bp+var_58], 1Ch
		jz	short loc_4EBE3
		cmp	[bp+var_58], 0Fh
		jnz	short loc_4EC21

loc_4EBE3:				; CODE XREF: sub_4E660+57Bj
		cmp	byte ptr [bp+var_56], 2
		jnz	short loc_4EC21
		or	di, di
		jnz	short loc_4EBF8
		cmp	byte ptr [bp+var_70], 0
		jz	short loc_4EBF8
		mov	di, 1
		jmp	short loc_4EC1E
; ���������������������������������������������������������������������������

loc_4EBF8:				; CODE XREF: sub_4E660+58Bj
					; sub_4E660+591j
		cmp	di, 1
		jnz	short loc_4EC09
		cmp	byte ptr [bp+var_84], 0
		jz	short loc_4EC09
		mov	di, 2
		jmp	short loc_4EC1E
; ���������������������������������������������������������������������������

loc_4EC09:				; CODE XREF: sub_4E660+59Bj
					; sub_4E660+5A2j
		cmp	di, 2
		jnz	short loc_4EC1E
		cmp	byte ptr [bp+var_98], 0
		jz	short loc_4EC1E
		cmp	[bp+var_58], 1Ch
		jnz	short loc_4EC1E
		mov	di, 3

loc_4EC1E:				; CODE XREF: sub_4E660+596j
					; sub_4E660+5A7j ...
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EC21:				; CODE XREF: sub_4E660+581j
					; sub_4E660+587j
		cmp	byte ptr [bp+var_56], 1
		jz	short loc_4EC30
		cmp	byte ptr [bp+var_56], 4
		jz	short loc_4EC30
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EC30:				; CODE XREF: sub_4E660+5C5j
					; sub_4E660+5CBj
		cmp	[bp+var_58], 10h
		jb	short loc_4EC3C
		cmp	[bp+var_58], 19h
		jbe	short loc_4EC5D

loc_4EC3C:				; CODE XREF: sub_4E660+5D4j
		cmp	[bp+var_58], 1Eh
		jb	short loc_4EC48
		cmp	[bp+var_58], 26h ; '&'
		jbe	short loc_4EC5D

loc_4EC48:				; CODE XREF: sub_4E660+5E0j
		cmp	[bp+var_58], 2Ch ; ','
		jb	short loc_4EC54
		cmp	[bp+var_58], 32h ; '2'
		jbe	short loc_4EC5D

loc_4EC54:				; CODE XREF: sub_4E660+5ECj
		cmp	[bp+var_58], 39h ; '9'
		jz	short loc_4EC5D
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EC5D:				; CODE XREF: sub_4E660+5DAj
					; sub_4E660+5E6j ...
		mov	al, [bp+var_58]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+4ACEh]
		cbw
		mov	[bp+var_5A], ax
		cmp	[bp+var_5A], 61h ; 'a'
		jl	short loc_4EC78
		cmp	[bp+var_5A], 7Ah ; 'z'
		jle	short loc_4EC8D

loc_4EC78:				; CODE XREF: sub_4E660+610j
		cmp	[bp+var_5A], 41h ; 'A'
		jl	short loc_4EC84
		cmp	[bp+var_5A], 5Ah ; 'Z'
		jle	short loc_4EC8D

loc_4EC84:				; CODE XREF: sub_4E660+61Cj
		cmp	[bp+var_5A], 20h ; ' '
		jz	short loc_4EC8D
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EC8D:				; CODE XREF: sub_4E660+616j
					; sub_4E660+622j ...
		cmp	[bp+var_57], 0
		jz	short loc_4EC9D
		cmp	[bp+var_5A], 20h ; ' '
		jz	short loc_4EC9D
		sub	[bp+var_5A], 20h ; ' '

loc_4EC9D:				; CODE XREF: sub_4E660+631j
					; sub_4E660+637j
		or	di, di
		jz	short loc_4ECA4
		jmp	loc_4ED5F
; ���������������������������������������������������������������������������

loc_4ECA4:				; CODE XREF: sub_4E660+63Fj
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		cmp	ax, 0Fh
		jb	short loc_4ECB8
		jmp	loc_4ED5F
; ���������������������������������������������������������������������������

loc_4ECB8:				; CODE XREF: sub_4E660+653j
		cmp	byte ptr [bp+var_70], 0
		jnz	short loc_4ECC7
		cmp	[bp+var_5A], 20h ; ' '
		jnz	short loc_4ECC7
		jmp	loc_4ED5C
; ���������������������������������������������������������������������������

loc_4ECC7:				; CODE XREF: sub_4E660+65Cj
					; sub_4E660+662j
		cmp	[bp+var_226], 0
		jz	short loc_4ECE3
		push	[bp+var_224]
		mov	bx, [bp+var_226]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_4ECE3:				; CODE XREF: sub_4E660+66Cj
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
		lea	dx, [bp+var_23A+1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		cmp	ax, [bp+var_6]
		jg	short loc_4ED5C
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_70]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_70+1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_4ED5C:				; CODE XREF: sub_4E660+664j
					; sub_4E660+6DAj
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4ED5F:				; CODE XREF: sub_4E660+641j
					; sub_4E660+655j
		cmp	di, 1
		jz	short loc_4ED67
		jmp	loc_4EE28
; ���������������������������������������������������������������������������

loc_4ED67:				; CODE XREF: sub_4E660+702j
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		cmp	ax, 0Fh
		jb	short loc_4ED7C
		jmp	loc_4EE28
; ���������������������������������������������������������������������������

loc_4ED7C:				; CODE XREF: sub_4E660+717j
		cmp	byte ptr [bp+var_84], 0
		jnz	short loc_4ED8C
		cmp	[bp+var_5A], 20h ; ' '
		jnz	short loc_4ED8C
		jmp	loc_4EE25
; ���������������������������������������������������������������������������

loc_4ED8C:				; CODE XREF: sub_4E660+721j
					; sub_4E660+727j
		cmp	[bp+var_226], 0
		jz	short loc_4EDA8
		push	[bp+var_224]
		mov	bx, [bp+var_226]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_4EDA8:				; CODE XREF: sub_4E660+731j
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
		lea	dx, [bp+var_23A+1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		cmp	ax, [bp+var_C]
		jg	short loc_4EE25
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_84]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_84+1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_4EE25:				; CODE XREF: sub_4E660+729j
					; sub_4E660+7A1j
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EE28:				; CODE XREF: sub_4E660+704j
					; sub_4E660+719j
		cmp	di, 2
		jz	short loc_4EE30
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EE30:				; CODE XREF: sub_4E660+7CBj
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		cmp	ax, 0Fh
		jb	short loc_4EE45
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EE45:				; CODE XREF: sub_4E660+7E0j
		cmp	byte ptr [bp+var_98], 0
		jnz	short loc_4EE55
		cmp	[bp+var_5A], 20h ; ' '
		jnz	short loc_4EE55
		jmp	loc_4EEEE
; ���������������������������������������������������������������������������

loc_4EE55:				; CODE XREF: sub_4E660+7EAj
					; sub_4E660+7F0j
		cmp	[bp+var_226], 0
		jz	short loc_4EE71
		push	[bp+var_224]
		mov	bx, [bp+var_226]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_4EE71:				; CODE XREF: sub_4E660+7FAj
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
		lea	dx, [bp+var_23A+1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_218]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		cmp	ax, [bp+var_12]
		jg	short loc_4EEEE
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_98]
		add	ax, dx
		mov	dl, byte ptr [bp+var_5A]
		mov	bx, ax
		mov	[bx], dl
		mov	al, [bp+var_5B]
		mov	ah, 0
		lea	dx, [bp+var_98+1]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_4EEEE:				; CODE XREF: sub_4E660+370j
					; sub_4E660:loc_4EBD4j	...
		cmp	di, 3
		jz	short loc_4EEF6
		jmp	loc_4E9D3
; ���������������������������������������������������������������������������

loc_4EEF6:				; CODE XREF: sub_4E660+891j
		mov	[bp+var_4F], 1
		jmp	short loc_4EF2A
; ���������������������������������������������������������������������������

loc_4EEFC:				; CODE XREF: sub_4E660+8CEj
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_52], ax
		lea	ax, [bp+var_70]
		mov	bx, [bp+var_52]
		add	bx, ax
		cmp	byte ptr [bx], 20h ; ' '
		jnz	short loc_4EF26
		lea	ax, [bp+var_70]
		mov	bx, [bp+var_52]
		add	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_4EF2A
; ���������������������������������������������������������������������������

loc_4EF26:				; CODE XREF: sub_4E660+8B7j
		mov	[bp+var_4F], 0

loc_4EF2A:				; CODE XREF: sub_4E660+89Aj
					; sub_4E660+8C4j
		cmp	[bp+var_4F], 0
		jnz	short loc_4EEFC
		mov	[bp+var_4F], 1
		jmp	short loc_4EF67
; ���������������������������������������������������������������������������

loc_4EF36:				; CODE XREF: sub_4E660+90Bj
		lea	ax, [bp+var_84]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_52], ax
		lea	ax, [bp+var_84]
		mov	bx, [bp+var_52]
		add	bx, ax
		cmp	byte ptr [bx], 20h ; ' '
		jnz	short loc_4EF63
		lea	ax, [bp+var_84]
		mov	bx, [bp+var_52]
		add	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_4EF67
; ���������������������������������������������������������������������������

loc_4EF63:				; CODE XREF: sub_4E660+8F3j
		mov	[bp+var_4F], 0

loc_4EF67:				; CODE XREF: sub_4E660+8D4j
					; sub_4E660+901j
		cmp	[bp+var_4F], 0
		jnz	short loc_4EF36
		mov	[bp+var_4F], 1
		jmp	short loc_4EFA4
; ���������������������������������������������������������������������������

loc_4EF73:				; CODE XREF: sub_4E660+948j
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_52], ax
		lea	ax, [bp+var_98]
		mov	bx, [bp+var_52]
		add	bx, ax
		cmp	byte ptr [bx], 20h ; ' '
		jnz	short loc_4EFA0
		lea	ax, [bp+var_98]
		mov	bx, [bp+var_52]
		add	bx, ax
		mov	byte ptr [bx], 0
		jmp	short loc_4EFA4
; ���������������������������������������������������������������������������

loc_4EFA0:				; CODE XREF: sub_4E660+930j
		mov	[bp+var_4F], 0

loc_4EFA4:				; CODE XREF: sub_4E660+911j
					; sub_4E660+93Ej
		cmp	[bp+var_4F], 0
		jnz	short loc_4EF73
		lea	ax, [bp+var_70]
		push	ax
		mov	ax, si
		add	ax, 398h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_84]
		push	ax
		mov	ax, si
		add	ax, 3ACh
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_98]
		push	ax
		mov	ax, si
		add	ax, 3C0h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		lea	ax, [bp+var_1D8]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		call	sub_28D49
		call	Input_Flush_CDDC
		lea	ax, [bp+var_226]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_21D], 0
		jz	short loc_4F03B
		cmp	[bp+var_222], 0
		jz	short loc_4F03B
		push	0
		mov	al, [bp+var_21E]
		push	ax
		lea	ax, [bp+var_222]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4F03B:				; CODE XREF: sub_4E660+9B8j
					; sub_4E660+9C0j
		mov	[bp+var_222], 0
		mov	[bp+var_21D], 0
		mov	[bp+var_21C], 0
		cmp	[bp+var_49], 0
		jz	short loc_4F076
		cmp	[bp+var_4E], 0
		jz	short loc_4F076
		push	0
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4F076:				; CODE XREF: sub_4E660+9F6j
					; sub_4E660+9FDj
		mov	[bp+var_4E], 0
		mov	[bp+var_49], 0
		mov	[bp+var_48], 0
		lea	ax, [bp+var_216]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_44]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1F0]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_4F101
		cmp	[bp+var_30], 0
		jz	short loc_4F101
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4F101:				; CODE XREF: sub_4E660+A81j
					; sub_4E660+A88j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_4F139
		cmp	[bp+var_26], 0
		jz	short loc_4F139
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4F139:				; CODE XREF: sub_4E660+AB9j
					; sub_4E660+AC0j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_4F171
		cmp	[bp+var_1C], 0
		jz	short loc_4F171
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4F171:				; CODE XREF: sub_4E660+AF1j
					; sub_4E660+AF8j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_1D8]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_160]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4E660	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en surface 2026-10-22. Menu d'accueil (mainmenu.pak, *.sav, gensave.tmp) ; renvoie
; le choix 0 à 5 traité par Gameflow_MainLoop_3D2E.
; ==============================================================================================
Gameflow_MainMenu_4F1A7	proc far		; CODE XREF: sub_42025J

var_4CA		= word ptr -4CAh
var_47A		= word ptr -47Ah
var_46D		= dword	ptr -46Dh
var_469		= dword	ptr -469h
var_464		= word ptr -464h
var_41D		= dword	ptr -41Dh
var_419		= dword	ptr -419h
var_414		= word ptr -414h
var_39C		= word ptr -39Ch
var_398		= word ptr -398h
var_396		= word ptr -396h
var_34C		= dword	ptr -34Ch
var_348		= byte ptr -348h
var_347		= byte ptr -347h
var_346		= dword	ptr -346h
var_342		= word ptr -342h
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
var_320		= word ptr -320h
var_31C		= word ptr -31Ch
var_2A4		= word ptr -2A4h
var_22C		= word ptr -22Ch
var_1B4		= word ptr -1B4h
var_13C		= word ptr -13Ch
var_11E		= word ptr -11Eh
var_110		= word ptr -110h
var_C0		= word ptr -0C0h
var_BE		= byte ptr -0BEh
var_BD		= byte ptr -0BDh
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= word ptr -0B4h
var_B2		= byte ptr -0B2h
var_B0		= byte ptr -0B0h
var_AF		= byte ptr -0AFh
var_AE		= byte ptr -0AEh
var_AD		= byte ptr -0ADh
var_AC		= dword	ptr -0ACh
var_A8		= word ptr -0A8h
var_A5		= byte ptr -0A5h
var_A4		= dword	ptr -0A4h
var_A0		= word ptr -0A0h
var_9D		= byte ptr -9Dh
var_9C		= dword	ptr -9Ch
var_98		= word ptr -98h
var_95		= byte ptr -95h
var_94		= dword	ptr -94h
var_90		= word ptr -90h
var_8D		= byte ptr -8Dh
var_8C		= dword	ptr -8Ch
var_88		= word ptr -88h
var_85		= byte ptr -85h
var_84		= dword	ptr -84h
var_80		= word ptr -80h
var_7E		= byte ptr -7Eh
var_7D		= word ptr -7Dh
var_7A		= dword	ptr -7Ah
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= byte ptr -6Ch
var_6B		= byte ptr -6Bh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword	ptr -42h
var_3E		= word ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= byte ptr -38h
var_37		= word ptr -37h
var_34		= word ptr -34h
var_32		= byte ptr -32h
var_31		= word ptr -31h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= word ptr -2Bh
var_28		= dword	ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4CAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	Input_Flush_CDDC
		mov	byte_495FC, 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	ds
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aGensave	; "gensave"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		call	sub_1DD6
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_4F260
		lea	ax, [bp+var_47A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_47A], 556h
		mov	[bp+var_419], 100h
		mov	[bp+var_41D], 0
		mov	[bp+var_47A], 693h
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_47A]
		push	ax
		mov	bx, [bp+var_47A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_47A]
		push	ax
		call	sub_41F3D
		add	sp, 2
		or	al, al
		jz	short loc_4F251
		mov	[bp+var_1], 1

loc_4F251:				; CODE XREF: Gameflow_MainMenu_4F1A7+A4j
		push	0
		lea	ax, [bp+var_47A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_4F260:				; CODE XREF: Gameflow_MainMenu_4F1A7+52j
		push	ds
		push	offset unk_43921
		push	ds
		push	offset a_sav	; "*.sav"
		push	ds
		push	offset a_	; ".\\"
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		call	sub_1DD6
		add	sp, 6
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_4F299
		jmp	loc_4F33E
; ���������������������������������������������������������������������������

loc_4F299:				; CODE XREF: Gameflow_MainMenu_4F1A7+EDj
					; Gameflow_MainMenu_4F1A7+194j
		push	ds
		push	offset unk_43922
		push	ss
		lea	ax, [bp+var_11E]
		push	ax
		push	ds
		push	offset a_	; ".\\"
		lea	ax, [bp+var_464]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_4CA]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_4CA], 556h
		mov	[bp+var_469], 100h
		mov	[bp+var_46D], 0
		mov	[bp+var_4CA], 693h
		push	1
		lea	ax, [bp+var_464]
		push	ax
		lea	ax, [bp+var_4CA]
		push	ax
		mov	bx, [bp+var_4CA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4CA]
		push	ax
		call	sub_41F3D
		add	sp, 2
		or	al, al
		jz	short loc_4F31B
		mov	[bp+var_2], 1
		push	0
		lea	ax, [bp+var_4CA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	short loc_4F33E
; ���������������������������������������������������������������������������

loc_4F31B:				; CODE XREF: Gameflow_MainMenu_4F1A7+15Dj
		push	0
		lea	ax, [bp+var_4CA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_1E09
		add	sp, 2
		or	ax, ax
		jnz	short loc_4F33E
		jmp	loc_4F299
; ���������������������������������������������������������������������������

loc_4F33E:				; CODE XREF: Gameflow_MainMenu_4F1A7+EFj
					; Gameflow_MainMenu_4F1A7+172j ...
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4F3A2
		call	sub_28D49
		mov	al, byte_46848
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_4F35D
		cmp	ax, 2
		jz	short loc_4F378
		jmp	short loc_4F393
; ���������������������������������������������������������������������������

loc_4F35D:				; CODE XREF: Gameflow_MainMenu_4F1A7+1ADj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_464]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short loc_4F393
; ���������������������������������������������������������������������������

loc_4F378:				; CODE XREF: Gameflow_MainMenu_4F1A7+1B2j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_464]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short $+2

loc_4F393:				; CODE XREF: Gameflow_MainMenu_4F1A7+1B4j
					; Gameflow_MainMenu_4F1A7+1CFj
		push	17h
		lea	ax, [bp+var_464]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4

loc_4F3A2:				; CODE XREF: Gameflow_MainMenu_4F1A7+19Ej
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1A], 2
		mov	[bp+var_19], 0
		mov	[bp+var_18], 0
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals	; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_1B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps	; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_22C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	2
		lea	ax, [bp+var_14]
		push	ax
		push	15h
		lea	ax, [bp+var_1B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		push	18h
		lea	ax, [bp+var_1B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid1	; "mid1"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_2A4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	2
		lea	ax, [bp+var_28]
		push	ax
		push	3Bh ; ';'
		lea	ax, [bp+var_2A4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_2B], 0
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_31], 0
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_37], 0
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_32A], 0
		mov	[bp+var_328], 0
		mov	[bp+var_326], 0
		mov	[bp+var_324], 0
		mov	[bp+var_322], 13Fh
		mov	[bp+var_320], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_32A]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_32A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	3
		lea	ax, [bp+var_48]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_22C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		push	3
		lea	ax, [bp+var_52]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp+var_22C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	3
		lea	ax, [bp+var_5C]
		push	ax
		push	14h
		lea	ax, [bp+var_31C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	68h ; 'h'
		push	0E9h ; '�'
		push	18h
		push	2Dh ; '-'
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	[bp+var_32E], 0
		mov	[bp+var_32C], 1
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMainmenu ; "mainmenu"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_110]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_414]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_66], 0
		mov	[bp+var_62], 2
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		push	1
		lea	ax, [bp+var_414]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		push	0
		lea	ax, [bp+var_414]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7A], 0
		mov	[bp+var_76], 2
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_7A]
		push	ax
		push	2
		lea	ax, [bp+var_414]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7D], 0
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	eax, [bp+var_66]
		mov	[bp+var_84], eax
		mov	al, [bp+var_62]
		mov	[bp+var_85], al
		mov	eax, [bp+var_84]
		mov	[bp+var_34C], eax
		mov	al, [bp+var_85]
		mov	[bp+var_348], al
		mov	[bp+var_347], 0
		mov	[bp+var_346], 0
		mov	eax, [bp+var_60]
		mov	[bp+var_346], eax
		mov	[bp+var_342], 0
		mov	[bp+var_88], 5
		cmp	[bp+var_1], 0
		jnz	short loc_4F731
		jmp	loc_4F7DD
; ���������������������������������������������������������������������������

loc_4F731:				; CODE XREF: Gameflow_MainMenu_4F1A7+585j
		push	2Eh ; '.'
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_4F746
		jmp	loc_4F7CD
; ���������������������������������������������������������������������������

loc_4F746:				; CODE XREF: Gameflow_MainMenu_4F1A7+59Aj
		push	0Eh
		push	0D2h ; '�'
		push	0Ah
		push	0Bh
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_70]
		mov	[bp+var_8C], eax
		mov	al, [bp+var_6C]
		mov	[bp+var_8D], al
		mov	eax, [bp+var_8C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bp+var_6A]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_88]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 5
		mov	ax, di
		jmp	short loc_4F7CF
; ���������������������������������������������������������������������������

loc_4F7CD:				; CODE XREF: Gameflow_MainMenu_4F1A7+59Cj
		mov	ax, di

loc_4F7CF:				; CODE XREF: Gameflow_MainMenu_4F1A7+624j
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_4F7DD:				; CODE XREF: Gameflow_MainMenu_4F1A7+587j
		cmp	[bp+var_2], 0
		jnz	short loc_4F7E6
		jmp	loc_4F8DB
; ���������������������������������������������������������������������������

loc_4F7E6:				; CODE XREF: Gameflow_MainMenu_4F1A7+63Aj
		push	26h ; '&'
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_90], ax
		or	ax, ax
		jnz	short loc_4F7FD
		jmp	loc_4F8C9
; ���������������������������������������������������������������������������

loc_4F7FD:				; CODE XREF: Gameflow_MainMenu_4F1A7+651j
		push	0Eh
		push	0D2h ; '�'
		push	1Bh
		push	0Bh
		push	[bp+var_90]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_70]
		mov	[bp+var_94], eax
		mov	al, [bp+var_6C]
		mov	[bp+var_95], al
		mov	bx, [bp+var_90]
		mov	eax, [bp+var_94]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_90]
		mov	al, [bp+var_95]
		mov	[bx+22h], al
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_90]
		mov	eax, [bp+var_6A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+28h], 1
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_88]
		mov	bx, [bp+var_90]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_90]
		mov	word ptr [bx+2Eh], 6
		mov	ax, [bp+var_90]
		jmp	short loc_4F8CD
; ���������������������������������������������������������������������������

loc_4F8C9:				; CODE XREF: Gameflow_MainMenu_4F1A7+653j
		mov	ax, [bp+var_90]

loc_4F8CD:				; CODE XREF: Gameflow_MainMenu_4F1A7+720j
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_4F8DB:				; CODE XREF: Gameflow_MainMenu_4F1A7+63Cj
		push	1Fh
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_98], ax
		or	ax, ax
		jnz	short loc_4F8F2
		jmp	loc_4F9BE
; ���������������������������������������������������������������������������

loc_4F8F2:				; CODE XREF: Gameflow_MainMenu_4F1A7+746j
		push	0Eh
		push	0D2h ; '�'
		push	2Ch ; ','
		push	0Bh
		push	[bp+var_98]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_98]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_98]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_98]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_98]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_98]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_70]
		mov	[bp+var_9C], eax
		mov	al, [bp+var_6C]
		mov	[bp+var_9D], al
		mov	bx, [bp+var_98]
		mov	eax, [bp+var_9C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_98]
		mov	al, [bp+var_9D]
		mov	[bx+22h], al
		mov	bx, [bp+var_98]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_98]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bp+var_6A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_98]
		mov	word ptr [bx+28h], 2
		mov	bx, [bp+var_98]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_88]
		mov	bx, [bp+var_98]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_98]
		mov	word ptr [bx+2Ch], 0
		mov	bx, [bp+var_98]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_98]
		mov	word ptr [bx+2Eh], 7
		mov	ax, [bp+var_98]
		jmp	short loc_4F9C2
; ���������������������������������������������������������������������������

loc_4F9BE:				; CODE XREF: Gameflow_MainMenu_4F1A7+748j
		mov	ax, [bp+var_98]

loc_4F9C2:				; CODE XREF: Gameflow_MainMenu_4F1A7+815j
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	14h
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A0], ax
		or	ax, ax
		jnz	short loc_4F9E7
		jmp	loc_4FAB3
; ���������������������������������������������������������������������������

loc_4F9E7:				; CODE XREF: Gameflow_MainMenu_4F1A7+83Bj
		push	0Eh
		push	0D2h ; '�'
		push	3Dh ; '='
		push	0Bh
		push	[bp+var_A0]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_A0]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_A0]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_A0]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A0]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_70]
		mov	[bp+var_A4], eax
		mov	al, [bp+var_6C]
		mov	[bp+var_A5], al
		mov	bx, [bp+var_A0]
		mov	eax, [bp+var_A4]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_A0]
		mov	al, [bp+var_A5]
		mov	[bx+22h], al
		mov	bx, [bp+var_A0]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A0]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_A0]
		mov	eax, [bp+var_6A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+28h], 3
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_88]
		mov	bx, [bp+var_A0]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+2Eh], 8
		mov	ax, [bp+var_A0]
		jmp	short loc_4FAB7
; ���������������������������������������������������������������������������

loc_4FAB3:				; CODE XREF: Gameflow_MainMenu_4F1A7+83Dj
		mov	ax, [bp+var_A0]

loc_4FAB7:				; CODE XREF: Gameflow_MainMenu_4F1A7+90Aj
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	2Fh ; '/'
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A8], ax
		or	ax, ax
		jnz	short loc_4FADC
		jmp	loc_4FBA8
; ���������������������������������������������������������������������������

loc_4FADC:				; CODE XREF: Gameflow_MainMenu_4F1A7+930j
		push	0Eh
		push	0D2h ; '�'
		push	4Eh ; 'N'
		push	0Bh
		push	[bp+var_A8]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_A8]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_A8]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_A8]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_A8]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A8]
		mov	dword ptr [bx+24h], 0
		mov	eax, [bp+var_70]
		mov	[bp+var_AC], eax
		mov	al, [bp+var_6C]
		mov	[bp+var_AD], al
		mov	bx, [bp+var_A8]
		mov	eax, [bp+var_AC]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_A8]
		mov	al, [bp+var_AD]
		mov	[bx+22h], al
		mov	bx, [bp+var_A8]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A8]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_A8]
		mov	eax, [bp+var_6A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_A8]
		mov	word ptr [bx+28h], 4
		mov	bx, [bp+var_A8]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_88]
		mov	bx, [bp+var_A8]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_A8]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_A8]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_A8]
		mov	word ptr [bx+2Eh], 9
		mov	ax, [bp+var_A8]
		jmp	short loc_4FBAC
; ���������������������������������������������������������������������������

loc_4FBA8:				; CODE XREF: Gameflow_MainMenu_4F1A7+932j
		mov	ax, [bp+var_A8]

loc_4FBAC:				; CODE XREF: Gameflow_MainMenu_4F1A7+9FFj
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E1FF
		add	sp, 6
		mov	[bp+var_B0], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+arg_2], 0
		jnz	short loc_4FBD2
		jmp	loc_4FC53
; ���������������������������������������������������������������������������

loc_4FBD2:				; CODE XREF: Gameflow_MainMenu_4F1A7+A26j
		push	[bp+var_2E]
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_34]
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	loc_4FD9C
; ���������������������������������������������������������������������������

loc_4FC53:				; CODE XREF: Gameflow_MainMenu_4F1A7+A28j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	byte ptr [bp+var_B4], 0
		mov	byte ptr [bp+var_B4+1],	0
		mov	[bp+var_B2], 0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_2E]
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_34]
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_3A]
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_80]
		mov	al, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_58]
		push	ax
		push	word ptr [bp+var_5C+2]
		push	word ptr [bp+var_5C]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_4E]
		push	ax
		push	word ptr [bp+var_52+2]
		push	word ptr [bp+var_52]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_DF9F
		add	sp, 2
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8

loc_4FD9C:				; CODE XREF: Gameflow_MainMenu_4F1A7+AA9j
		xor	eax, eax
		mov	[bp+var_B8], eax
		mov	[bp+var_BC], eax
		mov	[bp+var_BD], 0
		mov	al, byte_495F5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4FDC5
		mov	[bp+var_BD], 1
		mov	eax, dword_47ABB
		mov	[bp+var_BC], eax

loc_4FDC5:				; CODE XREF: Gameflow_MainMenu_4F1A7+C0Ej
		jmp	loc_4FE51
; ���������������������������������������������������������������������������

loc_4FDC8:				; CODE XREF: Gameflow_MainMenu_4F1A7+CB1j
		call	sub_D157
		cmp	[bp+var_BD], 0
		jz	short loc_4FDF3
		mov	eax, dword_47ABB
		sub	eax, [bp+var_BC]
		mov	ebx, 3Ch ; '<'
		xor	edx, edx
		div	ebx
		cmp	eax, 1Eh
		jbe	short loc_4FDF1
		jmp	short loc_4FE5B
; ���������������������������������������������������������������������������

loc_4FDF1:				; CODE XREF: Gameflow_MainMenu_4F1A7+C46j
		jmp	short loc_4FE00
; ���������������������������������������������������������������������������

loc_4FDF3:				; CODE XREF: Gameflow_MainMenu_4F1A7+C2Bj
		call	sub_28D68
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4FE00
		jmp	short loc_4FE5B
; ���������������������������������������������������������������������������

loc_4FE00:				; CODE XREF: Gameflow_MainMenu_4F1A7:loc_4FDF1j
					; Gameflow_MainMenu_4F1A7+C55j
		push	0
		push	1
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E328
		add	sp, 6
		mov	[bp+var_C0], ax
		cmp	[bp+var_C0], 0
		jz	short loc_4FE51
		cmp	[bp+var_332], 0
		jnz	short loc_4FE2A
		cmp	[bp+var_330], 0
		jz	short loc_4FE51

loc_4FE2A:				; CODE XREF: Gameflow_MainMenu_4F1A7+C7Aj
		push	[bp+var_330]
		push	[bp+var_332]
		mov	ax, [bp+var_334]
		sub	ax, [bp+var_396]
		push	ax
		mov	ax, [bp+var_336]
		sub	ax, [bp+var_398]
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_E2B2
		add	sp, 0Ah

loc_4FE51:				; CODE XREF: Gameflow_MainMenu_4F1A7:loc_4FDC5j
					; Gameflow_MainMenu_4F1A7+C73j ...
		cmp	[bp+var_88], 5
		jnz	short loc_4FE5B
		jmp	loc_4FDC8
; ���������������������������������������������������������������������������

loc_4FE5B:				; CODE XREF: Gameflow_MainMenu_4F1A7+C48j
					; Gameflow_MainMenu_4F1A7+C57j ...
		cmp	[bp+var_88], 2
		jnz	short loc_4FE6D
		push	1
		push	si
		call	sub_41FC6
		add	sp, 4

loc_4FE6D:				; CODE XREF: Gameflow_MainMenu_4F1A7+CB9j
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_DFCA
		add	sp, 2
		call	TextScrollDisplayB_ApplyHelperD_3F784
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		call	sub_28D49
		mov	al, byte ptr [bp+var_88]
		mov	[bp+var_BE], al
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_75], 0
		jz	short loc_4FECC
		cmp	[bp+var_7A], 0
		jz	short loc_4FECC
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4FECC:				; CODE XREF: Gameflow_MainMenu_4F1A7+D05j
					; Gameflow_MainMenu_4F1A7+D0Cj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		cmp	[bp+var_6B], 0
		jz	short loc_4FF04
		cmp	[bp+var_70], 0
		jz	short loc_4FF04
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4FF04:				; CODE XREF: Gameflow_MainMenu_4F1A7+D3Dj
					; Gameflow_MainMenu_4F1A7+D44j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		cmp	[bp+var_61], 0
		jz	short loc_4FF3C
		cmp	[bp+var_66], 0
		jz	short loc_4FF3C
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4FF3C:				; CODE XREF: Gameflow_MainMenu_4F1A7+D75j
					; Gameflow_MainMenu_4F1A7+D7Cj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_414]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_57], 0
		jz	short loc_4FF92
		cmp	[bp+var_5C], 0
		jz	short loc_4FF92
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4FF92:				; CODE XREF: Gameflow_MainMenu_4F1A7+DCBj
					; Gameflow_MainMenu_4F1A7+DD2j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	[bp+var_4D], 0
		jz	short loc_4FFCA
		cmp	[bp+var_52], 0
		jz	short loc_4FFCA
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4FFCA:				; CODE XREF: Gameflow_MainMenu_4F1A7+E03j
					; Gameflow_MainMenu_4F1A7+E0Aj
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+var_43], 0
		jz	short loc_50002
		cmp	[bp+var_48], 0
		jz	short loc_50002
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_50002:				; CODE XREF: Gameflow_MainMenu_4F1A7+E3Bj
					; Gameflow_MainMenu_4F1A7+E42j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_32A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_31C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2A4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_22C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_1B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_500BB
		cmp	[bp+var_28], 0
		jz	short loc_500BB
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_500BB:				; CODE XREF: Gameflow_MainMenu_4F1A7+EF4j
					; Gameflow_MainMenu_4F1A7+EFBj
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		cmp	[bp+var_19], 0
		jz	short loc_500F3
		cmp	[bp+var_1E], 0
		jz	short loc_500F3
		push	0
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_500F3:				; CODE XREF: Gameflow_MainMenu_4F1A7+F2Cj
					; Gameflow_MainMenu_4F1A7+F33j
		mov	[bp+var_1E], 0
		mov	[bp+var_19], 0
		mov	[bp+var_18], 0
		cmp	[bp+var_F], 0
		jz	short loc_5012B
		cmp	[bp+var_14], 0
		jz	short loc_5012B
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5012B:				; CODE XREF: Gameflow_MainMenu_4F1A7+F64j
					; Gameflow_MainMenu_4F1A7+F6Bj
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		mov	al, [bp+var_BE]
		pop	di
		pop	si
		leave
		retf
Gameflow_MainMenu_4F1A7	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
ovr186		ends
