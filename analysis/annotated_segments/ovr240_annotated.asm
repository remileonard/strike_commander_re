ovr240		segment	para public 'OVERLAY' use16
		assume cs:ovr240
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (17 lignes).
; ==============================================================================================
MissionRecord_Helper2_7D310	proc far		; CODE XREF: VROOMM_StubThunk_6ADF5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_7D313:
		mov	ax, [bp+arg_0]

loc_7D316:
		mov	al, 11h

loc_7D318:
		pop	bp
		retf
MissionRecord_Helper2_7D310	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 1081 lignes, NON DÉTAILLÉE — même motif que MissionRecord_LoadEntityDatabase_7B035,
; mais combine aussi UIScreen_BuildWidgetTree_53A94 (seg114) — lie le chargement de base de
; données d'entités à la construction d'arborescence de widgets. Candidat prioritaire pour
; session dédiée.
; ==============================================================================================
MissionRecord_LoadAndBuildWidgetTree_7D31A	proc far		; CODE XREF: VROOMM_StubThunk_6ADFAJ

var_D0		= dword	ptr -0D0h
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_49		= byte ptr -49h
var_48		= word ptr -48h
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_7D31D:
		sub	sp, 0C6h
		push	si
		push	di

loc_7D323:
		mov	[bp+var_5], 0
		mov	[bp+var_6], 1
		mov	[bp+var_7], 0
		mov	byte_70471, 1
		mov	ax, [bp+arg_0]
		mov	[bp+var_A], ax
		mov	si, word_6E4B2
		add	si, 220h
		push	0
		push	large 43454A45h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_7D360
		push	7006h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_7D360:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3Bj
		push	0
		push	[bp+arg_0]
		call	Combat_TeamOpposedCheckAndDispatch_53A94
		add	sp, 4
		push	large dword ptr	[si+76h]
		push	large dword ptr	[si+65h]
		mov	ax, word_6E4B2
		add	ax, 220h
		push	ax
		push	0
		call	IndexedRecordReader_ConstructVariantC_65A8A
		add	sp, 0Ch
		mov	[bp+var_C], ax
		push	0
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		mov	di, ax
		push	50h ; 'P'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	bx, ax
		or	ax, ax
		jz	short loc_7D3A3
		jmp	short loc_7D3A5
; ���������������������������������������������������������������������������

loc_7D3A3:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+85j
		mov	ax, bx

loc_7D3A5:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+87j
		mov	si, ax
		push	ds
		push	offset a_pak_3	; ".PAK"
		push	ds
		push	offset aEject	; "EJECT"
		push	ds
		push	offset aObjects	; "OBJECTS"
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		push	si
		push	di
		mov	bx, [di]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	si, si
		jz	short loc_7D3D5
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_7D3D5:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+B0j
		push	80h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7D3F4
		push	ax
		call	VROOMM_StubThunk_6ADAF
		pop	cx
		mov	word ptr [si+50h], 509h
		mov	ax, si
		jmp	short loc_7D3F6
; ���������������������������������������������������������������������������

loc_7D3F4:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+C8j
		mov	ax, si

loc_7D3F6:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+D8j
		mov	si, ax
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		mov	ax, [bp+arg_0]
		add	ax, 12h
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	si
		call	VROOMM_StubThunk_6ADBE
		pop	cx
		mov	byte_70447, 0
		mov	[bp+var_28], 0
		mov	byte ptr [bp+var_24], 2
		mov	byte ptr [bp+var_24+1],	0
		mov	[bp+var_24+2], 0
		mov	[bp+var_32], 0
		mov	byte ptr [bp+var_2E], 2
		mov	byte ptr [bp+var_2E+1],	0
		mov	[bp+var_2E+2], 0
		push	8
		push	di
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7D486
		mov	eax, [di+61h]
		jmp	short loc_7D48A
; ���������������������������������������������������������������������������

loc_7D486:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+164j
		mov	eax, [di+71h]

loc_7D48A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+16Aj
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
		jz	short loc_7D4F0
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		push	large [bp+var_32]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	8
		push	di
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_7D4F0:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+1B2j
		push	3
		push	[bp+var_C]
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [bp+var_C]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_7D511
		mov	eax, [bx+61h]
		jmp	short loc_7D518
; ���������������������������������������������������������������������������

loc_7D511:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+1EFj
		mov	bx, [bp+var_C]
		mov	eax, [bx+71h]

loc_7D518:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+1F5j
		mov	[bp+var_3E], eax
		push	0
		push	0
		push	3

loc_7D522:
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_42+2],	dx
		mov	word ptr [bp+var_42], ax
		mov	eax, [bp+var_42]
		mov	[bp+var_28], eax
		mov	byte ptr [bp+var_24], 3
		mov	byte ptr [bp+var_24+1],	1
		mov	[bp+var_24+2], 0
		mov	eax, [bp+var_3E]
		mov	[bp+var_24+2], eax
		cmp	[bp+var_28], 0
		jz	short loc_7D580
		push	0
		mov	al, byte ptr [bp+var_24]
		push	ax
		push	large [bp+var_28]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	3
		push	[bp+var_C]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_7D580:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+240j
		cmp	[bp+var_C], 0
		jz	short loc_7D598
		push	3
		push	[bp+var_C]
		mov	bx, [bp+var_C]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_7D598:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+26Aj
		or	di, di
		jz	short loc_7D5A9
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_7D5A9:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+280j
		mov	[bp+var_46], 19h
		mov	eax, [bp+var_46]
		mov	[bp+var_4], eax
		push	0Ah
		call	TextObject_AllocateVariantA_5A984
		pop	cx
		mov	[bp+var_48], 0
		mov	[bp+var_49], 1
		cmp	[bp+var_32], 0
		jnz	short loc_7D5D4
		jmp	loc_7D72E
; ���������������������������������������������������������������������������

loc_7D5D4:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+2B5j
		cmp	[bp+var_28], 0
		jnz	short loc_7D5DE
		jmp	loc_7D72E
; ���������������������������������������������������������������������������

loc_7D5DE:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+2BFj
		jmp	loc_7D725
; ���������������������������������������������������������������������������

loc_7D5E1:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+411j
		call	CombatTarget_WeaponActionSubsystem
		mov	[bp+var_49], al
		mov	di, [bp+arg_0]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si

loc_7D615:
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	[bp+var_4E], 0
		lea	ax, [bp+var_4E]
		push	ax
		mov	[bp+var_52], 0
		lea	ax, [bp+var_52]
		push	ax
		mov	[bp+var_56], 0FFFFEC00h
		lea	ax, [bp+var_56]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFullOrientation_575B2
		add	sp, 8
		call	UIScreen_ApplyFormFields_500F6
		push	large 0
		mov	al, byte ptr [bp+var_24]
		push	ax
		push	large [bp+var_28]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	[bp+var_48]
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
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	bx, [bp+var_A]
		mov	al, [bx+73h]
		and	ax, 1
		or	al, al
		jz	short loc_7D6C6
		mov	[bp+var_7], 1
		mov	[bp+var_49], 0

loc_7D6C6:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3A2j
		mov	eax, dword_70458
		sub	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jg	short loc_7D6DA
		mov	ax, 1
		jmp	short loc_7D6DC
; ���������������������������������������������������������������������������

loc_7D6DA:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3B9j
		xor	ax, ax

loc_7D6DC:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3BEj
		or	al, al
		jz	short loc_7D6FB
		inc	[bp+var_48]
		mov	ax, [bp+var_48]
		cmp	ax, 0Dh
		jge	short loc_7D72E
		mov	[bp+var_5A], 19h
		mov	eax, [bp+var_5A]
		mov	[bp+var_4], eax

loc_7D6FB:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3C4j
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_7D70B
		mov	[bp+var_5], 1
		jmp	short loc_7D72E
; ���������������������������������������������������������������������������

loc_7D70B:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3E9j
		cmp	byte_6E345, 0
		jz	short loc_7D718

loc_7D712:
		mov	[bp+var_5], 1
		jmp	short loc_7D72E
; ���������������������������������������������������������������������������

loc_7D718:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+3F6j
		cmp	byte_706AF, 0
		jz	short loc_7D725
		mov	[bp+var_5], 1
		jmp	short loc_7D72E
; ���������������������������������������������������������������������������

loc_7D725:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A:loc_7D5DEj
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+403j
		cmp	[bp+var_49], 0
		jz	short loc_7D72E
		jmp	loc_7D5E1
; ���������������������������������������������������������������������������

loc_7D72E:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+2B7j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+2C1j ...
		cmp	byte ptr [bp+var_2E+1],	0
		jz	short loc_7D752
		cmp	[bp+var_32], 0
		jz	short loc_7D752
		push	0
		mov	al, byte ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7D752:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+418j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+41Fj
		mov	[bp+var_32], 0
		mov	byte ptr [bp+var_2E+1],	0
		mov	[bp+var_2E+2], 0
		cmp	byte ptr [bp+var_24+1],	0
		jz	short loc_7D78A
		cmp	[bp+var_28], 0
		jz	short loc_7D78A
		push	0
		mov	al, byte ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7D78A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+450j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+457j
		mov	[bp+var_28], 0
		mov	byte ptr [bp+var_24+1],	0
		mov	[bp+var_24+2], 0
		mov	[bp+var_14], 0
		mov	[bp+var_16], 0
		mov	bx, [bp+arg_0]
		mov	eax, [bx+0Eh]
		mov	[bp+var_1A], eax
		mov	byte_6E4B6, 1
		cmp	[bp+var_7], 0
		jnz	short loc_7D7C1
		jmp	loc_7D964
; ���������������������������������������������������������������������������

loc_7D7C1:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+4A2j
		mov	di, [bp+var_A]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_66], eax
		mov	eax, [di+4]
		mov	[bp+var_62], eax
		mov	eax, [di+8]
		mov	[bp+var_5E], eax
		push	[bp+var_A]
		mov	bx, [bp+var_A]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		mov	[bp+var_6E], eax
		mov	eax, [di+8]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		imul	eax, 2
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6E]
		imul	eax, 2
		mov	[bp+var_6E], eax
		mov	[bp+var_24+2], 0FFFFFE00h
		mov	eax, [bp+var_24+2]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_72]
		imul	eax, 19h
		mov	[bp+var_28+2], eax
		mov	[bp-2Ah], eax
		mov	eax, [bp+var_6E]
		imul	eax, 19h
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	eax, [bp+var_6A]
		imul	eax, 19h
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		mov	eax, [bp-2Ah]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		sub	[bp+var_7E], eax
		mov	eax, [bp+var_86]
		sub	[bp+var_7A], eax
		mov	eax, [bp+var_82]
		sub	[bp+var_76], eax
		mov	eax, [bp+var_7E]
		mov	[si+14h], eax
		mov	eax, [bp+var_7A]
		mov	[si+18h], eax
		mov	eax, [bp+var_76]
		mov	[si+1Ch], eax
		lea	ax, [bp+var_72]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		push	0
		push	[bp+var_A]
		call	VROOMM_StubThunk_6BFBF
		add	sp, 4
		mov	[bp+var_3E], 0
		mov	[bp+var_3E], 500h
		mov	[bp+var_42], 500h
		jmp	short loc_7D93E
; ���������������������������������������������������������������������������

loc_7D8FD:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+640j
		call	UIScreen_ApplyFormFields_500F6
		mov	eax, [bp+var_42]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp-4Ah], eax
		add	[si+1Ch], eax
		add	[bp+var_42], 400h
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_7D95C

loc_7D93E:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+5E1j
		mov	eax, dword_70458
		sub	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_7D95C
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jnz	short loc_7D8FD

loc_7D95C:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+622j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+637j
		mov	[bp+var_5], 1
		mov	[bp+var_6], 0

loc_7D964:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+4A4j
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7D970
		jmp	loc_7DD58
; ���������������������������������������������������������������������������

loc_7D970:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+651j
		cmp	byte_706AF, 0
		jz	short loc_7D97A
		jmp	loc_7DD58
; ���������������������������������������������������������������������������

loc_7D97A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+65Bj
		mov	ax, word ptr [bp+var_1A]
		add	ax, 5Ah	; 'Z'
		push	word ptr [bp+var_1A+2]
		push	ax
		push	[bp+var_A]
		call	VROOMM_StubThunk_6CCFF
		add	sp, 6
		mov	[bp+var_1C], ax
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	[bp+var_16], 0
		jnz	short loc_7D9A8
		jmp	loc_7DD54
; ���������������������������������������������������������������������������

loc_7D9A8:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+689j
		mov	[bp+var_28+2], 499h
		mov	eax, [bp+var_28+2]
		mov	[bp+var_24+2], eax
		mov	di, [bp+var_A]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	dword ptr [bp-2Ah], 0
		mov	[bp+var_2E], 0FFFFEC00h
		mov	[bp+var_32], 2300h
		mov	eax, [bp-2Ah]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_5E], eax
		push	[bp+var_A]
		mov	bx, [bp+var_A]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		mov	eax, [bp+var_66]
		add	[si+14h], eax
		mov	eax, [bp+var_62]
		add	[si+18h], eax
		mov	eax, [bp+var_5E]
		add	[si+1Ch], eax
		mov	bx, [bp+var_16]
		mov	eax, [bx+20h]
		shl	eax, 3
		mov	[bp+var_3A], eax
		mov	[bp+var_36], eax
		mov	[bp+var_3E], 4Ch ; 'L'
		mov	[bp+var_42], 0FFFFFE80h
		mov	[bp+var_46], 100h
		mov	eax, [bp+var_3E]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_66]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_62]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		mov	eax, [bp+var_5E]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5E], eax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		mov	byte ptr [bp+var_48+1],	0
		jmp	loc_7DD34
; ���������������������������������������������������������������������������

loc_7DAE8:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A35j
		mov	di, [bp+var_16]
		cmp	[bp+var_14], 0
		jnz	short loc_7DB25
		cmp	[bp+var_16], 0
		jz	short loc_7DAFD
		cmp	byte ptr [bp+var_48+1],	0
		jz	short loc_7DB08

loc_7DAFD:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+7DBj
		mov	[bp+var_6], 0
		mov	[bp+var_5], 1
		jmp	loc_7DD58
; ���������������������������������������������������������������������������

loc_7DB08:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+7E1j
		cmp	byte ptr [di+5Bh], 0
		jz	short loc_7DB25
		mov	ax, [di+59h]
		mov	[bp-4Ah], ax
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	SetReference16
		add	sp, 4
		mov	byte ptr [bp+var_48+1],	1

loc_7DB25:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+7D5j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+7F2j
		cmp	[bp+var_14], 0
		jz	short loc_7DB4A
		mov	di, [bp+var_14]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_7E], eax
		mov	eax, [di+4]
		mov	[bp+var_7A], eax
		mov	eax, [di+8]
		mov	[bp+var_76], eax
		jmp	short loc_7DB67
; ���������������������������������������������������������������������������

loc_7DB4A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+80Fj
		mov	di, [bp+var_16]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_7E], eax
		mov	eax, [di+4]
		mov	[bp+var_7A], eax
		mov	eax, [di+8]
		mov	[bp+var_76], eax

loc_7DB67:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+82Ej
		mov	eax, [bp+var_66]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_82], eax
		lea	ax, [bp+var_8A]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_76]
		mov	[bp+var_D0], eax
		push	si
		call	Camera_FrustumClipTest
		add	sp, 8
		mov	eax, [bp+var_7E]
		add	[bp+var_8A], eax
		mov	eax, [bp+var_7A]
		add	[bp+var_86], eax
		mov	eax, [bp+var_76]
		add	[bp+var_82], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_8A]
		sub	eax, [di]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_86]
		sub	eax, [di+4]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_82]
		sub	eax, [di+8]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_8E], eax
		mov	[bp+var_4E], 800h
		mov	eax, [bp+var_96]
		mov	edx, eax
		mov	ecx, [bp+var_4E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_96], eax
		mov	eax, [bp+var_92]
		mov	edx, eax
		mov	ecx, [bp+var_4E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_92], eax
		mov	eax, [bp+var_8E]
		mov	edx, eax
		mov	ecx, [bp+var_4E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		add	[si+14h], eax
		mov	eax, [bp+var_92]
		add	[si+18h], eax
		mov	eax, [bp+var_8E]
		add	[si+1Ch], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_7E]
		sub	eax, [di]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_7A]
		sub	eax, [di+4]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_76]
		sub	eax, [di+8]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_C6]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_A6], eax
		lea	ax, [bp+var_AE]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		call	UIScreen_ApplyFormFields_500F6
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	eax, dword_70458
		sub	[bp+var_24+2], eax
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_7DD1A
		mov	[bp+var_5], 1
		jmp	short loc_7DD58
; ���������������������������������������������������������������������������

loc_7DD1A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+9F8j
		cmp	byte_6E345, 0
		jz	short loc_7DD27
		mov	[bp+var_5], 1
		jmp	short loc_7DD58
; ���������������������������������������������������������������������������

loc_7DD27:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A05j
		cmp	byte_706AF, 0
		jz	short loc_7DD34
		mov	[bp+var_5], 1
		jmp	short loc_7DD58
; ���������������������������������������������������������������������������

loc_7DD34:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+7CBj
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+A12j
		cmp	[bp+var_24+2], 0
		jl	short loc_7DD40
		mov	ax, 1
		jmp	short loc_7DD42
; ���������������������������������������������������������������������������

loc_7DD40:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A1Fj
		xor	ax, ax

loc_7DD42:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A24j
		or	al, al
		jz	short loc_7DD58
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jz	short loc_7DD52
		jmp	loc_7DAE8
; ���������������������������������������������������������������������������

loc_7DD52:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A33j
		jmp	short loc_7DD58
; ���������������������������������������������������������������������������

loc_7DD54:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+68Bj
		mov	[bp+var_5], 1

loc_7DD58:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+653j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+65Dj ...
		push	si
		push	59CDh
		call	EntityTracker_RemoveByTarget
		add	sp, 4
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7DD70
		jmp	loc_7DE26
; ���������������������������������������������������������������������������

loc_7DD70:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A51j
		cmp	byte_706AF, 0
		jz	short loc_7DD7A
		jmp	loc_7DE26
; ���������������������������������������������������������������������������

loc_7DD7A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A5Bj
		push	8
		push	59CDh
		call	EntityTracker_RenderByCode
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_7DD90
		jmp	loc_7DE26
; ���������������������������������������������������������������������������

loc_7DD90:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A71j
		cmp	[bp+var_14], 0
		jnz	short loc_7DD99
		jmp	loc_7DE26
; ���������������������������������������������������������������������������

loc_7DD99:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A7Aj
		mov	ax, [bp+var_14]
		mov	[bp-20h], ax
		push	ax
		mov	ax, di
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		push	59CDh
		call	EntityTracker_ApplySelection
		add	sp, 4
		mov	ax, si
		add	ax, 14h
		push	ax
		push	[bp+var_14]
		push	di
		call	VROOMM_StubThunk_6B032
		add	sp, 6
		mov	[bp+var_28], 2D00h
		mov	eax, [bp+var_28]
		mov	[bp+var_24], eax
		jmp	short loc_7DE0E
; ���������������������������������������������������������������������������

loc_7DDDE:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+B0Aj
		call	CombatTarget_WeaponActionSubsystem
		mov	ah, 0
		or	ax, ax
		jz	short loc_7DE26
		call	UIScreen_ApplyFormFields_500F6
		mov	eax, dword_70458
		sub	[bp+var_24], eax
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_7DE26
		cmp	byte_6E345, 0
		jnz	short loc_7DE26
		cmp	byte_706AF, 0
		jnz	short loc_7DE26

loc_7DE0E:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+AC2j
		cmp	[bp+var_24], 0
		jl	short loc_7DE1A
		mov	ax, 1
		jmp	short loc_7DE1C
; ���������������������������������������������������������������������������

loc_7DE1A:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+AF9j
		xor	ax, ax

loc_7DE1C:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+AFEj
		or	al, al
		jz	short loc_7DE26
		cmp	[bp+var_14], 0
		jnz	short loc_7DDDE

loc_7DE26:				; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+A53j
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+A5Dj ...
		mov	al, [bp+var_6]
		mov	[bp+var_1D], al
		lea	ax, [bp+var_16]
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	2
		lea	ax, [bp+var_10]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4
		mov	al, [bp+var_1D]
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadAndBuildWidgetTree_7D31A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère (thunk voisin, CRT_FreeNear_Wrap).
; ==============================================================================================
MissionRecord_ReleaseEntryC_7DE55	proc far		; CODE XREF: VROOMM_StubThunk_6ADF0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7DE80
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_7DE7E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_7DE80
; ���������������������������������������������������������������������������

loc_7DE7E:				; CODE XREF: MissionRecord_ReleaseEntryC_7DE55+1Ej
		jmp	short $+2

loc_7DE80:				; CODE XREF: MissionRecord_ReleaseEntryC_7DE55+Dj
					; MissionRecord_ReleaseEntryC_7DE55+27j
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_ReleaseEntryC_7DE55	endp

ovr240		ends
