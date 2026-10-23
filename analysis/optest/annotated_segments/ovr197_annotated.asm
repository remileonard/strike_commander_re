ovr197		segment	para public 'OVERLAY' use16
		assume cs:ovr197
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 6 751 lignes, LUE 2026-10-17 ligne à ligne. Seconde moitié de la cinématique mid1
; (scènes 9 à 25 de analysis/MIDGAME_SYSTEM.md § 9), 17 scènes, appelée par
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
Midgame1_PlayPart2_671C0	proc far		; CODE XREF: Stub_Midgame1_PlayPart2_423E0J

var_22C		= word ptr -22Ch
var_1DA		= word ptr -1DAh
var_1D8		= word ptr -1D8h
var_164		= word ptr -164h
var_158		= word ptr -158h
var_156		= word ptr -156h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_148		= word ptr -148h
var_144		= word ptr -144h
var_142		= word ptr -142h
var_13F		= word ptr -13Fh
var_13D		= word ptr -13Dh
var_13B		= word ptr -13Bh
var_139		= word ptr -139h
var_136		= word ptr -136h
var_134		= word ptr -134h
var_128		= word ptr -128h
var_11D		= word ptr -11Dh
var_11B		= word ptr -11Bh
var_119		= word ptr -119h
var_117		= word ptr -117h
var_114		= word ptr -114h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B4		= word ptr -0B4h
var_B2		= word ptr -0B2h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= byte ptr -0A8h
var_A7		= byte ptr -0A7h
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= byte ptr -9Eh
var_9D		= byte ptr -9Dh
var_9C		= dword	ptr -9Ch
var_98		= word ptr -98h
var_96		= dword	ptr -96h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= word ptr -86h
var_84		= dword	ptr -84h
var_80		= word ptr -80h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= word ptr -6Eh
var_6C		= dword	ptr -6Ch
var_68		= word ptr -68h
var_66		= dword	ptr -66h
var_62		= word ptr -62h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= word ptr -4Eh
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword	ptr -42h
var_3D		= byte ptr -3Dh
var_3C		= word ptr -3Ch
var_3A		= byte ptr -3Ah
var_39		= word ptr -39h
var_36		= dword	ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1F		= word ptr -1Fh
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
var_2		= byte ptr -2
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
		sub	sp, 22Ch
		push	si
		push	di
		mov	al, byte_46848
		mov	[bp+var_2], al
		mov	[bp+var_4], 0FFFBh
		mov	[bp+var_6], 0
		mov	[bp+var_8], 6
		mov	[bp+var_A], 0
		mov	[bp+var_C], 0FFF9h
		mov	[bp+var_E], 0
		mov	[bp+var_10], 7
		mov	[bp+var_12], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		push	2Bh ; '+'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_1F], 0
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [di+2]
		mov	[bp+var_4E], ax
		mov	ax, [di+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [di+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_158]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_158], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_13F], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_13D], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_13B], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_139], ax
		mov	[bp+var_66+2], 0
		mov	byte ptr [bp+var_60], 2
		mov	byte ptr [bp+var_60+1],	0
		mov	[bp+var_60+2], 0
		push	3
		lea	ax, [bp+var_66+2]
		push	ax
		push	1EDCh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_14]
		mov	word ptr [bp+var_66], ax
		mov	bx, word ptr [bp+var_66]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_66]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_66]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_68], ax
		push	[bp+var_68]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1
		push	0
		push	0
		push	[bp+arg_E]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_6C+2],	ax
		push	word ptr [bp+var_6C+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_66+2]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	word ptr [bp+var_6C], ax
		push	27h ; '''
		push	7Fh ; ''
		push	0A0h ; '�'
		lea	ax, [bp+var_66+2]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_6E], ax
		push	1Fh
		push	word ptr [bp+var_6C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+var_6C]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_6E]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+arg_12], 0
		jnz	short loc_673EE
		jmp	loc_674AD
; ���������������������������������������������������������������������������

loc_673EE:				; CODE XREF: Midgame1_PlayPart2_671C0+229j
		mov	[bp+var_7A+2], 0
		mov	byte ptr [bp+var_76+2],	2
		mov	byte ptr [bp+var_76+3],	0
		mov	[bp+var_72], 0
		push	2
		lea	ax, [bp+var_7A+2]
		push	ax
		push	4
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_7A+2]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	1EE0h
		push	word ptr [bp+var_6C]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4
		jmp	short loc_67455
; ���������������������������������������������������������������������������

loc_67448:				; CODE XREF: Midgame1_PlayPart2_671C0+2A6j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_67455:				; CODE XREF: Midgame1_PlayPart2_671C0+286j
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_67448
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_76+3],	0
		jz	short loc_67497
		cmp	[bp+var_7A+2], 0
		jz	short loc_67497
		push	0
		mov	al, byte ptr [bp+var_76+2]
		push	ax
		lea	ax, [bp+var_7A+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67497:				; CODE XREF: Midgame1_PlayPart2_671C0+2B7j
					; Midgame1_PlayPart2_671C0+2BEj
		mov	[bp+var_7A+2], 0
		mov	byte ptr [bp+var_76+3],	0
		mov	[bp+var_72], 0
		jmp	short loc_6750F
; ���������������������������������������������������������������������������

loc_674AD:				; CODE XREF: Midgame1_PlayPart2_671C0+22Bj
		push	0E0h ; '�'
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
		lea	ax, [bp+var_158]
		push	ax
		call	sub_C8F5
		add	sp, 4
		push	1F0Ah
		push	word ptr [bp+var_6C]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4
		jmp	short loc_674F4
; ���������������������������������������������������������������������������

loc_674E7:				; CODE XREF: Midgame1_PlayPart2_671C0+34Dj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_674F4:				; CODE XREF: Midgame1_PlayPart2_671C0+325j
		cmp	[bp+var_119], 1Eh
		jnb	short loc_67502
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_67507

loc_67502:				; CODE XREF: Midgame1_PlayPart2_671C0+339j
		mov	ax, 1
		jmp	short loc_67509
; ���������������������������������������������������������������������������

loc_67507:				; CODE XREF: Midgame1_PlayPart2_671C0+340j
		xor	ax, ax

loc_67509:				; CODE XREF: Midgame1_PlayPart2_671C0+345j
		mov	ah, 0
		or	ax, ax
		jz	short loc_674E7

loc_6750F:				; CODE XREF: Midgame1_PlayPart2_671C0+2EBj
		cmp	byte ptr [bp+var_60+1],	0
		jz	short loc_67533
		cmp	[bp+var_66+2], 0
		jz	short loc_67533
		push	0
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_66+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67533:				; CODE XREF: Midgame1_PlayPart2_671C0+353j
					; Midgame1_PlayPart2_671C0+35Aj
		mov	[bp+var_66+2], 0
		mov	byte ptr [bp+var_60+1],	0
		mov	[bp+var_60+2], 0
		lea	ax, [bp+var_156]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_675B4
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6759C
		cmp	[bp+var_1C], 0
		jz	short loc_6759C
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6759C:				; CODE XREF: Midgame1_PlayPart2_671C0+3BCj
					; Midgame1_PlayPart2_671C0+3C3j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_675B4:				; CODE XREF: Midgame1_PlayPart2_671C0+3A8j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	[bp+arg_12], 0
		jz	short loc_675F6
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	0Ah
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		jmp	short loc_6761B
; ���������������������������������������������������������������������������

loc_675F6:				; CODE XREF: Midgame1_PlayPart2_671C0+410j
		cmp	[bp+arg_46], 0
		jz	short loc_6761B
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 1Eh
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_6761B:				; CODE XREF: Midgame1_PlayPart2_671C0+434j
					; Midgame1_PlayPart2_671C0+43Aj
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		push	36h ; '6'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_60+1],	0
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_62]
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_16]
		mov	word ptr [bp+var_66+2],	ax
		mov	bx, word ptr [bp+var_66+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_66+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_66+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_72+2], 0
		mov	byte ptr [bp+var_6C], 2
		mov	byte ptr [bp+var_6C+1],	0
		mov	[bp+var_6C+2], 0
		push	3
		lea	ax, [bp+var_72+2]
		push	ax
		push	14h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_76+2],	ax
		or	ax, ax
		jz	short loc_6775B
		push	0FFD8h
		push	0
		lea	ax, [bp+var_72+2]
		push	ax
		push	word ptr [bp+var_76+2]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_76+2]
		mov	word ptr [bx], 135Eh
		mov	bx, word ptr [bp+var_76+2]
		mov	word ptr [bx+0Ah], 137Eh
		mov	bx, word ptr [bp+var_76+2]
		mov	byte ptr [bx+1Dh], 0
		mov	ax, word ptr [bp+var_76+2]
		jmp	short loc_6775E
; ���������������������������������������������������������������������������

loc_6775B:				; CODE XREF: Midgame1_PlayPart2_671C0+56Bj
		mov	ax, word ptr [bp+var_76+2]

loc_6775E:				; CODE XREF: Midgame1_PlayPart2_671C0+599j
		mov	word ptr [bp+var_72], ax
		push	word ptr [bp+var_72]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0FFE8h
		push	0
		push	[bp+arg_E]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_76], ax
		push	word ptr [bp+var_76]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	28h ; '('
		push	9Fh ; '�'
		push	[bp+arg_18]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_7A+2],	ax
		push	word ptr [bp+var_7A+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	6Ch ; 'l'
		push	63h ; 'c'
		push	[bp+arg_1A]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_7A], ax
		push	word ptr [bp+var_7A]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	6Bh ; 'k'
		push	0C3h ; '�'
		push	[bp+arg_1A]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_7E+2],	ax
		push	word ptr [bp+var_7E+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	7
		push	16h
		push	87h ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_7E], ax
		push	word ptr [bp+var_7E]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	10h
		push	16h
		push	0B9h ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_80], ax
		push	[bp+var_80]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	15h
		push	26h ; '&'
		push	0A0h ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_84+2],	ax
		push	word ptr [bp+var_84+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	16h
		push	6Dh ; 'm'
		push	0A9h ; '�'
		push	[bp+arg_18]
		push	0
		call	ClippedMovingImageLayer_Construct_B45E
		add	sp, 0Ah
		mov	word ptr [bp+var_84], ax
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+23h], 9
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	word ptr [bp+var_84]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	17h
		push	6Dh ; 'm'
		push	0A9h ; '�'
		push	[bp+arg_18]
		push	0
		call	ClippedMovingImageLayer_Construct_B45E
		add	sp, 0Ah
		mov	[bp+var_86], ax
		mov	bx, [bp+var_86]
		mov	word ptr [bx+21h], 83h ; '�'
		mov	bx, [bp+var_86]
		mov	word ptr [bx+23h], 9
		mov	bx, [bp+var_86]
		mov	word ptr [bx+25h], 0BEh	; '�'
		mov	bx, [bp+var_86]
		mov	word ptr [bx+27h], 43h ; 'C'
		push	[bp+var_86]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	18h
		push	28h ; '('
		push	9Fh ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_8A+2],	ax
		push	word ptr [bp+var_8A+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Ah
		push	11h
		push	8Ah ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_8A], ax
		push	word ptr [bp+var_8A]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	3Fh ; '?'
		push	8Ch ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_8E+2],	ax
		push	word ptr [bp+var_8E+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Ch
		push	3Fh ; '?'
		push	0B2h ; '�'
		push	[bp+arg_18]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_8E], ax
		push	word ptr [bp+var_8E]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_16]
		push	word ptr [bx]
		mov	bx, [bp+arg_16]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_16]
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_90], 10h
		mov	[bp+var_92], 7
		lea	ax, [bp+var_1DA]
		push	ss
		push	ax
		push	ds
		push	offset unk_44DF6
		mov	cx, 0A4h ; '�'
		call	CRT_Fmemcpy
		mov	eax, dword_44E9A
		mov	[bp+var_96], eax
		mov	si, 1E7Eh
		lea	di, [bp+var_22C]
		push	ss
		pop	es
		mov	cx, 29h	; ')'
		rep movsw
		cmp	[bp+arg_12], 0
		jz	short loc_67A2C
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4

loc_67A2C:				; CODE XREF: Midgame1_PlayPart2_671C0+85Aj
		cmp	[bp+arg_46], 0
		jz	short loc_67A52
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_67A52
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_67A52:				; CODE XREF: Midgame1_PlayPart2_671C0+870j
					; Midgame1_PlayPart2_671C0+878j
		jmp	loc_67C78
; ���������������������������������������������������������������������������

loc_67A55:				; CODE XREF: Midgame1_PlayPart2_671C0+AD3j
		test	[bp+var_119], 1
		jz	short loc_67AA7
		inc	[bp+var_90]
		mov	ax, [bp+var_90]
		cmp	ax, 15h
		jnz	short loc_67A70
		mov	[bp+var_90], 10h

loc_67A70:				; CODE XREF: Midgame1_PlayPart2_671C0+8A8j
		mov	ax, [bp+var_90]
		mov	[bp+var_98], ax
		mov	bx, [bp+var_80]
		mov	ax, [bp+var_98]
		mov	[bx+1Bh], ax
		inc	[bp+var_92]
		mov	ax, [bp+var_92]
		cmp	ax, 10h
		jnz	short loc_67A95
		mov	[bp+var_92], 7

loc_67A95:				; CODE XREF: Midgame1_PlayPart2_671C0+8CDj
		mov	ax, [bp+var_92]
		mov	word ptr [bp+var_9C+2],	ax
		mov	bx, word ptr [bp+var_7E]
		mov	ax, word ptr [bp+var_9C+2]
		mov	[bx+1Bh], ax

loc_67AA7:				; CODE XREF: Midgame1_PlayPart2_671C0+89Bj
		mov	bx, [bp+var_119]
		shl	bx, 2
		lea	ax, [bp+var_1DA]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_96]
		mov	word ptr [bp+var_9C], ax
		mov	bx, [bp+var_119]
		shl	bx, 2
		lea	ax, [bp+var_1D8]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_96+2]
		mov	word ptr [bp+var_9E], ax
		mov	bx, word ptr [bp+var_84]
		mov	ax, word ptr [bp+var_9C]
		mov	[bx+0Ch], ax
		mov	bx, word ptr [bp+var_84]
		mov	ax, word ptr [bp+var_9E]
		mov	[bx+0Eh], ax
		cmp	[bp+var_119], 8
		jnb	short loc_67B29
		cmp	word_44EF0, 0B9h ; '�'
		jge	short loc_67B02
		cmp	word_44EF0, 88h	; '�'
		jg	short loc_67B0D

loc_67B02:				; CODE XREF: Midgame1_PlayPart2_671C0+938j
		mov	dx, 0FFFFh
		mov	ax, word_44EF4
		imul	dx
		mov	word_44EF4, ax

loc_67B0D:				; CODE XREF: Midgame1_PlayPart2_671C0+940j
		cmp	word_44EF2, 3Eh	; '>'
		jge	short loc_67B1B
		cmp	word_44EF2, 0Eh
		jg	short loc_67B26

loc_67B1B:				; CODE XREF: Midgame1_PlayPart2_671C0+952j
		mov	dx, 0FFFFh
		mov	ax, word_44EF6
		imul	dx
		mov	word_44EF6, ax

loc_67B26:				; CODE XREF: Midgame1_PlayPart2_671C0+959j
		jmp	loc_67BBC
; ���������������������������������������������������������������������������

loc_67B29:				; CODE XREF: Midgame1_PlayPart2_671C0+930j
		mov	bx, [bp+var_119]
		shl	bx, 2
		lea	ax, [bp+var_1DA]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_96]
		sub	ax, word_44EF0
		mov	word_44EF4, ax
		mov	bx, [bp+var_119]
		shl	bx, 2
		lea	ax, [bp+var_1D8]
		add	bx, ax
		mov	ax, [bx]
		add	ax, word ptr [bp+var_96+2]
		sub	ax, word_44EF2
		mov	word_44EF6, ax
		cmp	[bp+var_119], 12h
		jnb	short loc_67B7C
		mov	ax, word_44EF4
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	word_44EF4, ax
		mov	ax, word_44EF6
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	word_44EF6, ax
		jmp	short loc_67BBC
; ���������������������������������������������������������������������������

loc_67B7C:				; CODE XREF: Midgame1_PlayPart2_671C0+9A2j
		test	[bp+var_119], 1
		jz	short loc_67BA1
		mov	bx, [bp+var_86]
		mov	word ptr [bx+1Bh], 17h
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+1Bh], 16h
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+1Bh], 15h
		jmp	short loc_67BBC
; ���������������������������������������������������������������������������

loc_67BA1:				; CODE XREF: Midgame1_PlayPart2_671C0+9C2j
		mov	bx, [bp+var_86]
		mov	word ptr [bx+1Bh], 19h
		mov	bx, word ptr [bp+var_84]
		mov	word ptr [bx+1Bh], 19h
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+1Bh], 19h

loc_67BBC:				; CODE XREF: Midgame1_PlayPart2_671C0:loc_67B26j
					; Midgame1_PlayPart2_671C0+9BAj ...
		mov	ax, word_44EF4
		add	word_44EF0, ax
		mov	ax, word_44EF6
		add	word_44EF2, ax
		mov	si, word_44EF0
		mov	di, word_44EF2
		mov	bx, [bp+var_86]
		mov	[bx+0Ch], si
		mov	bx, [bp+var_86]
		mov	[bx+0Eh], di
		mov	bx, [bp+var_119]
		shl	bx, 1
		lea	ax, [bp+var_22C]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_A2+2],	ax
		mov	bx, word ptr [bp+var_7A+2]
		mov	ax, word ptr [bp+var_A2+2]
		mov	[bx+1Bh], ax
		mov	bx, [bp+var_119]
		shl	bx, 1
		lea	ax, [bp+var_22C]
		add	bx, ax
		cmp	word ptr [bx], 3
		jle	short loc_67C17
		mov	bx, word ptr [bp+var_7A]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_67C3A
; ���������������������������������������������������������������������������

loc_67C17:				; CODE XREF: Midgame1_PlayPart2_671C0+A4Bj
		mov	bx, [bp+var_119]
		shl	bx, 1
		lea	ax, [bp+var_22C]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_67C32
		mov	bx, word ptr [bp+var_7A]
		mov	word ptr [bx+1Bh], 2
		jmp	short loc_67C3A
; ���������������������������������������������������������������������������

loc_67C32:				; CODE XREF: Midgame1_PlayPart2_671C0+A66j
		mov	bx, word ptr [bp+var_7A]
		mov	word ptr [bx+1Bh], 0

loc_67C3A:				; CODE XREF: Midgame1_PlayPart2_671C0+A55j
					; Midgame1_PlayPart2_671C0+A70j
		mov	ax, word_44EF8
		add	word_44EFA, ax
		cmp	word_44EFA, 5
		jge	short loc_67C4F
		cmp	word_44EFA, 3
		jg	short loc_67C5A

loc_67C4F:				; CODE XREF: Midgame1_PlayPart2_671C0+A86j
		mov	dx, 0FFFFh
		mov	ax, word_44EF8
		imul	dx
		mov	word_44EF8, ax

loc_67C5A:				; CODE XREF: Midgame1_PlayPart2_671C0+A8Dj
		mov	ax, word_44EFA
		mov	word ptr [bp+var_A2], ax
		mov	bx, word ptr [bp+var_7E+2]
		mov	ax, word ptr [bp+var_A2]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_67C78:				; CODE XREF: Midgame1_PlayPart2_671C0:loc_67A52j
		cmp	[bp+var_119], 28h ; '('
		jnb	short loc_67C86
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_67C8B

loc_67C86:				; CODE XREF: Midgame1_PlayPart2_671C0+ABDj
		mov	ax, 1
		jmp	short loc_67C8D
; ���������������������������������������������������������������������������

loc_67C8B:				; CODE XREF: Midgame1_PlayPart2_671C0+AC4j
		xor	ax, ax

loc_67C8D:				; CODE XREF: Midgame1_PlayPart2_671C0+AC9j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67C96
		jmp	loc_67A55
; ���������������������������������������������������������������������������

loc_67C96:				; CODE XREF: Midgame1_PlayPart2_671C0+AD1j
		cmp	[bp+arg_12], 0
		jz	short loc_67CA7
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_67CA7:				; CODE XREF: Midgame1_PlayPart2_671C0+ADAj
		cmp	[bp+arg_46], 0
		jz	short loc_67CB8
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_67CB8:				; CODE XREF: Midgame1_PlayPart2_671C0+AEBj
		cmp	byte ptr [bp+var_6C+1],	0
		jz	short loc_67CDC
		cmp	[bp+var_72+2], 0
		jz	short loc_67CDC
		push	0
		mov	al, byte ptr [bp+var_6C]
		push	ax
		lea	ax, [bp+var_72+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67CDC:				; CODE XREF: Midgame1_PlayPart2_671C0+AFCj
					; Midgame1_PlayPart2_671C0+B03j
		mov	[bp+var_72+2], 0
		mov	byte ptr [bp+var_6C+1],	0
		mov	[bp+var_6C+2], 0
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_57], 0
		jz	short loc_67D22
		cmp	[bp+var_5C], 0
		jz	short loc_67D22
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67D22:				; CODE XREF: Midgame1_PlayPart2_671C0+B42j
					; Midgame1_PlayPart2_671C0+B49j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_67D69
		cmp	[bp+var_52], 0
		jz	short loc_67D69
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67D69:				; CODE XREF: Midgame1_PlayPart2_671C0+B89j
					; Midgame1_PlayPart2_671C0+B90j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	[bp+arg_0]
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	3
		lea	ax, [bp+var_52]
		push	ax
		push	18h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		push	3Ah ; ':'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_60+1],	0
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_62]
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		jmp	short loc_67E6B
; ���������������������������������������������������������������������������

loc_67E5E:				; CODE XREF: Midgame1_PlayPart2_671C0+CB8j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_67E6B:				; CODE XREF: Midgame1_PlayPart2_671C0+C9Cj
		push	si
		call	AnimLayer_IsFinished_2E654
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_67E5E
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_57], 0
		jz	short loc_67EAC
		cmp	[bp+var_5C], 0
		jz	short loc_67EAC
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67EAC:				; CODE XREF: Midgame1_PlayPart2_671C0+CCCj
					; Midgame1_PlayPart2_671C0+CD3j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_67EE4
		cmp	[bp+var_52], 0
		jz	short loc_67EE4
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67EE4:				; CODE XREF: Midgame1_PlayPart2_671C0+D04j
					; Midgame1_PlayPart2_671C0+D0Bj
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_67F58
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_67F40
		cmp	[bp+var_1C], 0
		jz	short loc_67F40
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_67F40:				; CODE XREF: Midgame1_PlayPart2_671C0+D60j
					; Midgame1_PlayPart2_671C0+D67j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_67F58:				; CODE XREF: Midgame1_PlayPart2_671C0+D4Cj
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	[bp+arg_12], 0
		jz	short loc_67F9A
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	0Bh
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		jmp	short loc_67FBF
; ���������������������������������������������������������������������������

loc_67F9A:				; CODE XREF: Midgame1_PlayPart2_671C0+DB4j
		cmp	[bp+arg_46], 0
		jz	short loc_67FBF
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 28h	; '('
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_67FBF:				; CODE XREF: Midgame1_PlayPart2_671C0+DD8j
					; Midgame1_PlayPart2_671C0+DDEj
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		push	31h ; '1'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_60+1],	0
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	di, [bp+arg_1C]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_1E]
		mov	word ptr [bp+var_66+2],	ax
		mov	bx, word ptr [bp+var_66+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_66+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_66+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_62]
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_72+2], 0
		mov	byte ptr [bp+var_6C], 2
		mov	byte ptr [bp+var_6C+1],	0
		mov	[bp+var_6C+2], 0
		push	3
		lea	ax, [bp+var_72+2]
		push	ax
		push	10h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7A], 0
		mov	byte ptr [bp+var_76], 2
		mov	byte ptr [bp+var_76+1],	0
		mov	[bp+var_76+2], 0
		push	3
		lea	ax, [bp+var_7A]
		push	ax
		push	12h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_72+2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, [bp+var_7A]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	word ptr [bp+var_7E+2],	ax
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	loc_681C1
; ���������������������������������������������������������������������������

loc_6813A:				; CODE XREF: Midgame1_PlayPart2_671C0+101Cj
		cmp	[bp+var_119], 14h
		jnz	short loc_6816F
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	si, si
		jz	short loc_6815F
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6815F:				; CODE XREF: Midgame1_PlayPart2_671C0+F91j
		push	word ptr [bp+var_7E+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_6816F:				; CODE XREF: Midgame1_PlayPart2_671C0+F7Fj
		cmp	[bp+var_119], 0Fh
		jnz	short loc_681B4
		cmp	[bp+arg_12], 0
		jz	short loc_6818E
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_681B4
; ���������������������������������������������������������������������������

loc_6818E:				; CODE XREF: Midgame1_PlayPart2_671C0+FBAj
		cmp	[bp+arg_46], 0
		jz	short loc_681B4
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_681B4
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_681B4:				; CODE XREF: Midgame1_PlayPart2_671C0+FB4j
					; Midgame1_PlayPart2_671C0+FCCj ...
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_681C1:				; CODE XREF: Midgame1_PlayPart2_671C0+F77j
		cmp	[bp+var_119], 29h ; ')'
		jnb	short loc_681CF
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_681D4

loc_681CF:				; CODE XREF: Midgame1_PlayPart2_671C0+1006j
		mov	ax, 1
		jmp	short loc_681D6
; ���������������������������������������������������������������������������

loc_681D4:				; CODE XREF: Midgame1_PlayPart2_671C0+100Dj
		xor	ax, ax

loc_681D6:				; CODE XREF: Midgame1_PlayPart2_671C0+1012j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_681DF
		jmp	loc_6813A
; ���������������������������������������������������������������������������

loc_681DF:				; CODE XREF: Midgame1_PlayPart2_671C0+101Aj
		cmp	[bp+arg_12], 0
		jz	short loc_681F0
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_681F0:				; CODE XREF: Midgame1_PlayPart2_671C0+1023j
		cmp	[bp+arg_46], 0
		jz	short loc_68201
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_68201:				; CODE XREF: Midgame1_PlayPart2_671C0+1034j
		cmp	byte ptr [bp+var_76+1],	0
		jz	short loc_68225
		cmp	[bp+var_7A], 0
		jz	short loc_68225
		push	0
		mov	al, byte ptr [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68225:				; CODE XREF: Midgame1_PlayPart2_671C0+1045j
					; Midgame1_PlayPart2_671C0+104Cj
		mov	[bp+var_7A], 0
		mov	byte ptr [bp+var_76+1],	0
		mov	[bp+var_76+2], 0
		cmp	byte ptr [bp+var_6C+1],	0
		jz	short loc_6825D
		cmp	[bp+var_72+2], 0
		jz	short loc_6825D
		push	0
		mov	al, byte ptr [bp+var_6C]
		push	ax
		lea	ax, [bp+var_72+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6825D:				; CODE XREF: Midgame1_PlayPart2_671C0+107Dj
					; Midgame1_PlayPart2_671C0+1084j
		mov	[bp+var_72+2], 0
		mov	byte ptr [bp+var_6C+1],	0
		mov	[bp+var_6C+2], 0
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_57], 0
		jz	short loc_682A3
		cmp	[bp+var_5C], 0
		jz	short loc_682A3
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_682A3:				; CODE XREF: Midgame1_PlayPart2_671C0+10C3j
					; Midgame1_PlayPart2_671C0+10CAj
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_682EA
		cmp	[bp+var_52], 0
		jz	short loc_682EA
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_682EA:				; CODE XREF: Midgame1_PlayPart2_671C0+110Aj
					; Midgame1_PlayPart2_671C0+1111j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	byte_495FC, 0
		jz	short loc_6834F
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_68337
		cmp	[bp+var_1C], 0
		jz	short loc_68337
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68337:				; CODE XREF: Midgame1_PlayPart2_671C0+1157j
					; Midgame1_PlayPart2_671C0+115Ej
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6834F:				; CODE XREF: Midgame1_PlayPart2_671C0+1143j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	[bp+arg_12], 0
		jz	short loc_68391
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	0Ch
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		jmp	short loc_683B6
; ���������������������������������������������������������������������������

loc_68391:				; CODE XREF: Midgame1_PlayPart2_671C0+11ABj
		cmp	[bp+arg_46], 0
		jz	short loc_683B6
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 32h	; '2'
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_683B6:				; CODE XREF: Midgame1_PlayPart2_671C0+11CFj
					; Midgame1_PlayPart2_671C0+11D5j
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_60+2], 0
		mov	byte ptr [bp+var_5C+2],	2
		mov	byte ptr [bp+var_5C+3],	0
		mov	dword ptr [bp+var_58], 0
		push	3
		lea	ax, [bp+var_60+2]
		push	ax
		push	0Fh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_60+2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_68490
; ���������������������������������������������������������������������������

loc_6843E:				; CODE XREF: Midgame1_PlayPart2_671C0+12DDj
		cmp	[bp+var_119], 16h
		jnz	short loc_68483
		cmp	[bp+arg_12], 0
		jz	short loc_6845D
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_68483
; ���������������������������������������������������������������������������

loc_6845D:				; CODE XREF: Midgame1_PlayPart2_671C0+1289j
		cmp	[bp+arg_46], 0
		jz	short loc_68483
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_68483
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_68483:				; CODE XREF: Midgame1_PlayPart2_671C0+1283j
					; Midgame1_PlayPart2_671C0+129Bj ...
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_68490:				; CODE XREF: Midgame1_PlayPart2_671C0+127Cj
		push	si
		call	AnimLayer_IsFinished_2E654
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6843E
		cmp	byte ptr [bp+var_5C+3],	0
		jz	short loc_684C3
		cmp	[bp+var_60+2], 0
		jz	short loc_684C3
		push	0
		mov	al, byte ptr [bp+var_5C+2]
		push	ax
		lea	ax, [bp+var_60+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_684C3:				; CODE XREF: Midgame1_PlayPart2_671C0+12E3j
					; Midgame1_PlayPart2_671C0+12EAj
		mov	[bp+var_60+2], 0
		mov	byte ptr [bp+var_5C+3],	0
		mov	dword ptr [bp+var_58], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_684F0
		jmp	loc_68572
; ���������������������������������������������������������������������������

loc_684F0:				; CODE XREF: Midgame1_PlayPart2_671C0+132Bj
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_68514
		cmp	[bp+var_52], 0
		jz	short loc_68514
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68514:				; CODE XREF: Midgame1_PlayPart2_671C0+1334j
					; Midgame1_PlayPart2_671C0+133Bj
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6855A
		cmp	[bp+var_1C], 0
		jz	short loc_6855A
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6855A:				; CODE XREF: Midgame1_PlayPart2_671C0+137Aj
					; Midgame1_PlayPart2_671C0+1381j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_68572:				; CODE XREF: Midgame1_PlayPart2_671C0+132Dj
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		push	33h ; '3'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_60+1],	0
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_6C], 0
		mov	byte ptr [bp+var_68], 2
		mov	byte ptr [bp+var_68+1],	0
		mov	[bp+var_66], 0
		push	3
		lea	ax, [bp+var_6C]
		push	ax
		push	7
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_76], 0
		mov	byte ptr [bp+var_72], 2
		mov	byte ptr [bp+var_72+1],	0
		mov	[bp+var_72+2], 0
		push	3
		lea	ax, [bp+var_76]
		push	ax
		push	15h
		push	[bp+arg_3E]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	ax, [bp+arg_C]
		mov	word ptr [bp+var_7A], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_7E+2],	ax
		or	ax, ax
		jz	short loc_6867A
		push	0FFD8h
		push	0
		push	word ptr [bp+var_7A]
		push	word ptr [bp+var_7E+2]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Dh], 1
		mov	bx, word ptr [bp+var_7E+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_7E+2]
		jmp	short loc_6867D
; ���������������������������������������������������������������������������

loc_6867A:				; CODE XREF: Midgame1_PlayPart2_671C0+1472j
		mov	ax, word ptr [bp+var_7E+2]

loc_6867D:				; CODE XREF: Midgame1_PlayPart2_671C0+14B8j
		mov	word ptr [bp+var_7A+2],	ax
		push	word ptr [bp+var_7A+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, [bp+arg_C]
		mov	[bp+var_80], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_84+2],	ax
		or	ax, ax
		jz	short loc_686F7
		push	0FFD8h
		push	0FEC0h
		push	[bp+var_80]
		push	word ptr [bp+var_84+2]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+1Dh], 1
		mov	bx, word ptr [bp+var_84+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_84+2]
		jmp	short loc_686FB
; ���������������������������������������������������������������������������

loc_686F7:				; CODE XREF: Midgame1_PlayPart2_671C0+14E6j
		mov	ax, word ptr [bp+var_84+2]

loc_686FB:				; CODE XREF: Midgame1_PlayPart2_671C0+1535j
		mov	word ptr [bp+var_7E], ax
		push	word ptr [bp+var_7E]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_86], ax
		or	ax, ax
		jz	short loc_6876F
		push	0FFD8h
		push	0
		lea	ax, [bp+var_76]
		push	ax
		push	[bp+var_86]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp+var_86]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_86]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_86]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_86]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_86]
		mov	word ptr [bx+1Dh], 1
		mov	bx, [bp+var_86]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_86]
		jmp	short loc_68773
; ���������������������������������������������������������������������������

loc_6876F:				; CODE XREF: Midgame1_PlayPart2_671C0+155Ej
		mov	ax, [bp+var_86]

loc_68773:				; CODE XREF: Midgame1_PlayPart2_671C0+15ADj
		mov	word ptr [bp+var_84], ax
		push	word ptr [bp+var_84]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_8A], ax
		or	ax, ax
		jz	short loc_687EA
		push	0FFD8h
		push	0FEC0h
		lea	ax, [bp+var_76]
		push	ax
		push	word ptr [bp+var_8A]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_8A]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_8A]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_8A]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_8A]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_8A]
		mov	word ptr [bx+1Dh], 1
		mov	bx, word ptr [bp+var_8A]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_8A]
		jmp	short loc_687EE
; ���������������������������������������������������������������������������

loc_687EA:				; CODE XREF: Midgame1_PlayPart2_671C0+15D8j
		mov	ax, word ptr [bp+var_8A]

loc_687EE:				; CODE XREF: Midgame1_PlayPart2_671C0+1628j
		mov	word ptr [bp+var_8A+2],	ax
		push	word ptr [bp+var_8A+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_8E], ax
		or	ax, ax
		jz	short loc_68864
		push	28h ; '('
		push	0
		lea	ax, [bp+var_6C]
		push	ax
		push	word ptr [bp+var_8E]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+1Dh], 2
		mov	bx, word ptr [bp+var_8E]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_8E]
		jmp	short loc_68868
; ���������������������������������������������������������������������������

loc_68864:				; CODE XREF: Midgame1_PlayPart2_671C0+1653j
		mov	ax, word ptr [bp+var_8E]

loc_68868:				; CODE XREF: Midgame1_PlayPart2_671C0+16A2j
		mov	word ptr [bp+var_8E+2],	ax
		push	word ptr [bp+var_8E+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_92], ax
		or	ax, ax
		jz	short loc_688DF
		push	28h ; '('
		push	0FEC0h
		lea	ax, [bp+var_6C]
		push	ax
		push	[bp+var_92]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp+var_92]
		mov	word ptr [bx], 1977h
		mov	bx, [bp+var_92]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp+var_92]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp+var_92]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp+var_92]
		mov	word ptr [bx+1Dh], 2
		mov	bx, [bp+var_92]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp+var_92]
		jmp	short loc_688E3
; ���������������������������������������������������������������������������

loc_688DF:				; CODE XREF: Midgame1_PlayPart2_671C0+16CDj
		mov	ax, [bp+var_92]

loc_688E3:				; CODE XREF: Midgame1_PlayPart2_671C0+171Dj
		mov	[bp+var_90], ax
		push	[bp+var_90]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_9C], 0
		mov	byte ptr [bp+var_98], 2
		mov	byte ptr [bp+var_98+1],	0
		mov	[bp+var_96], 0
		push	3
		lea	ax, [bp+var_9C]
		push	ax
		push	15h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A6], 0
		mov	byte ptr [bp+var_A2], 2
		mov	byte ptr [bp+var_A2+1],	0
		mov	[bp+var_A2+2], 0
		push	3
		lea	ax, [bp+var_A6]
		push	ax
		push	1Dh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_B0], 0
		mov	byte ptr [bp+var_AC], 2
		mov	byte ptr [bp+var_AC+1],	0
		mov	[bp+var_AC+2], 0
		push	3
		lea	ax, [bp+var_B0]
		push	ax
		push	23h ; '#'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_9C]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	di, ax
		push	0
		push	0
		lea	ax, [bp+var_A6]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	[bp+var_B2], ax
		push	di
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_68A57
; ���������������������������������������������������������������������������

loc_689D9:				; CODE XREF: Midgame1_PlayPart2_671C0+18B2j
		mov	ax, [bp+var_119]
		mov	[bp+var_B4], ax
		cmp	[bp+var_B4], 0Eh
		jnz	short loc_68A14
		push	di
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	di, di
		jz	short loc_68A06
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_68A06:				; CODE XREF: Midgame1_PlayPart2_671C0+1838j
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_68A14:				; CODE XREF: Midgame1_PlayPart2_671C0+1826j
		cmp	[bp+var_B4], 1Bh
		jnz	short loc_68A4A
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	si, si
		jz	short loc_68A39
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_68A39:				; CODE XREF: Midgame1_PlayPart2_671C0+186Bj
		push	[bp+var_B2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_68A4A:				; CODE XREF: Midgame1_PlayPart2_671C0+1859j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_68A57:				; CODE XREF: Midgame1_PlayPart2_671C0+1817j
		cmp	[bp+var_119], 29h ; ')'
		jnb	short loc_68A65
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_68A6A

loc_68A65:				; CODE XREF: Midgame1_PlayPart2_671C0+189Cj
		mov	ax, 1
		jmp	short loc_68A6C
; ���������������������������������������������������������������������������

loc_68A6A:				; CODE XREF: Midgame1_PlayPart2_671C0+18A3j
		xor	ax, ax

loc_68A6C:				; CODE XREF: Midgame1_PlayPart2_671C0+18A8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_68A75
		jmp	loc_689D9
; ���������������������������������������������������������������������������

loc_68A75:				; CODE XREF: Midgame1_PlayPart2_671C0+18B0j
		cmp	byte ptr [bp+var_AC+1],	0
		jz	short loc_68A9D
		cmp	[bp+var_B0], 0
		jz	short loc_68A9D
		push	0
		mov	al, byte ptr [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68A9D:				; CODE XREF: Midgame1_PlayPart2_671C0+18BAj
					; Midgame1_PlayPart2_671C0+18C2j
		mov	[bp+var_B0], 0
		mov	byte ptr [bp+var_AC+1],	0
		mov	[bp+var_AC+2], 0
		cmp	byte ptr [bp+var_A2+1],	0
		jz	short loc_68ADC
		cmp	[bp+var_A6], 0
		jz	short loc_68ADC
		push	0
		mov	al, byte ptr [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68ADC:				; CODE XREF: Midgame1_PlayPart2_671C0+18F9j
					; Midgame1_PlayPart2_671C0+1901j
		mov	[bp+var_A6], 0
		mov	byte ptr [bp+var_A2+1],	0
		mov	[bp+var_A2+2], 0
		cmp	byte ptr [bp+var_98+1],	0
		jz	short loc_68B1B
		cmp	[bp+var_9C], 0
		jz	short loc_68B1B
		push	0
		mov	al, byte ptr [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68B1B:				; CODE XREF: Midgame1_PlayPart2_671C0+1938j
					; Midgame1_PlayPart2_671C0+1940j
		mov	[bp+var_9C], 0
		mov	byte ptr [bp+var_98+1],	0
		mov	[bp+var_96], 0
		cmp	byte ptr [bp+var_72+1],	0
		jz	short loc_68B56
		cmp	[bp+var_76], 0
		jz	short loc_68B56
		push	0
		mov	al, byte ptr [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68B56:				; CODE XREF: Midgame1_PlayPart2_671C0+1976j
					; Midgame1_PlayPart2_671C0+197Dj
		mov	[bp+var_76], 0
		mov	byte ptr [bp+var_72+1],	0
		mov	[bp+var_72+2], 0
		cmp	byte ptr [bp+var_68+1],	0
		jz	short loc_68B8E
		cmp	[bp+var_6C], 0
		jz	short loc_68B8E
		push	0
		mov	al, byte ptr [bp+var_68]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68B8E:				; CODE XREF: Midgame1_PlayPart2_671C0+19AEj
					; Midgame1_PlayPart2_671C0+19B5j
		mov	[bp+var_6C], 0
		mov	byte ptr [bp+var_68+1],	0
		mov	[bp+var_66], 0
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_57], 0
		jz	short loc_68BD4
		cmp	[bp+var_5C], 0
		jz	short loc_68BD4
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68BD4:				; CODE XREF: Midgame1_PlayPart2_671C0+19F4j
					; Midgame1_PlayPart2_671C0+19FBj
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+arg_12], 0
		jz	short loc_68C08
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_68C08:				; CODE XREF: Midgame1_PlayPart2_671C0+1A3Bj
		cmp	[bp+arg_46], 0
		jz	short loc_68C19
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_68C19:				; CODE XREF: Midgame1_PlayPart2_671C0+1A4Cj
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_68C3D
		cmp	[bp+var_52], 0
		jz	short loc_68C3D
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68C3D:				; CODE XREF: Midgame1_PlayPart2_671C0+1A5Dj
					; Midgame1_PlayPart2_671C0+1A64j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	byte_495FC, 0
		jz	short loc_68CA2
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_68C8A
		cmp	[bp+var_1C], 0
		jz	short loc_68C8A
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68C8A:				; CODE XREF: Midgame1_PlayPart2_671C0+1AAAj
					; Midgame1_PlayPart2_671C0+1AB1j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_68CA2:				; CODE XREF: Midgame1_PlayPart2_671C0+1A96j
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	[bp+arg_12], 0
		jz	short loc_68CF9
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	0Dh
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		jmp	short loc_68D1E
; ���������������������������������������������������������������������������

loc_68CF9:				; CODE XREF: Midgame1_PlayPart2_671C0+1B13j
		cmp	[bp+arg_46], 0
		jz	short loc_68D1E
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 32h	; '2'
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_68D1E:				; CODE XREF: Midgame1_PlayPart2_671C0+1B37j
					; Midgame1_PlayPart2_671C0+1B3Dj
		push	0FFF6h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_56+2],	ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_56], ax
		push	word ptr [bp+var_56]
		push	word ptr [bp+var_56+2]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_56+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_60], 0
		mov	byte ptr [bp+var_5C], 2
		mov	byte ptr [bp+var_5C+1],	0
		mov	[bp+var_5C+2], 0
		push	3
		lea	ax, [bp+var_60]
		push	ax
		push	11h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_6C+2], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1],	0
		mov	[bp+var_66+2], 0
		push	3
		lea	ax, [bp+var_6C+2]
		push	ax
		push	1Eh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_76+2], 0
		mov	byte ptr [bp+var_72+2],	2
		mov	byte ptr [bp+var_72+3],	0
		mov	dword ptr [bp+var_6E], 0
		push	3
		lea	ax, [bp+var_76+2]
		push	ax
		push	1Fh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_7E], 0
		mov	byte ptr [bp+var_7A], 2
		mov	byte ptr [bp+var_7A+1],	0
		mov	[bp+var_7A+2], 0
		push	3
		lea	ax, [bp+var_7E]
		push	ax
		push	20h ; ' '
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_60]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	[bp+var_80], ax
		push	0
		push	0
		lea	ax, [bp+var_6C+2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	di, ax
		push	0
		push	0
		lea	ax, [bp+var_76+2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	si, ax
		push	0
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	word ptr [bp+var_84+2],	ax
		push	[bp+var_80]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		push	[bp+var_80]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1
		push	55h ; 'U'
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_84], ax
		push	word ptr [bp+var_84]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	37h ; '7'
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_86], ax
		push	[bp+var_86]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	loc_68F8D
; ���������������������������������������������������������������������������

loc_68ED2:				; CODE XREF: Midgame1_PlayPart2_671C0+1DE8j
		mov	ax, [bp+var_119]
		mov	word ptr [bp+var_8A+2],	ax
		cmp	word ptr [bp+var_8A+2],	32h ; '2'
		jnz	short loc_68F09
		push	di
		push	[bp+var_80]
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	di, di
		jz	short loc_68EFD
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_68EFD:				; CODE XREF: Midgame1_PlayPart2_671C0+1D2Fj
		push	si
		push	[bp+var_80]
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_68F09:				; CODE XREF: Midgame1_PlayPart2_671C0+1D1Fj
		cmp	word ptr [bp+var_8A+2],	41h ; 'A'
		jnz	short loc_68F3B
		push	si
		push	[bp+var_80]
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		or	si, si
		jz	short loc_68F2C
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_68F2C:				; CODE XREF: Midgame1_PlayPart2_671C0+1D5Ej
		push	word ptr [bp+var_84+2]
		push	[bp+var_80]
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_68F3B:				; CODE XREF: Midgame1_PlayPart2_671C0+1D4Ej
		cmp	word ptr [bp+var_8A+2],	30h ; '0'
		jnz	short loc_68F80
		cmp	[bp+arg_12], 0
		jz	short loc_68F5A
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_68F80
; ���������������������������������������������������������������������������

loc_68F5A:				; CODE XREF: Midgame1_PlayPart2_671C0+1D86j
		cmp	[bp+arg_46], 0
		jz	short loc_68F80
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_68F80
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_68F80:				; CODE XREF: Midgame1_PlayPart2_671C0+1D80j
					; Midgame1_PlayPart2_671C0+1D98j ...
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_68F8D:				; CODE XREF: Midgame1_PlayPart2_671C0+1D0Fj
		cmp	[bp+var_119], 51h ; 'Q'
		jnb	short loc_68F9B
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_68FA0

loc_68F9B:				; CODE XREF: Midgame1_PlayPart2_671C0+1DD2j
		mov	ax, 1
		jmp	short loc_68FA2
; ���������������������������������������������������������������������������

loc_68FA0:				; CODE XREF: Midgame1_PlayPart2_671C0+1DD9j
		xor	ax, ax

loc_68FA2:				; CODE XREF: Midgame1_PlayPart2_671C0+1DDEj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_68FAB
		jmp	loc_68ED2
; ���������������������������������������������������������������������������

loc_68FAB:				; CODE XREF: Midgame1_PlayPart2_671C0+1DE6j
		cmp	[bp+arg_12], 0
		jz	short loc_68FBC
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_68FBC:				; CODE XREF: Midgame1_PlayPart2_671C0+1DEFj
		cmp	[bp+arg_46], 0
		jz	short loc_68FCD
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_68FCD:				; CODE XREF: Midgame1_PlayPart2_671C0+1E00j
		cmp	byte ptr [bp+var_7A+1],	0
		jz	short loc_68FF1
		cmp	[bp+var_7E], 0
		jz	short loc_68FF1
		push	0
		mov	al, byte ptr [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_68FF1:				; CODE XREF: Midgame1_PlayPart2_671C0+1E11j
					; Midgame1_PlayPart2_671C0+1E18j
		mov	[bp+var_7E], 0
		mov	byte ptr [bp+var_7A+1],	0
		mov	[bp+var_7A+2], 0
		cmp	byte ptr [bp+var_72+3],	0
		jz	short loc_69029
		cmp	[bp+var_76+2], 0
		jz	short loc_69029
		push	0
		mov	al, byte ptr [bp+var_72+2]
		push	ax
		lea	ax, [bp+var_76+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69029:				; CODE XREF: Midgame1_PlayPart2_671C0+1E49j
					; Midgame1_PlayPart2_671C0+1E50j
		mov	[bp+var_76+2], 0
		mov	byte ptr [bp+var_72+3],	0
		mov	dword ptr [bp+var_6E], 0
		cmp	byte ptr [bp+var_66+1],	0
		jz	short loc_69061
		cmp	[bp+var_6C+2], 0
		jz	short loc_69061
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, [bp+var_6C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69061:				; CODE XREF: Midgame1_PlayPart2_671C0+1E81j
					; Midgame1_PlayPart2_671C0+1E88j
		mov	[bp+var_6C+2], 0
		mov	byte ptr [bp+var_66+1],	0
		mov	[bp+var_66+2], 0
		cmp	byte ptr [bp+var_5C+1],	0
		jz	short loc_69099
		cmp	[bp+var_60], 0
		jz	short loc_69099
		push	0
		mov	al, byte ptr [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69099:				; CODE XREF: Midgame1_PlayPart2_671C0+1EB9j
					; Midgame1_PlayPart2_671C0+1EC0j
		mov	[bp+var_60], 0
		mov	byte ptr [bp+var_5C+1],	0
		mov	[bp+var_5C+2], 0
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_690D1
		cmp	[bp+var_52], 0
		jz	short loc_690D1
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_690D1:				; CODE XREF: Midgame1_PlayPart2_671C0+1EF1j
					; Midgame1_PlayPart2_671C0+1EF8j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_69145
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6912D
		cmp	[bp+var_1C], 0
		jz	short loc_6912D
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6912D:				; CODE XREF: Midgame1_PlayPart2_671C0+1F4Dj
					; Midgame1_PlayPart2_671C0+1F54j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_69145:				; CODE XREF: Midgame1_PlayPart2_671C0+1F39j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	si, [bp+arg_8]
		mov	ax, [si]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [si+2]
		mov	[bp+var_4E], ax
		mov	ax, [si+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [si+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_158]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_158], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_13F], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_13D], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_13B], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_139], ax
		mov	di, [bp+arg_36]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_38]
		mov	word ptr [bp+var_5C], ax
		mov	bx, word ptr [bp+var_5C]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_5C]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_5C]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_60+2],	ax
		push	word ptr [bp+var_60+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	0FFDDh
		push	1
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	word ptr [bp+var_60], ax
		push	0
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	1
		push	[bp+var_12]
		push	[bp+var_10]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66+2],	ax
		push	[bp+var_62]
		push	word ptr [bp+var_60]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_66+2]
		push	word ptr [bp+var_60]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_60]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Eh
		push	0
		push	[bp+arg_3A]
		push	0
		call	OverlayAnimLayer_Construct_A505
		add	sp, 8
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66]
		push	word ptr [bp+var_60]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+arg_12], 0
		jnz	short loc_692F2
		jmp	loc_693A3
; ���������������������������������������������������������������������������

loc_692F2:				; CODE XREF: Midgame1_PlayPart2_671C0+212Dj
		mov	[bp+var_72+2], 0
		mov	byte ptr [bp+var_6C], 2
		mov	byte ptr [bp+var_6C+1],	0
		mov	[bp+var_6C+2], 0
		push	2
		lea	ax, [bp+var_72+2]
		push	ax
		push	1
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_72+2]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_6934B
; ���������������������������������������������������������������������������

loc_6933E:				; CODE XREF: Midgame1_PlayPart2_671C0+219Cj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6934B:				; CODE XREF: Midgame1_PlayPart2_671C0+217Cj
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6933E
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_6C+1],	0
		jz	short loc_6938D
		cmp	[bp+var_72+2], 0
		jz	short loc_6938D
		push	0
		mov	al, byte ptr [bp+var_6C]
		push	ax
		lea	ax, [bp+var_72+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6938D:				; CODE XREF: Midgame1_PlayPart2_671C0+21ADj
					; Midgame1_PlayPart2_671C0+21B4j
		mov	[bp+var_72+2], 0
		mov	byte ptr [bp+var_6C+1],	0
		mov	[bp+var_6C+2], 0
		jmp	short loc_693FA
; ���������������������������������������������������������������������������

loc_693A3:				; CODE XREF: Midgame1_PlayPart2_671C0+212Fj
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
		lea	ax, [bp+var_158]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	short loc_693DF
; ���������������������������������������������������������������������������

loc_693D2:				; CODE XREF: Midgame1_PlayPart2_671C0+2238j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_693DF:				; CODE XREF: Midgame1_PlayPart2_671C0+2210j
		cmp	[bp+var_119], 14h
		jnb	short loc_693ED
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_693F2

loc_693ED:				; CODE XREF: Midgame1_PlayPart2_671C0+2224j
		mov	ax, 1
		jmp	short loc_693F4
; ���������������������������������������������������������������������������

loc_693F2:				; CODE XREF: Midgame1_PlayPart2_671C0+222Bj
		xor	ax, ax

loc_693F4:				; CODE XREF: Midgame1_PlayPart2_671C0+2230j
		mov	ah, 0
		or	ax, ax
		jz	short loc_693D2

loc_693FA:				; CODE XREF: Midgame1_PlayPart2_671C0+21E1j
		mov	[bp+var_119], 0
		jmp	short loc_6940F
; ���������������������������������������������������������������������������

loc_69402:				; CODE XREF: Midgame1_PlayPart2_671C0+2268j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6940F:				; CODE XREF: Midgame1_PlayPart2_671C0+2240j
		cmp	[bp+var_119], 0Ah
		jnb	short loc_6941D
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_69422

loc_6941D:				; CODE XREF: Midgame1_PlayPart2_671C0+2254j
		mov	ax, 1
		jmp	short loc_69424
; ���������������������������������������������������������������������������

loc_69422:				; CODE XREF: Midgame1_PlayPart2_671C0+225Bj
		xor	ax, ax

loc_69424:				; CODE XREF: Midgame1_PlayPart2_671C0+2260j
		mov	ah, 0
		or	ax, ax
		jz	short loc_69402
		lea	ax, [bp+var_156]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_69497
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6947F
		cmp	[bp+var_1C], 0
		jz	short loc_6947F
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6947F:				; CODE XREF: Midgame1_PlayPart2_671C0+229Fj
					; Midgame1_PlayPart2_671C0+22A6j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_69497:				; CODE XREF: Midgame1_PlayPart2_671C0+228Bj
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	si, [bp+arg_24]
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	di, [bp+arg_26]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_4C+2],	ax
		push	word ptr [bp+var_4C+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	0FFD8h
		push	0
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	word ptr [bp+var_4C], ax
		push	2
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_4E], ax
		push	3
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_52+2],	ax
		push	[bp+var_4E]
		push	word ptr [bp+var_4C]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_52+2]
		push	word ptr [bp+var_4C]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_4C]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	18h
		push	0
		push	[bp+arg_28]
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_52], ax
		push	word ptr [bp+var_52]
		push	word ptr [bp+var_4C]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_695C6
; ���������������������������������������������������������������������������

loc_695B9:				; CODE XREF: Midgame1_PlayPart2_671C0+241Fj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_695C6:				; CODE XREF: Midgame1_PlayPart2_671C0+23F7j
		cmp	[bp+var_119], 14h
		jnb	short loc_695D4
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_695D9

loc_695D4:				; CODE XREF: Midgame1_PlayPart2_671C0+240Bj
		mov	ax, 1
		jmp	short loc_695DB
; ���������������������������������������������������������������������������

loc_695D9:				; CODE XREF: Midgame1_PlayPart2_671C0+2412j
		xor	ax, ax

loc_695DB:				; CODE XREF: Midgame1_PlayPart2_671C0+2417j
		mov	ah, 0
		or	ax, ax
		jz	short loc_695B9
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_69641
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_69629
		cmp	[bp+var_1C], 0
		jz	short loc_69629
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69629:				; CODE XREF: Midgame1_PlayPart2_671C0+2449j
					; Midgame1_PlayPart2_671C0+2450j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_69641:				; CODE XREF: Midgame1_PlayPart2_671C0+2435j
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	3
		lea	ax, [bp+var_52]
		push	ax
		push	1F34h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	si, [bp+arg_14]
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1
		push	0
		push	0
		push	[bp+arg_E]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_56], ax
		push	word ptr [bp+var_56]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_52]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	di, ax
		push	di
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_60], 0
		mov	byte ptr [bp+var_5C], 2
		mov	byte ptr [bp+var_5C+1],	0
		mov	[bp+var_5C+2], 0
		push	3
		lea	ax, [bp+var_60]
		push	ax
		push	0
		push	[bp+arg_3E]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_60]
		push	ax
		push	0
		call	ToggleLayer_Construct_B57B
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_697AD
; ���������������������������������������������������������������������������

loc_697A0:				; CODE XREF: Midgame1_PlayPart2_671C0+2606j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_697AD:				; CODE XREF: Midgame1_PlayPart2_671C0+25DEj
		cmp	[bp+var_119], 14h
		jnb	short loc_697BB
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_697C0

loc_697BB:				; CODE XREF: Midgame1_PlayPart2_671C0+25F2j
		mov	ax, 1
		jmp	short loc_697C2
; ���������������������������������������������������������������������������

loc_697C0:				; CODE XREF: Midgame1_PlayPart2_671C0+25F9j
		xor	ax, ax

loc_697C2:				; CODE XREF: Midgame1_PlayPart2_671C0+25FEj
		mov	ah, 0
		or	ax, ax
		jz	short loc_697A0
		cmp	byte ptr [bp+var_5C+1],	0
		jz	short loc_697EC
		cmp	[bp+var_60], 0
		jz	short loc_697EC
		push	0
		mov	al, byte ptr [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_697EC:				; CODE XREF: Midgame1_PlayPart2_671C0+260Cj
					; Midgame1_PlayPart2_671C0+2613j
		mov	[bp+var_60], 0
		mov	byte ptr [bp+var_5C+1],	0
		mov	[bp+var_5C+2], 0
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_69824
		cmp	[bp+var_52], 0
		jz	short loc_69824
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69824:				; CODE XREF: Midgame1_PlayPart2_671C0+2644j
					; Midgame1_PlayPart2_671C0+264Bj
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_69898
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_69880
		cmp	[bp+var_1C], 0
		jz	short loc_69880
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69880:				; CODE XREF: Midgame1_PlayPart2_671C0+26A0j
					; Midgame1_PlayPart2_671C0+26A7j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_69898:				; CODE XREF: Midgame1_PlayPart2_671C0+268Cj
		mov	[bp+var_2C], 0
		mov	[bp+var_28], 2
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	3
		lea	ax, [bp+var_2C]
		push	ax
		push	19h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	2Fh ; '/'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_56+1],	0
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	di, [bp+arg_1E]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_2A]
		mov	word ptr [bp+var_5C+2],	ax
		mov	bx, word ptr [bp+var_5C+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_5C+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_5C+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_58]
		mov	al, byte ptr [bp+var_56]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_66+2], 0
		mov	byte ptr [bp+var_60], 2
		mov	byte ptr [bp+var_60+1],	0
		mov	[bp+var_60+2], 0
		push	3
		lea	ax, [bp+var_66+2]
		push	ax
		push	0Ah
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFC0h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_66], ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_68], ax
		push	[bp+var_68]
		push	word ptr [bp+var_66]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_66]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0
		push	[bp+arg_2C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_6C+2],	ax
		push	word ptr [bp+var_6C+2]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1
		push	5Ah ; 'Z'
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_6C], ax
		push	word ptr [bp+var_6C]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	32h ; '2'
		push	0
		push	[bp+arg_22]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_6E], ax
		push	[bp+var_6E]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Ah
		push	0
		lea	ax, [bp+var_66+2]
		push	ax
		push	0
		call	OverlayAnimLayer_Construct_A505
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [si+1Bh], 1
		jmp	short loc_69AAD
; ���������������������������������������������������������������������������

loc_69A94:				; CODE XREF: Midgame1_PlayPart2_671C0+2906j
		cmp	[bp+var_119], 8
		jbe	short loc_69AA0
		mov	word ptr [si+1Bh], 9

loc_69AA0:				; CODE XREF: Midgame1_PlayPart2_671C0+28D9j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_69AAD:				; CODE XREF: Midgame1_PlayPart2_671C0+28D2j
		cmp	[bp+var_119], 14h
		jnb	short loc_69ABB
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_69AC0

loc_69ABB:				; CODE XREF: Midgame1_PlayPart2_671C0+28F2j
		mov	ax, 1
		jmp	short loc_69AC2
; ���������������������������������������������������������������������������

loc_69AC0:				; CODE XREF: Midgame1_PlayPart2_671C0+28F9j
		xor	ax, ax

loc_69AC2:				; CODE XREF: Midgame1_PlayPart2_671C0+28FEj
		mov	ah, 0
		or	ax, ax
		jz	short loc_69A94
		cmp	byte ptr [bp+var_60+1],	0
		jz	short loc_69AEC
		cmp	[bp+var_66+2], 0
		jz	short loc_69AEC
		push	0
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_66+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69AEC:				; CODE XREF: Midgame1_PlayPart2_671C0+290Cj
					; Midgame1_PlayPart2_671C0+2913j
		mov	[bp+var_66+2], 0
		mov	byte ptr [bp+var_60+1],	0
		mov	[bp+var_60+2], 0
		push	2
		lea	ax, [bp+var_58]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_69B32
		cmp	[bp+var_52], 0
		jz	short loc_69B32
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69B32:				; CODE XREF: Midgame1_PlayPart2_671C0+2952j
					; Midgame1_PlayPart2_671C0+2959j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_69B5F
		jmp	loc_69BE1
; ���������������������������������������������������������������������������

loc_69B5F:				; CODE XREF: Midgame1_PlayPart2_671C0+299Aj
		cmp	[bp+var_27], 0
		jz	short loc_69B83
		cmp	[bp+var_2C], 0
		jz	short loc_69B83
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69B83:				; CODE XREF: Midgame1_PlayPart2_671C0+29A3j
					; Midgame1_PlayPart2_671C0+29AAj
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_69BC9
		cmp	[bp+var_1C], 0
		jz	short loc_69BC9
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69BC9:				; CODE XREF: Midgame1_PlayPart2_671C0+29E9j
					; Midgame1_PlayPart2_671C0+29F0j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_69BE1:				; CODE XREF: Midgame1_PlayPart2_671C0+299Cj
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_36]
		push	ax
		push	17h
		push	[bp+arg_3E]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_39], 0
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	si, [bp+arg_8]
		mov	ax, [si]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [si+2]
		mov	[bp+var_4E], ax
		mov	ax, [si+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [si+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_136]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_136], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_11D], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_11B], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_119], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_117], ax
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_158]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_5C], ax
		push	word ptr [bp+var_5C]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_158]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1],	0
		mov	[bp+var_60], 0
		push	3
		lea	ax, [bp+var_66]
		push	ax
		push	18h
		push	[bp+arg_3E]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFECh
		push	0
		lea	ax, [bp+var_66]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_68], ax
		push	[bp+var_68]
		lea	ax, [bp+var_158]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E], 2
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		push	3
		lea	ax, [bp+var_72]
		push	ax
		push	2
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1
		push	0FFE7h
		push	0
		lea	ax, [bp+var_72]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_76+2],	ax
		push	word ptr [bp+var_76+2]
		lea	ax, [bp+var_158]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_7E], 0
		mov	byte ptr [bp+var_7A], 2
		mov	byte ptr [bp+var_7A+1],	0
		mov	[bp+var_7A+2], 0
		push	3
		lea	ax, [bp+var_7E]
		push	ax
		push	13h
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFD8h
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	[bp+var_80], ax
		push	[bp+var_80]
		lea	ax, [bp+var_158]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		jmp	short loc_69E22
; ���������������������������������������������������������������������������

loc_69E15:				; CODE XREF: Midgame1_PlayPart2_671C0+2C7Bj
		lea	ax, [bp+var_158]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_69E22:				; CODE XREF: Midgame1_PlayPart2_671C0+2C53j
		cmp	[bp+var_13B], 1Eh
		jnb	short loc_69E30
		cmp	byte ptr [bp+var_139], 0
		jz	short loc_69E35

loc_69E30:				; CODE XREF: Midgame1_PlayPart2_671C0+2C67j
		mov	ax, 1
		jmp	short loc_69E37
; ���������������������������������������������������������������������������

loc_69E35:				; CODE XREF: Midgame1_PlayPart2_671C0+2C6Ej
		xor	ax, ax

loc_69E37:				; CODE XREF: Midgame1_PlayPart2_671C0+2C73j
		mov	ah, 0
		or	ax, ax
		jz	short loc_69E15
		cmp	byte ptr [bp+var_7A+1],	0
		jz	short loc_69E61
		cmp	[bp+var_7E], 0
		jz	short loc_69E61
		push	0
		mov	al, byte ptr [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69E61:				; CODE XREF: Midgame1_PlayPart2_671C0+2C81j
					; Midgame1_PlayPart2_671C0+2C88j
		mov	[bp+var_7E], 0
		mov	byte ptr [bp+var_7A+1],	0
		mov	[bp+var_7A+2], 0
		cmp	byte ptr [bp+var_6E+1],	0
		jz	short loc_69E99
		cmp	[bp+var_72], 0
		jz	short loc_69E99
		push	0
		mov	al, byte ptr [bp+var_6E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69E99:				; CODE XREF: Midgame1_PlayPart2_671C0+2CB9j
					; Midgame1_PlayPart2_671C0+2CC0j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_62+1],	0
		jz	short loc_69ED1
		cmp	[bp+var_66], 0
		jz	short loc_69ED1
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69ED1:				; CODE XREF: Midgame1_PlayPart2_671C0+2CF1j
					; Midgame1_PlayPart2_671C0+2CF8j
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1],	0
		mov	[bp+var_60], 0
		push	0
		lea	ax, [bp+var_158]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_134]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		cmp	byte_495FC, 0
		jnz	short loc_69F0B
		jmp	loc_69FD3
; ���������������������������������������������������������������������������

loc_69F0B:				; CODE XREF: Midgame1_PlayPart2_671C0+2D46j
		push	2
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_69F3D
		cmp	[bp+var_36], 0
		jz	short loc_69F3D
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69F3D:				; CODE XREF: Midgame1_PlayPart2_671C0+2D5Dj
					; Midgame1_PlayPart2_671C0+2D64j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_69F75
		cmp	[bp+var_2C], 0
		jz	short loc_69F75
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69F75:				; CODE XREF: Midgame1_PlayPart2_671C0+2D95j
					; Midgame1_PlayPart2_671C0+2D9Cj
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_69FBB
		cmp	[bp+var_1C], 0
		jz	short loc_69FBB
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_69FBB:				; CODE XREF: Midgame1_PlayPart2_671C0+2DDBj
					; Midgame1_PlayPart2_671C0+2DE2j
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_69FD3:				; CODE XREF: Midgame1_PlayPart2_671C0+2D48j
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [di+2]
		mov	[bp+var_4E], ax
		mov	ax, [di+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [di+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_158]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_158], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_13F], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_13D], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_13B], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_139], ax
		mov	ax, [bp+arg_36]
		mov	word ptr [bp+var_5C], ax
		mov	bx, word ptr [bp+var_5C]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_5C]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_5C]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_38]
		mov	word ptr [bp+var_60+2],	ax
		mov	bx, word ptr [bp+var_60+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_60+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_60+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_60], ax
		push	word ptr [bp+var_60]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	0FFD8h
		push	1
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	0
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66+2],	ax
		push	1
		push	[bp+var_12]
		push	[bp+var_10]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66+2]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_66]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_62]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0Eh
		push	0
		push	[bp+arg_3A]
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [si+1Bh], 0Dh
		cmp	[bp+arg_12], 0
		jnz	short loc_6A181
		jmp	loc_6A245
; ���������������������������������������������������������������������������

loc_6A181:				; CODE XREF: Midgame1_PlayPart2_671C0+2FBCj
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E], 2
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		push	2
		lea	ax, [bp+var_72]
		push	ax
		push	2
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_72]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_6A1ED
; ���������������������������������������������������������������������������

loc_6A1CD:				; CODE XREF: Midgame1_PlayPart2_671C0+303Ej
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		add	ax, 0Dh
		mov	word ptr [bp+var_76+2],	ax
		mov	ax, word ptr [bp+var_76+2]
		mov	[si+1Bh], ax

loc_6A1ED:				; CODE XREF: Midgame1_PlayPart2_671C0+300Bj
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A1CD
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_6E+1],	0
		jz	short loc_6A22F
		cmp	[bp+var_72], 0
		jz	short loc_6A22F
		push	0
		mov	al, byte ptr [bp+var_6E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6A22F:				; CODE XREF: Midgame1_PlayPart2_671C0+304Fj
					; Midgame1_PlayPart2_671C0+3056j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		jmp	short loc_6A2B1
; ���������������������������������������������������������������������������

loc_6A245:				; CODE XREF: Midgame1_PlayPart2_671C0+2FBEj
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
		lea	ax, [bp+var_158]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	short loc_6A296
; ���������������������������������������������������������������������������

loc_6A276:				; CODE XREF: Midgame1_PlayPart2_671C0+30EFj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		add	ax, 0Dh
		mov	[bp+var_68], ax
		mov	ax, [bp+var_68]
		mov	[si+1Bh], ax

loc_6A296:				; CODE XREF: Midgame1_PlayPart2_671C0+30B4j
		cmp	[bp+var_119], 1Eh
		jnb	short loc_6A2A4
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6A2A9

loc_6A2A4:				; CODE XREF: Midgame1_PlayPart2_671C0+30DBj
		mov	ax, 1
		jmp	short loc_6A2AB
; ���������������������������������������������������������������������������

loc_6A2A9:				; CODE XREF: Midgame1_PlayPart2_671C0+30E2j
		xor	ax, ax

loc_6A2AB:				; CODE XREF: Midgame1_PlayPart2_671C0+30E7j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A276

loc_6A2B1:				; CODE XREF: Midgame1_PlayPart2_671C0+3083j
		lea	ax, [bp+var_156]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_6A2D7
		jmp	loc_6A39F
; ���������������������������������������������������������������������������

loc_6A2D7:				; CODE XREF: Midgame1_PlayPart2_671C0+3112j
		push	2
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6A309
		cmp	[bp+var_36], 0
		jz	short loc_6A309
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6A309:				; CODE XREF: Midgame1_PlayPart2_671C0+3129j
					; Midgame1_PlayPart2_671C0+3130j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_6A341
		cmp	[bp+var_2C], 0
		jz	short loc_6A341
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6A341:				; CODE XREF: Midgame1_PlayPart2_671C0+3161j
					; Midgame1_PlayPart2_671C0+3168j
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6A387
		cmp	[bp+var_1C], 0
		jz	short loc_6A387
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6A387:				; CODE XREF: Midgame1_PlayPart2_671C0+31A7j
					; Midgame1_PlayPart2_671C0+31AEj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6A39F:				; CODE XREF: Midgame1_PlayPart2_671C0+3114j
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [di+2]
		mov	[bp+var_4E], ax
		mov	ax, [di+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [di+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_158]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_158], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_13F], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_13D], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_13B], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_139], ax
		mov	ax, [bp+arg_24]
		mov	word ptr [bp+var_5C], ax
		mov	bx, word ptr [bp+var_5C]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_5C]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_5C]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_26]
		mov	word ptr [bp+var_60+2],	ax
		mov	bx, word ptr [bp+var_60+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_60+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_60+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_60], ax
		push	word ptr [bp+var_60]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	0FFDDh
		push	0
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	2
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66+2],	ax
		push	3
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66+2]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_66]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_62]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	18h
		push	0
		push	[bp+arg_28]
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [si+1Bh], 0
		jmp	short loc_6A553
; ���������������������������������������������������������������������������

loc_6A546:				; CODE XREF: Midgame1_PlayPart2_671C0+33ACj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6A553:				; CODE XREF: Midgame1_PlayPart2_671C0+3384j
		cmp	[bp+var_119], 5
		jnb	short loc_6A561
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6A566

loc_6A561:				; CODE XREF: Midgame1_PlayPart2_671C0+3398j
		mov	ax, 1
		jmp	short loc_6A568
; ���������������������������������������������������������������������������

loc_6A566:				; CODE XREF: Midgame1_PlayPart2_671C0+339Fj
		xor	ax, ax

loc_6A568:				; CODE XREF: Midgame1_PlayPart2_671C0+33A4j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A546
		cmp	[bp+arg_12], 0
		jnz	short loc_6A577
		jmp	loc_6A638
; ���������������������������������������������������������������������������

loc_6A577:				; CODE XREF: Midgame1_PlayPart2_671C0+33B2j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E], 2
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		push	2
		lea	ax, [bp+var_72]
		push	ax
		push	5
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_72]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_6A5E0
; ���������������������������������������������������������������������������

loc_6A5C3:				; CODE XREF: Midgame1_PlayPart2_671C0+3431j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		mov	word ptr [bp+var_76+2],	ax
		mov	ax, word ptr [bp+var_76+2]
		mov	[si+1Bh], ax

loc_6A5E0:				; CODE XREF: Midgame1_PlayPart2_671C0+3401j
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A5C3
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_6E+1],	0
		jz	short loc_6A622
		cmp	[bp+var_72], 0
		jz	short loc_6A622
		push	0
		mov	al, byte ptr [bp+var_6E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6A622:				; CODE XREF: Midgame1_PlayPart2_671C0+3442j
					; Midgame1_PlayPart2_671C0+3449j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		jmp	short loc_6A6A0
; ���������������������������������������������������������������������������

loc_6A638:				; CODE XREF: Midgame1_PlayPart2_671C0+33B4j
		push	72h ; 'r'
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
		lea	ax, [bp+var_158]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	short loc_6A685
; ���������������������������������������������������������������������������

loc_6A668:				; CODE XREF: Midgame1_PlayPart2_671C0+34DEj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		mov	[bp+var_68], ax
		mov	ax, [bp+var_68]
		mov	[si+1Bh], ax

loc_6A685:				; CODE XREF: Midgame1_PlayPart2_671C0+34A6j
		cmp	[bp+var_119], 28h ; '('
		jnb	short loc_6A693
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6A698

loc_6A693:				; CODE XREF: Midgame1_PlayPart2_671C0+34CAj
		mov	ax, 1
		jmp	short loc_6A69A
; ���������������������������������������������������������������������������

loc_6A698:				; CODE XREF: Midgame1_PlayPart2_671C0+34D1j
		xor	ax, ax

loc_6A69A:				; CODE XREF: Midgame1_PlayPart2_671C0+34D6j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A668

loc_6A6A0:				; CODE XREF: Midgame1_PlayPart2_671C0+3476j
		lea	ax, [bp+var_156]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [di+2]
		mov	[bp+var_4E], ax
		mov	ax, [di+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [di+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_158]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_158], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_13F], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_13D], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_13B], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_139], ax
		mov	ax, [bp+arg_36]
		mov	word ptr [bp+var_5C], ax
		mov	bx, word ptr [bp+var_5C]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_5C]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_5C]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_38]
		mov	word ptr [bp+var_60+2],	ax
		mov	bx, word ptr [bp+var_60+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_60+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_60+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_164], 11BCh
		mov	[bp+var_164], 11C8h
		mov	[bp+var_164], 11D8h
		mov	[bp+var_164], 11E8h
		mov	[bp+var_164], 11FCh
		lea	ax, [bp+var_156]
		push	ax
		push	0
		push	[bp+var_139]
		push	[bp+var_13B]
		push	[bp+var_13D]
		push	[bp+var_13F]
		lea	ax, [bp+var_164]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_60], ax
		push	word ptr [bp+var_60]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	0FFD8h
		push	1
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	0
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66+2],	ax
		push	1
		push	[bp+var_12]
		push	[bp+var_10]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66+2]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_66]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_62]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0Eh
		push	0
		push	[bp+arg_3A]
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [si+1Bh], 0Dh
		cmp	[bp+arg_12], 0
		jnz	short loc_6A8AC
		jmp	loc_6A970
; ���������������������������������������������������������������������������

loc_6A8AC:				; CODE XREF: Midgame1_PlayPart2_671C0+36E7j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E], 2
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		push	2
		lea	ax, [bp+var_72]
		push	ax
		push	3
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_72]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_6A918
; ���������������������������������������������������������������������������

loc_6A8F8:				; CODE XREF: Midgame1_PlayPart2_671C0+3769j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		add	ax, 0Dh
		mov	word ptr [bp+var_76+2],	ax
		mov	ax, word ptr [bp+var_76+2]
		mov	[si+1Bh], ax

loc_6A918:				; CODE XREF: Midgame1_PlayPart2_671C0+3736j
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A8F8
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_6E+1],	0
		jz	short loc_6A95A
		cmp	[bp+var_72], 0
		jz	short loc_6A95A
		push	0
		mov	al, byte ptr [bp+var_6E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6A95A:				; CODE XREF: Midgame1_PlayPart2_671C0+377Aj
					; Midgame1_PlayPart2_671C0+3781j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		jmp	short loc_6A9DD
; ���������������������������������������������������������������������������

loc_6A970:				; CODE XREF: Midgame1_PlayPart2_671C0+36E9j
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
		lea	ax, [bp+var_158]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	short loc_6A9C2
; ���������������������������������������������������������������������������

loc_6A9A2:				; CODE XREF: Midgame1_PlayPart2_671C0+381Bj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		add	ax, 0Dh
		mov	[bp+var_68], ax
		mov	ax, [bp+var_68]
		mov	[si+1Bh], ax

loc_6A9C2:				; CODE XREF: Midgame1_PlayPart2_671C0+37E0j
		cmp	[bp+var_119], 1Eh
		jnb	short loc_6A9D0
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6A9D5

loc_6A9D0:				; CODE XREF: Midgame1_PlayPart2_671C0+3807j
		mov	ax, 1
		jmp	short loc_6A9D7
; ���������������������������������������������������������������������������

loc_6A9D5:				; CODE XREF: Midgame1_PlayPart2_671C0+380Ej
		xor	ax, ax

loc_6A9D7:				; CODE XREF: Midgame1_PlayPart2_671C0+3813j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A9A2

loc_6A9DD:				; CODE XREF: Midgame1_PlayPart2_671C0+37AEj
		mov	word ptr [si+1Bh], 0Dh
		mov	[bp+var_119], 0
		jmp	short loc_6A9F7
; ���������������������������������������������������������������������������

loc_6A9EA:				; CODE XREF: Midgame1_PlayPart2_671C0+3850j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6A9F7:				; CODE XREF: Midgame1_PlayPart2_671C0+3828j
		cmp	[bp+var_119], 5
		jnb	short loc_6AA05
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6AA0A

loc_6AA05:				; CODE XREF: Midgame1_PlayPart2_671C0+383Cj
		mov	ax, 1
		jmp	short loc_6AA0C
; ���������������������������������������������������������������������������

loc_6AA0A:				; CODE XREF: Midgame1_PlayPart2_671C0+3843j
		xor	ax, ax

loc_6AA0C:				; CODE XREF: Midgame1_PlayPart2_671C0+3848j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A9EA
		lea	ax, [bp+var_156]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	di, [bp+arg_8]
		mov	ax, [di]
		mov	word ptr [bp+var_52+2],	ax
		mov	ax, [di+2]
		mov	[bp+var_4E], ax
		mov	ax, [di+4]
		mov	word ptr [bp+var_4C], ax
		mov	ax, [di+6]
		mov	word ptr [bp+var_4C+2],	ax
		mov	ax, word_46F46
		mov	word ptr [bp+var_52], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_56+2],	ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_52]
		lea	ax, [bp+var_158]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_158], 1218h
		mov	ax, [bp+var_4E]
		mov	word ptr [bp+var_56], ax
		mov	ax, word ptr [bp+var_4C]
		mov	word ptr [bp+var_58], ax
		mov	ax, word ptr [bp+var_4C+2]
		mov	word ptr [bp+var_5C+2],	ax
		mov	ax, word ptr [bp+var_52+2]
		mov	[bp+var_13F], ax
		mov	ax, word ptr [bp+var_56]
		mov	[bp+var_13D], ax
		mov	ax, word ptr [bp+var_58]
		mov	[bp+var_13B], ax
		mov	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_139], ax
		mov	ax, [bp+arg_24]
		mov	word ptr [bp+var_5C], ax
		mov	bx, word ptr [bp+var_5C]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_5C]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_5C]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_26]
		mov	word ptr [bp+var_60+2],	ax
		mov	bx, word ptr [bp+var_60+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_60+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_60+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0FFE8h
		push	0
		push	[bp+arg_C]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_60], ax
		push	word ptr [bp+var_60]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	2
		push	0FFDCh
		push	0
		push	[bp+arg_E]
		push	0
		call	JitterImageLayer_Construct_B12E
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	2
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66+2],	ax
		push	3
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_10]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_66], ax
		push	word ptr [bp+var_66+2]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_66]
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_62]
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	3
		push	18h
		push	0
		push	[bp+arg_28]
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	si
		push	[bp+var_62]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [si+1Bh], 0
		jmp	short loc_6ABE2
; ���������������������������������������������������������������������������

loc_6ABD5:				; CODE XREF: Midgame1_PlayPart2_671C0+3A3Bj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6ABE2:				; CODE XREF: Midgame1_PlayPart2_671C0+3A13j
		cmp	[bp+var_119], 5
		jnb	short loc_6ABF0
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6ABF5

loc_6ABF0:				; CODE XREF: Midgame1_PlayPart2_671C0+3A27j
		mov	ax, 1
		jmp	short loc_6ABF7
; ���������������������������������������������������������������������������

loc_6ABF5:				; CODE XREF: Midgame1_PlayPart2_671C0+3A2Ej
		xor	ax, ax

loc_6ABF7:				; CODE XREF: Midgame1_PlayPart2_671C0+3A33j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6ABD5
		cmp	[bp+arg_12], 0
		jnz	short loc_6AC06
		jmp	loc_6ACC7
; ���������������������������������������������������������������������������

loc_6AC06:				; CODE XREF: Midgame1_PlayPart2_671C0+3A41j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E], 2
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		push	2
		lea	ax, [bp+var_72]
		push	ax
		push	6
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_72]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_6AC6F
; ���������������������������������������������������������������������������

loc_6AC52:				; CODE XREF: Midgame1_PlayPart2_671C0+3AC0j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		mov	word ptr [bp+var_76+2],	ax
		mov	ax, word ptr [bp+var_76+2]
		mov	[si+1Bh], ax

loc_6AC6F:				; CODE XREF: Midgame1_PlayPart2_671C0+3A90j
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6AC52
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_6E+1],	0
		jz	short loc_6ACB1
		cmp	[bp+var_72], 0
		jz	short loc_6ACB1
		push	0
		mov	al, byte ptr [bp+var_6E]
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6ACB1:				; CODE XREF: Midgame1_PlayPart2_671C0+3AD1j
					; Midgame1_PlayPart2_671C0+3AD8j
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6E+1],	0
		mov	[bp+var_6C], 0
		jmp	short loc_6AD31
; ���������������������������������������������������������������������������

loc_6ACC7:				; CODE XREF: Midgame1_PlayPart2_671C0+3A43j
		push	72h ; 'r'
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
		lea	ax, [bp+var_158]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	short loc_6AD16
; ���������������������������������������������������������������������������

loc_6ACF9:				; CODE XREF: Midgame1_PlayPart2_671C0+3B6Fj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	ax, [bp+var_119]
		and	ax, 1
		mov	[bp+var_68], ax
		mov	ax, [bp+var_68]
		mov	[si+1Bh], ax

loc_6AD16:				; CODE XREF: Midgame1_PlayPart2_671C0+3B37j
		cmp	[bp+var_119], 32h ; '2'
		jnb	short loc_6AD24
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6AD29

loc_6AD24:				; CODE XREF: Midgame1_PlayPart2_671C0+3B5Bj
		mov	ax, 1
		jmp	short loc_6AD2B
; ���������������������������������������������������������������������������

loc_6AD29:				; CODE XREF: Midgame1_PlayPart2_671C0+3B62j
		xor	ax, ax

loc_6AD2B:				; CODE XREF: Midgame1_PlayPart2_671C0+3B67j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6ACF9

loc_6AD31:				; CODE XREF: Midgame1_PlayPart2_671C0+3B05j
		lea	ax, [bp+var_156]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_6AD57
		jmp	loc_6AE1F
; ���������������������������������������������������������������������������

loc_6AD57:				; CODE XREF: Midgame1_PlayPart2_671C0+3B92j
		push	2
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6AD89
		cmp	[bp+var_36], 0
		jz	short loc_6AD89
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6AD89:				; CODE XREF: Midgame1_PlayPart2_671C0+3BA9j
					; Midgame1_PlayPart2_671C0+3BB0j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_6ADC1
		cmp	[bp+var_2C], 0
		jz	short loc_6ADC1
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6ADC1:				; CODE XREF: Midgame1_PlayPart2_671C0+3BE1j
					; Midgame1_PlayPart2_671C0+3BE8j
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6AE07
		cmp	[bp+var_1C], 0
		jz	short loc_6AE07
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6AE07:				; CODE XREF: Midgame1_PlayPart2_671C0+3C27j
					; Midgame1_PlayPart2_671C0+3C2Ej
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6AE1F:				; CODE XREF: Midgame1_PlayPart2_671C0+3B94j
		mov	[bp+var_3D], 0
		mov	al, byte_46848
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_6AE34
		cmp	ax, 2
		jz	short loc_6AE34
		jmp	short loc_6AE3A
; ���������������������������������������������������������������������������

loc_6AE34:				; CODE XREF: Midgame1_PlayPart2_671C0+3C6Bj
					; Midgame1_PlayPart2_671C0+3C70j
		mov	[bp+var_3D], 1
		jmp	short $+2

loc_6AE3A:				; CODE XREF: Midgame1_PlayPart2_671C0+3C72j
		mov	[bp+var_48], 0
		mov	[bp+var_44], 2
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		cmp	[bp+arg_12], 0
		jz	short loc_6AE7C
		push	2
		lea	ax, [bp+var_48]
		push	ax
		push	0Dh
		push	[bp+arg_40]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_48]
		push	ax
		push	[bp+arg_42]
		call	sub_7D11
		add	sp, 4
		jmp	short loc_6AEA1
; ���������������������������������������������������������������������������

loc_6AE7C:				; CODE XREF: Midgame1_PlayPart2_671C0+3C96j
		cmp	[bp+arg_46], 0
		jz	short loc_6AEA1
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		push	0
		mov	ax, [bp+arg_44]
		add	ax, 32h	; '2'
		push	ax
		push	[bp+arg_48]
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_6AEA1:				; CODE XREF: Midgame1_PlayPart2_671C0+3CBAj
					; Midgame1_PlayPart2_671C0+3CC0j
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E], 2
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		push	2
		lea	ax, [bp+var_52]
		push	ax
		push	3Ch ; '<'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5C], 0
		mov	[bp+var_58], 2
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		push	2Eh ; '.'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_60+1],	0
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+arg_0]
		push	0FFh
		push	14h
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_128], 0FFCEh
		mov	ax, [bp+arg_1E]
		mov	word ptr [bp+var_66+2],	ax
		mov	bx, word ptr [bp+var_66+2]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_66+2]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_66+2]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	ax, [bp+arg_2A]
		mov	word ptr [bp+var_66], ax
		mov	bx, word ptr [bp+var_66]
		push	word ptr [bx]
		mov	bx, word ptr [bp+var_66]
		mov	al, [bx+2]
		push	ax
		push	word ptr [bp+var_66]
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_3C]
		mov	al, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	ax, [bp+arg_C]
		mov	[bp+var_68], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_6C+2],	ax
		or	ax, ax
		jz	short loc_6B001
		push	0
		push	0
		push	[bp+var_68]
		push	word ptr [bp+var_6C+2]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_6C+2]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_6C+2]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_6C+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_6C+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_6C+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_6C+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_6C+2]
		jmp	short loc_6B004
; ���������������������������������������������������������������������������

loc_6B001:				; CODE XREF: Midgame1_PlayPart2_671C0+3DF9j
		mov	ax, word ptr [bp+var_6C+2]

loc_6B004:				; CODE XREF: Midgame1_PlayPart2_671C0+3E3Fj
		mov	di, ax
		push	0
		push	0
		push	[bp+arg_20]
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_6C], ax
		push	word ptr [bp+var_6C]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_136]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, [bp+arg_2C]
		mov	word ptr [bp+var_72+2],	ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_72], ax
		or	ax, ax
		jz	short loc_6B091
		push	0
		push	0
		push	word ptr [bp+var_72+2]
		push	word ptr [bp+var_72]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, word ptr [bp+var_72]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_72]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_72]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_72]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_72]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_72]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_72]
		jmp	short loc_6B094
; ���������������������������������������������������������������������������

loc_6B091:				; CODE XREF: Midgame1_PlayPart2_671C0+3E89j
		mov	ax, word ptr [bp+var_72]

loc_6B094:				; CODE XREF: Midgame1_PlayPart2_671C0+3ECFj
		mov	[bp+var_6E], ax
		push	[bp+var_6E]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, [bp+arg_22]
		mov	word ptr [bp+var_76], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_7A+2],	ax
		or	ax, ax
		jz	short loc_6B103
		push	1
		push	82h ; '�'
		push	0
		push	word ptr [bp+var_76]
		push	word ptr [bp+var_7A+2]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_7A+2]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_7A+2]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_7A+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7A+2]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_7A+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7A+2]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_7A+2]
		jmp	short loc_6B106
; ���������������������������������������������������������������������������

loc_6B103:				; CODE XREF: Midgame1_PlayPart2_671C0+3EF8j
		mov	ax, word ptr [bp+var_7A+2]

loc_6B106:				; CODE XREF: Midgame1_PlayPart2_671C0+3F41j
		mov	word ptr [bp+var_76+2],	ax
		push	word ptr [bp+var_76+2]
		push	[bp+var_6E]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, [bp+arg_22]
		mov	word ptr [bp+var_7E+2],	ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_7E], ax
		or	ax, ax
		jz	short loc_6B176
		push	2
		push	0FFFCh
		push	0
		push	word ptr [bp+var_7E+2]
		push	word ptr [bp+var_7E]
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx], 1977h
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Fh], 0
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_7E]
		mov	word ptr [bx+1Fh], 0
		mov	ax, word ptr [bp+var_7E]
		jmp	short loc_6B179
; ���������������������������������������������������������������������������

loc_6B176:				; CODE XREF: Midgame1_PlayPart2_671C0+3F6Cj
		mov	ax, word ptr [bp+var_7E]

loc_6B179:				; CODE XREF: Midgame1_PlayPart2_671C0+3FB4j
		mov	word ptr [bp+var_7A], ax
		push	word ptr [bp+var_7A]
		push	word ptr [bp+var_76+2]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	0FFB1h
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		push	0
		call	TriggeredAnimLayer_Construct_B068
		add	sp, 0Ah
		mov	[bp+var_80], ax
		push	[bp+var_80]
		push	word ptr [bp+var_7A]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	bx, [bp+var_80]
		mov	byte ptr [bx+1Dh], 1
		mov	[bp+var_8A], 0
		mov	byte ptr [bp+var_86], 2
		mov	byte ptr [bp+var_86+1],	0
		mov	[bp+var_84], 0
		push	3
		lea	ax, [bp+var_8A]
		push	ax
		push	21h ; '!'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_96+2], 0
		mov	byte ptr [bp+var_90], 2
		mov	byte ptr [bp+var_90+1],	0
		mov	[bp+var_8E], 0
		push	3
		lea	ax, [bp+var_96+2]
		push	ax
		push	22h ; '"'
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0Ah
		push	0
		lea	ax, [bp+var_8A]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	word ptr [bp+var_96], ax
		push	0Ah
		push	0
		lea	ax, [bp+var_96+2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	[bp+var_98], ax
		mov	bx, word ptr [bp+var_96]
		mov	word ptr [bx+1Bh], 0
		mov	bx, [bp+var_98]
		mov	word ptr [bx+1Bh], 0
		push	word ptr [bp+var_96]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_6B272
; ���������������������������������������������������������������������������

loc_6B265:				; CODE XREF: Midgame1_PlayPart2_671C0+40CBj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6B272:				; CODE XREF: Midgame1_PlayPart2_671C0+40A3j
		cmp	[bp+var_119], 14h
		jnb	short loc_6B280
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6B285

loc_6B280:				; CODE XREF: Midgame1_PlayPart2_671C0+40B7j
		mov	ax, 1
		jmp	short loc_6B287
; ���������������������������������������������������������������������������

loc_6B285:				; CODE XREF: Midgame1_PlayPart2_671C0+40BEj
		xor	ax, ax

loc_6B287:				; CODE XREF: Midgame1_PlayPart2_671C0+40C3j
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B265
		mov	[bp+var_119], 0
		mov	bx, word ptr [bp+var_76+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_76+2]
		mov	word ptr [bx+1Fh], 1
		jmp	short loc_6B2F1
; ���������������������������������������������������������������������������

loc_6B2A5:				; CODE XREF: Midgame1_PlayPart2_671C0+4136j
		cmp	[bp+var_119], 0Ah
		jnz	short loc_6B2E0
		push	word ptr [bp+var_96]
		push	di
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_96], 0
		jz	short loc_6B2D3
		push	3
		push	word ptr [bp+var_96]
		mov	bx, word ptr [bp+var_96]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6B2D3:				; CODE XREF: Midgame1_PlayPart2_671C0+40FEj
		push	[bp+var_98]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_6B2E0:				; CODE XREF: Midgame1_PlayPart2_671C0+40EAj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_128]

loc_6B2F1:				; CODE XREF: Midgame1_PlayPart2_671C0+40E3j
		cmp	[bp+var_128], 0FFE8h
		jl	short loc_6B2A5
		mov	bx, word ptr [bp+var_76+2]
		mov	word ptr [bx+1Dh], 0
		mov	bx, word ptr [bp+var_76+2]
		mov	word ptr [bx+1Fh], 0
		jmp	short loc_6B317
; ���������������������������������������������������������������������������

loc_6B30A:				; CODE XREF: Midgame1_PlayPart2_671C0+4167j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6B317:				; CODE XREF: Midgame1_PlayPart2_671C0+4148j
		push	[bp+var_98]
		call	AnimLayer_IsFinished_2E654
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B30A
		push	[bp+var_98]
		push	di
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	[bp+var_98], 0
		jz	short loc_6B350
		push	3
		push	[bp+var_98]
		mov	bx, [bp+var_98]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6B350:				; CODE XREF: Midgame1_PlayPart2_671C0+417Bj
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_119], 0
		mov	[bp+var_A2], 0
		mov	[bp+var_9E], 2
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		push	3
		lea	ax, [bp+var_A2]
		push	ax
		push	9
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_AC], 0
		mov	[bp+var_A8], 2
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		push	3
		lea	ax, [bp+var_AC]
		push	ax
		push	0Eh
		push	[bp+arg_3C]
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_A2]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	word ptr [bp+var_B0+2],	ax
		push	0
		push	0
		lea	ax, [bp+var_AC]
		push	ax
		push	0
		call	AnimLayer_Construct_2E5CF
		add	sp, 8
		mov	word ptr [bp+var_B0], ax
		push	word ptr [bp+var_B0+2]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_62]
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		push	[bp+arg_6]
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		push	ax
		push	[bp+arg_6]
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_3D], 0
		jz	short loc_6B453
		mov	bx, [bp+arg_4A]
		cmp	word ptr [bx], 0
		jz	short loc_6B453
		mov	bx, [bp+arg_4A]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_4A]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_6B453:				; CODE XREF: Midgame1_PlayPart2_671C0+4271j
					; Midgame1_PlayPart2_671C0+4279j
		cmp	[bp+arg_12], 0
		jz	short loc_6B46B
		push	0FFFFh
		push	[bp+arg_42]
		mov	bx, [bp+arg_42]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_6B491
; ���������������������������������������������������������������������������

loc_6B46B:				; CODE XREF: Midgame1_PlayPart2_671C0+4297j
		cmp	[bp+arg_46], 0
		jz	short loc_6B491
		mov	bx, [bp+arg_48]
		cmp	word ptr [bx], 0
		jz	short loc_6B491
		mov	bx, [bp+arg_48]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_48]
		mov	bx, [bx]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		jmp	short $+2

loc_6B491:				; CODE XREF: Midgame1_PlayPart2_671C0+42A9j
					; Midgame1_PlayPart2_671C0+42AFj ...
		jmp	short loc_6B4DB
; ���������������������������������������������������������������������������

loc_6B493:				; CODE XREF: Midgame1_PlayPart2_671C0+4334j
		cmp	[bp+var_119], 14h
		jnz	short loc_6B4CE
		push	word ptr [bp+var_B0+2]
		push	di
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_B0+2],	0
		jz	short loc_6B4C1
		push	3
		push	word ptr [bp+var_B0+2]
		mov	bx, word ptr [bp+var_B0+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_6B4C1:				; CODE XREF: Midgame1_PlayPart2_671C0+42ECj
		push	word ptr [bp+var_B0]
		push	di
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_6B4CE:				; CODE XREF: Midgame1_PlayPart2_671C0+42D8j
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_6B4DB:				; CODE XREF: Midgame1_PlayPart2_671C0:loc_6B491j
		cmp	[bp+var_119], 1Fh
		jnb	short loc_6B4E9
		cmp	byte ptr [bp+var_117], 0
		jz	short loc_6B4EE

loc_6B4E9:				; CODE XREF: Midgame1_PlayPart2_671C0+4320j
		mov	ax, 1
		jmp	short loc_6B4F0
; ���������������������������������������������������������������������������

loc_6B4EE:				; CODE XREF: Midgame1_PlayPart2_671C0+4327j
		xor	ax, ax

loc_6B4F0:				; CODE XREF: Midgame1_PlayPart2_671C0+432Cj
		mov	ah, 0
		or	ax, ax
		jz	short loc_6B493
		cmp	[bp+var_3D], 0
		jz	short loc_6B552
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_6B50D
		cmp	ax, 2
		jz	short loc_6B528
		jmp	short loc_6B543
; ���������������������������������������������������������������������������

loc_6B50D:				; CODE XREF: Midgame1_PlayPart2_671C0+4344j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_114]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short loc_6B543
; ���������������������������������������������������������������������������

loc_6B528:				; CODE XREF: Midgame1_PlayPart2_671C0+4349j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_114]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short $+2

loc_6B543:				; CODE XREF: Midgame1_PlayPart2_671C0+434Bj
					; Midgame1_PlayPart2_671C0+4366j
		push	17h
		lea	ax, [bp+var_114]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4

loc_6B552:				; CODE XREF: Midgame1_PlayPart2_671C0+433Aj
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6B587
		xor	eax, eax
		mov	[bp+var_C0], eax
		mov	[bp+var_C4], eax
		mov	[bp+var_C0], 78h ; 'x'
		mov	eax, dword_47ABB
		mov	[bp+var_C4], eax
		lea	ax, [bp+var_C4]
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2

loc_6B587:				; CODE XREF: Midgame1_PlayPart2_671C0+4399j
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+4], 0
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+6], 0
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+8], 13Fh
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+0Ah], 0C7h	; '�'
		push	0
		push	0
		mov	bx, [bp+arg_C]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_C]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	[bp+arg_2E]
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	bx, [bp+arg_20]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_20]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	[bp+arg_2E]
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	bx, [bp+arg_2C]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_2C]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	[bp+arg_2E]
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	ax, [bp+arg_2E]
		mov	[bp+var_B2], ax
		mov	[bp+var_144], 0
		mov	[bp+var_142], 0
		push	[bp+var_B2]
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, word_46F46
		mov	[bp+var_B4], ax
		mov	[bp+var_152], 0
		mov	[bp+var_150], 0
		push	[bp+var_B4]
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		xor	si, si
		jmp	short loc_6B6F3
; ���������������������������������������������������������������������������

loc_6B680:				; CODE XREF: Midgame1_PlayPart2_671C0+4536j
		mov	ax, 18h
		sub	ax, si
		mov	[bp+var_B6], ax
		mov	ax, si
		shl	ax, 1
		add	ax, 97h	; '�'
		mov	[bp+var_B8], ax
		mov	word ptr [bp-140h], 0
		mov	ax, [bp+var_B6]
		mov	[bp+var_13F+1],	ax
		mov	[bp+var_13D+1],	13Fh
		mov	ax, [bp+var_B8]
		mov	[bp+var_13B+1],	ax
		mov	ax, 18h
		sub	ax, si
		mov	[bp+var_BA], ax
		mov	ax, si
		shl	ax, 1
		add	ax, 97h	; '�'
		mov	[bp+var_BC], ax
		mov	[bp+var_14E], 0
		mov	ax, [bp+var_BA]
		mov	[bp+var_14C], ax
		mov	[bp+var_14A], 13Fh
		mov	ax, [bp+var_BC]
		mov	[bp+var_148], ax
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_152]
		push	ax
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		inc	si

loc_6B6F3:				; CODE XREF: Midgame1_PlayPart2_671C0+44BEj
		cmp	si, 19h
		jl	short loc_6B680
		lea	ax, [bp+var_152]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		cmp	[bp+var_A7], 0
		jz	short loc_6B73A
		cmp	[bp+var_AC], 0
		jz	short loc_6B73A
		push	0
		mov	al, [bp+var_A8]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B73A:				; CODE XREF: Midgame1_PlayPart2_671C0+4557j
					; Midgame1_PlayPart2_671C0+455Fj
		mov	[bp+var_AC], 0
		mov	[bp+var_A7], 0
		mov	[bp+var_A6], 0
		cmp	[bp+var_9D], 0
		jz	short loc_6B779
		cmp	[bp+var_A2], 0
		jz	short loc_6B779
		push	0
		mov	al, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B779:				; CODE XREF: Midgame1_PlayPart2_671C0+4596j
					; Midgame1_PlayPart2_671C0+459Ej
		mov	[bp+var_A2], 0
		mov	[bp+var_9D], 0
		mov	[bp+var_9C], 0
		cmp	byte ptr [bp+var_90+1],	0
		jz	short loc_6B7B8
		cmp	[bp+var_96+2], 0
		jz	short loc_6B7B8
		push	0
		mov	al, byte ptr [bp+var_90]
		push	ax
		lea	ax, [bp+var_96+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B7B8:				; CODE XREF: Midgame1_PlayPart2_671C0+45D5j
					; Midgame1_PlayPart2_671C0+45DDj
		mov	[bp+var_96+2], 0
		mov	byte ptr [bp+var_90+1],	0
		mov	[bp+var_8E], 0
		cmp	byte ptr [bp+var_86+1],	0
		jz	short loc_6B7F7
		cmp	[bp+var_8A], 0
		jz	short loc_6B7F7
		push	0
		mov	al, byte ptr [bp+var_86]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B7F7:				; CODE XREF: Midgame1_PlayPart2_671C0+4614j
					; Midgame1_PlayPart2_671C0+461Cj
		mov	[bp+var_8A], 0
		mov	byte ptr [bp+var_86+1],	0
		mov	[bp+var_84], 0
		push	0
		lea	ax, [bp+var_136]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_57], 0
		jz	short loc_6B84F
		cmp	[bp+var_5C], 0
		jz	short loc_6B84F
		push	0
		mov	al, [bp+var_58]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B84F:				; CODE XREF: Midgame1_PlayPart2_671C0+466Fj
					; Midgame1_PlayPart2_671C0+4676j
		mov	[bp+var_5C], 0
		mov	[bp+var_57], 0
		mov	[bp+var_56], 0
		cmp	byte ptr [bp+var_4E+1],	0
		jz	short loc_6B887
		cmp	[bp+var_52], 0
		jz	short loc_6B887
		push	0
		mov	al, byte ptr [bp+var_4E]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B887:				; CODE XREF: Midgame1_PlayPart2_671C0+46A7j
					; Midgame1_PlayPart2_671C0+46AEj
		mov	[bp+var_52], 0
		mov	byte ptr [bp+var_4E+1],	0
		mov	[bp+var_4C], 0
		cmp	[bp+arg_12], 0
		jz	short loc_6B8AC
		push	[bp+arg_42]
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_6B8AC:				; CODE XREF: Midgame1_PlayPart2_671C0+46DFj
		cmp	[bp+arg_46], 0
		jz	short loc_6B8BD
		push	[bp+arg_48]
		call	Music_ChannelStopSequence_783A
		add	sp, 2

loc_6B8BD:				; CODE XREF: Midgame1_PlayPart2_671C0+46F0j
		cmp	[bp+var_43], 0
		jz	short loc_6B8E1
		cmp	[bp+var_48], 0
		jz	short loc_6B8E1
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B8E1:				; CODE XREF: Midgame1_PlayPart2_671C0+4701j
					; Midgame1_PlayPart2_671C0+4708j
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		push	2
		lea	ax, [bp+var_3C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_31], 0
		jz	short loc_6B927
		cmp	[bp+var_36], 0
		jz	short loc_6B927
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B927:				; CODE XREF: Midgame1_PlayPart2_671C0+4747j
					; Midgame1_PlayPart2_671C0+474Ej
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		cmp	[bp+var_27], 0
		jz	short loc_6B95F
		cmp	[bp+var_2C], 0
		jz	short loc_6B95F
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B95F:				; CODE XREF: Midgame1_PlayPart2_671C0+477Fj
					; Midgame1_PlayPart2_671C0+4786j
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_17], 0
		jz	short loc_6B9A5
		cmp	[bp+var_1C], 0
		jz	short loc_6B9A5
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6B9A5:				; CODE XREF: Midgame1_PlayPart2_671C0+47C5j
					; Midgame1_PlayPart2_671C0+47CCj
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
Midgame1_PlayPart2_671C0	endp

ovr197		ends
