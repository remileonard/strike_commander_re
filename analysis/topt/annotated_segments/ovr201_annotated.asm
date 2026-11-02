ovr201		segment	para public 'OVERLAY' use16
		assume cs:ovr201
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (1 sur
; 1), à Midgame1_PlayPart2_671C0 (sub_671C0 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, 6 751 lignes, LUE 2026-10-17 ligne à ligne. Seconde moitié de la
; cinématique mid1 (scènes 9 à 25 de analysis/MIDGAME_SYSTEM.md § 9), 17 scènes, appelée par
; Midgame1_PlayPart1_5FCF0 qui lui passe 38 arguments : surface, tableaux SPOK et MG01,
; palette principale, rectangle des sous-titres, police, calques et palettes communs (optshps
; 116 et 44, midgames 19 et 20, mid1 0, 1, 6, 11, 12, 26 ; palettes optpals 21 et 24, midgames
; 22, mid1 38, 39, 42, 44, 45, 59, « normal »), image hors écran, archives mid1, midgames et
; mid1voc, lecteur de voix, effets, canaux d'effets et de musique. Contenu : tête parlante «
; air » (« pri » dans optest.asm : octets modifiés par Rémi, « air » à l'origine) (scènes 9 et
; 18), composition avec poursuite (scène 10), animations seules ou enchaînées (11, 12, 13),
; défilement horizontal à deux vitesses (14), animation 17 et ses animations enfants (15),
; dialogues sur parent tremblant avec bouche par parité du compteur (16, 21, 23) et plans
; tremblants parlés (22, 24), finale en 4 phases avec arrêt de la musique
; (AIL_stop_sequence_30C48), sub_28D24 sur rmusic/amusic.pak et 23, attente de 120 tics et
; ouverture du cadre en 25 étapes (lignes 24 − s à 151 + 2 × s). Sortie anticipée si
; byte_495FC.
; ==============================================================================================
Midgame1_PlayPart2_70290		proc far

var_246		= word ptr -246h
var_244		= word ptr -244h
var_242		= word ptr -242h
var_240		= word ptr -240h
var_236		= word ptr -236h
var_1E4		= word ptr -1E4h
var_1E2		= word ptr -1E2h
var_162		= word ptr -162h
var_160		= word ptr -160h
var_15C		= word ptr -15Ch
var_15A		= word ptr -15Ah
var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_14E		= word ptr -14Eh
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_148		= word ptr -148h
var_146		= word ptr -146h
var_145		= word ptr -145h
var_144		= word ptr -144h
var_140		= word ptr -140h
var_13E		= word ptr -13Eh
var_132		= word ptr -132h
var_123		= word ptr -123h
var_121		= byte ptr -121h
var_11E		= word ptr -11Eh
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= word ptr -0C6h
var_C4		= word ptr -0C4h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= word ptr -0A2h
var_A0		= dword ptr -0A0h
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8E		= dword ptr -8Eh
var_8A		= word ptr -8Ah
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_82		= dword ptr -82h
var_80		= dword ptr -80h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_78		= dword ptr -78h
var_76		= dword ptr -76h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_68		= dword ptr -68h
var_66		= dword ptr -66h
var_64		= dword ptr -64h
var_62		= dword ptr -62h
var_60		= dword ptr -60h
var_5E		= dword ptr -5Eh
var_5C		= dword ptr -5Ch
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_47		= byte ptr -47h
var_46		= word ptr -46h
var_44		= byte ptr -44h
var_43		= word ptr -43h
var_40		= dword ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_29		= word ptr -29h
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= byte ptr  18h
arg_14		= word ptr  1Ah
arg_16		= word ptr  1Ch
arg_18		= word ptr  1Eh
arg_1A		= word ptr  20h
arg_1C		= word ptr  22h
arg_1E		= word ptr  24h
arg_20		= word ptr  26h
arg_22		= word ptr  28h
arg_24		= word ptr  2Ah
arg_26		= word ptr  2Ch
arg_28		= word ptr  2Eh
arg_2A		= word ptr  30h
arg_2C		= word ptr  32h
arg_2E		= word ptr  34h
arg_36		= word ptr  3Ch
arg_38		= word ptr  3Eh
arg_3A		= word ptr  40h
arg_3C		= word ptr  42h
arg_3E		= word ptr  44h
arg_40		= word ptr  46h
arg_42		= word ptr  48h
arg_44		= word ptr  4Ah
arg_46		= byte ptr  4Ch
arg_48		= word ptr  4Eh
arg_4A		= word ptr  50h

		push	bp
		mov	bp, sp
		sub	sp, 236h
		push	si
		push	di
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	al, byte_4CA58
		mov	[bp+var_C], al
		mov	[bp+var_E], 0FFFBh
		mov	[bp+var_10], 0
		mov	[bp+var_12], 6
		mov	[bp+var_14], 0
		mov	[bp+var_16], 0FFF9h
		mov	[bp+var_18], 0
		mov	[bp+var_1A], 7
		mov	[bp+var_1C], 0
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	2Bh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_29], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	[bp+var_246], ax
		mov	ax, [di+2]
		mov	[bp+var_244], ax
		mov	ax, [di+4]
		mov	[bp+var_242], ax
		mov	ax, [di+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	3
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	263Eh
		call	ConvData_LoadByName_10C87
		add	sp, 6
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_14]
		mov	word ptr [bp+var_56+2], ax
		mov	bx, word ptr [bp+var_56+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_56], ax
		push	word ptr [bp+var_56]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1
		push	0
		push	0
		push	[bp+arg_E]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_58], ax
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	word ptr [bp+var_5A], ax
		push	27h
		push	7Fh
		push	0A0h
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	1Fh
		push	word ptr [bp+var_5A]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	word ptr [bp+var_5A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5C]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+arg_12], 0
		jnz	short loc_70486
		jmp	loc_70545

loc_70486:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	4
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	2642h
		push	word ptr [bp+var_5A]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4
		jmp	short loc_704ED

loc_704E0:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_704ED:
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_704E0
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_62+1], 0
		jz	short loc_7052F
		cmp	[bp+var_66], 0
		jz	short loc_7052F
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7052F

loc_7052F:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		jmp	short loc_705A7

loc_70545:
		push	0E0h
		push	[bp+arg_A]
		mov	bx, [bp+arg_A]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	si, [bp+arg_2]
		mov	ax, [si+2]
		add	ax, [bx]
		push	ax
		lea	ax, [bp+var_162]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		push	266Ch
		push	word ptr [bp+var_5A]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4
		jmp	short loc_7058C

loc_7057F:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7058C:
		cmp	[bp+var_123], 1Eh
		jnb	short loc_7059A
		cmp	[bp+var_121], 0
		jz	short loc_7059F

loc_7059A:
		mov	ax, 1
		jmp	short loc_705A1

loc_7059F:
		xor	ax, ax

loc_705A1:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7057F

loc_705A7:
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_705CD
		jmp	loc_7064D

loc_705CD:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_705FD
		cmp	[bp+var_26], 0
		jz	short loc_705FD
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_705FD

loc_705FD:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_70635
		cmp	[bp+var_A], 0
		jz	short loc_70635
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70635

loc_70635:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_7064D:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	[bp+arg_12], 0
		jz	short loc_7068F
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0Ah
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_706B4

loc_7068F:
		cmp	[bp+arg_46], 0
		jz	short loc_706B4
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 1Eh
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_706B4:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	36h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_6A+1], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_6E+2]
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_16]
		mov	word ptr [bp+var_6E], ax
		mov	bx, word ptr [bp+var_6E]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_6E]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_6E]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_70], ax
		push	word ptr [bp+var_70]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_7A], 0
		mov	byte ptr [bp+var_76], 2
		mov	byte ptr [bp+var_76+1], 0
		mov	[bp+var_74], 0
		push	3
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	14h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_7E], ax
		or	ax, ax
		jz	short loc_707F4
		push	0FFD8h
		push	0
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	word ptr [bp+var_7E]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx], 13DCh
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+0Ah], 13FCh
		mov	bx, word ptr [bp+var_7E]
		mov	byte ptr [bx+1Dh], 0
		mov	ax, word ptr [bp+var_7E]
		jmp	short loc_707F7

loc_707F4:
		mov	ax, word ptr [bp+var_7E]

loc_707F7:
		mov	word ptr [bp+var_7E+2], ax
		push	word ptr [bp+var_7E+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0FFE8h
		push	0
		push	[bp+arg_E]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_80], ax
		push	word ptr [bp+var_80]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	28h
		push	9Fh
		push	[bp+arg_18]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_82], ax
		push	word ptr [bp+var_82]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	6Ch
		push	63h
		push	[bp+arg_1A]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_84], ax
		push	word ptr [bp+var_84]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	6Bh
		push	0C3h
		push	[bp+arg_1A]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_88+2], ax
		push	word ptr [bp+var_88+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	7
		push	16h
		push	87h
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_88], ax
		push	word ptr [bp+var_88]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	10h
		push	16h
		push	0B9h
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_8A], ax
		push	[bp+var_8A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	15h
		push	26h
		push	0A0h
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_8E+2], ax
		push	word ptr [bp+var_8E+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	16h
		push	6Dh
		push	0A9h
		push	[bp+arg_18]
		push	0
		call	ClippedMovingImageLayer_Construct_FCAF
		add	sp, 0Ah
		mov	word ptr [bp+var_8E], ax
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+21h], 83h
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+23h], 9
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+27h], 43h
		push	word ptr [bp+var_8E]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	17h
		push	6Dh
		push	0A9h
		push	[bp+arg_18]
		push	0
		call	ClippedMovingImageLayer_Construct_FCAF
		add	sp, 0Ah
		mov	[bp+var_90], ax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+21h], 83h
		mov	bx, [bp+var_90]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_90]
		mov	word ptr [bx+25h], 0BEh
		mov	bx, [bp+var_90]
		mov	word ptr [bx+27h], 43h
		push	[bp+var_90]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	18h
		push	28h
		push	9Fh
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_94+2], ax
		push	word ptr [bp+var_94+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Ah
		push	11h
		push	8Ah
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_94], ax
		push	word ptr [bp+var_94]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Bh
		push	3Fh
		push	8Ch
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_98+2], ax
		push	word ptr [bp+var_98+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Ch
		push	3Fh
		push	0B2h
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_98], ax
		push	word ptr [bp+var_98]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_16]
		push	word ptr [bx]
		mov	bx, [bp+arg_16]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_16]
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_9A], 10h
		mov	word ptr [bp+var_9E+2], 7
		lea	ax, [bp+var_1E4]
		push	ss
		push	ax
		push	ds
		push	offset unk_4AF18
		mov	cx, 0A4h
		call	CRT_Fmemcpy
		mov	eax, dword_4AFBC
		mov	[bp+var_A0], eax
		mov	si, 25E0h
		lea	di, [bp+var_236]
		push	ss
		pop	es
		mov	cx, 29h
		rep movsw
		cmp	[bp+arg_12], 0
		jz	short loc_70ACF
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4

loc_70ACF:
		cmp	[bp+arg_46], 0
		jz	short loc_70AF5
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_70AF5
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_70AF5

loc_70AF5:
		jmp	loc_70D22

loc_70AF8:
		test	[bp+var_123], 1
		jz	short loc_70B4C
		inc	[bp+var_9A]
		mov	ax, [bp+var_9A]
		cmp	ax, 15h
		jnz	short loc_70B13
		mov	[bp+var_9A], 10h

loc_70B13:
		mov	ax, [bp+var_9A]
		mov	[bp+var_A2], ax
		mov	bx, [bp+var_8A]
		mov	ax, [bp+var_A2]
		mov	[bx+1Bh], ax
		inc	word ptr [bp+var_9E+2]
		mov	ax, word ptr [bp+var_9E+2]
		cmp	ax, 10h
		jnz	short loc_70B39
		mov	word ptr [bp+var_9E+2], 7

loc_70B39:
		mov	ax, word ptr [bp+var_9E+2]
		mov	word ptr [bp+var_A6+2], ax
		mov	bx, word ptr [bp+var_88]
		mov	ax, word ptr [bp+var_A6+2]
		mov	[bx+1Bh], ax

loc_70B4C:
		mov	bx, [bp+var_123]
		shl	bx, 2
		lea	ax, [bp+var_1E4]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_A0]
		mov	word ptr [bp+var_A6], ax
		mov	bx, [bp+var_123]
		shl	bx, 2
		lea	ax, [bp+var_1E2]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_9E]
		mov	word ptr [bp+var_AA+2], ax
		mov	bx, word ptr [bp+var_8E]
		mov	ax, word ptr [bp+var_A6]
		mov	[bx+0Ch], ax
		mov	bx, word ptr [bp+var_8E]
		mov	ax, word ptr [bp+var_AA+2]
		mov	[bx+0Eh], ax
		cmp	[bp+var_123], 8
		jnb	short loc_70BCE
		cmp	word_4B012, 0B9h
		jge	short loc_70BA7
		cmp	word_4B012, 88h
		jg	short loc_70BB2

loc_70BA7:
		mov	dx, 0FFFFh
		mov	ax, word_4B016
		imul	dx
		mov	word_4B016, ax

loc_70BB2:
		cmp	word_4B014, 3Eh
		jge	short loc_70BC0
		cmp	word_4B014, 0Eh
		jg	short loc_70BCB

loc_70BC0:
		mov	dx, 0FFFFh
		mov	ax, word_4B018
		imul	dx
		mov	word_4B018, ax

loc_70BCB:
		jmp	loc_70C61

loc_70BCE:
		mov	bx, [bp+var_123]
		shl	bx, 2
		lea	ax, [bp+var_1E4]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_A0]
		sub	ax, word_4B012
		mov	word_4B016, ax
		mov	bx, [bp+var_123]
		shl	bx, 2
		lea	ax, [bp+var_1E2]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_9E]
		sub	ax, word_4B014
		mov	word_4B018, ax
		cmp	[bp+var_123], 12h
		jnb	short loc_70C21
		mov	ax, word_4B016
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	word_4B016, ax
		mov	ax, word_4B018
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	word_4B018, ax
		jmp	short loc_70C61

loc_70C21:
		test	[bp+var_123], 1
		jz	short loc_70C46
		mov	bx, [bp+var_90]
		mov	word ptr [bx+1Bh], 17h
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+1Bh], 16h
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+1Bh], 15h
		jmp	short loc_70C61

loc_70C46:
		mov	bx, [bp+var_90]
		mov	word ptr [bx+1Bh], 19h
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+1Bh], 19h
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+1Bh], 19h

loc_70C61:
		mov	ax, word_4B016
		add	word_4B012, ax
		mov	ax, word_4B018
		add	word_4B014, ax
		mov	si, word_4B012
		mov	di, word_4B014
		mov	bx, [bp+var_90]
		mov	[bx+0Ch], si
		mov	bx, [bp+var_90]
		mov	[bx+0Eh], di
		mov	bx, [bp+var_123]
		shl	bx, 1
		lea	ax, [bp+var_236]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_AA], ax
		mov	bx, word ptr [bp+var_82]
		mov	ax, word ptr [bp+var_AA]
		mov	[bx+1Bh], ax
		mov	bx, [bp+var_123]
		shl	bx, 1
		lea	ax, [bp+var_236]
		add	bx, ax
		cmp	word ptr [bx], 3
		jle	short loc_70CBE
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_70CE3

loc_70CBE:
		mov	bx, [bp+var_123]
		shl	bx, 1
		lea	ax, [bp+var_236]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_70CDA
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+1Bh], 2
		jmp	short loc_70CE3

loc_70CDA:
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+1Bh], 0

loc_70CE3:
		mov	ax, word_4B01A
		add	word_4B01C, ax
		cmp	word_4B01C, 5
		jge	short loc_70CF8
		cmp	word_4B01C, 3
		jg	short loc_70D03

loc_70CF8:
		mov	dx, 0FFFFh
		mov	ax, word_4B01A
		imul	dx
		mov	word_4B01A, ax

loc_70D03:
		mov	ax, word_4B01C
		mov	word ptr [bp+var_AC], ax
		mov	bx, word ptr [bp+var_88+2]
		mov	ax, word ptr [bp+var_AC]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_70D22:
		cmp	[bp+var_123], 28h
		jnb	short loc_70D30
		cmp	[bp+var_121], 0
		jz	short loc_70D35

loc_70D30:
		mov	ax, 1
		jmp	short loc_70D37

loc_70D35:
		xor	ax, ax

loc_70D37:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_70D40
		jmp	loc_70AF8

loc_70D40:
		cmp	[bp+arg_12], 0
		jz	short loc_70D51
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_70D51:
		cmp	[bp+arg_46], 0
		jz	short loc_70D62
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_70D62:
		cmp	byte ptr [bp+var_76+1], 0
		jz	short loc_70D86
		cmp	[bp+var_7A], 0
		jz	short loc_70D86
		push	0
		mov	al, byte ptr [bp+var_76]
		push	ax
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70D86

loc_70D86:
		mov	[bp+var_7A], 0
		mov	byte ptr [bp+var_76+1], 0
		mov	[bp+var_74], 0
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_62+1], 0
		jz	short loc_70DCA
		cmp	[bp+var_66], 0
		jz	short loc_70DCA
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70DCA

loc_70DCA:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_70E11
		cmp	[bp+var_5C], 0
		jz	short loc_70E11
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70E11

loc_70E11:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	[bp+arg_0]
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	3
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	18h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	3Ah
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_6A+1], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_6E+2]
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		jmp	short loc_70F13

loc_70F06:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_70F13:
		push	si
		call	AnimLayer_IsFinished_346A0
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_70F06
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_62+1], 0
		jz	short loc_70F52
		cmp	[bp+var_66], 0
		jz	short loc_70F52
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70F52

loc_70F52:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_70F8A
		cmp	[bp+var_5C], 0
		jz	short loc_70F8A
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70F8A

loc_70F8A:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_70FB7
		jmp	loc_71037

loc_70FB7:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_70FE7
		cmp	[bp+var_26], 0
		jz	short loc_70FE7
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_70FE7

loc_70FE7:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_7101F
		cmp	[bp+var_A], 0
		jz	short loc_7101F
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7101F

loc_7101F:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_71037:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	[bp+arg_12], 0
		jz	short loc_71079
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0Bh
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_7109E

loc_71079:
		cmp	[bp+arg_46], 0
		jz	short loc_7109E
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 28h
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_7109E:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	31h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_6A+1], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	di, [bp+arg_1C]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_1E]
		mov	word ptr [bp+var_6E], ax
		mov	bx, word ptr [bp+var_6E]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_6E]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_6E]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_6E+2]
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_70], ax
		push	word ptr [bp+var_70]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_7A], 0
		mov	byte ptr [bp+var_76], 2
		mov	byte ptr [bp+var_76+1], 0
		mov	[bp+var_74], 0
		push	3
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	10h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_84], 0
		mov	byte ptr [bp+var_80], 2
		mov	byte ptr [bp+var_80+1], 0
		mov	[bp+var_7E], 0
		push	3
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	12h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_88+2], ax
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	loc_712A5

loc_7121D:
		cmp	[bp+var_123], 14h
		jnz	short loc_71253
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	si, si
		jz	short loc_71242
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_71242

loc_71242:
		push	word ptr [bp+var_88+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_71253:
		cmp	[bp+var_123], 0Fh
		jnz	short loc_71298
		cmp	[bp+arg_12], 0
		jz	short loc_71272
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_71298

loc_71272:
		cmp	[bp+arg_46], 0
		jz	short loc_71298
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_71298
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_71298

loc_71298:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_712A5:
		cmp	[bp+var_123], 29h
		jnb	short loc_712B3
		cmp	[bp+var_121], 0
		jz	short loc_712B8

loc_712B3:
		mov	ax, 1
		jmp	short loc_712BA

loc_712B8:
		xor	ax, ax

loc_712BA:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_712C3
		jmp	loc_7121D

loc_712C3:
		cmp	[bp+arg_12], 0
		jz	short loc_712D4
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_712D4:
		cmp	[bp+arg_46], 0
		jz	short loc_712E5
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_712E5:
		cmp	byte ptr [bp+var_80+1], 0
		jz	short loc_7130B
		cmp	[bp+var_84], 0
		jz	short loc_7130B
		push	0
		mov	al, byte ptr [bp+var_80]
		push	ax
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7130B

loc_7130B:
		mov	[bp+var_84], 0
		mov	byte ptr [bp+var_80+1], 0
		mov	[bp+var_7E], 0
		cmp	byte ptr [bp+var_76+1], 0
		jz	short loc_71344
		cmp	[bp+var_7A], 0
		jz	short loc_71344
		push	0
		mov	al, byte ptr [bp+var_76]
		push	ax
		lea	ax, word ptr [bp+var_7A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71344

loc_71344:
		mov	[bp+var_7A], 0
		mov	byte ptr [bp+var_76+1], 0
		mov	[bp+var_74], 0
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_62+1], 0
		jz	short loc_71388
		cmp	[bp+var_66], 0
		jz	short loc_71388
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71388

loc_71388:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_713CF
		cmp	[bp+var_5C], 0
		jz	short loc_713CF
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_713CF

loc_713CF:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	byte_4F55C, 0
		jnz	short loc_713ED
		jmp	loc_7146D

loc_713ED:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_7141D
		cmp	[bp+var_26], 0
		jz	short loc_7141D
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7141D

loc_7141D:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_71455
		cmp	[bp+var_A], 0
		jz	short loc_71455
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71455

loc_71455:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_7146D:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	[bp+arg_12], 0
		jz	short loc_714AF
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0Ch
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_714D4

loc_714AF:
		cmp	[bp+arg_46], 0
		jz	short loc_714D4
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 32h
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_714D4:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_5E], ax
		push	word ptr [bp+var_5E]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_64], 2
		mov	byte ptr [bp+var_64+1], 0
		mov	[bp+var_62], 0
		push	3
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	0Fh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_715AE

loc_7155C:
		cmp	[bp+var_123], 16h
		jnz	short loc_715A1
		cmp	[bp+arg_12], 0
		jz	short loc_7157B
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_715A1

loc_7157B:
		cmp	[bp+arg_46], 0
		jz	short loc_715A1
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_715A1
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_715A1

loc_715A1:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_715AE:
		push	si
		call	AnimLayer_IsFinished_346A0
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_7155C
		cmp	byte ptr [bp+var_64+1], 0
		jz	short loc_715E1
		cmp	[bp+var_68], 0
		jz	short loc_715E1
		push	0
		mov	al, byte ptr [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_715E1

loc_715E1:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_64+1], 0
		mov	[bp+var_62], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_7160E
		jmp	loc_716C6

loc_7160E:
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_71632
		cmp	[bp+var_5C], 0
		jz	short loc_71632
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71632

loc_71632:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_71676
		cmp	[bp+var_26], 0
		jz	short loc_71676
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71676

loc_71676:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_716AE
		cmp	[bp+var_A], 0
		jz	short loc_716AE
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_716AE

loc_716AE:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_716C6:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	33h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_6A+1], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	[bp+var_76], 0
		mov	byte ptr [bp+var_74+2], 2
		mov	byte ptr [bp+var_74+3], 0
		mov	[bp+var_70], 0
		push	3
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	7
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_80], 0
		mov	byte ptr [bp+var_7E+2], 2
		mov	byte ptr [bp+var_7E+3], 0
		mov	[bp+var_7A], 0
		push	3
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	15h
		push	[bp+arg_3E]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	ax, [bp+arg_C]
		mov	word ptr [bp+var_84], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_88+2], ax
		or	ax, ax
		jz	short loc_717D9
		push	0FFD8h
		push	0
		push	word ptr [bp+var_84]
		push	word ptr [bp+var_88+2]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_88+2]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_88+2]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_88+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_88+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_88+2]
		mov	word ptr [bx+1Dh], 1
		mov	bx, word ptr [bp+var_88+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_88+2]
		jmp	short loc_717DD

loc_717D9:
		mov	ax, word ptr [bp+var_88+2]

loc_717DD:
		mov	word ptr [bp+var_82], ax
		push	word ptr [bp+var_82]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	ax, [bp+arg_C]
		mov	[bp+var_8A], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_8E+2], ax
		or	ax, ax
		jz	short loc_7185B
		push	0FFD8h
		push	0FEC0h
		push	[bp+var_8A]
		push	word ptr [bp+var_8E+2]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+1Dh], 1
		mov	bx, word ptr [bp+var_8E+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_8E+2]
		jmp	short loc_7185F

loc_7185B:
		mov	ax, word ptr [bp+var_8E+2]

loc_7185F:
		mov	word ptr [bp+var_88], ax
		push	word ptr [bp+var_88]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_90], ax
		or	ax, ax
		jz	short loc_718D5
		push	0FFD8h
		push	0
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	[bp+var_90]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_90]
		mov	word ptr [bx], 20D9h
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, [bp+var_90]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_90]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_90]
		mov	word ptr [bx+1Dh], 1
		mov	bx, [bp+var_90]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_90]
		jmp	short loc_718D9

loc_718D5:
		mov	ax, [bp+var_90]

loc_718D9:
		mov	word ptr [bp+var_8E], ax
		push	word ptr [bp+var_8E]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_94], ax
		or	ax, ax
		jz	short loc_71950
		push	0FFD8h
		push	0FEC0h
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	word ptr [bp+var_94]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_94]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_94]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_94]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_94]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_94]
		mov	word ptr [bx+1Dh], 1
		mov	bx, word ptr [bp+var_94]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_94]
		jmp	short loc_71954

loc_71950:
		mov	ax, word ptr [bp+var_94]

loc_71954:
		mov	word ptr [bp+var_94+2], ax
		push	word ptr [bp+var_94+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_98], ax
		or	ax, ax
		jz	short loc_719CA
		push	28h
		push	0
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	word ptr [bp+var_98]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_98]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_98]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_98]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_98]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_98]
		mov	word ptr [bx+1Dh], 2
		mov	bx, word ptr [bp+var_98]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_98]
		jmp	short loc_719CE

loc_719CA:
		mov	ax, word ptr [bp+var_98]

loc_719CE:
		mov	word ptr [bp+var_98+2], ax
		push	word ptr [bp+var_98+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_9E+2], ax
		or	ax, ax
		jz	short loc_71A45
		push	28h
		push	0FEC0h
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	word ptr [bp+var_9E+2]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_9E+2]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_9E+2]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_9E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_9E+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_9E+2]
		mov	word ptr [bx+1Dh], 2
		mov	bx, word ptr [bp+var_9E+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_9E+2]
		jmp	short loc_71A49

loc_71A45:
		mov	ax, word ptr [bp+var_9E+2]

loc_71A49:
		mov	[bp+var_9A], ax
		push	[bp+var_9A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_A6], 0
		mov	byte ptr [bp+var_A2], 2
		mov	byte ptr [bp+var_A2+1], 0
		mov	[bp+var_A0], 0
		push	3
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	15h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B0], 0
		mov	byte ptr [bp+var_AC], 2
		mov	byte ptr [bp+var_AC+1], 0
		mov	[bp+var_AA], 0
		push	3
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	1Dh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_BA], 0
		mov	byte ptr [bp+var_B6], 2
		mov	byte ptr [bp+var_B6+1], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	23h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	di, ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	[bp+var_BC], ax
		push	di
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_71BBD

loc_71B3F:
		mov	ax, [bp+var_123]
		mov	[bp+var_BE], ax
		cmp	[bp+var_BE], 0Eh
		jnz	short loc_71B7A
		push	di
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	di, di
		jz	short loc_71B6C
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_71B6C

loc_71B6C:
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_71B7A:
		cmp	[bp+var_BE], 1Bh
		jnz	short loc_71BB0
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	si, si
		jz	short loc_71B9F
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_71B9F

loc_71B9F:
		push	[bp+var_BC]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_71BB0:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_71BBD:
		cmp	[bp+var_123], 29h
		jnb	short loc_71BCB
		cmp	[bp+var_121], 0
		jz	short loc_71BD0

loc_71BCB:
		mov	ax, 1
		jmp	short loc_71BD2

loc_71BD0:
		xor	ax, ax

loc_71BD2:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_71BDB
		jmp	loc_71B3F

loc_71BDB:
		cmp	byte ptr [bp+var_B6+1], 0
		jz	short loc_71C03
		cmp	[bp+var_BA], 0
		jz	short loc_71C03
		push	0
		mov	al, byte ptr [bp+var_B6]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71C03

loc_71C03:
		mov	[bp+var_BA], 0
		mov	byte ptr [bp+var_B6+1], 0
		mov	[bp+var_B4], 0
		cmp	byte ptr [bp+var_AC+1], 0
		jz	short loc_71C42
		cmp	[bp+var_B0], 0
		jz	short loc_71C42
		push	0
		mov	al, byte ptr [bp+var_AC]
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71C42

loc_71C42:
		mov	[bp+var_B0], 0
		mov	byte ptr [bp+var_AC+1], 0
		mov	[bp+var_AA], 0
		cmp	byte ptr [bp+var_A2+1], 0
		jz	short loc_71C81
		cmp	[bp+var_A6], 0
		jz	short loc_71C81
		push	0
		mov	al, byte ptr [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_A6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71C81

loc_71C81:
		mov	[bp+var_A6], 0
		mov	byte ptr [bp+var_A2+1], 0
		mov	[bp+var_A0], 0
		cmp	byte ptr [bp+var_7E+3], 0
		jz	short loc_71CBC
		cmp	[bp+var_80], 0
		jz	short loc_71CBC
		push	0
		mov	al, byte ptr [bp+var_7E+2]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71CBC

loc_71CBC:
		mov	[bp+var_80], 0
		mov	byte ptr [bp+var_7E+3], 0
		mov	[bp+var_7A], 0
		cmp	byte ptr [bp+var_74+3], 0
		jz	short loc_71CF4
		cmp	[bp+var_76], 0
		jz	short loc_71CF4
		push	0
		mov	al, byte ptr [bp+var_74+2]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71CF4

loc_71CF4:
		mov	[bp+var_76], 0
		mov	byte ptr [bp+var_74+3], 0
		mov	[bp+var_70], 0
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_62+1], 0
		jz	short loc_71D38
		cmp	[bp+var_66], 0
		jz	short loc_71D38
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71D38

loc_71D38:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+arg_12], 0
		jz	short loc_71D6C
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_71D6C:
		cmp	[bp+arg_46], 0
		jz	short loc_71D7D
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_71D7D:
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_71DA1
		cmp	[bp+var_5C], 0
		jz	short loc_71DA1
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71DA1

loc_71DA1:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	byte_4F55C, 0
		jnz	short loc_71DBF
		jmp	loc_71E3F

loc_71DBF:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_71DEF
		cmp	[bp+var_26], 0
		jz	short loc_71DEF
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71DEF

loc_71DEF:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_71E27
		cmp	[bp+var_A], 0
		jz	short loc_71E27
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_71E27

loc_71E27:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_71E3F:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	[bp+arg_12], 0
		jz	short loc_71E96
		push	3
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	0Dh
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_71EBB

loc_71E96:
		cmp	[bp+arg_46], 0
		jz	short loc_71EBB
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 32h
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_71EBB:
		push	0FFF6h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_5E], ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_60], ax
		push	word ptr [bp+var_60]
		push	word ptr [bp+var_5E]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5E]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		push	3
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	11h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_74], 0
		mov	byte ptr [bp+var_70], 2
		mov	byte ptr [bp+var_70+1], 0
		mov	[bp+var_6E], 0
		push	3
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	1Eh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_7E], 0
		mov	byte ptr [bp+var_7A], 2
		mov	byte ptr [bp+var_7A+1], 0
		mov	[bp+var_78], 0
		push	3
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	1Fh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_88], 0
		mov	byte ptr [bp+var_84], 2
		mov	byte ptr [bp+var_84+1], 0
		mov	[bp+var_82], 0
		push	3
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	20h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	[bp+var_8A], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	di, ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_8E+2], ax
		push	[bp+var_8A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		push	[bp+var_8A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1
		push	55h
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_8E], ax
		push	word ptr [bp+var_8E]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	37h
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_90], ax
		push	[bp+var_90]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	loc_72137

loc_72078:
		mov	ax, [bp+var_123]
		mov	word ptr [bp+var_94+2], ax
		cmp	word ptr [bp+var_94+2], 32h
		jnz	short loc_720B1
		push	di
		push	[bp+var_8A]
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	di, di
		jz	short loc_720A4
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_720A4

loc_720A4:
		push	si
		push	[bp+var_8A]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_720B1:
		cmp	word ptr [bp+var_94+2], 41h
		jnz	short loc_720E5
		push	si
		push	[bp+var_8A]
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		or	si, si
		jz	short loc_720D5
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_720D5

loc_720D5:
		push	word ptr [bp+var_8E+2]
		push	[bp+var_8A]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_720E5:
		cmp	word ptr [bp+var_94+2], 30h
		jnz	short loc_7212A
		cmp	[bp+arg_12], 0
		jz	short loc_72104
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_7212A

loc_72104:
		cmp	[bp+arg_46], 0
		jz	short loc_7212A
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_7212A
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_7212A

loc_7212A:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_72137:
		cmp	[bp+var_123], 51h
		jnb	short loc_72145
		cmp	[bp+var_121], 0
		jz	short loc_7214A

loc_72145:
		mov	ax, 1
		jmp	short loc_7214C

loc_7214A:
		xor	ax, ax

loc_7214C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_72155
		jmp	loc_72078

loc_72155:
		cmp	[bp+arg_12], 0
		jz	short loc_72166
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_72166:
		cmp	[bp+arg_46], 0
		jz	short loc_72177
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_72177:
		cmp	byte ptr [bp+var_84+1], 0
		jz	short loc_7219F
		cmp	[bp+var_88], 0
		jz	short loc_7219F
		push	0
		mov	al, byte ptr [bp+var_84]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7219F

loc_7219F:
		mov	[bp+var_88], 0
		mov	byte ptr [bp+var_84+1], 0
		mov	[bp+var_82], 0
		cmp	byte ptr [bp+var_7A+1], 0
		jz	short loc_721DA
		cmp	[bp+var_7E], 0
		jz	short loc_721DA
		push	0
		mov	al, byte ptr [bp+var_7A]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_721DA

loc_721DA:
		mov	[bp+var_7E], 0
		mov	byte ptr [bp+var_7A+1], 0
		mov	[bp+var_78], 0
		cmp	byte ptr [bp+var_70+1], 0
		jz	short loc_72212
		cmp	[bp+var_74], 0
		jz	short loc_72212
		push	0
		mov	al, byte ptr [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72212

loc_72212:
		mov	[bp+var_74], 0
		mov	byte ptr [bp+var_70+1], 0
		mov	[bp+var_6E], 0
		cmp	byte ptr [bp+var_66+1], 0
		jz	short loc_7224A
		cmp	[bp+var_6A], 0
		jz	short loc_7224A
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7224A

loc_7224A:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_72282
		cmp	[bp+var_5C], 0
		jz	short loc_72282
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72282

loc_72282:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_722AF
		jmp	loc_7232F

loc_722AF:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_722DF
		cmp	[bp+var_26], 0
		jz	short loc_722DF
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_722DF

loc_722DF:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_72317
		cmp	[bp+var_A], 0
		jz	short loc_72317
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72317

loc_72317:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_7232F:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	si, [bp+arg_8]
		mov	ax, [si]
		mov	[bp+var_246], ax
		mov	ax, [si+2]
		mov	[bp+var_244], ax
		mov	ax, [si+4]
		mov	[bp+var_242], ax
		mov	ax, [si+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	di, [bp+arg_36]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_38]
		mov	word ptr [bp+var_56+2], ax
		mov	bx, word ptr [bp+var_56+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_56], ax
		push	word ptr [bp+var_56]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	0FFDDh
		push	1
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_58], ax
		push	0
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5A], ax
		push	1
		push	[bp+var_1C]
		push	[bp+var_1A]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	word ptr [bp+var_5A]
		push	word ptr [bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5C]
		push	word ptr [bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0Eh
		push	0
		push	[bp+arg_3A]
		push	0
		call	OverlayAnimLayer_Construct_ED56
		add	sp, 8
		mov	word ptr [bp+var_5E], ax
		push	word ptr [bp+var_5E]
		push	word ptr [bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	[bp+arg_12], 0
		jnz	short loc_724A4
		jmp	loc_72555

loc_724A4:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_64], 2
		mov	byte ptr [bp+var_64+1], 0
		mov	[bp+var_62], 0
		push	2
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	1
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_724FD

loc_724F0:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_724FD:
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_724F0
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_64+1], 0
		jz	short loc_7253F
		cmp	[bp+var_68], 0
		jz	short loc_7253F
		push	0
		mov	al, byte ptr [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7253F

loc_7253F:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_64+1], 0
		mov	[bp+var_62], 0
		jmp	short loc_725AC

loc_72555:
		push	4
		push	[bp+arg_A]
		mov	bx, [bp+arg_A]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		shl	ax, 1
		mov	bx, [bp+arg_2]
		mov	dx, [bx+2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_162]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_72591

loc_72584:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_72591:
		cmp	[bp+var_123], 14h
		jnb	short loc_7259F
		cmp	[bp+var_121], 0
		jz	short loc_725A4

loc_7259F:
		mov	ax, 1
		jmp	short loc_725A6

loc_725A4:
		xor	ax, ax

loc_725A6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_72584

loc_725AC:
		mov	[bp+var_123], 0
		jmp	short loc_725C1

loc_725B4:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_725C1:
		cmp	[bp+var_123], 0Ah
		jnb	short loc_725CF
		cmp	[bp+var_121], 0
		jz	short loc_725D4

loc_725CF:
		mov	ax, 1
		jmp	short loc_725D6

loc_725D4:
		xor	ax, ax

loc_725D6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_725B4
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_72602
		jmp	loc_72682

loc_72602:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_72632
		cmp	[bp+var_26], 0
		jz	short loc_72632
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72632

loc_72632:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_7266A
		cmp	[bp+var_A], 0
		jz	short loc_7266A
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7266A

loc_7266A:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_72682:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	si, [bp+arg_24]
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	di, [bp+arg_26]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_56+2], ax
		push	word ptr [bp+var_56+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	0FFD8h
		push	0
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_56], ax
		push	2
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_58], ax
		push	3
		push	[bp+var_14]
		push	[bp+var_12]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5A], ax
		push	word ptr [bp+var_58]
		push	word ptr [bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5A]
		push	word ptr [bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_56]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	18h
		push	0
		push	[bp+arg_28]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	word ptr [bp+var_5C]
		push	word ptr [bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_727B1

loc_727A4:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_727B1:
		cmp	[bp+var_123], 14h
		jnb	short loc_727BF
		cmp	[bp+var_121], 0
		jz	short loc_727C4

loc_727BF:
		mov	ax, 1
		jmp	short loc_727C6

loc_727C4:
		xor	ax, ax

loc_727C6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_727A4
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_727E5
		jmp	loc_72865

loc_727E5:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_72815
		cmp	[bp+var_26], 0
		jz	short loc_72815
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72815

loc_72815:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_7284D
		cmp	[bp+var_A], 0
		jz	short loc_7284D
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7284D

loc_7284D:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_72865:
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	si, [bp+arg_14]
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_56+2], ax
		push	word ptr [bp+var_56+2]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1
		push	0
		push	0
		push	[bp+arg_E]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_56], ax
		push	word ptr [bp+var_56]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_FA60
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1Bh
		push	di
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_60], 0
		mov	byte ptr [bp+var_5C], 2
		mov	byte ptr [bp+var_5C+1], 0
		mov	[bp+var_5A], 0
		push	3
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	0
		push	[bp+arg_3E]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1
		push	80h
		push	0A0h
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	0
		call	ToggleLayer_Construct_FDCC
		add	sp, 0Ah
		mov	word ptr [bp+var_62], ax
		push	word ptr [bp+var_62]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_729A8

loc_7299B:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_729A8:
		cmp	[bp+var_123], 14h
		jnb	short loc_729B6
		cmp	[bp+var_121], 0
		jz	short loc_729BB

loc_729B6:
		mov	ax, 1
		jmp	short loc_729BD

loc_729BB:
		xor	ax, ax

loc_729BD:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7299B
		cmp	[bp+var_5], 0
		jz	short loc_729E7
		cmp	[bp+var_A], 0
		jz	short loc_729E7
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_729E7

loc_729E7:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		cmp	byte ptr [bp+var_5C+1], 0
		jz	short loc_72A1F
		cmp	[bp+var_60], 0
		jz	short loc_72A1F
		push	0
		mov	al, byte ptr [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72A1F

loc_72A1F:
		mov	[bp+var_60], 0
		mov	byte ptr [bp+var_5C+1], 0
		mov	[bp+var_5A], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_72A4C
		jmp	loc_72ACC

loc_72A4C:
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_72A7C
		cmp	[bp+var_26], 0
		jz	short loc_72A7C
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72A7C

loc_72A7C:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_72AB4
		cmp	[bp+var_A], 0
		jz	short loc_72AB4
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72AB4

loc_72AB4:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_72ACC:
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	3
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	19h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	2Fh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_60+1], 0
		lea	ax, word ptr [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		mov	di, [bp+arg_1E]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_2A]
		mov	word ptr [bp+var_64], ax
		mov	bx, word ptr [bp+var_64]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_64]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_64]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	word ptr [bp+var_62]
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, word ptr [bp+var_62]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_6E], 0
		mov	byte ptr [bp+var_6A], 2
		mov	byte ptr [bp+var_6A+1], 0
		mov	[bp+var_68], 0
		push	3
		lea	ax, word ptr [bp+var_6E]
		push	ax
		push	0Ah
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFC0h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_70], ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_74+2], ax
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_70]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_70]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0
		push	[bp+arg_2C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_74], ax
		push	word ptr [bp+var_74]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	1
		push	5Ah
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_76], ax
		push	word ptr [bp+var_76]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	32h
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_78], ax
		push	word ptr [bp+var_78]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0Ah
		push	0
		lea	ax, word ptr [bp+var_6E]
		push	ax
		push	0
		call	OverlayAnimLayer_Construct_ED56
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [si+1Bh], 1
		jmp	short loc_72CE1

loc_72CC8:
		cmp	[bp+var_123], 8
		jbe	short loc_72CD4
		mov	word ptr [si+1Bh], 9

loc_72CD4:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_72CE1:
		cmp	[bp+var_123], 14h
		jnb	short loc_72CEF
		cmp	[bp+var_121], 0
		jz	short loc_72CF4

loc_72CEF:
		mov	ax, 1
		jmp	short loc_72CF6

loc_72CF4:
		xor	ax, ax

loc_72CF6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_72CC8
		cmp	byte ptr [bp+var_6A+1], 0
		jz	short loc_72D20
		cmp	[bp+var_6E], 0
		jz	short loc_72D20
		push	0
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_6E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72D20

loc_72D20:
		mov	[bp+var_6E], 0
		mov	byte ptr [bp+var_6A+1], 0
		mov	[bp+var_68], 0
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_72D64
		cmp	[bp+var_5C], 0
		jz	short loc_72D64
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72D64

loc_72D64:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_72D91
		jmp	loc_72E49

loc_72D91:
		cmp	[bp+var_31], 0
		jz	short loc_72DB5
		cmp	[bp+var_36], 0
		jz	short loc_72DB5
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72DB5

loc_72DB5:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_72DF9
		cmp	[bp+var_26], 0
		jz	short loc_72DF9
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72DF9

loc_72DF9:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_72E31
		cmp	[bp+var_A], 0
		jz	short loc_72E31
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_72E31

loc_72E31:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_72E49:
		mov	[bp+var_40], 0
		mov	[bp+var_3C], 2
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	17h
		push	[bp+arg_3E]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_43], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	si, [bp+arg_8]
		mov	ax, [si]
		mov	[bp+var_246], ax
		mov	ax, [si+2]
		mov	[bp+var_244], ax
		mov	ax, [si+4]
		mov	[bp+var_242], ax
		mov	ax, [si+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_140]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_162]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_56+2], ax
		push	word ptr [bp+var_56+2]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_162]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A], 2
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	3
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	18h
		push	[bp+arg_3E]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFECh
		push	0
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_60], ax
		push	word ptr [bp+var_60]
		lea	ax, [bp+var_162]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		push	3
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	2
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	1
		push	0FFE7h
		push	0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_6E+2], ax
		push	word ptr [bp+var_6E+2]
		lea	ax, [bp+var_162]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	[bp+var_76], 0
		mov	byte ptr [bp+var_74+2], 2
		mov	byte ptr [bp+var_74+3], 0
		mov	[bp+var_70], 0
		push	3
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	13h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0FFD8h
		push	0
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_78], ax
		push	word ptr [bp+var_78]
		lea	ax, [bp+var_162]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_46]
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		jmp	short loc_73052

loc_73045:
		lea	ax, [bp+var_162]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_73052:
		cmp	[bp+var_145], 1Eh
		jnb	short loc_73060
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_73065

loc_73060:
		mov	ax, 1
		jmp	short loc_73067

loc_73065:
		xor	ax, ax

loc_73067:
		mov	ah, 0
		or	ax, ax
		jz	short loc_73045
		cmp	byte ptr [bp+var_74+3], 0
		jz	short loc_73091
		cmp	[bp+var_76], 0
		jz	short loc_73091
		push	0
		mov	al, byte ptr [bp+var_74+2]
		push	ax
		lea	ax, word ptr [bp+var_76]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73091

loc_73091:
		mov	[bp+var_76], 0
		mov	byte ptr [bp+var_74+3], 0
		mov	[bp+var_70], 0
		cmp	byte ptr [bp+var_66+1], 0
		jz	short loc_730C9
		cmp	[bp+var_6A], 0
		jz	short loc_730C9
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_730C9

loc_730C9:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		cmp	byte ptr [bp+var_5A+1], 0
		jz	short loc_73101
		cmp	[bp+var_5E], 0
		jz	short loc_73101
		push	0
		mov	al, byte ptr [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73101

loc_73101:
		mov	[bp+var_5E], 0
		mov	byte ptr [bp+var_5A+1], 0
		mov	[bp+var_58], 0
		push	0
		lea	ax, [bp+var_162]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_13E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		cmp	byte_4F55C, 0
		jnz	short loc_7313B
		jmp	loc_73237

loc_7313B:
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_3B], 0
		jz	short loc_7316B
		cmp	[bp+var_40], 0
		jz	short loc_7316B
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7316B

loc_7316B:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_731A3
		cmp	[bp+var_36], 0
		jz	short loc_731A3
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_731A3

loc_731A3:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_731E7
		cmp	[bp+var_26], 0
		jz	short loc_731E7
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_731E7

loc_731E7:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_7321F
		cmp	[bp+var_A], 0
		jz	short loc_7321F
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7321F

loc_7321F:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_73237:
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	[bp+var_246], ax
		mov	ax, [di+2]
		mov	[bp+var_244], ax
		mov	ax, [di+4]
		mov	[bp+var_242], ax
		mov	ax, [di+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	ax, [bp+arg_36]
		mov	word ptr [bp+var_56+2], ax
		mov	bx, word ptr [bp+var_56+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_38]
		mov	word ptr [bp+var_56], ax
		mov	bx, word ptr [bp+var_56]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_58], ax
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	0FFD8h
		push	1
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_5A], ax
		push	0
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	1
		push	[bp+var_1C]
		push	[bp+var_1A]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5E], ax
		push	word ptr [bp+var_5C]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5E]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0Eh
		push	0
		push	[bp+arg_3A]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [si+1Bh], 0Dh
		cmp	[bp+arg_12], 0
		jnz	short loc_733AD
		jmp	loc_73471

loc_733AD:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	2
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_73419

loc_733F9:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		add	ax, 0Dh
		mov	word ptr [bp+var_6E+2], ax
		mov	ax, word ptr [bp+var_6E+2]
		mov	[si+1Bh], ax

loc_73419:
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_733F9
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_66+1], 0
		jz	short loc_7345B
		cmp	[bp+var_6A], 0
		jz	short loc_7345B
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7345B

loc_7345B:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		jmp	short loc_734DD

loc_73471:
		push	4
		push	[bp+arg_A]
		mov	bx, [bp+arg_A]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		shl	ax, 1
		add	ax, [bx]
		mov	bx, [bp+arg_2]
		mov	dx, [bx+2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_162]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_734C2

loc_734A2:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		add	ax, 0Dh
		mov	word ptr [bp+var_60], ax
		mov	ax, word ptr [bp+var_60]
		mov	[si+1Bh], ax

loc_734C2:
		cmp	[bp+var_123], 1Eh
		jnb	short loc_734D0
		cmp	[bp+var_121], 0
		jz	short loc_734D5

loc_734D0:
		mov	ax, 1
		jmp	short loc_734D7

loc_734D5:
		xor	ax, ax

loc_734D7:
		mov	ah, 0
		or	ax, ax
		jz	short loc_734A2

loc_734DD:
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_73503
		jmp	loc_735FF

loc_73503:
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_3B], 0
		jz	short loc_73533
		cmp	[bp+var_40], 0
		jz	short loc_73533
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73533

loc_73533:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_7356B
		cmp	[bp+var_36], 0
		jz	short loc_7356B
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7356B

loc_7356B:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_735AF
		cmp	[bp+var_26], 0
		jz	short loc_735AF
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_735AF

loc_735AF:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_735E7
		cmp	[bp+var_A], 0
		jz	short loc_735E7
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_735E7

loc_735E7:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_735FF:
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	[bp+var_246], ax
		mov	ax, [di+2]
		mov	[bp+var_244], ax
		mov	ax, [di+4]
		mov	[bp+var_242], ax
		mov	ax, [di+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	ax, [bp+arg_24]
		mov	word ptr [bp+var_56+2], ax
		mov	bx, word ptr [bp+var_56+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_26]
		mov	word ptr [bp+var_56], ax
		mov	bx, word ptr [bp+var_56]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_58], ax
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	0FFDDh
		push	0
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_5A], ax
		push	2
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	3
		push	[bp+var_14]
		push	[bp+var_12]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5E], ax
		push	word ptr [bp+var_5C]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5E]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	18h
		push	0
		push	[bp+arg_28]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [si+1Bh], 0
		jmp	short loc_7377B

loc_7376E:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7377B:
		cmp	[bp+var_123], 5
		jnb	short loc_73789
		cmp	[bp+var_121], 0
		jz	short loc_7378E

loc_73789:
		mov	ax, 1
		jmp	short loc_73790

loc_7378E:
		xor	ax, ax

loc_73790:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7376E
		cmp	[bp+arg_12], 0
		jnz	short loc_7379F
		jmp	loc_73860

loc_7379F:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	5
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_73808

loc_737EB:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		mov	word ptr [bp+var_6E+2], ax
		mov	ax, word ptr [bp+var_6E+2]
		mov	[si+1Bh], ax

loc_73808:
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_737EB
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_66+1], 0
		jz	short loc_7384A
		cmp	[bp+var_6A], 0
		jz	short loc_7384A
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7384A

loc_7384A:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		jmp	short loc_738C8

loc_73860:
		push	72h
		push	[bp+arg_A]
		mov	bx, [bp+arg_A]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		shl	ax, 2
		mov	bx, [bp+arg_2]
		mov	dx, [bx+2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_162]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_738AD

loc_73890:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		mov	word ptr [bp+var_60], ax
		mov	ax, word ptr [bp+var_60]
		mov	[si+1Bh], ax

loc_738AD:
		cmp	[bp+var_123], 28h
		jnb	short loc_738BB
		cmp	[bp+var_121], 0
		jz	short loc_738C0

loc_738BB:
		mov	ax, 1
		jmp	short loc_738C2

loc_738C0:
		xor	ax, ax

loc_738C2:
		mov	ah, 0
		or	ax, ax
		jz	short loc_73890

loc_738C8:
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	[bp+var_246], ax
		mov	ax, [di+2]
		mov	[bp+var_244], ax
		mov	ax, [di+4]
		mov	[bp+var_242], ax
		mov	ax, [di+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	ax, [bp+arg_36]
		mov	word ptr [bp+var_56+2], ax
		mov	bx, word ptr [bp+var_56+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_38]
		mov	word ptr [bp+var_56], ax
		mov	bx, word ptr [bp+var_56]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30AD0
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_58], ax
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	0FFD8h
		push	1
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_5A], ax
		push	0
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	1
		push	[bp+var_1C]
		push	[bp+var_1A]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5E], ax
		push	word ptr [bp+var_5C]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5E]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0Eh
		push	0
		push	[bp+arg_3A]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [si+1Bh], 0Dh
		cmp	[bp+arg_12], 0
		jnz	short loc_73A69
		jmp	loc_73B2D

loc_73A69:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	3
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_73AD5

loc_73AB5:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		add	ax, 0Dh
		mov	word ptr [bp+var_6E+2], ax
		mov	ax, word ptr [bp+var_6E+2]
		mov	[si+1Bh], ax

loc_73AD5:
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_73AB5
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_66+1], 0
		jz	short loc_73B17
		cmp	[bp+var_6A], 0
		jz	short loc_73B17
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73B17

loc_73B17:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		jmp	short loc_73B9A

loc_73B2D:
		push	4
		push	[bp+arg_A]
		mov	bx, [bp+arg_A]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	dx, 5
		imul	dx
		mov	bx, [bp+arg_2]
		mov	dx, [bx+2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_162]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_73B7F

loc_73B5F:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		add	ax, 0Dh
		mov	word ptr [bp+var_60], ax
		mov	ax, word ptr [bp+var_60]
		mov	[si+1Bh], ax

loc_73B7F:
		cmp	[bp+var_123], 1Eh
		jnb	short loc_73B8D
		cmp	[bp+var_121], 0
		jz	short loc_73B92

loc_73B8D:
		mov	ax, 1
		jmp	short loc_73B94

loc_73B92:
		xor	ax, ax

loc_73B94:
		mov	ah, 0
		or	ax, ax
		jz	short loc_73B5F

loc_73B9A:
		mov	word ptr [si+1Bh], 0Dh
		mov	[bp+var_123], 0
		jmp	short loc_73BB4

loc_73BA7:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_73BB4:
		cmp	[bp+var_123], 5
		jnb	short loc_73BC2
		cmp	[bp+var_121], 0
		jz	short loc_73BC7

loc_73BC2:
		mov	ax, 1
		jmp	short loc_73BC9

loc_73BC7:
		xor	ax, ax

loc_73BC9:
		mov	ah, 0
		or	ax, ax
		jz	short loc_73BA7
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	[bp+arg_A]
		push	word_4D36E
		sub	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	[bp+var_246], ax
		mov	ax, [di+2]
		mov	[bp+var_244], ax
		mov	ax, [di+4]
		mov	[bp+var_242], ax
		mov	ax, [di+6]
		mov	[bp+var_240], ax
		lea	ax, [bp+var_162]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	ax, [bp+arg_24]
		mov	word ptr [bp+var_56+2], ax
		mov	bx, word ptr [bp+var_56+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_26]
		mov	word ptr [bp+var_56], ax
		mov	bx, word ptr [bp+var_56]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_56]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_56]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_58], ax
		push	word ptr [bp+var_58]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	2
		push	0FFDCh
		push	0
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_F97F
		add	sp, 0Ah
		mov	word ptr [bp+var_5A], ax
		push	2
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5C], ax
		push	3
		push	[bp+var_14]
		push	[bp+var_12]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_5E], ax
		push	word ptr [bp+var_5C]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5E]
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_5A]
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	3
		push	18h
		push	0
		push	[bp+arg_28]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	word ptr [bp+var_5A]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	word ptr [si+1Bh], 0
		jmp	short loc_73D67

loc_73D5A:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_73D67:
		cmp	[bp+var_123], 5
		jnb	short loc_73D75
		cmp	[bp+var_121], 0
		jz	short loc_73D7A

loc_73D75:
		mov	ax, 1
		jmp	short loc_73D7C

loc_73D7A:
		xor	ax, ax

loc_73D7C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_73D5A
		cmp	[bp+arg_12], 0
		jnz	short loc_73D8B
		jmp	loc_73E4C

loc_73D8B:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_73DF4

loc_73DD7:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		mov	word ptr [bp+var_6E+2], ax
		mov	ax, word ptr [bp+var_6E+2]
		mov	[si+1Bh], ax

loc_73DF4:
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_73DD7
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [bp+var_66+1], 0
		jz	short loc_73E36
		cmp	[bp+var_6A], 0
		jz	short loc_73E36
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73E36

loc_73E36:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_64], 0
		jmp	short loc_73EB6

loc_73E4C:
		push	72h
		push	[bp+arg_A]
		mov	bx, [bp+arg_A]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	dx, 6
		imul	dx
		mov	bx, [bp+arg_2]
		mov	dx, [bx+2]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_162]
		push	ax
		call	MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_73E9B

loc_73E7E:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	ax, [bp+var_123]
		and	ax, 1
		mov	word ptr [bp+var_60], ax
		mov	ax, word ptr [bp+var_60]
		mov	[si+1Bh], ax

loc_73E9B:
		cmp	[bp+var_123], 32h
		jnb	short loc_73EA9
		cmp	[bp+var_121], 0
		jz	short loc_73EAE

loc_73EA9:
		mov	ax, 1
		jmp	short loc_73EB0

loc_73EAE:
		xor	ax, ax

loc_73EB0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_73E7E

loc_73EB6:
		lea	ax, [bp+var_160]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	byte_4F55C, 0
		jnz	short loc_73EDC
		jmp	loc_73FD8

loc_73EDC:
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_3B], 0
		jz	short loc_73F0C
		cmp	[bp+var_40], 0
		jz	short loc_73F0C
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73F0C

loc_73F0C:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_73F44
		cmp	[bp+var_36], 0
		jz	short loc_73F44
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73F44

loc_73F44:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_73F88
		cmp	[bp+var_26], 0
		jz	short loc_73F88
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73F88

loc_73F88:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_73FC0
		cmp	[bp+var_A], 0
		jz	short loc_73FC0
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_73FC0

loc_73FC0:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf

loc_73FD8:
		mov	[bp+var_47], 0
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_73FF6
		shl	bx, 1
		jmp	cs:off_74BF3[bx]	; switch jump

loc_73FF0:
		mov	[bp+var_47], 1
		jmp	short loc_73FF6

loc_73FF6:
		mov	[bp+var_52], 0
		mov	[bp+var_4E], 2
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		cmp	[bp+arg_12], 0
		jz	short loc_74038
		push	2
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	0Dh
		push	[bp+arg_40]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	[bp+arg_42]
		call	MidgameEngine_7D11_BC88
		add	sp, 4
		jmp	short loc_7405D

loc_74038:
		cmp	[bp+arg_46], 0
		jz	short loc_7405D
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 32h
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6

loc_7405D:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58], 2
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	3Ch
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	2Eh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	word ptr [bp+var_6A+1], 0
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		mov	[bp+var_132], 0FFCEh
		mov	ax, [bp+arg_1E]
		mov	word ptr [bp+var_6E], ax
		mov	bx, word ptr [bp+var_6E]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_6E]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_6E]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_2A]
		mov	word ptr [bp+var_70], ax
		mov	bx, word ptr [bp+var_70]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_70]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_70]
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_46]
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		mov	ax, [bp+arg_C]
		mov	word ptr [bp+var_74+2], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_74], ax
		or	ax, ax
		jz	short loc_741BD
		push	0
		push	0
		push	word ptr [bp+var_74+2]
		push	word ptr [bp+var_74]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_74]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_74]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_74]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_74]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_74]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_74]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_74]
		jmp	short loc_741C0

loc_741BD:
		mov	ax, word ptr [bp+var_74]

loc_741C0:
		mov	di, ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_76], ax
		push	word ptr [bp+var_76]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	di
		lea	ax, [bp+var_140]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	ax, [bp+arg_2C]
		mov	word ptr [bp+var_7A], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_7E+2], ax
		or	ax, ax
		jz	short loc_7424D
		push	0
		push	0
		push	word ptr [bp+var_7A]
		push	word ptr [bp+var_7E+2]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_7E+2]
		jmp	short loc_74250

loc_7424D:
		mov	ax, word ptr [bp+var_7E+2]

loc_74250:
		mov	word ptr [bp+var_78], ax
		push	word ptr [bp+var_78]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	ax, [bp+arg_22]
		mov	word ptr [bp+var_80], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_82], ax
		or	ax, ax
		jz	short loc_742C8
		push	1
		push	82h
		push	0
		push	word ptr [bp+var_80]
		push	word ptr [bp+var_82]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_82]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_82]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_82]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_82]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_82]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_82]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_82]
		jmp	short loc_742CC

loc_742C8:
		mov	ax, word ptr [bp+var_82]

loc_742CC:
		mov	word ptr [bp+var_7E], ax
		push	word ptr [bp+var_7E]
		push	word ptr [bp+var_78]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	ax, [bp+arg_22]
		mov	word ptr [bp+var_88+2], ax
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_88], ax
		or	ax, ax
		jz	short loc_74347
		push	2
		push	0FFFCh
		push	0
		push	word ptr [bp+var_88+2]
		push	word ptr [bp+var_88]
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_88]
		mov	word ptr [bx], 20D9h
		mov	bx, word ptr [bp+var_88]
		mov	word ptr [bx+0Ah], 20F9h
		mov	bx, word ptr [bp+var_88]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_88]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_88]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_88]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_88]
		jmp	short loc_7434B

loc_74347:
		mov	ax, word ptr [bp+var_88]

loc_7434B:
		mov	word ptr [bp+var_84], ax
		push	word ptr [bp+var_84]
		push	word ptr [bp+var_7E]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	0FFB1h
		push	0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	0
		call	TriggeredAnimLayer_Construct_F8B9
		add	sp, 0Ah
		mov	[bp+var_8A], ax
		push	[bp+var_8A]
		push	word ptr [bp+var_84]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	bx, [bp+var_8A]
		mov	byte ptr [bx+1Dh], 1
		mov	[bp+var_94], 0
		mov	byte ptr [bp+var_90], 2
		mov	byte ptr [bp+var_90+1], 0
		mov	[bp+var_8E], 0
		push	3
		lea	ax, word ptr [bp+var_94]
		push	ax
		push	21h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_9E], 0
		mov	byte ptr [bp+var_9A], 2
		mov	byte ptr [bp+var_9A+1], 0
		mov	[bp+var_98], 0
		push	3
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	22h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0Ah
		push	0
		lea	ax, word ptr [bp+var_94]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_A0], ax
		push	0Ah
		push	0
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	[bp+var_A2], ax
		mov	bx, word ptr [bp+var_A0]
		mov	word ptr [bx+1Bh], 0
		mov	bx, [bp+var_A2]
		mov	word ptr [bx+1Bh], 0
		push	word ptr [bp+var_A0]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_7444A

loc_7443D:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_7444A:
		cmp	[bp+var_123], 14h
		jnb	short loc_74458
		cmp	[bp+var_121], 0
		jz	short loc_7445D

loc_74458:
		mov	ax, 1
		jmp	short loc_7445F

loc_7445D:
		xor	ax, ax

loc_7445F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7443D
		mov	[bp+var_123], 0
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Fh], 1
		jmp	short loc_744C9

loc_7447D:
		cmp	[bp+var_123], 0Ah
		jnz	short loc_744B8
		push	word ptr [bp+var_A0]
		push	di
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_A0], 0
		jz	short loc_744AB
		push	3
		push	word ptr [bp+var_A0]
		mov	bx, word ptr [bp+var_A0]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_744AB

loc_744AB:
		push	[bp+var_A2]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_744B8:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		inc	[bp+var_132]

loc_744C9:
		cmp	[bp+var_132], 0FFE8h
		jl	short loc_7447D
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Fh], 0
		jmp	short loc_744EF

loc_744E2:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_744EF:
		push	[bp+var_A2]
		call	AnimLayer_IsFinished_346A0
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_744E2
		push	[bp+var_A2]
		push	di
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	[bp+var_A2], 0
		jz	short loc_74528
		push	3
		push	[bp+var_A2]
		mov	bx, [bp+var_A2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_74528

loc_74528:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		mov	[bp+var_123], 0
		mov	[bp+var_AC], 0
		mov	byte ptr [bp+var_AA+2], 2
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		push	3
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	9
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_B6], 0
		mov	byte ptr [bp+var_B4+2], 2
		mov	byte ptr [bp+var_B4+3], 0
		mov	[bp+var_B0], 0
		push	3
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	0Eh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_BA+2], ax
		push	0
		push	0
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	0
		call	AnimLayer_Construct_3461B
		add	sp, 8
		mov	word ptr [bp+var_BA], ax
		push	word ptr [bp+var_BA+2]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	word ptr [bp+var_6E+2]
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_34B85
		add	sp, 8
		cmp	[bp+var_47], 0
		jz	short loc_7462B
		mov	bx, [bp+arg_4A]
		cmp	word ptr [bx], 0
		jz	short loc_7462B
		mov	bx, [bp+arg_4A]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_4A]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_7462B

loc_7462B:
		cmp	[bp+arg_12], 0
		jz	short loc_74643
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_74669

loc_74643:
		cmp	[bp+arg_46], 0
		jz	short loc_74669
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_74669
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_50D1
		add	sp, 4
		jmp	short loc_74669

loc_74669:
		jmp	short loc_746B3

loc_7466B:
		cmp	[bp+var_123], 14h
		jnz	short loc_746A6
		push	word ptr [bp+var_BA+2]
		push	di
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	word ptr [bp+var_BA+2], 0
		jz	short loc_74699
		push	3
		push	word ptr [bp+var_BA+2]
		mov	bx, word ptr [bp+var_BA+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_74699

loc_74699:
		push	word ptr [bp+var_BA]
		push	di
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_746A6:
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_746B3:
		cmp	[bp+var_123], 1Fh
		jnb	short loc_746C1
		cmp	[bp+var_121], 0
		jz	short loc_746C6

loc_746C1:
		mov	ax, 1
		jmp	short loc_746C8

loc_746C6:
		xor	ax, ax

loc_746C8:
		mov	ah, 0
		or	ax, ax
		jz	short loc_7466B
		cmp	[bp+var_47], 0
		jz	short loc_7474C
		mov	al, [bp+var_C]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_7473D
		shl	bx, 1
		jmp	cs:off_74BE9[bx]	; switch jump

loc_746E8:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_11E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_7473D

loc_74703:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_11E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_7473D

loc_7471E:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_11E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_47], 1
		jmp	short loc_7473D

loc_7473D:
		push	17h
		lea	ax, [bp+var_11E]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4

loc_7474C:
		mov	al, byte_4F55C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_74781
		xor	eax, eax
		mov	[bp+var_CA], eax
		mov	[bp+var_CE], eax
		mov	[bp+var_CA], 78h
		mov	eax, dword_4DE15
		mov	[bp+var_CE], eax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2

loc_74781:
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+4], 0
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+6], 0
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+8], 13Fh
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+0Ah], 0C7h
		push	0
		push	0
		mov	bx, [bp+arg_C]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_C]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	[bp+arg_2E]
		call	sub_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	bx, [bp+arg_20]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_20]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	[bp+arg_2E]
		call	sub_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	bx, [bp+arg_2C]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_2C]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	[bp+arg_2E]
		call	sub_38514
		add	sp, 0Ch
		mov	ax, [bp+arg_2E]
		mov	[bp+var_BC], ax
		mov	[bp+var_14E], 0
		mov	[bp+var_14C], 0
		push	[bp+var_BC]
		lea	ax, [bp+var_14E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, word_4D36E
		mov	[bp+var_BE], ax
		mov	[bp+var_15C], 0
		mov	[bp+var_15A], 0
		push	[bp+var_BE]
		lea	ax, [bp+var_15C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		xor	si, si
		jmp	short loc_748ED

loc_7487A:
		mov	ax, 18h
		sub	ax, si
		mov	[bp+var_C0], ax
		mov	ax, si
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_C2], ax
		mov	[bp+var_14A], 0
		mov	ax, [bp+var_C0]
		mov	[bp+var_148], ax
		mov	[bp+var_146], 13Fh
		mov	ax, [bp+var_C2]
		mov	[bp+var_144], ax
		mov	ax, 18h
		sub	ax, si
		mov	[bp+var_C4], ax
		mov	ax, si
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_C6], ax
		mov	[bp+var_158], 0
		mov	ax, [bp+var_C4]
		mov	[bp+var_156], ax
		mov	[bp+var_154], 13Fh
		mov	ax, [bp+var_C6]
		mov	[bp+var_152], ax
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_15C]
		push	ax
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		inc	si

loc_748ED:
		cmp	si, 19h
		jl	short loc_7487A
		lea	ax, [bp+var_15C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_14E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		cmp	byte ptr [bp+var_B4+3], 0
		jz	short loc_74934
		cmp	[bp+var_B6], 0
		jz	short loc_74934
		push	0
		mov	al, byte ptr [bp+var_B4+2]
		push	ax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74934

loc_74934:
		mov	[bp+var_B6], 0
		mov	byte ptr [bp+var_B4+3], 0
		mov	[bp+var_B0], 0
		cmp	byte ptr [bp+var_AA+3], 0
		jz	short loc_74973
		cmp	[bp+var_AC], 0
		jz	short loc_74973
		push	0
		mov	al, byte ptr [bp+var_AA+2]
		push	ax
		lea	ax, word ptr [bp+var_AC]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74973

loc_74973:
		mov	[bp+var_AC], 0
		mov	byte ptr [bp+var_AA+3], 0
		mov	[bp+var_A6], 0
		cmp	byte ptr [bp+var_9A+1], 0
		jz	short loc_749B2
		cmp	[bp+var_9E], 0
		jz	short loc_749B2
		push	0
		mov	al, byte ptr [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_9E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_749B2

loc_749B2:
		mov	[bp+var_9E], 0
		mov	byte ptr [bp+var_9A+1], 0
		mov	[bp+var_98], 0
		cmp	byte ptr [bp+var_90+1], 0
		jz	short loc_749F1
		cmp	[bp+var_94], 0
		jz	short loc_749F1
		push	0
		mov	al, byte ptr [bp+var_90]
		push	ax
		lea	ax, word ptr [bp+var_94]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_749F1

loc_749F1:
		mov	[bp+var_94], 0
		mov	byte ptr [bp+var_90+1], 0
		mov	[bp+var_8E], 0
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, word ptr [bp+var_6E+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_62+1], 0
		jz	short loc_74A47
		cmp	[bp+var_66], 0
		jz	short loc_74A47
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74A47

loc_74A47:
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1], 0
		mov	[bp+var_60], 0
		cmp	byte ptr [bp+var_58+1], 0
		jz	short loc_74A7F
		cmp	[bp+var_5C], 0
		jz	short loc_74A7F
		push	0
		mov	al, byte ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74A7F

loc_74A7F:
		mov	[bp+var_5C], 0
		mov	byte ptr [bp+var_58+1], 0
		mov	[bp+var_56], 0
		cmp	[bp+arg_12], 0
		jz	short loc_74AA4
		push	[bp+arg_42]
		call	VoicePlayer_Stop_BACF
		add	sp, 2

loc_74AA4:
		cmp	[bp+arg_46], 0
		jz	short loc_74AB5
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_74AB5:
		cmp	[bp+var_4D], 0
		jz	short loc_74AD9
		cmp	[bp+var_52], 0
		jz	short loc_74AD9
		push	0
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74AD9

loc_74AD9:
		mov	[bp+var_52], 0
		mov	[bp+var_4D], 0
		mov	[bp+var_4C], 0
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_3B], 0
		jz	short loc_74B1D
		cmp	[bp+var_40], 0
		jz	short loc_74B1D
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74B1D

loc_74B1D:
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		cmp	[bp+var_31], 0
		jz	short loc_74B55
		cmp	[bp+var_36], 0
		jz	short loc_74B55
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74B55

loc_74B55:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_21], 0
		jz	short loc_74B99
		cmp	[bp+var_26], 0
		jz	short loc_74B99
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74B99

loc_74B99:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_5], 0
		jz	short loc_74BD1
		cmp	[bp+var_A], 0
		jz	short loc_74BD1
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_74BD1

loc_74BD1:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
Midgame1_PlayPart2_70290		endp

; START OF FUNCTION CHUNK FOR Midgame1_PlayPart2_70290
off_74BE9	dw offset loc_746E8
		dw offset loc_7471E
		dw offset loc_74703
		dw offset loc_7471E
		dw offset loc_7471E
off_74BF3	dw offset loc_73FF0
		dw offset loc_73FF0
		dw offset loc_73FF0
		dw offset loc_73FF0
		dw offset loc_73FF0
; END OF FUNCTION CHUNK FOR Midgame1_PlayPart2_70290
ovr201		ends
