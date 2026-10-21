ovr199		segment	para public 'OVERLAY' use16
		assume cs:ovr199
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_71680	proc far		; CODE XREF: sub_42440J

var_5C2		= word ptr -5C2h
var_592		= word ptr -592h
var_565		= dword	ptr -565h
var_561		= dword	ptr -561h
var_558		= word ptr -558h
var_53C		= word ptr -53Ch
var_539		= byte ptr -539h
var_536		= word ptr -536h
var_534		= word ptr -534h
var_532		= dword	ptr -532h
var_52E		= byte ptr -52Eh
var_52D		= byte ptr -52Dh
var_52C		= dword	ptr -52Ch
var_528		= word ptr -528h
var_526		= word ptr -526h
var_524		= dword	ptr -524h
var_520		= byte ptr -520h
var_51F		= dword	ptr -51Fh
var_51A		= word ptr -51Ah
var_518		= word ptr -518h
var_516		= dword	ptr -516h
var_512		= byte ptr -512h
var_511		= byte ptr -511h
var_510		= dword	ptr -510h
var_50C		= word ptr -50Ch
var_50A		= word ptr -50Ah
var_508		= dword	ptr -508h
var_504		= byte ptr -504h
var_503		= byte ptr -503h
var_502		= dword	ptr -502h
var_4FE		= word ptr -4FEh
var_4FC		= word ptr -4FCh
var_4FA		= dword	ptr -4FAh
var_4F6		= byte ptr -4F6h
var_4F5		= byte ptr -4F5h
var_4F4		= dword	ptr -4F4h
var_4F0		= word ptr -4F0h
var_4EE		= word ptr -4EEh
var_4EC		= dword	ptr -4ECh
var_4E8		= byte ptr -4E8h
var_4E7		= byte ptr -4E7h
var_4E6		= dword	ptr -4E6h
var_4E2		= word ptr -4E2h
var_4E0		= word ptr -4E0h
var_4DE		= dword	ptr -4DEh
var_4DA		= byte ptr -4DAh
var_4D9		= byte ptr -4D9h
var_4D8		= dword	ptr -4D8h
var_4D4		= word ptr -4D4h
var_4D2		= word ptr -4D2h
var_4D0		= dword	ptr -4D0h
var_4CC		= byte ptr -4CCh
var_4CB		= byte ptr -4CBh
var_4CA		= dword	ptr -4CAh
var_4C6		= word ptr -4C6h
var_44E		= word ptr -44Eh
var_3D6		= word ptr -3D6h
var_35E		= word ptr -35Eh
var_2E6		= word ptr -2E6h
var_26E		= word ptr -26Eh
var_26C		= word ptr -26Ch
var_26A		= word ptr -26Ah
var_268		= word ptr -268h
var_266		= word ptr -266h
var_264		= word ptr -264h
var_260		= word ptr -260h
var_25E		= word ptr -25Eh
var_25C		= word ptr -25Ch
var_25A		= word ptr -25Ah
var_258		= word ptr -258h
var_256		= word ptr -256h
var_252		= word ptr -252h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F8		= word ptr -1F8h
var_1F6		= word ptr -1F6h
var_1F4		= word ptr -1F4h
var_1F2		= word ptr -1F2h
var_1F0		= word ptr -1F0h
var_1EE		= word ptr -1EEh
var_1EC		= word ptr -1ECh
var_1EA		= word ptr -1EAh
var_1E8		= word ptr -1E8h
var_1E6		= word ptr -1E6h
var_1E4		= word ptr -1E4h
var_1E2		= word ptr -1E2h
var_1E0		= word ptr -1E0h
var_1DE		= word ptr -1DEh
var_1DC		= word ptr -1DCh
var_1DA		= word ptr -1DAh
var_1D8		= word ptr -1D8h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1CA		= word ptr -1CAh
var_1C8		= word ptr -1C8h
var_1C6		= word ptr -1C6h
var_1C4		= word ptr -1C4h
var_1C2		= word ptr -1C2h
var_1C0		= word ptr -1C0h
var_1BE		= word ptr -1BEh
var_1BC		= word ptr -1BCh
var_1BA		= word ptr -1BAh
var_1B8		= word ptr -1B8h
var_1B6		= word ptr -1B6h
var_1B4		= word ptr -1B4h
var_1B2		= word ptr -1B2h
var_1B0		= word ptr -1B0h
var_1AE		= word ptr -1AEh
var_1AC		= word ptr -1ACh
var_1AA		= word ptr -1AAh
var_1A8		= word ptr -1A8h
var_1A6		= word ptr -1A6h
var_1A4		= word ptr -1A4h
var_1A2		= word ptr -1A2h
var_1A0		= word ptr -1A0h
var_19E		= word ptr -19Eh
var_19C		= word ptr -19Ch
var_19A		= word ptr -19Ah
var_198		= word ptr -198h
var_196		= word ptr -196h
var_194		= word ptr -194h
var_192		= word ptr -192h
var_190		= word ptr -190h
var_18E		= word ptr -18Eh
var_18C		= word ptr -18Ch
var_18A		= word ptr -18Ah
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= word ptr -184h
var_182		= word ptr -182h
var_180		= word ptr -180h
var_17E		= word ptr -17Eh
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= dword	ptr -16Ch
var_168		= byte ptr -168h
var_167		= byte ptr -167h
var_166		= dword	ptr -166h
var_162		= word ptr -162h
var_160		= dword	ptr -160h
var_15C		= byte ptr -15Ch
var_15B		= byte ptr -15Bh
var_15A		= dword	ptr -15Ah
var_156		= dword	ptr -156h
var_152		= byte ptr -152h
var_151		= byte ptr -151h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= byte ptr -148h
var_147		= byte ptr -147h
var_146		= dword	ptr -146h
var_142		= dword	ptr -142h
var_13E		= byte ptr -13Eh
var_13D		= byte ptr -13Dh
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= byte ptr -134h
var_133		= byte ptr -133h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= byte ptr -12Ah
var_129		= byte ptr -129h
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= byte ptr -120h
var_11F		= byte ptr -11Fh
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= word ptr -116h
var_114		= word ptr -114h
var_112		= dword	ptr -112h
var_10E		= byte ptr -10Eh
var_10D		= byte ptr -10Dh
var_10C		= dword	ptr -10Ch
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= byte ptr -0FEh
var_FD		= byte ptr -0FDh
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= byte ptr -0F4h
var_F3		= byte ptr -0F3h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= word ptr -0EAh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= byte ptr -0E0h
var_DF		= byte ptr -0DFh
var_DE		= dword	ptr -0DEh
var_DA		= word ptr -0DAh
var_D8		= word ptr -0D8h
var_D6		= word ptr -0D6h
var_D4		= word ptr -0D4h
var_D2		= word ptr -0D2h
var_D0		= dword	ptr -0D0h
var_CC		= byte ptr -0CCh
var_CB		= byte ptr -0CBh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= byte ptr -0C2h
var_C1		= byte ptr -0C1h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= byte ptr -0B8h
var_B7		= byte ptr -0B7h
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= byte ptr -0AEh
var_AD		= byte ptr -0ADh
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= byte ptr -0A4h
var_A3		= byte ptr -0A3h
var_A2		= dword	ptr -0A2h
var_9E		= word ptr -9Eh
var_9C		= byte ptr -9Ch
var_9B		= word ptr -9Bh
var_98		= dword	ptr -98h
var_94		= byte ptr -94h
var_93		= byte ptr -93h
var_92		= dword	ptr -92h
var_8E		= word ptr -8Eh
var_8C		= byte ptr -8Ch
var_8B		= word ptr -8Bh
var_88		= dword	ptr -88h
var_84		= byte ptr -84h
var_83		= byte ptr -83h
var_82		= dword	ptr -82h
var_7E		= word ptr -7Eh
var_7C		= byte ptr -7Ch
var_7B		= word ptr -7Bh
var_78		= dword	ptr -78h
var_74		= byte ptr -74h
var_73		= byte ptr -73h
var_72		= dword	ptr -72h
var_6E		= word ptr -6Eh
var_6C		= byte ptr -6Ch
var_6B		= word ptr -6Bh
var_68		= dword	ptr -68h
var_64		= byte ptr -64h
var_63		= byte ptr -63h
var_62		= dword	ptr -62h
var_5E		= word ptr -5Eh
var_5B		= word ptr -5Bh
var_58		= dword	ptr -58h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= dword	ptr -52h
var_4E		= word ptr -4Eh
var_4C		= byte ptr -4Ch
var_4B		= word ptr -4Bh
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword	ptr -42h
var_3E		= word ptr -3Eh
var_3C		= byte ptr -3Ch
var_3B		= word ptr -3Bh
var_38		= dword	ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= word ptr -2Bh
var_28		= dword	ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= byte ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 5C2h
		push	si
		push	di
		mov	byte_495FC, 0
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	ax, word_46F46
		mov	[bp+var_4], ax
		mov	[bp+var_260], 0
		mov	[bp+var_25E], 0
		push	[bp+var_4]
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_26E], 0
		mov	[bp+var_26C], 0
		mov	[bp+var_26A], 0
		mov	[bp+var_268], 0
		mov	[bp+var_266], 13Fh
		mov	[bp+var_264], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_26E]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_25C], 0
		mov	[bp+var_25A], 18h
		mov	[bp+var_258], 13Fh
		mov	[bp+var_256], 97h ; '�'
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1],	0
		mov	[bp+var_10], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid3	; "mid3"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_8 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_2 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_2 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		mov	al, byte_46848
		mov	[bp+var_1E], al
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_1E]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_71825
		cmp	ax, 2
		jnz	short loc_71822
		jmp	loc_71991
; ���������������������������������������������������������������������������

loc_71822:				; CODE XREF: sub_71680+19Dj
		jmp	loc_71AFC
; ���������������������������������������������������������������������������

loc_71825:				; CODE XREF: sub_71680+198j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_252]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_71853
		jmp	loc_71950
; ���������������������������������������������������������������������������

loc_71853:				; CODE XREF: sub_71680+1CEj
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_4C6]
		push	ax
		mov	bx, [bp+var_4C6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_9 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_5C2]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_5C2], 556h
		mov	[bp+var_561], 100h
		mov	[bp+var_565], 0
		mov	[bp+var_5C2], 56Eh
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_5C2]
		push	ax
		mov	bx, [bp+var_5C2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_71918
; ���������������������������������������������������������������������������

loc_71902:				; CODE XREF: sub_71680+29Bj
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_71918:				; CODE XREF: sub_71680+280j
		cmp	si, 6Ah	; 'j'
		jle	short loc_71902
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_2], 1
		mov	[bp+var_5C2], 56Eh
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_5C2]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_71950:				; CODE XREF: sub_71680+1D0j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_252]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_7198E
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7198E
		mov	word_48F76, 5Ah	; 'Z'

loc_7198E:				; CODE XREF: sub_71680+2F9j
					; sub_71680+306j
		jmp	loc_71AFC
; ���������������������������������������������������������������������������

loc_71991:				; CODE XREF: sub_71680+19Fj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_252]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_719BF
		jmp	loc_71ABC
; ���������������������������������������������������������������������������

loc_719BF:				; CODE XREF: sub_71680+33Aj
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_4C6]
		push	ax
		mov	bx, [bp+var_4C6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_10 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_5C2]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_5C2], 556h
		mov	[bp+var_561], 100h
		mov	[bp+var_565], 0
		mov	[bp+var_5C2], 56Eh
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_5C2]
		push	ax
		mov	bx, [bp+var_5C2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_71A84
; ���������������������������������������������������������������������������

loc_71A6E:				; CODE XREF: sub_71680+407j
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_71A84:				; CODE XREF: sub_71680+3ECj
		cmp	si, 6Ah	; 'j'
		jle	short loc_71A6E
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_2], 1
		mov	[bp+var_5C2], 56Eh
		lea	ax, [bp+var_5C2]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_5C2]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_71ABC:				; CODE XREF: sub_71680+33Cj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_252]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_252]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_71AFA
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_71AFA
		mov	word_48F76, 0FFh

loc_71AFA:				; CODE XREF: sub_71680+465j
					; sub_71680+472j
		jmp	short $+2

loc_71AFC:				; CODE XREF: sub_71680:loc_71822j
					; sub_71680:loc_7198Ej
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CC], 2
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		mov	[bp+var_4D4], 0
		mov	[bp+var_4D2], 0FFFFh
		cmp	[bp+var_1], 0
		jz	short loc_71B86
		push	1
		lea	ax, [bp+var_252]
		push	ax
		lea	ax, [bp+var_592]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		push	3
		lea	ax, [bp+var_592]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_4D4]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_4D4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_592]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_71B86:				; CODE XREF: sub_71680+4A8j
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_28]
		push	ax
		push	15h
		lea	ax, [bp+var_44E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_2B], 0
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_38]
		push	ax
		push	1Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_3B], 0
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_48]
		push	ax
		push	11h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_4B], 0
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_58], 0
		mov	[bp+var_54], 2
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_58]
		push	ax
		push	13h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5B], 0
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_68], 0
		mov	[bp+var_64], 2
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_68]
		push	ax
		push	14h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_6B], 0
		lea	ax, [bp+var_68]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_78], 0
		mov	[bp+var_74], 2
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_78]
		push	ax
		push	15h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7B], 0
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_88], 0
		mov	[bp+var_84], 2
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_88]
		push	ax
		push	12h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_8B], 0
		lea	ax, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_98], 0
		mov	[bp+var_94], 2
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	0
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_9B], 0
		lea	ax, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_A8], 0
		mov	[bp+var_A4], 2
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		mov	[bp+var_B2], 0
		mov	[bp+var_AE], 2
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		mov	[bp+var_BC], 0
		mov	[bp+var_B8], 2
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		mov	[bp+var_C6], 0
		mov	[bp+var_C2], 2
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		mov	[bp+var_D0], 0
		mov	[bp+var_CC], 2
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		mov	[bp+var_4DE], 0
		mov	[bp+var_4DA], 2
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		mov	[bp+var_4E2], 0
		mov	[bp+var_4E0], 0FFFFh
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E8], 2
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		mov	[bp+var_4F0], 0
		mov	[bp+var_4EE], 0FFFFh
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F6], 2
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		mov	[bp+var_4FE], 0
		mov	[bp+var_4FC], 0FFFFh
		mov	[bp+var_508], 0
		mov	[bp+var_504], 2
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		mov	[bp+var_50C], 0
		mov	[bp+var_50A], 0FFFFh
		mov	[bp+var_516], 0
		mov	[bp+var_512], 2
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		mov	[bp+var_51A], 0
		mov	[bp+var_518], 0FFFFh
		mov	ax, word_44FE6
		mov	[bp+var_D2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_71F05
		jmp	loc_72197
; ���������������������������������������������������������������������������

loc_71F05:				; CODE XREF: sub_71680+880j
		push	3
		lea	ax, [bp+var_A8]
		push	ax
		push	28h ; '('
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_4E2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_4E2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	3
		lea	ax, [bp+var_B2]
		push	ax
		push	3Bh ; ';'
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_4F0]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_4F0]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	3
		lea	ax, [bp+var_BC]
		push	ax
		push	3Ch ; '<'
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_4FE]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_4FE]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	3
		lea	ax, [bp+var_C6]
		push	ax
		push	64h ; 'd'
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_50C]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_50C]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	3
		lea	ax, [bp+var_D0]
		push	ax
		push	65h ; 'e'
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_51A]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_51A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		mov	[bp+var_524], 0
		mov	[bp+var_520], 2
		mov	byte ptr [bp+var_51F], 0
		mov	[bp+var_51F+1],	0
		mov	[bp+var_528], 0
		mov	[bp+var_526], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_528]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	si, si
		jmp	loc_72143
; ���������������������������������������������������������������������������

loc_720AB:				; CODE XREF: sub_71680+AC8j
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, [bp+var_E4]
		push	ax
		mov	al, byte ptr [bp+si+var_D2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_528]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_528]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DF], 0
		jz	short loc_7212B
		cmp	[bp+var_E4], 0
		jz	short loc_7212B
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7212B:				; CODE XREF: sub_71680+A88j
					; sub_71680+A90j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		inc	si

loc_72143:				; CODE XREF: sub_71680+A28j
		cmp	si, 2
		jge	short loc_7214B
		jmp	loc_720AB
; ���������������������������������������������������������������������������

loc_7214B:				; CODE XREF: sub_71680+AC6j
		lea	ax, [bp+var_528]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_51F], 0
		jz	short loc_72180
		cmp	[bp+var_524], 0
		jz	short loc_72180
		push	0
		mov	al, [bp+var_520]
		push	ax
		lea	ax, [bp+var_524]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72180:				; CODE XREF: sub_71680+ADDj
					; sub_71680+AE5j
		mov	[bp+var_524], 0
		mov	byte ptr [bp+var_51F], 0
		mov	[bp+var_51F+1],	0

loc_72197:				; CODE XREF: sub_71680+882j
		cmp	byte_495FC, 0
		jnz	short loc_721A1
		jmp	loc_727A1
; ���������������������������������������������������������������������������

loc_721A1:				; CODE XREF: sub_71680+B1Cj
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_511], 0
		jz	short loc_721D6
		cmp	[bp+var_516], 0
		jz	short loc_721D6
		push	0
		mov	al, [bp+var_512]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_721D6:				; CODE XREF: sub_71680+B33j
					; sub_71680+B3Bj
		mov	[bp+var_516], 0
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_503], 0
		jz	short loc_72222
		cmp	[bp+var_508], 0
		jz	short loc_72222
		push	0
		mov	al, [bp+var_504]
		push	ax
		lea	ax, [bp+var_508]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72222:				; CODE XREF: sub_71680+B7Fj
					; sub_71680+B87j
		mov	[bp+var_508], 0
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4F5], 0
		jz	short loc_7226E
		cmp	[bp+var_4FA], 0
		jz	short loc_7226E
		push	0
		mov	al, [bp+var_4F6]
		push	ax
		lea	ax, [bp+var_4FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7226E:				; CODE XREF: sub_71680+BCBj
					; sub_71680+BD3j
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4E7], 0
		jz	short loc_722BA
		cmp	[bp+var_4EC], 0
		jz	short loc_722BA
		push	0
		mov	al, [bp+var_4E8]
		push	ax
		lea	ax, [bp+var_4EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_722BA:				; CODE XREF: sub_71680+C17j
					; sub_71680+C1Fj
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4D9], 0
		jz	short loc_72306
		cmp	[bp+var_4DE], 0
		jz	short loc_72306
		push	0
		mov	al, [bp+var_4DA]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72306:				; CODE XREF: sub_71680+C63j
					; sub_71680+C6Bj
		mov	[bp+var_4DE], 0
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		cmp	[bp+var_CB], 0
		jz	short loc_72345
		cmp	[bp+var_D0], 0
		jz	short loc_72345
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72345:				; CODE XREF: sub_71680+CA2j
					; sub_71680+CAAj
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_72384
		cmp	[bp+var_C6], 0
		jz	short loc_72384
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72384:				; CODE XREF: sub_71680+CE1j
					; sub_71680+CE9j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_723C3
		cmp	[bp+var_BC], 0
		jz	short loc_723C3
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_723C3:				; CODE XREF: sub_71680+D20j
					; sub_71680+D28j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		cmp	[bp+var_AD], 0
		jz	short loc_72402
		cmp	[bp+var_B2], 0
		jz	short loc_72402
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72402:				; CODE XREF: sub_71680+D5Fj
					; sub_71680+D67j
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		cmp	[bp+var_A3], 0
		jz	short loc_72441
		cmp	[bp+var_A8], 0
		jz	short loc_72441
		push	0
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72441:				; CODE XREF: sub_71680+D9Ej
					; sub_71680+DA6j
		mov	[bp+var_A8], 0
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_93], 0
		jz	short loc_7248F
		cmp	[bp+var_98], 0
		jz	short loc_7248F
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7248F:				; CODE XREF: sub_71680+DECj
					; sub_71680+DF4j
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_83], 0
		jz	short loc_724DD
		cmp	[bp+var_88], 0
		jz	short loc_724DD
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_724DD:				; CODE XREF: sub_71680+E3Aj
					; sub_71680+E42j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_72526
		cmp	[bp+var_78], 0
		jz	short loc_72526
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72526:				; CODE XREF: sub_71680+E86j
					; sub_71680+E8Dj
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_7256C
		cmp	[bp+var_68], 0
		jz	short loc_7256C
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7256C:				; CODE XREF: sub_71680+ECCj
					; sub_71680+ED3j
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_53], 0
		jz	short loc_725B2
		cmp	[bp+var_58], 0
		jz	short loc_725B2
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_725B2:				; CODE XREF: sub_71680+F12j
					; sub_71680+F19j
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_725F8
		cmp	[bp+var_48], 0
		jz	short loc_725F8
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_725F8:				; CODE XREF: sub_71680+F58j
					; sub_71680+F5Fj
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_7263E
		cmp	[bp+var_38], 0
		jz	short loc_7263E
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7263E:				; CODE XREF: sub_71680+F9Ej
					; sub_71680+FA5j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_72684
		cmp	[bp+var_28], 0
		jz	short loc_72684
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72684:				; CODE XREF: sub_71680+FE4j
					; sub_71680+FEBj
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_4D4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4CB], 0
		jz	short loc_726CD
		cmp	[bp+var_4D0], 0
		jz	short loc_726CD
		push	0
		mov	al, [bp+var_4CC]
		push	ax
		lea	ax, [bp+var_4D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_726CD:				; CODE XREF: sub_71680+102Aj
					; sub_71680+1032j
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		push	2
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_72717
		cmp	[bp+var_1C], 0
		jz	short loc_72717
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72717:				; CODE XREF: sub_71680+1077j
					; sub_71680+107Ej
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_727A1:				; CODE XREF: sub_71680+B1Ej
		cmp	[bp+var_1], 0
		jz	short loc_727EB
		mov	ax, word_48F76
		mov	[bp+var_D4], ax
		mov	[bp+var_D6], 0
		cmp	[bp+var_4D4], 0
		jz	short loc_727EB
		push	[bp+var_4D2]
		mov	bx, [bp+var_4D4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_D6]
		push	[bp+var_D4]
		push	[bp+var_4D2]
		mov	bx, [bp+var_4D4]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_727EB:				; CODE XREF: sub_71680+1125j
					; sub_71680+1139j
		lea	ax, [bp+var_260]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, [bp+var_E4]
		push	ax
		push	19h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	di, ax
		push	[bp+var_3E]
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	di
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	si, 1
		cmp	[bp+var_2], 0
		jz	short loc_728F4
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_4F0]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F18
		mov	word ptr [bp+var_E8+2],	ax
		mov	word ptr [bp+var_E8], 0
		cmp	[bp+var_4F0], 0
		jz	short loc_728F4
		push	[bp+var_4EE]
		mov	bx, [bp+var_4F0]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_E8]
		push	word ptr [bp+var_E8+2]
		push	[bp+var_4EE]
		mov	bx, [bp+var_4F0]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_728F4:				; CODE XREF: sub_71680+121Aj
					; sub_71680+1242j
		jmp	short loc_7291C
; ���������������������������������������������������������������������������

loc_728F6:				; CODE XREF: sub_71680+12B5j
		mov	[bp+var_EA], si
		inc	si
		mov	ax, [bp+var_EA]
		mov	[di+1Bh], ax
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		jmp	short loc_7291C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7291C
		jmp	short loc_72937
; ���������������������������������������������������������������������������

loc_7291C:				; CODE XREF: sub_71680:loc_728F4j
					; sub_71680+128Fj ...
		cmp	word ptr [bp+var_51F], 1Eh
		jnb	short loc_7292A
		cmp	byte ptr [bp+var_51F+2], 0
		jz	short loc_7292F

loc_7292A:				; CODE XREF: sub_71680+12A1j
		mov	ax, 1
		jmp	short loc_72931
; ���������������������������������������������������������������������������

loc_7292F:				; CODE XREF: sub_71680+12A8j
		xor	ax, ax

loc_72931:				; CODE XREF: sub_71680+12ADj
		mov	ah, 0
		or	ax, ax
		jz	short loc_728F6

loc_72937:				; CODE XREF: sub_71680+129Aj
		cmp	[bp+var_2], 0
		jz	short loc_7294A
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_7294A:				; CODE XREF: sub_71680+12BBj
		cmp	[bp+var_DF], 0
		jz	short loc_72972
		cmp	[bp+var_E4], 0
		jz	short loc_72972
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72972:				; CODE XREF: sub_71680+12CFj
					; sub_71680+12D7j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	0
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_729A2
		jmp	loc_72FA2
; ���������������������������������������������������������������������������

loc_729A2:				; CODE XREF: sub_71680+131Dj
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_511], 0
		jz	short loc_729D7
		cmp	[bp+var_516], 0
		jz	short loc_729D7
		push	0
		mov	al, [bp+var_512]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_729D7:				; CODE XREF: sub_71680+1334j
					; sub_71680+133Cj
		mov	[bp+var_516], 0
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_503], 0
		jz	short loc_72A23
		cmp	[bp+var_508], 0
		jz	short loc_72A23
		push	0
		mov	al, [bp+var_504]
		push	ax
		lea	ax, [bp+var_508]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72A23:				; CODE XREF: sub_71680+1380j
					; sub_71680+1388j
		mov	[bp+var_508], 0
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4F5], 0
		jz	short loc_72A6F
		cmp	[bp+var_4FA], 0
		jz	short loc_72A6F
		push	0
		mov	al, [bp+var_4F6]
		push	ax
		lea	ax, [bp+var_4FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72A6F:				; CODE XREF: sub_71680+13CCj
					; sub_71680+13D4j
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4E7], 0
		jz	short loc_72ABB
		cmp	[bp+var_4EC], 0
		jz	short loc_72ABB
		push	0
		mov	al, [bp+var_4E8]
		push	ax
		lea	ax, [bp+var_4EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72ABB:				; CODE XREF: sub_71680+1418j
					; sub_71680+1420j
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4D9], 0
		jz	short loc_72B07
		cmp	[bp+var_4DE], 0
		jz	short loc_72B07
		push	0
		mov	al, [bp+var_4DA]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72B07:				; CODE XREF: sub_71680+1464j
					; sub_71680+146Cj
		mov	[bp+var_4DE], 0
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		cmp	[bp+var_CB], 0
		jz	short loc_72B46
		cmp	[bp+var_D0], 0
		jz	short loc_72B46
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72B46:				; CODE XREF: sub_71680+14A3j
					; sub_71680+14ABj
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_72B85
		cmp	[bp+var_C6], 0
		jz	short loc_72B85
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72B85:				; CODE XREF: sub_71680+14E2j
					; sub_71680+14EAj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_72BC4
		cmp	[bp+var_BC], 0
		jz	short loc_72BC4
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72BC4:				; CODE XREF: sub_71680+1521j
					; sub_71680+1529j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		cmp	[bp+var_AD], 0
		jz	short loc_72C03
		cmp	[bp+var_B2], 0
		jz	short loc_72C03
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72C03:				; CODE XREF: sub_71680+1560j
					; sub_71680+1568j
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		cmp	[bp+var_A3], 0
		jz	short loc_72C42
		cmp	[bp+var_A8], 0
		jz	short loc_72C42
		push	0
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72C42:				; CODE XREF: sub_71680+159Fj
					; sub_71680+15A7j
		mov	[bp+var_A8], 0
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_93], 0
		jz	short loc_72C90
		cmp	[bp+var_98], 0
		jz	short loc_72C90
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72C90:				; CODE XREF: sub_71680+15EDj
					; sub_71680+15F5j
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_83], 0
		jz	short loc_72CDE
		cmp	[bp+var_88], 0
		jz	short loc_72CDE
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72CDE:				; CODE XREF: sub_71680+163Bj
					; sub_71680+1643j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_72D27
		cmp	[bp+var_78], 0
		jz	short loc_72D27
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72D27:				; CODE XREF: sub_71680+1687j
					; sub_71680+168Ej
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_72D6D
		cmp	[bp+var_68], 0
		jz	short loc_72D6D
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72D6D:				; CODE XREF: sub_71680+16CDj
					; sub_71680+16D4j
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_53], 0
		jz	short loc_72DB3
		cmp	[bp+var_58], 0
		jz	short loc_72DB3
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72DB3:				; CODE XREF: sub_71680+1713j
					; sub_71680+171Aj
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_72DF9
		cmp	[bp+var_48], 0
		jz	short loc_72DF9
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72DF9:				; CODE XREF: sub_71680+1759j
					; sub_71680+1760j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_72E3F
		cmp	[bp+var_38], 0
		jz	short loc_72E3F
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72E3F:				; CODE XREF: sub_71680+179Fj
					; sub_71680+17A6j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_72E85
		cmp	[bp+var_28], 0
		jz	short loc_72E85
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72E85:				; CODE XREF: sub_71680+17E5j
					; sub_71680+17ECj
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_4D4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4CB], 0
		jz	short loc_72ECE
		cmp	[bp+var_4D0], 0
		jz	short loc_72ECE
		push	0
		mov	al, [bp+var_4CC]
		push	ax
		lea	ax, [bp+var_4D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72ECE:				; CODE XREF: sub_71680+182Bj
					; sub_71680+1833j
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		push	2
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_72F18
		cmp	[bp+var_1C], 0
		jz	short loc_72F18
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_72F18:				; CODE XREF: sub_71680+1878j
					; sub_71680+187Fj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_72FA2:				; CODE XREF: sub_71680+131Fj
		cmp	[bp+var_2], 0
		jnz	short loc_72FAB
		jmp	loc_7302B
; ���������������������������������������������������������������������������

loc_72FAB:				; CODE XREF: sub_71680+1926j
		push	0
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_4FE]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	0
		lea	ax, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_50C]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	0
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_51A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F1A
		mov	[bp+var_D8], ax
		mov	[bp+var_DA], 0
		cmp	[bp+var_4FE], 0
		jz	short loc_7302B
		push	[bp+var_4FC]
		mov	bx, [bp+var_4FE]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_DA]
		push	[bp+var_D8]
		push	[bp+var_4FC]
		mov	bx, [bp+var_4FE]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7302B:				; CODE XREF: sub_71680+1928j
					; sub_71680+1979j
		lea	ax, [bp+var_260]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, [bp+var_E4]
		push	ax
		push	0Bh
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA], 2
		mov	byte ptr [bp+var_EA+1],	0
		mov	[bp+var_E8], 0
		push	3
		lea	ax, [bp+var_EE]
		push	ax
		push	0Fh
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F8], 0
		mov	[bp+var_F4], 2
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		push	3
		lea	ax, [bp+var_F8]
		push	ax
		push	10h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0FFE6h
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_FC+2],	ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_EE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_FC], ax
		push	0FFFFh
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_FE], ax
		push	[bp+var_4E]
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_FC+2]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	si, si
		jmp	loc_73361
; ���������������������������������������������������������������������������

loc_73180:				; CODE XREF: sub_71680+1CFCj
		mov	di, word ptr [bp+var_51F]
		cmp	di, 1Dh
		jge	short loc_7319B
		mov	word ptr [bp+var_102+2], si
		inc	si
		mov	bx, word ptr [bp+var_FC]
		mov	ax, word ptr [bp+var_102+2]
		mov	[bx+1Bh], ax
		jmp	short loc_7320F
; ���������������������������������������������������������������������������

loc_7319B:				; CODE XREF: sub_71680+1B07j
		cmp	di, 1Dh
		jnz	short loc_731FF
		push	word ptr [bp+var_FC]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_FC], 0
		jz	short loc_731CB
		push	3
		push	word ptr [bp+var_FC]
		mov	bx, word ptr [bp+var_FC]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_731CB:				; CODE XREF: sub_71680+1B36j
		push	word ptr [bp+var_FE]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Fh
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4
		xor	si, si
		mov	word ptr [bp+var_102], si
		inc	si
		mov	bx, word ptr [bp+var_FE]
		mov	ax, word ptr [bp+var_102]
		mov	[bx+1Bh], ax
		jmp	short loc_7320F
; ���������������������������������������������������������������������������

loc_731FF:				; CODE XREF: sub_71680+1B1Ej
		mov	word ptr [bp+var_106+2], si
		inc	si
		mov	bx, word ptr [bp+var_FE]
		mov	ax, word ptr [bp+var_106+2]
		mov	[bx+1Bh], ax

loc_7320F:				; CODE XREF: sub_71680+1B19j
					; sub_71680+1B7Dj
		cmp	di, 32h	; '2'
		jnz	short loc_73272
		cmp	[bp+var_2], 0
		jz	short loc_73272
		push	0
		lea	ax, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_50C]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F6A
		mov	word ptr [bp+var_106], ax
		mov	word ptr [bp-108h], 0
		cmp	[bp+var_50C], 0
		jz	short loc_73272
		push	[bp+var_50A]
		mov	bx, [bp+var_50C]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-108h]
		push	word ptr [bp+var_106]
		push	[bp+var_50A]
		mov	bx, [bp+var_50C]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_73272:				; CODE XREF: sub_71680+1B92j
					; sub_71680+1B98j ...
		cmp	di, 34h	; '4'
		jnz	short loc_732D5
		cmp	[bp+var_2], 0
		jz	short loc_732D5
		push	0
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_51A]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F6C
		mov	word ptr [bp+var_10C+2], ax
		mov	word ptr [bp+var_10C], 0
		cmp	[bp+var_51A], 0
		jz	short loc_732D5
		push	[bp+var_518]
		mov	bx, [bp+var_51A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_10C]
		push	word ptr [bp+var_10C+2]
		push	[bp+var_518]
		mov	bx, [bp+var_51A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_732D5:				; CODE XREF: sub_71680+1BF5j
					; sub_71680+1BFBj ...
		cmp	di, 3Bh	; ';'
		jnz	short loc_73324
		cmp	[bp+var_2], 0
		jz	short loc_73324
		mov	ax, word_48F6C
		mov	word ptr [bp+var_10E], ax
		mov	word ptr [bp+var_112+2], 0
		cmp	[bp+var_51A], 0
		jz	short loc_73324
		push	[bp+var_518]
		mov	bx, [bp+var_51A]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_112+2]
		push	word ptr [bp+var_10E]
		push	[bp+var_518]
		mov	bx, [bp+var_51A]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_73324:				; CODE XREF: sub_71680+1C58j
					; sub_71680+1C5Ej ...
		mov	ax, di
		mov	bx, 8
		cwd
		idiv	bx
		or	dx, dx
		jnz	short loc_73347
		mov	ax, di
		mov	bx, 3
		cwd
		idiv	bx
		mov	word ptr [bp+var_112], dx
		mov	bx, word ptr [bp+var_FC+2]
		mov	ax, word ptr [bp+var_112]
		mov	[bx+1Bh], ax

loc_73347:				; CODE XREF: sub_71680+1CAEj
		jmp	short loc_73354
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_73354
		jmp	short loc_7337F
; ���������������������������������������������������������������������������

loc_73354:				; CODE XREF: sub_71680:loc_73347j
					; sub_71680+1CD0j
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_73361:				; CODE XREF: sub_71680+1AFDj
		cmp	word ptr [bp+var_51F], 4Bh ; 'K'
		jnb	short loc_7336F
		cmp	byte ptr [bp+var_51F+2], 0
		jz	short loc_73374

loc_7336F:				; CODE XREF: sub_71680+1CE6j
		mov	ax, 1
		jmp	short loc_73376
; ���������������������������������������������������������������������������

loc_73374:				; CODE XREF: sub_71680+1CEDj
		xor	ax, ax

loc_73376:				; CODE XREF: sub_71680+1CF2j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7337F
		jmp	loc_73180
; ���������������������������������������������������������������������������

loc_7337F:				; CODE XREF: sub_71680+1CD2j
					; sub_71680+1CFAj
		cmp	[bp+var_2], 0
		jz	short loc_733AC
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_733AC:				; CODE XREF: sub_71680+1D03j
		cmp	[bp+var_F3], 0
		jz	short loc_733D4
		cmp	[bp+var_F8], 0
		jz	short loc_733D4
		push	0
		mov	al, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_733D4:				; CODE XREF: sub_71680+1D31j
					; sub_71680+1D39j
		mov	[bp+var_F8], 0
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		cmp	byte ptr [bp+var_EA+1],	0
		jz	short loc_73413
		cmp	[bp+var_EE], 0
		jz	short loc_73413
		push	0
		mov	al, byte ptr [bp+var_EA]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73413:				; CODE XREF: sub_71680+1D70j
					; sub_71680+1D78j
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA+1],	0
		mov	[bp+var_E8], 0
		cmp	[bp+var_DF], 0
		jz	short loc_73452
		cmp	[bp+var_E4], 0
		jz	short loc_73452
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73452:				; CODE XREF: sub_71680+1DAFj
					; sub_71680+1DB7j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	0
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_73482
		jmp	loc_73A82
; ���������������������������������������������������������������������������

loc_73482:				; CODE XREF: sub_71680+1DFDj
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_511], 0
		jz	short loc_734B7
		cmp	[bp+var_516], 0
		jz	short loc_734B7
		push	0
		mov	al, [bp+var_512]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_734B7:				; CODE XREF: sub_71680+1E14j
					; sub_71680+1E1Cj
		mov	[bp+var_516], 0
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_503], 0
		jz	short loc_73503
		cmp	[bp+var_508], 0
		jz	short loc_73503
		push	0
		mov	al, [bp+var_504]
		push	ax
		lea	ax, [bp+var_508]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73503:				; CODE XREF: sub_71680+1E60j
					; sub_71680+1E68j
		mov	[bp+var_508], 0
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4F5], 0
		jz	short loc_7354F
		cmp	[bp+var_4FA], 0
		jz	short loc_7354F
		push	0
		mov	al, [bp+var_4F6]
		push	ax
		lea	ax, [bp+var_4FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7354F:				; CODE XREF: sub_71680+1EACj
					; sub_71680+1EB4j
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4E7], 0
		jz	short loc_7359B
		cmp	[bp+var_4EC], 0
		jz	short loc_7359B
		push	0
		mov	al, [bp+var_4E8]
		push	ax
		lea	ax, [bp+var_4EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7359B:				; CODE XREF: sub_71680+1EF8j
					; sub_71680+1F00j
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4D9], 0
		jz	short loc_735E7
		cmp	[bp+var_4DE], 0
		jz	short loc_735E7
		push	0
		mov	al, [bp+var_4DA]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_735E7:				; CODE XREF: sub_71680+1F44j
					; sub_71680+1F4Cj
		mov	[bp+var_4DE], 0
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		cmp	[bp+var_CB], 0
		jz	short loc_73626
		cmp	[bp+var_D0], 0
		jz	short loc_73626
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73626:				; CODE XREF: sub_71680+1F83j
					; sub_71680+1F8Bj
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_73665
		cmp	[bp+var_C6], 0
		jz	short loc_73665
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73665:				; CODE XREF: sub_71680+1FC2j
					; sub_71680+1FCAj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_736A4
		cmp	[bp+var_BC], 0
		jz	short loc_736A4
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_736A4:				; CODE XREF: sub_71680+2001j
					; sub_71680+2009j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		cmp	[bp+var_AD], 0
		jz	short loc_736E3
		cmp	[bp+var_B2], 0
		jz	short loc_736E3
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_736E3:				; CODE XREF: sub_71680+2040j
					; sub_71680+2048j
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		cmp	[bp+var_A3], 0
		jz	short loc_73722
		cmp	[bp+var_A8], 0
		jz	short loc_73722
		push	0
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73722:				; CODE XREF: sub_71680+207Fj
					; sub_71680+2087j
		mov	[bp+var_A8], 0
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_93], 0
		jz	short loc_73770
		cmp	[bp+var_98], 0
		jz	short loc_73770
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73770:				; CODE XREF: sub_71680+20CDj
					; sub_71680+20D5j
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_83], 0
		jz	short loc_737BE
		cmp	[bp+var_88], 0
		jz	short loc_737BE
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_737BE:				; CODE XREF: sub_71680+211Bj
					; sub_71680+2123j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_73807
		cmp	[bp+var_78], 0
		jz	short loc_73807
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73807:				; CODE XREF: sub_71680+2167j
					; sub_71680+216Ej
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_7384D
		cmp	[bp+var_68], 0
		jz	short loc_7384D
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7384D:				; CODE XREF: sub_71680+21ADj
					; sub_71680+21B4j
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_53], 0
		jz	short loc_73893
		cmp	[bp+var_58], 0
		jz	short loc_73893
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73893:				; CODE XREF: sub_71680+21F3j
					; sub_71680+21FAj
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_738D9
		cmp	[bp+var_48], 0
		jz	short loc_738D9
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_738D9:				; CODE XREF: sub_71680+2239j
					; sub_71680+2240j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_7391F
		cmp	[bp+var_38], 0
		jz	short loc_7391F
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7391F:				; CODE XREF: sub_71680+227Fj
					; sub_71680+2286j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_73965
		cmp	[bp+var_28], 0
		jz	short loc_73965
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73965:				; CODE XREF: sub_71680+22C5j
					; sub_71680+22CCj
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_4D4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4CB], 0
		jz	short loc_739AE
		cmp	[bp+var_4D0], 0
		jz	short loc_739AE
		push	0
		mov	al, [bp+var_4CC]
		push	ax
		lea	ax, [bp+var_4D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_739AE:				; CODE XREF: sub_71680+230Bj
					; sub_71680+2313j
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		push	2
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_739F8
		cmp	[bp+var_1C], 0
		jz	short loc_739F8
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_739F8:				; CODE XREF: sub_71680+2358j
					; sub_71680+235Fj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_73A82:				; CODE XREF: sub_71680+1DFFj
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA], 2
		mov	byte ptr [bp+var_EA+1],	0
		mov	[bp+var_E8], 0
		mov	[bp+var_524], 0
		mov	[bp+var_520], 2
		mov	byte ptr [bp+var_51F], 0
		mov	[bp+var_51F+1],	0
		mov	[bp+var_528], 0
		mov	[bp+var_526], 0FFFFh
		mov	[bp+var_532], 0
		mov	[bp+var_52E], 2
		mov	[bp+var_52D], 0
		mov	[bp+var_52C], 0
		mov	[bp+var_536], 0
		mov	[bp+var_534], 0FFFFh
		cmp	[bp+var_2], 0
		jnz	short loc_73B13
		jmp	loc_73BCD
; ���������������������������������������������������������������������������

loc_73B13:				; CODE XREF: sub_71680+248Ej
		push	3
		lea	ax, [bp+var_E4]
		push	ax
		push	4Eh ; 'N'
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_528]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_528]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_EE]
		push	ax
		push	14h
		lea	ax, [bp+var_4C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_536]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_536]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F3E
		mov	word ptr [bp+var_F2+2],	ax
		mov	word ptr [bp+var_F2], 0
		cmp	[bp+var_528], 0
		jz	short loc_73BCD
		push	[bp+var_526]
		mov	bx, [bp+var_528]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_F2]
		push	word ptr [bp+var_F2+2]
		push	[bp+var_526]
		mov	bx, [bp+var_528]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_73BCD:				; CODE XREF: sub_71680+2490j
					; sub_71680+251Bj
		mov	[bp+var_FC], 0
		mov	byte ptr [bp+var_F8], 2
		mov	byte ptr [bp+var_F8+1],	0
		mov	[bp+var_F8+2], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	9
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_102+2],	0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	0Ah
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_112+2],	0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10C+2],	0
		push	3
		lea	ax, [bp+var_112+2]
		push	ax
		push	8
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	dword ptr [bp-114h], 0
		push	3
		lea	ax, [bp+var_11A]
		push	ax
		push	0Ch
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_124], 0
		mov	[bp+var_120], 2
		mov	[bp+var_11F], 0
		mov	[bp+var_11E], 0
		push	3
		lea	ax, [bp+var_124]
		push	ax
		push	3
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_12E], 0
		mov	[bp+var_12A], 2
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		push	3
		lea	ax, [bp+var_12E]
		push	ax
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_138], 0
		mov	[bp+var_134], 2
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		push	3
		lea	ax, [bp+var_138]
		push	ax
		push	4
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_142], 0
		mov	[bp+var_13E], 2
		mov	[bp+var_13D], 0
		mov	[bp+var_13C], 0
		push	3
		lea	ax, [bp+var_142]
		push	ax
		push	7
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_14C], 0
		mov	[bp+var_148], 2
		mov	[bp+var_147], 0
		mov	[bp+var_146], 0
		push	3
		lea	ax, [bp+var_14C]
		push	ax
		push	6
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_156], 0
		mov	[bp+var_152], 2
		mov	[bp+var_151], 0
		mov	[bp+var_150], 0
		push	3
		lea	ax, [bp+var_156]
		push	ax
		push	5
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_160], 0
		mov	[bp+var_15C], 2
		mov	[bp+var_15B], 0
		mov	[bp+var_15A], 0
		push	3
		lea	ax, [bp+var_160]
		push	ax
		push	0
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	100h
		call	Runtime_StackOverflowCheck_2C319
		add	sp, 2
		mov	[bp+var_162], ax
		mov	[bp+var_16C], 0
		mov	[bp+var_168], 2
		mov	[bp+var_167], 0
		mov	[bp+var_166], 0
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		push	17h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	100h
		push	0
		mov	al, [bp+var_168]
		push	ax
		push	word ptr [bp+var_16C+2]
		push	word ptr [bp+var_16C]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	ds
		push	[bp+var_162]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		cmp	[bp+var_167], 0
		jz	short loc_73E88
		cmp	[bp+var_16C], 0
		jz	short loc_73E88
		push	0
		mov	al, [bp+var_168]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_73E88:				; CODE XREF: sub_71680+27E5j
					; sub_71680+27EDj
		mov	[bp+var_16C], 0
		mov	[bp+var_167], 0
		mov	[bp+var_166], 0
		lea	ax, [bp+var_260]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_558]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	di, 0FFF6h
		mov	[bp+var_16E], 0
		mov	[bp+var_172], 0
		mov	[bp+var_174], 0
		mov	[bp+var_176], 0
		push	0
		push	0FFCDh
		push	0FFFFh
		lea	ax, [bp+var_160]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp+var_178], ax
		mov	ax, di
		mov	bx, 6
		cwd
		idiv	bx
		mov	[bp+var_17C], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_17E], ax
		or	ax, ax
		jz	short loc_73F5C
		push	0
		push	0
		push	0
		lea	ax, [bp+var_12E]
		push	ax
		push	[bp+var_17E]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_17E]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_17E]
		mov	ax, [bp+var_17C]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_17E]
		jmp	short loc_73F60
; ���������������������������������������������������������������������������

loc_73F5C:				; CODE XREF: sub_71680+2886j
		mov	ax, [bp+var_17E]

loc_73F60:				; CODE XREF: sub_71680+28DAj
		mov	[bp+var_17A], ax
		mov	ax, di
		mov	bx, 6
		cwd
		idiv	bx
		mov	[bp+var_182], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_184], ax
		or	ax, ax
		jz	short loc_73FD7
		push	0
		push	0
		push	140h
		lea	ax, [bp+var_12E]
		push	ax
		push	[bp+var_184]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_184]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_184]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_184]
		mov	ax, [bp+var_182]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_184]
		jmp	short loc_73FDB
; ���������������������������������������������������������������������������

loc_73FD7:				; CODE XREF: sub_71680+2900j
		mov	ax, [bp+var_184]

loc_73FDB:				; CODE XREF: sub_71680+2955j
		mov	[bp+var_180], ax
		mov	ax, di
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_188], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18A], ax
		or	ax, ax
		jz	short loc_74051
		push	0
		push	0
		push	0
		lea	ax, [bp+var_138]
		push	ax
		push	[bp+var_18A]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_18A]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_18A]
		mov	ax, [bp+var_188]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_18A]
		jmp	short loc_74055
; ���������������������������������������������������������������������������

loc_74051:				; CODE XREF: sub_71680+297Bj
		mov	ax, [bp+var_18A]

loc_74055:				; CODE XREF: sub_71680+29CFj
		mov	[bp+var_186], ax
		mov	ax, di
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_18E], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_190], ax
		or	ax, ax
		jz	short loc_740CC
		push	0
		push	0
		push	140h
		lea	ax, [bp+var_138]
		push	ax
		push	[bp+var_190]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_190]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_190]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_190]
		mov	ax, [bp+var_18E]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_190]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_190]
		jmp	short loc_740D0
; ���������������������������������������������������������������������������

loc_740CC:				; CODE XREF: sub_71680+29F5j
		mov	ax, [bp+var_190]

loc_740D0:				; CODE XREF: sub_71680+2A4Aj
		mov	[bp+var_18C], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_194], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_196], ax
		or	ax, ax
		jz	short loc_74148
		push	0
		push	0
		push	0
		lea	ax, [bp+var_142]
		push	ax
		push	[bp+var_196]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_196]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_196]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_196]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_196]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_196]
		mov	ax, [bp+var_194]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_196]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_196]
		jmp	short loc_7414C
; ���������������������������������������������������������������������������

loc_74148:				; CODE XREF: sub_71680+2A72j
		mov	ax, [bp+var_196]

loc_7414C:				; CODE XREF: sub_71680+2AC6j
		mov	[bp+var_192], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_19A], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_19C], ax
		or	ax, ax
		jz	short loc_741C5
		push	0
		push	0
		push	140h
		lea	ax, [bp+var_142]
		push	ax
		push	[bp+var_19C]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_19C]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_19C]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_19C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_19C]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_19C]
		mov	ax, [bp+var_19A]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_19C]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_19C]
		jmp	short loc_741C9
; ���������������������������������������������������������������������������

loc_741C5:				; CODE XREF: sub_71680+2AEEj
		mov	ax, [bp+var_19C]

loc_741C9:				; CODE XREF: sub_71680+2B43j
		mov	[bp+var_198], ax
		mov	[bp+var_1A0], di
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1A2], ax
		or	ax, ax
		jz	short loc_74237
		push	0
		push	0
		push	0
		lea	ax, [bp+var_14C]
		push	ax
		push	[bp+var_1A2]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1A2]
		mov	ax, [bp+var_1A0]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1A2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_1A2]
		jmp	short loc_7423B
; ���������������������������������������������������������������������������

loc_74237:				; CODE XREF: sub_71680+2B61j
		mov	ax, [bp+var_1A2]

loc_7423B:				; CODE XREF: sub_71680+2BB5j
		mov	[bp+var_19E], ax
		mov	[bp+var_1A6], di
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1A8], ax
		or	ax, ax
		jz	short loc_742AA
		push	0
		push	0
		push	140h
		lea	ax, [bp+var_14C]
		push	ax
		push	[bp+var_1A8]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1A8]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1A8]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1A8]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1A8]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1A8]
		mov	ax, [bp+var_1A6]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1A8]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_1A8]
		jmp	short loc_742AE
; ���������������������������������������������������������������������������

loc_742AA:				; CODE XREF: sub_71680+2BD3j
		mov	ax, [bp+var_1A8]

loc_742AE:				; CODE XREF: sub_71680+2C28j
		mov	[bp+var_1A4], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1AC], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1AE], ax
		or	ax, ax
		jz	short loc_74327
		push	0
		push	0
		push	0
		lea	ax, [bp+var_156]
		push	ax
		push	[bp+var_1AE]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1AE]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1AE]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1AE]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1AE]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1AE]
		mov	ax, [bp+var_1AC]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1AE]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_1AE]
		jmp	short loc_7432B
; ���������������������������������������������������������������������������

loc_74327:				; CODE XREF: sub_71680+2C51j
		mov	ax, [bp+var_1AE]

loc_7432B:				; CODE XREF: sub_71680+2CA5j
		mov	[bp+var_1AA], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1B2], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1B4], ax
		or	ax, ax
		jz	short loc_743A5
		push	0
		push	0
		push	140h
		lea	ax, [bp+var_156]
		push	ax
		push	[bp+var_1B4]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1B4]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1B4]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1B4]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1B4]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1B4]
		mov	ax, [bp+var_1B2]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1B4]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_1B4]
		jmp	short loc_743A9
; ���������������������������������������������������������������������������

loc_743A5:				; CODE XREF: sub_71680+2CCEj
		mov	ax, [bp+var_1B4]

loc_743A9:				; CODE XREF: sub_71680+2D23j
		mov	[bp+var_1B0], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1B8], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1BA], ax
		or	ax, ax
		jz	short loc_74423
		push	0
		push	0
		push	4D1h
		lea	ax, [bp+var_FC]
		push	ax
		push	[bp+var_1BA]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1BA]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1BA]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1BA]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1BA]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1BA]
		mov	ax, [bp+var_1B8]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1BA]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_1BA]
		jmp	short loc_74427
; ���������������������������������������������������������������������������

loc_74423:				; CODE XREF: sub_71680+2D4Cj
		mov	ax, [bp+var_1BA]

loc_74427:				; CODE XREF: sub_71680+2DA1j
		mov	[bp+var_1B6], ax
		mov	[bp+var_1BE], di
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C0], ax
		or	ax, ax
		jz	short loc_74496
		push	0
		push	0
		push	3B6h
		lea	ax, [bp+var_106]
		push	ax
		push	[bp+var_1C0]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_1C0]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_1C0]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_1C0]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_1C0]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_1C0]
		mov	ax, [bp+var_1BE]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C0]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_1C0]
		jmp	short loc_7449A
; ���������������������������������������������������������������������������

loc_74496:				; CODE XREF: sub_71680+2DBFj
		mov	ax, [bp+var_1C0]

loc_7449A:				; CODE XREF: sub_71680+2E14j
		mov	[bp+var_1BC], ax
		push	0
		push	0
		mov	ax, di
		shl	ax, 1
		mov	bx, 3
		cwd
		idiv	bx
		push	ax
		push	0
		push	23Dh
		lea	ax, [bp+var_112+2]
		push	ax
		push	0
		call	sub_A837
		add	sp, 0Eh
		mov	[bp+var_1C2], ax
		push	0
		push	0
		push	[bp+var_16E]
		push	0FFCBh
		push	0FFE2h
		lea	ax, [bp+var_11A]
		push	ax
		push	0
		call	sub_B995
		add	sp, 0Eh
		mov	[bp+var_1C4], ax
		push	0
		push	0
		push	[bp+var_16E]
		push	0FFE2h
		push	0FFE2h
		lea	ax, [bp+var_124]
		push	ax
		push	0
		call	sub_A837
		add	sp, 0Eh
		mov	[bp+var_1C6], ax
		push	[bp+var_162]
		push	[bp+var_1C4]
		call	sub_BA1C
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_6E]
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_17A]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_180]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_186]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_18C]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_192]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_198]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_19E]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1A4]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1AA]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1B0]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1C2]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1BC]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1B6]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1C4]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_1C6]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	loc_74C4C
; ���������������������������������������������������������������������������

loc_7464F:				; CODE XREF: sub_71680+35E8j
		mov	si, [bp+var_53C+1]
		cmp	si, 9
		jnz	short loc_7465E
		mov	[bp+var_170], 0

loc_7465E:				; CODE XREF: sub_71680+2FD6j
		cmp	si, 0Ah
		jle	short loc_746A4
		cmp	si, 11h
		jge	short loc_746A4
		dec	[bp+var_16E]
		mov	ax, [bp+var_16E]
		mov	[bp+var_1C8], ax
		mov	bx, [bp+var_1C4]
		mov	ax, [bp+var_1C8]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C4]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_16E]
		mov	[bp+var_1CA], ax
		mov	bx, [bp+var_1C6]
		mov	ax, [bp+var_1CA]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C6]
		mov	word ptr [bx+1Fh], 0

loc_746A4:				; CODE XREF: sub_71680+2FE1j
					; sub_71680+2FE6j
		push	[bp+var_186]
		mov	bx, [bp+var_186]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	ax, 0FEC1h
		jge	short loc_746CA
		push	0
		push	280h
		push	[bp+var_186]
		call	sub_2E29E
		add	sp, 6

loc_746CA:				; CODE XREF: sub_71680+3037j
		push	[bp+var_192]
		mov	bx, [bp+var_192]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	ax, 0FEC1h
		jge	short loc_746F0
		push	0
		push	280h
		push	[bp+var_192]
		call	sub_2E29E
		add	sp, 6

loc_746F0:				; CODE XREF: sub_71680+305Dj
		push	[bp+var_19E]
		mov	bx, [bp+var_19E]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	ax, 0FEC1h
		jge	short loc_74716
		push	0
		push	280h
		push	[bp+var_19E]
		call	sub_2E29E
		add	sp, 6

loc_74716:				; CODE XREF: sub_71680+3083j
		push	[bp+var_1AA]
		mov	bx, [bp+var_1AA]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	ax, 0FEC1h
		jge	short loc_7473C
		push	0
		push	280h
		push	[bp+var_1AA]
		call	sub_2E29E
		add	sp, 6

loc_7473C:				; CODE XREF: sub_71680+30A9j
		push	[bp+var_1A4]
		mov	bx, [bp+var_1A4]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	ax, 0FEC1h
		jge	short loc_74762
		push	0
		push	280h
		push	[bp+var_1A4]
		call	sub_2E29E
		add	sp, 6

loc_74762:				; CODE XREF: sub_71680+30CFj
		push	[bp+var_1B0]
		mov	bx, [bp+var_1B0]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		cmp	ax, 0FEC1h
		jge	short loc_74788
		push	0
		push	280h
		push	[bp+var_1B0]
		call	sub_2E29E
		add	sp, 6

loc_74788:				; CODE XREF: sub_71680+30F5j
		cmp	si, 44h	; 'D'
		jg	short loc_74790
		jmp	loc_74949
; ���������������������������������������������������������������������������

loc_74790:				; CODE XREF: sub_71680+310Bj
		or	di, di
		jnz	short loc_74797
		jmp	loc_74949
; ���������������������������������������������������������������������������

loc_74797:				; CODE XREF: sub_71680+3112j
		inc	[bp+var_172]
		mov	ax, [bp+var_172]
		cmp	ax, 5
		jnz	short loc_747AB
		inc	di
		mov	[bp+var_172], 0

loc_747AB:				; CODE XREF: sub_71680+3122j
		cmp	di, 0FFFFh
		jl	short loc_747B2
		xor	di, di

loc_747B2:				; CODE XREF: sub_71680+312Ej
		mov	ax, di
		mov	bx, 6
		cwd
		idiv	bx
		mov	[bp+var_1CC], ax
		mov	bx, [bp+var_17A]
		mov	ax, [bp+var_1CC]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		mov	bx, 6
		cwd
		idiv	bx
		mov	[bp+var_1CE], ax
		mov	bx, [bp+var_180]
		mov	ax, [bp+var_1CE]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1D0], ax
		mov	bx, [bp+var_186]
		mov	ax, [bp+var_1D0]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1D2], ax
		mov	bx, [bp+var_18C]
		mov	ax, [bp+var_1D2]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		shl	ax, 1
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1D4], ax
		mov	bx, [bp+var_192]
		mov	ax, [bp+var_1D4]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		shl	ax, 1
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1D6], ax
		mov	bx, [bp+var_198]
		mov	ax, [bp+var_1D6]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_198]
		mov	word ptr [bx+1Fh], 0
		mov	[bp+var_1D8], di
		mov	bx, [bp+var_19E]
		mov	ax, [bp+var_1D8]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_19E]
		mov	word ptr [bx+1Fh], 0
		mov	[bp+var_1DA], di
		mov	bx, [bp+var_1A4]
		mov	ax, [bp+var_1DA]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1A4]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		shl	ax, 2
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1DC], ax
		mov	bx, [bp+var_1AA]
		mov	ax, [bp+var_1DC]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1AA]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		shl	ax, 2
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1DE], ax
		mov	bx, [bp+var_1B0]
		mov	ax, [bp+var_1DE]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1B0]
		mov	word ptr [bx+1Fh], 0
		mov	[bp+var_1E0], di
		mov	bx, [bp+var_1BC]
		mov	ax, [bp+var_1E0]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1BC]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		shl	ax, 2
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1E2], ax
		mov	bx, [bp+var_1B6]
		mov	ax, [bp+var_1E2]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1B6]
		mov	word ptr [bx+1Fh], 0
		mov	ax, di
		shl	ax, 1
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1E4], ax
		mov	bx, [bp+var_1C2]
		mov	ax, [bp+var_1E4]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C2]
		mov	word ptr [bx+1Fh], 0

loc_74949:				; CODE XREF: sub_71680+310Dj
					; sub_71680+3114j
		cmp	si, 25h	; '%'
		jnz	short loc_74954
		mov	[bp+var_170], 0

loc_74954:				; CODE XREF: sub_71680+32CCj
		cmp	si, 26h	; '&'
		jle	short loc_749AD
		cmp	si, 37h	; '7'
		jge	short loc_749AD
		inc	[bp+var_170]
		mov	ax, [bp+var_170]
		cmp	ax, 5
		jnz	short loc_749AD
		dec	[bp+var_16E]
		mov	ax, [bp+var_16E]
		mov	[bp+var_1E6], ax
		mov	bx, [bp+var_1C4]
		mov	ax, [bp+var_1E6]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C4]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_16E]
		mov	[bp+var_1E8], ax
		mov	bx, [bp+var_1C6]
		mov	ax, [bp+var_1E8]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C6]
		mov	word ptr [bx+1Fh], 0
		mov	[bp+var_170], 0

loc_749AD:				; CODE XREF: sub_71680+32D7j
					; sub_71680+32DCj ...
		cmp	si, 37h	; '7'
		jnz	short loc_749B8
		mov	[bp+var_170], 0

loc_749B8:				; CODE XREF: sub_71680+3330j
		cmp	si, 36h	; '6'
		jle	short loc_74A12
		cmp	si, 84h	; '�'
		jge	short loc_74A12
		inc	[bp+var_170]
		mov	ax, [bp+var_170]
		cmp	ax, 4
		jnz	short loc_74A12
		inc	[bp+var_16E]
		mov	ax, [bp+var_16E]
		mov	[bp+var_1EA], ax
		mov	bx, [bp+var_1C4]
		mov	ax, [bp+var_1EA]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C4]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_16E]
		mov	[bp+var_1EC], ax
		mov	bx, [bp+var_1C6]
		mov	ax, [bp+var_1EC]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C6]
		mov	word ptr [bx+1Fh], 0
		mov	[bp+var_170], 0

loc_74A12:				; CODE XREF: sub_71680+333Bj
					; sub_71680+3341j ...
		cmp	si, 84h	; '�'
		jnz	short loc_74A1E
		mov	[bp+var_170], 0

loc_74A1E:				; CODE XREF: sub_71680+3396j
		cmp	si, 83h	; '�'
		jle	short loc_74A7A
		inc	[bp+var_170]
		mov	ax, [bp+var_170]
		cmp	ax, 3
		jnz	short loc_74A7A
		cmp	[bp+var_16E], 0
		jle	short loc_74A74
		dec	[bp+var_16E]
		mov	ax, [bp+var_16E]
		mov	[bp+var_1EE], ax
		mov	bx, [bp+var_1C4]
		mov	ax, [bp+var_1EE]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C4]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_16E]
		mov	[bp+var_1F0], ax
		mov	bx, [bp+var_1C6]
		mov	ax, [bp+var_1F0]
		mov	[bx+1Dh], ax
		mov	bx, [bp+var_1C6]
		mov	word ptr [bx+1Fh], 0

loc_74A74:				; CODE XREF: sub_71680+33B6j
		mov	[bp+var_170], 0

loc_74A7A:				; CODE XREF: sub_71680+33A2j
					; sub_71680+33AFj
		cmp	si, 32h	; '2'
		jl	short loc_74A86
		cmp	[bp+var_16E], 0
		jz	short loc_74AAE

loc_74A86:				; CODE XREF: sub_71680+33FDj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 3
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp+var_1F2], ax
		mov	bx, [bp+var_1C4]
		mov	ax, [bp+var_1F2]
		mov	[bx+1Bh], ax

loc_74AAE:				; CODE XREF: sub_71680+3404j
		test	si, 1
		jz	short loc_74ACB
		mov	ax, si
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_1F4], dx
		mov	bx, [bp+var_1C2]
		mov	ax, [bp+var_1F4]
		mov	[bx+1Bh], ax

loc_74ACB:				; CODE XREF: sub_71680+3432j
		cmp	si, 15h
		jge	short loc_74AEA
		mov	ax, si
		mov	bx, 4
		cwd
		idiv	bx
		inc	dx
		mov	[bp+var_1F6], dx
		mov	bx, [bp+var_1C6]
		mov	ax, [bp+var_1F6]
		mov	[bx+1Bh], ax
		jmp	short loc_74B15
; ���������������������������������������������������������������������������

loc_74AEA:				; CODE XREF: sub_71680+344Ej
		cmp	[bp+var_16E], 0
		jz	short loc_74B15
		test	si, 1
		jz	short loc_74B15
		mov	ax, [bp+var_176]
		mov	bx, 4
		cwd
		idiv	bx
		inc	dx
		mov	[bp+var_1F8], dx
		inc	[bp+var_176]
		mov	bx, [bp+var_1C6]
		mov	ax, [bp+var_1F8]
		mov	[bx+1Bh], ax

loc_74B15:				; CODE XREF: sub_71680+3468j
					; sub_71680+346Fj ...
		cmp	si, 0A0h ; '�'
		jnz	short loc_74B37
		cmp	[bp+var_528], 0
		jz	short loc_74B37
		push	[bp+var_526]
		mov	bx, [bp+var_528]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_74B37:				; CODE XREF: sub_71680+3499j
					; sub_71680+34A0j
		cmp	si, 0A1h ; '�'
		jnz	short loc_74B9E
		cmp	[bp+var_2], 0
		jz	short loc_74B87
		mov	ax, word_48ECA
		mov	[bp+var_1FA], ax
		mov	[bp+var_1FC], 0
		cmp	[bp+var_536], 0
		jz	short loc_74B87
		push	[bp+var_534]
		mov	bx, [bp+var_536]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_1FC]
		push	[bp+var_1FA]
		push	[bp+var_534]
		mov	bx, [bp+var_536]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_74B87:				; CODE XREF: sub_71680+34C1j
					; sub_71680+34D5j
		push	[bp+var_178]
		lea	ax, [bp+var_558]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_174], 0

loc_74B9E:				; CODE XREF: sub_71680+34BBj
		cmp	si, 0A1h ; '�'
		jle	short loc_74BCE
		cmp	[bp+var_174], 7
		jle	short loc_74BB1
		mov	[bp+var_174], 7

loc_74BB1:				; CODE XREF: sub_71680+3529j
		mov	ax, [bp+var_174]
		mov	[bp+var_1FE], ax
		mov	bx, [bp+var_178]
		mov	ax, [bp+var_1FE]
		mov	[bx+1Bh], ax
		test	si, 1
		jz	short loc_74BCE
		inc	[bp+var_174]

loc_74BCE:				; CODE XREF: sub_71680+3522j
					; sub_71680+3548j
		cmp	si, 0A3h ; '�'
		jnz	short loc_74C32
		cmp	[bp+var_2], 0
		jz	short loc_74C32
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_4E2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EF2
		mov	[bp+var_200], ax
		mov	[bp+var_202], 0
		cmp	[bp+var_4E2], 0
		jz	short loc_74C32
		push	[bp+var_4E0]
		mov	bx, [bp+var_4E2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_202]
		push	[bp+var_200]
		push	[bp+var_4E0]
		mov	bx, [bp+var_4E2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_74C32:				; CODE XREF: sub_71680+3552j
					; sub_71680+3558j ...
		jmp	short loc_74C3F
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_74C3F
		jmp	short loc_74C6B
; ���������������������������������������������������������������������������

loc_74C3F:				; CODE XREF: sub_71680:loc_74C32j
					; sub_71680+35BBj
		lea	ax, [bp+var_558]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_74C4C:				; CODE XREF: sub_71680+2FCCj
		cmp	[bp+var_53C+1],	0BDh ; '�'
		jnb	short loc_74C5B
		cmp	[bp+var_539], 0
		jz	short loc_74C60

loc_74C5B:				; CODE XREF: sub_71680+35D2j
		mov	ax, 1
		jmp	short loc_74C62
; ���������������������������������������������������������������������������

loc_74C60:				; CODE XREF: sub_71680+35D9j
		xor	ax, ax

loc_74C62:				; CODE XREF: sub_71680+35DEj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_74C6B
		jmp	loc_7464F
; ���������������������������������������������������������������������������

loc_74C6B:				; CODE XREF: sub_71680+35BDj
					; sub_71680+35E6j
		push	[bp+var_162]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		push	0
		lea	ax, [bp+var_558]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_167], 0
		jz	short loc_74CAE
		cmp	[bp+var_16C], 0
		jz	short loc_74CAE
		push	0
		mov	al, [bp+var_168]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74CAE:				; CODE XREF: sub_71680+360Bj
					; sub_71680+3613j
		mov	[bp+var_16C], 0
		mov	[bp+var_167], 0
		mov	[bp+var_166], 0
		cmp	[bp+var_15B], 0
		jz	short loc_74CED
		cmp	[bp+var_160], 0
		jz	short loc_74CED
		push	0
		mov	al, [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74CED:				; CODE XREF: sub_71680+364Aj
					; sub_71680+3652j
		mov	[bp+var_160], 0
		mov	[bp+var_15B], 0
		mov	[bp+var_15A], 0
		cmp	[bp+var_151], 0
		jz	short loc_74D2C
		cmp	[bp+var_156], 0
		jz	short loc_74D2C
		push	0
		mov	al, [bp+var_152]
		push	ax
		lea	ax, [bp+var_156]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74D2C:				; CODE XREF: sub_71680+3689j
					; sub_71680+3691j
		mov	[bp+var_156], 0
		mov	[bp+var_151], 0
		mov	[bp+var_150], 0
		cmp	[bp+var_147], 0
		jz	short loc_74D6B
		cmp	[bp+var_14C], 0
		jz	short loc_74D6B
		push	0
		mov	al, [bp+var_148]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74D6B:				; CODE XREF: sub_71680+36C8j
					; sub_71680+36D0j
		mov	[bp+var_14C], 0
		mov	[bp+var_147], 0
		mov	[bp+var_146], 0
		cmp	[bp+var_13D], 0
		jz	short loc_74DAA
		cmp	[bp+var_142], 0
		jz	short loc_74DAA
		push	0
		mov	al, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74DAA:				; CODE XREF: sub_71680+3707j
					; sub_71680+370Fj
		mov	[bp+var_142], 0
		mov	[bp+var_13D], 0
		mov	[bp+var_13C], 0
		cmp	[bp+var_133], 0
		jz	short loc_74DE9
		cmp	[bp+var_138], 0
		jz	short loc_74DE9
		push	0
		mov	al, [bp+var_134]
		push	ax
		lea	ax, [bp+var_138]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74DE9:				; CODE XREF: sub_71680+3746j
					; sub_71680+374Ej
		mov	[bp+var_138], 0
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		cmp	[bp+var_129], 0
		jz	short loc_74E28
		cmp	[bp+var_12E], 0
		jz	short loc_74E28
		push	0
		mov	al, [bp+var_12A]
		push	ax
		lea	ax, [bp+var_12E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74E28:				; CODE XREF: sub_71680+3785j
					; sub_71680+378Dj
		mov	[bp+var_12E], 0
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		cmp	[bp+var_11F], 0
		jz	short loc_74E67
		cmp	[bp+var_124], 0
		jz	short loc_74E67
		push	0
		mov	al, [bp+var_120]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74E67:				; CODE XREF: sub_71680+37C4j
					; sub_71680+37CCj
		mov	[bp+var_124], 0
		mov	[bp+var_11F], 0
		mov	[bp+var_11E], 0
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_74EA6
		cmp	[bp+var_11A], 0
		jz	short loc_74EA6
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74EA6:				; CODE XREF: sub_71680+3803j
					; sub_71680+380Bj
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116+1], 0
		mov	dword ptr [bp-114h], 0
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_74EE5
		cmp	[bp+var_112+2],	0
		jz	short loc_74EE5
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_112+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74EE5:				; CODE XREF: sub_71680+3842j
					; sub_71680+384Aj
		mov	[bp+var_112+2],	0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10C+2],	0
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_74F24
		cmp	[bp+var_106], 0
		jz	short loc_74F24
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74F24:				; CODE XREF: sub_71680+3881j
					; sub_71680+3889j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_102+2],	0
		cmp	byte ptr [bp+var_F8+1],	0
		jz	short loc_74F63
		cmp	[bp+var_FC], 0
		jz	short loc_74F63
		push	0
		mov	al, byte ptr [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74F63:				; CODE XREF: sub_71680+38C0j
					; sub_71680+38C8j
		mov	[bp+var_FC], 0
		mov	byte ptr [bp+var_F8+1],	0
		mov	[bp+var_F8+2], 0
		lea	ax, [bp+var_536]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_52D], 0
		jz	short loc_74FAF
		cmp	[bp+var_532], 0
		jz	short loc_74FAF
		push	0
		mov	al, [bp+var_52E]
		push	ax
		lea	ax, [bp+var_532]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74FAF:				; CODE XREF: sub_71680+390Cj
					; sub_71680+3914j
		mov	[bp+var_532], 0
		mov	[bp+var_52D], 0
		mov	[bp+var_52C], 0
		lea	ax, [bp+var_528]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_51F], 0
		jz	short loc_74FFB
		cmp	[bp+var_524], 0
		jz	short loc_74FFB
		push	0
		mov	al, [bp+var_520]
		push	ax
		lea	ax, [bp+var_524]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_74FFB:				; CODE XREF: sub_71680+3958j
					; sub_71680+3960j
		mov	[bp+var_524], 0
		mov	byte ptr [bp+var_51F], 0
		mov	[bp+var_51F+1],	0
		cmp	byte ptr [bp+var_EA+1],	0
		jz	short loc_7503A
		cmp	[bp+var_EE], 0
		jz	short loc_7503A
		push	0
		mov	al, byte ptr [bp+var_EA]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7503A:				; CODE XREF: sub_71680+3997j
					; sub_71680+399Fj
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA+1],	0
		mov	[bp+var_E8], 0
		cmp	[bp+var_DF], 0
		jz	short loc_75079
		cmp	[bp+var_E4], 0
		jz	short loc_75079
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75079:				; CODE XREF: sub_71680+39D6j
					; sub_71680+39DEj
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	byte_495FC, 0
		jnz	short loc_7509A
		jmp	loc_7569A
; ���������������������������������������������������������������������������

loc_7509A:				; CODE XREF: sub_71680+3A15j
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_511], 0
		jz	short loc_750CF
		cmp	[bp+var_516], 0
		jz	short loc_750CF
		push	0
		mov	al, [bp+var_512]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_750CF:				; CODE XREF: sub_71680+3A2Cj
					; sub_71680+3A34j
		mov	[bp+var_516], 0
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_503], 0
		jz	short loc_7511B
		cmp	[bp+var_508], 0
		jz	short loc_7511B
		push	0
		mov	al, [bp+var_504]
		push	ax
		lea	ax, [bp+var_508]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7511B:				; CODE XREF: sub_71680+3A78j
					; sub_71680+3A80j
		mov	[bp+var_508], 0
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4F5], 0
		jz	short loc_75167
		cmp	[bp+var_4FA], 0
		jz	short loc_75167
		push	0
		mov	al, [bp+var_4F6]
		push	ax
		lea	ax, [bp+var_4FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75167:				; CODE XREF: sub_71680+3AC4j
					; sub_71680+3ACCj
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4E7], 0
		jz	short loc_751B3
		cmp	[bp+var_4EC], 0
		jz	short loc_751B3
		push	0
		mov	al, [bp+var_4E8]
		push	ax
		lea	ax, [bp+var_4EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_751B3:				; CODE XREF: sub_71680+3B10j
					; sub_71680+3B18j
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4D9], 0
		jz	short loc_751FF
		cmp	[bp+var_4DE], 0
		jz	short loc_751FF
		push	0
		mov	al, [bp+var_4DA]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_751FF:				; CODE XREF: sub_71680+3B5Cj
					; sub_71680+3B64j
		mov	[bp+var_4DE], 0
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		cmp	[bp+var_CB], 0
		jz	short loc_7523E
		cmp	[bp+var_D0], 0
		jz	short loc_7523E
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7523E:				; CODE XREF: sub_71680+3B9Bj
					; sub_71680+3BA3j
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_7527D
		cmp	[bp+var_C6], 0
		jz	short loc_7527D
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7527D:				; CODE XREF: sub_71680+3BDAj
					; sub_71680+3BE2j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_752BC
		cmp	[bp+var_BC], 0
		jz	short loc_752BC
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_752BC:				; CODE XREF: sub_71680+3C19j
					; sub_71680+3C21j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		cmp	[bp+var_AD], 0
		jz	short loc_752FB
		cmp	[bp+var_B2], 0
		jz	short loc_752FB
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_752FB:				; CODE XREF: sub_71680+3C58j
					; sub_71680+3C60j
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		cmp	[bp+var_A3], 0
		jz	short loc_7533A
		cmp	[bp+var_A8], 0
		jz	short loc_7533A
		push	0
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7533A:				; CODE XREF: sub_71680+3C97j
					; sub_71680+3C9Fj
		mov	[bp+var_A8], 0
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_93], 0
		jz	short loc_75388
		cmp	[bp+var_98], 0
		jz	short loc_75388
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75388:				; CODE XREF: sub_71680+3CE5j
					; sub_71680+3CEDj
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_83], 0
		jz	short loc_753D6
		cmp	[bp+var_88], 0
		jz	short loc_753D6
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_753D6:				; CODE XREF: sub_71680+3D33j
					; sub_71680+3D3Bj
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_7541F
		cmp	[bp+var_78], 0
		jz	short loc_7541F
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7541F:				; CODE XREF: sub_71680+3D7Fj
					; sub_71680+3D86j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_75465
		cmp	[bp+var_68], 0
		jz	short loc_75465
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75465:				; CODE XREF: sub_71680+3DC5j
					; sub_71680+3DCCj
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_53], 0
		jz	short loc_754AB
		cmp	[bp+var_58], 0
		jz	short loc_754AB
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_754AB:				; CODE XREF: sub_71680+3E0Bj
					; sub_71680+3E12j
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_754F1
		cmp	[bp+var_48], 0
		jz	short loc_754F1
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_754F1:				; CODE XREF: sub_71680+3E51j
					; sub_71680+3E58j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_75537
		cmp	[bp+var_38], 0
		jz	short loc_75537
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75537:				; CODE XREF: sub_71680+3E97j
					; sub_71680+3E9Ej
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_7557D
		cmp	[bp+var_28], 0
		jz	short loc_7557D
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7557D:				; CODE XREF: sub_71680+3EDDj
					; sub_71680+3EE4j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_4D4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4CB], 0
		jz	short loc_755C6
		cmp	[bp+var_4D0], 0
		jz	short loc_755C6
		push	0
		mov	al, [bp+var_4CC]
		push	ax
		lea	ax, [bp+var_4D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_755C6:				; CODE XREF: sub_71680+3F23j
					; sub_71680+3F2Bj
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		push	2
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_75610
		cmp	[bp+var_1C], 0
		jz	short loc_75610
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75610:				; CODE XREF: sub_71680+3F70j
					; sub_71680+3F77j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_7569A:				; CODE XREF: sub_71680+3A17j
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, [bp+var_E4]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_3D6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA], 2
		mov	byte ptr [bp+var_EA+1],	0
		mov	[bp+var_E8], 0
		push	3
		lea	ax, [bp+var_EE]
		push	ax
		push	18h
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F8], 0
		mov	[bp+var_F4], 2
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		push	3
		lea	ax, [bp+var_F8]
		push	ax
		push	0Dh
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_102], 0
		mov	[bp+var_FE], 2
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		push	3
		lea	ax, [bp+var_102]
		push	ax
		push	1FF8h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0FFD8h
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_106+2], ax
		push	0
		push	0
		lea	ax, [bp+var_EE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_106], ax
		push	0
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-108h], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_102]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	si, ax
		lea	ax, [bp+var_260]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_2E]
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_7E]
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_9E]
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_106+2]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_106]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-108h]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Eh
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_112], 0
		mov	[bp+var_10E], 2
		mov	[bp+var_10D], 0
		mov	[bp+var_10C], 0
		push	3
		lea	ax, [bp+var_112]
		push	ax
		push	0
		lea	ax, [bp+var_35E]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_112]
		push	ax
		push	0
		call	ToggleLayer_Construct_B57B
		add	sp, 0Ah
		mov	[bp+var_114], ax
		push	[bp+var_114]
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_2], 0
		jz	short loc_75944
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_4E2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EF2
		mov	[bp+var_116], ax
		mov	word ptr [bp+var_11A+2], 0
		cmp	[bp+var_4E2], 0
		jz	short loc_75944
		push	[bp+var_4E0]
		mov	bx, [bp+var_4E2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_11A+2]
		push	[bp+var_116]
		push	[bp+var_4E0]
		mov	bx, [bp+var_4E2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_75944:				; CODE XREF: sub_71680+426Aj
					; sub_71680+4292j
		jmp	short loc_759B4
; ���������������������������������������������������������������������������

loc_75946:				; CODE XREF: sub_71680+434Fj
		mov	di, word ptr [bp+var_51F]
		cmp	di, 0Ah
		jnz	short loc_7595A
		push	0Eh
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7595A:				; CODE XREF: sub_71680+42CDj
		cmp	di, 13h
		jnz	short loc_7596A
		push	0Ch
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7596A:				; CODE XREF: sub_71680+42DDj
		cmp	di, 14h
		jnz	short loc_7597A
		push	0Eh
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7597A:				; CODE XREF: sub_71680+42EDj
		cmp	di, 20h	; ' '
		jnz	short loc_7598A
		push	0Ch
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7598A:				; CODE XREF: sub_71680+42FDj
		cmp	di, 21h	; '!'
		jnz	short loc_7599A
		push	0Eh
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7599A:				; CODE XREF: sub_71680+430Dj
		jmp	short loc_759A7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_759A7
		jmp	short loc_759D2
; ���������������������������������������������������������������������������

loc_759A7:				; CODE XREF: sub_71680:loc_7599Aj
					; sub_71680+4323j
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_759B4:				; CODE XREF: sub_71680:loc_75944j
		cmp	word ptr [bp+var_51F], 2Dh ; '-'
		jnb	short loc_759C2
		cmp	byte ptr [bp+var_51F+2], 0
		jz	short loc_759C7

loc_759C2:				; CODE XREF: sub_71680+4339j
		mov	ax, 1
		jmp	short loc_759C9
; ���������������������������������������������������������������������������

loc_759C7:				; CODE XREF: sub_71680+4340j
		xor	ax, ax

loc_759C9:				; CODE XREF: sub_71680+4345j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_759D2
		jmp	loc_75946
; ���������������������������������������������������������������������������

loc_759D2:				; CODE XREF: sub_71680+4325j
					; sub_71680+434Dj
		cmp	[bp+var_10D], 0
		jz	short loc_759FA
		cmp	[bp+var_112], 0
		jz	short loc_759FA
		push	0
		mov	al, [bp+var_10E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_759FA:				; CODE XREF: sub_71680+4357j
					; sub_71680+435Fj
		mov	[bp+var_112], 0
		mov	[bp+var_10D], 0
		mov	[bp+var_10C], 0
		push	0
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_FD], 0
		jz	short loc_75A48
		cmp	[bp+var_102], 0
		jz	short loc_75A48
		push	0
		mov	al, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75A48:				; CODE XREF: sub_71680+43A5j
					; sub_71680+43ADj
		mov	[bp+var_102], 0
		mov	[bp+var_FD], 0
		mov	[bp+var_FC], 0
		cmp	[bp+var_F3], 0
		jz	short loc_75A87
		cmp	[bp+var_F8], 0
		jz	short loc_75A87
		push	0
		mov	al, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75A87:				; CODE XREF: sub_71680+43E4j
					; sub_71680+43ECj
		mov	[bp+var_F8], 0
		mov	[bp+var_F3], 0
		mov	[bp+var_F2], 0
		cmp	byte ptr [bp+var_EA+1],	0
		jz	short loc_75AC6
		cmp	[bp+var_EE], 0
		jz	short loc_75AC6
		push	0
		mov	al, byte ptr [bp+var_EA]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75AC6:				; CODE XREF: sub_71680+4423j
					; sub_71680+442Bj
		mov	[bp+var_EE], 0
		mov	byte ptr [bp+var_EA+1],	0
		mov	[bp+var_E8], 0
		cmp	[bp+var_DF], 0
		jz	short loc_75B05
		cmp	[bp+var_E4], 0
		jz	short loc_75B05
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75B05:				; CODE XREF: sub_71680+4462j
					; sub_71680+446Aj
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	byte_495FC, 0
		jnz	short loc_75B26
		jmp	loc_76126
; ���������������������������������������������������������������������������

loc_75B26:				; CODE XREF: sub_71680+44A1j
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_511], 0
		jz	short loc_75B5B
		cmp	[bp+var_516], 0
		jz	short loc_75B5B
		push	0
		mov	al, [bp+var_512]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75B5B:				; CODE XREF: sub_71680+44B8j
					; sub_71680+44C0j
		mov	[bp+var_516], 0
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_503], 0
		jz	short loc_75BA7
		cmp	[bp+var_508], 0
		jz	short loc_75BA7
		push	0
		mov	al, [bp+var_504]
		push	ax
		lea	ax, [bp+var_508]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75BA7:				; CODE XREF: sub_71680+4504j
					; sub_71680+450Cj
		mov	[bp+var_508], 0
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4F5], 0
		jz	short loc_75BF3
		cmp	[bp+var_4FA], 0
		jz	short loc_75BF3
		push	0
		mov	al, [bp+var_4F6]
		push	ax
		lea	ax, [bp+var_4FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75BF3:				; CODE XREF: sub_71680+4550j
					; sub_71680+4558j
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4E7], 0
		jz	short loc_75C3F
		cmp	[bp+var_4EC], 0
		jz	short loc_75C3F
		push	0
		mov	al, [bp+var_4E8]
		push	ax
		lea	ax, [bp+var_4EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75C3F:				; CODE XREF: sub_71680+459Cj
					; sub_71680+45A4j
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4D9], 0
		jz	short loc_75C8B
		cmp	[bp+var_4DE], 0
		jz	short loc_75C8B
		push	0
		mov	al, [bp+var_4DA]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75C8B:				; CODE XREF: sub_71680+45E8j
					; sub_71680+45F0j
		mov	[bp+var_4DE], 0
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		cmp	[bp+var_CB], 0
		jz	short loc_75CCA
		cmp	[bp+var_D0], 0
		jz	short loc_75CCA
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75CCA:				; CODE XREF: sub_71680+4627j
					; sub_71680+462Fj
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_75D09
		cmp	[bp+var_C6], 0
		jz	short loc_75D09
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75D09:				; CODE XREF: sub_71680+4666j
					; sub_71680+466Ej
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_75D48
		cmp	[bp+var_BC], 0
		jz	short loc_75D48
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75D48:				; CODE XREF: sub_71680+46A5j
					; sub_71680+46ADj
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		cmp	[bp+var_AD], 0
		jz	short loc_75D87
		cmp	[bp+var_B2], 0
		jz	short loc_75D87
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75D87:				; CODE XREF: sub_71680+46E4j
					; sub_71680+46ECj
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		cmp	[bp+var_A3], 0
		jz	short loc_75DC6
		cmp	[bp+var_A8], 0
		jz	short loc_75DC6
		push	0
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75DC6:				; CODE XREF: sub_71680+4723j
					; sub_71680+472Bj
		mov	[bp+var_A8], 0
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_93], 0
		jz	short loc_75E14
		cmp	[bp+var_98], 0
		jz	short loc_75E14
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75E14:				; CODE XREF: sub_71680+4771j
					; sub_71680+4779j
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_83], 0
		jz	short loc_75E62
		cmp	[bp+var_88], 0
		jz	short loc_75E62
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75E62:				; CODE XREF: sub_71680+47BFj
					; sub_71680+47C7j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_75EAB
		cmp	[bp+var_78], 0
		jz	short loc_75EAB
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75EAB:				; CODE XREF: sub_71680+480Bj
					; sub_71680+4812j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_75EF1
		cmp	[bp+var_68], 0
		jz	short loc_75EF1
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75EF1:				; CODE XREF: sub_71680+4851j
					; sub_71680+4858j
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_53], 0
		jz	short loc_75F37
		cmp	[bp+var_58], 0
		jz	short loc_75F37
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75F37:				; CODE XREF: sub_71680+4897j
					; sub_71680+489Ej
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_75F7D
		cmp	[bp+var_48], 0
		jz	short loc_75F7D
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75F7D:				; CODE XREF: sub_71680+48DDj
					; sub_71680+48E4j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_75FC3
		cmp	[bp+var_38], 0
		jz	short loc_75FC3
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_75FC3:				; CODE XREF: sub_71680+4923j
					; sub_71680+492Aj
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_76009
		cmp	[bp+var_28], 0
		jz	short loc_76009
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76009:				; CODE XREF: sub_71680+4969j
					; sub_71680+4970j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_4D4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4CB], 0
		jz	short loc_76052
		cmp	[bp+var_4D0], 0
		jz	short loc_76052
		push	0
		mov	al, [bp+var_4CC]
		push	ax
		lea	ax, [bp+var_4D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76052:				; CODE XREF: sub_71680+49AFj
					; sub_71680+49B7j
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		push	2
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_7609C
		cmp	[bp+var_1C], 0
		jz	short loc_7609C
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7609C:				; CODE XREF: sub_71680+49FCj
					; sub_71680+4A03j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_76126:				; CODE XREF: sub_71680+44A3j
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	3
		lea	ax, [bp+var_E4]
		push	ax
		push	1
		lea	ax, [bp+var_2E6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_260]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_E4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	di, ax
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_8E]
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	di
		lea	ax, [bp+var_53C]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_2], 0
		jz	short loc_76232
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_4E2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EF2
		add	ax, 0FFECh
		mov	word ptr [bp+var_E8+2],	ax
		mov	word ptr [bp+var_E8], 0
		cmp	[bp+var_4E2], 0
		jz	short loc_76232
		push	[bp+var_4E0]
		mov	bx, [bp+var_4E2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_E8]
		push	word ptr [bp+var_E8+2]
		push	[bp+var_4E0]
		mov	bx, [bp+var_4E2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_76232:				; CODE XREF: sub_71680+4B55j
					; sub_71680+4B80j
		jmp	short loc_7626B
; ���������������������������������������������������������������������������

loc_76234:				; CODE XREF: sub_71680+4C04j
		mov	si, word ptr [bp+var_51F]
		test	si, 1
		jz	short loc_76251
		mov	ax, si
		mov	bx, 3
		cwd
		idiv	bx
		mov	[bp+var_EA], dx
		mov	ax, [bp+var_EA]
		mov	[di+1Bh], ax

loc_76251:				; CODE XREF: sub_71680+4BBCj
		jmp	short loc_7625E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7625E
		jmp	short loc_76286
; ���������������������������������������������������������������������������

loc_7625E:				; CODE XREF: sub_71680:loc_76251j
					; sub_71680+4BDAj
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7626B:				; CODE XREF: sub_71680:loc_76232j
		cmp	word ptr [bp+var_51F], 2Dh ; '-'
		jnb	short loc_76279
		cmp	byte ptr [bp+var_51F+2], 0
		jz	short loc_7627E

loc_76279:				; CODE XREF: sub_71680+4BF0j
		mov	ax, 1
		jmp	short loc_76280
; ���������������������������������������������������������������������������

loc_7627E:				; CODE XREF: sub_71680+4BF7j
		xor	ax, ax

loc_76280:				; CODE XREF: sub_71680+4BFCj
		mov	ah, 0
		or	ax, ax
		jz	short loc_76234

loc_76286:				; CODE XREF: sub_71680+4BDCj
		push	0
		lea	ax, [bp+var_53C]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_762BD
		cmp	[bp+var_E4], 0
		jz	short loc_762BD
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_762BD:				; CODE XREF: sub_71680+4C1Aj
					; sub_71680+4C22j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		lea	ax, [bp+var_51A]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_511], 0
		jz	short loc_76320
		cmp	[bp+var_516], 0
		jz	short loc_76320
		push	0
		mov	al, [bp+var_512]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76320:				; CODE XREF: sub_71680+4C7Dj
					; sub_71680+4C85j
		mov	[bp+var_516], 0
		mov	[bp+var_511], 0
		mov	[bp+var_510], 0
		lea	ax, [bp+var_50C]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_503], 0
		jz	short loc_7636C
		cmp	[bp+var_508], 0
		jz	short loc_7636C
		push	0
		mov	al, [bp+var_504]
		push	ax
		lea	ax, [bp+var_508]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7636C:				; CODE XREF: sub_71680+4CC9j
					; sub_71680+4CD1j
		mov	[bp+var_508], 0
		mov	[bp+var_503], 0
		mov	[bp+var_502], 0
		lea	ax, [bp+var_4FE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4F5], 0
		jz	short loc_763B8
		cmp	[bp+var_4FA], 0
		jz	short loc_763B8
		push	0
		mov	al, [bp+var_4F6]
		push	ax
		lea	ax, [bp+var_4FA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_763B8:				; CODE XREF: sub_71680+4D15j
					; sub_71680+4D1Dj
		mov	[bp+var_4FA], 0
		mov	[bp+var_4F5], 0
		mov	[bp+var_4F4], 0
		lea	ax, [bp+var_4F0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4E7], 0
		jz	short loc_76404
		cmp	[bp+var_4EC], 0
		jz	short loc_76404
		push	0
		mov	al, [bp+var_4E8]
		push	ax
		lea	ax, [bp+var_4EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76404:				; CODE XREF: sub_71680+4D61j
					; sub_71680+4D69j
		mov	[bp+var_4EC], 0
		mov	[bp+var_4E7], 0
		mov	[bp+var_4E6], 0
		lea	ax, [bp+var_4E2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4D9], 0
		jz	short loc_76450
		cmp	[bp+var_4DE], 0
		jz	short loc_76450
		push	0
		mov	al, [bp+var_4DA]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76450:				; CODE XREF: sub_71680+4DADj
					; sub_71680+4DB5j
		mov	[bp+var_4DE], 0
		mov	[bp+var_4D9], 0
		mov	[bp+var_4D8], 0
		cmp	[bp+var_CB], 0
		jz	short loc_7648F
		cmp	[bp+var_D0], 0
		jz	short loc_7648F
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7648F:				; CODE XREF: sub_71680+4DECj
					; sub_71680+4DF4j
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_764CE
		cmp	[bp+var_C6], 0
		jz	short loc_764CE
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_764CE:				; CODE XREF: sub_71680+4E2Bj
					; sub_71680+4E33j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_7650D
		cmp	[bp+var_BC], 0
		jz	short loc_7650D
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7650D:				; CODE XREF: sub_71680+4E6Aj
					; sub_71680+4E72j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		cmp	[bp+var_AD], 0
		jz	short loc_7654C
		cmp	[bp+var_B2], 0
		jz	short loc_7654C
		push	0
		mov	al, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7654C:				; CODE XREF: sub_71680+4EA9j
					; sub_71680+4EB1j
		mov	[bp+var_B2], 0
		mov	[bp+var_AD], 0
		mov	[bp+var_AC], 0
		cmp	[bp+var_A3], 0
		jz	short loc_7658B
		cmp	[bp+var_A8], 0
		jz	short loc_7658B
		push	0
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7658B:				; CODE XREF: sub_71680+4EE8j
					; sub_71680+4EF0j
		mov	[bp+var_A8], 0
		mov	[bp+var_A3], 0
		mov	[bp+var_A2], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_93], 0
		jz	short loc_765D9
		cmp	[bp+var_98], 0
		jz	short loc_765D9
		push	0
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_765D9:				; CODE XREF: sub_71680+4F36j
					; sub_71680+4F3Ej
		mov	[bp+var_98], 0
		mov	[bp+var_93], 0
		mov	[bp+var_92], 0
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_83], 0
		jz	short loc_76627
		cmp	[bp+var_88], 0
		jz	short loc_76627
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76627:				; CODE XREF: sub_71680+4F84j
					; sub_71680+4F8Cj
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	2
		lea	ax, [bp+var_7E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_73], 0
		jz	short loc_76670
		cmp	[bp+var_78], 0
		jz	short loc_76670
		push	0
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76670:				; CODE XREF: sub_71680+4FD0j
					; sub_71680+4FD7j
		mov	[bp+var_78], 0
		mov	[bp+var_73], 0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_63], 0
		jz	short loc_766B6
		cmp	[bp+var_68], 0
		jz	short loc_766B6
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_766B6:				; CODE XREF: sub_71680+5016j
					; sub_71680+501Dj
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_53], 0
		jz	short loc_766FC
		cmp	[bp+var_58], 0
		jz	short loc_766FC
		push	0
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_766FC:				; CODE XREF: sub_71680+505Cj
					; sub_71680+5063j
		mov	[bp+var_58], 0
		mov	[bp+var_53], 0
		mov	[bp+var_52], 0
		push	2
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_76742
		cmp	[bp+var_48], 0
		jz	short loc_76742
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76742:				; CODE XREF: sub_71680+50A2j
					; sub_71680+50A9j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_76788
		cmp	[bp+var_38], 0
		jz	short loc_76788
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76788:				; CODE XREF: sub_71680+50E8j
					; sub_71680+50EFj
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		push	2
		lea	ax, [bp+var_2E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_767CE
		cmp	[bp+var_28], 0
		jz	short loc_767CE
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_767CE:				; CODE XREF: sub_71680+512Ej
					; sub_71680+5135j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_4D4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4CB], 0
		jz	short loc_76817
		cmp	[bp+var_4D0], 0
		jz	short loc_76817
		push	0
		mov	al, [bp+var_4CC]
		push	ax
		lea	ax, [bp+var_4D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76817:				; CODE XREF: sub_71680+5174j
					; sub_71680+517Cj
		mov	[bp+var_4D0], 0
		mov	[bp+var_4CB], 0
		mov	[bp+var_4CA], 0
		push	2
		lea	ax, [bp+var_4C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_76861
		cmp	[bp+var_1C], 0
		jz	short loc_76861
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_76861:				; CODE XREF: sub_71680+51C1j
					; sub_71680+51C8j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_44E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_35E]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2E6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_26E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_260]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_71680	endp

ovr199		ends
