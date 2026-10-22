ovr196		segment	para public 'OVERLAY' use16
		assume cs:ovr196
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 10 112 lignes, LUE 2026-10-17 ligne à ligne. Première moitié de la cinématique mid1
; (scènes 1 à 8 de analysis/MIDGAME_SYSTEM.md § 9), appelée depuis le menu principal sub_3D2E
; (cas 0 et 5). Ouvre midgames\mid1.pak, midgames\midgames.pak, midgames\mid1voc.pak (si
; word_4684B non nul et si le fichier existe : voix numérisée), gameflow\optshps.pak et
; optpals.pak, fonts\convfont.shp. Son selon byte_46848 : 1 = Roland (rsoundfx.pak,
; rmusic.pak, midgames.iff FORM VOLU chunk MT32), 2 = AdLib (asoundfx.pak, amusic.pak, VOLU
; chunk ADLB) ; VOLU = 107 mots, rôle non établi. midgames.iff FORM MG01 : DATA puis TEXT (4
; titres, puis 3 textes chargés mais non affichés) ; sans voix, FORM SPOK : 8 TEXT (sous-
; titres, 0 à 6 utilisés). Scène 1 : 10 im/s, musique, fondu d'apparition (seul fondu de
; mid1), animation mid1 3 après 20 images, son aux images 20 et 35 ; la scène est gardée et
; passée à 20 im/s pour la scène 3. Scène 2 : 4 titres MG01 hors moteur de scène. Scène 3 :
; montée de calques mobiles imbriqués, puis animation 13. Scènes 4 et 7 : composition de 15
; calques avec trajectoire (table de 41 positions), suite d'images (41 valeurs), rebond,
; cycles et oscillation. Scène 5 : plan tremblant. Scène 6 : animation 22 (le code teste les
; images 1, 12, 18 sans rien faire). Scène 8 : dialogue (réplique 0 ou sous-titre SPOK 0).
; Termine par Midgame1_PlayPart2_671C0 (via sub_423E0) avec 38 arguments (ressources,
; palettes, canaux). Échap (byte_495FC) : libération et sortie après la scène en cours.
; ==============================================================================================
Midgame1_PlayPart1_5FCF0	proc far		; CODE XREF: sub_423B5J

var_EEC		= word ptr -0EECh
var_E9A		= word ptr -0E9Ah
var_E98		= word ptr -0E98h
var_E7C		= word ptr -0E7Ch
var_E4C		= word ptr -0E4Ch
var_E1F		= dword	ptr -0E1Fh
var_E1B		= dword	ptr -0E1Bh
var_E17		= dword	ptr -0E17h
var_E0A		= word ptr -0E0Ah
var_E06		= dword	ptr -0E06h
var_DFF		= word ptr -0DFFh
var_DFD		= word ptr -0DFDh
var_DFB		= word ptr -0DFBh
var_DF9		= word ptr -0DF9h
var_DF6		= word ptr -0DF6h
var_DF4		= word ptr -0DF4h
var_DE2		= word ptr -0DE2h
var_DE0		= word ptr -0DE0h
var_DDE		= dword	ptr -0DDEh
var_DDA		= byte ptr -0DDAh
var_DD9		= word ptr -0DD9h
var_DD7		= word ptr -0DD7h
var_DD4		= word ptr -0DD4h
var_DD2		= word ptr -0DD2h
var_DD0		= dword	ptr -0DD0h
var_DCC		= byte ptr -0DCCh
var_DCB		= byte ptr -0DCBh
var_DCA		= dword	ptr -0DCAh
var_DC6		= word ptr -0DC6h
var_DC4		= word ptr -0DC4h
var_DB6		= dword	ptr -0DB6h
var_DB2		= byte ptr -0DB2h
var_DB1		= byte ptr -0DB1h
var_DB0		= dword	ptr -0DB0h
var_5A9		= dword	ptr -5A9h
var_5A5		= dword	ptr -5A5h
var_5A0		= word ptr -5A0h
var_59E		= word ptr -59Eh
var_59C		= dword	ptr -59Ch
var_598		= byte ptr -598h
var_597		= byte ptr -597h
var_596		= dword	ptr -596h
var_592		= word ptr -592h
var_588		= word ptr -588h
var_57E		= word ptr -57Eh
var_556		= word ptr -556h
var_4DE		= word ptr -4DEh
var_466		= word ptr -466h
var_3EE		= word ptr -3EEh
var_3EC		= word ptr -3ECh
var_3D4		= word ptr -3D4h
var_3BC		= word ptr -3BCh
var_3AC		= word ptr -3ACh
var_3AA		= word ptr -3AAh
var_3A8		= word ptr -3A8h
var_3A5		= dword	ptr -3A5h
var_3A1		= word ptr -3A1h
var_39F		= word ptr -39Fh
var_39C		= word ptr -39Ch
var_324		= word ptr -324h
var_2AC		= word ptr -2ACh
var_234		= word ptr -234h
var_1E4		= word ptr -1E4h
var_1E2		= word ptr -1E2h
var_1E0		= word ptr -1E0h
var_1DE		= word ptr -1DEh
var_1DC		= word ptr -1DCh
var_1DA		= word ptr -1DAh
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1C8		= word ptr -1C8h
var_1C6		= dword	ptr -1C6h
var_1C2		= dword	ptr -1C2h
var_1BC		= dword	ptr -1BCh
var_1B8		= dword	ptr -1B8h
var_1B4		= dword	ptr -1B4h
var_1AE		= byte ptr -1AEh
var_1AD		= byte ptr -1ADh
var_1AC		= dword	ptr -1ACh
var_1A8		= dword	ptr -1A8h
var_1A4		= word ptr -1A4h
var_1A2		= dword	ptr -1A2h
var_19E		= word ptr -19Eh
var_19C		= dword	ptr -19Ch
var_198		= word ptr -198h
var_196		= dword	ptr -196h
var_192		= word ptr -192h
var_190		= dword	ptr -190h
var_18C		= word ptr -18Ch
var_18A		= word ptr -18Ah
var_188		= word ptr -188h
var_186		= word ptr -186h
var_184		= word ptr -184h
var_181		= byte ptr -181h
var_180		= word ptr -180h
var_17E		= word ptr -17Eh
var_17C		= word ptr -17Ch
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= dword	ptr -176h
var_172		= dword	ptr -172h
var_16E		= dword	ptr -16Eh
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= word ptr -154h
var_152		= dword	ptr -152h
var_14E		= word ptr -14Eh
var_14C		= byte ptr -14Ch
var_14B		= word ptr -14Bh
var_148		= dword	ptr -148h
var_144		= byte ptr -144h
var_143		= byte ptr -143h
var_142		= dword	ptr -142h
var_13E		= word ptr -13Eh
var_13C		= byte ptr -13Ch
var_13B		= word ptr -13Bh
var_138		= dword	ptr -138h
var_134		= byte ptr -134h
var_133		= byte ptr -133h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= byte ptr -12Ah
var_129		= byte ptr -129h
var_128		= dword	ptr -128h
var_124		= word ptr -124h
var_122		= byte ptr -122h
var_121		= word ptr -121h
var_11E		= dword	ptr -11Eh
var_11A		= byte ptr -11Ah
var_119		= byte ptr -119h
var_118		= dword	ptr -118h
var_114		= word ptr -114h
var_112		= byte ptr -112h
var_111		= word ptr -111h
var_10E		= dword	ptr -10Eh
var_10A		= byte ptr -10Ah
var_109		= byte ptr -109h
var_108		= dword	ptr -108h
var_104		= word ptr -104h
var_102		= byte ptr -102h
var_101		= word ptr -101h
var_FE		= dword	ptr -0FEh
var_FA		= byte ptr -0FAh
var_F9		= byte ptr -0F9h
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= byte ptr -0F0h
var_EF		= byte ptr -0EFh
var_EE		= dword	ptr -0EEh
var_EA		= word ptr -0EAh
var_E8		= byte ptr -0E8h
var_E7		= word ptr -0E7h
var_E4		= dword	ptr -0E4h
var_E0		= byte ptr -0E0h
var_DF		= byte ptr -0DFh
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= byte ptr -0D6h
var_D5		= byte ptr -0D5h
var_D4		= dword	ptr -0D4h
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
var_B2		= word ptr -0B2h
var_B0		= byte ptr -0B0h
var_AE		= dword	ptr -0AEh
var_AA		= byte ptr -0AAh
var_A9		= byte ptr -0A9h
var_A8		= dword	ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= byte ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= byte ptr -9Ah
var_99		= word ptr -99h
var_96		= word ptr -96h
var_93		= word ptr -93h
var_90		= word ptr -90h
var_8E		= byte ptr -8Eh
var_8D		= word ptr -8Dh
var_8A		= word ptr -8Ah
var_88		= byte ptr -88h
var_87		= word ptr -87h
var_84		= word ptr -84h
var_82		= byte ptr -82h
var_81		= word ptr -81h
var_7E		= dword	ptr -7Eh
var_7A		= byte ptr -7Ah
var_79		= byte ptr -79h
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= byte ptr -70h
var_6F		= byte ptr -6Fh
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_26		= word ptr -26h
var_22		= word ptr -22h
var_1F		= byte ptr -1Fh
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0EECh
		push	si
		push	di
		mov	[bp+var_2], 0
		push	12Ch
		push	8
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_6], 0
		push	3Ch ; '<'
		push	4
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_A], 0
		push	3Ch ; '<'
		push	3
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_E], 0FFFBh
		mov	[bp+var_10], 0
		mov	[bp+var_12], 6
		mov	[bp+var_14], 0
		mov	[bp+var_16], 0FFF9h
		mov	[bp+var_18], 0
		mov	[bp+var_1A], 7
		mov	[bp+var_1C], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1F], 0
		cmp	word_4684B, 0
		jz	short loc_5FD78
		mov	[bp+var_1D], 1

loc_5FD78:				; CODE XREF: Midgame1_PlayPart1_5FCF0+82j
		mov	ax, word_46F46
		mov	[bp+var_22], ax
		mov	[bp+var_1D6], 0
		mov	[bp+var_1D4], 0
		push	[bp+var_22]
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_1E4], 0
		mov	[bp+var_1E2], 0
		mov	[bp+var_1E0], 0
		mov	[bp+var_1DE], 0
		mov	[bp+var_1DC], 13Fh
		mov	[bp+var_1DA], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	[bp+var_1D2], 0
		mov	[bp+var_1D0], 18h
		mov	[bp+var_1CE], 13Fh
		mov	[bp+var_1CC], 97h ; '�'
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid1_0	; "mid1"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_0 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid1voc	; "mid1voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_1D], 0
		jz	short loc_5FEA6
		push	ds
		lea	ax, [bp+var_234]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_5FEA6
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		mov	bx, [bp+var_39C]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_5FEAA
; ���������������������������������������������������������������������������

loc_5FEA6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+18Aj
					; Midgame1_PlayPart1_5FCF0+19Cj
		mov	[bp+var_1D], 0

loc_5FEAA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1B4j
		push	100h
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_36]
		push	ax
		push	1Bh
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_3BC], 1DADh
		mov	[bp+var_3A5], 0
		mov	[bp+var_3AC], 3
		mov	[bp+var_3AA], 0
		mov	[bp+var_3A8], 7
		push	ds
		push	offset unk_44D31
		push	ds
		push	offset aConvfont_shp_0 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_234]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_44+2],	dx
		mov	word ptr [bp+var_44], ax
		mov	eax, [bp+var_44]
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 3
		mov	[bp+var_3B], 1
		mov	[bp+var_3A], 0
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		lea	ax, [bp+var_3BC]
		push	ax
		push	word_46F44
		lea	ax, [bp+var_3EE]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_4C], 0
		mov	[bp+var_4A], 98h ; '�'
		mov	[bp+var_48], 13Fh
		mov	[bp+var_46], 0C7h ; '�'
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	3
		lea	ax, [bp+var_56]
		push	ax
		push	13h
		lea	ax, [bp+var_324]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_60], 0
		mov	[bp+var_5C], 2
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	3
		lea	ax, [bp+var_60]
		push	ax
		push	14h
		lea	ax, [bp+var_324]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_6A], 0
		mov	[bp+var_66], 2
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	3
		lea	ax, [bp+var_6A]
		push	ax
		push	15h
		lea	ax, [bp+var_324]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_74], 0
		mov	[bp+var_70], 2
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		mov	[bp+var_7E], 0
		mov	[bp+var_7A], 2
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_1 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_1 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	3
		lea	ax, [bp+var_74]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_466]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	3
		lea	ax, [bp+var_7E]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp+var_466]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_84], 0
		mov	[bp+var_81], 0
		mov	[bp+var_8A], 0
		mov	[bp+var_87], 0
		mov	[bp+var_90], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_96], 0
		mov	[bp+var_93], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_99], 0
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	2
		lea	ax, [bp+var_158]
		push	ax
		push	15h
		lea	ax, [bp+var_4DE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_164+2],	0
		mov	byte ptr [bp+var_15E], 2
		mov	byte ptr [bp+var_15E+1], 0
		mov	[bp+var_15C], 0
		push	2
		lea	ax, [bp+var_164+2]
		push	ax
		push	18h
		lea	ax, [bp+var_4DE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_164+2]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_16E+2],	0
		mov	byte ptr [bp+var_168], 2
		mov	byte ptr [bp+var_168+1], 0
		mov	[bp+var_168+2],	0
		push	2
		lea	ax, [bp+var_16E+2]
		push	ax
		push	16h
		lea	ax, [bp+var_324]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_16E+2]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_176], 0
		mov	byte ptr [bp+var_172], 2
		mov	byte ptr [bp+var_172+1], 0
		mov	[bp+var_172+2],	0
		push	2
		lea	ax, [bp+var_176]
		push	ax
		push	3Bh ; ';'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_176]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		cmp	byte ptr [bp+var_172+1], 0
		jz	short loc_6024A
		cmp	[bp+var_176], 0
		jz	short loc_6024A
		push	0
		mov	al, byte ptr [bp+var_172]
		push	ax
		lea	ax, [bp+var_176]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6024A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+537j
					; Midgame1_PlayPart1_5FCF0+53Fj
		mov	[bp+var_176], 0
		mov	byte ptr [bp+var_172+1], 0
		mov	[bp+var_172+2],	0
		cmp	byte ptr [bp+var_168+1], 0
		jz	short loc_60289
		cmp	[bp+var_16E+2],	0
		jz	short loc_60289
		push	0
		mov	al, byte ptr [bp+var_168]
		push	ax
		lea	ax, [bp+var_16E+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_60289:				; CODE XREF: Midgame1_PlayPart1_5FCF0+576j
					; Midgame1_PlayPart1_5FCF0+57Ej
		mov	[bp+var_16E+2],	0
		mov	byte ptr [bp+var_168+1], 0
		mov	[bp+var_168+2],	0
		cmp	byte ptr [bp+var_15E+1], 0
		jz	short loc_602C8
		cmp	[bp+var_164+2],	0
		jz	short loc_602C8
		push	0
		mov	al, byte ptr [bp+var_15E]
		push	ax
		lea	ax, [bp+var_164+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_602C8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5B5j
					; Midgame1_PlayPart1_5FCF0+5BDj
		mov	[bp+var_164+2],	0
		mov	byte ptr [bp+var_15E+1], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_60307
		cmp	[bp+var_158], 0
		jz	short loc_60307
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_60307:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5F4j
					; Midgame1_PlayPart1_5FCF0+5FCj
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		push	2
		lea	ax, [bp+var_158]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_60385
		cmp	[bp+var_158], 0
		jz	short loc_60385
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_60385:				; CODE XREF: Midgame1_PlayPart1_5FCF0+672j
					; Midgame1_PlayPart1_5FCF0+67Aj
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		mov	al, byte_46848
		mov	[bp+var_9E], al
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_603BC
		jmp	loc_60603
; ���������������������������������������������������������������������������

loc_603BC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6C7j
		mov	al, [bp+var_9E]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_603D2
		cmp	ax, 2
		jnz	short loc_603CF
		jmp	loc_604EB
; ���������������������������������������������������������������������������

loc_603CF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6DAj
		jmp	loc_60603
; ���������������������������������������������������������������������������

loc_603D2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6D5j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_556]
		push	ax
		mov	bx, [bp+var_556]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_1 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_E7C]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_E7C], 556h
		mov	[bp+var_E1B], 100h
		mov	[bp+var_E1F], 0
		mov	[bp+var_E7C], 56Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_E7C]
		push	ax
		mov	bx, [bp+var_E7C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_604B0
; ���������������������������������������������������������������������������

loc_6049A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7C3j
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_604B0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7A8j
		cmp	si, 6Ah	; 'j'
		jle	short loc_6049A
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_1F], 1
		mov	[bp+var_E7C], 56Eh
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_E7C]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	loc_60603
; ���������������������������������������������������������������������������

loc_604EB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6DCj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_556]
		push	ax
		mov	bx, [bp+var_556]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_2 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_E7C]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_E7C], 556h
		mov	[bp+var_E1B], 100h
		mov	[bp+var_E1F], 0
		mov	[bp+var_E7C], 56Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_E7C]
		push	ax
		mov	bx, [bp+var_E7C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_605C9
; ���������������������������������������������������������������������������

loc_605B3:				; CODE XREF: Midgame1_PlayPart1_5FCF0+8DCj
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_605C9:				; CODE XREF: Midgame1_PlayPart1_5FCF0+8C1j
		cmp	si, 6Ah	; 'j'
		jle	short loc_605B3
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_1F], 1
		mov	[bp+var_E7C], 56Eh
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_E7C]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	short $+2

loc_60603:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6C9j
					; Midgame1_PlayPart1_5FCF0:loc_603CFj	...
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, word_44AFC
		mov	[bp+var_A4], ax
		mov	ax, word_44AFE
		mov	[bp+var_A2], ax
		mov	ax, word_44B00
		mov	[bp+var_A0], ax
		cmp	[bp+var_1F], 0
		jnz	short loc_6063A
		jmp	loc_60717
; ���������������������������������������������������������������������������

loc_6063A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+945j
		mov	[bp+var_DDE], 0
		mov	[bp+var_DDA], 2
		mov	byte ptr [bp+var_DD9], 0
		mov	dword ptr [bp+var_DD9+1], 0
		mov	[bp+var_DE2], 0
		mov	[bp+var_DE0], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_DE2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	si, si
		jmp	short loc_606C6
; ���������������������������������������������������������������������������

loc_60677:				; CODE XREF: Midgame1_PlayPart1_5FCF0+9D9j
		push	3
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_592]
		add	ax, dx
		push	ax
		mov	al, byte ptr [bp+si+var_A4]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_556]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_592]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_DE2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_DE2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		inc	si

loc_606C6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+985j
		cmp	si, 6
		jl	short loc_60677
		lea	ax, [bp+var_DE2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_DD9], 0
		jz	short loc_60700
		cmp	[bp+var_DDE], 0
		jz	short loc_60700
		push	0
		mov	al, [bp+var_DDA]
		push	ax
		lea	ax, [bp+var_DDE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_60700:				; CODE XREF: Midgame1_PlayPart1_5FCF0+9EDj
					; Midgame1_PlayPart1_5FCF0+9F5j
		mov	[bp+var_DDE], 0
		mov	byte ptr [bp+var_DD9], 0
		mov	dword ptr [bp+var_DD9+1], 0

loc_60717:				; CODE XREF: Midgame1_PlayPart1_5FCF0+947j
		mov	[bp+var_AE], 0
		mov	[bp+var_AA], 2
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		mov	[bp+var_59C], 0
		mov	[bp+var_598], 2
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		mov	[bp+var_5A0], 0
		mov	[bp+var_59E], 0FFFFh
		mov	al, [bp+var_9E]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_6076D
		cmp	ax, 2
		jz	short loc_6078C
		jmp	short loc_607AB
; ���������������������������������������������������������������������������

loc_6076D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+A74j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_1E], 1
		jmp	short loc_607AB
; ���������������������������������������������������������������������������

loc_6078C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+A79j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_1E], 1
		jmp	short $+2

loc_607AB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+A7Bj
					; Midgame1_PlayPart1_5FCF0+A9Aj
		cmp	[bp+var_1E], 0
		jz	short loc_6080F
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_E4C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	3
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		lea	ax, [bp+var_E4C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_5A0]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_5A0]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_E4C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_6080F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+ABFj
		mov	[bp+var_DC6], 185Fh
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB2], 2
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		mov	[bp+var_DC4], 0
		mov	[bp+var_DC6], 186Fh
		xor	eax, eax
		mov	[bp+var_5A9], eax
		mov	[bp+var_5A5], eax
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCC], 2
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DD4], 0
		mov	[bp+var_DD2], 0FFFFh
		cmp	[bp+var_1F], 0
		jz	short loc_60889
		push	word_46849
		lea	ax, [bp+var_DD4]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4

loc_60889:				; CODE XREF: Midgame1_PlayPart1_5FCF0+B86j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_3 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_E7C]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_E7C], 556h
		mov	[bp+var_E1B], 100h
		mov	[bp+var_E1F], 0
		mov	[bp+var_E7C], 56Eh
		push	1
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_E7C]
		push	ax
		mov	bx, [bp+var_E7C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3130474Dh
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	si, si
		jmp	short loc_60964
; ���������������������������������������������������������������������������

loc_60911:				; CODE XREF: Midgame1_PlayPart1_5FCF0+C77j
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	di, [bp+var_E0A]
		cmp	di, 3Ch	; '<'
		jle	short loc_6093A
		push	1D3Dh
		call	Fatal_Error_310B
		add	sp, 2

loc_6093A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+C3Dj
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	si
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_E06]
		mov	[bp+var_E17], eax
		inc	si

loc_60964:				; CODE XREF: Midgame1_PlayPart1_5FCF0+C1Fj
		cmp	si, 4
		jl	short loc_60911
		xor	si, si
		jmp	short loc_609C0
; ���������������������������������������������������������������������������

loc_6096D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+CD3j
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	di, [bp+var_E0A]
		cmp	di, 3Ch	; '<'
		jle	short loc_60996
		push	1D5Eh
		call	Fatal_Error_310B
		add	sp, 2

loc_60996:				; CODE XREF: Midgame1_PlayPart1_5FCF0+C99j
		movsx	eax, di
		push	eax
		push	ds
		mov	ax, [bp+var_C]
		imul	si
		mov	dx, [bp+var_A]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_E06]
		mov	[bp+var_E17], eax
		inc	si

loc_609C0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+C7Bj
		cmp	si, 3
		jl	short loc_6096D
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		cmp	[bp+var_1D], 0
		jz	short loc_609EB
		push	word_4684B
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	short loc_60A65
; ���������������������������������������������������������������������������

loc_609EB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+CE6j
		push	0
		push	large 4B4F5053h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	di, di
		jmp	short loc_60A60
; ���������������������������������������������������������������������������

loc_60A04:				; CODE XREF: Midgame1_PlayPart1_5FCF0+D73j
		push	1
		push	large 54584554h
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_E0A]
		mov	word ptr [bp+var_152+2], ax
		cmp	word ptr [bp+var_152+2], 12Ch
		jle	short loc_60A34
		push	1D7Fh
		call	Fatal_Error_310B
		add	sp, 2

loc_60A34:				; CODE XREF: Midgame1_PlayPart1_5FCF0+D37j
		movsx	eax, word ptr [bp+var_152+2]
		push	eax
		push	ds
		mov	ax, [bp+var_4]
		imul	di
		mov	dx, [bp+var_2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_E06]
		mov	[bp+var_E17], eax
		inc	di

loc_60A60:				; CODE XREF: Midgame1_PlayPart1_5FCF0+D12j
		cmp	di, 8
		jl	short loc_60A04

loc_60A65:				; CODE XREF: Midgame1_PlayPart1_5FCF0+CF9j
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_E7C], 56Eh
		lea	ax, [bp+var_E7C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_E7C]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	byte ptr [bp+var_B2], 0
		mov	byte ptr [bp+var_B2+1],	0
		mov	[bp+var_B0], 0
		push	100h
		push	0
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		push	0
		lea	ax, [bp+var_1D6]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		push	0
		lea	ax, [bp+var_1D6]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		call	Input_Flush_CDDC
		mov	ax, [bp+var_4C]
		mov	word ptr [bp+var_158+2], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_154], ax
		mov	ax, [bp+var_48]
		mov	word ptr [bp+var_152], ax
		mov	ax, [bp+var_46]
		mov	word ptr [bp+var_152+2], ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_158], ax
		lea	ax, [bp+var_3D4]
		push	ax
		push	word ptr [bp+var_158]
		lea	ax, [bp+var_DF6]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_DF6], 1218h
		mov	ax, [bp+var_154]
		mov	word ptr [bp+var_15C+2], ax
		mov	ax, word ptr [bp+var_152]
		mov	word ptr [bp+var_15C], ax
		mov	ax, word ptr [bp+var_152+2]
		mov	[bp+var_15E], ax
		mov	ax, word ptr [bp+var_158+2]
		mov	word ptr [bp+var_DDE+1], ax
		mov	ax, word ptr [bp+var_15C+2]
		mov	word ptr [bp+var_DDE+3], ax
		mov	ax, word ptr [bp+var_15C]
		mov	[bp+var_DD9], ax
		mov	ax, [bp+var_15E]
		mov	[bp+var_DD7], ax
		mov	[bp+var_168], 0
		mov	byte ptr [bp+var_164], 2
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		push	2
		lea	ax, [bp+var_168]
		push	ax
		push	3Ch ; '<'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_172], 0
		mov	byte ptr [bp+var_16E], 2
		mov	byte ptr [bp+var_16E+1], 0
		mov	[bp+var_16E+2],	0
		push	2
		lea	ax, [bp+var_172]
		push	ax
		push	30h ; '0'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_176+1], 0
		lea	ax, [bp+var_172]
		push	ax
		lea	ax, [bp+var_178]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		cmp	[bp+var_1E], 0
		jz	short loc_60C65
		cmp	[bp+var_5A0], 0
		jz	short loc_60C65
		push	[bp+var_59E]
		mov	bx, [bp+var_5A0]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_60C65:				; CODE XREF: Midgame1_PlayPart1_5FCF0+F57j
					; Midgame1_PlayPart1_5FCF0+F5Ej
		push	[bp+var_84]
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_17C], ax
		or	ax, ax
		jz	short loc_60D1A
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		push	[bp+var_17C]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp+var_17C]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_17C]
		jmp	short loc_60D1E
; ���������������������������������������������������������������������������

loc_60D1A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+FEBj
		mov	ax, [bp+var_17C]

loc_60D1E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1028j
		mov	[bp+var_17A], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_180], ax
		or	ax, ax
		jz	short loc_60D71
		push	0
		push	0
		lea	ax, [bp+var_60]
		push	ax
		push	[bp+var_180]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp+var_180]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_180]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_180]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_180]
		jmp	short loc_60D75
; ���������������������������������������������������������������������������

loc_60D71:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1042j
		mov	ax, [bp+var_180]

loc_60D75:				; CODE XREF: Midgame1_PlayPart1_5FCF0+107Fj
		mov	[bp+var_17E], ax
		push	[bp+var_17A]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_17E]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_1B4+2],	0
		mov	[bp+var_1AE], 2
		mov	[bp+var_1AD], 0
		mov	[bp+var_1AC], 0
		push	3
		lea	ax, [bp+var_1B4+2]
		push	ax
		push	3
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_1B4+2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	si, ax
		mov	[bp+var_1BC], 0
		mov	byte ptr [bp+var_1B8], 2
		mov	byte ptr [bp+var_1B8+1], 0
		mov	[bp+var_1B8+2],	0
		cmp	[bp+var_1D], 0
		jz	short loc_60E2E
		push	2
		lea	ax, [bp+var_1BC]
		push	ax
		push	7
		lea	ax, [bp+var_39C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1BC]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_7D11
		add	sp, 4
		jmp	short loc_60E55
; ���������������������������������������������������������������������������

loc_60E2E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1112j
		cmp	[bp+var_1F], 0
		jz	short loc_60E55
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		lea	ax, [bp+var_592]
		push	ax
		lea	ax, [bp+var_DD4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_60E55:				; CODE XREF: Midgame1_PlayPart1_5FCF0+113Cj
					; Midgame1_PlayPart1_5FCF0+1142j
		jmp	short loc_60E64
; ���������������������������������������������������������������������������

loc_60E57:				; CODE XREF: Midgame1_PlayPart1_5FCF0+118Dj
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_60E64:				; CODE XREF: Midgame1_PlayPart1_5FCF0:loc_60E55j
		cmp	[bp+var_DFB], 14h
		jnb	short loc_60E72
		cmp	byte ptr [bp+var_DF9], 0
		jz	short loc_60E77

loc_60E72:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1179j
		mov	ax, 1
		jmp	short loc_60E79
; ���������������������������������������������������������������������������

loc_60E77:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1180j
		xor	ax, ax

loc_60E79:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1185j
		mov	ah, 0
		or	ax, ax
		jz	short loc_60E57
		push	si
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_60ECF
		cmp	[bp+var_1D], 0
		jz	short loc_60EAD
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_60ECF
; ���������������������������������������������������������������������������

loc_60EAD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+11AAj
		cmp	[bp+var_1F], 0
		jz	short loc_60ECF
		cmp	[bp+var_DD4], 0
		jz	short loc_60ECF
		push	[bp+var_DD2]
		mov	bx, [bp+var_DD4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_60ECF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+11A4j
					; Midgame1_PlayPart1_5FCF0+11BBj ...
		jmp	short loc_60F1E
; ���������������������������������������������������������������������������

loc_60ED1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+123Bj
		cmp	[bp+var_DFB], 23h ; '#'
		jnz	short loc_60F11
		cmp	[bp+var_1D], 0
		jz	short loc_60EEF
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_60F11
; ���������������������������������������������������������������������������

loc_60EEF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+11ECj
		cmp	[bp+var_1F], 0
		jz	short loc_60F11
		cmp	[bp+var_DD4], 0
		jz	short loc_60F11
		push	[bp+var_DD2]
		mov	bx, [bp+var_DD4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_60F11:				; CODE XREF: Midgame1_PlayPart1_5FCF0+11E6j
					; Midgame1_PlayPart1_5FCF0+11FDj ...
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_60F1E:				; CODE XREF: Midgame1_PlayPart1_5FCF0:loc_60ECFj
		push	si
		call	AnimLayer_IsFinished_2E654
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_60ED1
		push	si
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	si, si
		jz	short loc_60F4B
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_60F4B:				; CODE XREF: Midgame1_PlayPart1_5FCF0+124Dj
		cmp	[bp+var_1D], 0
		jz	short loc_60F5E
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_60F5E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+125Fj
		cmp	byte ptr [bp+var_1B8+1], 0
		jz	short loc_60F86
		cmp	[bp+var_1BC], 0
		jz	short loc_60F86
		push	0
		mov	al, byte ptr [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_1BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_60F86:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1273j
					; Midgame1_PlayPart1_5FCF0+127Bj
		mov	[bp+var_1BC], 0
		mov	byte ptr [bp+var_1B8+1], 0
		mov	[bp+var_1B8+2],	0
		cmp	[bp+var_1AD], 0
		jz	short loc_60FC5
		cmp	[bp+var_1B4+2],	0
		jz	short loc_60FC5
		push	0
		mov	al, [bp+var_1AE]
		push	ax
		lea	ax, [bp+var_1B4+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_60FC5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+12B2j
					; Midgame1_PlayPart1_5FCF0+12BAj
		mov	[bp+var_1B4+2],	0
		mov	[bp+var_1AD], 0
		mov	[bp+var_1AC], 0
		push	14h
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_60FF5
		jmp	loc_6149C
; ���������������������������������������������������������������������������

loc_60FF5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1300j
		push	0
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_178]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_16E+1], 0
		jz	short loc_6103B
		cmp	[bp+var_172], 0
		jz	short loc_6103B
		push	0
		mov	al, byte ptr [bp+var_16E]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6103B:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1328j
					; Midgame1_PlayPart1_5FCF0+1330j
		mov	[bp+var_172], 0
		mov	byte ptr [bp+var_16E+1], 0
		mov	[bp+var_16E+2],	0
		cmp	byte ptr [bp+var_164+1], 0
		jz	short loc_6107A
		cmp	[bp+var_168], 0
		jz	short loc_6107A
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6107A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1367j
					; Midgame1_PlayPart1_5FCF0+136Fj
		mov	[bp+var_168], 0
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		lea	ax, [bp+var_DF4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_610D3
		cmp	[bp+var_DD0], 0
		jz	short loc_610D3
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_610D3:				; CODE XREF: Midgame1_PlayPart1_5FCF0+13C0j
					; Midgame1_PlayPart1_5FCF0+13C8j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_61125
		cmp	[bp+var_DB6], 0
		jz	short loc_61125
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61125:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1412j
					; Midgame1_PlayPart1_5FCF0+141Aj
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_61171
		cmp	[bp+var_59C], 0
		jz	short loc_61171
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61171:				; CODE XREF: Midgame1_PlayPart1_5FCF0+145Ej
					; Midgame1_PlayPart1_5FCF0+1466j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_611B0
		cmp	[bp+var_AE], 0
		jz	short loc_611B0
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_611B0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+149Dj
					; Midgame1_PlayPart1_5FCF0+14A5j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6127C
		cmp	[bp+var_7E], 0
		jz	short loc_6127C
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6127C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+156Cj
					; Midgame1_PlayPart1_5FCF0+1573j
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_612B4
		cmp	[bp+var_74], 0
		jz	short loc_612B4
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_612B4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+15A4j
					; Midgame1_PlayPart1_5FCF0+15ABj
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_612EC
		cmp	[bp+var_6A], 0
		jz	short loc_612EC
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_612EC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+15DCj
					; Midgame1_PlayPart1_5FCF0+15E3j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_61324
		cmp	[bp+var_60], 0
		jz	short loc_61324
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61324:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1614j
					; Midgame1_PlayPart1_5FCF0+161Bj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6135C
		cmp	[bp+var_56], 0
		jz	short loc_6135C
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6135C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+164Cj
					; Midgame1_PlayPart1_5FCF0+1653j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_613B0
		cmp	[bp+var_40], 0
		jz	short loc_613B0
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_613B0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+16A0j
					; Midgame1_PlayPart1_5FCF0+16A7j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_613F7
		cmp	[bp+var_36], 0
		jz	short loc_613F7
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_613F7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+16E7j
					; Midgame1_PlayPart1_5FCF0+16EEj
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6149C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1302j
		call	Input_Flush_CDDC
		mov	[bp+var_181], 0
		push	[bp+var_9C]
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		xor	di, di
		jmp	loc_6219C
; ���������������������������������������������������������������������������

loc_614DA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+24B1j
		push	0FFh
		lea	ax, [bp+var_1AC]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		cmp	byte ptr [bp+var_1AC+1], 1
		jz	short loc_614F4
		jmp	loc_619A0
; ���������������������������������������������������������������������������

loc_614F4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+17FFj
		mov	byte_495FC, 1
		push	0
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_178]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_16E+1], 0
		jz	short loc_6153F
		cmp	[bp+var_172], 0
		jz	short loc_6153F
		push	0
		mov	al, byte ptr [bp+var_16E]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6153F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+182Cj
					; Midgame1_PlayPart1_5FCF0+1834j
		mov	[bp+var_172], 0
		mov	byte ptr [bp+var_16E+1], 0
		mov	[bp+var_16E+2],	0
		cmp	byte ptr [bp+var_164+1], 0
		jz	short loc_6157E
		cmp	[bp+var_168], 0
		jz	short loc_6157E
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6157E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+186Bj
					; Midgame1_PlayPart1_5FCF0+1873j
		mov	[bp+var_168], 0
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		lea	ax, [bp+var_DF4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_615D7
		cmp	[bp+var_DD0], 0
		jz	short loc_615D7
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_615D7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+18C4j
					; Midgame1_PlayPart1_5FCF0+18CCj
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_61629
		cmp	[bp+var_DB6], 0
		jz	short loc_61629
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61629:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1916j
					; Midgame1_PlayPart1_5FCF0+191Ej
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_61675
		cmp	[bp+var_59C], 0
		jz	short loc_61675
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61675:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1962j
					; Midgame1_PlayPart1_5FCF0+196Aj
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_616B4
		cmp	[bp+var_AE], 0
		jz	short loc_616B4
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_616B4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+19A1j
					; Midgame1_PlayPart1_5FCF0+19A9j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_61780
		cmp	[bp+var_7E], 0
		jz	short loc_61780
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61780:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1A70j
					; Midgame1_PlayPart1_5FCF0+1A77j
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_617B8
		cmp	[bp+var_74], 0
		jz	short loc_617B8
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_617B8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1AA8j
					; Midgame1_PlayPart1_5FCF0+1AAFj
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_617F0
		cmp	[bp+var_6A], 0
		jz	short loc_617F0
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_617F0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1AE0j
					; Midgame1_PlayPart1_5FCF0+1AE7j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_61828
		cmp	[bp+var_60], 0
		jz	short loc_61828
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61828:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1B18j
					; Midgame1_PlayPart1_5FCF0+1B1Fj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_61860
		cmp	[bp+var_56], 0
		jz	short loc_61860
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61860:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1B50j
					; Midgame1_PlayPart1_5FCF0+1B57j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_618B4
		cmp	[bp+var_40], 0
		jz	short loc_618B4
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_618B4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1BA4j
					; Midgame1_PlayPart1_5FCF0+1BABj
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_618FB
		cmp	[bp+var_36], 0
		jz	short loc_618FB
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_618FB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1BEBj
					; Midgame1_PlayPart1_5FCF0+1BF2j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_619A0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1801j
		cmp	[bp+var_181], 0
		jz	short loc_619AA
		jmp	loc_621A4
; ���������������������������������������������������������������������������

loc_619AA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1CB5j
		xor	eax, eax
		mov	[bp-1B0h], eax
		mov	[bp+var_1B4], eax
		xor	si, si
		jmp	loc_61AC8
; ���������������������������������������������������������������������������

loc_619BC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1DDDj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_619CD
		mov	[bp+var_181], 1
		jmp	loc_61AD0
; ���������������������������������������������������������������������������

loc_619CD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1CD3j
		mov	dword ptr [bp-1B0h], 3
		mov	eax, dword_47ABB
		mov	[bp+var_1B4], eax
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		push	word ptr [bp+var_168+2]
		push	word ptr [bp+var_168]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 0Ch
		add	ax, bx
		mov	word ptr [bp+var_1B8+2], dx
		mov	word ptr [bp+var_1B8], ax
		mov	eax, [bp+var_1B8]
		mov	[bp+var_3A5], eax
		mov	[bp+var_3A1], 0EFh ; '�'
		mov	[bp+var_39F], 10h
		cmp	di, 1
		jnz	short loc_61A80
		mov	ax, 23h	; '#'
		jmp	short loc_61A83
; ���������������������������������������������������������������������������

loc_61A80:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1D89j
		mov	ax, 32h	; '2'

loc_61A83:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1D8Ej
		mov	[bp+var_1C8], ax
		mov	ax, [bp+var_8]
		imul	di
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		push	[bp+var_1C8]
		push	2
		push	1D99h
		lea	ax, [bp+var_3EE]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_1D6]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		lea	ax, [bp+var_1B4]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2
		inc	si

loc_61AC8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1CC9j
		cmp	si, 10h
		jge	short loc_61AD0
		jmp	loc_619BC
; ���������������������������������������������������������������������������

loc_61AD0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1CDAj
					; Midgame1_PlayPart1_5FCF0+1DDBj
		push	0FFh
		lea	ax, [bp+var_1AC]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		cmp	byte ptr [bp+var_1AC+1], 1
		jz	short loc_61AEA
		jmp	loc_61F96
; ���������������������������������������������������������������������������

loc_61AEA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1DF5j
		mov	byte_495FC, 1
		push	0
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_178]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_16E+1], 0
		jz	short loc_61B35
		cmp	[bp+var_172], 0
		jz	short loc_61B35
		push	0
		mov	al, byte ptr [bp+var_16E]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61B35:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1E22j
					; Midgame1_PlayPart1_5FCF0+1E2Aj
		mov	[bp+var_172], 0
		mov	byte ptr [bp+var_16E+1], 0
		mov	[bp+var_16E+2],	0
		cmp	byte ptr [bp+var_164+1], 0
		jz	short loc_61B74
		cmp	[bp+var_168], 0
		jz	short loc_61B74
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61B74:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1E61j
					; Midgame1_PlayPart1_5FCF0+1E69j
		mov	[bp+var_168], 0
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		lea	ax, [bp+var_DF4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_61BCD
		cmp	[bp+var_DD0], 0
		jz	short loc_61BCD
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61BCD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1EBAj
					; Midgame1_PlayPart1_5FCF0+1EC2j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_61C1F
		cmp	[bp+var_DB6], 0
		jz	short loc_61C1F
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61C1F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1F0Cj
					; Midgame1_PlayPart1_5FCF0+1F14j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_61C6B
		cmp	[bp+var_59C], 0
		jz	short loc_61C6B
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61C6B:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1F58j
					; Midgame1_PlayPart1_5FCF0+1F60j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_61CAA
		cmp	[bp+var_AE], 0
		jz	short loc_61CAA
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61CAA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1F97j
					; Midgame1_PlayPart1_5FCF0+1F9Fj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_61D76
		cmp	[bp+var_7E], 0
		jz	short loc_61D76
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61D76:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2066j
					; Midgame1_PlayPart1_5FCF0+206Dj
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_61DAE
		cmp	[bp+var_74], 0
		jz	short loc_61DAE
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61DAE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+209Ej
					; Midgame1_PlayPart1_5FCF0+20A5j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_61DE6
		cmp	[bp+var_6A], 0
		jz	short loc_61DE6
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61DE6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+20D6j
					; Midgame1_PlayPart1_5FCF0+20DDj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_61E1E
		cmp	[bp+var_60], 0
		jz	short loc_61E1E
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61E1E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+210Ej
					; Midgame1_PlayPart1_5FCF0+2115j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_61E56
		cmp	[bp+var_56], 0
		jz	short loc_61E56
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61E56:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2146j
					; Midgame1_PlayPart1_5FCF0+214Dj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_61EAA
		cmp	[bp+var_40], 0
		jz	short loc_61EAA
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61EAA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+219Aj
					; Midgame1_PlayPart1_5FCF0+21A1j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_61EF1
		cmp	[bp+var_36], 0
		jz	short loc_61EF1
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_61EF1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+21E1j
					; Midgame1_PlayPart1_5FCF0+21E8j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_61F96:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1DF7j
		cmp	[bp+var_181], 0
		jz	short loc_61FA0
		jmp	loc_621A4
; ���������������������������������������������������������������������������

loc_61FA0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+22ABj
		mov	word ptr [bp+var_1BC+2], 64h ; 'd'
		movsx	eax, word ptr [bp+var_1BC+2]
		mov	[bp-1BEh], eax
		mov	eax, [bp-1BEh]
		mov	[bp-1B0h], eax
		mov	eax, dword_47ABB
		mov	[bp+var_1B4], eax
		lea	ax, [bp+var_1B4]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2
		mov	si, 0Fh
		jmp	loc_620E3
; ���������������������������������������������������������������������������

loc_61FD7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+23F8j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_61FE8
		mov	[bp+var_181], 1
		jmp	loc_620EB
; ���������������������������������������������������������������������������

loc_61FE8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+22EEj
		mov	dword ptr [bp-1B0h], 3
		mov	eax, dword_47ABB
		mov	[bp+var_1B4], eax
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		push	word ptr [bp+var_168+2]
		push	word ptr [bp+var_168]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 0Ch
		add	ax, bx
		mov	word ptr [bp+var_1C2+2], dx
		mov	word ptr [bp+var_1C2], ax
		mov	eax, [bp+var_1C2]
		mov	[bp+var_3A5], eax
		mov	[bp+var_3A1], 0EFh ; '�'
		mov	[bp+var_39F], 10h
		cmp	di, 1
		jnz	short loc_6209B
		mov	ax, 23h	; '#'
		jmp	short loc_6209E
; ���������������������������������������������������������������������������

loc_6209B:				; CODE XREF: Midgame1_PlayPart1_5FCF0+23A4j
		mov	ax, 32h	; '2'

loc_6209E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+23A9j
		mov	[bp+var_1C8], ax
		mov	ax, [bp+var_8]
		imul	di
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		push	[bp+var_1C8]
		push	2
		push	1DA0h
		lea	ax, [bp+var_3EE]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		lea	ax, [bp+var_1D6]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		lea	ax, [bp+var_1B4]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2
		dec	si

loc_620E3:				; CODE XREF: Midgame1_PlayPart1_5FCF0+22E4j
		cmp	si, 0FFFFh
		jle	short loc_620EB
		jmp	loc_61FD7
; ���������������������������������������������������������������������������

loc_620EB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+22F5j
					; Midgame1_PlayPart1_5FCF0+23F6j
		cmp	[bp+var_181], 0
		jz	short loc_620F5
		jmp	loc_621A4
; ���������������������������������������������������������������������������

loc_620F5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2400j
		push	0
		push	0
		mov	al, [bp+var_70]
		push	ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		push	word ptr [bp+var_60+2]
		push	word ptr [bp+var_60]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		lea	ax, [bp+var_1D6]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		mov	word ptr [bp+var_1BC+2], 64h ; 'd'
		cmp	di, 1
		jnz	short loc_62170
		mov	word ptr [bp+var_1BC+2], 0FAh ;	'�'

loc_62170:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2478j
		movsx	eax, word ptr [bp+var_1BC+2]
		mov	[bp+var_1C6], eax
		mov	eax, [bp+var_1C6]
		mov	[bp-1B0h], eax
		mov	eax, dword_47ABB
		mov	[bp+var_1B4], eax
		lea	ax, [bp+var_1B4]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2
		inc	di

loc_6219C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+17E7j
		cmp	di, 4
		jge	short loc_621A4
		jmp	loc_614DA
; ���������������������������������������������������������������������������

loc_621A4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+1CB7j
					; Midgame1_PlayPart1_5FCF0+22ADj ...
		cmp	byte_495FC, 0
		jnz	short loc_621AE
		jmp	loc_62655
; ���������������������������������������������������������������������������

loc_621AE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+24B9j
		push	0
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_178]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_16E+1], 0
		jz	short loc_621F4
		cmp	[bp+var_172], 0
		jz	short loc_621F4
		push	0
		mov	al, byte ptr [bp+var_16E]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_621F4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+24E1j
					; Midgame1_PlayPart1_5FCF0+24E9j
		mov	[bp+var_172], 0
		mov	byte ptr [bp+var_16E+1], 0
		mov	[bp+var_16E+2],	0
		cmp	byte ptr [bp+var_164+1], 0
		jz	short loc_62233
		cmp	[bp+var_168], 0
		jz	short loc_62233
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62233:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2520j
					; Midgame1_PlayPart1_5FCF0+2528j
		mov	[bp+var_168], 0
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		lea	ax, [bp+var_DF4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_6228C
		cmp	[bp+var_DD0], 0
		jz	short loc_6228C
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6228C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2579j
					; Midgame1_PlayPart1_5FCF0+2581j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_622DE
		cmp	[bp+var_DB6], 0
		jz	short loc_622DE
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_622DE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+25CBj
					; Midgame1_PlayPart1_5FCF0+25D3j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_6232A
		cmp	[bp+var_59C], 0
		jz	short loc_6232A
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6232A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2617j
					; Midgame1_PlayPart1_5FCF0+261Fj
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_62369
		cmp	[bp+var_AE], 0
		jz	short loc_62369
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62369:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2656j
					; Midgame1_PlayPart1_5FCF0+265Ej
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_62435
		cmp	[bp+var_7E], 0
		jz	short loc_62435
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62435:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2725j
					; Midgame1_PlayPart1_5FCF0+272Cj
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_6246D
		cmp	[bp+var_74], 0
		jz	short loc_6246D
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6246D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+275Dj
					; Midgame1_PlayPart1_5FCF0+2764j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_624A5
		cmp	[bp+var_6A], 0
		jz	short loc_624A5
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_624A5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2795j
					; Midgame1_PlayPart1_5FCF0+279Cj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_624DD
		cmp	[bp+var_60], 0
		jz	short loc_624DD
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_624DD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+27CDj
					; Midgame1_PlayPart1_5FCF0+27D4j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_62515
		cmp	[bp+var_56], 0
		jz	short loc_62515
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62515:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2805j
					; Midgame1_PlayPart1_5FCF0+280Cj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_62569
		cmp	[bp+var_40], 0
		jz	short loc_62569
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62569:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2859j
					; Midgame1_PlayPart1_5FCF0+2860j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_625B0
		cmp	[bp+var_36], 0
		jz	short loc_625B0
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_625B0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+28A0j
					; Midgame1_PlayPart1_5FCF0+28A7j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_62655:				; CODE XREF: Midgame1_PlayPart1_5FCF0+24BBj
		mov	byte ptr [bp+var_DF9], 0
		call	Input_Flush_CDDC
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Fh], 0FFFFh
		push	[bp+var_178]
		mov	al, byte ptr [bp+var_176]
		push	ax
		lea	ax, [bp+var_178]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_186], ax
		or	ax, ax
		jz	short loc_62716
		push	0
		push	96h ; '�'
		push	0
		lea	ax, [bp+var_56]
		push	ax
		push	[bp+var_186]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_186]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_186]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_186]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, [bp+var_186]
		jmp	short loc_6271A
; ���������������������������������������������������������������������������

loc_62716:				; CODE XREF: Midgame1_PlayPart1_5FCF0+29D2j
		mov	ax, [bp+var_186]

loc_6271A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2A24j
		mov	[bp+var_184], ax
		push	[bp+var_184]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18A], ax
		or	ax, ax
		jz	short loc_62792
		push	0
		push	11h
		push	0
		lea	ax, [bp+var_7E]
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
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, [bp+var_18A]
		jmp	short loc_62796
; ���������������������������������������������������������������������������

loc_62792:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2A4Fj
		mov	ax, [bp+var_18A]

loc_62796:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2AA0j
		mov	[bp+var_188], ax
		push	[bp+var_188]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_190+2], ax
		or	ax, ax
		jz	short loc_6280F
		push	1
		push	0C8h ; '�'
		push	0
		lea	ax, [bp+var_56]
		push	ax
		push	word ptr [bp+var_190+2]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_190+2]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_190+2]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_190+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_190+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_190+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_190+2]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, word ptr [bp+var_190+2]
		jmp	short loc_62813
; ���������������������������������������������������������������������������

loc_6280F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2ACBj
		mov	ax, word ptr [bp+var_190+2]

loc_62813:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2B1Dj
		mov	[bp+var_18C], ax
		push	[bp+var_18C]
		push	[bp+var_188]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_192], ax
		or	ax, ax
		jz	short loc_6288A
		push	2
		push	2Bh ; '+'
		push	0
		lea	ax, [bp+var_56]
		push	ax
		push	[bp+var_192]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, [bp+var_192]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_192]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_192]
		mov	word ptr [bx+1Fh], 0FFFFh
		mov	ax, [bp+var_192]
		jmp	short loc_6288E
; ���������������������������������������������������������������������������

loc_6288A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2B47j
		mov	ax, [bp+var_192]

loc_6288E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2B98j
		mov	word ptr [bp+var_190], ax
		push	word ptr [bp+var_190]
		push	[bp+var_18C]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_628B1
; ���������������������������������������������������������������������������

loc_628A4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2BD4j
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_628B1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2BB2j
		push	word ptr [bp+var_190]
		mov	bx, word ptr [bp+var_190]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		cmp	ax, 3Ch	; '<'
		jg	short loc_628A4
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17A]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_184]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_188]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_18C]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_190]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_190]
		mov	word ptr [bx+1Fh], 0
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_19C], 0
		mov	byte ptr [bp+var_198], 2
		mov	byte ptr [bp+var_198+1], 0
		mov	[bp+var_196], 0
		push	2
		lea	ax, [bp+var_19C]
		push	ax
		push	0Dh
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFBAh
		push	0
		lea	ax, [bp+var_19C]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	[bp+var_19E], ax
		push	[bp+var_19E]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_1A8], 0
		mov	byte ptr [bp+var_1A4], 2
		mov	byte ptr [bp+var_1A4+1], 0
		mov	[bp+var_1A2], 0
		cmp	[bp+var_1D], 0
		jz	short loc_629F2
		push	2
		lea	ax, [bp+var_1A8]
		push	ax
		push	8
		lea	ax, [bp+var_39C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		lea	ax, [bp+var_1A8]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_7D11
		add	sp, 4
		jmp	short loc_62A19
; ���������������������������������������������������������������������������

loc_629F2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2CC9j
		cmp	[bp+var_1F], 0
		jz	short loc_62A19
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		lea	ax, [bp+var_588]
		push	ax
		lea	ax, [bp+var_DD4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_62A19:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2D00j
					; Midgame1_PlayPart1_5FCF0+2D06j
		mov	[bp+var_DFB], 0
		jmp	short loc_62A6E
; ���������������������������������������������������������������������������

loc_62A21:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2D8Ej
		cmp	[bp+var_DFB], 41h ; 'A'
		jnz	short loc_62A61
		cmp	[bp+var_1D], 0
		jz	short loc_62A3F
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_62A61
; ���������������������������������������������������������������������������

loc_62A3F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2D3Cj
		cmp	[bp+var_1F], 0
		jz	short loc_62A61
		cmp	[bp+var_DD4], 0
		jz	short loc_62A61
		push	[bp+var_DD2]
		mov	bx, [bp+var_DD4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_62A61:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2D36j
					; Midgame1_PlayPart1_5FCF0+2D4Dj ...
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_62A6E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2D2Fj
		push	[bp+var_19E]
		call	AnimLayer_IsFinished_2E654
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_62A21
		cmp	[bp+var_1D], 0
		jz	short loc_62A93
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_62A93:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2D94j
		cmp	[bp+var_1F], 0
		jz	short loc_62AA6
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_62AA6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2DA7j
		cmp	byte ptr [bp+var_1A4+1], 0
		jz	short loc_62ACE
		cmp	[bp+var_1A8], 0
		jz	short loc_62ACE
		push	0
		mov	al, byte ptr [bp+var_1A4]
		push	ax
		lea	ax, [bp+var_1A8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62ACE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2DBBj
					; Midgame1_PlayPart1_5FCF0+2DC3j
		mov	[bp+var_1A8], 0
		mov	byte ptr [bp+var_1A4+1], 0
		mov	[bp+var_1A2], 0
		cmp	byte ptr [bp+var_198+1], 0
		jz	short loc_62B0D
		cmp	[bp+var_19C], 0
		jz	short loc_62B0D
		push	0
		mov	al, byte ptr [bp+var_198]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62B0D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2DFAj
					; Midgame1_PlayPart1_5FCF0+2E02j
		mov	[bp+var_19C], 0
		mov	byte ptr [bp+var_198+1], 0
		mov	[bp+var_196], 0
		push	0
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_178]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_16E+1], 0
		jz	short loc_62B6A
		cmp	[bp+var_172], 0
		jz	short loc_62B6A
		push	0
		mov	al, byte ptr [bp+var_16E]
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62B6A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2E57j
					; Midgame1_PlayPart1_5FCF0+2E5Fj
		mov	[bp+var_172], 0
		mov	byte ptr [bp+var_16E+1], 0
		mov	[bp+var_16E+2],	0
		cmp	byte ptr [bp+var_164+1], 0
		jz	short loc_62BA9
		cmp	[bp+var_168], 0
		jz	short loc_62BA9
		push	0
		mov	al, byte ptr [bp+var_164]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62BA9:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2E96j
					; Midgame1_PlayPart1_5FCF0+2E9Ej
		mov	[bp+var_168], 0
		mov	byte ptr [bp+var_164+1], 0
		mov	[bp+var_164+2],	0
		lea	ax, [bp+var_DF4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		call	Input_Flush_CDDC
		cmp	byte_495FC, 0
		jnz	short loc_62BDC
		jmp	loc_62FDA
; ���������������������������������������������������������������������������

loc_62BDC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2EE7j
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_62C11
		cmp	[bp+var_DD0], 0
		jz	short loc_62C11
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62C11:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2EFEj
					; Midgame1_PlayPart1_5FCF0+2F06j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_62C63
		cmp	[bp+var_DB6], 0
		jz	short loc_62C63
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62C63:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2F50j
					; Midgame1_PlayPart1_5FCF0+2F58j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_62CAF
		cmp	[bp+var_59C], 0
		jz	short loc_62CAF
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62CAF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2F9Cj
					; Midgame1_PlayPart1_5FCF0+2FA4j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_62CEE
		cmp	[bp+var_AE], 0
		jz	short loc_62CEE
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62CEE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2FDBj
					; Midgame1_PlayPart1_5FCF0+2FE3j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_62DBA
		cmp	[bp+var_7E], 0
		jz	short loc_62DBA
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62DBA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+30AAj
					; Midgame1_PlayPart1_5FCF0+30B1j
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_62DF2
		cmp	[bp+var_74], 0
		jz	short loc_62DF2
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62DF2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+30E2j
					; Midgame1_PlayPart1_5FCF0+30E9j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_62E2A
		cmp	[bp+var_6A], 0
		jz	short loc_62E2A
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62E2A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+311Aj
					; Midgame1_PlayPart1_5FCF0+3121j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_62E62
		cmp	[bp+var_60], 0
		jz	short loc_62E62
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62E62:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3152j
					; Midgame1_PlayPart1_5FCF0+3159j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_62E9A
		cmp	[bp+var_56], 0
		jz	short loc_62E9A
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62E9A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+318Aj
					; Midgame1_PlayPart1_5FCF0+3191j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_62EEE
		cmp	[bp+var_40], 0
		jz	short loc_62EEE
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62EEE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+31DEj
					; Midgame1_PlayPart1_5FCF0+31E5j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_62F35
		cmp	[bp+var_36], 0
		jz	short loc_62F35
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_62F35:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3225j
					; Midgame1_PlayPart1_5FCF0+322Cj
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_62FDA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+2EE9j
		mov	[bp+var_BC], 0
		mov	[bp+var_B8], 2
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		push	3
		lea	ax, [bp+var_BC]
		push	ax
		push	6
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_C6], 0
		mov	[bp+var_C2], 2
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	3
		lea	ax, [bp+var_C6]
		push	ax
		push	1Ah
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_D0], 0
		mov	[bp+var_CC], 2
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		push	3
		lea	ax, [bp+var_D0]
		push	ax
		push	0Bh
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_DA], 0
		mov	[bp+var_D6], 2
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		push	3
		lea	ax, [bp+var_DA]
		push	ax
		push	0Ch
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_E4], 0
		mov	[bp+var_E0], 2
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		push	2Ah ; '*'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_E7], 0
		lea	ax, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	ds
		push	offset a_voc	; ".voc"
		push	ds
		push	offset aBeep1	; "beep1"
		push	ds
		push	offset a____DataMidg_0 ; "..\\..\\data\\midgames\\mid1\\"
		lea	ax, [bp+var_234]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	2
		lea	ax, [bp+var_158]
		push	ax
		push	36h ; '6'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_15C+1], 0
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	0FFE8h
		push	0
		lea	ax, [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_160], ax
		push	[bp+var_160]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp+var_168+2], 2
		mov	byte ptr [bp+var_168+3], 0
		mov	[bp+var_164], 0
		push	3
		lea	ax, [bp-16Ah]
		push	ax
		push	14h
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_16E], ax
		or	ax, ax
		jz	short loc_63205
		push	0FFD8h
		push	0
		lea	ax, [bp-16Ah]
		push	ax
		push	word ptr [bp+var_16E]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx], 135Eh
		mov	bx, word ptr [bp+var_16E]
		mov	word ptr [bx+0Ah], 137Eh
		mov	bx, word ptr [bp+var_16E]
		mov	byte ptr [bx+1Dh], 0
		mov	ax, word ptr [bp+var_16E]
		jmp	short loc_63209
; ���������������������������������������������������������������������������

loc_63205:				; CODE XREF: Midgame1_PlayPart1_5FCF0+34DFj
		mov	ax, word ptr [bp+var_16E]

loc_63209:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3513j
		mov	word ptr [bp+var_16E+2], ax
		push	word ptr [bp+var_16E+2]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFE8h
		push	0
		lea	ax, [bp+var_BC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_172+2], ax
		push	word ptr [bp+var_172+2]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	28h ; '('
		push	9Fh ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingLayer_Construct_B3F8
		add	sp, 8
		mov	word ptr [bp+var_172], ax
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+23h], 9
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, word ptr [bp+var_172]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	word ptr [bp+var_172]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	6Ch ; 'l'
		push	63h ; 'c'
		lea	ax, [bp+var_DA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_176+2], ax
		push	word ptr [bp+var_176+2]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	6Bh ; 'k'
		push	0C3h ; '�'
		lea	ax, [bp+var_DA]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_176], ax
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	7
		push	16h
		push	87h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_178], ax
		push	[bp+var_178]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	10h
		push	16h
		push	0B9h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_17A], ax
		push	[bp+var_17A]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	15h
		push	26h ; '&'
		push	0A0h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_17C], ax
		push	[bp+var_17C]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	16h
		push	6Dh ; 'm'
		push	0A9h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_B45E
		add	sp, 0Ah
		mov	[bp+var_17E], ax
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	[bp+var_17E]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	17h
		push	6Dh ; 'm'
		push	0A9h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_B45E
		add	sp, 0Ah
		mov	[bp+var_180], ax
		mov	bx, [bp+var_180]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, [bp+var_180]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_180]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, [bp+var_180]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	[bp+var_180]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	18h
		push	28h ; '('
		push	9Fh ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-182h], ax
		push	word ptr [bp-182h]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Ah
		push	11h
		push	8Ah ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_184], ax
		push	[bp+var_184]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	3Fh ; '?'
		push	8Ch ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_186], ax
		push	[bp+var_186]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Ch
		push	3Fh ; '?'
		push	0B2h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_188], ax
		push	[bp+var_188]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_15E]
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EA]
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_18A], 10h
		mov	[bp+var_18C], 7
		lea	ax, [bp+var_E9A]
		push	ss
		push	ax
		push	ds
		push	offset unk_44B02
		mov	cx, 0A4h ; '�'
		call	CRT_Fmemcpy
		mov	eax, dword_44BA6
		mov	[bp+var_190], eax
		mov	si, 1B8Ah
		lea	di, [bp+var_EEC]
		push	ss
		pop	es
		mov	cx, 29h	; ')'
		rep movsw
		mov	[bp+var_19C+2],	0
		mov	byte ptr [bp+var_196], 2
		mov	byte ptr [bp+var_196+1], 0
		mov	[bp+var_196+2],	0
		cmp	[bp+var_1D], 0
		jz	short loc_63598
		push	2
		lea	ax, [bp+var_19C+2]
		push	ax
		push	9
		lea	ax, [bp+var_39C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_19C+2]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_635DB
; ���������������������������������������������������������������������������

loc_63598:				; CODE XREF: Midgame1_PlayPart1_5FCF0+386Dj
		cmp	[bp+var_1F], 0
		jz	short loc_635DB
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		lea	ax, [bp+var_57E]
		push	ax
		lea	ax, [bp+var_DD4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	[bp+var_DD4], 0
		jz	short loc_635DB
		push	[bp+var_DD2]
		mov	bx, [bp+var_DD4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_635DB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+38A6j
					; Midgame1_PlayPart1_5FCF0+38ACj ...
		jmp	loc_6376B
; ���������������������������������������������������������������������������

loc_635DE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A96j
		test	[bp+var_DD9], 1
		jz	short loc_63632
		inc	[bp+var_18A]
		mov	ax, [bp+var_18A]
		cmp	ax, 15h
		jnz	short loc_635F9
		mov	[bp+var_18A], 10h

loc_635F9:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3901j
		mov	ax, [bp+var_18A]
		mov	word ptr [bp+var_19C], ax
		mov	bx, [bp+var_17A]
		mov	ax, word ptr [bp+var_19C]
		mov	[bx+1Bh], ax
		dec	[bp+var_18C]
		mov	ax, [bp+var_18C]
		cmp	ax, 6
		jnz	short loc_6361F
		mov	[bp+var_18C], 0Fh

loc_6361F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3927j
		mov	ax, [bp+var_18C]
		mov	[bp+var_19E], ax
		mov	bx, [bp+var_178]
		mov	ax, [bp+var_19E]
		mov	[bx+1Bh], ax

loc_63632:				; CODE XREF: Midgame1_PlayPart1_5FCF0+38F4j
		mov	bx, [bp+var_DD9]
		shl	bx, 2
		lea	ax, [bp+var_E9A]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_190]
		mov	word ptr [bp+var_1A2+2], ax
		mov	bx, [bp+var_DD9]
		shl	bx, 2
		lea	ax, [bp+var_E98]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_190+2]
		mov	word ptr [bp+var_1A2], ax
		mov	bx, [bp+var_17E]
		mov	ax, word ptr [bp+var_1A2+2]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_17E]
		mov	ax, word ptr [bp+var_1A2]
		mov	[bx+0Eh], ax
		mov	ax, word_44C00
		add	word_44BFC, ax
		mov	ax, word_44C02
		add	word_44BFE, ax
		cmp	word_44BFC, 0B9h ; '�'
		jge	short loc_63694
		cmp	word_44BFC, 88h	; '�'
		jg	short loc_6369F

loc_63694:				; CODE XREF: Midgame1_PlayPart1_5FCF0+399Aj
		mov	dx, 0FFFFh
		mov	ax, word_44C00
		imul	dx
		mov	word_44C00, ax

loc_6369F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+39A2j
		cmp	word_44BFE, 3Eh	; '>'
		jge	short loc_636AD
		cmp	word_44BFE, 0Eh
		jg	short loc_636B8

loc_636AD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+39B4j
		mov	dx, 0FFFFh
		mov	ax, word_44C02
		imul	dx
		mov	word_44C02, ax

loc_636B8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+39BBj
		mov	si, word_44BFC
		mov	di, word_44BFE
		mov	bx, [bp+var_180]
		mov	[bx+0Ch], si
		mov	bx, [bp+var_180]
		mov	[bx+0Eh], di
		mov	bx, [bp+var_DD9]
		shl	bx, 1
		lea	ax, [bp+var_EEC]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_1A4], ax
		mov	bx, word ptr [bp+var_172]
		mov	ax, [bp+var_1A4]
		mov	[bx+1Bh], ax
		mov	bx, [bp+var_DD9]
		shl	bx, 1
		lea	ax, [bp+var_EEC]
		add	bx, ax
		cmp	word ptr [bx], 3
		jle	short loc_63707
		mov	bx, word ptr [bp+var_176+2]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_6372C
; ���������������������������������������������������������������������������

loc_63707:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A0Aj
		mov	bx, [bp+var_DD9]
		shl	bx, 1
		lea	ax, [bp+var_EEC]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_63723
		mov	bx, word ptr [bp+var_176+2]
		mov	word ptr [bx+1Bh], 2
		jmp	short loc_6372C
; ���������������������������������������������������������������������������

loc_63723:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A26j
		mov	bx, word ptr [bp+var_176+2]
		mov	word ptr [bx+1Bh], 0

loc_6372C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A15j
					; Midgame1_PlayPart1_5FCF0+3A31j
		mov	ax, word_44C04
		add	word_44C06, ax
		cmp	word_44C06, 5
		jge	short loc_63741
		cmp	word_44C06, 3
		jg	short loc_6374C

loc_63741:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A48j
		mov	dx, 0FFFFh
		mov	ax, word_44C04
		imul	dx
		mov	word_44C04, ax

loc_6374C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A4Fj
		mov	ax, word_44C06
		mov	word ptr [bp+var_1A8+2], ax
		mov	bx, word ptr [bp+var_176]
		mov	ax, word ptr [bp+var_1A8+2]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6376B:				; CODE XREF: Midgame1_PlayPart1_5FCF0:loc_635DBj
		cmp	[bp+var_DD9], 28h ; '('
		jnb	short loc_63779
		cmp	byte ptr [bp+var_DD7], 0
		jz	short loc_6377E

loc_63779:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A80j
		mov	ax, 1
		jmp	short loc_63780
; ���������������������������������������������������������������������������

loc_6377E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A87j
		xor	ax, ax

loc_63780:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A8Cj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63789
		jmp	loc_635DE
; ���������������������������������������������������������������������������

loc_63789:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A94j
		cmp	[bp+var_1D], 0
		jz	short loc_6379C
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_6379C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3A9Dj
		cmp	[bp+var_1F], 0
		jz	short loc_637AF
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_637AF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3AB0j
		cmp	byte ptr [bp+var_196+1], 0
		jz	short loc_637D7
		cmp	[bp+var_19C+2],	0
		jz	short loc_637D7
		push	0
		mov	al, byte ptr [bp+var_196]
		push	ax
		lea	ax, [bp+var_19C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_637D7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3AC4j
					; Midgame1_PlayPart1_5FCF0+3ACCj
		mov	[bp+var_19C+2],	0
		mov	byte ptr [bp+var_196+1], 0
		mov	[bp+var_196+2],	0
		cmp	byte ptr [bp+var_168+3], 0
		jz	short loc_63816
		cmp	dword ptr [bp-16Ah], 0
		jz	short loc_63816
		push	0
		mov	al, byte ptr [bp+var_168+2]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63816:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3B03j
					; Midgame1_PlayPart1_5FCF0+3B0Bj
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp+var_168+3], 0
		mov	[bp+var_164], 0
		push	2
		lea	ax, [bp+var_15E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_63864
		cmp	[bp+var_158], 0
		jz	short loc_63864
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63864:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3B51j
					; Midgame1_PlayPart1_5FCF0+3B59j
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_63894
		jmp	loc_63DDC
; ���������������������������������������������������������������������������

loc_63894:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3B9Fj
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_638CB
		cmp	[bp+var_E4], 0
		jz	short loc_638CB
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_638CB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3BB8j
					; Midgame1_PlayPart1_5FCF0+3BC0j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_6390A
		cmp	[bp+var_DA], 0
		jz	short loc_6390A
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6390A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3BF7j
					; Midgame1_PlayPart1_5FCF0+3BFFj
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_63949
		cmp	[bp+var_D0], 0
		jz	short loc_63949
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63949:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3C36j
					; Midgame1_PlayPart1_5FCF0+3C3Ej
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_63988
		cmp	[bp+var_C6], 0
		jz	short loc_63988
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63988:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3C75j
					; Midgame1_PlayPart1_5FCF0+3C7Dj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_639C7
		cmp	[bp+var_BC], 0
		jz	short loc_639C7
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_639C7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3CB4j
					; Midgame1_PlayPart1_5FCF0+3CBCj
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_63A13
		cmp	[bp+var_DD0], 0
		jz	short loc_63A13
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63A13:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3D00j
					; Midgame1_PlayPart1_5FCF0+3D08j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_63A65
		cmp	[bp+var_DB6], 0
		jz	short loc_63A65
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63A65:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3D52j
					; Midgame1_PlayPart1_5FCF0+3D5Aj
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_63AB1
		cmp	[bp+var_59C], 0
		jz	short loc_63AB1
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63AB1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3D9Ej
					; Midgame1_PlayPart1_5FCF0+3DA6j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_63AF0
		cmp	[bp+var_AE], 0
		jz	short loc_63AF0
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63AF0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3DDDj
					; Midgame1_PlayPart1_5FCF0+3DE5j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_63BBC
		cmp	[bp+var_7E], 0
		jz	short loc_63BBC
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63BBC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3EACj
					; Midgame1_PlayPart1_5FCF0+3EB3j
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_63BF4
		cmp	[bp+var_74], 0
		jz	short loc_63BF4
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63BF4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3EE4j
					; Midgame1_PlayPart1_5FCF0+3EEBj
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_63C2C
		cmp	[bp+var_6A], 0
		jz	short loc_63C2C
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63C2C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3F1Cj
					; Midgame1_PlayPart1_5FCF0+3F23j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_63C64
		cmp	[bp+var_60], 0
		jz	short loc_63C64
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63C64:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3F54j
					; Midgame1_PlayPart1_5FCF0+3F5Bj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_63C9C
		cmp	[bp+var_56], 0
		jz	short loc_63C9C
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63C9C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3F8Cj
					; Midgame1_PlayPart1_5FCF0+3F93j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_63CF0
		cmp	[bp+var_40], 0
		jz	short loc_63CF0
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63CF0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3FE0j
					; Midgame1_PlayPart1_5FCF0+3FE7j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_63D37
		cmp	[bp+var_36], 0
		jz	short loc_63D37
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_63D37:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4027j
					; Midgame1_PlayPart1_5FCF0+402Ej
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_63DDC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+3BA1j
		mov	[bp+var_F4], 0
		mov	[bp+var_F0], 2
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	3
		lea	ax, [bp+var_F4]
		push	ax
		push	1
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_FE], 0
		mov	[bp+var_FA], 2
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		push	2
		lea	ax, [bp+var_FE]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_101], 0
		lea	ax, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_10E], 0
		mov	[bp+var_10A], 2
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, [bp+var_10E]
		push	ax
		push	26h ; '&'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_111], 0
		lea	ax, [bp+var_10E]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	[bp+var_104]
		mov	al, [bp+var_102]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_114]
		mov	al, [bp+var_112]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_152+2], ax
		push	word ptr [bp+var_152+2]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	0FFD8h
		push	0
		lea	ax, [bp+var_BC]
		push	ax
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	si, ax
		push	2
		push	[bp+var_10]
		push	[bp+var_E]
		lea	ax, [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_152], ax
		push	3
		push	[bp+var_14]
		push	[bp+var_12]
		lea	ax, [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_154], ax
		push	word ptr [bp+var_152]
		push	si
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_154]
		push	si
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	18h
		push	0
		lea	ax, [bp+var_F4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_158+2], ax
		push	word ptr [bp+var_158+2]
		push	si
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_63FE1
; ���������������������������������������������������������������������������

loc_63FD4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+430Aj
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_63FE1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+42E2j
		cmp	[bp+var_DD9], 14h
		jnb	short loc_63FEF
		cmp	byte ptr [bp+var_DD7], 0
		jz	short loc_63FF4

loc_63FEF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+42F6j
		mov	ax, 1
		jmp	short loc_63FF6
; ���������������������������������������������������������������������������

loc_63FF4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+42FDj
		xor	ax, ax

loc_63FF6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4302j
		mov	ah, 0
		or	ax, ax
		jz	short loc_63FD4
		push	0
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_64015
		jmp	loc_64638
; ���������������������������������������������������������������������������

loc_64015:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4320j
		push	2
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_6404C
		cmp	[bp+var_10E], 0
		jz	short loc_6404C
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6404C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4339j
					; Midgame1_PlayPart1_5FCF0+4341j
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F9], 0
		jz	short loc_6409A
		cmp	[bp+var_FE], 0
		jz	short loc_6409A
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6409A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4387j
					; Midgame1_PlayPart1_5FCF0+438Fj
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_640D9
		cmp	[bp+var_F4], 0
		jz	short loc_640D9
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_640D9:				; CODE XREF: Midgame1_PlayPart1_5FCF0+43C6j
					; Midgame1_PlayPart1_5FCF0+43CEj
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_64127
		cmp	[bp+var_E4], 0
		jz	short loc_64127
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64127:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4414j
					; Midgame1_PlayPart1_5FCF0+441Cj
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_64166
		cmp	[bp+var_DA], 0
		jz	short loc_64166
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64166:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4453j
					; Midgame1_PlayPart1_5FCF0+445Bj
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_641A5
		cmp	[bp+var_D0], 0
		jz	short loc_641A5
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_641A5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4492j
					; Midgame1_PlayPart1_5FCF0+449Aj
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_641E4
		cmp	[bp+var_C6], 0
		jz	short loc_641E4
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_641E4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+44D1j
					; Midgame1_PlayPart1_5FCF0+44D9j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_64223
		cmp	[bp+var_BC], 0
		jz	short loc_64223
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64223:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4510j
					; Midgame1_PlayPart1_5FCF0+4518j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_6426F
		cmp	[bp+var_DD0], 0
		jz	short loc_6426F
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6426F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+455Cj
					; Midgame1_PlayPart1_5FCF0+4564j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_642C1
		cmp	[bp+var_DB6], 0
		jz	short loc_642C1
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_642C1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+45AEj
					; Midgame1_PlayPart1_5FCF0+45B6j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_6430D
		cmp	[bp+var_59C], 0
		jz	short loc_6430D
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6430D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+45FAj
					; Midgame1_PlayPart1_5FCF0+4602j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_6434C
		cmp	[bp+var_AE], 0
		jz	short loc_6434C
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6434C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4639j
					; Midgame1_PlayPart1_5FCF0+4641j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_64418
		cmp	[bp+var_7E], 0
		jz	short loc_64418
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64418:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4708j
					; Midgame1_PlayPart1_5FCF0+470Fj
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_64450
		cmp	[bp+var_74], 0
		jz	short loc_64450
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64450:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4740j
					; Midgame1_PlayPart1_5FCF0+4747j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_64488
		cmp	[bp+var_6A], 0
		jz	short loc_64488
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64488:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4778j
					; Midgame1_PlayPart1_5FCF0+477Fj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_644C0
		cmp	[bp+var_60], 0
		jz	short loc_644C0
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_644C0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+47B0j
					; Midgame1_PlayPart1_5FCF0+47B7j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_644F8
		cmp	[bp+var_56], 0
		jz	short loc_644F8
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_644F8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+47E8j
					; Midgame1_PlayPart1_5FCF0+47EFj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_6454C
		cmp	[bp+var_40], 0
		jz	short loc_6454C
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6454C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+483Cj
					; Midgame1_PlayPart1_5FCF0+4843j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_64593
		cmp	[bp+var_36], 0
		jz	short loc_64593
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64593:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4883j
					; Midgame1_PlayPart1_5FCF0+488Aj
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_64638:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4322j
		mov	[bp+var_11E], 0
		mov	[bp+var_11A], 2
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	2
		lea	ax, [bp+var_11E]
		push	ax
		push	38h ; '8'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_121], 0
		lea	ax, [bp+var_11E]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		cmp	[bp+var_1D], 0
		jz	short loc_646F4
		push	2
		lea	ax, [bp+var_158]
		push	ax
		push	8
		lea	ax, [bp+var_39C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_64737
; ���������������������������������������������������������������������������

loc_646F4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+49C9j
		cmp	[bp+var_1F], 0
		jz	short loc_64737
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		lea	ax, [bp+var_588]
		push	ax
		lea	ax, [bp+var_DD4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		cmp	[bp+var_DD4], 0
		jz	short loc_64737
		push	[bp+var_DD2]
		mov	bx, [bp+var_DD4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_64737:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4A02j
					; Midgame1_PlayPart1_5FCF0+4A08j ...
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_124]
		mov	al, [bp+var_122]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_90]
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_15C+2], ax
		push	word ptr [bp+var_15C+2]
		push	si
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFD8h
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_15C], ax
		push	word ptr [bp+var_15C]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1
		push	5Ah ; 'Z'
		push	0
		lea	ax, [bp+var_56]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_15E], ax
		push	[bp+var_15E]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	46h ; 'F'
		push	0
		lea	ax, [bp+var_56]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_160], ax
		push	[bp+var_160]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp+var_168+2], 2
		mov	byte ptr [bp+var_168+3], 0
		mov	[bp+var_164], 0
		push	3
		lea	ax, [bp-16Ah]
		push	ax
		push	16h
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-16Ah]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_648E5
; ���������������������������������������������������������������������������

loc_648BD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4C02j
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_DD9]
		cmp	ax, 1
		jz	short loc_648DF
		cmp	ax, 0Ch
		jz	short loc_648E1
		cmp	ax, 12h
		jz	short loc_648E3
		jmp	short loc_648E5
; ���������������������������������������������������������������������������

loc_648DF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4BE1j
		jmp	short loc_648E5
; ���������������������������������������������������������������������������

loc_648E1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4BE6j
		jmp	short loc_648E5
; ���������������������������������������������������������������������������

loc_648E3:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4BEBj
		jmp	short $+2

loc_648E5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4BCBj
					; Midgame1_PlayPart1_5FCF0+4BEDj ...
		push	di
		call	AnimLayer_IsFinished_2E654
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_648BD
		cmp	[bp+var_1D], 0
		jz	short loc_64907
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_64907:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4C08j
		cmp	[bp+var_1F], 0
		jz	short loc_6491A
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_6491A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4C1Bj
		cmp	byte ptr [bp+var_168+3], 0
		jz	short loc_64942
		cmp	dword ptr [bp-16Ah], 0
		jz	short loc_64942
		push	0
		mov	al, byte ptr [bp+var_168+2]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64942:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4C2Fj
					; Midgame1_PlayPart1_5FCF0+4C37j
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp+var_168+3], 0
		mov	[bp+var_164], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_64981
		cmp	[bp+var_158], 0
		jz	short loc_64981
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64981:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4C6Ej
					; Midgame1_PlayPart1_5FCF0+4C76j
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		push	0
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_649B1
		jmp	loc_65022
; ���������������������������������������������������������������������������

loc_649B1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4CBCj
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_649E8
		cmp	[bp+var_11E], 0
		jz	short loc_649E8
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_649E8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4CD5j
					; Midgame1_PlayPart1_5FCF0+4CDDj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	2
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_64A36
		cmp	[bp+var_10E], 0
		jz	short loc_64A36
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64A36:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4D23j
					; Midgame1_PlayPart1_5FCF0+4D2Bj
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F9], 0
		jz	short loc_64A84
		cmp	[bp+var_FE], 0
		jz	short loc_64A84
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64A84:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4D71j
					; Midgame1_PlayPart1_5FCF0+4D79j
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_64AC3
		cmp	[bp+var_F4], 0
		jz	short loc_64AC3
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64AC3:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4DB0j
					; Midgame1_PlayPart1_5FCF0+4DB8j
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_64B11
		cmp	[bp+var_E4], 0
		jz	short loc_64B11
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64B11:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4DFEj
					; Midgame1_PlayPart1_5FCF0+4E06j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_64B50
		cmp	[bp+var_DA], 0
		jz	short loc_64B50
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64B50:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4E3Dj
					; Midgame1_PlayPart1_5FCF0+4E45j
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_64B8F
		cmp	[bp+var_D0], 0
		jz	short loc_64B8F
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64B8F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4E7Cj
					; Midgame1_PlayPart1_5FCF0+4E84j
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_64BCE
		cmp	[bp+var_C6], 0
		jz	short loc_64BCE
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64BCE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4EBBj
					; Midgame1_PlayPart1_5FCF0+4EC3j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_64C0D
		cmp	[bp+var_BC], 0
		jz	short loc_64C0D
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64C0D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4EFAj
					; Midgame1_PlayPart1_5FCF0+4F02j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_64C59
		cmp	[bp+var_DD0], 0
		jz	short loc_64C59
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64C59:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4F46j
					; Midgame1_PlayPart1_5FCF0+4F4Ej
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_64CAB
		cmp	[bp+var_DB6], 0
		jz	short loc_64CAB
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64CAB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4F98j
					; Midgame1_PlayPart1_5FCF0+4FA0j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_64CF7
		cmp	[bp+var_59C], 0
		jz	short loc_64CF7
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64CF7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4FE4j
					; Midgame1_PlayPart1_5FCF0+4FECj
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_64D36
		cmp	[bp+var_AE], 0
		jz	short loc_64D36
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64D36:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5023j
					; Midgame1_PlayPart1_5FCF0+502Bj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_64E02
		cmp	[bp+var_7E], 0
		jz	short loc_64E02
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64E02:				; CODE XREF: Midgame1_PlayPart1_5FCF0+50F2j
					; Midgame1_PlayPart1_5FCF0+50F9j
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_64E3A
		cmp	[bp+var_74], 0
		jz	short loc_64E3A
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64E3A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+512Aj
					; Midgame1_PlayPart1_5FCF0+5131j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_64E72
		cmp	[bp+var_6A], 0
		jz	short loc_64E72
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64E72:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5162j
					; Midgame1_PlayPart1_5FCF0+5169j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_64EAA
		cmp	[bp+var_60], 0
		jz	short loc_64EAA
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64EAA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+519Aj
					; Midgame1_PlayPart1_5FCF0+51A1j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_64EE2
		cmp	[bp+var_56], 0
		jz	short loc_64EE2
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64EE2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+51D2j
					; Midgame1_PlayPart1_5FCF0+51D9j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_64F36
		cmp	[bp+var_40], 0
		jz	short loc_64F36
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64F36:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5226j
					; Midgame1_PlayPart1_5FCF0+522Dj
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_64F7D
		cmp	[bp+var_36], 0
		jz	short loc_64F7D
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_64F7D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+526Dj
					; Midgame1_PlayPart1_5FCF0+5274j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_65022:				; CODE XREF: Midgame1_PlayPart1_5FCF0+4CBEj
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154], 2
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		cmp	[bp+var_1D], 0
		jz	short loc_6506E
		push	2
		lea	ax, [bp+var_158]
		push	ax
		push	9
		lea	ax, [bp+var_39C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_7D11
		add	sp, 4
		jmp	short loc_65095
; ���������������������������������������������������������������������������

loc_6506E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5352j
		cmp	[bp+var_1F], 0
		jz	short loc_65095
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		lea	ax, [bp+var_57E]
		push	ax
		lea	ax, [bp+var_DD4]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_65095:				; CODE XREF: Midgame1_PlayPart1_5FCF0+537Cj
					; Midgame1_PlayPart1_5FCF0+5382j
		mov	[bp+var_164+2],	0
		mov	byte ptr [bp+var_15E], 2
		mov	byte ptr [bp+var_15E+1], 0
		mov	[bp+var_15C], 0
		push	2
		lea	ax, [bp+var_164+2]
		push	ax
		push	39h ; '9'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_168+3], 0
		lea	ax, [bp+var_164+2]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	word ptr [bp+var_168]
		mov	al, byte ptr [bp+var_168+2]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EA]
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFE8h
		push	0
		lea	ax, [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-16Ah], ax
		push	word ptr [bp-16Ah]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_176+2],	0
		mov	byte ptr [bp+var_172+2], 2
		mov	byte ptr [bp+var_172+3], 0
		mov	[bp+var_16E], 0
		push	3
		lea	ax, [bp+var_176+2]
		push	ax
		push	17h
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_178], ax
		or	ax, ax
		jz	short loc_651EC
		push	0FFE8h
		push	0
		lea	ax, [bp+var_176+2]
		push	ax
		push	[bp+var_178]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp+var_178]
		mov	word ptr [bx], 135Eh
		mov	bx, [bp+var_178]
		mov	word ptr [bx+0Ah], 137Eh
		mov	bx, [bp+var_178]
		mov	byte ptr [bx+1Dh], 0
		mov	ax, [bp+var_178]
		jmp	short loc_651F0
; ���������������������������������������������������������������������������

loc_651EC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+54C6j
		mov	ax, [bp+var_178]

loc_651F0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+54FAj
		mov	word ptr [bp+var_176], ax
		push	word ptr [bp+var_176]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFE8h
		push	0
		lea	ax, [bp+var_BC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_17A], ax
		push	[bp+var_17A]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	28h ; '('
		push	9Fh ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingLayer_Construct_B3F8
		add	sp, 8
		mov	[bp+var_17C], ax
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, [bp+var_17C]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	[bp+var_17C]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	6Ch ; 'l'
		push	63h ; 'c'
		lea	ax, [bp+var_DA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_17E], ax
		push	[bp+var_17E]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	6Bh ; 'k'
		push	0C3h ; '�'
		lea	ax, [bp+var_DA]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_180], ax
		push	[bp+var_180]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	7
		push	16h
		push	87h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-182h], ax
		push	word ptr [bp-182h]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	10h
		push	16h
		push	0B9h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_184], ax
		push	[bp+var_184]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	15h
		push	26h ; '&'
		push	0A0h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_186], ax
		push	[bp+var_186]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	16h
		push	6Dh ; 'm'
		push	0A9h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_B45E
		add	sp, 0Ah
		mov	[bp+var_188], ax
		mov	bx, [bp+var_188]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, [bp+var_188]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_188]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, [bp+var_188]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	[bp+var_188]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	17h
		push	6Dh ; 'm'
		push	0A9h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ClippedMovingImageLayer_Construct_B45E
		add	sp, 0Ah
		mov	[bp+var_18A], ax
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, [bp+var_18A]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	[bp+var_18A]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	18h
		push	28h ; '('
		push	9Fh ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_18C], ax
		push	[bp+var_18C]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Ah
		push	11h
		push	8Ah ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_190+2], ax
		push	word ptr [bp+var_190+2]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	3Fh ; '?'
		push	8Ch ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_190], ax
		push	word ptr [bp+var_190]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Ch
		push	3Fh ; '?'
		push	0B2h ; '�'
		lea	ax, [bp+var_D0]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_192], ax
		push	[bp+var_192]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [bp+var_196+2], 10h
		mov	word ptr [bp+var_196], 7
		lea	ax, [bp+var_E9A]
		push	ss
		push	ax
		push	ds
		push	offset aImmjFDA_YWVTSn ; "�m�j�f�d�a�_�]�[�Y�W�V�T�S�P�O�N�M�N�Q�"...
		mov	cx, 0A4h ; '�'
		call	CRT_Fmemcpy
		mov	eax, dword_44CAC
		mov	[bp+var_19C+2],	eax
		mov	si, 1C90h
		lea	di, [bp+var_EEC]
		push	ss
		pop	es
		mov	cx, 29h	; ')'
		rep movsw
		cmp	[bp+var_1D], 0
		jz	short loc_654E2
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4

loc_654E2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+57E1j
		cmp	[bp+var_1F], 0
		jz	short loc_65504
		cmp	[bp+var_DD4], 0
		jz	short loc_65504
		push	[bp+var_DD2]
		mov	bx, [bp+var_DD4]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_65504:				; CODE XREF: Midgame1_PlayPart1_5FCF0+57F6j
					; Midgame1_PlayPart1_5FCF0+57FDj
		jmp	loc_6568C
; ���������������������������������������������������������������������������

loc_65507:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59B7j
		dec	word ptr [bp+var_196+2]
		mov	ax, word ptr [bp+var_196+2]
		cmp	ax, 0Fh
		jnz	short loc_6551A
		mov	word ptr [bp+var_196+2], 14h

loc_6551A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5822j
		mov	ax, word ptr [bp+var_196+2]
		mov	word ptr [bp+var_19C], ax
		mov	bx, [bp+var_184]
		mov	ax, word ptr [bp+var_19C]
		mov	[bx+1Bh], ax
		inc	word ptr [bp+var_196]
		mov	ax, word ptr [bp+var_196]
		cmp	ax, 10h
		jnz	short loc_65540
		mov	word ptr [bp+var_196], 7

loc_65540:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5848j
		mov	ax, word ptr [bp+var_196]
		mov	[bp+var_19E], ax
		mov	bx, [bp-182h]
		mov	ax, [bp+var_19E]
		mov	[bx+1Bh], ax
		mov	bx, [bp+var_DD9]
		shl	bx, 2
		lea	ax, [bp+var_E9A]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_19C+2]
		mov	word ptr [bp+var_1A2+2], ax
		mov	bx, [bp+var_DD9]
		shl	bx, 2
		lea	ax, [bp+var_E98]
		add	bx, ax
		mov	ax, [bx]
		add	ax, [bp+var_198]
		mov	word ptr [bp+var_1A2], ax
		mov	bx, [bp+var_188]
		mov	ax, word ptr [bp+var_1A2+2]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_188]
		mov	ax, word ptr [bp+var_1A2]
		mov	[bx+0Eh], ax
		mov	ax, word_44D06
		add	word_44D02, ax
		mov	ax, word_44D08
		add	word_44D04, ax
		cmp	word_44D02, 0B9h ; '�'
		jge	short loc_655B5
		cmp	word_44D02, 88h	; '�'
		jg	short loc_655C0

loc_655B5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+58BBj
		mov	dx, 0FFFFh
		mov	ax, word_44D06
		imul	dx
		mov	word_44D06, ax

loc_655C0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+58C3j
		cmp	word_44D04, 3Eh	; '>'
		jge	short loc_655CE
		cmp	word_44D04, 0Eh
		jg	short loc_655D9

loc_655CE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+58D5j
		mov	dx, 0FFFFh
		mov	ax, word_44D08
		imul	dx
		mov	word_44D08, ax

loc_655D9:				; CODE XREF: Midgame1_PlayPart1_5FCF0+58DCj
		mov	si, word_44D02
		mov	di, word_44D04
		mov	bx, [bp+var_18A]
		mov	[bx+0Ch], si
		mov	bx, [bp+var_18A]
		mov	[bx+0Eh], di
		mov	bx, [bp+var_DD9]
		shl	bx, 1
		lea	ax, [bp+var_EEC]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_1A4], ax
		mov	bx, [bp+var_17C]
		mov	ax, [bp+var_1A4]
		mov	[bx+1Bh], ax
		mov	bx, [bp+var_DD9]
		shl	bx, 1
		lea	ax, [bp+var_EEC]
		add	bx, ax
		cmp	word ptr [bx], 3
		jle	short loc_65628
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_6564D
; ���������������������������������������������������������������������������

loc_65628:				; CODE XREF: Midgame1_PlayPart1_5FCF0+592Bj
		mov	bx, [bp+var_DD9]
		shl	bx, 1
		lea	ax, [bp+var_EEC]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_65644
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 2
		jmp	short loc_6564D
; ���������������������������������������������������������������������������

loc_65644:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5947j
		mov	bx, [bp+var_17E]
		mov	word ptr [bx+1Bh], 0

loc_6564D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5936j
					; Midgame1_PlayPart1_5FCF0+5952j
		mov	ax, word_44D0A
		add	word_44D0C, ax
		cmp	word_44D0C, 5
		jge	short loc_65662
		cmp	word_44D0C, 3
		jg	short loc_6566D

loc_65662:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5969j
		mov	dx, 0FFFFh
		mov	ax, word_44D0A
		imul	dx
		mov	word_44D0A, ax

loc_6566D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5970j
		mov	ax, word_44D0C
		mov	word ptr [bp+var_1A8+2], ax
		mov	bx, [bp+var_180]
		mov	ax, word ptr [bp+var_1A8+2]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6568C:				; CODE XREF: Midgame1_PlayPart1_5FCF0:loc_65504j
		cmp	[bp+var_DD9], 28h ; '('
		jnb	short loc_6569A
		cmp	byte ptr [bp+var_DD7], 0
		jz	short loc_6569F

loc_6569A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59A1j
		mov	ax, 1
		jmp	short loc_656A1
; ���������������������������������������������������������������������������

loc_6569F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59A8j
		xor	ax, ax

loc_656A1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59ADj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_656AA
		jmp	loc_65507
; ���������������������������������������������������������������������������

loc_656AA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59B5j
		cmp	[bp+var_1D], 0
		jz	short loc_656BD
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_656BD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59BEj
		cmp	[bp+var_1F], 0
		jz	short loc_656D0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_656D0:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59D1j
		cmp	byte ptr [bp+var_172+3], 0
		jz	short loc_656F8
		cmp	[bp+var_176+2],	0
		jz	short loc_656F8
		push	0
		mov	al, byte ptr [bp+var_172+2]
		push	ax
		lea	ax, [bp+var_176+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_656F8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+59E5j
					; Midgame1_PlayPart1_5FCF0+59EDj
		mov	[bp+var_176+2],	0
		mov	byte ptr [bp+var_172+3], 0
		mov	[bp+var_16E], 0
		push	0
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_168]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_15E+1], 0
		jz	short loc_65755
		cmp	[bp+var_164+2],	0
		jz	short loc_65755
		push	0
		mov	al, byte ptr [bp+var_15E]
		push	ax
		lea	ax, [bp+var_164+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65755:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5A42j
					; Midgame1_PlayPart1_5FCF0+5A4Aj
		mov	[bp+var_164+2],	0
		mov	byte ptr [bp+var_15E+1], 0
		mov	[bp+var_15C], 0
		cmp	byte ptr [bp+var_154+1], 0
		jz	short loc_65794
		cmp	[bp+var_158], 0
		jz	short loc_65794
		push	0
		mov	al, byte ptr [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65794:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5A81j
					; Midgame1_PlayPart1_5FCF0+5A89j
		mov	[bp+var_158], 0
		mov	byte ptr [bp+var_154+1], 0
		mov	[bp+var_152], 0
		cmp	byte_495FC, 0
		jnz	short loc_657B5
		jmp	loc_65E26
; ���������������������������������������������������������������������������

loc_657B5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5AC0j
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_657EC
		cmp	[bp+var_11E], 0
		jz	short loc_657EC
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_657EC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5AD9j
					; Midgame1_PlayPart1_5FCF0+5AE1j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	2
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_6583A
		cmp	[bp+var_10E], 0
		jz	short loc_6583A
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6583A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5B27j
					; Midgame1_PlayPart1_5FCF0+5B2Fj
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F9], 0
		jz	short loc_65888
		cmp	[bp+var_FE], 0
		jz	short loc_65888
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65888:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5B75j
					; Midgame1_PlayPart1_5FCF0+5B7Dj
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_658C7
		cmp	[bp+var_F4], 0
		jz	short loc_658C7
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_658C7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5BB4j
					; Midgame1_PlayPart1_5FCF0+5BBCj
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_65915
		cmp	[bp+var_E4], 0
		jz	short loc_65915
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65915:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5C02j
					; Midgame1_PlayPart1_5FCF0+5C0Aj
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_65954
		cmp	[bp+var_DA], 0
		jz	short loc_65954
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65954:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5C41j
					; Midgame1_PlayPart1_5FCF0+5C49j
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_65993
		cmp	[bp+var_D0], 0
		jz	short loc_65993
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65993:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5C80j
					; Midgame1_PlayPart1_5FCF0+5C88j
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_659D2
		cmp	[bp+var_C6], 0
		jz	short loc_659D2
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_659D2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5CBFj
					; Midgame1_PlayPart1_5FCF0+5CC7j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_65A11
		cmp	[bp+var_BC], 0
		jz	short loc_65A11
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65A11:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5CFEj
					; Midgame1_PlayPart1_5FCF0+5D06j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_65A5D
		cmp	[bp+var_DD0], 0
		jz	short loc_65A5D
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65A5D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5D4Aj
					; Midgame1_PlayPart1_5FCF0+5D52j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_65AAF
		cmp	[bp+var_DB6], 0
		jz	short loc_65AAF
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65AAF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5D9Cj
					; Midgame1_PlayPart1_5FCF0+5DA4j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_65AFB
		cmp	[bp+var_59C], 0
		jz	short loc_65AFB
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65AFB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5DE8j
					; Midgame1_PlayPart1_5FCF0+5DF0j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_65B3A
		cmp	[bp+var_AE], 0
		jz	short loc_65B3A
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65B3A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5E27j
					; Midgame1_PlayPart1_5FCF0+5E2Fj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_65C06
		cmp	[bp+var_7E], 0
		jz	short loc_65C06
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65C06:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5EF6j
					; Midgame1_PlayPart1_5FCF0+5EFDj
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_65C3E
		cmp	[bp+var_74], 0
		jz	short loc_65C3E
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65C3E:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5F2Ej
					; Midgame1_PlayPart1_5FCF0+5F35j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_65C76
		cmp	[bp+var_6A], 0
		jz	short loc_65C76
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65C76:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5F66j
					; Midgame1_PlayPart1_5FCF0+5F6Dj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_65CAE
		cmp	[bp+var_60], 0
		jz	short loc_65CAE
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65CAE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5F9Ej
					; Midgame1_PlayPart1_5FCF0+5FA5j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_65CE6
		cmp	[bp+var_56], 0
		jz	short loc_65CE6
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65CE6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5FD6j
					; Midgame1_PlayPart1_5FCF0+5FDDj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_65D3A
		cmp	[bp+var_40], 0
		jz	short loc_65D3A
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65D3A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+602Aj
					; Midgame1_PlayPart1_5FCF0+6031j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_65D81
		cmp	[bp+var_36], 0
		jz	short loc_65D81
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_65D81:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6071j
					; Midgame1_PlayPart1_5FCF0+6078j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_65E26:				; CODE XREF: Midgame1_PlayPart1_5FCF0+5AC2j
		mov	[bp+var_12E], 0
		mov	[bp+var_12A], 2
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		push	3
		lea	ax, [bp+var_12E]
		push	ax
		push	0
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_138], 0
		mov	[bp+var_134], 2
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		push	2
		lea	ax, [bp+var_138]
		push	ax
		push	2Dh ; '-'
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_13B], 0
		lea	ax, [bp+var_138]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_148], 0
		mov	[bp+var_144], 2
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, [bp+var_148]
		push	ax
		push	27h ; '''
		lea	ax, [bp+var_2AC]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_14B], 0
		lea	ax, [bp+var_148]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	ax, [bp+var_4C]
		mov	word ptr [bp+var_158+2], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_154], ax
		mov	ax, [bp+var_48]
		mov	word ptr [bp+var_152], ax
		mov	ax, [bp+var_46]
		mov	word ptr [bp+var_152+2], ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_158], ax
		lea	ax, [bp+var_3D4]
		push	ax
		push	word ptr [bp+var_158]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	word ptr [bp+var_E1B+3], 1218h
		mov	ax, [bp+var_154]
		mov	word ptr [bp+var_15C+2], ax
		mov	ax, word ptr [bp+var_152]
		mov	word ptr [bp+var_15C], ax
		mov	ax, word ptr [bp+var_152+2]
		mov	[bp+var_15E], ax
		mov	ax, word ptr [bp+var_158+2]
		mov	[bp+var_DFF], ax
		mov	ax, word ptr [bp+var_15C+2]
		mov	[bp+var_DFD], ax
		mov	ax, word ptr [bp+var_15C]
		mov	[bp+var_DFB], ax
		mov	ax, [bp+var_15E]
		mov	[bp+var_DF9], ax
		push	[bp+var_13E]
		mov	al, [bp+var_13C]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_14E]
		mov	al, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_74]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_160], ax
		push	[bp+var_160]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	0FFD8h
		push	1
		lea	ax, [bp+var_BC]
		push	ax
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	word ptr [bp+var_164+2], ax
		push	0
		push	[bp+var_18]
		push	[bp+var_16]
		lea	ax, [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_164], ax
		push	1
		push	[bp+var_1C]
		push	[bp+var_1A]
		lea	ax, [bp+var_C6]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_168+2], ax
		push	word ptr [bp+var_164]
		push	word ptr [bp+var_164+2]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_168+2]
		push	word ptr [bp+var_164+2]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_164+2]
		lea	ax, [bp+var_DF6]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0Eh
		push	0
		lea	ax, [bp+var_12E]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	word ptr [bp+var_164+2]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_1D], 0
		jnz	short loc_660A5
		jmp	loc_66180
; ���������������������������������������������������������������������������

loc_660A5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+63B0j
		mov	[bp+var_172+2],	0
		mov	byte ptr [bp+var_16E+2], 2
		mov	byte ptr [bp+var_16E+3], 0
		mov	dword ptr [bp-16Ah], 0
		push	2
		lea	ax, [bp+var_172+2]
		push	ax
		push	0
		lea	ax, [bp+var_39C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_172+2]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_DC6]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_66119
; ���������������������������������������������������������������������������

loc_660FA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+643Aj
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_DD9]
		and	ax, 1
		mov	word ptr [bp+var_172], ax
		mov	ax, word ptr [bp+var_172]
		mov	[si+1Bh], ax

loc_66119:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6408j
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_IsDone_84CC
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_660FA
		cmp	[bp+var_1D], 0
		jz	short loc_6613F
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_6613F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6440j
		cmp	byte ptr [bp+var_16E+3], 0
		jz	short loc_66167
		cmp	[bp+var_172+2],	0
		jz	short loc_66167
		push	0
		mov	al, byte ptr [bp+var_16E+2]
		push	ax
		lea	ax, [bp+var_172+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66167:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6454j
					; Midgame1_PlayPart1_5FCF0+645Cj
		mov	[bp+var_172+2],	0
		mov	byte ptr [bp+var_16E+3], 0
		mov	dword ptr [bp-16Ah], 0
		jmp	short loc_661D5
; ���������������������������������������������������������������������������

loc_66180:				; CODE XREF: Midgame1_PlayPart1_5FCF0+63B2j
		push	4
		lea	ax, [bp+var_3D4]
		push	ax
		call	sub_3139A
		add	sp, 4
		push	[bp+var_2]
		lea	ax, [bp+var_E1B+3]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	short loc_661BA
; ���������������������������������������������������������������������������

loc_661A1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+64E3j
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_DD9]
		and	ax, 1
		mov	di, ax
		mov	[si+1Bh], di

loc_661BA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+64AFj
		cmp	[bp+var_DD9], 1Eh
		jnb	short loc_661C8
		cmp	byte ptr [bp+var_DD7], 0
		jz	short loc_661CD

loc_661C8:				; CODE XREF: Midgame1_PlayPart1_5FCF0+64CFj
		mov	ax, 1
		jmp	short loc_661CF
; ���������������������������������������������������������������������������

loc_661CD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+64D6j
		xor	ax, ax

loc_661CF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+64DBj
		mov	ah, 0
		or	ax, ax
		jz	short loc_661A1

loc_661D5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+648Ej
		mov	word ptr [si+1Bh], 0
		mov	[bp+var_DD9], 0
		jmp	short loc_661EF
; ���������������������������������������������������������������������������

loc_661E2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6518j
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_661EF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+64F0j
		cmp	[bp+var_DD9], 5
		jnb	short loc_661FD
		cmp	byte ptr [bp+var_DD7], 0
		jz	short loc_66202

loc_661FD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6504j
		mov	ax, 1
		jmp	short loc_66204
; ���������������������������������������������������������������������������

loc_66202:				; CODE XREF: Midgame1_PlayPart1_5FCF0+650Bj
		xor	ax, ax

loc_66204:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6510j
		mov	ah, 0
		or	ax, ax
		jz	short loc_661E2
		lea	ax, [bp+var_E17+1]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_DF6]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_66230
		jmp	loc_6697C
; ���������������������������������������������������������������������������

loc_66230:				; CODE XREF: Midgame1_PlayPart1_5FCF0+653Bj
		push	2
		lea	ax, [bp+var_14E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_143], 0
		jz	short loc_66267
		cmp	[bp+var_148], 0
		jz	short loc_66267
		push	0
		mov	al, [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66267:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6554j
					; Midgame1_PlayPart1_5FCF0+655Cj
		mov	[bp+var_148], 0
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, [bp+var_13E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_133], 0
		jz	short loc_662B5
		cmp	[bp+var_138], 0
		jz	short loc_662B5
		push	0
		mov	al, [bp+var_134]
		push	ax
		lea	ax, [bp+var_138]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_662B5:				; CODE XREF: Midgame1_PlayPart1_5FCF0+65A2j
					; Midgame1_PlayPart1_5FCF0+65AAj
		mov	[bp+var_138], 0
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		cmp	[bp+var_129], 0
		jz	short loc_662F4
		cmp	[bp+var_12E], 0
		jz	short loc_662F4
		push	0
		mov	al, [bp+var_12A]
		push	ax
		lea	ax, [bp+var_12E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_662F4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+65E1j
					; Midgame1_PlayPart1_5FCF0+65E9j
		mov	[bp+var_12E], 0
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_66342
		cmp	[bp+var_11E], 0
		jz	short loc_66342
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66342:				; CODE XREF: Midgame1_PlayPart1_5FCF0+662Fj
					; Midgame1_PlayPart1_5FCF0+6637j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	2
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_66390
		cmp	[bp+var_10E], 0
		jz	short loc_66390
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66390:				; CODE XREF: Midgame1_PlayPart1_5FCF0+667Dj
					; Midgame1_PlayPart1_5FCF0+6685j
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F9], 0
		jz	short loc_663DE
		cmp	[bp+var_FE], 0
		jz	short loc_663DE
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_663DE:				; CODE XREF: Midgame1_PlayPart1_5FCF0+66CBj
					; Midgame1_PlayPart1_5FCF0+66D3j
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_6641D
		cmp	[bp+var_F4], 0
		jz	short loc_6641D
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6641D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+670Aj
					; Midgame1_PlayPart1_5FCF0+6712j
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_6646B
		cmp	[bp+var_E4], 0
		jz	short loc_6646B
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6646B:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6758j
					; Midgame1_PlayPart1_5FCF0+6760j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_664AA
		cmp	[bp+var_DA], 0
		jz	short loc_664AA
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_664AA:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6797j
					; Midgame1_PlayPart1_5FCF0+679Fj
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_664E9
		cmp	[bp+var_D0], 0
		jz	short loc_664E9
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_664E9:				; CODE XREF: Midgame1_PlayPart1_5FCF0+67D6j
					; Midgame1_PlayPart1_5FCF0+67DEj
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_66528
		cmp	[bp+var_C6], 0
		jz	short loc_66528
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66528:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6815j
					; Midgame1_PlayPart1_5FCF0+681Dj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_66567
		cmp	[bp+var_BC], 0
		jz	short loc_66567
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66567:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6854j
					; Midgame1_PlayPart1_5FCF0+685Cj
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_665B3
		cmp	[bp+var_DD0], 0
		jz	short loc_665B3
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_665B3:				; CODE XREF: Midgame1_PlayPart1_5FCF0+68A0j
					; Midgame1_PlayPart1_5FCF0+68A8j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_66605
		cmp	[bp+var_DB6], 0
		jz	short loc_66605
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66605:				; CODE XREF: Midgame1_PlayPart1_5FCF0+68F2j
					; Midgame1_PlayPart1_5FCF0+68FAj
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_66651
		cmp	[bp+var_59C], 0
		jz	short loc_66651
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66651:				; CODE XREF: Midgame1_PlayPart1_5FCF0+693Ej
					; Midgame1_PlayPart1_5FCF0+6946j
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_66690
		cmp	[bp+var_AE], 0
		jz	short loc_66690
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66690:				; CODE XREF: Midgame1_PlayPart1_5FCF0+697Dj
					; Midgame1_PlayPart1_5FCF0+6985j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_6675C
		cmp	[bp+var_7E], 0
		jz	short loc_6675C
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6675C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6A4Cj
					; Midgame1_PlayPart1_5FCF0+6A53j
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_66794
		cmp	[bp+var_74], 0
		jz	short loc_66794
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66794:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6A84j
					; Midgame1_PlayPart1_5FCF0+6A8Bj
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_667CC
		cmp	[bp+var_6A], 0
		jz	short loc_667CC
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_667CC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6ABCj
					; Midgame1_PlayPart1_5FCF0+6AC3j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_66804
		cmp	[bp+var_60], 0
		jz	short loc_66804
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66804:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6AF4j
					; Midgame1_PlayPart1_5FCF0+6AFBj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_6683C
		cmp	[bp+var_56], 0
		jz	short loc_6683C
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6683C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6B2Cj
					; Midgame1_PlayPart1_5FCF0+6B33j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_66890
		cmp	[bp+var_40], 0
		jz	short loc_66890
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66890:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6B80j
					; Midgame1_PlayPart1_5FCF0+6B87j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_668D7
		cmp	[bp+var_36], 0
		jz	short loc_668D7
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_668D7:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6BC7j
					; Midgame1_PlayPart1_5FCF0+6BCEj
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6697C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+653Dj
		lea	ax, [bp+var_5A0]
		push	ax
		lea	ax, [bp+var_DD4]
		push	ax
		mov	al, [bp+var_1F]
		push	ax
		lea	ax, [bp+var_592]
		push	ax
		lea	ax, [bp+var_DC6]
		push	ax
		lea	ax, [bp+var_39C]
		push	ax
		lea	ax, [bp+var_324]
		push	ax
		lea	ax, [bp+var_2AC]
		push	ax
		lea	ax, [bp+var_12E]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		lea	ax, [bp+var_3EE]
		push	ax
		lea	ax, [bp+var_3BC]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_EA]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		lea	ax, [bp+var_3D4]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_1D6]
		push	ax
		call	Stub_Midgame1_PlayPart2_423E0
		add	sp, 4Ch
		push	2
		lea	ax, [bp+var_14E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_143], 0
		jz	short loc_66A6F
		cmp	[bp+var_148], 0
		jz	short loc_66A6F
		push	0
		mov	al, [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66A6F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6D5Cj
					; Midgame1_PlayPart1_5FCF0+6D64j
		mov	[bp+var_148], 0
		mov	[bp+var_143], 0
		mov	[bp+var_142], 0
		push	2
		lea	ax, [bp+var_13E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_133], 0
		jz	short loc_66ABD
		cmp	[bp+var_138], 0
		jz	short loc_66ABD
		push	0
		mov	al, [bp+var_134]
		push	ax
		lea	ax, [bp+var_138]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66ABD:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6DAAj
					; Midgame1_PlayPart1_5FCF0+6DB2j
		mov	[bp+var_138], 0
		mov	[bp+var_133], 0
		mov	[bp+var_132], 0
		cmp	[bp+var_129], 0
		jz	short loc_66AFC
		cmp	[bp+var_12E], 0
		jz	short loc_66AFC
		push	0
		mov	al, [bp+var_12A]
		push	ax
		lea	ax, [bp+var_12E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66AFC:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6DE9j
					; Midgame1_PlayPart1_5FCF0+6DF1j
		mov	[bp+var_12E], 0
		mov	[bp+var_129], 0
		mov	[bp+var_128], 0
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_66B4A
		cmp	[bp+var_11E], 0
		jz	short loc_66B4A
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66B4A:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6E37j
					; Midgame1_PlayPart1_5FCF0+6E3Fj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	2
		lea	ax, [bp+var_114]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_109], 0
		jz	short loc_66B98
		cmp	[bp+var_10E], 0
		jz	short loc_66B98
		push	0
		mov	al, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66B98:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6E85j
					; Midgame1_PlayPart1_5FCF0+6E8Dj
		mov	[bp+var_10E], 0
		mov	[bp+var_109], 0
		mov	[bp+var_108], 0
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F9], 0
		jz	short loc_66BE6
		cmp	[bp+var_FE], 0
		jz	short loc_66BE6
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66BE6:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6ED3j
					; Midgame1_PlayPart1_5FCF0+6EDBj
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_66C25
		cmp	[bp+var_F4], 0
		jz	short loc_66C25
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66C25:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6F12j
					; Midgame1_PlayPart1_5FCF0+6F1Aj
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	[bp+var_EE], 0
		push	2
		lea	ax, [bp+var_EA]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_DF], 0
		jz	short loc_66C73
		cmp	[bp+var_E4], 0
		jz	short loc_66C73
		push	0
		mov	al, [bp+var_E0]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66C73:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6F60j
					; Midgame1_PlayPart1_5FCF0+6F68j
		mov	[bp+var_E4], 0
		mov	[bp+var_DF], 0
		mov	[bp+var_DE], 0
		cmp	[bp+var_D5], 0
		jz	short loc_66CB2
		cmp	[bp+var_DA], 0
		jz	short loc_66CB2
		push	0
		mov	al, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66CB2:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6F9Fj
					; Midgame1_PlayPart1_5FCF0+6FA7j
		mov	[bp+var_DA], 0
		mov	[bp+var_D5], 0
		mov	[bp+var_D4], 0
		cmp	[bp+var_CB], 0
		jz	short loc_66CF1
		cmp	[bp+var_D0], 0
		jz	short loc_66CF1
		push	0
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66CF1:				; CODE XREF: Midgame1_PlayPart1_5FCF0+6FDEj
					; Midgame1_PlayPart1_5FCF0+6FE6j
		mov	[bp+var_D0], 0
		mov	[bp+var_CB], 0
		mov	[bp+var_CA], 0
		cmp	[bp+var_C1], 0
		jz	short loc_66D30
		cmp	[bp+var_C6], 0
		jz	short loc_66D30
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66D30:				; CODE XREF: Midgame1_PlayPart1_5FCF0+701Dj
					; Midgame1_PlayPart1_5FCF0+7025j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		cmp	[bp+var_B7], 0
		jz	short loc_66D6F
		cmp	[bp+var_BC], 0
		jz	short loc_66D6F
		push	0
		mov	al, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66D6F:				; CODE XREF: Midgame1_PlayPart1_5FCF0+705Cj
					; Midgame1_PlayPart1_5FCF0+7064j
		mov	[bp+var_BC], 0
		mov	[bp+var_B7], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_DD4]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_DCB], 0
		jz	short loc_66DBB
		cmp	[bp+var_DD0], 0
		jz	short loc_66DBB
		push	0
		mov	al, [bp+var_DCC]
		push	ax
		lea	ax, [bp+var_DD0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66DBB:				; CODE XREF: Midgame1_PlayPart1_5FCF0+70A8j
					; Midgame1_PlayPart1_5FCF0+70B0j
		mov	[bp+var_DD0], 0
		mov	[bp+var_DCB], 0
		mov	[bp+var_DCA], 0
		mov	[bp+var_DC6], 185Fh
		lea	ax, [bp+var_DC6]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_DB1], 0
		jz	short loc_66E0D
		cmp	[bp+var_DB6], 0
		jz	short loc_66E0D
		push	0
		mov	al, [bp+var_DB2]
		push	ax
		lea	ax, [bp+var_DB6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66E0D:				; CODE XREF: Midgame1_PlayPart1_5FCF0+70FAj
					; Midgame1_PlayPart1_5FCF0+7102j
		mov	[bp+var_DB6], 0
		mov	[bp+var_DB1], 0
		mov	[bp+var_DB0], 0
		lea	ax, [bp+var_5A0]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_597], 0
		jz	short loc_66E59
		cmp	[bp+var_59C], 0
		jz	short loc_66E59
		push	0
		mov	al, [bp+var_598]
		push	ax
		lea	ax, [bp+var_59C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66E59:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7146j
					; Midgame1_PlayPart1_5FCF0+714Ej
		mov	[bp+var_59C], 0
		mov	[bp+var_597], 0
		mov	[bp+var_596], 0
		cmp	[bp+var_A9], 0
		jz	short loc_66E98
		cmp	[bp+var_AE], 0
		jz	short loc_66E98
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66E98:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7185j
					; Midgame1_PlayPart1_5FCF0+718Dj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	6
		push	0Ah
		lea	ax, [bp+var_592]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_556]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_4DE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_466]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_79], 0
		jz	short loc_66F64
		cmp	[bp+var_7E], 0
		jz	short loc_66F64
		push	0
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66F64:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7254j
					; Midgame1_PlayPart1_5FCF0+725Bj
		mov	[bp+var_7E], 0
		mov	[bp+var_79], 0
		mov	[bp+var_78], 0
		cmp	[bp+var_6F], 0
		jz	short loc_66F9C
		cmp	[bp+var_74], 0
		jz	short loc_66F9C
		push	0
		mov	al, [bp+var_70]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66F9C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+728Cj
					; Midgame1_PlayPart1_5FCF0+7293j
		mov	[bp+var_74], 0
		mov	[bp+var_6F], 0
		mov	[bp+var_6E], 0
		cmp	[bp+var_65], 0
		jz	short loc_66FD4
		cmp	[bp+var_6A], 0
		jz	short loc_66FD4
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_66FD4:				; CODE XREF: Midgame1_PlayPart1_5FCF0+72C4j
					; Midgame1_PlayPart1_5FCF0+72CBj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		cmp	[bp+var_5B], 0
		jz	short loc_6700C
		cmp	[bp+var_60], 0
		jz	short loc_6700C
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6700C:				; CODE XREF: Midgame1_PlayPart1_5FCF0+72FCj
					; Midgame1_PlayPart1_5FCF0+7303j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		cmp	[bp+var_51], 0
		jz	short loc_67044
		cmp	[bp+var_56], 0
		jz	short loc_67044
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67044:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7334j
					; Midgame1_PlayPart1_5FCF0+733Bj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		lea	ax, [bp+var_3EC]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_3D4]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_67098
		cmp	[bp+var_40], 0
		jz	short loc_67098
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67098:				; CODE XREF: Midgame1_PlayPart1_5FCF0+7388j
					; Midgame1_PlayPart1_5FCF0+738Fj
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_670DF
		cmp	[bp+var_36], 0
		jz	short loc_670DF
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_670DF:				; CODE XREF: Midgame1_PlayPart1_5FCF0+73CFj
					; Midgame1_PlayPart1_5FCF0+73D6j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_39C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_324]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2AC]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_26]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Midgame1_PlayPart1_5FCF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Destructeur (entrée 0 de la table de méthodes dseg 1DADh) de la police
; à pixels translucides des titres de mid1 : remet la table de méthodes (mov word ptr [si],
; 1DADh), appelle GlyphObject_ScalarDeletingDtorA_313D6, libère l'objet si le bit 0 de arg_2
; est mis.
; ==============================================================================================
TranslucentFont_Destruct_67184	proc far		; CODE XREF: sub_423B0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_671B1
		mov	word ptr [si], 1DADh
		push	0
		push	si
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		test	di, 1
		jz	short loc_671B1
		push	si
		call	sub_308
		add	sp, 2

loc_671B1:				; CODE XREF: TranslucentFont_Destruct_67184+Dj
					; TranslucentFont_Destruct_67184+22j
		pop	di
		pop	si
		pop	bp
		retf
TranslucentFont_Destruct_67184	endp

ovr196		ends
