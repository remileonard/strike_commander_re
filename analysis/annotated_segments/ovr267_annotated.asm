ovr267		segment	para public 'OVERLAY' use16
		assume cs:ovr267
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 1390 lignes, NON DÉTAILLÉE — combine Cockpit_PanAzimuthUpdate, EMS_MapPage (accès
; mémoire étendue, seg127), UI_ApplyEncodingHelper_5E576, Path_ResolveDataFile, StreamReader —
; chargement et initialisation complète du cockpit avec accès à la mémoire paginée. Candidat
; prioritaire pour session dédiée.
; ==============================================================================================
Cockpit_LoadAndInitFull_90D20	proc far		; CODE XREF: VROOMM_StubThunk_6B7F0J

var_14E		= word ptr -14Eh
var_106		= word ptr -106h
var_F1		= dword	ptr -0F1h
var_ED		= dword	ptr -0EDh
var_E8		= word ptr -0E8h
var_E0		= word ptr -0E0h
var_D1		= word ptr -0D1h
var_B7		= byte ptr -0B7h
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_89		= byte ptr -89h
var_88		= dword	ptr -88h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword	ptr -80h
var_7C		= word ptr -7Ch
var_79		= byte ptr -79h
var_78		= dword	ptr -78h
var_74		= word ptr -74h
var_71		= byte ptr -71h
var_70		= dword	ptr -70h
var_6C		= word ptr -6Ch
var_69		= byte ptr -69h
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_61		= byte ptr -61h
var_60		= dword	ptr -60h
var_5C		= word ptr -5Ch
var_59		= byte ptr -59h
var_58		= dword	ptr -58h
var_54		= word ptr -54h
var_51		= byte ptr -51h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_39		= byte ptr -39h
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		cmp	byte_721F0, 2
		jnz	short loc_90D4F
		mov	ax, 1
		jmp	short loc_90D51
; ���������������������������������������������������������������������������

loc_90D4F:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+28j
		xor	ax, ax

loc_90D51:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+2Dj
		or	ax, ax
		jz	short loc_90D7B
		cmp	byte_721F0, 2
		jnz	short loc_90D6B
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_90D6B:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+3Aj
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h

loc_90D79:
		jmp	short loc_90D8A
; ���������������������������������������������������������������������������

loc_90D7B:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+33j
		push	5196h
		push	word_70E62
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_90D8A:				; CODE XREF: Cockpit_LoadAndInitFull_90D20:loc_90D79j
		mov	[bp+var_6], 0
		jmp	loc_91A2A
; ���������������������������������������������������������������������������

loc_90D92:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+D10j
		push	ds
		push	offset a_shp_5	; ".shp"
		push	ds
		push	offset aMainopt	; "mainopt"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_E8]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_14E], 2C8h
		mov	[bp+var_ED], 100h
		mov	[bp+var_F1], 0
		mov	[bp+var_14E], 138Ah
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		mov	bx, [bp+var_14E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_12]
		mov	[si+6],	eax
		push	large 0FFFFFFFFh
		push	large [bp+var_E]
		push	0
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_14E]

loc_90E74:
		push	ax

loc_90E75:
		call	StreamReader_ReleaseBuffer_65643

loc_90E7A:
		add	sp, 4
		mov	[bp+var_7], 0

loc_90E81:
		mov	byte ptr [si+50h], 1

loc_90E85:
		push	large [dword_724CD]
		push	0
		call	VROOMM_StubThunk_6C767
		add	sp, 6
		mov	word ptr [bp+var_E+2], 0
		mov	word ptr [bp+var_E], 0
		mov	word ptr [bp+var_12+2],	0
		mov	word ptr [bp+var_12], 0
		mov	word ptr [bp+var_16+2],	0
		mov	word ptr [bp+var_16], 0
		mov	[bp+var_18], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_20], 0
		mov	[bp+var_22], 0
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_D1], 0
		jnz	short loc_90EF4
		mov	[bp+var_B7], 0
		jmp	short $+2

loc_90EF4:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+1CBj
		push	0
		mov	[bp+var_24], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_90F0A
		jmp	loc_90F91
; ���������������������������������������������������������������������������

loc_90F0A:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+1E5j
		push	large 0B0042h
		push	large 3D0024h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	al, [bx+4]
		mov	[bp+var_29], al
		mov	eax, [bp+var_28]
		mov	[di+1Eh], eax
		mov	al, [bp+var_29]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax

loc_90F6E:
		mov	word ptr [di+28h], 2

loc_90F73:
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_12+2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 3
		mov	ax, di
		jmp	short loc_90F93
; ���������������������������������������������������������������������������

loc_90F91:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+1E7j
		mov	ax, di

loc_90F93:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+26Fj
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_2C], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_90FB7
		jmp	loc_9103E
; ���������������������������������������������������������������������������

loc_90FB7:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+292j
		push	large 0B0042h
		push	large 3D006Ah
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	al, [bx+4]
		mov	[bp+var_31], al
		mov	eax, [bp+var_30]
		mov	[di+1Eh], eax
		mov	al, [bp+var_31]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 8
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_12]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 9
		mov	ax, di
		jmp	short loc_91040
; ���������������������������������������������������������������������������

loc_9103E:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+294j
		mov	ax, di

loc_91040:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+31Cj
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_34], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_91064
		jmp	loc_910EB
; ���������������������������������������������������������������������������

loc_91064:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+33Fj
		push	large 0B0042h
		push	large 4A0024h
		push	ax

loc_91071:
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_38], eax
		mov	al, [bx+4]
		mov	[bp+var_39], al
		mov	eax, [bp+var_38]
		mov	[di+1Eh], eax
		mov	al, [bp+var_39]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_16+2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 5
		mov	ax, di
		jmp	short loc_910ED
; ���������������������������������������������������������������������������

loc_910EB:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+341j
		mov	ax, di

loc_910ED:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+3C9j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_3C], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_91111
		jmp	loc_91198
; ���������������������������������������������������������������������������

loc_91111:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+3ECj
		push	large 0B0042h
		push	large 4A006Ah
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_3C]
		mov	eax, [bx]
		mov	[bp+var_40], eax
		mov	al, [bx+4]
		mov	[bp+var_41], al
		mov	eax, [bp+var_40]
		mov	[di+1Eh], eax
		mov	al, [bp+var_41]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]

loc_91171:
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ah
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_16]

loc_91182:
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 0Bh
		mov	ax, di
		jmp	short loc_9119A
; ���������������������������������������������������������������������������

loc_91198:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+3EEj
		mov	ax, di

loc_9119A:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+476j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_44], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_911BE
		jmp	loc_91245
; ���������������������������������������������������������������������������

loc_911BE:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+499j
		push	large 0B0042h
		push	large 570024h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0

loc_911E0:
		mov	byte ptr [di+22h], 2

loc_911E4:
		mov	byte ptr [di+23h], 0

loc_911E8:
		mov	dword ptr [di+24h], 0

loc_911F0:
		mov	bx, [bp+var_44]

loc_911F3:
		mov	eax, [bx]

loc_911F6:
		mov	[bp+var_48], eax
		mov	al, [bx+4]
		mov	[bp+var_49], al
		mov	eax, [bp+var_48]
		mov	[di+1Eh], eax
		mov	al, [bp+var_49]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 6
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_18]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 7
		mov	ax, di
		jmp	short loc_91247
; ���������������������������������������������������������������������������

loc_91245:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+49Bj
		mov	ax, di

loc_91247:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+523j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_4C], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9126B
		jmp	loc_912F2
; ���������������������������������������������������������������������������

loc_9126B:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+546j
		push	large 0B0042h

loc_91271:
		push	large 57006Ah
		push	ax

loc_91278:
		call	VROOMM_StubThunk_6C76C

loc_9127D:
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_4C]
		mov	eax, [bx]
		mov	[bp+var_50], eax
		mov	al, [bx+4]
		mov	[bp+var_51], al
		mov	eax, [bp+var_50]
		mov	[di+1Eh], eax
		mov	al, [bp+var_51]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ch
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_1A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1

loc_912E4:
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 0Dh

loc_912EE:
		mov	ax, di
		jmp	short loc_912F4
; ���������������������������������������������������������������������������

loc_912F2:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+548j
		mov	ax, di

loc_912F4:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+5D0j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_54], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_91318
		jmp	loc_9139F
; ���������������������������������������������������������������������������

loc_91318:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+5F3j
		push	large 0B0042h
		push	large 3D00D3h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_54]
		mov	eax, [bx]

loc_91350:
		mov	[bp+var_58], eax

loc_91354:
		mov	al, [bx+4]
		mov	[bp+var_59], al

loc_9135A:
		mov	eax, [bp+var_58]

loc_9135E:
		mov	[di+1Eh], eax

loc_91362:
		mov	al, [bp+var_59]

loc_91365:
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Eh
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_1E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 0Fh
		mov	ax, di
		jmp	short loc_913A1
; ���������������������������������������������������������������������������

loc_9139F:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+5F5j
		mov	ax, di

loc_913A1:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+67Dj
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_5C], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_913C5
		jmp	loc_9144C
; ���������������������������������������������������������������������������

loc_913C5:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+6A0j
		push	large 0B0042h
		push	large 4A00D3h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h

loc_913DF:
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2

loc_913EB:
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx]
		mov	[bp+var_60], eax
		mov	al, [bx+4]
		mov	[bp+var_61], al
		mov	eax, [bp+var_60]
		mov	[di+1Eh], eax
		mov	al, [bp+var_61]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 10h
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_20]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 11h
		mov	ax, di
		jmp	short loc_9144E
; ���������������������������������������������������������������������������

loc_9144C:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+6A2j
		mov	ax, di

loc_9144E:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+72Aj
		push	ax
		lea	ax, [bp+var_106]
		push	ax

loc_91454:
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0

loc_9145E:
		mov	[bp+var_64], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_91472
		jmp	loc_914F9
; ���������������������������������������������������������������������������

loc_91472:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+74Dj
		push	large 0B0042h
		push	large 5700D3h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_64]
		mov	eax, [bx]
		mov	[bp+var_68], eax
		mov	al, [bx+4]
		mov	[bp+var_69], al
		mov	eax, [bp+var_68]
		mov	[di+1Eh], eax
		mov	al, [bp+var_69]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 12h
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_22]
		mov	[di+2Ah], ax

loc_914E6:
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 13h
		mov	ax, di
		jmp	short loc_914FB
; ���������������������������������������������������������������������������

loc_914F9:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+74Fj
		mov	ax, di

loc_914FB:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+7D7j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_6C], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9151F
		jmp	loc_915A6
; ���������������������������������������������������������������������������

loc_9151F:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+7FAj
		push	large 0B003Bh
		push	large 720049h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0

loc_91551:
		mov	bx, [bp+var_6C]
		mov	eax, [bx]
		mov	[bp+var_70], eax

loc_9155B:
		mov	al, [bx+4]
		mov	[bp+var_71], al
		mov	eax, [bp+var_70]
		mov	[di+1Eh], eax
		mov	al, [bp+var_71]
		mov	[di+22h], al

loc_9156F:
		mov	byte ptr [di+23h], 0

loc_91573:
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 16h
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 17h
		mov	ax, di
		jmp	short loc_915A8
; ���������������������������������������������������������������������������

loc_915A6:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+7FCj
		mov	ax, di

loc_915A8:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+884j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_74], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_915CC
		jmp	loc_91653
; ���������������������������������������������������������������������������

loc_915CC:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+8A7j
		push	large 0B0030h
		push	large 720012h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah

loc_915E1:
		mov	word ptr [di+0Eh], 12E2h

loc_915E6:
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2

loc_915F2:
		mov	byte ptr [di+23h], 0

loc_915F6:
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_74]
		mov	eax, [bx]
		mov	[bp+var_78], eax
		mov	al, [bx+4]
		mov	[bp+var_79], al
		mov	eax, [bp+var_78]
		mov	[di+1Eh], eax
		mov	al, [bp+var_79]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 14h
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_E+2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 15h
		mov	ax, di
		jmp	short loc_91655
; ���������������������������������������������������������������������������

loc_91653:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+8A9j
		mov	ax, di

loc_91655:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+931j
		push	ax
		lea	ax, [bp+var_106]

loc_9165A:
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	[bp+var_7C], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_91679
		jmp	loc_91702
; ���������������������������������������������������������������������������

loc_91679:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+954j
		push	large 0B0031h

loc_9167F:
		push	large 72008Bh
		push	ax

loc_91686:
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_7C]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	al, [bx+4]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[di+1Eh], eax
		mov	al, [bp+var_81]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax

loc_916DF:
		mov	word ptr [di+28h], 18h

loc_916E4:
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_6]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 19h
		mov	ax, di
		jmp	short loc_91704
; ���������������������������������������������������������������������������

loc_91702:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+956j
		mov	ax, di

loc_91704:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+9E0j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_E0]
		push	1
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		push	0
		mov	[bp+var_84], si
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9173C
		jmp	loc_917C8
; ���������������������������������������������������������������������������

loc_9173C:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+A17j
		push	large 0B0042h
		push	large 7200D3h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah

loc_91751:
		mov	word ptr [di+0Eh], 12E2h

loc_91756:
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2

loc_91762:
		mov	byte ptr [di+23h], 0

loc_91766:
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_84]
		mov	eax, [bx]

loc_91775:
		mov	[bp+var_88], eax

loc_9177A:
		mov	al, [bx+4]
		mov	[bp+var_89], al

loc_91781:
		mov	eax, [bp+var_88]
		mov	[di+1Eh], eax
		mov	al, [bp+var_89]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 1Ah
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_1C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 1Bh
		mov	ax, di
		jmp	short loc_917CA
; ���������������������������������������������������������������������������

loc_917C8:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+A19j
		mov	ax, di

loc_917CA:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+AA6j
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		call	Input_GetCalibratedXValue_67481
		mov	[bp+var_8C], ax

loc_917E1:
		call	Input_GetCalibratedYValue_67499
		mov	[bp+var_8E], ax
		mov	ax, [bp+var_8C]
		mov	[bp+var_90], ax
		mov	ax, [bp+var_8E]
		mov	[bp+var_92], ax
		mov	ax, [bp+var_90]
		sar	ax, 1
		mov	[bp+var_94], ax
		mov	word_711C6, ax
		mov	ax, [bp+var_92]
		mov	word_711C8, ax
		mov	ax, word_711C6
		mov	[bp+var_96], ax
		mov	ax, word_711C8
		mov	[bp+var_98], ax
		mov	ax, [bp+var_96]
		mov	word_72EB0, ax
		mov	ax, [bp+var_98]
		mov	word_72EB2, ax
		push	1
		push	large 10000h
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	si
		call	VROOMM_StubThunk_6B785

loc_91851:
		add	sp, 0Ch

loc_91854:
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C996
		pop	cx
		jmp	loc_918EA
; ���������������������������������������������������������������������������

loc_91862:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+BD0j
		push	0
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_91871:
		cmp	[bp+var_1A], 0
		jnz	short loc_918A7
		cmp	word ptr [bp+var_12+2],	0
		jnz	short loc_918A7

loc_9187D:
		cmp	word ptr [bp+var_16+2],	0
		jnz	short loc_918A7

loc_91883:
		cmp	[bp+var_18], 0
		jnz	short loc_918A7
		cmp	word ptr [bp+var_16], 0
		jnz	short loc_918A7
		cmp	word ptr [bp+var_12], 0
		jnz	short loc_918A7
		cmp	[bp+var_1C], 0
		jnz	short loc_918A7
		cmp	word ptr [bp+var_E+2], 0
		jnz	short loc_918A7
		cmp	word ptr [bp+var_E], 0
		jz	short loc_918B0

loc_918A7:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+B55j
					; Cockpit_LoadAndInitFull_90D20+B5Bj ...
		mov	[bp+var_6], 1
		mov	[bp+var_7], 1

loc_918B0:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+B85j
		cmp	[bp+var_22], 0
		jz	short loc_918C4
		push	si
		nop
		push	cs
		call	near ptr Cockpit_Helper_91AA6
		pop	cx
		mov	[bp+var_22], 0
		jmp	short loc_918EA
; ���������������������������������������������������������������������������

loc_918C4:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+B94j
		cmp	[bp+var_20], 0
		jz	short loc_918D8
		push	si
		nop
		push	cs
		call	near ptr Cockpit_Helper2_91AE9
		pop	cx
		mov	[bp+var_20], 0
		jmp	short loc_918EA
; ���������������������������������������������������������������������������

loc_918D8:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+BA8j
		cmp	[bp+var_1E], 0
		jz	short loc_918EA
		push	si
		nop
		push	cs

loc_918E1:
		call	near ptr Cockpit_Helper3_91B2C
		pop	cx
		mov	[bp+var_1E], 0

loc_918EA:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+B3Fj
					; Cockpit_LoadAndInitFull_90D20+BA2j ...
		cmp	[bp+var_6], 0
		jnz	short loc_918F3
		jmp	loc_91862
; ���������������������������������������������������������������������������

loc_918F3:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+BCEj
		cmp	[bp+var_1A], 0
		jz	short loc_91905
		push	si
		call	VROOMM_StubThunk_6B87A
		pop	cx
		mov	[bp+var_1A], 0

loc_91905:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+BD7j
		cmp	word ptr [bp+var_12+2],	0
		jz	short loc_91917
		push	si
		call	VROOMM_StubThunk_6B83A
		pop	cx
		mov	word ptr [bp+var_12+2],	0

loc_91917:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+BE9j
		cmp	word ptr [bp+var_12], 0
		jz	short loc_91929
		push	si
		call	VROOMM_StubThunk_6B7B2
		pop	cx
		mov	word ptr [bp+var_12], 0

loc_91929:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+BFBj
		cmp	word ptr [bp+var_16+2],	0
		jz	short loc_9193B
		push	si
		call	VROOMM_StubThunk_6B87F
		pop	cx
		mov	word ptr [bp+var_16+2],	0

loc_9193B:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+C0Dj
		cmp	word ptr [bp+var_16], 0
		jz	short loc_9194D
		push	si
		call	VROOMM_StubThunk_6B870
		pop	cx
		mov	word ptr [bp+var_16], 0

loc_9194D:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+C1Fj
		cmp	[bp+var_18], 0

loc_91951:
		jz	short loc_9195F
		push	si
		call	VROOMM_StubThunk_6B875
		pop	cx
		mov	[bp+var_18], 0

loc_9195F:				; CODE XREF: Cockpit_LoadAndInitFull_90D20:loc_91951j
		cmp	[bp+var_1C], 0
		jz	short loc_9197E
		push	0
		push	si
		call	VROOMM_StubThunk_6B83F
		add	sp, 4
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	[bp+var_1C], 0
		mov	[bp+var_7], 0

loc_9197E:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+C43j
		cmp	word ptr [bp+var_E+2], 0

loc_91982:
		jz	short loc_91990
		push	si
		call	VROOMM_StubThunk_6B78F
		pop	cx
		mov	word ptr [bp+var_E+2], 0

loc_91990:				; CODE XREF: Cockpit_LoadAndInitFull_90D20:loc_91982j
		cmp	word ptr [bp+var_E], 0
		jz	short loc_919A2
		push	si
		call	VROOMM_StubThunk_6B79E
		pop	cx
		mov	word ptr [bp+var_E], 0

loc_919A2:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+C74j
		cmp	[bp+var_6], 0
		jnz	short loc_919D2
		push	1
		push	large 10000h
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	si
		call	VROOMM_StubThunk_6B785
		add	sp, 0Ch

loc_919D2:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+C86j
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+5], 0
		jz	short loc_919FD

loc_919E3:
		cmp	dword ptr [si],	0

loc_919E7:
		jz	short loc_919FD
		push	0

loc_919EB:
		mov	al, [si+4]
		push	ax
		push	si
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_919FD:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+CC1j
					; Cockpit_LoadAndInitFull_90D20:loc_919E7j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		cmp	[bp+var_7], 0
		jz	short loc_91A1B
		mov	[bp+var_6], 0

loc_91A1B:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+CF4j
		push	2
		lea	ax, [bp+var_106]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4

loc_91A2A:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+6Fj
		cmp	[bp+var_6], 0
		jnz	short loc_91A33
		jmp	loc_90D92
; ���������������������������������������������������������������������������

loc_91A33:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+D0Ej
		push	si
		call	VROOMM_StubThunk_6B7AD
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_67F60
		push	si
		call	VROOMM_StubThunk_6B78A
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_91A52
		mov	ax, 1
		jmp	short loc_91A54
; ���������������������������������������������������������������������������

loc_91A52:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+D2Bj
		xor	ax, ax

loc_91A54:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+D30j
		or	ax, ax
		jz	short loc_91A99
		cmp	byte_721F0, 2
		jnz	short loc_91A99
		pushf
		mov	bx, 534Dh

loc_91A63:
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_A], bx
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
		cmp	[bp+var_A], 0
		jnz	short loc_91A99
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short $+2

loc_91A99:				; CODE XREF: Cockpit_LoadAndInitFull_90D20+D36j
					; Cockpit_LoadAndInitFull_90D20+D3Dj ...
		push	59CDh
		call	Kneeboard_ProcessSelected
		pop	cx
		pop	di
		pop	si
		leave
		retf
Cockpit_LoadAndInitFull_90D20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (26 lignes).
; ==============================================================================================
Cockpit_Helper_91AA6	proc far		; CODE XREF: VROOMM_StubThunk_6B7F5J Cockpit_LoadAndInitFull_90D20+B99p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+64h], 1
		mov	byte ptr [si+65h], 0
		mov	byte ptr [si+66h], 1
		mov	byte ptr [si+68h], 0
		mov	byte ptr [si+69h], 0
		mov	byte ptr [si+6Ah], 0
		mov	byte ptr [si+6Dh], 0
		mov	byte ptr [si+6Bh], 0
		mov	byte ptr [si+6Ch], 0
		mov	byte ptr [si+6Eh], 0
		mov	word ptr [si+6Fh], 0
		mov	byte ptr [si+73h], 0
		mov	byte ptr [si+74h], 1
		mov	byte ptr [si+75h], 1
		pop	si
		pop	bp
		retf
Cockpit_Helper_91AA6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (26 lignes).
; ==============================================================================================
Cockpit_Helper2_91AE9	proc far		; CODE XREF: VROOMM_StubThunk_6B7FAJ Cockpit_LoadAndInitFull_90D20+BADp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+64h], 1
		mov	byte ptr [si+65h], 1
		mov	byte ptr [si+66h], 1
		mov	byte ptr [si+68h], 0
		mov	byte ptr [si+69h], 1
		mov	byte ptr [si+6Ah], 1
		mov	byte ptr [si+6Dh], 1
		mov	byte ptr [si+6Bh], 0
		mov	byte ptr [si+6Ch], 0
		mov	byte ptr [si+6Eh], 0
		mov	word ptr [si+6Fh], 1
		mov	byte ptr [si+73h], 1
		mov	byte ptr [si+74h], 1
		mov	byte ptr [si+75h], 1
		pop	si
		pop	bp
		retf
Cockpit_Helper2_91AE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (33 lignes).
; ==============================================================================================
Cockpit_Helper3_91B2C	proc far		; CODE XREF: VROOMM_StubThunk_6B7FFJ
					; Cockpit_LoadAndInitFull_90D20:loc_918E1p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+64h], 0
		mov	byte ptr [si+65h], 1
		mov	byte ptr [si+66h], 0
		mov	byte ptr [si+68h], 1
		mov	byte ptr [si+69h], 1
		mov	byte ptr [si+6Ah], 1
		mov	byte ptr [si+6Dh], 1
		mov	byte ptr [si+6Bh], 1

loc_91B53:
		mov	byte ptr [si+6Ch], 1

loc_91B57:
		mov	byte ptr [si+6Eh], 1

loc_91B5B:
		mov	word ptr [si+6Fh], 2
		mov	byte ptr [si+73h], 1
		mov	byte ptr [si+74h], 0
		mov	byte ptr [si+75h], 0
		pop	si
		pop	bp
		retf
Cockpit_Helper3_91B2C	endp

ovr267		ends
