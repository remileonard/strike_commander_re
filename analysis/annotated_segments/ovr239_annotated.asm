ovr239		segment	para public 'OVERLAY' use16
		assume cs:ovr239
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que AIManeuver_LoadFormationData_77E78 (seg232) — chargement de données de
; formation.
; ==============================================================================================
AIManeuver_LoadFormationDataC_7AEE0	proc far		; CODE XREF: VROOMM_StubThunk_6ADAFJ MissionRecord_LoadEntityDatabase_7B035+DAp

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_7AEE4:
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_7AEFE
		push	80h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_7AEFE
		jmp	loc_7AF98
; ���������������������������������������������������������������������������

loc_7AEFE:				; CODE XREF: AIManeuver_LoadFormationDataC_7AEE0+Aj
					; AIManeuver_LoadFormationDataC_7AEE0+19j
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 4D9h
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_7AF6B
		mov	word ptr [di], 44Ch
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		push	large 0C7013Fh
		push	large 0
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah
		mov	ax, di
		jmp	short loc_7AF6D
; ���������������������������������������������������������������������������

loc_7AF6B:				; CODE XREF: AIManeuver_LoadFormationDataC_7AEE0+53j
		mov	ax, di

loc_7AF6D:				; CODE XREF: AIManeuver_LoadFormationDataC_7AEE0+89j
		mov	[si+5Ch], ax
		sub	sp, 4

loc_7AF73:
		mov	[bp+var_8], 0A00h
		sub	sp, 4
		mov	[bp+var_C], 2800h
		push	large 0C350h
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6BC12
		add	sp, 10h

loc_7AF98:				; CODE XREF: AIManeuver_LoadFormationDataC_7AEE0+1Bj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
AIManeuver_LoadFormationDataC_7AEE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
AIManeuver_Helper5_7AF9E	proc far		; CODE XREF: VROOMM_StubThunk_6ADB4J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 10h
		pop	bp
		retf
AIManeuver_Helper5_7AF9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 20L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_UpdateEntry'). CONFIRME DIRECTEMENT
; 0x59CD comme adresse de la liste globale trackee : ajoute l'entite passee en parametre a
; cette liste (EntityTracker_AddEntryObj) PUIS l'applique comme selection active
; (EntityTracker_ApplySelection). Appelee depuis MissionRecord_LoadEntityDatabase_7B035 —
; candidat serieux pour la fonction qui peuple cette liste avec les entites de la mission, a
; lire.
; ==============================================================================================
EntityTracker_RegisterAndSelect	proc far		; CODE XREF: VROOMM_StubThunk_6ADBEJ
					; MissionRecord_LoadEntityDatabase_7B035:loc_7B14Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	59CDh
		call	EntityTracker_AddEntryObj
		add	sp, 4
		push	si
		push	59CDh
		call	EntityTracker_ApplySelection
		add	sp, 4
		pop	si
		pop	bp
		retf
EntityTracker_RegisterAndSelect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Camera_CopyState, SmallObject_RegisterInList_5D999 (seg139),
; Camera_UpdateViewportClip, Container_FindAndTouch, Widget_RefreshTextConditional,
; Collection_NotifyAllDestroy — mise à jour de caméra avec notification de destruction de
; collection.
; ==============================================================================================
Camera_UpdateAndNotify_7AFCA	proc far		; CODE XREF: VROOMM_StubThunk_6ADB9J

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_7B032
		push	si
		push	5146h
		call	Camera_CopyState
		add	sp, 4
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		push	si
		call	Camera_UpdateViewportClip
		pop	cx
		mov	word_724AC, 0
		push	si
		push	59C3h
		call	WorldObjects_CallSlot4OnAllThenRecompute_2214F
		add	sp, 4
		push	53FAh
		call	Widget_RefreshTextConditional
		pop	cx
		push	53FAh
		call	Collection_NotifyAllDestroy
		pop	cx
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4

loc_7B032:				; CODE XREF: Camera_UpdateAndNotify_7AFCA+Ej
		pop	si
		leave
		retf
Camera_UpdateAndNotify_7AFCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 3103 lignes — la plus grosse fonction de tout le fichier, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndRead_64743, IndexedRecordReader_ConstructVariantC_65A8A/VariantA_65A1A
; (seg196), Path_ResolveDataFile (seg057) — chargement massif d'une base d'entités depuis un
; fichier de données résolu par chemin. Candidat prioritaire absolu pour session dédiée.
; ==============================================================================================
MissionRecord_LoadEntityDatabase_7B035	proc far		; CODE XREF: VROOMM_StubThunk_6ADC3J

var_28A		= dword	ptr -28Ah
var_280		= dword	ptr -280h
var_27C		= dword	ptr -27Ch
var_278		= dword	ptr -278h
var_274		= dword	ptr -274h
var_270		= dword	ptr -270h
var_26C		= dword	ptr -26Ch
var_268		= dword	ptr -268h
var_264		= dword	ptr -264h
var_260		= dword	ptr -260h
var_25C		= dword	ptr -25Ch
var_258		= dword	ptr -258h
var_254		= dword	ptr -254h
var_250		= dword	ptr -250h
var_24C		= dword	ptr -24Ch
var_248		= dword	ptr -248h
var_244		= dword	ptr -244h
var_240		= dword	ptr -240h
var_23C		= dword	ptr -23Ch
var_238		= dword	ptr -238h
var_234		= dword	ptr -234h
var_230		= dword	ptr -230h
var_22C		= dword	ptr -22Ch
var_228		= dword	ptr -228h
var_224		= dword	ptr -224h
var_220		= dword	ptr -220h
var_21C		= dword	ptr -21Ch
var_218		= dword	ptr -218h
var_214		= dword	ptr -214h
var_210		= dword	ptr -210h
var_20C		= dword	ptr -20Ch
var_208		= dword	ptr -208h
var_204		= dword	ptr -204h
var_200		= dword	ptr -200h
var_1FC		= dword	ptr -1FCh
var_1F8		= dword	ptr -1F8h
var_1F4		= dword	ptr -1F4h
var_1F0		= dword	ptr -1F0h
var_1EC		= dword	ptr -1ECh
var_1E8		= dword	ptr -1E8h
var_1E4		= dword	ptr -1E4h
var_1E0		= dword	ptr -1E0h
var_1DC		= dword	ptr -1DCh
var_1D8		= dword	ptr -1D8h
var_1D4		= dword	ptr -1D4h
var_1D0		= dword	ptr -1D0h
var_1CC		= dword	ptr -1CCh
var_1C8		= dword	ptr -1C8h
var_1C4		= dword	ptr -1C4h
var_1C0		= dword	ptr -1C0h
var_1BC		= dword	ptr -1BCh
var_1B8		= dword	ptr -1B8h
var_1B4		= dword	ptr -1B4h
var_1B0		= dword	ptr -1B0h
var_1AC		= dword	ptr -1ACh
var_1A8		= dword	ptr -1A8h
var_1A4		= dword	ptr -1A4h
var_1A0		= dword	ptr -1A0h
var_19C		= dword	ptr -19Ch
var_198		= dword	ptr -198h
var_192		= word ptr -192h
var_18E		= word ptr -18Eh
var_18C		= dword	ptr -18Ch
var_188		= dword	ptr -188h
var_184		= dword	ptr -184h
var_180		= dword	ptr -180h
var_17C		= dword	ptr -17Ch
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= word ptr -148h
var_146		= dword	ptr -146h
var_142		= dword	ptr -142h
var_13E		= dword	ptr -13Eh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= dword	ptr -12Ah
var_126		= dword	ptr -126h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= dword	ptr -116h
var_112		= dword	ptr -112h
var_10E		= dword	ptr -10Eh
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= word ptr -102h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5A		= dword	ptr -5Ah
var_56		= word ptr -56h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3B		= byte ptr -3Bh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_29		= byte ptr -29h
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 280h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_9], 1
		mov	[bp+var_A], 0
		mov	byte_70471, 1
		mov	byte_70447, 0
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		mov	ax, word_6E4B2
		add	ax, 220h
		mov	[bp+var_16], ax

loc_7B074:
		push	0
		push	large 43454A45h
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_7B092
		push	7005h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_7B092:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+52j
		mov	bx, [bp+var_16]
		push	large dword ptr	[bx+76h]
		push	large dword ptr	[bx+65h]
		mov	ax, word_6E4B2
		add	ax, 220h
		push	ax
		push	0
		call	IndexedRecordReader_ConstructVariantC_65A8A
		add	sp, 0Ch
		mov	[bp+var_18], ax
		push	0
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		mov	[bp+var_1A], ax
		push	50h ; 'P'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_2E+2],	ax
		or	ax, ax
		jz	short loc_7B0CD
		jmp	short loc_7B0D0
; ���������������������������������������������������������������������������

loc_7B0CD:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+94j
		mov	ax, word ptr [bp+var_2E+2]

loc_7B0D0:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+96j
		mov	[bp-2Ah], ax
		push	ds
		push	offset a_pak_2	; ".PAK"
		push	ds
		push	offset aEject	; "EJECT"
		push	ds
		push	offset aObjects	; "OBJECTS"
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		push	word ptr [bp-2Ah]
		push	[bp+var_1A]
		mov	bx, [bp+var_1A]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	word ptr [bp-2Ah], 0
		jz	short loc_7B10C
		push	word ptr [bp-2Ah]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_7B10C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+CAj
		push	0
		push	cs
		call	near ptr AIManeuver_LoadFormationDataC_7AEE0
		pop	cx
		mov	si, ax
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_20], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax

loc_7B142:
		mov	eax, [bx+8]

loc_7B146:
		mov	[si+1Ch], eax
		push	si
		push	cs

loc_7B14C:
		call	near ptr EntityTracker_RegisterAndSelect
		pop	cx

loc_7B150:
		push	0

loc_7B152:
		push	word_6E4B2

loc_7B156:
		call	VROOMM_StubThunk_6B1FA
		add	sp, 4
		mov	ax, word_6E4B2
		add	ax, 135h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	al, [bx+4]
		mov	[bp+var_27], al
		mov	eax, [bp+var_26]
		mov	[bp+var_14], eax
		mov	al, [bp+var_27]
		mov	[bp+var_10], al
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		mov	eax, [bx+6]
		mov	[bp+var_E], eax
		push	0Bh
		call	TextObject_AllocateVariantA_5A984
		pop	cx
		cmp	[bp+arg_2], 3
		jnb	short loc_7B1AA
		jmp	loc_7B53B
; ���������������������������������������������������������������������������

loc_7B1AA:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+170j
		mov	[bp+var_32], 0
		mov	byte ptr [bp+var_2E], 2
		mov	byte ptr [bp+var_2E+1],	0
		mov	[bp+var_2E+2], 0
		push	0
		push	[bp+var_18]
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+var_18]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7B1E3
		mov	eax, [bx+61h]
		jmp	short loc_7B1EA
; ���������������������������������������������������������������������������

loc_7B1E3:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1A6j
		mov	bx, [bp+var_18]
		mov	eax, [bx+71h]

loc_7B1EA:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1ACj
		mov	[bp+var_36], eax
		push	0
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax
		mov	eax, [bp+var_3A]
		mov	[bp+var_32], eax
		mov	byte ptr [bp+var_2E], 3
		mov	byte ptr [bp+var_2E+1],	1
		mov	[bp+var_2E+2], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_2E+2], eax
		cmp	[bp+var_32], 0
		jz	short loc_7B252
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		push	large [bp+var_32]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0

loc_7B247:
		push	[bp+var_18]
		call	IndexedRecordReader_SeekToIndex_65C6D

loc_7B24F:
		add	sp, 8

loc_7B252:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1F7j
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1],	0
		mov	[bp+var_40+2], 0
		push	1
		push	[bp+var_18]
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+var_18]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7B28B
		mov	eax, [bx+61h]
		jmp	short loc_7B292
; ���������������������������������������������������������������������������

loc_7B28B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+24Ej
		mov	bx, [bp+var_18]
		mov	eax, [bx+71h]

loc_7B292:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+254j
		mov	[bp+var_48], eax
		push	0
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4C+2],	dx
		mov	word ptr [bp+var_4C], ax
		mov	eax, [bp+var_4C]
		mov	[bp+var_44], eax
		mov	byte ptr [bp+var_40], 3
		mov	byte ptr [bp+var_40+1],	1
		mov	[bp+var_40+2], 0
		mov	eax, [bp+var_48]
		mov	[bp+var_40+2], eax
		cmp	[bp+var_44], 0
		jz	short loc_7B2FA
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		push	large [bp+var_44]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	1
		push	[bp+var_18]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_7B2FA:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+29Fj
		mov	[bp+var_50], 19h
		mov	eax, [bp+var_50]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_170]
		push	ss
		push	ax
		push	ds
		push	offset unk_6D564
		mov	cx, 10h
		call	CRT_Fmemcpy
		lea	ax, [bp+var_180]
		push	ss
		push	ax
		push	ds
		push	offset unk_6D574
		mov	cx, 10h
		call	CRT_Fmemcpy
		mov	[bp+var_4], 0
		mov	byte ptr [bp+var_54+3],	1
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_54], ax
		mov	bx, word ptr [bp+var_54]

loc_7B342:
		mov	eax, [bx]
		mov	[si+14h], eax

loc_7B349:
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		cmp	[bp+var_44], 0
		jnz	short loc_7B363
		jmp	loc_7B4CB
; ���������������������������������������������������������������������������

loc_7B363:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+329j
		cmp	[bp+var_32], 0
		jnz	short loc_7B36D
		jmp	loc_7B4CB
; ���������������������������������������������������������������������������

loc_7B36D:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+333j
		jmp	loc_7B4C2
; ���������������������������������������������������������������������������

loc_7B370:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+493j
		call	CombatTarget_WeaponActionSubsystem
		mov	byte ptr [bp+var_54+3],	al
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_56], ax
		mov	bx, [bp+var_56]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		call	Frame_UpdateTimingAndNotifyTrackedObjects_500F6
		push	large 0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	bx, [bp+var_4]
		shl	bx, 1
		lea	ax, [bp+var_170]
		add	bx, ax
		cmp	word ptr [bx], 0FFFFh
		jz	short loc_7B41B
		mov	bx, [bp+var_4]
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		push	large [bp+var_32]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_7B41B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+3B5j
		mov	bx, [bp+var_4]
		shl	bx, 1
		lea	ax, [bp+var_180]
		add	bx, ax
		cmp	word ptr [bx], 0FFFFh
		jz	short loc_7B45A
		mov	bx, [bp+var_4]
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		push	large [bp+var_44]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx

loc_7B44A:
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_7B45A:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+3F4j
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	eax, dword_70458
		sub	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jg	short loc_7B477
		mov	ax, 1
		jmp	short loc_7B479
; ���������������������������������������������������������������������������

loc_7B477:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+43Bj
		xor	ax, ax

loc_7B479:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+440j
		or	al, al
		jz	short loc_7B498
		inc	[bp+var_4]
		mov	ax, [bp+var_4]
		cmp	ax, 8
		jge	short loc_7B4CB
		mov	[bp+var_5A], 19h
		mov	eax, [bp+var_5A]
		mov	[bp+var_8], eax

loc_7B498:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+446j
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_7B4A8
		mov	[bp+var_A], 1
		jmp	short loc_7B4CB
; ���������������������������������������������������������������������������

loc_7B4A8:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+46Bj
		cmp	byte_6E345, 0
		jz	short loc_7B4B5
		mov	[bp+var_A], 1
		jmp	short loc_7B4CB
; ���������������������������������������������������������������������������

loc_7B4B5:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+478j
		cmp	byte_706AF, 0
		jz	short loc_7B4C2
		mov	[bp+var_A], 1
		jmp	short loc_7B4CB
; ���������������������������������������������������������������������������

loc_7B4C2:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7B36Dj
					; MissionRecord_LoadEntityDatabase_7B035+485j
		cmp	byte ptr [bp+var_54+3],	0
		jz	short loc_7B4CB
		jmp	loc_7B370
; ���������������������������������������������������������������������������

loc_7B4CB:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+32Bj
					; MissionRecord_LoadEntityDatabase_7B035+335j ...
		cmp	byte ptr [bp+var_40+1],	0
		jz	short loc_7B4EF
		cmp	[bp+var_44], 0
		jz	short loc_7B4EF
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7B4EF:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+49Aj
					; MissionRecord_LoadEntityDatabase_7B035+4A1j
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40+1],	0
		mov	[bp+var_40+2], 0
		cmp	byte ptr [bp+var_2E+1],	0
		jz	short loc_7B527
		cmp	[bp+var_32], 0
		jz	short loc_7B527
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7B527:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+4D2j
					; MissionRecord_LoadEntityDatabase_7B035+4D9j
		mov	[bp+var_32], 0
		mov	byte ptr [bp+var_2E+1],	0
		mov	[bp+var_2E+2], 0

loc_7B53B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+172j
		cmp	[bp+arg_2], 1
		jnb	short loc_7B544
		jmp	loc_7B986
; ���������������������������������������������������������������������������

loc_7B544:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+50Aj
		cmp	[bp+arg_2], 3

loc_7B548:
		jb	short loc_7B54D

loc_7B54A:
		jmp	loc_7B986
; ���������������������������������������������������������������������������

loc_7B54D:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7B548j
		mov	al, [bp+var_A]
		mov	ah, 0

loc_7B552:
		or	ax, ax
		jz	short loc_7B559

loc_7B556:
		jmp	loc_7B986
; ���������������������������������������������������������������������������

loc_7B559:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+51Fj
		cmp	byte_706AF, 0
		jz	short loc_7B563
		jmp	loc_7B986
; ���������������������������������������������������������������������������

loc_7B563:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+529j
		mov	[bp+var_32], 0
		mov	byte ptr [bp+var_2E], 2
		mov	byte ptr [bp+var_2E+1],	0
		mov	[bp+var_2E+2], 0
		push	2
		push	[bp+var_18]
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+var_18]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7B59C
		mov	eax, [bx+61h]
		jmp	short loc_7B5A3
; ���������������������������������������������������������������������������

loc_7B59C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+55Fj
		mov	bx, [bp+var_18]
		mov	eax, [bx+71h]

loc_7B5A3:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+565j
		mov	[bp+var_36], eax
		push	0
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax
		mov	eax, [bp+var_3A]
		mov	[bp+var_32], eax
		mov	byte ptr [bp+var_2E], 3
		mov	byte ptr [bp+var_2E+1],	1
		mov	[bp+var_2E+2], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_2E+2], eax
		cmp	[bp+var_32], 0
		jz	short loc_7B60B
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		push	large [bp+var_32]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	2
		push	[bp+var_18]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_7B60B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+5B0j
		cmp	[bp+var_32], 0
		jz	short loc_7B618
		mov	[bp+var_3B], 1
		jmp	short loc_7B61C
; ���������������������������������������������������������������������������

loc_7B618:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+5DBj
		mov	[bp+var_3B], 0

loc_7B61C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+5E1j
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADAA
		push	large 10005h
		push	0Ah
		lea	ax, [bp+var_192]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_2], 0
		jmp	loc_7B733
; ���������������������������������������������������������������������������

loc_7B63F:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+704j
		push	[bp+var_2]
		push	[bp+var_1A]

loc_7B645:
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+var_1A]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7B661
		mov	eax, [bx+61h]
		jmp	short loc_7B668
; ���������������������������������������������������������������������������

loc_7B661:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+624j
		mov	bx, [bp+var_1A]
		mov	eax, [bx+71h]

loc_7B668:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+62Aj
		mov	[bp+var_40], eax
		push	0
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_44+2],	dx
		mov	word ptr [bp+var_44], ax
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_192]
		add	bx, ax
		mov	ax, word ptr [bp+var_44+2]
		mov	dx, word ptr [bp+var_44]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_18E]
		add	bx, ax
		mov	byte ptr [bx], 3
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_18E+1]
		add	bx, ax
		mov	byte ptr [bx], 1
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_18C]
		add	bx, ax
		mov	dword ptr [bx],	0
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		add	bx, ax
		mov	eax, [bp+var_40]
		mov	[bx], eax
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_192]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jnz	short loc_7B6F5
		mov	[bp+var_3B], 0
		jmp	short loc_7B73C
; ���������������������������������������������������������������������������

loc_7B6F5:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+6B8j
		push	0
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_18E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_192]
		add	bx, ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		push	[bp+var_1A]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		inc	[bp+var_2]

loc_7B733:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+607j
		cmp	[bp+var_2], 5
		jge	short loc_7B73C
		jmp	loc_7B63F
; ���������������������������������������������������������������������������

loc_7B73C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+6BEj
					; MissionRecord_LoadEntityDatabase_7B035+702j
		mov	[bp+var_4], 0

loc_7B741:
		mov	word ptr [bp+var_48+2],	0
		cmp	[bp+var_3B], 0
		jz	short loc_7B781
		push	0
		mov	bx, word ptr [bp+var_48+2]
		imul	bx, 0Ah
		lea	ax, [bp+var_18E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, word ptr [bp+var_48+2]
		imul	bx, 0Ah
		lea	ax, [bp+var_192]
		add	bx, ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_625CC
		mov	word ptr [bp+var_48], ax

loc_7B781:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+715j
		mov	[bp+var_4C], 0Ch
		mov	eax, [bp+var_4C]
		mov	[bp+var_8], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_50+2],	ax
		mov	bx, word ptr [bp+var_50+2]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		cmp	[bp+var_3B], 0
		jnz	short loc_7B7BC
		jmp	loc_7B933
; ���������������������������������������������������������������������������

loc_7B7BC:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+782j
		jmp	loc_7B927
; ���������������������������������������������������������������������������

loc_7B7BF:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+8FBj
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_50], ax
		mov	bx, word ptr [bp+var_50]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Utility_Helper_55A37
		pop	cx
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Utility_Helper_55A37
		pop	cx
		call	Frame_UpdateTimingAndNotifyTrackedObjects_500F6
		push	large 0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		push	large [bp+var_32]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	[bp+var_4]
		push	0
		mov	bx, word ptr [bp+var_48+2]

loc_7B843:
		imul	bx, 0Ah
		lea	ax, [bp+var_18E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, word ptr [bp+var_48+2]

loc_7B852:
		imul	bx, 0Ah
		lea	ax, [bp+var_192]
		add	bx, ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	eax, dword_70458
		sub	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jg	short loc_7B897
		mov	ax, 1
		jmp	short loc_7B899
; ���������������������������������������������������������������������������

loc_7B897:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+85Bj
		xor	ax, ax

loc_7B899:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+860j
		or	al, al
		jz	short loc_7B8FD
		inc	[bp+var_4]
		mov	ax, [bp+var_4]
		cmp	ax, word ptr [bp+var_48]
		jl	short loc_7B8ED
		mov	[bp+var_4], 0
		inc	word ptr [bp+var_48+2]
		mov	ax, word ptr [bp+var_48+2]
		cmp	ax, 5
		jge	short loc_7B933
		push	0
		mov	bx, word ptr [bp+var_48+2]
		imul	bx, 0Ah
		lea	ax, [bp+var_18E]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, word ptr [bp+var_48+2]
		imul	bx, 0Ah
		lea	ax, [bp+var_192]
		add	bx, ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_625CC
		mov	word ptr [bp+var_48], ax

loc_7B8ED:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+871j
		mov	[bp+var_54], 0Ch
		mov	eax, [bp+var_54]
		mov	[bp+var_8], eax

loc_7B8FD:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+866j
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_7B90D
		mov	[bp+var_A], 1
		jmp	short loc_7B933
; ���������������������������������������������������������������������������

loc_7B90D:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+8D0j
		cmp	byte_6E345, 0
		jz	short loc_7B91A
		mov	[bp+var_A], 1
		jmp	short loc_7B933
; ���������������������������������������������������������������������������

loc_7B91A:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+8DDj
		cmp	byte_706AF, 0
		jz	short loc_7B927
		mov	[bp+var_A], 1
		jmp	short loc_7B933
; ���������������������������������������������������������������������������

loc_7B927:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7B7BCj
					; MissionRecord_LoadEntityDatabase_7B035+8EAj
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jz	short loc_7B933
		jmp	loc_7B7BF
; ���������������������������������������������������������������������������

loc_7B933:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+784j
					; MissionRecord_LoadEntityDatabase_7B035+881j ...
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADA5
		push	large 10005h
		push	0Ah

loc_7B941:
		lea	ax, [bp+var_192]
		push	ax

loc_7B946:
		call	CRT_Doprnt_Core

loc_7B94B:
		add	sp, 0Ch
		cmp	byte ptr [bp+var_2E+1],	0
		jz	short loc_7B972
		cmp	[bp+var_32], 0
		jz	short loc_7B972
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7B972:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+91Dj
					; MissionRecord_LoadEntityDatabase_7B035+924j
		mov	[bp+var_32], 0
		mov	byte ptr [bp+var_2E+1],	0
		mov	[bp+var_2E+2], 0

loc_7B986:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+50Cj
					; MissionRecord_LoadEntityDatabase_7B035:loc_7B54Aj	...
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7B992
		jmp	loc_7C03A
; ���������������������������������������������������������������������������

loc_7B992:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+958j
		cmp	[bp+arg_2], 2
		jnb	short loc_7B99B
		jmp	loc_7C03A
; ���������������������������������������������������������������������������

loc_7B99B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+961j
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7B9A7
		jmp	loc_7C03A
; ���������������������������������������������������������������������������

loc_7B9A7:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+96Dj
		mov	eax, [di+20h]
		shl	eax, 2
		mov	[bp+var_32+2], eax
		mov	[bp+var_2E+2], eax
		shl	eax, 1
		mov	[bp+var_3A+2], eax
		mov	[bp+var_36+2], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_3A], ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	[bp-3Ch], ax
		mov	bx, [bp-3Ch]
		mov	eax, [bx]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_164], eax
		mov	bx, word ptr [bp+var_3A]
		mov	eax, [bx]
		sub	eax, [bp+var_16C]
		mov	[bp+var_178], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_168]
		mov	[bp+var_174], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_164]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_178]
		mov	[bp+var_184], eax
		mov	eax, [bp+var_174]
		mov	[bp+var_180], eax
		mov	eax, [bp+var_170]
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_184]
		mov	[si+14h], eax
		mov	eax, [bp+var_180]
		mov	[si+18h], eax
		mov	eax, [bp+var_17C]
		mov	[si+1Ch], eax
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_56], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_5A+2],	ax
		mov	bx, [bp+var_56]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_5A+2]
		sub	eax, [bx]
		mov	[bp+var_1A8], eax
		mov	bx, [bp+var_56]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_5A+2]
		sub	eax, [bx+4]
		mov	[bp+var_1A4], eax
		mov	bx, [bp+var_56]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_5A+2]
		sub	eax, [bx+8]
		mov	[bp+var_1A0], eax
		mov	eax, [bp+var_1A8]
		mov	[bp+var_1B4], eax
		mov	eax, [bp+var_1A4]
		mov	[bp+var_1B0], eax
		mov	eax, [bp+var_1A0]
		mov	[bp+var_1AC], eax
		mov	eax, [bp+var_1B4]
		mov	[bp+var_19C], eax
		mov	eax, [bp+var_1B0]
		mov	[bp+var_198], eax
		mov	eax, [bp+var_1AC]
		mov	[bp-194h], eax
		lea	ax, [bp+var_19C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		jmp	loc_7C00F
; ���������������������������������������������������������������������������

loc_7BB46:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+FFCj
		mov	dword ptr [bp-5Ch], 0FFFFFF67h
		mov	[bp+var_60], 0FFFFFEE7h
		mov	[bp+var_64], 66h ; 'f'
		mov	eax, [bp-5Ch]
		mov	[bp+var_1C0], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_1BC], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_1B8], eax
		mov	eax, [bp+var_1C0]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C0], eax
		mov	eax, [bp+var_1BC]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1BC], eax
		mov	eax, [bp+var_1B8]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1B8], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_68+2],	ax
		mov	bx, word ptr [bp+var_68+2]
		mov	eax, [bx]
		mov	[bp+var_1CC], eax
		mov	eax, [bx+4]
		mov	[bp+var_1C8], eax
		mov	eax, [bx+8]
		mov	[bp+var_1C4], eax
		lea	ax, [bp+var_1F0]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		lea	ax, [bp+var_1CC]
		push	ax
		lea	ax, [bp+var_1F0]
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		lea	ax, [bp+var_1F0]
		push	ax
		lea	ax, [bp+var_1C0]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		lea	ax, [bp+var_1C0]
		push	ax
		push	di
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_68], ax
		mov	bx, word ptr [bp+var_68]
		mov	eax, [bx]
		add	[bp+var_1C0], eax
		mov	eax, [bx+4]
		add	[bp+var_1BC], eax

loc_7BC3F:
		mov	eax, [bx+8]

loc_7BC43:
		add	[bp+var_1B8], eax
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_6A], ax
		mov	bx, [bp+var_6A]
		mov	eax, [bp+var_1C0]
		sub	eax, [bx]
		mov	[bp+var_208], eax
		mov	eax, [bp+var_1BC]
		sub	eax, [bx+4]
		mov	[bp+var_204], eax
		mov	eax, [bp+var_1B8]
		sub	eax, [bx+8]
		mov	[bp+var_200], eax
		mov	eax, [bp+var_208]
		mov	[bp+var_1FC], eax
		mov	eax, [bp+var_204]
		mov	[bp+var_1F8], eax
		mov	eax, [bp+var_200]
		mov	[bp+var_1F4], eax
		push	eax
		push	large [bp+var_1F8]
		push	large [bp+var_1FC]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6E], eax
		mov	[bp+var_72], eax
		cmp	eax, [bp+var_36+2]
		jle	short loc_7BCC5
		mov	ax, 1
		jmp	short loc_7BCC7
; ���������������������������������������������������������������������������

loc_7BCC5:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+C89j
		xor	ax, ax

loc_7BCC7:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+C8Ej
		or	al, al
		jz	short loc_7BD44
		lea	ax, [bp+var_36+2]
		push	ax
		lea	ax, [bp+var_1FC]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_1C0]
		sub	eax, [bp+var_1FC]
		mov	[bp+var_214], eax
		mov	eax, [bp+var_1BC]
		sub	eax, [bp+var_1F8]
		mov	[bp+var_210], eax
		mov	eax, [bp+var_1B8]
		sub	eax, [bp+var_1F4]
		mov	[bp+var_20C], eax
		mov	eax, [bp+var_214]
		mov	[bp+var_220], eax
		mov	eax, [bp+var_210]
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_20C]
		mov	[bp+var_218], eax
		mov	eax, [bp+var_220]
		mov	[si+14h], eax
		mov	eax, [bp+var_21C]
		mov	[si+18h], eax
		mov	eax, [bp+var_218]
		mov	[si+1Ch], eax
		jmp	short loc_7BDBB
; ���������������������������������������������������������������������������

loc_7BD44:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+C94j
		mov	[bp+var_78+2], 400h

loc_7BD4C:
		mov	eax, [bp+var_1FC]

loc_7BD51:
		mov	edx, eax
		mov	ecx, [bp+var_78+2]

loc_7BD58:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1FC], eax
		mov	eax, [bp+var_1F8]
		mov	edx, eax
		mov	ecx, [bp+var_78+2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1F8], eax
		mov	eax, [bp+var_1F4]
		mov	edx, eax
		mov	ecx, [bp+var_78+2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1F4], eax
		mov	eax, [bp+var_1FC]
		add	[si+14h], eax
		mov	eax, [bp+var_1F8]
		add	[si+18h], eax
		mov	eax, [bp+var_1F4]
		add	[si+1Ch], eax

loc_7BDBB:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+D0Dj
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_78], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_7C+2],	ax
		mov	bx, word ptr [bp+var_78]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_7C+2]
		sub	eax, [bx]
		mov	[bp+var_22C], eax
		mov	bx, word ptr [bp+var_78]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_7C+2]
		sub	eax, [bx+4]
		mov	[bp+var_228], eax
		mov	bx, word ptr [bp+var_78]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_7C+2]
		sub	eax, [bx+8]
		mov	[bp+var_224], eax
		mov	eax, [bp+var_22C]
		mov	[bp+var_238], eax
		mov	eax, [bp+var_228]
		mov	[bp+var_234], eax
		mov	eax, [bp+var_224]
		mov	[bp+var_230], eax
		mov	eax, [bp+var_238]
		mov	[bp-190h], eax
		mov	eax, [bp+var_234]
		mov	[bp+var_18C], eax
		mov	eax, [bp+var_230]
		mov	[bp+var_188], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	word ptr [bp+var_7C], ax

loc_7BE46:
		push	large [bp+var_188]

loc_7BE4B:
		push	large [bp+var_18C]

loc_7BE50:
		push	large dword ptr	[bp-190h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	bx, word ptr [bp+var_7C]
		mov	eax, [bx]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_94], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_244], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_240], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_23C], eax
		mov	eax, [bp-190h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_A0], eax
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_18C]
		cdq
		idiv	ebx
		mov	[bp+var_A8], eax

loc_7BF13:
		mov	[bp+var_AC], eax

loc_7BF18:
		mov	eax, [bp+var_188]

loc_7BF1D:
		cdq

loc_7BF1F:
		idiv	ebx

loc_7BF22:
		mov	[bp+var_B0], eax

loc_7BF27:
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_250], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_24C], eax

loc_7BF40:
		mov	eax, [bp+var_B4]
		mov	[bp+var_248], eax

loc_7BF4A:
		mov	eax, [bp+var_244]

loc_7BF4F:
		add	eax, [bp+var_250]

loc_7BF54:
		mov	[bp+var_25C], eax
		mov	eax, [bp+var_240]
		add	eax, [bp+var_24C]
		mov	[bp+var_258], eax
		mov	eax, [bp+var_23C]
		add	eax, [bp+var_248]
		mov	[bp+var_254], eax
		mov	eax, [bp+var_25C]
		mov	[bp+var_268], eax
		mov	eax, [bp+var_258]
		mov	[bp+var_264], eax
		mov	eax, [bp+var_254]
		mov	[bp+var_260], eax
		mov	eax, [bp+var_268]
		mov	[bp+var_19C], eax
		mov	eax, [bp+var_264]
		mov	[bp+var_198], eax
		mov	eax, [bp+var_260]
		mov	[bp-194h], eax
		lea	ax, [bp+var_19C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		call	Frame_UpdateTimingAndNotifyTrackedObjects_500F6
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		cmp	byte_6E4B8, 0
		jz	short loc_7BFE5
		mov	[bp+var_9], 0
		mov	[bp+var_A], 1
		jmp	short loc_7C034
; ���������������������������������������������������������������������������

loc_7BFE5:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+FA4j
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_7BFF5
		mov	[bp+var_A], 1
		jmp	short loc_7C034
; ���������������������������������������������������������������������������

loc_7BFF5:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+FB8j
		cmp	byte_6E345, 0
		jz	short loc_7C002
		mov	[bp+var_A], 1
		jmp	short loc_7C034
; ���������������������������������������������������������������������������

loc_7C002:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+FC5j
		cmp	byte_706AF, 0
		jz	short loc_7C00F
		mov	[bp+var_A], 1
		jmp	short loc_7C034
; ���������������������������������������������������������������������������

loc_7C00F:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+B0Ej
					; MissionRecord_LoadEntityDatabase_7B035+FD2j
		call	CombatTarget_WeaponActionSubsystem
		or	al, al

loc_7C016:
		jz	short loc_7C034
		cmp	byte_706AF, 0
		jnz	short loc_7C034

loc_7C01F:
		mov	al, byte_6E4B5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C034
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C034
		jmp	loc_7BB46
; ���������������������������������������������������������������������������

loc_7C034:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+FAEj
					; MissionRecord_LoadEntityDatabase_7B035+FBEj ...
		mov	al, byte_6E4B7
		mov	[bp+arg_2], al

loc_7C03A:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+95Aj
					; MissionRecord_LoadEntityDatabase_7B035+963j ...
		cmp	[bp+arg_2], 1
		jbe	short loc_7C043
		jmp	loc_7C38A
; ���������������������������������������������������������������������������

loc_7C043:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1009j
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7C04F
		jmp	loc_7C38A
; ���������������������������������������������������������������������������

loc_7C04F:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1015j
		cmp	byte_706AF, 0
		jz	short loc_7C059
		jmp	loc_7C38A
; ���������������������������������������������������������������������������

loc_7C059:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+101Fj
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADAA
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_180+2]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_29], 1
		mov	[bp+var_2], 0
		jmp	loc_7C17C
; ���������������������������������������������������������������������������

loc_7C080:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+114Dj
		mov	ax, [bp+var_2]
		add	ax, 5
		push	ax
		push	[bp+var_1A]
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+var_1A]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7C0A6
		mov	eax, [bx+61h]
		jmp	short loc_7C0AD
; ���������������������������������������������������������������������������

loc_7C0A6:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1069j
		mov	bx, [bp+var_1A]
		mov	eax, [bx+71h]

loc_7C0AD:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+106Fj
		mov	[bp+var_2E], eax
		push	0
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_32+2],	dx
		mov	word ptr [bp+var_32], ax
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_180+2]
		add	bx, ax
		mov	ax, word ptr [bp+var_32+2]
		mov	dx, word ptr [bp+var_32]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_17C+2]
		add	bx, ax
		mov	byte ptr [bx], 3
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_17C+3]
		add	bx, ax
		mov	byte ptr [bx], 1
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_178]
		add	bx, ax
		mov	dword ptr [bx],	0

loc_7C112:
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		add	bx, ax

loc_7C11A:
		mov	eax, [bp+var_2E]
		mov	[bx], eax
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_180+2]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jnz	short loc_7C13A
		mov	[bp+var_29], 0
		jmp	short loc_7C185
; ���������������������������������������������������������������������������

loc_7C13A:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+10FDj
		push	0
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_17C+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, [bp+var_2]
		imul	bx, 0Ah
		lea	ax, [bp+var_180+2]
		add	bx, ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 5
		push	ax
		push	[bp+var_1A]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		inc	[bp+var_2]

loc_7C17C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1048j
		cmp	[bp+var_2], 3
		jge	short loc_7C185
		jmp	loc_7C080
; ���������������������������������������������������������������������������

loc_7C185:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1103j
					; MissionRecord_LoadEntityDatabase_7B035+114Bj
		mov	word ptr [bp+var_36+2],	0
		mov	[bp+var_3A+2], 10h
		mov	eax, [bp+var_3A+2]
		mov	[bp+var_8], eax
		mov	dword ptr [bp-3Ch], 0
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_40+2],	ax
		mov	bx, word ptr [bp+var_40+2]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		cmp	[bp+var_29], 0
		jnz	short loc_7C1CD
		jmp	loc_7C36F
; ���������������������������������������������������������������������������

loc_7C1CD:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1193j
		jmp	loc_7C363
; ���������������������������������������������������������������������������

loc_7C1D0:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1337j
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_40], ax
		mov	bx, word ptr [bp+var_40]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		cmp	word ptr [bp+var_36+2],	6
		jl	short loc_7C24E
		push	0C7h ; '�'
		push	word_70E60
		call	TextFormat_ReleaseAttribute_5E5AC

loc_7C21A:
		add	sp, 4
		cmp	word ptr [bp+var_36+2],	7
		jge	short loc_7C27A
		push	large 0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0

loc_7C23E:
		push	word_70E60

loc_7C242:
		call	Render_MeasureOrDrawTextString_61F52

loc_7C247:
		add	sp, 0Ch
		jmp	short loc_7C27A
; ���������������������������������������������������������������������������
		jmp	short loc_7C27A
; ���������������������������������������������������������������������������

loc_7C24E:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+11D7j
		call	Frame_UpdateTimingAndNotifyTrackedObjects_500F6

loc_7C253:
		push	large 0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_7C27A:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+11ECj
					; MissionRecord_LoadEntityDatabase_7B035+1215j ...
		push	large 0
		mov	bx, word ptr [bp+var_36+2]
		imul	bx, 0Ah
		lea	ax, [bp+var_17C+2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, word ptr [bp+var_36+2]
		imul	bx, 0Ah
		lea	ax, [bp+var_180+2]
		add	bx, ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		cmp	word ptr [bp+var_36+2],	2
		jnz	short loc_7C30C
		mov	[bp+var_44], 40h ; '@'
		mov	eax, [bp+var_44]
		add	[bp-3Ch], eax
		mov	[bp+var_48], 100h
		mov	eax, [bp-3Ch]
		cmp	eax, [bp+var_48]
		jle	short loc_7C2ED
		mov	ax, 1
		jmp	short loc_7C2EF
; ���������������������������������������������������������������������������

loc_7C2ED:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+12B1j
		xor	ax, ax

loc_7C2EF:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+12B6j
		or	al, al
		jnz	short loc_7C36F
		push	3Fh ; '?'
		push	3Fh ; '?'
		push	3Fh ; '?'
		lea	ax, [bp-3Ch]
		push	ax
		push	541Ah
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		jmp	short loc_7C339
; ���������������������������������������������������������������������������
		jmp	short loc_7C339
; ���������������������������������������������������������������������������

loc_7C30C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+128Fj
		mov	eax, dword_70458
		sub	[bp+var_8], eax

loc_7C314:
		cmp	[bp+var_8], 0

loc_7C319:
		jg	short loc_7C320
		mov	ax, 1
		jmp	short loc_7C322
; ���������������������������������������������������������������������������

loc_7C320:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7C319j
		xor	ax, ax

loc_7C322:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+12E9j
		or	al, al
		jz	short loc_7C339

loc_7C326:
		inc	word ptr [bp+var_36+2]
		mov	[bp+var_4C], 10h
		mov	eax, [bp+var_4C]
		mov	[bp+var_8], eax

loc_7C339:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+12D3j
					; MissionRecord_LoadEntityDatabase_7B035+12D5j ...
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1

loc_7C341:
		jnz	short loc_7C349
		mov	[bp+var_A], 1
		jmp	short loc_7C36F
; ���������������������������������������������������������������������������

loc_7C349:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7C341j
		cmp	byte_6E345, 0
		jz	short loc_7C356
		mov	[bp+var_A], 1
		jmp	short loc_7C36F
; ���������������������������������������������������������������������������

loc_7C356:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1319j
		cmp	byte_706AF, 0
		jz	short loc_7C363
		mov	[bp+var_A], 1
		jmp	short loc_7C36F
; ���������������������������������������������������������������������������

loc_7C363:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7C1CDj
					; MissionRecord_LoadEntityDatabase_7B035+1326j
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jz	short loc_7C36F
		jmp	loc_7C1D0
; ���������������������������������������������������������������������������

loc_7C36F:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1195j
					; MissionRecord_LoadEntityDatabase_7B035+12BCj ...
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADA5
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_180+2]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch

loc_7C38A:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+100Bj
					; MissionRecord_LoadEntityDatabase_7B035+1017j ...
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7C396
		jmp	loc_7D1BA
; ���������������������������������������������������������������������������

loc_7C396:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+135Cj
		cmp	byte_706AF, 0
		jz	short loc_7C3A0
		jmp	loc_7D1BA
; ���������������������������������������������������������������������������

loc_7C3A0:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1366j
		mov	[bp+var_32+2], 380h
		mov	eax, [di+20h]
		mov	edx, [bp+var_32+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36+2], eax
		mov	eax, [bp+var_36+2]
		mov	[bp+var_2E+2], eax
		shl	eax, 3
		mov	[bp-3Ch], eax
		mov	[bp+var_3A+2], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_40+2],	ax
		mov	bx, word ptr [bp+var_40+2]
		mov	eax, [bx]
		mov	[bp+var_178], eax
		mov	eax, [bx+4]
		mov	[bp+var_174], eax
		mov	eax, [bx+8]
		mov	[bp+var_170], eax
		mov	al, [di+73h]
		and	ax, 1
		mov	byte ptr [bp+var_40+1],	al
		push	0C7h ; '�'
		push	word_70E62
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4

loc_7C40D:
		mov	[bp+var_48], 100h

loc_7C415:
		lea	ax, [bp+var_48]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		cmp	byte ptr [bp+var_40+1],	0
		jnz	short loc_7C42D
		jmp	loc_7C69C
; ���������������������������������������������������������������������������

loc_7C42D:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+13F3j
		push	di
		push	ss
		lea	ax, [bp+var_1A8]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_1A8]

loc_7C441:
		mov	[bp+var_184], eax
		mov	eax, [bp+var_1A4]
		mov	[bp+var_180], eax

loc_7C450:
		mov	eax, [bp+var_1A0]
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_184]
		mov	[bp+var_19C], eax
		mov	eax, [bp+var_180]
		mov	[bp+var_198], eax
		mov	eax, [bp+var_17C]
		mov	[bp-194h], eax
		mov	[bp+var_4C], 0A00h
		mov	eax, [bp+var_4C]
		mov	[bp+var_17C], eax
		lea	ax, [bp+var_19C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	[bp+var_50], 299h
		mov	eax, [bp+var_184]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_184], eax
		mov	eax, [bp+var_180]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_180], eax
		mov	eax, [bp+var_17C]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17C], eax
		push	large [bp+var_17C]
		push	large [bp+var_180]
		push	large [bp+var_184]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_54], eax
		mov	[bp+var_5A+2], eax
		mov	dword ptr [bp-5Ch], 0A000h

loc_7C511:
		cmp	eax, [bp-5Ch]
		jge	short loc_7C51C
		mov	ax, 1
		jmp	short loc_7C51E
; ���������������������������������������������������������������������������

loc_7C51C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+14E0j
		xor	ax, ax

loc_7C51E:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+14E5j
		or	al, al
		jz	short loc_7C53B
		mov	[bp+var_60], 0A000h
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_184]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4

loc_7C53B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+14EBj
		mov	eax, [bp+var_180]
		neg	eax

loc_7C543:
		mov	[bp+var_64], eax

loc_7C547:
		mov	[bp+var_68], eax

loc_7C54B:
		mov	[bp+var_19C], eax

loc_7C550:
		mov	eax, [bp+var_184]
		mov	[bp+var_198], eax
		mov	[bp+var_6E+2], 0
		mov	eax, [bp+var_6E+2]
		mov	[bp-194h], eax
		lea	ax, [bp+var_19C]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_6E], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	word ptr [bp+var_72+2],	ax
		mov	bx, word ptr [bp+var_72+2]
		mov	eax, [bx]
		mov	edx, [bp+var_3A+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-74h], eax
		mov	eax, [bp-74h]
		mov	[bp+var_78], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_3A+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_3A+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_1B4], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_1B0], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_1AC], eax
		mov	bx, word ptr [bp+var_6E]
		mov	eax, [bx]
		sub	eax, [bp+var_1B4]
		mov	[bp+var_1C0], eax
		mov	eax, [bx+4]

loc_7C60F:
		sub	eax, [bp+var_1B0]
		mov	[bp+var_1BC], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_1AC]

loc_7C622:
		mov	[bp+var_1B8], eax
		mov	eax, [bp+var_1C0]
		mov	[bp+var_1CC], eax
		mov	eax, [bp+var_1BC]
		mov	[bp+var_1C8], eax
		mov	eax, [bp+var_1B8]
		mov	[bp+var_1C4], eax
		mov	eax, [bp+var_1CC]
		mov	[si+14h], eax
		mov	eax, [bp+var_1C8]
		mov	[si+18h], eax
		mov	eax, [bp+var_1C4]
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_8C+2],	ax
		mov	bx, word ptr [bp+var_8C+2]
		mov	eax, [bx]
		mov	[bp-190h], eax
		mov	eax, [bx+4]
		mov	[bp+var_18C], eax
		mov	eax, [bx+8]
		mov	[bp+var_188], eax
		mov	[bp+var_90+2], 400h
		mov	eax, [bp+var_90+2]
		mov	[bp+var_44], eax
		jmp	loc_7C9B2
; ���������������������������������������������������������������������������

loc_7C69C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+13F5j
		cmp	word_722EC, 0
		jnz	short loc_7C6A6
		jmp	loc_7C829
; ���������������������������������������������������������������������������

loc_7C6A6:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+166Cj
		mov	ax, word_722EC
		add	ax, 12h
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_106+2], ax
		mov	bx, [bp+var_102]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_106+2]
		sub	eax, [bx]
		mov	[bp+var_22C], eax
		mov	bx, [bp+var_102]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_106+2]
		sub	eax, [bx+4]
		mov	[bp+var_228], eax
		mov	bx, [bp+var_102]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_106+2]
		sub	eax, [bx+8]
		mov	[bp+var_224], eax
		mov	eax, [bp+var_22C]
		mov	[bp+var_220], eax
		mov	eax, [bp+var_228]
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_224]

loc_7C70F:
		mov	[bp+var_218], eax
		lea	ax, [bp+var_220]

loc_7C718:
		push	ax
		mov	ax, si

loc_7C71B:
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	word ptr [bp+var_106], ax
		mov	bx, word ptr [bp+var_106]
		mov	eax, [bx]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_10E], eax

loc_7C752:
		mov	eax, [bx+4]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_112], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_116], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_238], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_234], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_230], eax
		mov	eax, [bp+var_178]
		sub	eax, [bp+var_238]
		mov	[bp+var_244], eax
		mov	eax, [bp+var_174]
		sub	eax, [bp+var_234]
		mov	[bp+var_240], eax
		mov	eax, [bp+var_170]
		sub	eax, [bp+var_230]
		mov	[bp+var_23C], eax
		mov	eax, [bp+var_244]
		mov	[bp+var_250], eax
		mov	eax, [bp+var_240]
		mov	[bp+var_24C], eax
		mov	eax, [bp+var_23C]
		mov	[bp+var_248], eax
		mov	eax, [bp+var_250]
		mov	[si+14h], eax
		mov	eax, [bp+var_24C]
		mov	[si+18h], eax
		mov	eax, [bp+var_248]
		mov	[si+1Ch], eax
		mov	[bp+var_122], 300h
		mov	eax, [bp+var_122]
		mov	[bp+var_44], eax
		jmp	loc_7C9B2
; ���������������������������������������������������������������������������

loc_7C829:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+166Ej
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_90], ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_94+2],	ax
		mov	bx, word ptr [bp+var_94+2]

loc_7C844:
		mov	eax, [bx]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98+2], eax
		mov	eax, [bp+var_98+2]
		mov	[bp+var_9C+2], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0+2], eax
		mov	eax, [bp+var_A0+2]
		mov	[bp+var_A4+2], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A8+2], eax
		mov	eax, [bp+var_A8+2]
		mov	[bp+var_AC+2], eax
		mov	eax, [bp+var_9C+2]
		mov	[bp+var_1D8], eax
		mov	eax, [bp+var_A4+2]
		mov	[bp+var_1D4], eax
		mov	eax, [bp+var_AC+2]
		mov	[bp+var_1D0], eax
		mov	bx, word ptr [bp+var_90]
		mov	eax, [bx]
		sub	eax, [bp+var_1D8]
		mov	[bp+var_1E4], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_1D4]
		mov	[bp+var_1E0], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_1D0]
		mov	[bp+var_1DC], eax
		mov	eax, [bp+var_1E4]
		mov	[bp+var_1F0], eax
		mov	eax, [bp+var_1E0]
		mov	[bp+var_1EC], eax
		mov	eax, [bp+var_1DC]
		mov	[bp+var_1E8], eax
		mov	eax, [bp+var_1F0]
		mov	[si+14h], eax
		mov	eax, [bp+var_1EC]
		mov	[si+18h], eax
		mov	eax, [bp+var_1E8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_2E+2]
		shl	eax, 1
		mov	[bp+var_B0+2], eax
		mov	[bp+var_B4+2], eax
		add	[si+1Ch], eax
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_102], ax

loc_7C942:
		mov	bx, [bp+var_102]
		mov	eax, [bp+var_178]
		sub	eax, [bx]
		mov	[bp+var_22C], eax
		mov	eax, [bp+var_174]
		sub	eax, [bx+4]
		mov	[bp+var_228], eax
		mov	eax, [bp+var_170]
		sub	eax, [bx+8]
		mov	[bp+var_224], eax
		mov	eax, [bp+var_22C]
		mov	[bp+var_220], eax
		mov	eax, [bp+var_228]
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_224]
		mov	[bp+var_218], eax
		lea	ax, [bp+var_220]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	[bp+var_106], 280h
		mov	eax, [bp+var_106]
		mov	[bp+var_44], eax

loc_7C9B2:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1664j
					; MissionRecord_LoadEntityDatabase_7B035+17F1j
		mov	byte_6E4B6, 1
		push	0
		push	di
		call	VROOMM_StubThunk_6BFBF
		add	sp, 4
		mov	byte ptr [bp+var_B4+1],	1
		jmp	loc_7D19C
; ���������������������������������������������������������������������������

loc_7C9CA:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2182j
		cmp	byte ptr [bp+var_40+1],	0
		jnz	short loc_7C9D3
		jmp	loc_7CE41
; ���������������������������������������������������������������������������

loc_7C9D3:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1999j
		mov	[bp+var_B8], 80h ; '�'
		mov	eax, [bp+var_184]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_180]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8

loc_7CA0F:
		mov	[bp+var_C4], eax

loc_7CA14:
		mov	eax, [bp+var_C4]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_17C]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_1FC], eax
		mov	eax, [bp+var_C8]
		mov	[bp+var_1F8], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_1F4], eax
		mov	eax, [bp+var_1FC]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_1F8]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_1F4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_208], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_204], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_200], eax
		mov	eax, [bp+var_208]
		sub	[bp+var_184], eax
		mov	eax, [bp+var_204]
		sub	[bp+var_180], eax
		mov	eax, [bp+var_200]
		sub	[bp+var_17C], eax
		mov	eax, [bp+var_184]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_F0], eax

loc_7CB1D:
		mov	eax, [bp+var_180]

loc_7CB22:
		mov	edx, dword_7045E

loc_7CB27:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_F4]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_17C]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_F0]
		mov	[bp+var_214], eax
		mov	eax, [bp+var_F8]
		mov	[bp+var_210], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_20C], eax
		mov	eax, [bp+var_214]
		add	[bp-190h], eax
		mov	eax, [bp+var_210]
		add	[bp+var_18C], eax
		mov	eax, [bp+var_20C]
		add	[bp+var_188], eax
		mov	eax, [bp-190h]
		sub	eax, [bp+var_178]
		mov	[bp+var_220], eax
		mov	eax, [bp+var_18C]
		sub	eax, [bp+var_174]
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_188]
		sub	eax, [bp+var_170]
		mov	[bp+var_218], eax
		mov	eax, [bp+var_220]
		mov	[bp+var_22C], eax
		mov	eax, [bp+var_21C]
		mov	[bp+var_228], eax
		mov	eax, [bp+var_218]
		mov	[bp+var_224], eax
		mov	eax, [bp+var_22C]
		mov	[bp+var_10A+2],	eax
		mov	eax, [bp+var_228]
		mov	[bp+var_106+2],	eax
		push	large 0
		push	eax
		push	large [bp+var_10A+2]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_112+2],	eax

loc_7CC15:
		mov	[bp+var_10E+2],	eax

loc_7CC1A:
		cmp	eax, [bp+var_2E+2]
		jge	short loc_7CC25

loc_7CC20:
		mov	ax, 1
		jmp	short loc_7CC27
; ���������������������������������������������������������������������������

loc_7CC25:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1BE9j
		xor	ax, ax

loc_7CC27:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1BEEj
		or	al, al
		jnz	short loc_7CC2E
		jmp	loc_7CDBC
; ���������������������������������������������������������������������������

loc_7CC2E:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1BF4j
		mov	eax, [bp+var_19C]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_116], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_198]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_122], eax
		mov	eax, [bp-194h]
		mov	edx, [bp+var_2E+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_126], eax
		mov	eax, [bp+var_126]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_250], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_24C], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_248], eax
		mov	[bp+var_12E], 5A00h
		mov	eax, [bp+var_10E+2]
		mov	edx, [bp+var_12E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_132], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_136], eax
		mov	eax, [bp+var_136]
		mov	edx, eax
		mov	ecx, [bp+var_2E+2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_13A]
		mov	[bp+var_13E], eax
		lea	ax, [bp+var_13E]
		push	ax
		push	ss
		lea	ax, [bp+var_142]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6

loc_7CD0F:
		mov	eax, [bp+var_250]
		mov	edx, [bp+var_142]
		imul	edx

loc_7CD1C:
		shrd	eax, edx, 8

loc_7CD21:
		mov	[bp+var_250], eax
		mov	eax, [bp+var_24C]
		mov	edx, [bp+var_142]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24C], eax
		mov	eax, [bp+var_248]
		mov	edx, [bp+var_142]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_248], eax
		mov	eax, [bp-190h]
		add	eax, [bp+var_250]
		mov	[bp+var_25C], eax
		mov	eax, [bp+var_18C]
		add	eax, [bp+var_24C]
		mov	[bp+var_258], eax
		mov	eax, [bp+var_188]
		add	eax, [bp+var_248]
		mov	[bp+var_254], eax
		mov	eax, [bp+var_25C]
		mov	[bp+var_268], eax
		mov	eax, [bp+var_258]
		mov	[bp+var_264], eax
		mov	eax, [bp+var_254]
		mov	[bp+var_260], eax
		mov	eax, [bp+var_268]
		mov	[si+14h], eax
		mov	eax, [bp+var_264]
		mov	[si+18h], eax
		mov	eax, [bp+var_260]
		mov	[si+1Ch], eax
		jmp	short loc_7CDD7
; ���������������������������������������������������������������������������

loc_7CDBC:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1BF6j
		mov	eax, [bp-190h]
		mov	[si+14h], eax
		mov	eax, [bp+var_18C]
		mov	[si+18h], eax
		mov	eax, [bp+var_188]
		mov	[si+1Ch], eax

loc_7CDD7:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1D85j
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_112], ax
		mov	bx, word ptr [bp+var_112]
		mov	eax, [bp+var_178]
		sub	eax, [bx]
		mov	[bp+var_244], eax
		mov	eax, [bp+var_174]
		sub	eax, [bx+4]
		mov	[bp+var_240], eax
		mov	eax, [bp+var_170]
		sub	eax, [bx+8]
		mov	[bp+var_23C], eax
		mov	eax, [bp+var_244]
		mov	[bp+var_238], eax
		mov	eax, [bp+var_240]
		mov	[bp+var_234], eax

loc_7CE21:
		mov	eax, [bp+var_23C]
		mov	[bp+var_230], eax
		lea	ax, [bp+var_238]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		jmp	loc_7D142
; ���������������������������������������������������������������������������

loc_7CE41:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+199Bj
		cmp	word_722EC, 0
		jnz	short loc_7CE4B
		jmp	loc_7D142
; ���������������������������������������������������������������������������

loc_7CE4B:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1E11j
		mov	ax, word_722EC
		add	ax, 12h
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_106+2], ax
		mov	bx, [bp+var_102]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_106+2]
		sub	eax, [bx]
		mov	[bp+var_22C], eax
		mov	bx, [bp+var_102]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_106+2]
		sub	eax, [bx+4]
		mov	[bp+var_228], eax
		mov	bx, [bp+var_102]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_106+2]
		sub	eax, [bx+8]
		mov	[bp+var_224], eax
		mov	eax, [bp+var_22C]
		mov	[bp+var_220], eax
		mov	eax, [bp+var_228]
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_224]
		mov	[bp+var_218], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	word ptr [bp+var_106], ax
		push	large [bp+var_218]
		push	large [bp+var_21C]
		push	large [bp+var_220]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10A], eax
		mov	[bp+var_10E], eax
		mov	bx, word ptr [bp+var_106]
		mov	eax, [bx]
		mov	edx, [bp+var_10E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_112], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_116], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_10E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_11E], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_10E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_122], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_244], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_240], eax
		mov	eax, [bp+var_126]
		mov	[bp+var_23C], eax
		mov	eax, [bp+var_220]
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_12A], eax
		mov	[bp+var_12E], eax
		mov	eax, [bp+var_21C]
		cdq
		idiv	ebx
		mov	[bp+var_132], eax
		mov	[bp+var_136], eax
		mov	eax, [bp+var_218]
		cdq
		idiv	ebx
		mov	[bp+var_13A], eax
		mov	[bp+var_13E], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_250], eax
		mov	eax, [bp+var_136]
		mov	[bp+var_24C], eax
		mov	eax, [bp+var_13E]
		mov	[bp+var_248], eax
		mov	eax, [bp+var_244]
		add	eax, [bp+var_250]
		mov	[bp+var_25C], eax
		mov	eax, [bp+var_240]
		add	eax, [bp+var_24C]
		mov	[bp+var_258], eax
		mov	eax, [bp+var_23C]
		add	eax, [bp+var_248]
		mov	[bp+var_254], eax
		mov	eax, [bp+var_25C]
		mov	[bp+var_238], eax
		mov	eax, [bp+var_258]
		mov	[bp+var_234], eax
		mov	eax, [bp+var_254]

loc_7D00E:
		mov	[bp+var_230], eax

loc_7D013:
		lea	ax, [bp+var_238]

loc_7D017:
		push	ax

loc_7D018:
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax

loc_7D01E:
		call	UI_ApplyLineOfSightAndTransform_57DAE

loc_7D023:
		add	sp, 4
		mov	eax, [bp+var_2E+2]
		neg	eax
		mov	[bp+var_142], eax
		mov	[bp+var_146], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	[bp+var_148], ax
		mov	bx, [bp+var_148]
		mov	eax, [bx]
		mov	edx, [bp+var_146]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_14C]
		mov	[bp+var_150], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_146]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_154], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_146]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_268], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_264], eax
		mov	eax, [bp+var_160]
		mov	[bp+var_260], eax
		lea	ax, [bp+var_268]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_170]
		mov	[bp+var_28A], eax
		push	si
		call	Camera_FrustumClipTest
		add	sp, 8
		mov	eax, [bp+var_178]
		add	eax, [bp+var_268]
		mov	[bp+var_274], eax
		mov	eax, [bp+var_174]
		add	eax, [bp+var_264]
		mov	[bp+var_270], eax
		mov	eax, [bp+var_170]
		add	eax, [bp+var_260]
		mov	[bp+var_26C], eax
		mov	eax, [bp+var_274]

loc_7D10E:
		mov	[bp+var_280], eax
		mov	eax, [bp+var_270]
		mov	[bp+var_27C], eax
		mov	eax, [bp+var_26C]
		mov	[bp+var_278], eax
		mov	eax, [bp+var_280]
		mov	[si+14h], eax
		mov	eax, [bp+var_27C]
		mov	[si+18h], eax
		mov	eax, [bp+var_278]
		mov	[si+1Ch], eax

loc_7D142:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1E09j
					; MissionRecord_LoadEntityDatabase_7B035+1E13j
		call	Frame_UpdateTimingAndNotifyTrackedObjects_500F6
		cmp	byte ptr [bp+var_B4+1],	0
		jz	short loc_7D161
		push	0
		push	word_70E62
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		mov	byte ptr [bp+var_B4+1],	0

loc_7D161:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2117j
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	eax, dword_70458
		sub	[bp+var_44], eax
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_7D182
		mov	[bp+var_A], 1
		jmp	short loc_7D1BA
; ���������������������������������������������������������������������������

loc_7D182:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2145j
		cmp	byte_6E345, 0
		jz	short loc_7D18F
		mov	[bp+var_A], 1
		jmp	short loc_7D1BA
; ���������������������������������������������������������������������������

loc_7D18F:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2152j
		cmp	byte_706AF, 0
		jz	short loc_7D19C
		mov	[bp+var_A], 1
		jmp	short loc_7D1BA
; ���������������������������������������������������������������������������

loc_7D19C:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+1992j
					; MissionRecord_LoadEntityDatabase_7B035+215Fj
		cmp	[bp+var_44], 0
		jl	short loc_7D1A8
		mov	ax, 1
		jmp	short loc_7D1AA
; ���������������������������������������������������������������������������

loc_7D1A8:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+216Cj
		xor	ax, ax

loc_7D1AA:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2171j
		or	al, al
		jz	short loc_7D1BA
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jz	short loc_7D1BA
		jmp	loc_7C9CA
; ���������������������������������������������������������������������������

loc_7D1BA:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+135Ej
					; MissionRecord_LoadEntityDatabase_7B035+1368j ...
		push	si
		push	59CDh
		call	EntityTracker_RemoveByTarget
		add	sp, 4
		cmp	[bp+var_18], 0
		jz	short loc_7D1DE
		push	3
		push	[bp+var_18]
		mov	bx, [bp+var_18]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_7D1DE:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2195j
		cmp	[bp+var_1A], 0
		jz	short loc_7D1F6
		push	3
		push	[bp+var_1A]
		mov	bx, [bp+var_1A]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_7D1F6:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+21ADj
		mov	al, [bp+var_9]
		mov	[bp+var_28], al
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4
		cmp	[bp+var_F], 0
		jz	short loc_7D22E

loc_7D210:
		cmp	[bp+var_14], 0
		jz	short loc_7D22E
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_14]
		push	ax

loc_7D221:
		push	5C44h

loc_7D224:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7D22E:				; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+21D9j
					; MissionRecord_LoadEntityDatabase_7B035+21E0j
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		mov	al, [bp+var_28]
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadEntityDatabase_7B035	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 29 lignes).
; ==============================================================================================
MissionRecord_Helper_7D249	proc far		; CODE XREF: VROOMM_StubThunk_6ADAAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_7D262
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7D279

loc_7D262:				; CODE XREF: MissionRecord_Helper_7D249+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_7D279:				; CODE XREF: MissionRecord_Helper_7D249+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
MissionRecord_Helper_7D249	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère (Memory_TypedFree_5C7B6, CRT_FreeNear_Wrap).
; ==============================================================================================
MissionRecord_ReleaseEntry_7D27E	proc far		; CODE XREF: VROOMM_StubThunk_6ADA5J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7D2CD
		cmp	byte ptr [si+5], 0
		jz	short loc_7D2AD
		cmp	dword ptr [si],	0
		jz	short loc_7D2AD
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7D2AD:				; CODE XREF: MissionRecord_ReleaseEntry_7D27E+13j
					; MissionRecord_ReleaseEntry_7D27E+19j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_7D2CD
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_7D2CD:				; CODE XREF: MissionRecord_ReleaseEntry_7D27E+Dj
					; MissionRecord_ReleaseEntry_7D27E+46j
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_ReleaseEntry_7D27E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère (thunk voisin, CRT_FreeNear_Wrap).
; ==============================================================================================
MissionRecord_ReleaseEntryB_7D2D1	proc far		; CODE XREF: VROOMM_StubThunk_6ADA0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7D2FE
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_7D2FA
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_7D2FE
; ���������������������������������������������������������������������������

loc_7D2FA:				; CODE XREF: MissionRecord_ReleaseEntryB_7D2D1+1Ej
		jmp	short loc_7D2FE
; ���������������������������������������������������������������������������
		jmp	short $+2

loc_7D2FE:				; CODE XREF: MissionRecord_ReleaseEntryB_7D2D1+Dj
					; MissionRecord_ReleaseEntryB_7D2D1+27j ...
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_ReleaseEntryB_7D2D1	endp

ovr239		ends
