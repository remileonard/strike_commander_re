seg029		segment	para public 'CODE' use16
		assume cs:seg029
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 0BEh, 50h, 56h, 0Eh, 0E8h, 3Dh, 0FFh, 83h, 0C4h, 0Eh

loc_111EB:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (109 sur
; 109), à sub_C8F5 (sub_C8F5 de OPTEST.EXE). Code non comparé instruction par instruction. —
; ==============================================================================================
MidgameEngine_C8F5_111EE		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		push	[bp+arg_2]
		call	CRT_Strdup
		add	sp, 2
		mov	[bp+var_2], ax
		mov	di, [bp+var_2]
		mov	[bp+var_4], 4
		jmp	short loc_1124D

loc_1120E:
		cmp	[bp+var_6], 28h
		jle	short loc_11228
		mov	si, 28h
		jmp	short loc_1121A

loc_11219:
		dec	si

loc_1121A:
		mov	bx, si
		cmp	byte ptr [bx+di], 20h
		jnz	short loc_11219
		mov	bx, si
		mov	byte ptr [bx+di], 0
		jmp	short loc_1122E

loc_11228:
		mov	ax, [bp+var_6]
		dec	ax
		mov	si, ax

loc_1122E:
		push	di
		push	2
		push	[bp+var_4]
		push	222Ah
		push	[bp+arg_0]
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		add	[bp+var_4], 0Fh
		mov	ax, si
		add	ax, di
		inc	ax
		mov	di, ax

loc_1124D:
		push	di
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_1120E
		push	[bp+var_2]
		call	sub_330E8
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
MidgameEngine_C8F5_111EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1126C		proc far

var_32		= word ptr -32h
var_15		= word ptr -15h
var_13		= byte ptr -13h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah
arg_5		= byte ptr  0Bh
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h
arg_E		= byte ptr  14h
arg_F		= byte ptr  15h
arg_10		= dword ptr  16h
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
arg_28		= byte ptr  2Eh

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	di, [bp+arg_1C]
		mov	si, [bp+arg_22]
		push	[bp+arg_20]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_32]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+arg_0]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+arg_A]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	[bp+var_4], ax
		push	[bp+arg_14]
		push	[bp+var_4]
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	[bp+arg_16]
		push	[bp+var_4]
		call	TalkingHead_SetLipText_E45A
		add	sp, 4
		push	[bp+var_2]
		lea	ax, [bp+var_32]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_4]
		lea	ax, [bp+var_32]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	ax, [bp+arg_24]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		push	word ptr [bx]
		mov	bx, [bp+var_C]
		mov	al, [bx+2]
		push	ax
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+arg_26]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		push	word ptr [bx]
		mov	bx, [bp+var_E]
		mov	al, [bx+2]
		push	ax
		push	[bp+var_E]
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	al, [bp+arg_28]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		push	[bp+arg_18]
		push	si
		push	cs
		call	near ptr MidgameEngine_C8F5_111EE
		add	sp, 4
		jmp	short loc_113F9

loc_113A2:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_113AD
		jmp	short loc_11414

loc_113AD:
		or	di, di
		jle	short loc_113ED
		cmp	[bp+var_15], di
		jnz	short loc_113CC
		push	0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	[bp+arg_1A]
		push	si
		push	cs
		call	near ptr MidgameEngine_C8F5_111EE
		add	sp, 4

loc_113CC:
		mov	al, byte_4EF07
		mov	ah, 0
		mov	[bp+var_F], al
		cmp	[bp+var_F], 10h
		jnz	short loc_113E5
		push	2231h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_113E5:
		cmp	[bp+var_F], 31h
		jnz	short loc_113ED
		jmp	short loc_11414

loc_113ED:
		lea	ax, [bp+var_32]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_113F9:
		mov	ax, [bp+var_15]
		cmp	ax, [bp+arg_1E]
		jnb	short loc_11407
		cmp	[bp+var_13], 0
		jz	short loc_1140C

loc_11407:
		mov	ax, 1
		jmp	short loc_1140E

loc_1140C:
		xor	ax, ax

loc_1140E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_113A2

loc_11414:
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	0
		lea	ax, [bp+var_32]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		cmp	[bp+arg_F], 0
		jz	short loc_11452
		cmp	[bp+arg_A], 0
		jz	short loc_11452
		push	0
		mov	al, [bp+arg_E]
		push	ax
		lea	ax, word ptr [bp+arg_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_11452

loc_11452:
		mov	[bp+arg_A], 0
		mov	[bp+arg_F], 0
		mov	[bp+arg_10], 0
		cmp	[bp+arg_5], 0
		jz	short loc_1148A
		cmp	[bp+arg_0], 0
		jz	short loc_1148A
		push	0
		mov	al, [bp+arg_4]
		push	ax
		lea	ax, word ptr [bp+arg_0]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_1148A

loc_1148A:
		mov	[bp+arg_0], 0
		mov	[bp+arg_5], 0
		mov	[bp+arg_6], 0
		pop	di
		pop	si
		leave
		retf
sub_1126C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (1 sur
; 1), à Palette_UploadByValue_CBAB (sub_CBAB de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-21. Reçoit une palette par valeur (6 octets sur la pile :
; mot +0, octet +2, …), l'envoie à la carte (Palette_Upload_2CDE1(&arg, octet +2, mot +0, 0))
; puis détruit la copie (Palette_Destruct_2D048). Après
; TextFormat_ReleaseAttribute_2EC80(word_46F46, 0). mid33, scène 6 : l'appelant construit la
; palette directement dans la zone d'arguments (sub sp, 6 ; Palette_Alloc sur cette zone,
; var_D4A ; Palette_CopyInto_2CF80 de midgames 40), puis appelle sans autre empilement.
; ==============================================================================================
Palette_UploadByValue_114A2		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+arg_0]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		pop	bp
		retf
Palette_UploadByValue_114A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à TextArray_Init_CBE1
; (sub_CBE1 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Initialise un tableau de textes de taille fixe : +0 = longueur
; d'un élément (arg_4), +2 = tampon de arg_2 × arg_4 octets (alloué par sub_2C319). Ex.
; Midgame1_PlayPart1 : 8 textes de 300 octets (SPOK), 4 de 60 et 3 de 60 (MG01). Le texte n
; est à tampon + n × longueur.
; ==============================================================================================
TextArray_Init_114D6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[si], di
		mov	ax, di
		imul	[bp+arg_2]
		push	ax
		call	sub_32FCF
		add	sp, 2
		mov	[si+2], ax
		pop	di
		pop	si
		pop	bp
		retf
TextArray_Init_114D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (86 sur
; 86), à TextArray_Destruct_CC03 (sub_CC03 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Libère le tampon d'un tableau de TextArray_Init_CBE1
; (Heap_FreeAndCoalesce_2C3FC), puis l'objet si bit 1 de l'argument.
; ==============================================================================================
TextArray_Destruct_114F8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_11527
		cmp	word ptr [si+2], 0
		jz	short loc_11518
		push	word ptr [si+2]
		call	sub_330E8
		add	sp, 2

loc_11518:
		test	di, 1
		jz	short loc_11527
		push	si
TextArray_Destruct_114F8		endp

; START OF FUNCTION CHUNK FOR TextArray_Destruct_114F8
		db 9Ah
; END OF FUNCTION CHUNK FOR TextArray_Destruct_114F8
seg029		ends
