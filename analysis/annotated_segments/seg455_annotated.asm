seg455		segment	para public 'OVERLAY' use16
		assume cs:seg455
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far — CHARGEUR DU FICHIER MONDE nomme par le chunk MISN/WRLD/FILE. Appele via stub sub_6CDCD
; depuis MissionScenario_LoadMainRecord_A8331 (seg456) avec le nom 8 octets lu dans le chunk
; FILE (ex. 'MAURITAN'). Fait : StreamReader_ConstructVariantA ; Path_ResolveDataFile(path,
; 'MISSIONS', nom, '.IFF') -> ..\..\DATA\MISSIONS\<nom>.IFF ;
; ResourceRecord_InitAndValidate(path, 'WRLD') (exige FORM racine WRLD) ;
; World_ParseWrldForm_A767F(&sr) ; cleanup (rewind_all, ReleaseBuffer). Si le chunk FILE est
; absent, MissionScenario appelle directement sub_6CDC8 -> A767F sur le flux de la mission
; (monde inline). Detail : analysis/DATA_MODEL.md §6.6b.
; ==============================================================================================
World_OpenAndParseFile_A75D0	proc far		; CODE XREF: VROOMM_StubThunk_6CDCDJ

var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_4B		= dword	ptr -4Bh
var_47		= dword	ptr -47h
var_43		= dword	ptr -43h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_A8], 2C8h
		mov	[bp+var_47], 100h
		mov	[bp+var_4B], 0
		mov	[bp+var_A8], 2E0h
		mov	[bp+var_2C], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		movsx	eax, ax
		mov	[bp+var_43], eax
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	[bp+arg_0]
		push	ds
		push	offset aMissions ; "MISSIONS"
		lea	ax, [bp+var_F8]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	large 444C5257h

loc_A7631:
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8

loc_A7643:
		or	ax, ax
		jz	short loc_A765D
		lea	ax, [bp+var_A8]
		push	ax
		nop
		push	cs
		call	near ptr World_ParseWrldForm_A767F
		pop	cx
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_A765D:				; CODE XREF: World_OpenAndParseFile_A75D0+75j
		mov	[bp+var_A8], 2E0h
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		leave
		retf
World_OpenAndParseFile_A75D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,239L — PARSEUR DU FORM 'WRLD' (definition de monde/carte). Garde byte_70446 (charge une
; fois) ; initialise les memes globales que l'ecran de mission-planning seg112
; (byte_70447/70471, dword_70468, byte_7046C/7046D, word_7046E). Chunks (verifie sur
; MISSIONS/MAURITAN.IFF) : INFO(u16) ; PALT(nom -> PALETTE.IFF) ; TERA(nom des donnees de
; terrain -> DATA\<nom>.PAK) ; SKYS('SUN'+couleur/dir/intensite) ; GLNT(carte de reflets
; speculaires, 7 dwords + table palette + fondu) ; SMOK('SMOKESET') ; LGHT(14 o params
; eclairage) ; FORM CAMR(cameras scriptees : STRT/CHAS/CKPT/VICT/TARG/WEAP/ROTA + records COMP
; STARTCAM/TAKEOFF/LANDING/AUTOPILT, via LoadChunkA_A7C8E -> Cinematic_LoadCameraDef
; sub_23E7D). Autres missions : HORZ(2xu32), WTCH(u16->WeakRef table), SCAL(u32,
; dword_70448=256^2/scale). Sous-loaders en sequence : LoadChunkA/B, LoadWaypoint,
; LoadFormation (IndexedRecordReader), SpawnEntity (sub_38B70 + conteneur tag 59C3h),
; LoadPosition. Detail : analysis/DATA_MODEL.md §6.6b.
; ==============================================================================================
World_ParseWrldForm_A767F	proc far		; CODE XREF: VROOMM_StubThunk_6CDC8J World_OpenAndParseFile_A75D0+7Ep

var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_70446, 0
		jz	short loc_A76E3
		mov	byte_70447, 1
		mov	byte_70471, 0
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_70468, eax
		mov	byte_7046C, 0
		mov	byte_7046D, 0
		mov	word_7046E, 1
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_SpawnEntity_A7B1E
		pop	cx
		push	word_70483
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		push	word_70474
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		jmp	loc_A78A9
; ���������������������������������������������������������������������������

loc_A76E3:				; CODE XREF: World_ParseWrldForm_A767F+10j
		mov	di, 320h
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A770C
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_A770C:				; CODE XREF: World_ParseWrldForm_A767F+7Aj
		push	0
		push	large 5A524F48h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A7747
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_704DD, eax
		push	si

loc_A7731:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax

loc_A7738:
		pop	eax
		pop	cx

loc_A773B:
		mov	dword_704E1, eax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_A7747:				; CODE XREF: World_ParseWrldForm_A767F+A0j
		push	di
		push	53FAh
		call	ListItem_ConstructNumberedLabel
		add	sp, 4
		push	0
		push	large 48435457h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A7775
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_1A], ax
		push	ax
		jmp	short loc_A7778
; ���������������������������������������������������������������������������

loc_A7775:				; CODE XREF: World_ParseWrldForm_A767F+E7j
		push	0C8h ; '�'

loc_A7778:				; CODE XREF: World_ParseWrldForm_A767F+F4j
		push	59BDh
		call	WeakRef_TableConstruct
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_LoadChunkA_A7C8E
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_LoadWaypoint_A78AD
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_LoadFormation_A78F5
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_SpawnEntity_A7B1E
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_LoadPosition_A7A10
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr MissionLoader_LoadChunkB_A7CA1
		pop	cx
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEDF
		add	sp, 4
		push	0
		push	large 544E4C47h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A7833
		mov	eax, [si+72h]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword_72B6F, eax
		mov	byte_72B73, 3
		mov	byte_72B74, 1
		mov	dword_72B75, 0
		mov	eax, [bp+var_8]
		mov	dword_72B75, eax
		push	0
		mov	al, byte_72B73
		push	ax
		push	large [dword_72B6F]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_A7833:				; CODE XREF: World_ParseWrldForm_A767F+14Dj
		push	0
		push	large 4C414353h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A789B
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7044C, eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	edx, eax
		mov	ecx, dword_7044C
		sar	edx, 18h

loc_A786F:
		shl	eax, 8

loc_A7873:
		idiv	ecx

loc_A7876:
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	dword_70448, eax
		mov	eax, dword_70450
		mov	edx, dword_7044C
		imul	edx
		shrd	eax, edx, 8
		mov	dword_70450, eax

loc_A789B:				; CODE XREF: World_ParseWrldForm_A767F+1C7j
		push	5A92h
		call	Collision_InitDescriptorText
		pop	cx
		mov	byte_70446, 1

loc_A78A9:				; CODE XREF: World_ParseWrldForm_A767F+61j
		pop	di
		pop	si
		leave
		retf
World_ParseWrldForm_A767F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_2AFB5, ResourceRecord_SeekAndRead_64743, sub_2AFE0, sub_6BCA1 — probable
; chargement d'un point de navigation (waypoint) de mission.
; ==============================================================================================
MissionLoader_LoadWaypoint_A78AD	proc far		; CODE XREF: VROOMM_StubThunk_6CDA0J World_ParseWrldForm_A767F+10Ep

var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A78F2
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	541Ah
		call	VROOMM_StubThunk_6BCA1
		add	sp, 4

loc_A78F2:				; CODE XREF: MissionLoader_LoadWaypoint_A78AD+27j
		pop	si
		leave
		retf
MissionLoader_LoadWaypoint_A78AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 134 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743,
; StreamReader_ConstructVariantA_63A39 (seg190), sub_3330B (×2),
; IndexedRecordReader_ConstructVariantA_65A1A (seg196), sub_2AFB5, sub_6BF1E, sub_21F8D —
; probable chargement d'une formation d'unités de mission.
; ==============================================================================================
MissionLoader_LoadFormation_A78F5	proc far		; CODE XREF: VROOMM_StubThunk_6CDAAJ World_ParseWrldForm_A767F+115p

var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 41524554h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A7917
		jmp	loc_A7A0D
; ���������������������������������������������������������������������������

loc_A7917:				; CODE XREF: MissionLoader_LoadFormation_A78F5+1Dj
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	eax, [bp+var_A]
		cmp	eax, dword_704CD
		jnz	short loc_A7944
		mov	eax, [bp+var_6]
		cmp	eax, dword_704D1
		jnz	short loc_A7944
		mov	ax, 1
		jmp	short loc_A7946
; ���������������������������������������������������������������������������

loc_A7944:				; CODE XREF: MissionLoader_LoadFormation_A78F5+3Dj
					; MissionLoader_LoadFormation_A78F5+48j
		xor	ax, ax

loc_A7946:				; CODE XREF: MissionLoader_LoadFormation_A78F5+4Dj
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jnz	short loc_A7954
		jmp	loc_A7A0D
; ���������������������������������������������������������������������������

loc_A7954:				; CODE XREF: MissionLoader_LoadFormation_A78F5+5Aj
		push	292h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A7966
		jmp	loc_A79FC
; ���������������������������������������������������������������������������

loc_A7966:				; CODE XREF: MissionLoader_LoadFormation_A78F5+6Cj
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0

loc_A797F:
		mov	word ptr [si], 1AA8h

loc_A7983:
		add	ax, 0Bh
		push	ax

loc_A7987:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [si+0Bh], 2C8h
		mov	dword ptr [si+6Ch], 100h
		mov	dword ptr [si+68h], 0
		mov	word ptr [si+0Bh], 2E0h
		mov	word ptr [si+87h], 0
		xor	ax, ax
		mov	[si+85h], ax
		movsx	eax, ax
		mov	[si+70h], eax
		mov	ax, si
		add	ax, 0C1h ; '�'
		push	ax
		call	TerrainTile_DescriptorConstruct
		pop	cx
		mov	ax, si
		add	ax, 171h
		push	ax
		call	TerrainTile_DescriptorConstruct
		pop	cx
		mov	ax, si
		add	ax, 208h
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		mov	ax, si
		add	ax, 27Fh
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	VROOMM_StubThunk_6BF1E
		add	sp, 4
		mov	ax, si
		jmp	short loc_A79FE
; ���������������������������������������������������������������������������

loc_A79FC:				; CODE XREF: MissionLoader_LoadFormation_A78F5+6Ej
		mov	ax, si

loc_A79FE:				; CODE XREF: MissionLoader_LoadFormation_A78F5+105j
		mov	word_70474, ax
		push	ax
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4

loc_A7A0D:				; CODE XREF: MissionLoader_LoadFormation_A78F5+1Fj
					; MissionLoader_LoadFormation_A78F5+5Cj
		pop	si
		leave
		retf
MissionLoader_LoadFormation_A78F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 145 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743,
; ReadFieldGroupB_64A54, sub_2B24F, sub_2B228, ReadFieldGroupA_64A19, sub_2B2DB — chargement
; de champs de position (coordonnées) d'une entité de mission.
; ==============================================================================================
MissionLoader_LoadPosition_A7A10	proc far		; CODE XREF: VROOMM_StubThunk_6CDB4J World_ParseWrldForm_A767F+123p

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 5448474Ch
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A7A33

loc_A7A30:
		jmp	loc_A7B1A
; ���������������������������������������������������������������������������

loc_A7A33:				; CODE XREF: MissionLoader_LoadPosition_A7A10+1Ej
		push	di

loc_A7A34:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_C], ax
		push	ax
		push	5A9Ah
		call	ProgressBar_UpdateValue
		add	sp, 4
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	dx, ax
		cmp	dx, 64h	; 'd'
		jge	short loc_A7A59
		jmp	short loc_A7A5C
; ���������������������������������������������������������������������������

loc_A7A59:				; CODE XREF: MissionLoader_LoadPosition_A7A10+45j
		mov	ax, 64h	; 'd'

loc_A7A5C:				; CODE XREF: MissionLoader_LoadPosition_A7A10+47j
		mov	dx, ax
		movsx	eax, dx
		imul	eax, 0FFh
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		push	ax
		push	5A9Ah

loc_A7A78:
		call	ProgressBar_PercentToFixed
		add	sp, 4
		jmp	short loc_A7AE7
; ���������������������������������������������������������������������������

loc_A7A82:				; CODE XREF: MissionLoader_LoadPosition_A7A10+107j
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	al, [bp+var_2]
		push	ax
		sub	sp, 4
		mov	ax, [bp+var_4]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	ax, [bp+var_6]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	ax, [bp+var_8]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_24], eax
		push	[bp+var_A]
		push	5A9Ah
		call	ListItem_ConstructComplex
		add	sp, 12h

loc_A7AE7:				; CODE XREF: MissionLoader_LoadPosition_A7A10+70j
		test	word ptr [di+72h], 1
		jz	short loc_A7B02
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_A7B00
		inc	dword ptr [di+65h]
		jmp	short loc_A7B02
; ���������������������������������������������������������������������������

loc_A7B00:				; CODE XREF: MissionLoader_LoadPosition_A7A10+E8j
		jmp	short $+2

loc_A7B02:				; CODE XREF: MissionLoader_LoadPosition_A7A10+DCj
					; MissionLoader_LoadPosition_A7A10+EEj
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_A7B11
		mov	ax, 1
		jmp	short loc_A7B13
; ���������������������������������������������������������������������������

loc_A7B11:				; CODE XREF: MissionLoader_LoadPosition_A7A10+FAj
		xor	ax, ax

loc_A7B13:				; CODE XREF: MissionLoader_LoadPosition_A7A10+FFj
		or	ax, ax
		jnz	short loc_A7B1A
		jmp	loc_A7A82
; ���������������������������������������������������������������������������

loc_A7B1A:				; CODE XREF: MissionLoader_LoadPosition_A7A10:loc_A7A30j
					; MissionLoader_LoadPosition_A7A10+105j
		pop	di
		pop	si
		leave
		retf
MissionLoader_LoadPosition_A7A10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 199 lignes, NON DÉTAILLÉE — combine sub_2AFB5, ResourceRecord_SeekAndRead_64743,
; sub_2AFE0, instanciation d'objet (sub_38B70, motif de spawn seg109), ReadFieldGroupC_64A7E
; (×3), enregistrement conteneur (sub_21F8D) — spawn d'une entité de mission (avion, objet,
; cible) depuis les données chargées. Candidat prioritaire pour session dédiée.
; ==============================================================================================
MissionLoader_SpawnEntity_A7B1E	proc far		; CODE XREF: VROOMM_StubThunk_6CDA5J World_ParseWrldForm_A767F+3Fp	...

var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	0
		push	large 53594B53h
		push	di

loc_A7B3C:
		call	ResourceRecord_SeekAndRead_64743

loc_A7B41:
		add	sp, 8
		or	ax, ax
		jnz	short loc_A7B4B

loc_A7B48:
		jmp	loc_A7C8A
; ���������������������������������������������������������������������������

loc_A7B4B:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+28j
		jmp	loc_A7C57
; ���������������������������������������������������������������������������

loc_A7B4E:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+169j
		push	di
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		mov	[bp+var_C], ds
		mov	[bp+var_E], ax
		push	1
		push	1
		push	[bp+var_C]
		push	ax
		push	571Ch

loc_A7B6F:
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_A7B80

loc_A7B7D:
		jmp	loc_A7C57
; ���������������������������������������������������������������������������

loc_A7B80:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+5Dj
		push	di

loc_A7B81:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_12], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_32], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1A], eax
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_2E], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_22], eax
		shl	eax, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_3E]
		mov	[si+12h], eax
		mov	eax, [bp+var_3A]
		mov	[si+16h], eax
		mov	eax, [bp+var_36]
		mov	[si+1Ah], eax
		push	si
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		mov	eax, [bp+var_A]
		cmp	eax, dword_704D5
		jnz	short loc_A7C34
		mov	eax, [bp+var_6]
		cmp	eax, dword_704D9
		jnz	short loc_A7C34
		mov	ax, 1
		jmp	short loc_A7C36
; ���������������������������������������������������������������������������

loc_A7C34:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+104j
					; MissionLoader_SpawnEntity_A7B1E+10Fj
		xor	ax, ax

loc_A7C36:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+114j
		or	al, al

loc_A7C38:
		jz	short loc_A7C57

loc_A7C3A:
		mov	eax, [bp+var_32]
		mov	dword_72B57, eax

loc_A7C42:
		mov	eax, [bp+var_2E]
		mov	dword_72B5B, eax
		mov	eax, [bp+var_2A]
		mov	dword_72B5F, eax
		mov	byte_70477, 1

loc_A7C57:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E:loc_A7B4Bj
					; MissionLoader_SpawnEntity_A7B1E:loc_A7B7Dj	...
		test	word ptr [di+72h], 1
		jz	short loc_A7C72
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_A7C70
		inc	dword ptr [di+65h]
		jmp	short loc_A7C72
; ���������������������������������������������������������������������������

loc_A7C70:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+14Aj
		jmp	short $+2

loc_A7C72:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+13Ej
					; MissionLoader_SpawnEntity_A7B1E+150j
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_A7C81
		mov	ax, 1
		jmp	short loc_A7C83
; ���������������������������������������������������������������������������

loc_A7C81:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+15Cj
		xor	ax, ax

loc_A7C83:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E+161j
		or	ax, ax
		jnz	short loc_A7C8A
		jmp	loc_A7B4E
; ���������������������������������������������������������������������������

loc_A7C8A:				; CODE XREF: MissionLoader_SpawnEntity_A7B1E:loc_A7B48j
					; MissionLoader_SpawnEntity_A7B1E+167j
		pop	di
		pop	si
		leave
		retf
MissionLoader_SpawnEntity_A7B1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_23E7D (externe). || = MissionLoader_LoadChunkA : charge le FORM CAMR
; (caméras scriptées) du monde WRLD via Cinematic_LoadCameraDef(0x59CD, rec). Voir
; DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
MissionLoader_LoadChunkA_A7C8E	proc far		; CODE XREF: VROOMM_StubThunk_6CDAFJ World_ParseWrldForm_A767F+107p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	59CDh
		call	Cinematic_LoadCameraDef
		add	sp, 4
		pop	bp
		retf
MissionLoader_LoadChunkA_A7C8E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743, sub_2AFE0, alloue (sub_658), sub_6CC3D,
; enregistrement conteneur (sub_21F8D).
; ==============================================================================================
MissionLoader_LoadChunkB_A7CA1	proc far		; CODE XREF: VROOMM_StubThunk_6CDB9J World_ParseWrldForm_A767F+12Ap

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 4B4F4D53h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A7CC3
		jmp	loc_A7D43
; ���������������������������������������������������������������������������

loc_A7CC3:				; CODE XREF: MissionLoader_LoadChunkB_A7CA1+1Dj
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	33h ; '3'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A7D2B
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 30BAh
		mov	word ptr [si+17h], 0
		mov	word ptr [si+15h], 0
		mov	byte ptr [si+19h], 2
		mov	byte ptr [si+1Ah], 0
		mov	dword ptr [si+1Bh], 0
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	VROOMM_StubThunk_6CC3D
		add	sp, 4
		mov	ax, si
		jmp	short loc_A7D2D
; ���������������������������������������������������������������������������

loc_A7D2B:				; CODE XREF: MissionLoader_LoadChunkB_A7CA1+40j
		mov	ax, si

loc_A7D2D:				; CODE XREF: MissionLoader_LoadChunkB_A7CA1+88j
		mov	word_70483, ax

loc_A7D30:
		cmp	word_70483, 0
		jz	short loc_A7D43
		push	ax
		push	59C3h

loc_A7D3B:
		call	Container_KeyEquals

loc_A7D40:
		add	sp, 4

loc_A7D43:				; CODE XREF: MissionLoader_LoadChunkB_A7CA1+1Fj
					; MissionLoader_LoadChunkB_A7CA1+94j
		pop	si

locret_A7D44:
		leave
		retf
MissionLoader_LoadChunkB_A7CA1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 91 lignes, NON DÉTAILLÉE — combine sub_3A274, sub_2AF07, sub_23C38, sub_223F0 (×2),
; sub_22392, sub_6AEDA, Memory_TypedFree_5C7B6, sub_446B7 — probable affectation d'unités
; (pilotes/équipe) à une mission.
; ==============================================================================================
MissionLoader_AssignUnitRoster_A7D46	proc far		; CODE XREF: VROOMM_StubThunk_6CDBEJ MissionLoader_ReleaseRosterAndDestruct_A7F16+10p

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_70446, 0
		jnz	short loc_A7D56
		jmp	locret_A7E39
; ���������������������������������������������������������������������������

loc_A7D56:				; CODE XREF: MissionLoader_AssignUnitRoster_A7D46+Bj
		push	59BDh
		call	WeakRef_TableDestruct
		pop	cx
		push	53FAh
		call	Widget_DestructTwoLabels
		pop	cx
		push	59CDh
		call	Kneeboard_ResetAndRefresh
		pop	cx
		push	word_70474
		push	59C3h
		call	Container_Op_223F0
		add	sp, 4
		push	word_70483
		push	59C3h
		call	Container_Op_223F0
		add	sp, 4
		cmp	word_70474, 0
		jz	short loc_A7DAA
		push	3
		push	word_70474
		mov	bx, word_70474
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_A7DAA:				; CODE XREF: MissionLoader_AssignUnitRoster_A7D46+4Ej
		mov	word_70474, 0
		cmp	word_70483, 0
		jz	short loc_A7DCB
		push	3
		push	word_70483
		mov	bx, word_70483
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_A7DCB:				; CODE XREF: MissionLoader_AssignUnitRoster_A7D46+6Fj
		mov	word_70483, 0
		push	59C3h
		call	Container_Clear
		pop	cx
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEDA
		add	sp, 4
		cmp	byte_72B74, 0
		jz	short loc_A7E14
		cmp	dword_72B6F, 0
		jz	short loc_A7E14
		push	0
		mov	al, byte_72B73
		push	ax
		mov	eax, dword_72B6F
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_A7E14:				; CODE XREF: MissionLoader_AssignUnitRoster_A7D46+A5j
					; MissionLoader_AssignUnitRoster_A7D46+ADj
		mov	dword_72B6F, 0
		mov	byte_72B74, 0
		mov	dword_72B75, 0
		push	5A92h
		call	Collision_DestructDescriptor
		pop	cx
		mov	byte_70446, 0

locret_A7E39:				; CODE XREF: MissionLoader_AssignUnitRoster_A7D46+Dj
		leave
		retf
MissionLoader_AssignUnitRoster_A7D46	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 71 lignes, NON DÉTAILLÉE — variante de MissionLoader_AssignUnitRoster_A7D46
; (sub_3A3B0, sub_23AE5, sub_223F0 ×2, sub_22392, sub_21E90, sub_6BF28, sub_28EB1).
; ==============================================================================================
MissionLoader_AssignUnitRosterB_A7E3B	proc far		; CODE XREF: VROOMM_StubThunk_6CDC3J
		push	bp
		mov	bp, sp
		cmp	byte_70446, 0

loc_A7E43:
		jnz	short loc_A7E48
		jmp	loc_A7F14
; ���������������������������������������������������������������������������

loc_A7E48:				; CODE XREF: MissionLoader_AssignUnitRosterB_A7E3B:loc_A7E43j
		push	59BDh
		call	WeakRef_InvalidateAll
		pop	cx
		push	59CDh
		call	Kneeboard_ClearShortcut
		pop	cx
		push	word_70474
		push	59C3h
		call	Container_Op_223F0
		add	sp, 4
		push	word_70474

loc_A7E6D:
		call	VROOMM_StubThunk_6BF28
		pop	cx

loc_A7E73:
		push	word_70483

loc_A7E77:
		push	59C3h
		call	Container_Op_223F0

loc_A7E7F:
		add	sp, 4

loc_A7E82:
		push	59C3h
		call	Container_Clear
		pop	cx
		push	59C3h
		call	Container_Construct
		pop	cx
		call	RadioFlags_ResetBank
		mov	word_6DF26, 0
		mov	byte_6DF29, 0
		mov	byte_6DF28, 0FFh
		mov	dword_6DF2E, 0
		mov	byte_72B34, 0
		xor	eax, eax
		mov	dword_72B35, eax
		mov	dword_72B39, eax
		mov	dword_6E33D, 0
		mov	word_6E46F, 0
		mov	byte_722D0, 0
		mov	byte_722D1, 0
		mov	dword_6E477, 0
		mov	word_6E47B, 5
		mov	word_6E47D, 5
		mov	word_70466, 0
		mov	word_70479, 0
		mov	word_7047D, 0
		mov	word_7047B, 0
		mov	word_7047F, 0
		mov	word_70481, 0

loc_A7F14:				; CODE XREF: MissionLoader_AssignUnitRosterB_A7E3B+Aj
		pop	bp
		retf
MissionLoader_AssignUnitRosterB_A7E3B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle MissionLoader_AssignUnitRoster_A7D46 puis libère l'objet (sub_338).
; ==============================================================================================
MissionLoader_ReleaseRosterAndDestruct_A7F16	proc far		; CODE XREF: VROOMM_StubThunk_6CDD2J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A7F36
		push	cs
		call	near ptr MissionLoader_AssignUnitRoster_A7D46
		test	di, 1
		jz	short loc_A7F36
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A7F36:				; CODE XREF: MissionLoader_ReleaseRosterAndDestruct_A7F16+Dj
					; MissionLoader_ReleaseRosterAndDestruct_A7F16+17j
		pop	di
		pop	si
		pop	bp
		retf
MissionLoader_ReleaseRosterAndDestruct_A7F16	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 69 lignes, NON DÉTAILLÉE — combine sub_2075B (×2), TextFormat_ReleaseAttribute_5E5AC
; (seg143), sub_23AF4, sub_2E801.
; ==============================================================================================
MissionLoader_QueryAndReleaseAttribute_A7F3A	proc far		; CODE XREF: VROOMM_StubThunk_6CDD7J

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_721F0, 2
		jnz	short loc_A7F56
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_A7F56:				; CODE XREF: MissionLoader_QueryAndReleaseAttribute_A7F3A+Bj
		push	0
		push	word_70E62
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		cmp	byte_721F0, 2
		jnz	short loc_A7FA7
		pushf
		mov	bx, 534Dh

loc_A7F6F:
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_2], bx
		push	1
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		cmp	[bp+var_2], 0
		jnz	short loc_A7FA5
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short loc_A7FA7
; ���������������������������������������������������������������������������

loc_A7FA5:				; CODE XREF: MissionLoader_QueryAndReleaseAttribute_A7F3A+5Dj
		jmp	short $+2

loc_A7FA7:				; CODE XREF: MissionLoader_QueryAndReleaseAttribute_A7F3A+2Fj
					; MissionLoader_QueryAndReleaseAttribute_A7F3A+69j
		push	59CDh
		call	Kneeboard_Init
		pop	cx
		mov	[bp+var_4], ax
		mov	dword_6E33D, 0
		mov	word_70466, 0
		push	541Ah
		call	VGA_LoadPalette
		pop	cx
		mov	ax, [bp+var_4]
		leave
		retf
MissionLoader_QueryAndReleaseAttribute_A7F3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (fonction minimale, 8 lignes).
; ==============================================================================================
MissionLoader_Helper_A7FD0	proc far		; CODE XREF: VROOMM_StubThunk_6CDDCJ
		push	bp
		mov	bp, sp
		mov	dword_704DD, 4E2000h
		mov	dword_704E1, 0FA000h
		pop	bp
		retf
MissionLoader_Helper_A7FD0	endp

seg455		ends
