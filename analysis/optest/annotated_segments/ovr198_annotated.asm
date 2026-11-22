ovr198		segment	para public 'OVERLAY' use16
		assume cs:ovr198
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6B9C0	proc far		; CODE XREF: sub_42410J

var_D38		= word ptr -0D38h
var_D08		= word ptr -0D08h
var_CDB		= dword	ptr -0CDBh
var_CD7		= dword	ptr -0CD7h
var_CD3		= dword	ptr -0CD3h
var_CC6		= word ptr -0CC6h
var_CC2		= dword	ptr -0CC2h
var_CBE		= word ptr -0CBEh
var_CB2		= word ptr -0CB2h
var_C95		= word ptr -0C95h
var_C93		= byte ptr -0C93h
var_C90		= word ptr -0C90h
var_C8E		= word ptr -0C8Eh
var_C8C		= dword	ptr -0C8Ch
var_C88		= byte ptr -0C88h
var_C87		= byte ptr -0C87h
var_C86		= dword	ptr -0C86h
var_C82		= word ptr -0C82h
var_C80		= word ptr -0C80h
var_C7E		= dword	ptr -0C7Eh
var_C7A		= byte ptr -0C7Ah
var_C79		= byte ptr -0C79h
var_C78		= dword	ptr -0C78h
var_C74		= word ptr -0C74h
var_C72		= word ptr -0C72h
var_C70		= dword	ptr -0C70h
var_C6C		= byte ptr -0C6Ch
var_C6B		= byte ptr -0C6Bh
var_C6A		= dword	ptr -0C6Ah
var_C66		= word ptr -0C66h
var_C64		= word ptr -0C64h
var_C62		= dword	ptr -0C62h
var_C5E		= byte ptr -0C5Eh
var_C5D		= byte ptr -0C5Dh
var_C5C		= dword	ptr -0C5Ch
var_C58		= word ptr -0C58h
var_C56		= word ptr -0C56h
var_C48		= dword	ptr -0C48h
var_C44		= byte ptr -0C44h
var_C43		= byte ptr -0C43h
var_C42		= dword	ptr -0C42h
var_43B		= dword	ptr -43Bh
var_437		= dword	ptr -437h
var_432		= word ptr -432h
var_430		= word ptr -430h
var_42E		= dword	ptr -42Eh
var_42A		= byte ptr -42Ah
var_429		= byte ptr -429h
var_428		= dword	ptr -428h
var_424		= word ptr -424h
var_3AC		= word ptr -3ACh
var_334		= word ptr -334h
var_2BC		= word ptr -2BCh
var_244		= word ptr -244h
var_242		= word ptr -242h
var_230		= word ptr -230h
var_22B		= word ptr -22Bh
var_229		= word ptr -229h
var_227		= word ptr -227h
var_225		= word ptr -225h
var_222		= word ptr -222h
var_20A		= word ptr -20Ah
var_208		= word ptr -208h
var_206		= word ptr -206h
var_204		= word ptr -204h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F8		= word ptr -1F8h
var_1F6		= word ptr -1F6h
var_1F4		= word ptr -1F4h
var_1F2		= word ptr -1F2h
var_1EE		= word ptr -1EEh
var_19E		= word ptr -19Eh
var_19C		= word ptr -19Ch
var_19A		= word ptr -19Ah
var_198		= word ptr -198h
var_196		= word ptr -196h
var_194		= word ptr -194h
var_192		= dword	ptr -192h
var_18E		= word ptr -18Eh
var_18C		= dword	ptr -18Ch
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= word ptr -184h
var_182		= dword	ptr -182h
var_17E		= word ptr -17Eh
var_17C		= dword	ptr -17Ch
var_178		= word ptr -178h
var_176		= dword	ptr -176h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= dword	ptr -16Ah
var_166		= byte ptr -166h
var_165		= byte ptr -165h
var_164		= dword	ptr -164h
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
var_142		= word ptr -142h
var_140		= byte ptr -140h
var_13F		= word ptr -13Fh
var_13C		= dword	ptr -13Ch
var_138		= byte ptr -138h
var_137		= byte ptr -137h
var_136		= dword	ptr -136h
var_132		= word ptr -132h
var_130		= byte ptr -130h
var_12F		= word ptr -12Fh
var_12C		= dword	ptr -12Ch
var_128		= byte ptr -128h
var_127		= byte ptr -127h
var_126		= dword	ptr -126h
var_122		= word ptr -122h
var_120		= byte ptr -120h
var_11F		= word ptr -11Fh
var_11C		= dword	ptr -11Ch
var_118		= byte ptr -118h
var_117		= byte ptr -117h
var_116		= dword	ptr -116h
var_112		= word ptr -112h
var_110		= byte ptr -110h
var_10F		= word ptr -10Fh
var_10C		= dword	ptr -10Ch
var_108		= byte ptr -108h
var_107		= byte ptr -107h
var_106		= dword	ptr -106h
var_102		= word ptr -102h
var_100		= byte ptr -100h
var_FF		= word ptr -0FFh
var_FC		= dword	ptr -0FCh
var_F8		= byte ptr -0F8h
var_F7		= byte ptr -0F7h
var_F6		= dword	ptr -0F6h
var_F2		= word ptr -0F2h
var_F0		= byte ptr -0F0h
var_EF		= word ptr -0EFh
var_EC		= dword	ptr -0ECh
var_E8		= byte ptr -0E8h
var_E7		= byte ptr -0E7h
var_E6		= dword	ptr -0E6h
var_E2		= word ptr -0E2h
var_E0		= dword	ptr -0E0h
var_DC		= byte ptr -0DCh
var_DB		= byte ptr -0DBh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= byte ptr -0D2h
var_D1		= byte ptr -0D1h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= byte ptr -0C8h
var_C7		= byte ptr -0C7h
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= byte ptr -0BEh
var_BD		= byte ptr -0BDh
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= byte ptr -0B4h
var_B3		= byte ptr -0B3h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= byte ptr -0AAh
var_A9		= byte ptr -0A9h
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= byte ptr -0A0h
var_9F		= byte ptr -9Fh
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= byte ptr -96h
var_95		= byte ptr -95h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= byte ptr -8Ch
var_8B		= byte ptr -8Bh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= byte ptr -82h
var_81		= byte ptr -81h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= byte ptr -78h
var_77		= byte ptr -77h
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= byte ptr -6Eh
var_6D		= byte ptr -6Dh
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= byte ptr -64h
var_63		= byte ptr -63h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= byte ptr -5Ah
var_59		= byte ptr -59h
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword	ptr -4Eh
var_4A		= byte ptr -4Ah
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword	ptr -42h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= byte ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0D38h
		push	si
		push	di
		mov	[bp+var_2], 1F38h
		mov	[bp+var_4], 1F3Ah
		mov	[bp+var_6], 1F3Ch
		mov	[bp+var_A], 0
		push	0C8h ; '�'
		push	10h
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	byte_495FC, 0
		mov	[bp+var_D], 0
		mov	[bp+var_E], 0
		mov	[bp+var_F], 0
		cmp	word_4684B, 0
		jz	short loc_6BA0A
		mov	[bp+var_E], 1

loc_6BA0A:				; CODE XREF: sub_6B9C0+44j
		mov	ax, word_46F46
		mov	[bp+var_12], ax
		mov	[bp+var_1FC], 0
		mov	[bp+var_1FA], 0
		push	[bp+var_12]
		lea	ax, [bp+var_1FC]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_20A], 0
		mov	[bp+var_208], 0
		mov	[bp+var_206], 0
		mov	[bp+var_204], 0
		mov	[bp+var_202], 13Fh
		mov	[bp+var_200], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_20A]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_20A]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_1F8], 0
		mov	[bp+var_1F6], 18h
		mov	[bp+var_1F4], 13Fh
		mov	[bp+var_1F2], 97h ; '�'
		mov	byte ptr [bp+var_20], 0
		mov	byte ptr [bp+var_20+1],	0
		mov	[bp+var_1E], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_26], 2
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	ds
		push	offset unk_44F6B
		push	ds
		push	offset aConvfont_shp_1 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1EE]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_2E+2],	dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[bp+var_2A], eax
		mov	[bp+var_26], 2
		mov	[bp+var_25], 1
		mov	[bp+var_24], 0
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_222]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_36], 0
		mov	[bp+var_34], 98h ; '�'
		mov	[bp+var_32], 13Fh
		mov	[bp+var_30], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_38], ax
		lea	ax, [bp+var_222]
		push	ax
		push	[bp+var_38]
		lea	ax, [bp+var_244]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_244], 1218h
		mov	ax, [bp+var_34]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_30]
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_36]
		mov	[bp+var_22B], ax
		mov	ax, [bp+var_3A]
		mov	[bp+var_229], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_227], ax
		mov	ax, [bp+var_3E]
		mov	[bp+var_225], ax
		push	0
		lea	ax, [bp+var_244]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_244]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid2	; "mid2"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_2BC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_4 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_334]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid2voc	; "mid2voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_3AC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_E], 0
		jz	short loc_6BC46
		push	ds
		lea	ax, [bp+var_1EE]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_6BC46
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_3AC]
		push	ax
		mov	bx, [bp+var_3AC]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_6BC4A
; ���������������������������������������������������������������������������

loc_6BC46:				; CODE XREF: sub_6B9C0+25Aj
					; sub_6B9C0+26Cj
		mov	[bp+var_E], 0

loc_6BC4A:				; CODE XREF: sub_6B9C0+284j
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		mov	al, byte_46848
		mov	[bp+var_4A], al
		lea	ax, [bp+var_424]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_4A]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_6BC8A
		cmp	ax, 2
		jnz	short loc_6BC87
		jmp	loc_6BE00
; ���������������������������������������������������������������������������

loc_6BC87:				; CODE XREF: sub_6B9C0+2C2j
		jmp	loc_6BF75
; ���������������������������������������������������������������������������

loc_6BC8A:				; CODE XREF: sub_6B9C0+2BDj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1EE]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_6BCB8
		jmp	loc_6BDBF
; ���������������������������������������������������������������������������

loc_6BCB8:				; CODE XREF: sub_6B9C0+2F3j
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_424]
		push	ax
		mov	bx, [bp+var_424]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_5 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D38]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D38], 556h
		mov	[bp+var_CD7], 100h
		mov	[bp+var_CDB], 0
		mov	[bp+var_D38], 56Eh
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_D38]
		push	ax
		mov	bx, [bp+var_D38]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	[bp+var_170], 1
		jmp	short loc_6BD85
; ���������������������������������������������������������������������������

loc_6BD6A:				; CODE XREF: sub_6B9C0+3CAj
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, [bp+var_170]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	[bp+var_170]

loc_6BD85:				; CODE XREF: sub_6B9C0+3A8j
		cmp	[bp+var_170], 6Ah ; 'j'
		jle	short loc_6BD6A
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_F], 1
		mov	[bp+var_D38], 56Eh
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D38]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_6BDBF:				; CODE XREF: sub_6B9C0+2F5j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1EE]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_6BDFD
		mov	[bp+var_D], 1
		mov	al, [bp+var_F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6BDFD
		mov	word_48F76, 5Ah	; 'Z'

loc_6BDFD:				; CODE XREF: sub_6B9C0+428j
					; sub_6B9C0+435j
		jmp	loc_6BF75
; ���������������������������������������������������������������������������

loc_6BE00:				; CODE XREF: sub_6B9C0+2C4j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1EE]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_6BE2E
		jmp	loc_6BF35
; ���������������������������������������������������������������������������

loc_6BE2E:				; CODE XREF: sub_6B9C0+469j
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_424]
		push	ax
		mov	bx, [bp+var_424]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_6 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D38]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D38], 556h
		mov	[bp+var_CD7], 100h
		mov	[bp+var_CDB], 0
		mov	[bp+var_D38], 56Eh
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_D38]
		push	ax
		mov	bx, [bp+var_D38]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	[bp+var_170], 1
		jmp	short loc_6BEFB
; ���������������������������������������������������������������������������

loc_6BEE0:				; CODE XREF: sub_6B9C0+540j
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, [bp+var_170]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	[bp+var_170]

loc_6BEFB:				; CODE XREF: sub_6B9C0+51Ej
		cmp	[bp+var_170], 6Ah ; 'j'
		jle	short loc_6BEE0
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_F], 1
		mov	[bp+var_D38], 56Eh
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D38]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_6BF35:				; CODE XREF: sub_6B9C0+46Bj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1EE]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_6BF73
		mov	[bp+var_D], 1
		mov	al, [bp+var_F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6BF73
		mov	word_48F76, 0FFh

loc_6BF73:				; CODE XREF: sub_6B9C0+59Ej
					; sub_6B9C0+5ABj
		jmp	short $+2

loc_6BF75:				; CODE XREF: sub_6B9C0:loc_6BC87j
					; sub_6B9C0:loc_6BDFDj
		mov	[bp+var_42E], 0
		mov	[bp+var_42A], 2
		mov	[bp+var_429], 0
		mov	[bp+var_428], 0
		mov	[bp+var_432], 0
		mov	[bp+var_430], 0FFFFh
		cmp	[bp+var_D], 0
		jz	short loc_6C016
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_D08]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_E], 0
		jz	short loc_6BFC4
		mov	byte ptr [bp+var_170+1], 2
		jmp	short loc_6BFC9
; ���������������������������������������������������������������������������

loc_6BFC4:				; CODE XREF: sub_6B9C0+5FBj
		mov	byte ptr [bp+var_170+1], 1

loc_6BFC9:				; CODE XREF: sub_6B9C0+602j
		push	3
		lea	ax, [bp+var_48]
		push	ax
		mov	al, byte ptr [bp+var_170+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_D08]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_432]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_432]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_D08]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_6C016:				; CODE XREF: sub_6B9C0+5E1j
		mov	[bp+var_C58], 185Fh
		mov	[bp+var_C48], 0
		mov	[bp+var_C44], 2
		mov	[bp+var_C43], 0
		mov	[bp+var_C42], 0
		mov	[bp+var_C56], 0
		mov	[bp+var_C58], 186Fh
		xor	eax, eax
		mov	[bp+var_43B], eax
		mov	[bp+var_437], eax
		cmp	[bp+var_E], 0
		jz	short loc_6C06B
		push	word_4684B
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_6C3BC
; ���������������������������������������������������������������������������

loc_6C06B:				; CODE XREF: sub_6B9C0+695j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_7 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1EE]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D38]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D38], 556h
		mov	[bp+var_CD7], 100h
		mov	[bp+var_CDB], 0
		mov	[bp+var_D38], 56Eh
		push	1
		lea	ax, [bp+var_1EE]
		push	ax
		lea	ax, [bp+var_D38]
		push	ax
		mov	bx, [bp+var_D38]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3230474Dh
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	[bp+var_170], 0
		jmp	short loc_6C145
; ���������������������������������������������������������������������������

loc_6C0F7:				; CODE XREF: sub_6B9C0+78Aj
		push	1
		push	large 54584554h
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_CC6]
		mov	[bp+var_172], ax
		movsx	eax, [bp+var_172]
		push	eax
		push	ds
		mov	ax, [bp+var_C]
		imul	[bp+var_170]
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_CC2]
		mov	[bp+var_CD3], eax
		inc	[bp+var_170]

loc_6C145:				; CODE XREF: sub_6B9C0+735j
		cmp	[bp+var_170], 10h
		jl	short loc_6C0F7
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_6C16B
		jmp	loc_6C215
; ���������������������������������������������������������������������������

loc_6C16B:				; CODE XREF: sub_6B9C0+7A6j
		push	[bp+var_4]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		mov	[bp+var_172], 0
		jmp	short loc_6C193
; ���������������������������������������������������������������������������

loc_6C181:				; CODE XREF: sub_6B9C0+804j
		push	[bp+var_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		inc	[bp+var_172]

loc_6C193:				; CODE XREF: sub_6B9C0+7BFj
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 28h	; '('
		sub	dx, ax
		push	dx
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 14h
		sub	dx, ax
		mov	bx, 3
		push	dx
		xor	dx, dx
		pop	ax
		div	bx
		pop	dx
		sub	dx, ax
		cmp	dx, [bp+var_172]
		ja	short loc_6C181
		push	[bp+arg_0]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		mov	[bp+var_172], 0
		jmp	short loc_6C1FC
; ���������������������������������������������������������������������������

loc_6C1EA:				; CODE XREF: sub_6B9C0+850j
		push	[bp+var_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		inc	[bp+var_172]

loc_6C1FC:				; CODE XREF: sub_6B9C0+828j
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 14h
		sub	dx, ax
		cmp	dx, [bp+var_172]
		ja	short loc_6C1EA
		jmp	loc_6C39A
; ���������������������������������������������������������������������������

loc_6C215:				; CODE XREF: sub_6B9C0+7A8j
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_6C227
		jmp	loc_6C2D1
; ���������������������������������������������������������������������������

loc_6C227:				; CODE XREF: sub_6B9C0+862j
		push	[bp+var_4]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		mov	[bp+var_172], 0
		jmp	short loc_6C24F
; ���������������������������������������������������������������������������

loc_6C23D:				; CODE XREF: sub_6B9C0+8C0j
		push	[bp+var_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		inc	[bp+var_172]

loc_6C24F:				; CODE XREF: sub_6B9C0+87Bj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 28h	; '('
		sub	dx, ax
		push	dx
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 14h
		sub	dx, ax
		mov	bx, 3
		push	dx
		xor	dx, dx
		pop	ax
		div	bx
		pop	dx
		sub	dx, ax
		cmp	dx, [bp+var_172]
		ja	short loc_6C23D
		push	[bp+arg_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		mov	[bp+var_172], 0
		jmp	short loc_6C2B8
; ���������������������������������������������������������������������������

loc_6C2A6:				; CODE XREF: sub_6B9C0+90Cj
		push	[bp+var_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		inc	[bp+var_172]

loc_6C2B8:				; CODE XREF: sub_6B9C0+8E4j
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 14h
		sub	dx, ax
		cmp	dx, [bp+var_172]
		ja	short loc_6C2A6
		jmp	loc_6C39A
; ���������������������������������������������������������������������������

loc_6C2D1:				; CODE XREF: sub_6B9C0+864j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_6C2E3
		jmp	loc_6C38C
; ���������������������������������������������������������������������������

loc_6C2E3:				; CODE XREF: sub_6B9C0+91Ej
		push	[bp+var_4]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		mov	[bp+var_172], 0
		jmp	short loc_6C30B
; ���������������������������������������������������������������������������

loc_6C2F9:				; CODE XREF: sub_6B9C0+97Cj
		push	[bp+var_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		inc	[bp+var_172]

loc_6C30B:				; CODE XREF: sub_6B9C0+937j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 28h	; '('
		sub	dx, ax
		push	dx
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 14h
		sub	dx, ax
		mov	bx, 3
		push	dx
		xor	dx, dx
		pop	ax
		div	bx
		pop	dx
		sub	dx, ax
		cmp	dx, [bp+var_172]
		ja	short loc_6C2F9
		push	[bp+arg_4]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		mov	[bp+var_172], 0
		jmp	short loc_6C374
; ���������������������������������������������������������������������������

loc_6C362:				; CODE XREF: sub_6B9C0+9C8j
		push	[bp+var_2]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4
		inc	[bp+var_172]

loc_6C374:				; CODE XREF: sub_6B9C0+9A0j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, 14h
		sub	dx, ax
		cmp	dx, [bp+var_172]
		ja	short loc_6C362
		jmp	short loc_6C39A
; ���������������������������������������������������������������������������

loc_6C38C:				; CODE XREF: sub_6B9C0+920j
		push	[bp+var_6]
		push	[bp+var_A]
		call	CRT_Strcat
		add	sp, 4

loc_6C39A:				; CODE XREF: sub_6B9C0+852j
					; sub_6B9C0+90Ej ...
		mov	[bp+var_D38], 56Eh
		lea	ax, [bp+var_D38]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D38]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_6C3BC:				; CODE XREF: sub_6B9C0+6A8j
		mov	[bp+var_54], 0
		mov	[bp+var_50], 2
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		push	3
		lea	ax, [bp+var_54]
		push	ax
		push	0Ch
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5E], 0
		mov	[bp+var_5A], 2
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		push	3
		lea	ax, [bp+var_5E]
		push	ax
		push	0Dh
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_68], 0
		mov	[bp+var_64], 2
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		push	3
		lea	ax, [bp+var_68]
		push	ax
		push	12h
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_72], 0
		mov	[bp+var_6E], 2
		mov	[bp+var_6D], 0
		mov	[bp+var_6C], 0
		push	3
		lea	ax, [bp+var_72]
		push	ax
		push	0
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7C], 0
		mov	[bp+var_78], 2
		mov	[bp+var_77], 0
		mov	[bp+var_76], 0
		push	3
		lea	ax, [bp+var_7C]
		push	ax
		push	1
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_86], 0
		mov	[bp+var_82], 2
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	3
		lea	ax, [bp+var_86]
		push	ax
		push	1F7Dh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_90], 0
		mov	[bp+var_8C], 2
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	3
		lea	ax, [bp+var_90]
		push	ax
		push	1F81h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_9A], 0
		mov	[bp+var_96], 2
		mov	[bp+var_95], 0
		mov	[bp+var_94], 0
		push	3
		lea	ax, [bp+var_9A]
		push	ax
		push	3
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A4], 0
		mov	[bp+var_A0], 2
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		push	3
		lea	ax, [bp+var_A4]
		push	ax
		push	4
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_AE], 0
		mov	[bp+var_AA], 2
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	3
		lea	ax, [bp+var_AE]
		push	ax
		push	2
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_B8], 0
		mov	[bp+var_B4], 2
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		push	3
		lea	ax, [bp+var_B8]
		push	ax
		push	0Eh
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_C2], 0
		mov	[bp+var_BE], 2
		mov	[bp+var_BD], 0
		mov	[bp+var_BC], 0
		push	3
		lea	ax, [bp+var_C2]
		push	ax
		push	0Fh
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_CC], 0
		mov	[bp+var_C8], 2
		mov	[bp+var_C7], 0
		mov	[bp+var_C6], 0
		push	3
		lea	ax, [bp+var_CC]
		push	ax
		push	10h
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_D6], 0
		mov	[bp+var_D2], 2
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	3
		lea	ax, [bp+var_D6]
		push	ax
		push	11h
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_E0], 0
		mov	[bp+var_DC], 2
		mov	[bp+var_DB], 0
		mov	[bp+var_DA], 0
		push	3
		lea	ax, [bp+var_E0]
		push	ax
		push	5
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_E2], ax
		mov	[bp+var_EC], 0
		mov	[bp+var_E8], 2
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		push	0
		push	2
		lea	ax, [bp+var_EC]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_EF], 0
		lea	ax, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	2
		lea	ax, [bp+var_FC]
		push	ax
		push	9
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_FF], 0
		lea	ax, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_10C], 0
		mov	[bp+var_108], 2
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		push	0Ah
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_10F], 0
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_11C], 0
		mov	[bp+var_118], 2
		mov	[bp+var_117], 0
		mov	[bp+var_116], 0
		push	2
		lea	ax, [bp+var_11C]
		push	ax
		push	6
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11F], 0
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_12C], 0
		mov	[bp+var_128], 2
		mov	[bp+var_127], 0
		mov	[bp+var_126], 0
		push	2
		lea	ax, [bp+var_12C]
		push	ax
		push	7
		lea	ax, [bp+var_2BC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_12F], 0
		lea	ax, [bp+var_12C]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_13C], 0
		mov	[bp+var_138], 2
		mov	[bp+var_137], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, [bp+var_13C]
		push	ax
		push	0Bh
		lea	ax, [bp+var_334]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_13F], 0
		lea	ax, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_14C], 0
		mov	[bp+var_148], 2
		mov	[bp+var_147], 0
		mov	[bp+var_146], 0
		mov	[bp+var_156], 0
		mov	[bp+var_152], 2
		mov	[bp+var_151], 0
		mov	[bp+var_150], 0
		mov	[bp+var_160], 0
		mov	[bp+var_15C], 2
		mov	[bp+var_15B], 0
		mov	[bp+var_15A], 0
		mov	[bp+var_16A], 0
		mov	[bp+var_166], 2
		mov	[bp+var_165], 0
		mov	[bp+var_164], 0
		mov	[bp+var_C62], 0
		mov	[bp+var_C5E], 2
		mov	[bp+var_C5D], 0
		mov	[bp+var_C5C], 0
		mov	[bp+var_C66], 0
		mov	[bp+var_C64], 0FFFFh
		mov	[bp+var_C70], 0
		mov	[bp+var_C6C], 2
		mov	[bp+var_C6B], 0
		mov	[bp+var_C6A], 0
		mov	[bp+var_C74], 0
		mov	[bp+var_C72], 0FFFFh
		mov	[bp+var_C7E], 0
		mov	[bp+var_C7A], 2
		mov	[bp+var_C79], 0
		mov	[bp+var_C78], 0
		mov	[bp+var_C82], 0
		mov	[bp+var_C80], 0FFFFh
		mov	[bp+var_C8C], 0
		mov	[bp+var_C88], 2
		mov	[bp+var_C87], 0
		mov	[bp+var_C86], 0
		mov	[bp+var_C90], 0
		mov	[bp+var_C8E], 0FFFFh
		cmp	[bp+var_F], 0
		jnz	short loc_6C96E
		jmp	loc_6CA5A
; ���������������������������������������������������������������������������

loc_6C96E:				; CODE XREF: sub_6B9C0+FA9j
		push	3
		lea	ax, [bp+var_14C]
		push	ax
		push	16h
		lea	ax, [bp+var_424]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C66]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_C66]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_156]
		push	ax
		push	10h
		lea	ax, [bp+var_424]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C74]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_156]
		push	ax
		lea	ax, [bp+var_C74]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_160]
		push	ax
		push	11h
		lea	ax, [bp+var_424]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C82]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_C82]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_16A]
		push	ax
		push	29h ; ')'
		lea	ax, [bp+var_424]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C90]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_C90]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_6CA5A:				; CODE XREF: sub_6B9C0+FABj
		cmp	byte_495FC, 0
		jz	short loc_6CA64
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6CA64:				; CODE XREF: sub_6B9C0+109Fj
		cmp	[bp+var_D], 0
		jz	short loc_6CAAE
		mov	ax, word_48F76
		mov	[bp+var_16C], ax
		mov	[bp+var_16E], 0
		cmp	[bp+var_432], 0
		jz	short loc_6CAAE
		push	[bp+var_430]
		mov	bx, [bp+var_432]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_16E]
		push	[bp+var_16C]
		push	[bp+var_430]
		mov	bx, [bp+var_432]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6CAAE:				; CODE XREF: sub_6B9C0+10A8j
					; sub_6B9C0+10BCj
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFE9h
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_170], ax
		push	1
		push	0FFE9h
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp+var_172], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_A4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176+2], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_C2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_178], ax
		push	[bp+var_112]
		mov	al, [bp+var_110]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_102]
		mov	al, [bp+var_100]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_E2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_172]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_178]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_E], 0
		jnz	short loc_6CC00
		jmp	loc_6CD4C
; ���������������������������������������������������������������������������

loc_6CC00:				; CODE XREF: sub_6B9C0+123Bj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp+var_186],	0
		mov	byte ptr [bp+var_182], 2
		mov	byte ptr [bp+var_182+1], 0
		mov	[bp+var_182+2],	0
		push	2
		lea	ax, [bp+var_186]
		push	ax
		push	0
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_186]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_188], 0
		jmp	short loc_6CC6A
; ���������������������������������������������������������������������������

loc_6CC59:				; CODE XREF: sub_6B9C0+12AFj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_188]

loc_6CC6A:				; CODE XREF: sub_6B9C0+1297j
		cmp	[bp+var_188], 4
		jl	short loc_6CC59
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_6CCC3
; ���������������������������������������������������������������������������

loc_6CC82:				; CODE XREF: sub_6B9C0+1312j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_18C+2], ax
		mov	bx, [bp+var_178]
		mov	ax, word ptr [bp+var_18C+2]
		mov	[bx+1Bh], ax
		jmp	short loc_6CCB6
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6CCB6
		jmp	short loc_6CCD4
; ���������������������������������������������������������������������������

loc_6CCB6:				; CODE XREF: sub_6B9C0+12E9j
					; sub_6B9C0+12F2j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6CCC3:				; CODE XREF: sub_6B9C0+12C0j
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_6CC82

loc_6CCD4:				; CODE XREF: sub_6B9C0+12F4j
		mov	bx, [bp+var_178]
		mov	word ptr [bx+1Bh], 0
		mov	[bp+var_188], 0
		jmp	short loc_6CCF6
; ���������������������������������������������������������������������������

loc_6CCE5:				; CODE XREF: sub_6B9C0+133Bj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_188]

loc_6CCF6:				; CODE XREF: sub_6B9C0+1323j
		cmp	[bp+var_188], 4
		jl	short loc_6CCE5
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_182+1], 0
		jz	short loc_6CD32
		cmp	dword ptr [bp+var_186],	0
		jz	short loc_6CD32
		push	0
		mov	al, byte ptr [bp+var_182]
		push	ax
		lea	ax, [bp+var_186]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6CD32:				; CODE XREF: sub_6B9C0+134Fj
					; sub_6B9C0+1357j
		mov	dword ptr [bp+var_186],	0
		mov	byte ptr [bp+var_182+1], 0
		mov	[bp+var_182+2],	0
		jmp	loc_6CE5E
; ���������������������������������������������������������������������������

loc_6CD4C:				; CODE XREF: sub_6B9C0+123Dj
		push	0Fh
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 2Bh	; '+'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6CE41
; ���������������������������������������������������������������������������

loc_6CD7E:				; CODE XREF: sub_6B9C0+149Bj
		mov	ax, [bp+var_C95]
		mov	[bp+var_17E], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, [bp+var_17E]
		jge	short loc_6CDB8
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_182+2], ax
		mov	bx, [bp+var_178]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax

loc_6CDB8:				; CODE XREF: sub_6B9C0+13CFj
		mov	ax, si
		add	ax, 5
		cmp	ax, [bp+var_17E]
		jnz	short loc_6CDD3
		push	[bp+var_A]
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6CDD3:				; CODE XREF: sub_6B9C0+1401j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_17E]
		jnz	short loc_6CDE5
		mov	bx, [bp+var_178]
		mov	word ptr [bx+1Bh], 0

loc_6CDE5:				; CODE XREF: sub_6B9C0+141Aj
		jmp	short loc_6CE34
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6CE34
		mov	word ptr [bp-0CBEh], 11BCh
		mov	word ptr [bp-0CBEh], 11C8h
		mov	word ptr [bp-0CBEh], 11D8h
		mov	word ptr [bp-0CBEh], 11E8h
		mov	word ptr [bp-0CBEh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CBEh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6CE5E
; ���������������������������������������������������������������������������

loc_6CE34:				; CODE XREF: sub_6B9C0:loc_6CDE5j
					; sub_6B9C0+142Ej
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6CE41:				; CODE XREF: sub_6B9C0+13BBj
		cmp	[bp+var_C95], di
		jnb	short loc_6CE4E
		cmp	[bp+var_C93], 0
		jz	short loc_6CE53

loc_6CE4E:				; CODE XREF: sub_6B9C0+1485j
		mov	ax, 1
		jmp	short loc_6CE55
; ���������������������������������������������������������������������������

loc_6CE53:				; CODE XREF: sub_6B9C0+148Cj
		xor	ax, ax

loc_6CE55:				; CODE XREF: sub_6B9C0+1491j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6CE5E
		jmp	loc_6CD7E
; ���������������������������������������������������������������������������

loc_6CE5E:				; CODE XREF: sub_6B9C0+1389j
					; sub_6B9C0+1472j ...
		cmp	byte_495FC, 0
		jz	short loc_6CE77
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6CE77:				; CODE XREF: sub_6B9C0+14A3j
		mov	word ptr [bp+var_17C+2], 0
		mov	word ptr [bp+var_17C], 0
		cmp	[bp+var_E], 0
		jnz	short loc_6CE8C
		jmp	loc_6D004
; ���������������������������������������������������������������������������

loc_6CE8C:				; CODE XREF: sub_6B9C0+14C7j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp+var_186],	0
		mov	byte ptr [bp+var_182], 2
		mov	byte ptr [bp+var_182+1], 0
		mov	[bp+var_182+2],	0
		push	2
		lea	ax, [bp+var_186]
		push	ax
		push	7
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_186]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_188], 0
		jmp	short loc_6CEF6
; ���������������������������������������������������������������������������

loc_6CEE5:				; CODE XREF: sub_6B9C0+153Bj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_188]

loc_6CEF6:				; CODE XREF: sub_6B9C0+1523j
		cmp	[bp+var_188], 4
		jl	short loc_6CEE5
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_6CF7B
; ���������������������������������������������������������������������������

loc_6CF0E:				; CODE XREF: sub_6B9C0+15CAj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_18C+2], ax
		mov	bx, [bp+var_172]
		mov	ax, word ptr [bp+var_18C+2]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_17C], 2
		jle	short loc_6CF61
		mov	ax, word ptr [bp+var_17C]
		inc	word ptr [bp+var_17C]
		cmp	ax, 6
		jge	short loc_6CF61
		mov	ax, word ptr [bp+var_17C+2]
		mov	word ptr [bp+var_18C], ax
		inc	word ptr [bp+var_17C+2]
		mov	bx, word ptr [bp+var_176+2]
		mov	ax, word ptr [bp+var_18C]
		mov	[bx+1Bh], ax

loc_6CF61:				; CODE XREF: sub_6B9C0+157Bj
					; sub_6B9C0+1588j
		jmp	short loc_6CF6E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6CF6E
		jmp	short loc_6CF8C
; ���������������������������������������������������������������������������

loc_6CF6E:				; CODE XREF: sub_6B9C0:loc_6CF61j
					; sub_6B9C0+15AAj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6CF7B:				; CODE XREF: sub_6B9C0+154Cj
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_6CF0E

loc_6CF8C:				; CODE XREF: sub_6B9C0+15ACj
		mov	bx, [bp+var_172]
		mov	word ptr [bx+1Bh], 1
		mov	[bp+var_188], 0
		jmp	short loc_6CFAE
; ���������������������������������������������������������������������������

loc_6CF9D:				; CODE XREF: sub_6B9C0+15F3j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_188]

loc_6CFAE:				; CODE XREF: sub_6B9C0+15DBj
		cmp	[bp+var_188], 4
		jl	short loc_6CF9D
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_182+1], 0
		jz	short loc_6CFEA
		cmp	dword ptr [bp+var_186],	0
		jz	short loc_6CFEA
		push	0
		mov	al, byte ptr [bp+var_182]
		push	ax
		lea	ax, [bp+var_186]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6CFEA:				; CODE XREF: sub_6B9C0+1607j
					; sub_6B9C0+160Fj
		mov	dword ptr [bp+var_186],	0
		mov	byte ptr [bp+var_182+1], 0
		mov	[bp+var_182+2],	0
		jmp	loc_6D16D
; ���������������������������������������������������������������������������

loc_6D004:				; CODE XREF: sub_6B9C0+14C9j
		push	23h ; '#'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 2Ah	; '*'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6D150
; ���������������������������������������������������������������������������

loc_6D036:				; CODE XREF: sub_6B9C0+17AAj
		mov	ax, [bp+var_C95]
		mov	[bp+var_17E], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_17E]
		jge	short loc_6D06B
		mov	ax, si
		add	ax, 6
		cmp	ax, [bp+var_17E]
		jle	short loc_6D06B
		mov	ax, word ptr [bp+var_17C+2]
		mov	word ptr [bp+var_182+2], ax
		inc	word ptr [bp+var_17C+2]
		mov	bx, word ptr [bp+var_176+2]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax

loc_6D06B:				; CODE XREF: sub_6B9C0+1687j
					; sub_6B9C0+1692j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_17E]
		jnz	short loc_6D0CC
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	ax, [bp+var_A]
		add	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6D0CC:				; CODE XREF: sub_6B9C0+16B4j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_182], ax
		mov	bx, [bp+var_172]
		mov	ax, word ptr [bp+var_182]
		mov	[bx+1Bh], ax
		jmp	short loc_6D143
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D143
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6D16D
; ���������������������������������������������������������������������������

loc_6D143:				; CODE XREF: sub_6B9C0+1734j
					; sub_6B9C0+173Dj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D150:				; CODE XREF: sub_6B9C0+1673j
		cmp	[bp+var_C95], di
		jnb	short loc_6D15D
		cmp	[bp+var_C93], 0
		jz	short loc_6D162

loc_6D15D:				; CODE XREF: sub_6B9C0+1794j
		mov	ax, 1
		jmp	short loc_6D164
; ���������������������������������������������������������������������������

loc_6D162:				; CODE XREF: sub_6B9C0+179Bj
		xor	ax, ax

loc_6D164:				; CODE XREF: sub_6B9C0+17A0j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6D16D
		jmp	loc_6D036
; ���������������������������������������������������������������������������

loc_6D16D:				; CODE XREF: sub_6B9C0+1641j
					; sub_6B9C0+1781j ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6D186
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6D186:				; CODE XREF: sub_6B9C0+17C1j
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_7C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_170], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_172], ax
		push	1Fh
		push	[bp+var_172]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_172]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_132]
		mov	al, [bp+var_130]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F2]
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_E], 0
		jnz	short loc_6D275
		jmp	loc_6D375
; ���������������������������������������������������������������������������

loc_6D275:				; CODE XREF: sub_6B9C0+18B0j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178], 2
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		push	1
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_17C]
		push	ax
		push	[bp+var_172]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_17E], 0
		jmp	short loc_6D2E0
; ���������������������������������������������������������������������������

loc_6D2CF:				; CODE XREF: sub_6B9C0+1925j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6D2E0:				; CODE XREF: sub_6B9C0+190Dj
		cmp	[bp+var_17E], 3
		jl	short loc_6D2CF
		jmp	short loc_6D303
; ���������������������������������������������������������������������������

loc_6D2E9:				; CODE XREF: sub_6B9C0+1951j
		jmp	short loc_6D2F6
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D2F6
		jmp	short loc_6D313
; ���������������������������������������������������������������������������

loc_6D2F6:				; CODE XREF: sub_6B9C0:loc_6D2E9j
					; sub_6B9C0+1932j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D303:				; CODE XREF: sub_6B9C0+1927j
		push	[bp+var_172]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_6D2E9

loc_6D313:				; CODE XREF: sub_6B9C0+1934j
		mov	[bp+var_17E], 0
		jmp	short loc_6D32C
; ���������������������������������������������������������������������������

loc_6D31B:				; CODE XREF: sub_6B9C0+1971j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6D32C:				; CODE XREF: sub_6B9C0+1959j
		cmp	[bp+var_17E], 2
		jl	short loc_6D31B
		cmp	byte ptr [bp+var_178+1], 0
		jz	short loc_6D35B
		cmp	[bp+var_17C], 0
		jz	short loc_6D35B
		push	0
		mov	al, byte ptr [bp+var_178]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6D35B:				; CODE XREF: sub_6B9C0+1978j
					; sub_6B9C0+1980j
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		jmp	loc_6D4B1
; ���������������������������������������������������������������������������

loc_6D375:				; CODE XREF: sub_6B9C0+18B2j
		push	0FEh ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 39h	; '9'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6D494
; ���������������������������������������������������������������������������

loc_6D3A8:				; CODE XREF: sub_6B9C0+1AEEj
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D3D3
		mov	ax, [bp+var_C]
		shl	ax, 1
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6D3D3:				; CODE XREF: sub_6B9C0+19F9j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D3ED
		push	1F85h
		push	[bp+var_172]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_6D3ED:				; CODE XREF: sub_6B9C0+1A1Cj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D438
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_6D438:				; CODE XREF: sub_6B9C0+1A34j
		jmp	short loc_6D487
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D487
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6D4B1
; ���������������������������������������������������������������������������

loc_6D487:				; CODE XREF: sub_6B9C0:loc_6D438j
					; sub_6B9C0+1A81j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D494:				; CODE XREF: sub_6B9C0+19E5j
		cmp	[bp+var_C95], di
		jnb	short loc_6D4A1
		cmp	[bp+var_C93], 0
		jz	short loc_6D4A6

loc_6D4A1:				; CODE XREF: sub_6B9C0+1AD8j
		mov	ax, 1
		jmp	short loc_6D4A8
; ���������������������������������������������������������������������������

loc_6D4A6:				; CODE XREF: sub_6B9C0+1ADFj
		xor	ax, ax

loc_6D4A8:				; CODE XREF: sub_6B9C0+1AE4j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6D4B1
		jmp	loc_6D3A8
; ���������������������������������������������������������������������������

loc_6D4B1:				; CODE XREF: sub_6B9C0+19B2j
					; sub_6B9C0+1AC5j ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6D4CA
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6D4CA:				; CODE XREF: sub_6B9C0+1B05j
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_72]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_170], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_172], ax
		push	21h ; '!'
		push	[bp+var_172]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_172]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_122]
		mov	al, [bp+var_120]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F2]
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_E], 0
		jnz	short loc_6D5B9
		jmp	loc_6D789
; ���������������������������������������������������������������������������

loc_6D5B9:				; CODE XREF: sub_6B9C0+1BF4j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178], 2
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		push	8
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_17C]
		push	ax
		push	[bp+var_172]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_17E], 0
		jmp	short loc_6D624
; ���������������������������������������������������������������������������

loc_6D613:				; CODE XREF: sub_6B9C0+1C69j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6D624:				; CODE XREF: sub_6B9C0+1C51j
		cmp	[bp+var_17E], 3
		jl	short loc_6D613
		jmp	short loc_6D647
; ���������������������������������������������������������������������������

loc_6D62D:				; CODE XREF: sub_6B9C0+1C95j
		jmp	short loc_6D63A
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D63A
		jmp	short loc_6D657
; ���������������������������������������������������������������������������

loc_6D63A:				; CODE XREF: sub_6B9C0:loc_6D62Dj
					; sub_6B9C0+1C76j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D647:				; CODE XREF: sub_6B9C0+1C6Bj
		push	[bp+var_172]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_6D62D

loc_6D657:				; CODE XREF: sub_6B9C0+1C78j
		mov	dword ptr [bp+var_188],	0
		mov	byte ptr [bp+var_184], 2
		mov	byte ptr [bp+var_184+1], 0
		mov	[bp+var_182], 0
		push	2
		lea	ax, [bp+var_188]
		push	ax
		push	9
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_188]
		push	ax
		push	[bp+var_172]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_17E], 0
		jmp	short loc_6D6B5
; ���������������������������������������������������������������������������

loc_6D6A4:				; CODE XREF: sub_6B9C0+1CFAj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6D6B5:				; CODE XREF: sub_6B9C0+1CE2j
		cmp	[bp+var_17E], 4
		jl	short loc_6D6A4
		jmp	short loc_6D6D8
; ���������������������������������������������������������������������������

loc_6D6BE:				; CODE XREF: sub_6B9C0+1D26j
		jmp	short loc_6D6CB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D6CB
		jmp	short loc_6D6E8
; ���������������������������������������������������������������������������

loc_6D6CB:				; CODE XREF: sub_6B9C0:loc_6D6BEj
					; sub_6B9C0+1D07j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D6D8:				; CODE XREF: sub_6B9C0+1CFCj
		push	[bp+var_172]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_6D6BE

loc_6D6E8:				; CODE XREF: sub_6B9C0+1D09j
		mov	[bp+var_17E], 0
		jmp	short loc_6D701
; ���������������������������������������������������������������������������

loc_6D6F0:				; CODE XREF: sub_6B9C0+1D46j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6D701:				; CODE XREF: sub_6B9C0+1D2Ej
		cmp	[bp+var_17E], 4
		jl	short loc_6D6F0
		cmp	byte ptr [bp+var_184+1], 0
		jz	short loc_6D730
		cmp	dword ptr [bp+var_188],	0
		jz	short loc_6D730
		push	0
		mov	al, byte ptr [bp+var_184]
		push	ax
		lea	ax, [bp+var_188]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6D730:				; CODE XREF: sub_6B9C0+1D4Dj
					; sub_6B9C0+1D55j
		mov	dword ptr [bp+var_188],	0
		mov	byte ptr [bp+var_184+1], 0
		mov	[bp+var_182], 0
		cmp	byte ptr [bp+var_178+1], 0
		jz	short loc_6D76F
		cmp	[bp+var_17C], 0
		jz	short loc_6D76F
		push	0
		mov	al, byte ptr [bp+var_178]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6D76F:				; CODE XREF: sub_6B9C0+1D8Cj
					; sub_6B9C0+1D94j
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		jmp	loc_6DA0B
; ���������������������������������������������������������������������������

loc_6D789:				; CODE XREF: sub_6B9C0+1BF6j
		push	0E0h ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 32h	; '2'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6D8AB
; ���������������������������������������������������������������������������

loc_6D7BC:				; CODE XREF: sub_6B9C0+1F05j
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D7EA
		mov	ax, [bp+var_C]
		shl	ax, 1
		add	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6D7EA:				; CODE XREF: sub_6B9C0+1E0Dj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D804
		push	1F9Bh
		push	[bp+var_172]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_6D804:				; CODE XREF: sub_6B9C0+1E33j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D84F
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_6D84F:				; CODE XREF: sub_6B9C0+1E4Bj
		jmp	short loc_6D89E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D89E
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6D8C8
; ���������������������������������������������������������������������������

loc_6D89E:				; CODE XREF: sub_6B9C0:loc_6D84Fj
					; sub_6B9C0+1E98j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D8AB:				; CODE XREF: sub_6B9C0+1DF9j
		cmp	[bp+var_C95], di
		jnb	short loc_6D8B8
		cmp	[bp+var_C93], 0
		jz	short loc_6D8BD

loc_6D8B8:				; CODE XREF: sub_6B9C0+1EEFj
		mov	ax, 1
		jmp	short loc_6D8BF
; ���������������������������������������������������������������������������

loc_6D8BD:				; CODE XREF: sub_6B9C0+1EF6j
		xor	ax, ax

loc_6D8BF:				; CODE XREF: sub_6B9C0+1EFBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6D8C8
		jmp	loc_6D7BC
; ���������������������������������������������������������������������������

loc_6D8C8:				; CODE XREF: sub_6B9C0+1EDCj
					; sub_6B9C0+1F03j
		cmp	byte_495FC, 0
		jz	short loc_6D8E1
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6D8E1:				; CODE XREF: sub_6B9C0+1F0Dj
		mov	[bp+var_8], 35h	; '5'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6D9EE
; ���������������������������������������������������������������������������

loc_6D901:				; CODE XREF: sub_6B9C0+2048j
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D92D
		mov	ax, [bp+var_C]
		shl	ax, 2
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6D92D:				; CODE XREF: sub_6B9C0+1F52j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D947
		push	1FAFh
		push	[bp+var_172]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_6D947:				; CODE XREF: sub_6B9C0+1F76j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jnz	short loc_6D992
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_6D992:				; CODE XREF: sub_6B9C0+1F8Ej
		jmp	short loc_6D9E1
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6D9E1
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6DA0B
; ���������������������������������������������������������������������������

loc_6D9E1:				; CODE XREF: sub_6B9C0:loc_6D992j
					; sub_6B9C0+1FDBj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6D9EE:				; CODE XREF: sub_6B9C0+1F3Ej
		cmp	[bp+var_C95], di
		jnb	short loc_6D9FB
		cmp	[bp+var_C93], 0
		jz	short loc_6DA00

loc_6D9FB:				; CODE XREF: sub_6B9C0+2032j
		mov	ax, 1
		jmp	short loc_6DA02
; ���������������������������������������������������������������������������

loc_6DA00:				; CODE XREF: sub_6B9C0+2039j
		xor	ax, ax

loc_6DA02:				; CODE XREF: sub_6B9C0+203Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6DA0B
		jmp	loc_6D901
; ���������������������������������������������������������������������������

loc_6DA0B:				; CODE XREF: sub_6B9C0+1DC6j
					; sub_6B9C0+201Fj ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6DA24
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6DA24:				; CODE XREF: sub_6B9C0+205Fj
		mov	byte ptr [bp+var_170+1], 0
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_7C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176+2], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_176], ax
		push	1Fh
		push	word ptr [bp+var_176]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+var_176+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_132]
		mov	al, [bp+var_130]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F2]
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_E], 0
		jnz	short loc_6DB18
		jmp	loc_6DD80
; ���������������������������������������������������������������������������

loc_6DB18:				; CODE XREF: sub_6B9C0+2153j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_182+2],	0
		mov	byte ptr [bp+var_17C], 2
		mov	byte ptr [bp+var_17C+1], 0
		mov	[bp+var_17C+2],	0
		push	2
		lea	ax, [bp+var_182+2]
		push	ax
		push	2
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_182+2]
		push	ax
		push	word ptr [bp+var_176]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_182], 0
		jmp	loc_6DC34
; ���������������������������������������������������������������������������

loc_6DB73:				; CODE XREF: sub_6B9C0+227Bj
		cmp	[bp+var_F], 0
		jnz	short loc_6DB7C
		jmp	loc_6DC23
; ���������������������������������������������������������������������������

loc_6DB7C:				; CODE XREF: sub_6B9C0+21B7j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_172], ax
		cmp	[bp+var_172], 6
		jle	short loc_6DBF4
		mov	al, byte ptr [bp+var_170+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6DBF4
		mov	ax, word_48ECE
		mov	[bp+var_184], ax
		mov	[bp+var_186], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6DBED
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_186]
		push	[bp+var_184]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6DBED:				; CODE XREF: sub_6B9C0+21FBj
		mov	byte ptr [bp+var_170+1], 1
		jmp	short loc_6DC23
; ���������������������������������������������������������������������������

loc_6DBF4:				; CODE XREF: sub_6B9C0+21DDj
					; sub_6B9C0+21E7j
		cmp	[bp+var_172], 6
		jg	short loc_6DC23
		cmp	byte ptr [bp+var_170+1], 0
		jz	short loc_6DC23
		cmp	[bp+var_C66], 0
		jz	short loc_6DC1E
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6DC1E:				; CODE XREF: sub_6B9C0+2247j
		mov	byte ptr [bp+var_170+1], 0

loc_6DC23:				; CODE XREF: sub_6B9C0+21B9j
					; sub_6B9C0+2232j ...
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_182]

loc_6DC34:				; CODE XREF: sub_6B9C0+21B0j
		cmp	word ptr [bp+var_182], 0Ah
		jge	short loc_6DC3E
		jmp	loc_6DB73
; ���������������������������������������������������������������������������

loc_6DC3E:				; CODE XREF: sub_6B9C0+2279j
		cmp	[bp+var_F], 0
		jz	short loc_6DC67
		cmp	byte ptr [bp+var_170+1], 0
		jz	short loc_6DC67
		cmp	[bp+var_C66], 0
		jz	short loc_6DC67
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6DC67:				; CODE XREF: sub_6B9C0+2282j
					; sub_6B9C0+2289j ...
		mov	word ptr [bp+var_182], 0
		jmp	loc_6DD0B
; ���������������������������������������������������������������������������

loc_6DC70:				; CODE XREF: sub_6B9C0+235Bj
		cmp	word ptr [bp+var_182], 2
		jnz	short loc_6DC85
		push	19h
		push	word ptr [bp+var_176]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_6DC85:				; CODE XREF: sub_6B9C0+22B5j
		cmp	word ptr [bp+var_182], 2
		jnz	short loc_6DCD6
		cmp	[bp+var_F], 0
		jz	short loc_6DCD6
		mov	ax, word_48ECE
		mov	[bp+var_188], ax
		mov	word ptr [bp+var_18C+2], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6DCD6
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_18C+2]
		push	[bp+var_188]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6DCD6:				; CODE XREF: sub_6B9C0+22CAj
					; sub_6B9C0+22D0j ...
		mov	ax, word ptr [bp+var_182]
		inc	word ptr [bp+var_182]
		cmp	ax, 8
		jnz	short loc_6DCF1
		push	12h
		push	word ptr [bp+var_176]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_6DCF1:				; CODE XREF: sub_6B9C0+2321j
		jmp	short loc_6DCFE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6DCFE
		jmp	short loc_6DD1E
; ���������������������������������������������������������������������������

loc_6DCFE:				; CODE XREF: sub_6B9C0:loc_6DCF1j
					; sub_6B9C0+233Aj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6DD0B:				; CODE XREF: sub_6B9C0+22ADj
		push	word ptr [bp+var_176]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_6DD1E
		jmp	loc_6DC70
; ���������������������������������������������������������������������������

loc_6DD1E:				; CODE XREF: sub_6B9C0+233Cj
					; sub_6B9C0+2359j
		mov	word ptr [bp+var_182], 0
		jmp	short loc_6DD37
; ���������������������������������������������������������������������������

loc_6DD26:				; CODE XREF: sub_6B9C0+237Cj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_182]

loc_6DD37:				; CODE XREF: sub_6B9C0+2364j
		cmp	word ptr [bp+var_182], 4
		jl	short loc_6DD26
		cmp	byte ptr [bp+var_17C+1], 0
		jz	short loc_6DD66
		cmp	[bp+var_182+2],	0
		jz	short loc_6DD66
		push	0
		mov	al, byte ptr [bp+var_17C]
		push	ax
		lea	ax, [bp+var_182+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6DD66:				; CODE XREF: sub_6B9C0+2383j
					; sub_6B9C0+238Bj
		mov	[bp+var_182+2],	0
		mov	byte ptr [bp+var_17C+1], 0
		mov	[bp+var_17C+2],	0
		jmp	loc_6E043
; ���������������������������������������������������������������������������

loc_6DD80:				; CODE XREF: sub_6B9C0+2155j
		push	0FEh ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_178], 0
		jmp	loc_6DE5D
; ���������������������������������������������������������������������������

loc_6DD9C:				; CODE XREF: sub_6B9C0+24A4j
		cmp	[bp+var_F], 0
		jnz	short loc_6DDA5
		jmp	loc_6DE4C
; ���������������������������������������������������������������������������

loc_6DDA5:				; CODE XREF: sub_6B9C0+23E0j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_172], ax
		cmp	[bp+var_172], 6
		jle	short loc_6DE1D
		mov	al, byte ptr [bp+var_170+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6DE1D
		mov	ax, word_48ECE
		mov	word ptr [bp+var_17C+2], ax
		mov	word ptr [bp+var_17C], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6DE16
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_17C]
		push	word ptr [bp+var_17C+2]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6DE16:				; CODE XREF: sub_6B9C0+2424j
		mov	byte ptr [bp+var_170+1], 1
		jmp	short loc_6DE4C
; ���������������������������������������������������������������������������

loc_6DE1D:				; CODE XREF: sub_6B9C0+2406j
					; sub_6B9C0+2410j
		cmp	[bp+var_172], 6
		jg	short loc_6DE4C
		cmp	byte ptr [bp+var_170+1], 0
		jz	short loc_6DE4C
		cmp	[bp+var_C66], 0
		jz	short loc_6DE47
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6DE47:				; CODE XREF: sub_6B9C0+2470j
		mov	byte ptr [bp+var_170+1], 0

loc_6DE4C:				; CODE XREF: sub_6B9C0+23E2j
					; sub_6B9C0+245Bj ...
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_178]

loc_6DE5D:				; CODE XREF: sub_6B9C0+23D9j
		cmp	[bp+var_178], 0Ah
		jge	short loc_6DE67
		jmp	loc_6DD9C
; ���������������������������������������������������������������������������

loc_6DE67:				; CODE XREF: sub_6B9C0+24A2j
		cmp	[bp+var_F], 0
		jz	short loc_6DE90
		cmp	byte ptr [bp+var_170+1], 0
		jz	short loc_6DE90
		cmp	[bp+var_C66], 0
		jz	short loc_6DE90
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6DE90:				; CODE XREF: sub_6B9C0+24ABj
					; sub_6B9C0+24B2j ...
		mov	[bp+var_8], 14h
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6E026
; ���������������������������������������������������������������������������

loc_6DEB0:				; CODE XREF: sub_6B9C0+2680j
		mov	ax, [bp+var_C95]
		mov	[bp+var_17E], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_17E]
		jnz	short loc_6DEDE
		mov	ax, [bp+var_C]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6DEDE:				; CODE XREF: sub_6B9C0+2501j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_17E]
		jnz	short loc_6DF33
		cmp	[bp+var_F], 0
		jz	short loc_6DF33
		mov	ax, word_48ECE
		mov	word ptr [bp+var_182+2], ax
		mov	word ptr [bp+var_182], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6DF33
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_182]
		push	word ptr [bp+var_182+2]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6DF33:				; CODE XREF: sub_6B9C0+2527j
					; sub_6B9C0+252Dj ...
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_17E]
		jnz	short loc_6DF4C
		push	19h
		push	word ptr [bp+var_176]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_6DF4C:				; CODE XREF: sub_6B9C0+257Cj
		mov	ax, si
		add	ax, 8
		cmp	ax, [bp+var_17E]
		jnz	short loc_6DF65
		push	12h
		push	word ptr [bp+var_176]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_6DF65:				; CODE XREF: sub_6B9C0+2595j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_17E]
		jnz	short loc_6DF7F
		push	1FC1h
		push	word ptr [bp+var_176]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_6DF7F:				; CODE XREF: sub_6B9C0+25AEj
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_17E]
		jnz	short loc_6DFCA
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_6DFCA:				; CODE XREF: sub_6B9C0+25C6j
		jmp	short loc_6E019
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6E019
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6E043
; ���������������������������������������������������������������������������

loc_6E019:				; CODE XREF: sub_6B9C0:loc_6DFCAj
					; sub_6B9C0+2613j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6E026:				; CODE XREF: sub_6B9C0+24EDj
		cmp	[bp+var_C95], di
		jnb	short loc_6E033
		cmp	[bp+var_C93], 0
		jz	short loc_6E038

loc_6E033:				; CODE XREF: sub_6B9C0+266Aj
		mov	ax, 1
		jmp	short loc_6E03A
; ���������������������������������������������������������������������������

loc_6E038:				; CODE XREF: sub_6B9C0+2671j
		xor	ax, ax

loc_6E03A:				; CODE XREF: sub_6B9C0+2676j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E043
		jmp	loc_6DEB0
; ���������������������������������������������������������������������������

loc_6E043:				; CODE XREF: sub_6B9C0+23BDj
					; sub_6B9C0+2657j ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6E05C
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6E05C:				; CODE XREF: sub_6B9C0+2697j
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_170], ax
		push	0
		push	0
		lea	ax, [bp+var_5E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_172], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_9A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176+2], ax
		push	1
		push	0FFE9h
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_176], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_A4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_178], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_17C+2], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_C2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_17C], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_CC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_17E], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_182+2], ax
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_172]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_178]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_17C+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_17C]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_112]
		mov	al, [bp+var_110]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_102]
		mov	al, [bp+var_100]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0Fh
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	word ptr [bp+var_182], 2
		mov	ax, word ptr [bp+var_182]
		mov	[bp+var_184], ax
		mov	bx, [bp+var_178]
		mov	ax, [bp+var_184]
		mov	[bx+1Bh], ax
		cmp	[bp+var_E], 0
		jnz	short loc_6E244
		jmp	loc_6E500
; ���������������������������������������������������������������������������

loc_6E244:				; CODE XREF: sub_6B9C0+287Fj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_192+2],	0
		mov	byte ptr [bp+var_18C], 2
		mov	byte ptr [bp+var_18C+1], 0
		mov	[bp+var_18C+2],	0
		push	2
		lea	ax, [bp+var_192+2]
		push	ax
		push	3
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_192+2]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_192], 0
		jmp	short loc_6E2D4
; ���������������������������������������������������������������������������

loc_6E29D:				; CODE XREF: sub_6B9C0+2919j
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_194], ax
		mov	bx, [bp+var_172]
		mov	ax, [bp+var_194]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_192]

loc_6E2D4:				; CODE XREF: sub_6B9C0+28DBj
		cmp	word ptr [bp+var_192], 4
		jl	short loc_6E29D
		mov	word ptr [bp+var_192], 0
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6E356
		cmp	[bp+var_C66], 0
		jz	short loc_6E312
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6E312:				; CODE XREF: sub_6B9C0+293Bj
		mov	ax, word_48EC2
		mov	[bp+var_196], ax
		mov	[bp+var_198], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6E356
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_198]
		push	[bp+var_196]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6E356:				; CODE XREF: sub_6B9C0+2934j
					; sub_6B9C0+2964j
		jmp	loc_6E437
; ���������������������������������������������������������������������������

loc_6E359:				; CODE XREF: sub_6B9C0+2A88j
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_19A], ax
		mov	bx, [bp+var_172]
		mov	ax, [bp+var_19A]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_192], 3
		jnz	short loc_6E3FE
		push	word ptr [bp+var_17C+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp+var_17C]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_17C+2], 0
		jz	short loc_6E3C2
		push	3
		push	word ptr [bp+var_17C+2]
		mov	bx, word ptr [bp+var_17C+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6E3C2:				; CODE XREF: sub_6B9C0+29EDj
		cmp	word ptr [bp+var_17C], 0
		jz	short loc_6E3DC
		push	3
		push	word ptr [bp+var_17C]
		mov	bx, word ptr [bp+var_17C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6E3DC:				; CODE XREF: sub_6B9C0+2A07j
		push	[bp+var_17E]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_182+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_6E3FE:				; CODE XREF: sub_6B9C0+29C4j
		mov	ax, word ptr [bp+var_192]
		inc	word ptr [bp+var_192]
		cmp	ax, 4
		jnz	short loc_6E41D
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_182+2]
		mov	word ptr [bx+1Bh], 1

loc_6E41D:				; CODE XREF: sub_6B9C0+2A49j
		jmp	short loc_6E42A
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6E42A
		jmp	short loc_6E44B
; ���������������������������������������������������������������������������

loc_6E42A:				; CODE XREF: sub_6B9C0:loc_6E41Dj
					; sub_6B9C0+2A66j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6E437:				; CODE XREF: sub_6B9C0:loc_6E356j
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_6E44B
		jmp	loc_6E359
; ���������������������������������������������������������������������������

loc_6E44B:				; CODE XREF: sub_6B9C0+2A68j
					; sub_6B9C0+2A86j
		cmp	[bp+var_F], 0
		jz	short loc_6E4B1
		cmp	[bp+var_C74], 0
		jz	short loc_6E46D
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6E46D:				; CODE XREF: sub_6B9C0+2A96j
		mov	ax, word_48ECE
		mov	[bp+var_19C], ax
		mov	[bp+var_19E], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6E4B1
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_19E]
		push	[bp+var_19C]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6E4B1:				; CODE XREF: sub_6B9C0+2A8Fj
					; sub_6B9C0+2ABFj
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_18C+1], 0
		jz	short loc_6E4E6
		cmp	[bp+var_192+2],	0
		jz	short loc_6E4E6
		push	0
		mov	al, byte ptr [bp+var_18C]
		push	ax
		lea	ax, [bp+var_192+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6E4E6:				; CODE XREF: sub_6B9C0+2B03j
					; sub_6B9C0+2B0Bj
		mov	[bp+var_192+2],	0
		mov	byte ptr [bp+var_18C+1], 0
		mov	[bp+var_18C+2],	0
		jmp	loc_6E90E
; ���������������������������������������������������������������������������

loc_6E500:				; CODE XREF: sub_6B9C0+2881j
		mov	[bp+var_8], 26h	; '&'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6E6BD
; ���������������������������������������������������������������������������

loc_6E520:				; CODE XREF: sub_6B9C0+2D17j
		mov	ax, [bp+var_C95]
		mov	[bp+var_188], ax
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_18C+2], ax
		mov	bx, [bp+var_172]
		mov	ax, word ptr [bp+var_18C+2]
		mov	[bx+1Bh], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_188]
		jnz	short loc_6E574
		mov	ax, [bp+var_C]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6E574:				; CODE XREF: sub_6B9C0+2B97j
		mov	ax, si
		add	ax, 3
		cmp	ax, [bp+var_188]
		jnz	short loc_6E5F7
		push	word ptr [bp+var_17C+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp+var_17C]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_17C+2], 0
		jz	short loc_6E5BB
		push	3
		push	word ptr [bp+var_17C+2]
		mov	bx, word ptr [bp+var_17C+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6E5BB:				; CODE XREF: sub_6B9C0+2BE6j
		cmp	word ptr [bp+var_17C], 0
		jz	short loc_6E5D5
		push	3
		push	word ptr [bp+var_17C]
		mov	bx, word ptr [bp+var_17C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6E5D5:				; CODE XREF: sub_6B9C0+2C00j
		push	[bp+var_17E]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_182+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_6E5F7:				; CODE XREF: sub_6B9C0+2BBDj
		mov	ax, si
		add	ax, 4
		cmp	ax, [bp+var_188]
		jnz	short loc_6E614
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_182+2]
		mov	word ptr [bx+1Bh], 1

loc_6E614:				; CODE XREF: sub_6B9C0+2C40j
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, [bp+var_188]
		jnz	short loc_6E661
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_6E661:				; CODE XREF: sub_6B9C0+2C5Dj
		jmp	short loc_6E6B0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6E6B0
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6E6DA
; ���������������������������������������������������������������������������

loc_6E6B0:				; CODE XREF: sub_6B9C0:loc_6E661j
					; sub_6B9C0+2CAAj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6E6BD:				; CODE XREF: sub_6B9C0+2B5Dj
		cmp	[bp+var_C95], di
		jnb	short loc_6E6CA
		cmp	[bp+var_C93], 0
		jz	short loc_6E6CF

loc_6E6CA:				; CODE XREF: sub_6B9C0+2D01j
		mov	ax, 1
		jmp	short loc_6E6D1
; ���������������������������������������������������������������������������

loc_6E6CF:				; CODE XREF: sub_6B9C0+2D08j
		xor	ax, ax

loc_6E6D1:				; CODE XREF: sub_6B9C0+2D0Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E6DA
		jmp	loc_6E520
; ���������������������������������������������������������������������������

loc_6E6DA:				; CODE XREF: sub_6B9C0+2CEEj
					; sub_6B9C0+2D15j
		cmp	byte_495FC, 0
		jz	short loc_6E6F3
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6E6F3:				; CODE XREF: sub_6B9C0+2D1Fj
		push	0A7h ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 2Dh	; '-'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6E8F1
; ���������������������������������������������������������������������������

loc_6E726:				; CODE XREF: sub_6B9C0+2F4Bj
		mov	ax, [bp+var_C95]
		mov	[bp+var_188], ax
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_18C+2], ax
		mov	bx, [bp+var_172]
		mov	ax, word ptr [bp+var_18C+2]
		mov	[bx+1Bh], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp+var_188]
		jz	short loc_6E760
		jmp	loc_6E7E1
; ���������������������������������������������������������������������������

loc_6E760:				; CODE XREF: sub_6B9C0+2D9Bj
		mov	ax, [bp+var_C]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6E7E1
		cmp	[bp+var_C66], 0
		jz	short loc_6E79D
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6E79D:				; CODE XREF: sub_6B9C0+2DC6j
		mov	ax, word_48EC2
		mov	word ptr [bp+var_18C], ax
		mov	[bp+var_18E], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6E7E1
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_18E]
		push	word ptr [bp+var_18C]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6E7E1:				; CODE XREF: sub_6B9C0+2D9Dj
					; sub_6B9C0+2DBFj ...
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_188]
		jz	short loc_6E7ED
		jmp	loc_6E895
; ���������������������������������������������������������������������������

loc_6E7ED:				; CODE XREF: sub_6B9C0+2E28j
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_6E895
		cmp	[bp+var_C74], 0
		jz	short loc_6E851
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6E851:				; CODE XREF: sub_6B9C0+2E7Aj
		mov	ax, word_48ECE
		mov	word ptr [bp+var_192+2], ax
		mov	word ptr [bp+var_192], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6E895
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_192]
		push	word ptr [bp+var_192+2]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6E895:				; CODE XREF: sub_6B9C0+2E2Aj
					; sub_6B9C0+2E73j ...
		jmp	short loc_6E8E4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6E8E4
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6E90E
; ���������������������������������������������������������������������������

loc_6E8E4:				; CODE XREF: sub_6B9C0:loc_6E895j
					; sub_6B9C0+2EDEj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6E8F1:				; CODE XREF: sub_6B9C0+2D63j
		cmp	[bp+var_C95], di
		jnb	short loc_6E8FE
		cmp	[bp+var_C93], 0
		jz	short loc_6E903

loc_6E8FE:				; CODE XREF: sub_6B9C0+2F35j
		mov	ax, 1
		jmp	short loc_6E905
; ���������������������������������������������������������������������������

loc_6E903:				; CODE XREF: sub_6B9C0+2F3Cj
		xor	ax, ax

loc_6E905:				; CODE XREF: sub_6B9C0+2F41j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E90E
		jmp	loc_6E726
; ���������������������������������������������������������������������������

loc_6E90E:				; CODE XREF: sub_6B9C0+2B3Dj
					; sub_6B9C0+2F22j ...
		call	CRT_Rand
		movsx	eax, ax
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_186], ax
		mov	bx, [bp+var_172]
		mov	ax, [bp+var_186]
		mov	[bx+1Bh], ax
		cmp	[bp+var_E], 0
		jnz	short loc_6E93A
		jmp	loc_6EB3E
; ���������������������������������������������������������������������������

loc_6E93A:				; CODE XREF: sub_6B9C0+2F75j
		mov	[bp+var_188], 0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_192], 0
		mov	byte ptr [bp+var_18E], 2
		mov	byte ptr [bp+var_18E+1], 0
		mov	[bp+var_18C], 0
		push	2
		lea	ax, [bp+var_192]
		push	ax
		push	0Ah
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_192]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_194], 0
		jmp	short loc_6E9AA
; ���������������������������������������������������������������������������

loc_6E999:				; CODE XREF: sub_6B9C0+2FEFj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_194]

loc_6E9AA:				; CODE XREF: sub_6B9C0+2FD7j
		cmp	[bp+var_194], 2
		jl	short loc_6E999
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6EA26
		cmp	[bp+var_C66], 0
		jz	short loc_6E9E2
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6E9E2:				; CODE XREF: sub_6B9C0+300Bj
		mov	ax, word_48EC2
		mov	[bp+var_196], ax
		mov	[bp+var_198], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6EA26
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_198]
		push	[bp+var_196]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6EA26:				; CODE XREF: sub_6B9C0+3004j
					; sub_6B9C0+3034j
		jmp	short loc_6EA58
; ���������������������������������������������������������������������������

loc_6EA28:				; CODE XREF: sub_6B9C0+30A7j
		mov	ax, [bp+var_188]
		inc	[bp+var_188]
		cmp	ax, 3
		jnz	short loc_6EA3E
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Bh], 0Ah

loc_6EA3E:				; CODE XREF: sub_6B9C0+3073j
		jmp	short loc_6EA4B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6EA4B
		jmp	short loc_6EA69
; ���������������������������������������������������������������������������

loc_6EA4B:				; CODE XREF: sub_6B9C0:loc_6EA3Ej
					; sub_6B9C0+3087j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6EA58:				; CODE XREF: sub_6B9C0:loc_6EA26j
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_6EA28

loc_6EA69:				; CODE XREF: sub_6B9C0+3089j
		cmp	[bp+var_F], 0
		jz	short loc_6EACF
		cmp	[bp+var_C74], 0
		jz	short loc_6EA8B
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6EA8B:				; CODE XREF: sub_6B9C0+30B4j
		mov	ax, word_48ECE
		mov	[bp+var_19A], ax
		mov	[bp+var_19C], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6EACF
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_19C]
		push	[bp+var_19A]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6EACF:				; CODE XREF: sub_6B9C0+30ADj
					; sub_6B9C0+30DDj
		mov	[bp+var_194], 0
		jmp	short loc_6EAE8
; ���������������������������������������������������������������������������

loc_6EAD7:				; CODE XREF: sub_6B9C0+312Dj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_194]

loc_6EAE8:				; CODE XREF: sub_6B9C0+3115j
		cmp	[bp+var_194], 4
		jl	short loc_6EAD7
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_18E+1], 0
		jz	short loc_6EB24
		cmp	[bp+var_192], 0
		jz	short loc_6EB24
		push	0
		mov	al, byte ptr [bp+var_18E]
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6EB24:				; CODE XREF: sub_6B9C0+3141j
					; sub_6B9C0+3149j
		mov	[bp+var_192], 0
		mov	byte ptr [bp+var_18E+1], 0
		mov	[bp+var_18C], 0
		jmp	loc_6ECA3
; ���������������������������������������������������������������������������

loc_6EB3E:				; CODE XREF: sub_6B9C0+2F77j
		push	23h ; '#'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 28h	; '('
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6EC86
; ���������������������������������������������������������������������������

loc_6EB70:				; CODE XREF: sub_6B9C0+32E0j
		mov	ax, [bp+var_C95]
		mov	[bp+var_188], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_188]
		jge	short loc_6EBA5
		mov	ax, si
		add	ax, 6
		cmp	ax, [bp+var_188]
		jle	short loc_6EBA5
		mov	ax, word ptr [bp+var_182]
		mov	word ptr [bp+var_18C+2], ax
		dec	word ptr [bp+var_182]
		mov	bx, [bp+var_178]
		mov	ax, word ptr [bp+var_18C+2]
		mov	[bx+1Bh], ax

loc_6EBA5:				; CODE XREF: sub_6B9C0+31C1j
					; sub_6B9C0+31CCj
		mov	ax, si
		add	ax, 5
		cmp	ax, [bp+var_188]
		jnz	short loc_6EBB9
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Bh], 0Ah

loc_6EBB9:				; CODE XREF: sub_6B9C0+31EEj
		mov	ax, si
		add	ax, 5
		cmp	ax, [bp+var_188]
		jnz	short loc_6EBDD
		mov	ax, [bp+var_C]
		shl	ax, 3
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_6EBDD:				; CODE XREF: sub_6B9C0+3202j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, [bp+var_188]
		jnz	short loc_6EC2A
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_6EC2A:				; CODE XREF: sub_6B9C0+3226j
		jmp	short loc_6EC79
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6EC79
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6ECA3
; ���������������������������������������������������������������������������

loc_6EC79:				; CODE XREF: sub_6B9C0:loc_6EC2Aj
					; sub_6B9C0+3273j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6EC86:				; CODE XREF: sub_6B9C0+31ADj
		cmp	[bp+var_C95], di
		jnb	short loc_6EC93
		cmp	[bp+var_C93], 0
		jz	short loc_6EC98

loc_6EC93:				; CODE XREF: sub_6B9C0+32CAj
		mov	ax, 1
		jmp	short loc_6EC9A
; ���������������������������������������������������������������������������

loc_6EC98:				; CODE XREF: sub_6B9C0+32D1j
		xor	ax, ax

loc_6EC9A:				; CODE XREF: sub_6B9C0+32D6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6ECA3
		jmp	loc_6EB70
; ���������������������������������������������������������������������������

loc_6ECA3:				; CODE XREF: sub_6B9C0+317Bj
					; sub_6B9C0+32B7j ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6ECBC
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6ECBC:				; CODE XREF: sub_6B9C0+32F7j
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_68]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp+var_170], ax
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_142]
		mov	al, [bp+var_140]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F2]
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0A7h ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+var_170]
		mov	word ptr [bx+1Bh], 0
		push	0
		call	CRT_Time_85A
		add	sp, 2
		push	ax
		call	CRT_Srand_6F2
		add	sp, 2
		mov	[bp+var_172], 4
		cmp	[bp+var_E], 0
		jnz	short loc_6ED91
		jmp	loc_6EFF1
; ���������������������������������������������������������������������������

loc_6ED91:				; CODE XREF: sub_6B9C0+33CCj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178], 2
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		push	4
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_17C]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_17E], 0
		jmp	short loc_6EE25
; ���������������������������������������������������������������������������

loc_6EDEA:				; CODE XREF: sub_6B9C0+346Aj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_182+2], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6EE25:				; CODE XREF: sub_6B9C0+3428j
		cmp	[bp+var_17E], 4
		jl	short loc_6EDEA
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6EEA1
		cmp	[bp+var_C66], 0
		jz	short loc_6EE5D
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6EE5D:				; CODE XREF: sub_6B9C0+3486j
		mov	ax, word_48EC2
		mov	word ptr [bp+var_182], ax
		mov	[bp+var_184], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6EEA1
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_184]
		push	word ptr [bp+var_182]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6EEA1:				; CODE XREF: sub_6B9C0+347Fj
					; sub_6B9C0+34AFj
		jmp	short loc_6EEE7
; ���������������������������������������������������������������������������

loc_6EEA3:				; CODE XREF: sub_6B9C0+3536j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	[bp+var_186], ax
		mov	bx, [bp+var_170]
		mov	ax, [bp+var_186]
		mov	[bx+1Bh], ax
		jmp	short loc_6EEDA
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6EEDA
		jmp	short loc_6EEF8
; ���������������������������������������������������������������������������

loc_6EEDA:				; CODE XREF: sub_6B9C0+350Dj
					; sub_6B9C0+3516j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6EEE7:				; CODE XREF: sub_6B9C0:loc_6EEA1j
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_6EEA3

loc_6EEF8:				; CODE XREF: sub_6B9C0+3518j
		cmp	[bp+var_F], 0
		jz	short loc_6EF5E
		cmp	[bp+var_C74], 0
		jz	short loc_6EF1A
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6EF1A:				; CODE XREF: sub_6B9C0+3543j
		mov	ax, word_48ECE
		mov	[bp+var_188], ax
		mov	word ptr [bp+var_18C+2], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6EF5E
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_18C+2]
		push	[bp+var_188]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6EF5E:				; CODE XREF: sub_6B9C0+353Cj
					; sub_6B9C0+356Cj
		mov	[bp+var_17E], 0
		jmp	short loc_6EF9B
; ���������������������������������������������������������������������������

loc_6EF66:				; CODE XREF: sub_6B9C0+35E0j
		cmp	[bp+var_172], 1
		jge	short loc_6EF73
		mov	[bp+var_172], 1

loc_6EF73:				; CODE XREF: sub_6B9C0+35ABj
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_18C], ax
		dec	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_18C]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6EF9B:				; CODE XREF: sub_6B9C0+35A4j
		cmp	[bp+var_17E], 5
		jl	short loc_6EF66
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_178+1], 0
		jz	short loc_6EFD7
		cmp	[bp+var_17C], 0
		jz	short loc_6EFD7
		push	0
		mov	al, byte ptr [bp+var_178]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6EFD7:				; CODE XREF: sub_6B9C0+35F4j
					; sub_6B9C0+35FCj
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		jmp	loc_6F426
; ���������������������������������������������������������������������������

loc_6EFF1:				; CODE XREF: sub_6B9C0+33CEj
		mov	[bp+var_8], 56h	; 'V'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6F1E2
; ���������������������������������������������������������������������������

loc_6F011:				; CODE XREF: sub_6B9C0+383Cj
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_176], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_176]
		mov	[bx+1Bh], ax
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_6F051
		jmp	loc_6F0D2
; ���������������������������������������������������������������������������

loc_6F051:				; CODE XREF: sub_6B9C0+368Cj
		mov	ax, [bp+var_C]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6F0D2
		cmp	[bp+var_C66], 0
		jz	short loc_6F08E
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F08E:				; CODE XREF: sub_6B9C0+36B7j
		mov	ax, word_48EC2
		mov	[bp+var_178], ax
		mov	word ptr [bp+var_17C+2], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6F0D2
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_17C+2]
		push	[bp+var_178]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F0D2:				; CODE XREF: sub_6B9C0+368Ej
					; sub_6B9C0+36B0j ...
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_6F0DE
		jmp	loc_6F186
; ���������������������������������������������������������������������������

loc_6F0DE:				; CODE XREF: sub_6B9C0+3719j
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_6F186
		cmp	[bp+var_C74], 0
		jz	short loc_6F142
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F142:				; CODE XREF: sub_6B9C0+376Bj
		mov	ax, word_48ECE
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6F186
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F186:				; CODE XREF: sub_6B9C0+371Bj
					; sub_6B9C0+3764j ...
		jmp	short loc_6F1D5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6F1D5
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6F1FF
; ���������������������������������������������������������������������������

loc_6F1D5:				; CODE XREF: sub_6B9C0:loc_6F186j
					; sub_6B9C0+37CFj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6F1E2:				; CODE XREF: sub_6B9C0+364Ej
		cmp	[bp+var_C95], di
		jnb	short loc_6F1EF
		cmp	[bp+var_C93], 0
		jz	short loc_6F1F4

loc_6F1EF:				; CODE XREF: sub_6B9C0+3826j
		mov	ax, 1
		jmp	short loc_6F1F6
; ���������������������������������������������������������������������������

loc_6F1F4:				; CODE XREF: sub_6B9C0+382Dj
		xor	ax, ax

loc_6F1F6:				; CODE XREF: sub_6B9C0+3832j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F1FF
		jmp	loc_6F011
; ���������������������������������������������������������������������������

loc_6F1FF:				; CODE XREF: sub_6B9C0+3813j
					; sub_6B9C0+383Aj
		cmp	byte_495FC, 0
		jz	short loc_6F218
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6F218:				; CODE XREF: sub_6B9C0+3844j
		mov	[bp+var_8], 6Ch	; 'l'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6F409
; ���������������������������������������������������������������������������

loc_6F238:				; CODE XREF: sub_6B9C0+3A63j
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_176], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_176]
		mov	[bx+1Bh], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_6F278
		jmp	loc_6F2F9
; ���������������������������������������������������������������������������

loc_6F278:				; CODE XREF: sub_6B9C0+38B3j
		mov	ax, [bp+var_C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6F2F9
		cmp	[bp+var_C66], 0
		jz	short loc_6F2B5
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F2B5:				; CODE XREF: sub_6B9C0+38DEj
		mov	ax, word_48EC2
		mov	[bp+var_178], ax
		mov	word ptr [bp+var_17C+2], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6F2F9
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_17C+2]
		push	[bp+var_178]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F2F9:				; CODE XREF: sub_6B9C0+38B5j
					; sub_6B9C0+38D7j ...
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_6F305
		jmp	loc_6F3AD
; ���������������������������������������������������������������������������

loc_6F305:				; CODE XREF: sub_6B9C0+3940j
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_6F3AD
		cmp	[bp+var_C74], 0
		jz	short loc_6F369
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F369:				; CODE XREF: sub_6B9C0+3992j
		mov	ax, word_48ECE
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6F3AD
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F3AD:				; CODE XREF: sub_6B9C0+3942j
					; sub_6B9C0+398Bj ...
		jmp	short loc_6F3FC
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6F3FC
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_6F426
; ���������������������������������������������������������������������������

loc_6F3FC:				; CODE XREF: sub_6B9C0:loc_6F3ADj
					; sub_6B9C0+39F6j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6F409:				; CODE XREF: sub_6B9C0+3875j
		cmp	[bp+var_C95], di
		jnb	short loc_6F416
		cmp	[bp+var_C93], 0
		jz	short loc_6F41B

loc_6F416:				; CODE XREF: sub_6B9C0+3A4Dj
		mov	ax, 1
		jmp	short loc_6F41D
; ���������������������������������������������������������������������������

loc_6F41B:				; CODE XREF: sub_6B9C0+3A54j
		xor	ax, ax

loc_6F41D:				; CODE XREF: sub_6B9C0+3A59j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F426
		jmp	loc_6F238
; ���������������������������������������������������������������������������

loc_6F426:				; CODE XREF: sub_6B9C0+362Ej
					; sub_6B9C0+3A3Aj ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6F43F
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6F43F:				; CODE XREF: sub_6B9C0+3A7Aj
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_170], ax
		push	0
		push	0
		lea	ax, [bp+var_5E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_172], ax
		push	0
		push	0FFF1h
		lea	ax, [bp+var_E0]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176+2], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_CC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_178], ax
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_172]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_178]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_112]
		mov	al, [bp+var_110]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_102]
		mov	al, [bp+var_100]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0A7h ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp+var_178]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_176+2]
		mov	word ptr [bx+1Bh], 0
		cmp	[bp+var_E], 0
		jnz	short loc_6F5AA
		jmp	loc_6F841
; ���������������������������������������������������������������������������

loc_6F5AA:				; CODE XREF: sub_6B9C0+3BE5j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_182], 0
		mov	byte ptr [bp+var_17E], 2
		mov	byte ptr [bp+var_17E+1], 0
		mov	[bp+var_17C], 0
		push	2
		lea	ax, [bp+var_182]
		push	ax
		push	5
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_182]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_184], 0
		jmp	short loc_6F63A
; ���������������������������������������������������������������������������

loc_6F603:				; CODE XREF: sub_6B9C0+3C7Fj
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_186], ax
		mov	bx, [bp+var_172]
		mov	ax, [bp+var_186]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_184]

loc_6F63A:				; CODE XREF: sub_6B9C0+3C41j
		cmp	[bp+var_184], 4
		jl	short loc_6F603
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		cmp	[bp+var_F], 0
		jnz	short loc_6F659
		jmp	loc_6F6FD
; ���������������������������������������������������������������������������

loc_6F659:				; CODE XREF: sub_6B9C0+3C94j
		cmp	[bp+var_C66], 0
		jz	short loc_6F675
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F675:				; CODE XREF: sub_6B9C0+3C9Ej
		mov	ax, word_48EC2
		mov	[bp+var_188], ax
		mov	word ptr [bp+var_18C+2], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6F6B9
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_18C+2]
		push	[bp+var_188]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F6B9:				; CODE XREF: sub_6B9C0+3CC7j
		mov	ax, word_48EC4
		mov	word ptr [bp+var_18C], ax
		mov	[bp+var_18E], 0
		cmp	[bp+var_C82], 0
		jz	short loc_6F6FD
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_18E]
		push	word ptr [bp+var_18C]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F6FD:				; CODE XREF: sub_6B9C0+3C96j
					; sub_6B9C0+3D0Bj
		jmp	short loc_6F73F
; ���������������������������������������������������������������������������

loc_6F6FF:				; CODE XREF: sub_6B9C0+3D8Ej
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_192+2], ax
		mov	bx, [bp+var_172]
		mov	ax, word ptr [bp+var_192+2]
		mov	[bx+1Bh], ax
		jmp	short loc_6F732
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6F732
		jmp	short loc_6F750
; ���������������������������������������������������������������������������

loc_6F732:				; CODE XREF: sub_6B9C0+3D65j
					; sub_6B9C0+3D6Ej
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6F73F:				; CODE XREF: sub_6B9C0:loc_6F6FDj
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_6F6FF

loc_6F750:				; CODE XREF: sub_6B9C0+3D70j
		cmp	[bp+var_F], 0
		jz	short loc_6F7D2
		mov	ax, word_48ECE
		mov	word ptr [bp+var_192], ax
		mov	[bp+var_194], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6F79A
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_194]
		push	word ptr [bp+var_192]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F79A:				; CODE XREF: sub_6B9C0+3DA8j
		cmp	[bp+var_C74], 0
		jz	short loc_6F7B6
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F7B6:				; CODE XREF: sub_6B9C0+3DDFj
		cmp	[bp+var_C82], 0
		jz	short loc_6F7D2
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F7D2:				; CODE XREF: sub_6B9C0+3D94j
					; sub_6B9C0+3DFBj
		mov	[bp+var_184], 0
		jmp	short loc_6F7EB
; ���������������������������������������������������������������������������

loc_6F7DA:				; CODE XREF: sub_6B9C0+3E30j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_184]

loc_6F7EB:				; CODE XREF: sub_6B9C0+3E18j
		cmp	[bp+var_184], 4
		jl	short loc_6F7DA
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_17E+1], 0
		jz	short loc_6F827
		cmp	[bp+var_182], 0
		jz	short loc_6F827
		push	0
		mov	al, byte ptr [bp+var_17E]
		push	ax
		lea	ax, [bp+var_182]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6F827:				; CODE XREF: sub_6B9C0+3E44j
					; sub_6B9C0+3E4Cj
		mov	[bp+var_182], 0
		mov	byte ptr [bp+var_17E+1], 0
		mov	[bp+var_17C], 0
		jmp	loc_6FD21
; ���������������������������������������������������������������������������

loc_6F841:				; CODE XREF: sub_6B9C0+3BE7j
		mov	[bp+var_8], 50h	; 'P'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6FA56
; ���������������������������������������������������������������������������

loc_6F861:				; CODE XREF: sub_6B9C0+40B0j
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_17C+2], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_17C+2]
		jz	short loc_6F877
		jmp	loc_6F8F8
; ���������������������������������������������������������������������������

loc_6F877:				; CODE XREF: sub_6B9C0+3EB2j
		mov	ax, [bp+var_C]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_6F8F8
		cmp	[bp+var_C66], 0
		jz	short loc_6F8B4
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F8B4:				; CODE XREF: sub_6B9C0+3EDDj
		mov	ax, word_48EC2
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6F8F8
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F8F8:				; CODE XREF: sub_6B9C0+3EB4j
					; sub_6B9C0+3ED6j ...
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_17C+2]
		jz	short loc_6F904
		jmp	loc_6F9AC
; ���������������������������������������������������������������������������

loc_6F904:				; CODE XREF: sub_6B9C0+3F3Fj
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_6F9AC
		cmp	[bp+var_C74], 0
		jz	short loc_6F968
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6F968:				; CODE XREF: sub_6B9C0+3F91j
		mov	ax, word_48ECE
		mov	word ptr [bp+var_182+2], ax
		mov	word ptr [bp+var_182], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6F9AC
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_182]
		push	word ptr [bp+var_182+2]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6F9AC:				; CODE XREF: sub_6B9C0+3F41j
					; sub_6B9C0+3F8Aj ...
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_17C+2]
		jle	short loc_6F9DD
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_184], ax
		mov	bx, [bp+var_172]
		mov	ax, [bp+var_184]
		mov	[bx+1Bh], ax

loc_6F9DD:				; CODE XREF: sub_6B9C0+3FF5j
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_17C+2]
		jnz	short loc_6F9F1
		mov	bx, [bp+var_172]
		mov	word ptr [bx+1Bh], 0

loc_6F9F1:				; CODE XREF: sub_6B9C0+4026j
		jmp	short loc_6FA49
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6FA49
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	bx, [bp-172h]
		mov	word ptr [bx+1Bh], 0
		jmp	short loc_6FA73
; ���������������������������������������������������������������������������

loc_6FA49:				; CODE XREF: sub_6B9C0:loc_6F9F1j
					; sub_6B9C0+403Aj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6FA56:				; CODE XREF: sub_6B9C0+3E9Ej
		cmp	[bp+var_C95], di
		jnb	short loc_6FA63
		cmp	[bp+var_C93], 0
		jz	short loc_6FA68

loc_6FA63:				; CODE XREF: sub_6B9C0+409Aj
		mov	ax, 1
		jmp	short loc_6FA6A
; ���������������������������������������������������������������������������

loc_6FA68:				; CODE XREF: sub_6B9C0+40A1j
		xor	ax, ax

loc_6FA6A:				; CODE XREF: sub_6B9C0+40A6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6FA73
		jmp	loc_6F861
; ���������������������������������������������������������������������������

loc_6FA73:				; CODE XREF: sub_6B9C0+4087j
					; sub_6B9C0+40AEj
		cmp	byte_495FC, 0
		jz	short loc_6FA8C
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6FA8C:				; CODE XREF: sub_6B9C0+40B8j
		mov	[bp+var_8], 28h	; '('
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_6FD04
; ���������������������������������������������������������������������������

loc_6FAAC:				; CODE XREF: sub_6B9C0+435Ej
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_17C+2], ax
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_17C+2]
		jz	short loc_6FAC2
		jmp	loc_6FB8A
; ���������������������������������������������������������������������������

loc_6FAC2:				; CODE XREF: sub_6B9C0+40FDj
		mov	ax, [bp+var_C]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jnz	short loc_6FAE6
		jmp	loc_6FB8A
; ���������������������������������������������������������������������������

loc_6FAE6:				; CODE XREF: sub_6B9C0+4121j
		cmp	[bp+var_C66], 0
		jz	short loc_6FB02
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6FB02:				; CODE XREF: sub_6B9C0+412Bj
		mov	ax, word_48EC2
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6FB46
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6FB46:				; CODE XREF: sub_6B9C0+4154j
		mov	ax, word_48EC4
		mov	word ptr [bp+var_182+2], ax
		mov	word ptr [bp+var_182], 0
		cmp	[bp+var_C82], 0
		jz	short loc_6FB8A
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_182]
		push	word ptr [bp+var_182+2]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6FB8A:				; CODE XREF: sub_6B9C0+40FFj
					; sub_6B9C0+4123j ...
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_17C+2]
		jz	short loc_6FB96
		jmp	loc_6FC5A
; ���������������������������������������������������������������������������

loc_6FB96:				; CODE XREF: sub_6B9C0+41D1j
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_6FC5A
		cmp	[bp+var_C74], 0
		jz	short loc_6FBFA
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6FBFA:				; CODE XREF: sub_6B9C0+4223j
		cmp	[bp+var_C82], 0
		jz	short loc_6FC16
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6FC16:				; CODE XREF: sub_6B9C0+423Fj
		mov	ax, word_48ECE
		mov	[bp+var_184], ax
		mov	[bp+var_186], 0
		cmp	[bp+var_C66], 0
		jz	short loc_6FC5A
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_186]
		push	[bp+var_184]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6FC5A:				; CODE XREF: sub_6B9C0+41D3j
					; sub_6B9C0+421Cj ...
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_17C+2]
		jle	short loc_6FC8B
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_188], ax
		mov	bx, [bp+var_172]
		mov	ax, [bp+var_188]
		mov	[bx+1Bh], ax

loc_6FC8B:				; CODE XREF: sub_6B9C0+42A3j
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_17C+2]
		jnz	short loc_6FC9F
		mov	bx, [bp+var_172]
		mov	word ptr [bx+1Bh], 0

loc_6FC9F:				; CODE XREF: sub_6B9C0+42D4j
		jmp	short loc_6FCF7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6FCF7
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	bx, [bp-172h]
		mov	word ptr [bx+1Bh], 0
		jmp	short loc_6FD21
; ���������������������������������������������������������������������������

loc_6FCF7:				; CODE XREF: sub_6B9C0:loc_6FC9Fj
					; sub_6B9C0+42E8j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6FD04:				; CODE XREF: sub_6B9C0+40E9j
		cmp	[bp+var_C95], di
		jnb	short loc_6FD11
		cmp	[bp+var_C93], 0
		jz	short loc_6FD16

loc_6FD11:				; CODE XREF: sub_6B9C0+4348j
		mov	ax, 1
		jmp	short loc_6FD18
; ���������������������������������������������������������������������������

loc_6FD16:				; CODE XREF: sub_6B9C0+434Fj
		xor	ax, ax

loc_6FD18:				; CODE XREF: sub_6B9C0+4354j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6FD21
		jmp	loc_6FAAC
; ���������������������������������������������������������������������������

loc_6FD21:				; CODE XREF: sub_6B9C0+3E7Ej
					; sub_6B9C0+4335j ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_6FD3A
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_6FD3A:				; CODE XREF: sub_6B9C0+4375j
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_68]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp+var_170], ax
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_142]
		mov	al, [bp+var_140]
		push	ax
		lea	ax, [bp+var_142]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_F2]
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_172], 0
		cmp	[bp+var_E], 0
		jnz	short loc_6FDE0
		jmp	loc_70151
; ���������������������������������������������������������������������������

loc_6FDE0:				; CODE XREF: sub_6B9C0+441Bj
		mov	[bp+var_172], 4
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178], 2
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		push	6
		lea	ax, [bp+var_3AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_17C]
		push	ax
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_17E], 0
		jmp	short loc_6FE7A
; ���������������������������������������������������������������������������

loc_6FE3F:				; CODE XREF: sub_6B9C0+44BFj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_182+2], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_6FE7A:				; CODE XREF: sub_6B9C0+447Dj
		cmp	[bp+var_17E], 4
		jl	short loc_6FE3F
		push	0FFFFh
		lea	ax, [bp+var_C58]
		push	ax
		call	sub_83FE
		add	sp, 4
		cmp	[bp+var_F], 0
		jnz	short loc_6FE99
		jmp	loc_6FF6A
; ���������������������������������������������������������������������������

loc_6FE99:				; CODE XREF: sub_6B9C0+44D4j
		cmp	[bp+var_C66], 0
		jz	short loc_6FEB5
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6FEB5:				; CODE XREF: sub_6B9C0+44DEj
		mov	ax, word_48EC2
		mov	word ptr [bp+var_182], ax
		mov	[bp+var_184], 0
		cmp	[bp+var_C74], 0
		jz	short loc_6FEF9
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_184]
		push	word ptr [bp+var_182]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6FEF9:				; CODE XREF: sub_6B9C0+4507j
		mov	ax, word_48EC4
		mov	[bp+var_186], ax
		mov	[bp+var_188], 0
		cmp	[bp+var_C82], 0
		jz	short loc_6FF3D
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_188]
		push	[bp+var_186]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6FF3D:				; CODE XREF: sub_6B9C0+454Bj
		mov	ax, word_48EC2
		add	ax, 1Eh
		mov	word ptr [bp+var_18C+2], ax
		cmp	[bp+var_C82], 0
		jz	short loc_6FF6A
		push	1388h
		push	word ptr [bp+var_18C+2]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_6FF6A:				; CODE XREF: sub_6B9C0+44D6j
					; sub_6B9C0+458Cj
		jmp	loc_6FFF3
; ���������������������������������������������������������������������������

loc_6FF6D:				; CODE XREF: sub_6B9C0+4644j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_18C], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_18C]
		mov	[bx+1Bh], ax
		jmp	short loc_6FFE6
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_6FFE6
		mov	word ptr [bp-0CBEh], 11BCh
		mov	word ptr [bp-0CBEh], 11C8h
		mov	word ptr [bp-0CBEh], 11D8h
		mov	word ptr [bp-0CBEh], 11E8h
		mov	word ptr [bp-0CBEh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CBEh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_70007
; ���������������������������������������������������������������������������

loc_6FFE6:				; CODE XREF: sub_6B9C0+45D7j
					; sub_6B9C0+45E0j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6FFF3:				; CODE XREF: sub_6B9C0:loc_6FF6Aj
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_70007
		jmp	loc_6FF6D
; ���������������������������������������������������������������������������

loc_70007:				; CODE XREF: sub_6B9C0+4624j
					; sub_6B9C0+4642j
		cmp	[bp+var_F], 0
		jnz	short loc_70010
		jmp	loc_700B0
; ���������������������������������������������������������������������������

loc_70010:				; CODE XREF: sub_6B9C0+464Bj
		cmp	[bp+var_C74], 0
		jz	short loc_7002C
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_7002C:				; CODE XREF: sub_6B9C0+4655j
		cmp	[bp+var_C82], 0
		jz	short loc_70048
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_70048:				; CODE XREF: sub_6B9C0+4671j
		mov	ax, word_48EC2
		add	ax, 28h	; '('
		mov	[bp+var_18E], ax
		mov	word ptr [bp+var_192+2], 0
		cmp	[bp+var_C66], 0
		jz	short loc_7008F
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_192+2]
		push	[bp+var_18E]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7008F:				; CODE XREF: sub_6B9C0+469Dj
		cmp	[bp+var_C66], 0
		jz	short loc_700B0
		push	3E8h
		push	0
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_700B0:				; CODE XREF: sub_6B9C0+464Dj
					; sub_6B9C0+46D4j
		mov	[bp+var_172], 6
		mov	[bp+var_17E], 0
		jmp	short loc_700FB
; ���������������������������������������������������������������������������

loc_700BE:				; CODE XREF: sub_6B9C0+4740j
		cmp	[bp+var_172], 1
		jge	short loc_700CB
		mov	[bp+var_172], 1

loc_700CB:				; CODE XREF: sub_6B9C0+4703j
		test	[bp+var_17E], 1
		jz	short loc_700EA
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_192], ax
		dec	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_192]
		mov	[bx+1Bh], ax

loc_700EA:				; CODE XREF: sub_6B9C0+4711j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_17E]

loc_700FB:				; CODE XREF: sub_6B9C0+46FCj
		cmp	[bp+var_17E], 20h ; ' '
		jl	short loc_700BE
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_178+1], 0
		jz	short loc_70137
		cmp	[bp+var_17C], 0
		jz	short loc_70137
		push	0
		mov	al, byte ptr [bp+var_178]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70137:				; CODE XREF: sub_6B9C0+4754j
					; sub_6B9C0+475Cj
		mov	[bp+var_17C], 0
		mov	byte ptr [bp+var_178+1], 0
		mov	[bp+var_176], 0
		jmp	loc_70A95
; ���������������������������������������������������������������������������

loc_70151:				; CODE XREF: sub_6B9C0+441Dj
		push	0A7h ; '�'
		push	[bp+var_230]
		mov	bx, [bp+var_230]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_8], 50h	; 'P'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_70420
; ���������������������������������������������������������������������������

loc_70184:				; CODE XREF: sub_6B9C0+4A7Aj
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_701AE
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_176], ax
		inc	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_176]
		mov	[bx+1Bh], ax

loc_701AE:				; CODE XREF: sub_6B9C0+47D5j
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_701BC
		jmp	loc_70287
; ���������������������������������������������������������������������������

loc_701BC:				; CODE XREF: sub_6B9C0+47F7j
		mov	ax, [bp+var_C]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jnz	short loc_701E0
		jmp	loc_70287
; ���������������������������������������������������������������������������

loc_701E0:				; CODE XREF: sub_6B9C0+481Bj
		cmp	[bp+var_C66], 0
		jz	short loc_701FC
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_701FC:				; CODE XREF: sub_6B9C0+4825j
		mov	ax, word_48EC2
		mov	[bp+var_178], ax
		mov	word ptr [bp+var_17C+2], 0
		cmp	[bp+var_C74], 0
		jz	short loc_70240
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_17C+2]
		push	[bp+var_178]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70240:				; CODE XREF: sub_6B9C0+484Ej
		mov	ax, word_48EC4
		add	ax, 0Ah
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C82], 0
		jz	short loc_70287
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70287:				; CODE XREF: sub_6B9C0+47F9j
					; sub_6B9C0+481Dj ...
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_176+2]
		jge	short loc_702C5
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_702C5
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_182+2], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax

loc_702C5:				; CODE XREF: sub_6B9C0+48CEj
					; sub_6B9C0+48D9j
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_176+2]
		jg	short loc_702F4
		cmp	[bp+var_172], 1
		jge	short loc_702DD
		mov	[bp+var_172], 1

loc_702DD:				; CODE XREF: sub_6B9C0+4915j
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_182], ax
		dec	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182]
		mov	[bx+1Bh], ax

loc_702F4:				; CODE XREF: sub_6B9C0+490Ej
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_70300
		jmp	loc_703C4
; ���������������������������������������������������������������������������

loc_70300:				; CODE XREF: sub_6B9C0+493Bj
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_703C4
		cmp	[bp+var_C74], 0
		jz	short loc_70364
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_70364:				; CODE XREF: sub_6B9C0+498Dj
		cmp	[bp+var_C82], 0
		jz	short loc_70380
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_70380:				; CODE XREF: sub_6B9C0+49A9j
		mov	ax, word_48ECE
		mov	[bp+var_184], ax
		mov	[bp+var_186], 0
		cmp	[bp+var_C66], 0
		jz	short loc_703C4
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_186]
		push	[bp+var_184]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_703C4:				; CODE XREF: sub_6B9C0+493Dj
					; sub_6B9C0+4986j ...
		jmp	short loc_70413
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_70413
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7043D
; ���������������������������������������������������������������������������

loc_70413:				; CODE XREF: sub_6B9C0:loc_703C4j
					; sub_6B9C0+4A0Dj
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_70420:				; CODE XREF: sub_6B9C0+47C1j
		cmp	[bp+var_C95], di
		jnb	short loc_7042D
		cmp	[bp+var_C93], 0
		jz	short loc_70432

loc_7042D:				; CODE XREF: sub_6B9C0+4A64j
		mov	ax, 1
		jmp	short loc_70434
; ���������������������������������������������������������������������������

loc_70432:				; CODE XREF: sub_6B9C0+4A6Bj
		xor	ax, ax

loc_70434:				; CODE XREF: sub_6B9C0+4A70j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7043D
		jmp	loc_70184
; ���������������������������������������������������������������������������

loc_7043D:				; CODE XREF: sub_6B9C0+4A51j
					; sub_6B9C0+4A78j
		cmp	byte_495FC, 0
		jz	short loc_70456
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_70456:				; CODE XREF: sub_6B9C0+4A82j
		mov	[bp+var_172], 0
		mov	[bp+var_8], 5Ch	; '\'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_70718
; ���������������������������������������������������������������������������

loc_7047C:				; CODE XREF: sub_6B9C0+4D72j
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_704A6
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_176], ax
		inc	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_176]
		mov	[bx+1Bh], ax

loc_704A6:				; CODE XREF: sub_6B9C0+4ACDj
		mov	ax, si
		add	ax, 5
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_704B4
		jmp	loc_7057F
; ���������������������������������������������������������������������������

loc_704B4:				; CODE XREF: sub_6B9C0+4AEFj
		mov	ax, [bp+var_C]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jnz	short loc_704D8
		jmp	loc_7057F
; ���������������������������������������������������������������������������

loc_704D8:				; CODE XREF: sub_6B9C0+4B13j
		cmp	[bp+var_C66], 0
		jz	short loc_704F4
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_704F4:				; CODE XREF: sub_6B9C0+4B1Dj
		mov	ax, word_48EC2
		mov	[bp+var_178], ax
		mov	word ptr [bp+var_17C+2], 0
		cmp	[bp+var_C74], 0
		jz	short loc_70538
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_17C+2]
		push	[bp+var_178]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70538:				; CODE XREF: sub_6B9C0+4B46j
		mov	ax, word_48EC4
		add	ax, 14h
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C82], 0
		jz	short loc_7057F
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7057F:				; CODE XREF: sub_6B9C0+4AF1j
					; sub_6B9C0+4B15j ...
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_176+2]
		jge	short loc_705BD
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_705BD
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_182+2], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax

loc_705BD:				; CODE XREF: sub_6B9C0+4BC6j
					; sub_6B9C0+4BD1j
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_176+2]
		jg	short loc_705EC
		cmp	[bp+var_172], 1
		jge	short loc_705D5
		mov	[bp+var_172], 1

loc_705D5:				; CODE XREF: sub_6B9C0+4C0Dj
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_182], ax
		dec	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182]
		mov	[bx+1Bh], ax

loc_705EC:				; CODE XREF: sub_6B9C0+4C06j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_705F8
		jmp	loc_706BC
; ���������������������������������������������������������������������������

loc_705F8:				; CODE XREF: sub_6B9C0+4C33j
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jz	short loc_706BC
		cmp	[bp+var_C74], 0
		jz	short loc_7065C
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_7065C:				; CODE XREF: sub_6B9C0+4C85j
		cmp	[bp+var_C82], 0
		jz	short loc_70678
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_70678:				; CODE XREF: sub_6B9C0+4CA1j
		mov	ax, word_48ECE
		mov	[bp+var_184], ax
		mov	[bp+var_186], 0
		cmp	[bp+var_C66], 0
		jz	short loc_706BC
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_186]
		push	[bp+var_184]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_706BC:				; CODE XREF: sub_6B9C0+4C35j
					; sub_6B9C0+4C7Ej ...
		jmp	short loc_7070B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7070B
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_70735
; ���������������������������������������������������������������������������

loc_7070B:				; CODE XREF: sub_6B9C0:loc_706BCj
					; sub_6B9C0+4D05j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_70718:				; CODE XREF: sub_6B9C0+4AB9j
		cmp	[bp+var_C95], di
		jnb	short loc_70725
		cmp	[bp+var_C93], 0
		jz	short loc_7072A

loc_70725:				; CODE XREF: sub_6B9C0+4D5Cj
		mov	ax, 1
		jmp	short loc_7072C
; ���������������������������������������������������������������������������

loc_7072A:				; CODE XREF: sub_6B9C0+4D63j
		xor	ax, ax

loc_7072C:				; CODE XREF: sub_6B9C0+4D68j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_70735
		jmp	loc_7047C
; ���������������������������������������������������������������������������

loc_70735:				; CODE XREF: sub_6B9C0+4D49j
					; sub_6B9C0+4D70j
		cmp	byte_495FC, 0
		jz	short loc_7074E
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_7074E:				; CODE XREF: sub_6B9C0+4D7Aj
		mov	[bp+var_172], 0
		mov	[bp+var_8], 6Eh	; 'n'
		mov	si, [bp+var_C95]
		mov	ax, [bp+var_8]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_70A78
; ���������������������������������������������������������������������������

loc_70774:				; CODE XREF: sub_6B9C0+50D2j
		mov	ax, [bp+var_C95]
		mov	word ptr [bp+var_176+2], ax
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_7079E
		mov	ax, [bp+var_172]
		mov	word ptr [bp+var_176], ax
		inc	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_176]
		mov	[bx+1Bh], ax

loc_7079E:				; CODE XREF: sub_6B9C0+4DC5j
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_707AC
		jmp	loc_70877
; ���������������������������������������������������������������������������

loc_707AC:				; CODE XREF: sub_6B9C0+4DE7j
		mov	ax, [bp+var_C]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_244]
		push	ax
		call	sub_C8F5
		add	sp, 4
		cmp	[bp+var_F], 0
		jnz	short loc_707D0
		jmp	loc_70877
; ���������������������������������������������������������������������������

loc_707D0:				; CODE XREF: sub_6B9C0+4E0Bj
		cmp	[bp+var_C66], 0
		jz	short loc_707EC
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_707EC:				; CODE XREF: sub_6B9C0+4E15j
		mov	ax, word_48EC2
		mov	[bp+var_178], ax
		mov	word ptr [bp+var_17C+2], 0
		cmp	[bp+var_C74], 0
		jz	short loc_70830
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_17C+2]
		push	[bp+var_178]
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70830:				; CODE XREF: sub_6B9C0+4E3Ej
		mov	ax, word_48EC4
		add	ax, 1Eh
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C82], 0
		jz	short loc_70877
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70877:				; CODE XREF: sub_6B9C0+4DE9j
					; sub_6B9C0+4E0Dj ...
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_176+2]
		jge	short loc_708B5
		mov	ax, di
		add	ax, 0FFDCh
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_708B5
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_182+2], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax

loc_708B5:				; CODE XREF: sub_6B9C0+4EBEj
					; sub_6B9C0+4EC9j
		mov	ax, di
		add	ax, 0FFDCh
		cmp	ax, word ptr [bp+var_176+2]
		jge	short loc_708F4
		mov	ax, di
		add	ax, 0FFF0h
		cmp	ax, word ptr [bp+var_176+2]
		jle	short loc_708F4
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 7
		mov	word ptr [bp+var_182], ax
		mov	bx, [bp+var_170]
		mov	ax, word ptr [bp+var_182]
		mov	[bx+1Bh], ax

loc_708F4:				; CODE XREF: sub_6B9C0+4EFEj
					; sub_6B9C0+4F09j
		mov	ax, di
		add	ax, 0FFF0h
		cmp	ax, word ptr [bp+var_176+2]
		jg	short loc_70923
		cmp	[bp+var_172], 1
		jge	short loc_7090C
		mov	[bp+var_172], 1

loc_7090C:				; CODE XREF: sub_6B9C0+4F44j
		mov	ax, [bp+var_172]
		mov	[bp+var_184], ax
		dec	[bp+var_172]
		mov	bx, [bp+var_170]
		mov	ax, [bp+var_184]
		mov	[bx+1Bh], ax

loc_70923:				; CODE XREF: sub_6B9C0+4F3Dj
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, word ptr [bp+var_176+2]
		jz	short loc_70931
		jmp	loc_70A1C
; ���������������������������������������������������������������������������

loc_70931:				; CODE XREF: sub_6B9C0+4F6Cj
		mov	[bp+var_CBE], 11BCh
		mov	[bp+var_CBE], 11C8h
		mov	[bp+var_CBE], 11D8h
		mov	[bp+var_CBE], 11E8h
		mov	[bp+var_CBE], 11FCh
		lea	ax, [bp+var_242]
		push	ax
		push	0
		push	[bp+var_225]
		push	[bp+var_227]
		push	[bp+var_229]
		push	[bp+var_22B]
		lea	ax, [bp+var_CBE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		cmp	[bp+var_F], 0
		jnz	short loc_7097C
		jmp	loc_70A1C
; ���������������������������������������������������������������������������

loc_7097C:				; CODE XREF: sub_6B9C0+4FB7j
		cmp	[bp+var_C74], 0
		jz	short loc_70998
		push	[bp+var_C72]
		mov	bx, [bp+var_C74]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_70998:				; CODE XREF: sub_6B9C0+4FC1j
		cmp	[bp+var_C82], 0
		jz	short loc_709B4
		push	[bp+var_C80]
		mov	bx, [bp+var_C82]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_709B4:				; CODE XREF: sub_6B9C0+4FDDj
		mov	ax, word_48EC2
		add	ax, 28h	; '('
		mov	[bp+var_186], ax
		mov	[bp+var_188], 0
		cmp	[bp+var_C66], 0
		jz	short loc_709FB
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_188]
		push	[bp+var_186]
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_709FB:				; CODE XREF: sub_6B9C0+5009j
		cmp	[bp+var_C66], 0
		jz	short loc_70A1C
		push	3E8h
		push	0
		push	[bp+var_C64]
		mov	bx, [bp+var_C66]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70A1C:				; CODE XREF: sub_6B9C0+4F6Ej
					; sub_6B9C0+4FB9j ...
		jmp	short loc_70A6B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_70A6B
		mov	word ptr [bp-0CCAh], 11BCh
		mov	word ptr [bp-0CCAh], 11C8h
		mov	word ptr [bp-0CCAh], 11D8h
		mov	word ptr [bp-0CCAh], 11E8h
		mov	word ptr [bp-0CCAh], 11FCh
		lea	ax, [bp-242h]
		push	ax
		push	0
		push	word ptr [bp-225h]
		push	word ptr [bp-227h]
		push	word ptr [bp-229h]
		push	word ptr [bp-22Bh]
		lea	ax, [bp-0CCAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_70A95
; ���������������������������������������������������������������������������

loc_70A6B:				; CODE XREF: sub_6B9C0:loc_70A1Cj
					; sub_6B9C0+5065j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_70A78:				; CODE XREF: sub_6B9C0+4DB1j
		cmp	[bp+var_C95], di
		jnb	short loc_70A85
		cmp	[bp+var_C93], 0
		jz	short loc_70A8A

loc_70A85:				; CODE XREF: sub_6B9C0+50BCj
		mov	ax, 1
		jmp	short loc_70A8C
; ���������������������������������������������������������������������������

loc_70A8A:				; CODE XREF: sub_6B9C0+50C3j
		xor	ax, ax

loc_70A8C:				; CODE XREF: sub_6B9C0+50C8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_70A95
		jmp	loc_70774
; ���������������������������������������������������������������������������

loc_70A95:				; CODE XREF: sub_6B9C0+478Ej
					; sub_6B9C0+50A9j ...
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_70AAE
		jmp	loc_70D3F
; ���������������������������������������������������������������������������

loc_70AAE:				; CODE XREF: sub_6B9C0+50E9j
		lea	ax, [bp+var_1FC]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_54]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_170], ax
		push	0
		push	0FFF1h
		lea	ax, [bp+var_E0]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_172], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_CC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176+2], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_D6]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176], ax
		push	[bp+var_170]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_172]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176+2]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_CB2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_112]
		mov	al, [bp+var_110]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_102]
		mov	al, [bp+var_100]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	bx, word ptr [bp+var_176+2]
		mov	word ptr [bx+1Bh], 1
		mov	bx, word ptr [bp+var_176]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_70BDC
; ���������������������������������������������������������������������������

loc_70BCF:				; CODE XREF: sub_6B9C0+5235j
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_70BDC:				; CODE XREF: sub_6B9C0+520Dj
		cmp	[bp+var_C95], 4
		jnb	short loc_70BEA
		cmp	[bp+var_C93], 0
		jz	short loc_70BEF

loc_70BEA:				; CODE XREF: sub_6B9C0+5221j
		mov	ax, 1
		jmp	short loc_70BF1
; ���������������������������������������������������������������������������

loc_70BEF:				; CODE XREF: sub_6B9C0+5228j
		xor	ax, ax

loc_70BF1:				; CODE XREF: sub_6B9C0+522Dj
		mov	ah, 0
		or	ax, ax
		jz	short loc_70BCF
		mov	[bp+var_178], 0
		jmp	short loc_70C2D
; ���������������������������������������������������������������������������

loc_70BFF:				; CODE XREF: sub_6B9C0+5286j
		cmp	[bp+var_178], 2
		jnb	short loc_70C1C
		mov	ax, [bp+var_178]
		add	ax, 2
		mov	word ptr [bp+var_17C+2], ax
		mov	bx, word ptr [bp+var_176]
		mov	ax, word ptr [bp+var_17C+2]
		mov	[bx+1Bh], ax

loc_70C1C:				; CODE XREF: sub_6B9C0+5244j
		inc	[bp+var_178]
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_70C2D:				; CODE XREF: sub_6B9C0+523Dj
		cmp	[bp+var_C95], 0Bh
		jnb	short loc_70C3B
		cmp	[bp+var_C93], 0
		jz	short loc_70C40

loc_70C3B:				; CODE XREF: sub_6B9C0+5272j
		mov	ax, 1
		jmp	short loc_70C42
; ���������������������������������������������������������������������������

loc_70C40:				; CODE XREF: sub_6B9C0+5279j
		xor	ax, ax

loc_70C42:				; CODE XREF: sub_6B9C0+527Ej
		mov	ah, 0
		or	ax, ax
		jz	short loc_70BFF
		mov	[bp+var_178], 0
		jmp	loc_70CFB
; ���������������������������������������������������������������������������

loc_70C51:				; CODE XREF: sub_6B9C0+5356j
		cmp	[bp+var_178], 6
		jbe	short loc_70C5E
		mov	[bp+var_178], 6

loc_70C5E:				; CODE XREF: sub_6B9C0+5296j
		cmp	[bp+var_178], 5
		jnz	short loc_70CA9
		mov	ax, word_48EF4
		mov	word ptr [bp+var_17C], ax
		mov	[bp+var_17E], 0
		cmp	[bp+var_C90], 0
		jz	short loc_70CA9
		push	[bp+var_C8E]
		mov	bx, [bp+var_C90]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_17E]
		push	word ptr [bp+var_17C]
		push	[bp+var_C8E]
		mov	bx, [bp+var_C90]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70CA9:				; CODE XREF: sub_6B9C0+52A3j
					; sub_6B9C0+52B7j
		mov	ax, [bp+var_178]
		mov	word ptr [bp+var_182+2], ax
		inc	[bp+var_178]
		mov	bx, [bp+var_172]
		mov	ax, word ptr [bp+var_182+2]
		mov	[bx+1Bh], ax
		cmp	[bp+var_178], 0Ah
		jnz	short loc_70CEE
		cmp	[bp+var_D], 0
		jz	short loc_70CEE
		cmp	[bp+var_432], 0
		jz	short loc_70CEE
		push	7D0h
		push	0
		push	[bp+var_430]
		mov	bx, [bp+var_432]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_70CEE:				; CODE XREF: sub_6B9C0+5305j
					; sub_6B9C0+530Bj ...
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_70CFB:				; CODE XREF: sub_6B9C0+528Ej
		cmp	[bp+var_C95], 14h
		jnb	short loc_70D09
		cmp	[bp+var_C93], 0
		jz	short loc_70D0E

loc_70D09:				; CODE XREF: sub_6B9C0+5340j
		mov	ax, 1
		jmp	short loc_70D10
; ���������������������������������������������������������������������������

loc_70D0E:				; CODE XREF: sub_6B9C0+5347j
		xor	ax, ax

loc_70D10:				; CODE XREF: sub_6B9C0+534Cj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_70D19
		jmp	loc_70C51
; ���������������������������������������������������������������������������

loc_70D19:				; CODE XREF: sub_6B9C0+5354j
		push	0
		lea	ax, [bp+var_CB2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah

loc_70D3F:				; CODE XREF: sub_6B9C0+10A1j
					; sub_6B9C0+14B4j ...
		lea	ax, [bp+var_C90]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C87], 0
		jz	short loc_70D74
		cmp	[bp+var_C8C], 0
		jz	short loc_70D74
		push	0
		mov	al, [bp+var_C88]
		push	ax
		lea	ax, [bp+var_C8C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70D74:				; CODE XREF: sub_6B9C0+5391j
					; sub_6B9C0+5399j
		mov	[bp+var_C8C], 0
		mov	[bp+var_C87], 0
		mov	[bp+var_C86], 0
		lea	ax, [bp+var_C82]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C79], 0
		jz	short loc_70DC0
		cmp	[bp+var_C7E], 0
		jz	short loc_70DC0
		push	0
		mov	al, [bp+var_C7A]
		push	ax
		lea	ax, [bp+var_C7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70DC0:				; CODE XREF: sub_6B9C0+53DDj
					; sub_6B9C0+53E5j
		mov	[bp+var_C7E], 0
		mov	[bp+var_C79], 0
		mov	[bp+var_C78], 0
		lea	ax, [bp+var_C74]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C6B], 0
		jz	short loc_70E0C
		cmp	[bp+var_C70], 0
		jz	short loc_70E0C
		push	0
		mov	al, [bp+var_C6C]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70E0C:				; CODE XREF: sub_6B9C0+5429j
					; sub_6B9C0+5431j
		mov	[bp+var_C70], 0
		mov	[bp+var_C6B], 0
		mov	[bp+var_C6A], 0
		lea	ax, [bp+var_C66]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C5D], 0
		jz	short loc_70E58
		cmp	[bp+var_C62], 0
		jz	short loc_70E58
		push	0
		mov	al, [bp+var_C5E]
		push	ax
		lea	ax, [bp+var_C62]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70E58:				; CODE XREF: sub_6B9C0+5475j
					; sub_6B9C0+547Dj
		mov	[bp+var_C62], 0
		mov	[bp+var_C5D], 0
		mov	[bp+var_C5C], 0
		cmp	[bp+var_165], 0
		jz	short loc_70E97
		cmp	[bp+var_16A], 0
		jz	short loc_70E97
		push	0
		mov	al, [bp+var_166]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70E97:				; CODE XREF: sub_6B9C0+54B4j
					; sub_6B9C0+54BCj
		mov	[bp+var_16A], 0
		mov	[bp+var_165], 0
		mov	[bp+var_164], 0
		cmp	[bp+var_15B], 0
		jz	short loc_70ED6
		cmp	[bp+var_160], 0
		jz	short loc_70ED6
		push	0
		mov	al, [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70ED6:				; CODE XREF: sub_6B9C0+54F3j
					; sub_6B9C0+54FBj
		mov	[bp+var_160], 0
		mov	[bp+var_15B], 0
		mov	[bp+var_15A], 0
		cmp	[bp+var_151], 0
		jz	short loc_70F15
		cmp	[bp+var_156], 0
		jz	short loc_70F15
		push	0
		mov	al, [bp+var_152]
		push	ax
		lea	ax, [bp+var_156]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70F15:				; CODE XREF: sub_6B9C0+5532j
					; sub_6B9C0+553Aj
		mov	[bp+var_156], 0
		mov	[bp+var_151], 0
		mov	[bp+var_150], 0
		cmp	[bp+var_147], 0
		jz	short loc_70F54
		cmp	[bp+var_14C], 0
		jz	short loc_70F54
		push	0
		mov	al, [bp+var_148]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70F54:				; CODE XREF: sub_6B9C0+5571j
					; sub_6B9C0+5579j
		mov	[bp+var_14C], 0
		mov	[bp+var_147], 0
		mov	[bp+var_146], 0
		push	2
		lea	ax, [bp+var_142]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_137], 0
		jz	short loc_70FA2
		cmp	[bp+var_13C], 0
		jz	short loc_70FA2
		push	0
		mov	al, [bp+var_138]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70FA2:				; CODE XREF: sub_6B9C0+55BFj
					; sub_6B9C0+55C7j
		mov	[bp+var_13C], 0
		mov	[bp+var_137], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, [bp+var_132]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_127], 0
		jz	short loc_70FF0
		cmp	[bp+var_12C], 0
		jz	short loc_70FF0
		push	0
		mov	al, [bp+var_128]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_70FF0:				; CODE XREF: sub_6B9C0+560Dj
					; sub_6B9C0+5615j
		mov	[bp+var_12C], 0
		mov	[bp+var_127], 0
		mov	[bp+var_126], 0
		push	2
		lea	ax, [bp+var_122]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_117], 0
		jz	short loc_7103E
		cmp	[bp+var_11C], 0
		jz	short loc_7103E
		push	0
		mov	al, [bp+var_118]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7103E:				; CODE XREF: sub_6B9C0+565Bj
					; sub_6B9C0+5663j
		mov	[bp+var_11C], 0
		mov	[bp+var_117], 0
		mov	[bp+var_116], 0
		push	2
		lea	ax, [bp+var_112]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_107], 0
		jz	short loc_7108C
		cmp	[bp+var_10C], 0
		jz	short loc_7108C
		push	0
		mov	al, [bp+var_108]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7108C:				; CODE XREF: sub_6B9C0+56A9j
					; sub_6B9C0+56B1j
		mov	[bp+var_10C], 0
		mov	[bp+var_107], 0
		mov	[bp+var_106], 0
		push	2
		lea	ax, [bp+var_102]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F7], 0
		jz	short loc_710DA
		cmp	[bp+var_FC], 0
		jz	short loc_710DA
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_710DA:				; CODE XREF: sub_6B9C0+56F7j
					; sub_6B9C0+56FFj
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E7], 0
		jz	short loc_71128
		cmp	[bp+var_EC], 0
		jz	short loc_71128
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71128:				; CODE XREF: sub_6B9C0+5745j
					; sub_6B9C0+574Dj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DB], 0
		jz	short loc_71167
		cmp	[bp+var_E0], 0
		jz	short loc_71167
		push	0
		mov	al, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71167:				; CODE XREF: sub_6B9C0+5784j
					; sub_6B9C0+578Cj
		mov	[bp+var_E0], 0
		mov	[bp+var_DB], 0
		mov	[bp+var_DA], 0
		cmp	[bp+var_D1], 0
		jz	short loc_711A6
		cmp	[bp+var_D6], 0
		jz	short loc_711A6
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_711A6:				; CODE XREF: sub_6B9C0+57C3j
					; sub_6B9C0+57CBj
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		cmp	[bp+var_C7], 0
		jz	short loc_711E5
		cmp	[bp+var_CC], 0
		jz	short loc_711E5
		push	0
		mov	al, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_711E5:				; CODE XREF: sub_6B9C0+5802j
					; sub_6B9C0+580Aj
		mov	[bp+var_CC], 0
		mov	[bp+var_C7], 0
		mov	[bp+var_C6], 0
		cmp	[bp+var_BD], 0
		jz	short loc_71224
		cmp	[bp+var_C2], 0
		jz	short loc_71224
		push	0
		mov	al, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_C2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71224:				; CODE XREF: sub_6B9C0+5841j
					; sub_6B9C0+5849j
		mov	[bp+var_C2], 0
		mov	[bp+var_BD], 0
		mov	[bp+var_BC], 0
		cmp	[bp+var_B3], 0
		jz	short loc_71263
		cmp	[bp+var_B8], 0
		jz	short loc_71263
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71263:				; CODE XREF: sub_6B9C0+5880j
					; sub_6B9C0+5888j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_712A2
		cmp	[bp+var_AE], 0
		jz	short loc_712A2
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_712A2:				; CODE XREF: sub_6B9C0+58BFj
					; sub_6B9C0+58C7j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		cmp	[bp+var_9F], 0
		jz	short loc_712E1
		cmp	[bp+var_A4], 0
		jz	short loc_712E1
		push	0
		mov	al, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_712E1:				; CODE XREF: sub_6B9C0+58FEj
					; sub_6B9C0+5906j
		mov	[bp+var_A4], 0
		mov	[bp+var_9F], 0
		mov	[bp+var_9E], 0
		cmp	[bp+var_95], 0
		jz	short loc_71320
		cmp	[bp+var_9A], 0
		jz	short loc_71320
		push	0
		mov	al, [bp+var_96]
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71320:				; CODE XREF: sub_6B9C0+593Dj
					; sub_6B9C0+5945j
		mov	[bp+var_9A], 0
		mov	[bp+var_95], 0
		mov	[bp+var_94], 0
		cmp	[bp+var_8B], 0
		jz	short loc_7135F
		cmp	[bp+var_90], 0
		jz	short loc_7135F
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7135F:				; CODE XREF: sub_6B9C0+597Cj
					; sub_6B9C0+5984j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		cmp	[bp+var_81], 0
		jz	short loc_7139E
		cmp	[bp+var_86], 0
		jz	short loc_7139E
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7139E:				; CODE XREF: sub_6B9C0+59BBj
					; sub_6B9C0+59C3j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		cmp	[bp+var_77], 0
		jz	short loc_713D8
		cmp	[bp+var_7C], 0
		jz	short loc_713D8
		push	0
		mov	al, [bp+var_78]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_713D8:				; CODE XREF: sub_6B9C0+59F8j
					; sub_6B9C0+59FFj
		mov	[bp+var_7C], 0
		mov	[bp+var_77], 0
		mov	[bp+var_76], 0
		cmp	[bp+var_6D], 0
		jz	short loc_71410
		cmp	[bp+var_72], 0
		jz	short loc_71410
		push	0
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71410:				; CODE XREF: sub_6B9C0+5A30j
					; sub_6B9C0+5A37j
		mov	[bp+var_72], 0
		mov	[bp+var_6D], 0
		mov	[bp+var_6C], 0
		cmp	[bp+var_63], 0
		jz	short loc_71448
		cmp	[bp+var_68], 0
		jz	short loc_71448
		push	0
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71448:				; CODE XREF: sub_6B9C0+5A68j
					; sub_6B9C0+5A6Fj
		mov	[bp+var_68], 0
		mov	[bp+var_63], 0
		mov	[bp+var_62], 0
		cmp	[bp+var_59], 0
		jz	short loc_71480
		cmp	[bp+var_5E], 0
		jz	short loc_71480
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71480:				; CODE XREF: sub_6B9C0+5AA0j
					; sub_6B9C0+5AA7j
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		cmp	[bp+var_4F], 0
		jz	short loc_714B8
		cmp	[bp+var_54], 0
		jz	short loc_714B8
		push	0
		mov	al, [bp+var_50]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_714B8:				; CODE XREF: sub_6B9C0+5AD8j
					; sub_6B9C0+5ADFj
		mov	[bp+var_54], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		mov	[bp+var_C58], 185Fh
		lea	ax, [bp+var_C58]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_C43], 0
		jz	short loc_71507
		cmp	[bp+var_C48], 0
		jz	short loc_71507
		push	0
		mov	al, [bp+var_C44]
		push	ax
		lea	ax, [bp+var_C48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71507:				; CODE XREF: sub_6B9C0+5B24j
					; sub_6B9C0+5B2Cj
		mov	[bp+var_C48], 0
		mov	[bp+var_C43], 0
		mov	[bp+var_C42], 0
		lea	ax, [bp+var_432]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_429], 0
		jz	short loc_71553
		cmp	[bp+var_42E], 0
		jz	short loc_71553
		push	0
		mov	al, [bp+var_42A]
		push	ax
		lea	ax, [bp+var_42E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_71553:				; CODE XREF: sub_6B9C0+5B70j
					; sub_6B9C0+5B78j
		mov	[bp+var_42E], 0
		mov	[bp+var_429], 0
		mov	[bp+var_428], 0
		push	2
		lea	ax, [bp+var_424]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_43], 0
		jz	short loc_7159D
		cmp	[bp+var_48], 0
		jz	short loc_7159D
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7159D:				; CODE XREF: sub_6B9C0+5BBDj
					; sub_6B9C0+5BC4j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_334]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2BC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_242]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_222]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_25], 0
		jz	short loc_7161E
		cmp	[bp+var_2A], 0
		jz	short loc_7161E
		push	0
		mov	al, [bp+var_26]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7161E:				; CODE XREF: sub_6B9C0+5C3Ej
					; sub_6B9C0+5C45j
		mov	[bp+var_2A], 0
		mov	[bp+var_25], 0
		mov	[bp+var_24], 0
		push	0
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_16]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_20A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1FC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6B9C0	endp

ovr198		ends
